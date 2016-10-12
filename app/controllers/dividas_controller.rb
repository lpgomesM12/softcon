class DividasController < ApplicationController
  before_action :set_divida, only: [:show, :edit, :update, :destroy]

  include ActionView::Helpers::NumberHelper

  def busca_despesas

    if params[:data_inicio] == "" or params[:data_inicio] == nil
        @data_inicio = Date.today.at_beginning_of_month.strftime('%d/%m/%Y')
        @data_fim  = Date.today.at_end_of_month.strftime('%d/%m/%Y')
      else
       @data_inicio = params[:data_inicio]
       @data_fim = params[:data_fim]
    end


    # Date.strptime(@data_inicio, "%d/%m/%Y").strftime('%Y-%m-%d'),
    # Date.strptime(@data_fim, "%d/%m/%Y").strftime('%Y-%m-%d'),
    #  debugger

    @dividas = Divida.busca_dividas(current_user.condominio_id,
                                    params[:flag_pago],
                                    params[:flag_naopago],
                                    params[:flag_despesafixa],
                                    params[:flag_ordinaria],
                                    Date.strptime(@data_inicio, "%d/%m/%Y").strftime('%Y-%m-%d'),
                                    Date.strptime(@data_fim, "%d/%m/%Y").strftime('%Y-%m-%d'))
    # @total_divida = @dividas.to_a.sum(&:valr_divida)

    json_dividas = @dividas.map { |item| {:id => item.id,
                                          :data_vencimento => item.data_vencimento.blank? ? '' : item.data_vencimento.strftime("%d/%m/%Y"),
                                          :valr_divida => number_to_currency(item.valr_divida , unit: "R$", separator: ",", delimiter: ""),
                                          :data_pagamento => item.data_pagamento.blank? ? '' : item.data_pagamento.strftime("%d/%m/%Y"),
                                          :desc_cpfcnpj => item.prestador.desc_cpfcnpj,
                                          :total_divida => @total_divida}}
    render :json => json_dividas

  end

  def incluir_divida

    if params[:qtd_folhas] == ""
       params[:qtd_folhas] = 1
    end

    @folhas = params[:qtd_folhas]
    @data_vencimento = divida_params[:data_vencimento].to_date
    @valor_divida = divida_params[:valr_divida]

    @valor_divida = @valor_divida.gsub('R$', '')
    @valor_divida = @valor_divida.gsub('.', '')
    @valor_divida = @valor_divida.gsub(',', '.').to_f

    @valor_divida = @valor_divida/Integer(@folhas)

    # começa aqui o cadastro de despesas
    @despesa = Despesa.new(valr_despesa: divida_params[:valr_divida].to_d,
                           numr_qtdparcela: params[:qtd_folhas],
                           condominio_id: current_user.condominio_id,
                           user_inclusao: current_user.id,
                           item_id: params[:item_id],
                           subitem_id: params[:subitem_id],
                           prestador_id: divida_params[:prestador_id])
    @despesa.save
     @i = 0
     while @i < Integer(@folhas)  do

      @divida = Divida.new(divida_params)
      @divida.data_vencimento =  @data_vencimento
      @divida.valr_divida = @valor_divida
      @divida.condominio_id = current_user.condominio_id
      @divida.user_inclusao = current_user.id
      @divida.despesa_id = @despesa.id
      @divida.numr_tipodivida = 1

     @data_vencimento = @data_vencimento + 30.days

       @divida.save
       @i +=1
    end

    return busca_despesas

  end


  def alterar_divida

    @despesa = Despesa.find(params[:despesa_id])
    @despesa.item_id = params[:item_id]
    @despesa.subitem_id = params[:subitem_id]
    @despesa.prestador_id = divida_params[:prestador_id]
    @despesa.save

    @divida = Divida.find(params[:divida_id])
    @divida.update(divida_params)

    return busca_despesas

  end

  def excluir_divida
    @divida = Divida.find(params[:divida])
    if @divida.destroy
       return busca_despesas
    end
  end

  def busca_divida
    @divida = Divida.find(params[:divida_id])

    json_divida =  {:id => @divida.id,
                    :despesa_id => @divida.despesa_id,
                    :numr_notafiscal => @divida.numr_notafiscal,
                    :numr_cheque => @divida.numr_cheque,
                    :nome_prestador => @divida.prestador.nome_prestador,
                    :prestador_id => @divida.prestador_id,
                    :nome_banco => @divida.contabank.nome_banco,
                    :contabank_id => @divida.contabank.id,
                    :item => @divida.despesa.item.id,
                    :subitem => @divida.despesa.subitem.id,
                    :flag_despesafixa => @divida.flag_despesafixa,
                    :flag_ordinaria => @divida.flag_ordinaria,
                    :numg_tipopagamento => @divida.numg_tipopagamento,
                    :valr_divida => number_to_currency(@divida.valr_divida , unit: "", separator: ",", delimiter: ""),
                    :data_vencimento => @divida.data_vencimento.blank? ? '' : @divida.data_vencimento.strftime("%d/%m/%Y"),
                    :flag_pago => @divida.flag_pago,
                    :data_pagamento => @divida.data_pagamento.blank? ? '' : @divida.data_pagamento.strftime("%d/%m/%Y")}
      render :json => json_divida
  end

  # GET /dividas
  # GET /dividas.json
  def index

    if params[:data_inicio] == "" or params[:data_inicio] == nil
        @data_inicio = Date.today.at_beginning_of_month.strftime('%d/%m/%Y')
        @data_fim  = Date.today.at_end_of_month.strftime('%d/%m/%Y')
      else
       @data_inicio = params[:data_inicio]
       @data_fim = params[:data_fim]
    end

  end

  # GET /dividas/1
  # GET /dividas/1.json
  def show
  end

  # GET /dividas/new
  def new
    @divida = Divida.new
  end

  # GET /dividas/1/edit
  def edit
  end

  # POST /dividas
  # POST /dividas.json
  def create
    @divida = Divida.new(divida_params)

    respond_to do |format|
      if @divida.save
        format.html { redirect_to @divida, notice: 'Divida was successfully created.' }
        format.json { render :show, status: :created, location: @divida }
      else
        format.html { render :new }
        format.json { render json: @divida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dividas/1
  # PATCH/PUT /dividas/1.json
  def update
    respond_to do |format|
      if @divida.update(divida_params)
        format.html { redirect_to @divida, notice: 'Divida was successfully updated.' }
        format.json { render :show, status: :ok, location: @divida }
      else
        format.html { render :edit }
        format.json { render json: @divida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dividas/1
  # DELETE /dividas/1.json
  def destroy
    @divida.destroy
    respond_to do |format|
      format.html { redirect_to dividas_url, notice: 'Divida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_divida
      @divida = Divida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def divida_params
      params.require(:divida).permit(:numr_tipodivida, :numr_cheque, :data_vencimento, :valr_divida, :desc_observacao, :numg_tipopagamento, :data_cadastro, :desc_docprincipal, :data_cancelamento, :data_pagamento, :valr_pagamento, :valr_multa, :valr_juro, :numr_notafiscal, :numr_parcela, :desc_caminhocheque, :flag_ordinaria, :flag_despesafixa, :condominio_id, :contabank_id, :prestador_id, :user_inclusao, :despesa_id, :user_exclusao, flag_pago)
    end
end

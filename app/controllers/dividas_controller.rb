class DividasController < ApplicationController
  before_action :set_divida, only: [:show, :edit, :update, :destroy]

  include ActionView::Helpers::NumberHelper

  def busca_despesas

    @despesas = Divida.where(condominio_id: current_user.condominio_id)
    json_pessoa = @despesas.map { |item| {:id => item.id,
                                          :data_vencimento => item.data_vencimento.blank? ? '' : item.data_vencimento.strftime("%d/%m/%Y"),
                                          :valr_divida => number_to_currency(item.valr_divida , unit: "R$ ", separator: ",", delimiter: ""),
                                          :data_pagamento => item.data_pagamento.blank? ? '' : item.data_pagamento.strftime("%d/%m/%Y"),
                                          :desc_cpfcnpj => item.prestador.desc_cpfcnpj}}
    render :json => json_pessoa

  end

  def incluir_divida
    @folhas = params[:qtd_folhas]
    @data_vencimento = params[:data_vencimento].to_date
    @valor_divida = params[:valr_divida].to_f
    @valor_divida = @valor_divida/Integer(@folhas)

    #debugger
    # começa aqui o cadastro de despesas
    @despesa = Despesa.new(valr_despesa: params[:valr_divida].to_f,
                           numr_qtdparcela: params[:qtd_folhas],
                           condominio_id: current_user.condominio_id,
                           prestador_id: params[:prestador_id],
                           user_inclusao: current_user.id,
                           item_id: params[:item_id],
                           subitem_id: params[:subitem_id],
                           prestador_id: params[:prestador_id])
   @despesa.save

     @i = 0
     while @i < Integer(@folhas)  do
     @divida = Divida.new( numr_tipodivida: params[:numr_tipodivida],
                               numr_cheque: params[:numr_cheque],
                               data_vencimento: @data_vencimento,
                               valr_divida: @valor_divida,
                               contabank_id: params[:contabank_id],
                               condominio_id: current_user.condominio_id,
                               user_inclusao: current_user.id,
                               flag_ordinaria: params[:flag_ordinaria],
                               flag_despesafixa: params[:flag_despesafixa],
                               numr_notafiscal: params[:numr_notafiscal],
                               prestador_id: params[:prestador_id])

       @data_vencimento = @data_vencimento + 30.days

       @divida.save
       @i +=1
    end

    return busca_despesas

  end


  def excluir_divida

    @divida = Divida.find(params[:id])

    if @divida.destroy
       return busca_despesas
    end

  end

  # GET /dividas
  # GET /dividas.json
  def index
    @dividas = Divida.all
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
      params.require(:divida).permit(:numr_tipodivida, :numr_cheque, :data_vencimento, :valr_divida, :desc_observacao, :numg_tipopagamento, :data_cadastro, :desc_docprincipal, :data_cancelamento, :data_pagamento, :valr_pagamento, :valr_multa, :valr_juro, :numr_notafiscal, :numr_parcela, :desc_caminhocheque, :flag_ordinaria, :flag_despesafixa, :condominio_id, :contabank_id, :prestador_id, :user_inclusao, :user_exclusao)
    end
end

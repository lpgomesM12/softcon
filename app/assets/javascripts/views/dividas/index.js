// var App = {};
//
//  App.dividas = {
//   index: function(){
//
//     //Função chama modal exclusão
//      function chamaModal(id) {
//         $('#myModalExcluir').modal('show');
//         $('#divida').val(id);
//       };
//
//       function Salva(){
//           $.ajax({
//             url: '/incluirDivida',
//             data : {
//               numr_tipodivida: $('#numr_tipodivida').val(),
//               numr_cheque: $('#numr_cheque').val(),
//               valr_divida: $('#valr_divida').val(),
//               data_vencimento: $('#data_vencimento').val(),
//               qtd_folhas:  $('#qtd_folhas').val(),
//               prestador_id: $('#prestador_id').val(),
//               item_id: $('#item_id').val(),
//               subitem_id: $('#subitem_id').val(),
//               flag_ordinaria: $('#flag_ordinaria').is(':checked'),
//               flag_despesafixa: $('#flag_despesafixa').is(':checked'),
//               contabank_id: $('#contabank_id').val()
//             },
//             success: function(data){
//                 monta_lista_divia(data);
//             }
//           })
//         };
//
//        function buscaDespesas(){
//           $.ajax({
//             url: '/buscaDespesas',
//             data : {},
//             success: function(data){
//               monta_lista_divia(data);
//             }
//           })
//        };
//
//        function excluirDivida(){
//           $.ajax({
//             url: '/excluirdivida',
//             data : {
//               divida: $('#divida').val()
//             },
//             success: function(data){
//               monta_lista_divia(data);
//             }
//           })
//        };
//
//        function chama_editar(id){
//
//        };
//
//        function monta_lista_divia(data){
//         var html = "";
//         $("#tborcamento").empty();
//          for (var i in data) {
//            var item = data[i];
//            html += "<tr><td>"+item.data_vencimento+"</td>";
//            html += "<td>"+item.valr_divida+"</td>";
//            html += "<td>"+item.desc_cpfcnpj+"</td>";
//            html += "<td>"+item.data_pagamento+"</td>";
//            html += "<td Align='center'>";
//            html += " <button type='button' onclick='chama_editar("+item.id+")' data-toggle='tooltip' title='Editar' class='btn btn-primary btn-xs' aria-label='Left Align'>";
//            html += "  <span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>";
//            html += " <button type='button' onclick='chamaModal("+item.id+")' data-toggle='tooltip' title='Excluir' class='btn btn-danger btn-xs' aria-label='Left Align'>";
//            html += "  <span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button></tr>";
//          };
//           $("#tborcamento").append(html);
//        };
//
//       $(document).ready(function() {
//              $('#nome_prestador').autocomplete({
//              source: '/buscaprestador',
//              dataType: 'json',
//              minLength: 0,
//              change: function(event, ui) {
//              if (!ui.item) {
//                $('#nome_prestador').val('');
//              }
//           },
//           select: function(event, ui) {
//               if (ui.item) {
//                     $("#prestador_id").val(ui.item.id);
//                  }
//                }
//            });
//         });
//
//         function seta_tipodivida(id){
//           $('#numr_tipodivida').val(id);
//         };
//
//       //Adicionando mascara data_vencimento
//       jQuery(function($){
//           $("#data_vencimento").mask("99/99/9999");
//       });
//
//         $(function() {
//          $("#valr_divida").maskMoney({showSymbol:true, symbol:"R$", decimal:",", thousands:"."});
//        })
//
//       buscaDespesas();
//
//   }
// };

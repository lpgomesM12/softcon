angular.module('geral', [])
 .controller('turnoCtrl', function($scope,servicoGeral) {

$scope.selected = [];
$scope.msgEnvio = false;

  $scope.listaGrupos = function(){
      servicoGeral.buscaGrupos()
          .then(function(dados){

            $scope.grupos = dados;

             for (x in $scope.grupos) {
                 x.check = true;
                 x.check = true;
                }

          }).catch(function(erro){
             console.log(erro);
          });
  };

$scope.setaTurno = function(id) {
 $scope.turno = id;
};

$scope.toggle = function (item, list) {
    var idx = list.indexOf(item);
    if (idx > -1) {
      list.splice(idx, 1);
    }
    else {
      list.push(item);
    }
  };

$scope.exists = function (item, list) {
    return list.indexOf(item) > -1;
  };

$scope.enviarEmail = function () {
  servicoGeral.enviarEmail($scope.turno,$scope.selected)
      .then(function(dados){
        $scope.msgEnvio = true;
      }).catch(function(erro){
         console.log(erro);
      });
};

$scope.listaGrupos();

});

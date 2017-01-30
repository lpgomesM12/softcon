angular.module('geral')
.factory('servicoGeral',function($http,$q){
 var service = {};

  service.buscaGrupos = function(){
          return $q(function(resolve,reject) {
          //$http.get('http://138.68.62.151/listarCidade?id='+estado)
          $http.get('http://localhost:3000/grupopermissaos.json')
          .success(function(grupos) {
            resolve(grupos);
          })
          .error(function(erro){
            reject({erro});
          });
        });
    };

    service.enviarEmail = function(turno,grupos){
            return $q(function(resolve,reject) {
            //$http.get('http://138.68.62.151/listarCidade?id='+estado)
            $http.get('http://localhost:3000/enviaremail?turno='+turno+'&grupos='+grupos.toString())
            .success(function(dados) {
              resolve(dados);
            })
            .error(function(erro){
              reject({erro});
            });
          });
      };

 return service;
});

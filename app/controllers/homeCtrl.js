angular.module(module).controller('homeCtrl', function ($rootScope, $scope, authenticationAPI, genericAPI, $location, SweetAlert, $uibModal, $timeout) {
    //Verifica Sessao e permissão de acesso
    // if (!$rootScope.usuario) { $location.path("/login"); return false; }

    $scope.title = 'Fermen.to Aierlines <i class="fa fa-plane"></i>';

    $scope.destinos = [
        { id: 1, nome: "Manaus", brev: "MAO" },
        { id: 2, nome: "Rio de Janeiro", brev: "RJ" },
        { id: 3, nome: "São Paulo", brev: "SP" },
        { id: 4, nome: "Recife", brev: "REC" }
    ];

    console.log($scope.destinos);
    
});
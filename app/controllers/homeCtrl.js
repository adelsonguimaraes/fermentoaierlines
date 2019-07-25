angular.module(module).controller('homeCtrl', function ($rootScope, $scope, authenticationAPI, genericAPI, $location, SweetAlert, $uibModal, $timeout) {
    //Verifica Sessao e permissão de acesso
    // if (!$rootScope.usuario) { $location.path("/login"); return false; }

    $scope.title = 'Fermen.to Aierlines <i class="fa fa-plane"></i>';

    $scope.obj = {
        origem: 0,
        destino: 0,
        modalidade: "IDAVOLTA"
    }

    $scope.modalidades = [
        { id: "IDAVOLTA", descricao: "Ida e Volta" },
        { id: "SOIDA", descricao: "Só Ida"}
    ]

    $scope.destinos = [];

    $scope.listarDestinos = function () {
        
        // verificando se o filtro está preenchido
        var data = { "metodo": "listar", "data": '', "class": "destino", request: 'GET' };

        $rootScope.loadon();

        genericAPI.generic(data)
            .then(function successCallback(response) {
                //se o sucesso === true
                if (response.data.success == true) {
                    $scope.destinos = response.data.data;
                    $scope.destinos.unshift({ id: 0, nome: 'Selecione uma opção' });
                    $rootScope.loadoff();
                } else {
                    SweetAlert.swal({ html: true, title: "Atenção", text: response.data.msg, type: "error" });
                }
            }, function errorCallback(response) {
                //error
            });
    }
    $scope.listarDestinos();

    $scope.destino = '';
    $scope.origem = '';
    // $scope.voosida = [];
    // $scope.voosvolta = [];
    $scope.buscar = function (obj) {
        $scope.origem = getDestino(obj.origem);
        $scope.destino = getDestino(obj.destino)

        //tratamentos
        if (obj.origem === 0) return SweetAlert.swal({ html: true, title: "Atenção", text: "Selecione uma origem!", type: "error" });
        if (obj.destino === 0) return SweetAlert.swal({ html: true, title: "Atenção", text: "Selecione um destino!", type: "error" });

        // verificando se o filtro está preenchido
        var data = { "metodo": "listarPorCriterios", "data": obj, "class": "viagem", request: 'GET' };

        $rootScope.loadon();

        genericAPI.generic(data)
            .then(function successCallback(response) {
                //se o sucesso === true
                if (response.data.success == true) {
                    $scope.voosida = response.data.data.voosida;
                    if ($scope.obj.modalidade === "IDAVOLTA") {
                        $scope.voosvolta = response.data.data.voosvolta;
                    }else{
                        delete ($scope.voosvolta)
                    }
                    $rootScope.loadoff();
                } else {
                    SweetAlert.swal({ html: true, title: "Atenção", text: response.data.msg, type: "error" });
                }
            }, function errorCallback(response) {
                //error
            });
    }

    function getDestino (id) {
        for (var i of $scope.destinos) {
            if (i.id === id) return i;
        }
    }
    
});
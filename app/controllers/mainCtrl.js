angular.module(module).controller('mainCtrl', function ($rootScope, $scope, genericAPI, $location, $uibModal, $timeout) {
    $rootScope.api = api;
    
    $rootScope.loading = 'none';
    $scope.title = 'Fermen.to';

    $rootScope.loadon = function () {
        var load = document.getElementById('loading');
        load.style.display = 'block';
    }
    $rootScope.loadoff = function () {
        var load = document.getElementById('loading');
        load.style.display = 'none';
    }
    
});
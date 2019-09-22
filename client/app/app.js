'use strict';

// Declare app level module which depends on views, and core components
angular.module('myApp', [
    'ngRoute',
    'myApp.menu',
    'myApp.allProducts',
    'myApp.productsInCategory',
    'myApp.product',
    'myApp.shoppingCart',
    'myApp.confirmOrder',
    'myApp.version'
])

.config(['$locationProvider', '$routeProvider', function ($locationProvider, $routeProvider) {
    $locationProvider.hashPrefix('!');

    $routeProvider.otherwise({ redirectTo: '/home' });
}])

.factory('api', [
    '$http', 
    '$q',
    function ($http, $q) {

        function getAllCategories() {
            let deffered = $q.defer();

            $http.get('http://localhost:7878/get_categories')
                .then(function (result) {
                    deffered.resolve(result.data);
                }, function (err) {
                    deffered.reject(err);
                })

            return deffered.promise;
        }

        return {
            getAllCategories
        }
    }
])

.controller('catController', [
    '$scope',
    'api',
    function($scope, api) {
        api.getAllCategories()
            .then(function(data) {
                $scope.categories = data;
            }, function(err) {
                console.log(err);
            }
        );
    }
])

.directive('menuDirective', [
    function(){
        return {
            restrict: 'A',
            templateUrl: 'menu/menu.html'
        }
    }
]);
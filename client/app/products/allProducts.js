'use strict';

angular.module('myApp.allProducts', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/home', {
    templateUrl: 'products/products.html',
    controller: 'HomeController'
  });
}])

.factory('allProductsApi', [
    '$http', 
    '$q',
    function ($http, $q) {

        function getAllProducts () {
            let deffered = $q.defer();

            $http.get('http://localhost:7878/get_all_products')
                .then(function(result) {
                    deffered.resolve(result.data);
                }, function(err) {
                    deffered.reject(err);
                });
            
            return deffered.promise;
        }

        return {
            getAllProducts
        }
    }
])

.controller('HomeController', [
    '$scope',
    'allProductsApi',
    function($scope, allProductsApi) {
        allProductsApi.getAllProducts()
            .then(function(data) {
                
                $scope.imageDir = "http://localhost:7878/public/images/";
                $scope.products = data;
            }, function (err) {
                console.log(err);
            })
    }
]);
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
    'CONFIG',
    function ($http, $q, CONFIG) {

        function getAllProducts () {
            let deffered = $q.defer();

            $http.get(CONFIG.host + '/get_all_products')
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
    'CONFIG',
    function($scope, allProductsApi, CONFIG) {
        allProductsApi.getAllProducts()
            .then(function(products) {
                $scope.productsFound = true;
                
                $scope.imageDir = CONFIG.host + "/public/images/";
                $scope.products = products;

                products.forEach(function(product) {
                    let currentPrice = +product.price;
                    product.price = currentPrice.toFixed(2);
                });
            }, function (err) {
                console.log(err);
        })
    }
]);
'use strict';

angular.module('myApp.product', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/product/:productId', {
        templateUrl: 'product/product.html',
        controller: 'ProductController'
    });
}])

.factory('productApi', [
    '$http',
    '$q',
    'CONFIG',
    function($http, $q, CONFIG) {

        function getProductDetails(productId) {
            let deffered = $q.defer();

            $http.get(CONFIG.host + '/get_product_details/' + productId)
                .then(function(result) {
                    if (result.data.found) {
                        deffered.resolve(result.data.data);
                    } else {
                        deffered.reject(result.data.message);
                    }
                }, function(err) {
                    deffered.reject(err);
                });
                
            return deffered.promise;
        }

        function addToShoppingCart(productId) {
            let deffered = $q.defer();

            $http.post(CONFIG.host + '/add_product_in_shopping_cart/' + productId)
                .then(function(result) {
                    if (result.data.productAdded) {
                        deffered.resolve(true);
                    } else {
                        deffered.reject(result.data.message);
                    }
                }, function(err) {
                    deffered.reject(err);
                }
            );

            return deffered.promise;
        }

        return {
            getProductDetails,
            addToShoppingCart
        }
    }
])

.controller('ProductController', [
    '$scope',
    '$routeParams',
    '$timeout',
    'productApi',
    'CONFIG',
    function($scope, $routeParams, $timeout, productApi, CONFIG) {

        let productId = $routeParams.productId;

        productApi.getProductDetails(productId)
            .then(function(product) {
                $scope.productFound = true;
                $scope.imageDir = CONFIG.host + "/public/images/";

                let productPrice = +product.price;
                product.price = productPrice.toFixed(2);

                $scope.product = product;
            }, function (err) {
                $scope.productFound = false;
                $scope.message = err;
            });

        $scope.addToShoppingCart = function (productId) {
            productApi.addToShoppingCart(productId)
                .then(function (result) {
                    $scope.showSuccess = true;
                    
                    $timeout(function() {
                        $scope.showSuccess = false;
                    }, 5000);
                
                }, function (err) {
                    $scope.showError = true;
                    $scope.message = err;
                    
                    $timeout(function() {
                        $scope.showError = false;
                    }, 5000);
                });
        }

    }
]);
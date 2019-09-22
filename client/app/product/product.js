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
    function($http, $q) {

        function getProductDetails(productId) {
            let deffered = $q.defer();

            $http.get('http://localhost:7878/get_product_details/' + productId)
                .then(function(result) {
                    deffered.resolve(result.data);
                }, function(err) {
                    deffered.reject(err);
                });

            return deffered.promise;
        }

        function addToShoppingCart(productId) {
            let deffered = $q.defer();

            $http.post('http://localhost:7878/add_product_in_shopping_cart/' + productId)
                .then(function(result) {
                    deffered.resolve(result.data);
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
    function($scope, $routeParams, $timeout, productApi) {

        let productId = $routeParams.productId;

        productApi.getProductDetails(productId)
            .then(function(product) {
                $scope.imageDir = "http://localhost:7878/public/images/";

                let productPrice = +product.price;
                product.price = productPrice.toFixed(2);

                $scope.product = product;
            }
        );

        $scope.addToShoppingCart = function (productId) {
            productApi.addToShoppingCart(productId)
                .then(function (result) {
                    if (result) {
                        $scope.showSuccess = true;
                        
                        $timeout(function() {
                            $scope.showSuccess = false;
                        }, 5000);
                    } else {

                    }
                }
            );
        }

    }
]);
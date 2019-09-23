'use strict';

angular.module('myApp.shoppingCart', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/shopping-cart', {
        templateUrl: 'shopping-cart/shopping-cart.html',
        controller: 'ShoppingCartController'
    });
}])


.factory('shoppingCartApi', [
    '$http',
    '$q',
    'CONFIG',
    function($http, $q, CONFIG) {

        function getShoppingCartProducts() {
            let deffered = $q.defer();

            $http.get(CONFIG.host + '/get_shopping_cart_products/')
                .then(function(result) {
                    deffered.resolve(result.data);
                }, function(err) {
                    deffered.reject(err);
                }
            );

            return deffered.promise;
        }

        function removeProductFromShoppingCart(productId) {
            let deffered = $q.defer();

            $http.post(CONFIG.host + '/remove_product_from_shopping_cart/' + productId)
                .then(function(result) {
                    if (result.data.productRemoved) {
                        deffered.resolve();
                    } else {
                        deffered.reject(result.data.message);
                    }
                }, function (err) {
                    deffered.reject(err);
                }
            );

            return deffered.promise;
        }

        function emptyShoppingCart() {
            let deffered = $q.defer();

            $http.post(CONFIG.host + '/empty_shopping_cart')
                .then(function(result) {
                    deffered.resolve(result.data);
                }, function (err) {
                    deffered.reject(err);
                }
            );

            return deffered.promise;
        }

        return {
            getShoppingCartProducts,
            removeProductFromShoppingCart,
            emptyShoppingCart
        }
    }
])

.controller('ShoppingCartController', [
    '$scope',
    'shoppingCartApi',
    'CONFIG',
    function($scope, shoppingCartApi, CONFIG) {
        function loadProducts() {      
            shoppingCartApi.getShoppingCartProducts()
                .then(function(fetchedProducts) {
                    $scope.imageDir = CONFIG.host + "/public/images/";

                    $scope.showTable = true;
                    if(fetchedProducts.length == 0) {
                        $scope.showTable = false;
                    }

                    $scope.products = fetchedProducts;

                    let totalPrice = 0;

                    fetchedProducts.forEach(product => {
                        totalPrice += +product.price;
                    });
                    
                    $scope.totalPrice = totalPrice.toFixed(2);
                }
            );
        }

        loadProducts();

        $scope.removeProductFromShoppingCart = function (productId) {
            shoppingCartApi.removeProductFromShoppingCart(productId)
                .then(function (result) {
                    loadProducts();
                }, function (err) {
                    $scope.showMessage = true;
                    $scope.message = err;
                }
            );
        }

        $scope.emptyShoppingCart = function () {
            shoppingCartApi.emptyShoppingCart()
                .then(function(response) {
                    if (response) {
                        loadProducts();
                    }
                },
            );
        }
    }
]);
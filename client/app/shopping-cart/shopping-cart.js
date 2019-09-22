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
    function($http, $q) {

        function getShoppingCartProducts() {
            let deffered = $q.defer();

            $http.get('http://localhost:7878/get_shopping_cart_products/')
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

            $http.post('http://localhost:7878/remove_product_from_shopping_cart/' + productId)
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
            removeProductFromShoppingCart
        }
    }
])

.controller('ShoppingCartController', [
    '$scope',
    'shoppingCartApi',
    function($scope, shoppingCartApi) {
        function loadProducts() {      
            shoppingCartApi.getShoppingCartProducts()
                .then(function(fetchedProducts) {
                    $scope.imageDir = "http://localhost:7878/public/images/";

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
                }
            );
        }
    }
]);
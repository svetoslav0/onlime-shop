'use strict';

angular.module('myApp.confirmOrder', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/confirm-order', {
        templateUrl: 'confirm-order/confirm-order.html',
        controller: 'ConfirmOrderController'
    });
}])


.factory('confirmOrderApi', [
    '$http',
    '$q',
    function($http, $q) {
        
    }
])

.controller('ConfirmOrderController', [
    '$scope',
    'shoppingCartApi',
    function($scope, shoppingCartApi) {
        shoppingCartApi.getShoppingCartProducts()
            .then(function(products) {
                $scope.totalPrice = 0;

                products.forEach(product => {
                    $scope.totalPrice += +product.price;
                });

                $scope.totalPrice = $scope.totalPrice.toFixed(2);
            }
        );
    }
]);
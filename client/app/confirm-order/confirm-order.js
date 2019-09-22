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

        function finishOrder(userData) {

            let deffered = $q.defer();

            $http.post('http://localhost:7878/finish_order', userData, {
                headers: {
                    'Content-Type': 'multipart/form-data; charset=utf-8; boundary=' + Math.random().toString().substr(2)
                }
            })
                .then(function (response) {
                    deffered.resolve(response.data);
                },
                function (err) {
                    deffered.reject(err);
                }
            );

            return deffered.promise;
        }

        return {
            finishOrder
        }
    }
])

.controller('ConfirmOrderController', [
    '$scope',
    '$location',
    'shoppingCartApi',
    'confirmOrderApi',
    function($scope, $location, shoppingCartApi, confirmOrderApi) {
        shoppingCartApi.getShoppingCartProducts()
            .then(function(products) {
                $scope.totalPrice = 0;

                products.forEach(product => {
                    $scope.totalPrice += +product.price;
                });

                $scope.showForm = true;
                
                if ($scope.totalPrice == 0) {
                    $scope.showForm = false;
                }

                $scope.totalPrice = $scope.totalPrice.toFixed(2);
            }
        );

        $scope.submit = function(user) {
            confirmOrderApi.finishOrder(user)
                .then(function(response) {
                    if (response){
                        $location.path('/home');
                    }
                }
            );
        }
    }
]);
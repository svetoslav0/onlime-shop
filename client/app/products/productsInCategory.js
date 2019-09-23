'use strict';

angular.module('myApp.productsInCategory', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/category/:categoryId', {
        templateUrl: 'products/products.html',
        controller: 'ProductsInCategoryController'
    });
}])


.factory('productsInCategoryApi', [
    '$http',
    '$q',
    function($http, $q) {

        function getProductsInCategory(categoryId) {
            let deffered = $q.defer();

            $http.get('http://localhost:7878/get_products_in_category/' + categoryId)
                .then(function(result) {
                    if (result.data.found) {
                        deffered.resolve(result.data.data);
                    } else {
                        deffered.reject(result.data.message);
                    }
                }, function(err) {
                    deffered.reject(err);
                })

            return deffered.promise;
        }

        return {
            getProductsInCategory
        }
    }
])

.controller('ProductsInCategoryController', [
    '$scope',
    '$routeParams',
    'productsInCategoryApi',
    function($scope, $routeParams, productsInCategoryApi) {

        let categoryId = $routeParams.categoryId;

        productsInCategoryApi.getProductsInCategory(categoryId)
            .then(function(products) {
                $scope.productsFound = true;

                products.forEach(function(product) {
                    let currentPrice = +product.price;
                    product.price = currentPrice.toFixed(2);
                });

                $scope.imageDir = "http://localhost:7878/public/images/";
                $scope.products = products;

                
            }, function (err) {
                $scope.productsFound = false;

                $scope.message = err;
            }
        );

    }
]);
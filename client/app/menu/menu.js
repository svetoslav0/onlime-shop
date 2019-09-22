'use strict';

angular.module('myApp.menu', ['ngRoute'])

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

.controller('MenuController', [
    '$scope',
    'api',
    function($scope, api) {
        api.getAllCategories()
            .then(function(categories) {
                $scope.categories = categories;
                console.log(categories);
            });
    }
]);
var api_token = 'aRVIU4E6JQ1cDK2YCJjiUzEwu5QvTsXmELTHgZqzR6qJ1esyHWX7FMKc8pm1'

var app =  angular.module('main-App',['ngRoute','angularUtils.directives.dirPagination']);

app.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
            when('/', {
                templateUrl: 'templates/items.html',
                controller: 'ItemController'
            });       

}]);
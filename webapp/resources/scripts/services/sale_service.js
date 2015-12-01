'use strict';
 
App.factory('SaleService', ['$http', '$q', function($http, $q){
    return {
        getAllSales: function() {
            return $http.get(ctx+'/admin/rest/sales/')
                .then(
                        function(response){
                            return response.data;
                        }, 
                        function(errResponse){
                            console.error('Error while get all the sales.');
                            return $q.reject(errResponse);
                        }
                );
        }
    };
}]);
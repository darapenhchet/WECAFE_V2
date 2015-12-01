'use strict';
 
App.factory('SupplierService', ['$http', '$q', function($http, $q){
    return {
        getAllSuppliers: function() {
            return $http.get(ctx+'/admin/rest/suppliers/')
                .then(
                        function(response){
                            return response.data;
                        }, 
                        function(errResponse){
                            console.error('Error while get all the products.');
                            return $q.reject(errResponse);
                        }
                );
        }
    };
 
}]);
'use strict';
 
App.factory('ProductService', ['$http', '$q', function($http, $q){
    return {
        getAllProducts: function() {
            return $http.get(ctx+'/admin/rest/products/')
                .then(
                        function(response){
                            return response.data;
                        }, 
                        function(errResponse){
                            console.error('Error while get all the products.');
                            return $q.reject(errResponse);
                        }
                );
        },
        
        changeProductStatus: function(id) {
            return $http({
            	method: 'POST',
            	url: ctx+'/admin/product/status/'+id,
            	dataType: 'JSON',
            	headers: {
                    'Content-Type': 'application/json'
            	},
            	data: '',
            }).then(
                        function(response){
                            return response.data;
                        }, 
                        function(errResponse){
                            console.error('Error while updating the status');
                            return $q.reject(errResponse);
                        }
                );
        }   
    };
 
}]);
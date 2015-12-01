'use strict';
 
App.factory('CategoryService', ['$http', '$q', function($http, $q){
    return {
        getAllCategories: function() {
            return $http.get(ctx+'/admin/rest/categories/')
                .then(
                        function(response){
                            return response.data;
                        }, 
                        function(errResponse){
                            console.error('Error while get all the categories.');
                            return $q.reject(errResponse);
                        }
                );
        },
        
        changeCategoryStatus: function(id) {
            return $http({
            	method: 'POST',
            	url: ctx+'/admin/category/status/'+id,
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
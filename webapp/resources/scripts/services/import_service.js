'use strict';
 
App.factory('ImportService', ['$http', '$q', function($http, $q){
    return {
        getAllImports: function() {
            return $http.get(ctx+'/admin/rest/imports/')
                .then(
                        function(response){
                            return response.data;
                        }, 
                        function(errResponse){
                            console.error('Error while get all the imports.');
                            return $q.reject(errResponse);
                        }
                );
        }
        
    };
 
}]);
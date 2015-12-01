'use strict';
 
App.factory('UserService', ['$http', '$q', function($http, $q){
    return {
        getAllUsers: function() {
            return $http.get(ctx+'/admin/rest/users/')
                .then(
                        function(response){
                            return response.data;
                        }, 
                        function(errResponse){
                            console.error('Error while get all the users.');
                            return $q.reject(errResponse);
                        }
                );
        },
        
        changeUserStatus: function(id) {
            return $http({
            	method: 'POST',
            	url: ctx+'/admin/user/status/'+id,
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
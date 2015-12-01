'use strict';
 
App.factory('SlideService', ['$http', '$q', function($http, $q){
    return {
        getAllSlides: function() {
            return $http.get(ctx+'/admin/rest/slides/')
                .then(
                        function(response){
                            return response.data;
                        }, 
                        function(errResponse){
                            console.error('Error while get all the slides.');
                            return $q.reject(errResponse);
                        }
                );
        },
        
    };
 
}]);
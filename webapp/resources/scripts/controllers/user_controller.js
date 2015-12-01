'use strict';
 
App.controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
      $scope.users=[];
      $scope.pageNumber = 1;
      $scope.perPage = 10;
      $scope.getAllUsers = function(){
    	  UserService.getAllUsers()
              .then(
                       function(data) {
                    	   $scope.users = data.USERS;
                            console.log(data);
                       },
                        function(errResponse){
                            console.error('Error while get all users.');
                            }
                   );
          };
      $scope.getAllUsers();
      
      $scope.changeUserStatus = function(user){
    	  UserService.changeUserStatus(user.id)
    	  		.then(
    	  				function(data){
    	  					if(data==true){
    	  						$scope.getAllUsers();
    	  					}
    	  				},
    	  				function(errResponse){
    	  					console.error('Error while changing user Status.')
    	  				}
    	  		);
      };
  }]);
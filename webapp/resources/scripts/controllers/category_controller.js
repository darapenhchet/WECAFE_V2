'use strict';
 
App.controller('CategoryController', ['$scope', 'CategoryService', function($scope, CategoryService) {
      $scope.categories=[];
      $scope.pageNumber = 1;
      $scope.perPage = 10;
      $scope.getAllCategories = function(){
    	  CategoryService.getAllCategories()
              .then(
                       function(data) {
                    	   $scope.categories = data.CATEGORIES;
                            console.log(data);
                       },
                        function(errResponse){
                            console.error('Error while get All Categories.');
                            }
                   );
          };
      $scope.getAllCategories();
      
      $scope.changeCategoryStatus = function(category){
    	  CategoryService.changeCategoryStatus(category.catId)
    	  		.then(
    	  				function(data){
    	  					if(data==true){
    	  						$scope.getAllCategories();
    	  					}
    	  				},
    	  				function(errResponse){
    	  					console.error('Error while changing Category Status.')
    	  				}
    	  		);
      };
  }]);
'use strict';
 
App.controller('ProductController', ['$scope', 'ProductService', function($scope, ProductService) {
      $scope.products=[];
      $scope.pageNumber = 1;
      $scope.perPage = 10;
      $scope.getAllProducts = function(){
    	  ProductService.getAllProducts()
              .then(
                       function(data) {
                    	   $scope.products = data.PRODUCTS;
                            console.log(data);
                       },
                        function(errResponse){
                            console.error('Error while get All Products.');
                            }
                   );
          };
      $scope.getAllProducts();
      
      $scope.changeProductStatus = function(product){
    	  //product.status = !product.status;
    	  ProductService.changeProductStatus(product.productId)
    	  		.then(
    	  				function(data){
    	  					if(data==true){
    	  						//product.status = !product.status;
    	  						$scope.getAllProducts();
    	  					}
    	  				},
    	  				function(errResponse){
    	  					console.error('Error while changing Product Status.')
    	  				}
    	  		);
      };
  }]);
'use strict';
 
App.controller('SupplierController', ['$scope', 'SupplierService', function($scope, SupplierService) {
      $scope.suppliers=[];
      $scope.pageNumber = 1;
      $scope.perPage = 10;
      $scope.getAllSuppliers = function(){
    	  SupplierService.getAllSuppliers()
              .then(
                       function(data) {
                    	   $scope.suppliers = data.SUPPLIERS;
                            console.log(data);
                       },
                        function(errResponse){
                            console.error('Error while get All suppliers.');
                            }
                   );
          };
      $scope.getAllSuppliers();
  }]);
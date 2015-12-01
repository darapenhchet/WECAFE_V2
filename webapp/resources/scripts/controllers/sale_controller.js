'use strict';
 
App.controller('SaleController', ['$scope', 'SaleService', function($scope, SaleService) {
      $scope.sales=[];
      $scope.pageNumber = 1;
      $scope.perPage = 10;
      $scope.getAllSales = function(){
    	  SaleService.getAllSales()
              .then(
                       function(data) {
                    	   $scope.sales = data.SALES;
                            console.log(data);
                       },
                        function(errResponse){
                            console.error('Error while get All sales.');
                            }
                   );
          };
      $scope.getAllSales();
  }]);
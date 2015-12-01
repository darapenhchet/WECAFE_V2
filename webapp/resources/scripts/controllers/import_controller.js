'use strict';
 
App.controller('ImportController', ['$scope', 'ImportService', function($scope, ImportService) {
      $scope.imports=[];
      $scope.pageNumber = 1;
      $scope.perPage = 10;
      $scope.getAllImports = function(){
    	  ImportService.getAllImports()
              .then(
                       function(data) {
                    	   $scope.imports = data.IMPORTS;
                            console.log(data);
                       },
                        function(errResponse){
                            console.error('Error while get All Imports.');
                            }
                   );
          };
      $scope.getAllImports();
  }]);
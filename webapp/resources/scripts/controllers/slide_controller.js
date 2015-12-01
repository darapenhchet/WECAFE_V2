'use strict';
 
App.controller('SlideController', ['$scope', 'SlideService', function($scope, SlideService) {
      $scope.slides=[];
      $scope.pageNumber = 1;
      $scope.perPage = 10;
      $scope.getAllSlides = function(){
    	  SlideService.getAllSlides()
              .then(
                       function(data) {
                    	   $scope.slides = data.SLIDES;
                            console.log(data);
                       },
                        function(errResponse){
                            console.error('Error while get All Slides.');
                            }
                   );
          };
      $scope.getAllSlides();
      
  }]);
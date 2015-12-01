<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

<link rel="shortcut icon" href="images/favicon_1.ico">

<title>KOSIGN WeCafe...</title>

<!-- Base Css Files -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"	rel="stylesheet" />

<!-- Font Icons -->
<link href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/assets/ionicon/css/ionicons.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.min.css" rel="stylesheet">

<!-- animate css -->
<link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet" />

<!-- Waves-effect -->
<link href="${pageContext.request.contextPath}/resources/css/waves-effect.css" rel="stylesheet">

<!-- sweet alerts -->
<link href="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.css" rel="stylesheet">

<!-- Custom Files -->
<link href="${pageContext.request.contextPath}/resources/css/helper.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<!-- DATEPICKER -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>

</head>



<body class="fixed-left-void">

	<!-- Begin page -->
	<div id="wrapper">

		<!-- Top Bar Start -->
		<%@ include file="topbar.jsp"%>
		<!-- Top Bar End -->


		<!-- ========== Left Sidebar Start ========== -->
		<%@ include file="left_sidebar.jsp"%>
		<!-- Left Sidebar End -->



		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<!-- Page-Title -->
					<div class="row">
						<div class="col-sm-12">
							<h4 class="pull-left page-title">Sell List</h4>
						</div>
					</div>
					<div class="panel">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div>
				                		<label class="col-sm-1 control-label">Date : </label>
											<input type="hidden" id="SEND_DT" data-id="SEND_DT" />
										<div id="sendFrdt" class="date-range col-sm-5"  >
											<input type="text" readonly="readonly" id="REGS_DATE_S" name="startdate" class="range-start" style="width:100px; text-align: center;">&nbsp;
											<a href="#none" id="btnREGS_DATE_S"><img style="width: 20px; height: 20px;" src="${pageContext.request.contextPath}/resources/images/img/ico_calendar.png"></a>&nbsp;~&nbsp;
											<input type="text" readonly="readonly" id="REGS_DATE_E" name="stopdate" class="range-end" style="width:100px; text-align: center;">&nbsp;
											<a href="#none" id="btnREGS_DATE_E"><img style="width: 20px; height: 20px;" src="${pageContext.request.contextPath}/resources/images/img/ico_calendar.png"></a>
										</div>   
									</div>
									<table id="datatable"
										class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th style="text-align: center;">Date</th>
											<th style="text-align: center;">Total Amount</th>
											<th style="text-align: center;">Seller</th>
										</tr>
									</thead>
									<tbody id="CONTENTS">
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<select id="PER_PAGE" class="form-control">
									<option value="15">15</option>
									<option value="30">30</option>
									<option value="50">50</option>
									<option value="100">100</option>
								</select>
							</div>
							<div id="PAGINATION" class="pull-right">
							</div>
						</div>
					</div>
					<!-- end: page -->
				</div>
										
					<!-- end Panel -->
				</div>
				<!-- container -->
			</div>
			<!-- content -->

			<%@ include file="footer.jsp"%>

		</div>

		<div id="sellDetail" style="display: none;width: 90%;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Sale detail</h4>

				</div>
				<div class="modal-body" style="height: 290px; width: 100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Produce Name</th>
								<th>Price</th>
								<th>Qty</th>
								<th>Total Amount</th>
								<th>Time</th>
								<th>Comment</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="orderProdetail">
							
						</tbody>
					</table>
				</div>
				<div class="modal-footer" style="height: 80px;">
						<div align="right">
							<button class="btn btn-default b-close">Close</button>
						</div>
				</div>
			</div>
		</div>


	</div>
	<!-- END wrapper -->
	
	<script id="CONTENT_TEMPLATE" type="text/x-jquery-tmpl">
        <tr>
            <td style="text-align: center;"><a href="javascipt:" id="saleId">{{= ID}}</a></td>
			<td id="orderId" style="display : none;">{{= ORDER_ID}}</td>
            <td style="text-align: center;">{{= SALE_DATE}}</td>
            <td style="text-align: center;">{{= TOTAL }}</td>
            <td style="text-align: center;">{{= SELLER }}</td>
        </tr>
    </script>

	<script>
            var resizefunc = [];
            var ctx = "${pageContext.request.contextPath}"
     </script>
    <!-- jQuery  -->
	        
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/jquery.ui.datepicker-ko.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/chat/moment-2.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>

   	<script	src="${pageContext.request.contextPath}/resources/assets/magnific-popup/magnific-popup.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script>	  
	<script src="${pageContext.request.contextPath}/resources/js/jquery.tmpl.min.js"></script>

    <!-- CUSTOM JS -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>

	<script type="text/javascript">
   		$(document).ready(function($) {
       	$(document).on(" click","table tbody tr td #saleId", function(){
              
           	var id =  $(this).parent().parent().children().eq(1).html()
              	
           	$("#sellDetail").bPopup();
             	$.ajax({ 
     				    url: "${pageContext.request.contextPath}/admin/sell/"+id, 
     				    type: 'POST', 
     				    dataType: 'JSON', 
     				    beforeSend: function(xhr) {
     	                    xhr.setRequestHeader("Accept", "application/json");
     	                    xhr.setRequestHeader("Content-Type", "application/json");
     	                },
     	                
     				    success: function(data) { 
     				        console.log(data.length);
     				        var str = "";
     				        for(i = 0; i < data.length; i++){
     				        	str += "<tr>"
						str += "<td>" + data[i].productName + "</td>"
						str += "<td>" + data[i].SalePrice + "</td>"
						str += "<td>" + data[i].ProQty + "</td>"
						str += "<td>" + data[i].ProUnitPrrice + "</td>"	
						str += "<td>" + data[i].orderDate + "</td>"	
						str += "<td>" + data[i].ProComment + "</td>"	
						str += "</tr>"
						$("#orderProdetail").html(str);
     				        }
     				    },
     				    error:function(data,status,er) { 
     				        console.log("error: "+data+" status: "+status+" er:"+er);
     				    }
     				});
              });
           });
    </script>
	<script type="text/javascript">
	  	$(function(){
	  		setCalendar();
	  		searchByDate();
		    function getAllSales(pNum, pSize, check){
		    	var json = {
			  			"page" :pNum,
			  			"limit" : pSize,
		  		};
		    	$.ajax({ 
				    url: "${pageContext.request.contextPath}/admin/rest/sales", 
				    type: 'GET',  
				    data: json, 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				    	console.log(data);
						if(data.SALES.length>0){
							$("tbody#CONTENTS").html('');
							for(var i=0;i<data.SALES.length;i++){
								format(data.SALES[i]);
							}
							$("#CONTENT_TEMPLATE").tmpl(data.SALES).appendTo("tbody#CONTENTS");
						}else{
							$("tbody#CONTENTS").html('<tr>NO CONTENTS</tr>');
						}
				    	if(check){
				    		pagination(data.PAGINATION.totalPages,1);
				    		check=false;
				    	}
				    },	
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
		    }
		    
		    function format(value){
		    	value["SALE_DATE"] = moment(value["SALE_DATE"]).format("DD-MMMM-YYYY H:mm:ss");
		    }
			
		    function pagination(tPage, currentPage){
		    	$('#PAGINATION').bootpag({
			        total: tPage,
			        page: currentPage,
			        maxVisible: 10,
			        leaps: true,
			        firstLastUse: true,
			        first: 'First',
			        last: 'Last',
			        wrapClass: 'pagination',
			        activeClass: 'active',
			        disabledClass: 'disabled',
			        nextClass: 'next',
			        prevClass: 'prev',
			        lastClass: 'last',
			        firstClass: 'first'
			    }).on("page", function(event, num){
			    	getAllSales(num,$("#PER_PAGE").val(),false);
			    }); 
		    }
		    $("#PER_PAGE").change(function(){
		    	getAllSales(1,$(this).val(),true);
		    });
		    getAllSales(1, 15, true);
		    
			$("#btnREGS_DATE_S").click(function(){	
		 		$( "#REGS_DATE_S" ).datepicker("show");		
		 	});		
		 	$("#btnREGS_DATE_E").click(function(){
		 		$( "#REGS_DATE_E" ).datepicker("show");			
		 	});

		 	function calculateDay(start, end){		
		         var days = (end - start) / (1000 * 60 * 60 * 24);
		         $("#totalday").val(days);
		         return;
		 	}

		 	function setCalendar(){		
		 		$("#REGS_DATE_S").datepicker({
		 		      defaultDate: new Date(),
		 		      setDate: new Date(),
		 		      changeMonth: true,
		 		      numberOfMonths: 1,
		 		      dateFormat: "yy-mm-dd",
		 		      onClose: function( selectedDate ) {			    	  
		 		    	    calculateDay($("#REGS_DATE_S").datepicker("getDate"),$("#REGS_DATE_E").datepicker("getDate"));
	 						$("#REGS_DATE_E").datepicker("option", "minDate", selectedDate);
	 						searchByDate();
	 			      }
	 			});
		 		$("#REGS_DATE_E").datepicker({
		 		     defaultDate: new Date(),
	 			     setDate: new Date(),
	 			     changeMonth: true,
	 		      	 numberOfMonths: 1,
		 		     dateFormat: "yy-mm-dd",
		 		     onClose: function( selectedDate ) {
		 			    	  $("#REGS_DATE_S").datepicker("option", "maxDate", selectedDate);
    	 			    	  calculateDay($("#REGS_DATE_S").datepicker("getDate"),$("#REGS_DATE_E").datepicker("getDate"));
    	 			    	  searchByDate();
	 			      }
		 		});		
		 		$("#REGS_DATE_S").datepicker('setDate', moment().format('YYYY-MM-DD'));
		 		$("#REGS_DATE_E").datepicker('setDate', moment().format('YYYY-MM-DD'));
		 	}
		 	
		 	function searchByDate(){
		      	var startDate 		= $( "#REGS_DATE_S" ).val() + " 00:00:00";
				var endDate 		= $( "#REGS_DATE_E" ).val() + " 24:00:00"; 
				json = {
							"startdate"   		  : startDate,
							"enddate" 		  	  : endDate
				};
				console.log(JSON.stringify(json));
				getAllSales(1,$("#PER_PAGE").val(),true);
				return;
			 }
	  	});
	  </script>
</body>
</html>

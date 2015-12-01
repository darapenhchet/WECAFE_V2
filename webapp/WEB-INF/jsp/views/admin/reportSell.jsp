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
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Font Icons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/ionicon/css/ionicons.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.min.css"
	rel="stylesheet">

<!-- animate css -->
<link
	href="${pageContext.request.contextPath}/resources/css/animate.css"
	rel="stylesheet" />

<!-- Waves-effect -->
<link
	href="${pageContext.request.contextPath}/resources/css/waves-effect.css"
	rel="stylesheet">

<!-- sweet alerts -->
<link
	href="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.css"
	rel="stylesheet">

<!-- Custom Files -->
<link href="${pageContext.request.contextPath}/resources/css/helper.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

<script	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script> 

 <style>
       	@media print {
	    .content-page{
	    	margin-top:0px;
	    	margin-left:0px;
	    }
	    .content{
	    	margin-top: 0px; 
	    	margin-bottom: 0px;
	    }
    
	}  
 </style>
</head>



<body class="fixed-left-void">

	<!-- Begin page -->
    <div id="wrapper">        
    
	     <!-- Top Bar Start -->
	    <%@ include file="topbar.jsp" %>
        <!-- Top Bar End -->


        <!-- ========== Left Sidebar Start ========== -->
        <%@ include file="left_sidebar.jsp" %>
        <!-- Left Sidebar End -->
        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->                      
        <div class="content-page">
            <!-- Start content -->
            <div class="content" >
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <!-- <div class="panel-heading">
                                    <h4>Invoice</h4>
                                </div> -->
                                <div class="panel-body">
                                    <div class="clearfix">
                                        <div class="pull-left">
                                            <h4 class="text-right"><%-- <img src="${pageContext.request.contextPath}/resources/images/logo_dark.png" alt="velonic"> --%>
                                            	<strong>KOSIGN WECAFE</strong>
                                            </h4>
                                            
                                        </div>
                                        <div class="pull-right">
                                            <h4>Invoice # <br>
                                                <strong>2015-04-23654789</strong>
                                            </h4>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-12">
                                            
                                            <div class="pull-left m-t-120">
                                                 <address>
	                                                  <strong>KOSIGN, Inc.</strong><br>
	                                                  #12, St 323, Boeungkak II Commune,<br>
	                                                  Toul Kork District, Phnom Penh. Cambodia<br>
	                                                  <abbr title="Phone">P:</abbr> (855) 23- 99-13-14
                                                  </address>
                                            </div>
                                            <div class="pull-right m-t-30">
                                                <p><strong>Order Date: </strong> Jun 15, 2015</p>
                                                <p class="m-t-10"><strong>Order Status: </strong> <span class="label label-pink">Pending</span></p>
                                                <p class="m-t-10"><strong>Order ID: </strong> #123456</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="m-h-50 form-group hidden-print ">                                     
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
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                      		
                                                <table class="table m-t-30">
                                                    <thead>
                                                        <tr>
	                                                        <th>#</th>
	                                                        <th>product Name</th>
	                                                        <th>Quantity</th>
	                                                        <th>Unit Price</th>
	                                                        <th>Total</th>
	                                                    </tr>
                                                    </thead>
                                                    <tbody id="searchDetail">
                                                     <%--  <c:set var="total" value="${0}"/>
                                                   		 <c:forEach items="${reportSell}" var="reportSells" varStatus="theCount"  >
	                                                    	<tr>
	                                                            <td>${theCount.count}</td>
	                                                            <td>${reportSells.productName }</td>
	                                                            <td>${reportSells.proQty }</td>
	                                                            <td>${reportSells.UnitPrice }</td>
	                                                            <td>${reportSells.Total }</td>
	                                                             <c:set var="total" value = "${total + reportSells.Total}" />
	                                                             <!--   <td>${total}</td>-->
	                                                        </tr> 
                                                        </c:forEach>  --%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="border-radius: 0px;">
                                        <div class="col-md-3 col-md-offset-9">
                                             <%--<p class="text-right"><b>Sub-total:</b>${total}</p>
                                            <p class="text-right">Discount: 12.9%</p>
                                            <p class="text-right">VAT: 12.9%</p> --%>
                                            <hr>
                                            <h3 class="text-right" id="totalPrice">${total} Riels</h3>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="hidden-print">
                                        <div class="pull-right">
                                            <a href="javascrpt:" class="btn btn-inverse waves-effect waves-light" onclick="window.print();"><i class="fa fa-print"></i></a>
                                            <a href="#" class="btn btn-primary waves-effect waves-light">Submit</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>



        </div> <!-- container -->
                           
            </div> <!-- content -->

            <footer class="footer text-center hidden-print">
                KOSIGN WECAFE © 2015.
            </footer> 

        </div>
        <!-- ============================================================== -->
        <!-- End Right content here -->
        <!-- ============================================================== -->
    </div>
    <!-- END wrapper -->

    <script>
        var resizefunc = [];
        
    </script>

    <!-- jQuery  -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/jquery.ui.datepicker-ko.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">

    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>


    <!-- CUSTOM JS -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>
 <script>
 var st = "";
 $(document).ready(function(){
	 setCalendar();
	 searchByDate();
	 
	 
	 function searchByDate(){
      	var startDate 		= $( "#REGS_DATE_S" ).val() + " 00:00:00";
		var endDate 		= $( "#REGS_DATE_E" ).val() + " 24:00:00"; 
		json = {
					"startdate"   		  : startDate,
					"enddate" 		  	  : endDate
		};
		console.log(JSON.stringify(json));
		$.ajax({
			 url: "${pageContext.request.contextPath}/admin/getsearchsellbydate", 
	    type: 'POST',
			datatype: 'JSON',
			data: JSON.stringify(json), 
			beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
			success: function(data){
				st="";
				
            	var a = 1;
            	var total = 0;
            	
	            for(i=0; i<data.length; i++)	
		      	{ 
	            	a = i+1;
	            	total += data[i].Total ;
		    	  	st += "<tr>"
		    	  	st += "<td>" + a + "</td> "
		    	  	st += "<td>" + data[i].productName + "</td>";
		    	  	st += "<td>" + data[i].proQty + "</td>";
		    	  	st += "<td>" + data[i].UnitPrice + "</td>";
		    	  	st += "<td>" + data[i].Total + "</td>"; 
		    	  
		    	}
	            
      			$("#searchDetail").html(st);
      			$("#totalPrice").html(total);
			},
			error:function(data, status,er){
				console.log("error: " + data + "status: " + status + "er: ");
			}
		}); 
	 }
	  
	 
	 
	 
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
	 						//moneyPerDay($("#totalAmount").val(), $("#totalday").val());
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
	 						//moneyPerDay($("#totalAmount").val(), $("#totalday").val());
	 			    	   searchByDate();
	 			      }
	 		});		
	 		$("#REGS_DATE_S").datepicker('setDate', moment().format('YYYY-MM-DD'));
	 		//$("#REGS_DATE_E").datepicker('setDate', moment().add(30, 'days').format('YYYY-MM-DD'));
	 		$("#REGS_DATE_E").datepicker('setDate', moment().format('YYYY-MM-DD'));
	 }
	 });
 </script>
    
    
</body>
</html>
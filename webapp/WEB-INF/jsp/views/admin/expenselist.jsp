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

<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>

</head>



<body class="fixed-left" ng-app="wecafe">

	<!-- Begin page -->
	<div id="wrapper" ng-controller="ImportController as controller">

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
							<h4 class="pull-left page-title">Expense List</h4>
						</div>
					</div>
					<div class="panel-body">
                         <div class="panel-heading">
                               <!-- <h3 class="panel-title">Product Lists</h3> -->
						    <form class="form-inline">
						        <div class="form-group">
						            <label >Search</label>
						            <input type="text" ng-model="search" class="form-control" placeholder="Search" width="400%">
						        </div>
						    </form>
                           </div>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
							<table id="datatable" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>Invoice ID</th>
											<th style="text-align: center;">Date</th>
											<th>Description</th>  
											<th style="text-align: center;">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${expenses}" var="expense" varStatus="theCount"> 
											<tr>
												<td>${theCount.count}</td>
												<td ><a href="javascript:;" id="expid">${expense.expId}</a> </td>												
												<td >${expense.exp_date}</td>
												<td>${expense.description }</td>  
												<td class="actions" style="text-align: center;"><a
													class="on-default edit-row"
													href="#"><i	class="fa fa-pencil"></i></a> <a class="on-default remove-row"
													href="javascript:;" id="btnRemove"><i
														class="fa fa-trash-o"></i></a></td>
											</tr>
										</c:forEach>
										<%-- <tr dir-paginate="(key,importproducts) in imports|filter:search|itemsPerPage:perPage|orderBy : importproducts.createdDate">
											<td>{{key+1}}</td>
											<td ><a href="javascript:;" id="impid"> {{importproducts.impId}}</a> </td>												
											<td style="text-align: center;">{{importproducts.impDate | date:'dd-MMMM-yyyy'}}</td>
											<td>{{importproducts.userId }}</td>
											<td></td>
											<td style="text-align: right;">{{importproducts.totalAmount }} Riel
											<td class="actions" style="text-align: center;"><a
												class="on-default edit-row"
												href="${pageContext.request.contextPath}/admin/viewById/{{importproducts.impId}}"><i
													class="fa fa-pencil"></i></a> <a class="on-default remove-row"
												href="javascript:;" id="btnRemove"><i
													class="fa fa-trash-o"></i></a></td>
										</tr> --%>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- end Panel -->

			</div>
				<!-- container -->

			</div>
			<!-- content -->

			<%@ include file="footer.jsp"%>

		</div>
	</div>
	<!-- END wrapper -->

<!-- ############################################################# -->


		<div id="impDetail" style="display: none;width: 80%;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Expense</h4>

				</div>
				<div class="modal-body" style="width: 100%;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>Produce Name</th>
								<th>Qty</th>
								<th>Unit Price</th>
								<th>Amount</th>
								<th>Supplier Name</th>
								<th>Remark</th>
							</tr>
						</thead>
						<tbody id="impProDetail">							
						</tbody>
					</table> 
						
					<div class="modal-footer" style="height: 80px;">
						<div style="float: left;">
							<div class="form-group form-horizontal">
                                <label class="control-label col-lg-6">Total Amount</label>
                                <div class="col-lg-6">
                                    <input class=" form-control" id="txttotal" type="text" readonly="readonly">
                                </div>
                            </div>
						</div>
						<div align="right">
							<button class="btn btn-default b-close">Close</button>
						</div>
				</div>
				</div> 
			</div>
		</div>

		<!-- ################################################################## -->

	<script>
            var resizefunc = [];
            var ctx = "${pageContext.request.contextPath}"
    </script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <script src="<c:url value='/resources/scripts/dirPagination.js' />"></script>
    <script src="<c:url value='/resources/scripts/app.js' />"></script>
    <script src="<c:url value='/resources/scripts/services/import_service.js' />"></script>
    <script src="<c:url value='/resources/scripts/controllers/import_controller.js' />"></script>

	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/chat/moment-2.2.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>

	<!-- sweet alerts -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.init.js"></script>

	<!-- Counter-up -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/counterup/waypoints.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>

	<!-- CUSTOM JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
	<script type="text/javascript">
		/* ==============================================
		Counter Up
		=============================================== */
		jQuery(document).ready(function($) {
		 
			 $(document).on("click","#expid", function(){ 
		 		   $.ajax({ 
					    url: "${pageContext.request.contextPath}/admin/getexpensedetail/" + $(this).html() , 
					    type: 'GET', 
					    dataType: 'JSON', 
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					    success: function(data) {  
					    var	amount = 0;
					    var st= "";
					       for(i=0; i<data.length; i++){
					    	   st += "<tr><td>" + (i + 1) + "</td>";
					    	   st += "<td>" + data[i].exp_description +"</td>";
					    	   st += "<td>" + data[i].exp_qty +"</td>";
					    	   st += "<td>" + data[i].exp_unitprice +"</td>";
					    	   st += "<td>" + (data[i].exp_unitprice * data[i].exp_qty) +"</td>";
					    	   st += "<td>" + data[i].customer +"</td>";
					    	   st += "<td>" + data[i].remark +"</td></tr>"; 
					    	   amount += (data[i].exp_unitprice * data[i].exp_qty);
					       }
					       $("#txttotal").val(amount);
					       $("#impProDetail").html(st); 
					    },
					    error:function(data,status,er) { 
					        console.log("error: "+data+" status: "+status+" er:"+er);
					    }
					});  
				 
				  $("#impDetail").bPopup();  
			 });
			 /*
			function searchSupplier(){
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/admin/searchsupplier", 
				    type: 'POST', 
				    dataType: 'JSON', 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				       console.log(data);
	// 			       getsizeSession();
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
				
			}
		
		function searchProduct(){
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/admin/searchproduct", 
				    type: 'POST', 
				    dataType: 'JSON', 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				       console.log(data);
	// 			       getsizeSession();
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
				
			} */
		
		});
	</script>

	<!-- Examples -->
	 <script src="${pageContext.request.contextPath}/resources/assets/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/datatables/dataTables.bootstrap.js"></script>
        
        
        
</body>
</html>
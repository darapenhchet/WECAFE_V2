<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link rel="shortcut icon" href="images/favicon_1.ico">

        <title>KOSIGN WeCafe...</title>

        <!-- Base Css Files -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />

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

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        
        <![endif]-->
        
        
        <script src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> 
        <style>
	          .hidebtn{
					  	display : none;
					  }
        </style>
  		
    </head>



    <body class="fixed-left">
        
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
                <div class="content">                 
                    <div class="container">

                        <!-- Page-Title -->
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="pull-left page-title">Update Import Product</h4>
                            </div>
                        </div>
                        <!-- Form-validation -->
                        <div class="row">
                        
                            <div class="col-sm-12">
                                <div class="panel panel-default">
                                    <!-- <div class="panel-heading"><h3 class="panel-title">Form Add Product</h3></div> -->
                                    <div class="panel-body">
                                        <div class=" form">
                                            <form class="cmxform form-horizontal tasi-form" id="signupForm" method="get" action="#" novalidate="novalidate">
                                                <div class="form-group ui-widget">
                                                    <label for="productName" class="control-label col-lg-2">Product Name *</label>
                                                    <div class="col-lg-10">
                                                        <input class=" form-control" id="productName"   name="" type="text">
                                                        <input type="text" class="hidebtn" id="prodID"  >
                                                        
                                                        <input  type="text" class="hidebtn" value="${IMPORT_ID }" id="impId"  >
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="quantity" class="control-label col-lg-2">Qty *</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control " id="qty"  name="qty" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="UnitPrice" class="control-label col-lg-2">Unit Price *</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control " id="UnitPrice"   name="Unit Pirce" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="supplierName" class="control-label col-lg-2">Supplier Name *</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control " id="supplierName"   name="SupplierName" type="text">
                                                        <input  type="text" class="hidebtn" id="suppId"  >
                                                    </div>
                                                </div> 
                                                <div class="form-group" align="right">
                                                     
                                                        <button class="btn btn-success waves-effect waves-light" style="width: 100px; " id="addbtn" type="button">Add</button>
                                                     	<button class="btn btn-default waves-effect waves-light" style="width: 100px; margin-right: 10px;" id="cancelbtnadd" type="button">Cancel</button>
                                              	</div>
                                                <!-- =================== --> 
						<h5 class="pull-left page-title"># Import List</h5>                        
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
							<table id="datatable" class="table table-striped table-bordered dataTable">
									<thead>
									
									</thead><thead>
										<tr>
											<th>#</th>
											<th>Product Name</th>
											<th style="text-align: center;">Qty</th>
											<th style="text-align: center;">Unit Price</th> 
											<th style="text-align: center;">Supplier Name</th>
											<th style="text-align: center;">Edit</th>
										</tr>
									</thead>
									<tbody id="tbllistimport"> 
											<c:forEach items="${importpro}" var="importpro" varStatus="theCount">
											<tr>
												<%-- <td id="supplierId" style="display : none;">${supplier.supId}</td> --%>	
												<td id="proId" style="display: none;">${importpro.proid }</td>										
												<td >${theCount.count }</td>
												<td id="proName">${importpro.proname }</td>  
												<td id="proqty">${importpro.proqty }</td> 
												<td id="prounitprice">${importpro.prounitprice }</td> 
												<td id="supid" style="display: none;">${importpro.supId }</td>	
												<td id="supname">${importpro.supname }</td> 
												<td class="actions" style="text-align: center;"><a
													class="on-default edit-row" id="btnedit"
													 href="javascript:;"><i
														class="fa fa-pencil"></i></a> <a class="on-default remove-row"
													href="javascript:;" id="btnRemove"><i
														class="fa fa-trash-o"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
												<!-- =================== -->
                                                <div class="form-group" align="right"> 
                                                        <button class="btn btn-success waves-effect waves-light" style="width: 100px;" id="savebtn" type="button">Save</button>
                                                        <button class="btn btn-default waves-effect" style="width: 100px; margin-right: 10px;" id="cencelBtn" type="button">Cancel</button> 
                                                </div>
                                            </form>
                                        </div> <!-- .form -->

                                    </div> <!-- panel-body -->
                                </div> <!-- panel -->
                            </div> <!-- col -->

                        </div> <!-- End row -->



            </div> <!-- container -->
                               
          
                               
                </div> <!-- content -->

                <%@ include file="footer.jsp" %>

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


            <!-- Right Sidebar -->
            <div class="side-bar right-bar nicescroll">
                <h4 class="text-center">Chat</h4>
                <div class="contact-list nicescroll">
                    <ul class="list-group contacts-list">
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-1.jpg" alt="">
                                </div>
                                <span class="name">Chadengle</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-2.jpg" alt="">
                                </div>
                                <span class="name">Tomaslau</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-3.jpg" alt="">
                                </div>
                                <span class="name">Stillnotdavid</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-4.jpg" alt="">
                                </div>
                                <span class="name">Kurafire</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-5.jpg" alt="">
                                </div>
                                <span class="name">Shahedk</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-6.jpg" alt="">
                                </div>
                                <span class="name">Adhamdannaway</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-7.jpg" alt="">
                                </div>
                                <span class="name">Ok</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-8.jpg" alt="">
                                </div>
                                <span class="name">Arashasghari</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-9.jpg" alt="">
                                </div>
                                <span class="name">Joshaustin</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-10.jpg" alt="">
                                </div>
                                <span class="name">Sortino</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                    </ul>  
                </div>
            </div>
            <!-- /Right-bar -->

        </div>
        <!-- END wrapper -->


    
        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
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

        <!-- sweet alerts -->
        <script src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.init.js"></script>

        <!-- flot Chart -->
        <script src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.time.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.tooltip.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.resize.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.pie.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.selection.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.stack.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.crosshair.js"></script>

        <!-- Counter-up -->
        <script src="${pageContext.request.contextPath}/resources/assets/counterup/waypoints.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/counterup/jquery.counterup.min.js" type="text/javascript"></script>
        
        <!-- CUSTOM JS -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>

        <!-- Dashboard -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.dashboard.js"></script>

        <!-- Chat -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.chat.js"></script>

        <!-- Todo -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.todo.js"></script>

        <script type="text/javascript">
            /* ==============================================
            Counter Up
            =============================================== */
            jQuery(document).ready(function($) {
            	searchProduct();
            	searchSupplier();
            	var _thisRow ;
            	
            	$(document).on("click","#btnedit",function(){
            		$("#addbtn").html("Update");
            		$("#addbtn").attr("id","updatebtn");            		
            		_thisRow = $(this).parents("tr"); 
            		
            		$("#prodID").val($(this).parents("tr").children().eq(0).html());
            		$("#productName").val($(this).parents("tr").children().eq(2).html());
            		$("#qty").val($(this).parents("tr").children().eq(3).html());
            		$("#UnitPrice").val($(this).parents("tr").children().eq(4).html());
            		$("#suppId").val($(this).parents("tr").children().eq(5).html());
            		$("#supplierName").val($(this).parents("tr").children().eq(6).html()); 
            	});
            	 
                $(document).on('keypress','#qty, #UnitPrice', function(e){

    				if((e.keyCode == 8) || (e.keyCode == 46) || ((e.keyCode >=37) && (e.keyCode <= 40)))
    					return ;

    			var data = String.fromCharCode(e.which);	
    					var reg = new RegExp('^[0-9]+$');
    		    	    if(!reg.test(data)){
    		    	    	e.preventDefault();
    					}
    			     });
            	
            	$("#cencelBtn").click(function(){
            		$("#tbllistimport tr").remove();
            		location.href="${pageContext.request.contextPath}/admin/importlist";
            	});
            	
           
            	
            	$(document).on("click","#btnRemove",function(){
            		$(this).parents("tr").remove();            		
            	});
            	
            	 $("#savebtn").click(function(){ 
                 	var importDetail = [];
                 		$('#tbllistimport tr').each(function(){
                 			json ={
                 						
                 						"proId"				: ($(this).find("td").eq(0).html()),
                 						"quantity" 		 	:($(this).find("td").eq(3).html()),
                 						"unitPrice"		    :($(this).find("td").eq(4).html()),
                 						"supplierId"	  	:($(this).find("td").eq(5).html())
                 					};
                 				importDetail.push(json);	
                 		}); 
                 		
                 		console.log( JSON.stringify(importDetail));
                 		 
     	 			$.ajax({
     	 				 url: "${pageContext.request.contextPath}/admin/importupdate/" + $("#impId").val(), 
      				    type: 'POST',
     	 				datatype: 'JSON',
     	 				data: JSON.stringify(importDetail), 
     	 				beforeSend: function(xhr) {
     	 		            xhr.setRequestHeader("Accept", "application/json");
     	 		            xhr.setRequestHeader("Content-Type", "application/json");
     	 		        },
     	 				success: function(data){
     	 					console.log(data);
     	 					location.href="${pageContext.request.contextPath}/admin/importlist";
     	 				},
     	 				error:function(data, status,er){
     	 					console.log("error: " + data + "status: " + status + "er: ");
     	 				}
     	 			});   
                 }); 
            	$(document).on("click","#addbtn",function(){ 
            		var st="";
            		st += "<tr><td style='display: none;'>" + $('#prodID').val() +"</td>";
            		st += "<td>" + ($("#tbllistimport tr").length + 1) +"</td>";
            		st += "<td>" + $("#productName").val() +"</td>";
            		st += "<td>" + $("#qty").val() +"</td>";
            		st += "<td>" + $("#UnitPrice").val() +"</td>";
            		st += "<td style='display: none;'>"+ $('#suppId').val() +"</td>";  
            		st += "<td>" + $("#supplierName").val() +"</td>";
            		st += "<td class='actions' style='text-align: center;'>";
            		st += "<a class='on-default edit-row' id='btnedit' href='javascript:;'><i class='fa fa-pencil'></i></a>";
            		st += " <a class='on-default remove-row' href='javascript:;' id='btnRemove'> <i class='fa fa-trash-o'></i></a></td>";
            		$("#tbllistimport").append(st);
            		clear();
            	});
            	
            	$(document).on("click"," #cancelbtnadd",function(){
            		$("#updatebtn").html("Add");
            		$("#updatebtn").attr("id","addbtn");
            		clear();            		
            	});
            	
            	$(document).on("click","#updatebtn",function(){ 

            		_thisRow.children().eq(0).html($("#prodID").val());
            		_thisRow.children().eq(5).html($("#suppId").val());
            		_thisRow.children().eq(2).html($("#productName").val());
            		_thisRow.children().eq(3).html($("#qty").val());
            		_thisRow.children().eq(4).html($("#UnitPrice").val());
            		_thisRow.children().eq(6).html($("#supplierName").val()); 
            		$("#updatebtn").html("Add");
            		$("#updatebtn").attr("id","addbtn");
            		clear();
            	});
            	
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
                
                
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
    				       var availableTags=[];
    				       for(i=0; i<data.length; i++)
		   						{							
    				    	   availableTags[i]= 
		   						         {
		   						         	"label": data[i].supplierName,
		   									"dataid": data[i].supId 
		   						         };
		   						}
    				       $("#supplierName" ).autocomplete({
    				    	   
    				    	   select: function(event, ui){
    				    		   $("#suppId").val(ui.item.dataid);
    				    	   },
    				    	   maxShowItems: 8,
    				           source: availableTags
    				       });  
    				    },
    				    error:function(data,status,er) { 
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				});
    				
    			}
                 
                function clear(){
            		$("#productName").val("");
            		$('#prodID').val("");
            		$('#suppId').val("");
            		$("#qty").val("");
            		$("#UnitPrice").val("");
            		$("#supplierName").val(""); 
            	}
                
                function searchProduct(){
    				$.ajax({ 
    				    url: "${pageContext.request.contextPath}/admin/searchproduct", 
    				    type: 'POST', 
    				    dataType: 'JSON', 
    				    beforeSend: function(xhr) {
    	                    xhr.setRequestHeader("Accept", "application/json ");
    	                    xhr.setRequestHeader("Content-Type", "application/json");
    	                },
    				    success: function(data) { 
    				       console.log(data); 
    				       var availableTags=[];
    				       for(i=0; i<data.length; i++)
		   						{							
    				    	   availableTags[i]= 
		   						         {
		   						         	"label": data[i].productName,
		   									"dataid": data[i].productId 
		   						         };
		   						}
    				       $("#productName" ).autocomplete({
    				    	   
    				    	   select: function(event, ui){
    				    		   $("#prodID").val(ui.item.dataid);
    				    	   },
    				    	   maxShowItems: 8,
    				           source: availableTags
    				       });
    				    },
    				    error:function(data,status,er) { 
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				});
    				
    			} 
    		 
            });
        </script>
    
    </body>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
  		<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.autocomplete.scroll.min.js"></script> 
</html>
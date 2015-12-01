<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@page import="com.kosign.wecafe.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kosign.wecafe.entities.Category"%>
<%@page import="java.util.List"%>
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
                <div class="content">                 
                    <div class="container">

                        <!-- Page-Title -->
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="pull-left page-title">Update Product</h4>
                            </div>
                        </div>
                        <!-- Form-validation -->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-default">
                                    <!-- <div class="panel-heading"><h3 class="panel-title">Form Add Product</h3></div> -->
                                    <div class="panel-body">
                                        <div class=" form">
                                            <form class="cmxform form-horizontal tasi-form" id="frmProductAdd" method="POST" action="/admin/product/update">
                                                <div class="form-group ">
                                                	<input type="hidden" id="productId" name="productId" type="text" value="${product.productId }"/>
                                                    <label for="productname" class="control-label col-lg-2">Product Name *</label>
                                                    <div class="col-lg-10">
                                                        <input class=" form-control" id="productName" name="productName" type="text" value="${product.productName }" required="required">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="category" class="control-label col-lg-2">Category *</label>
                                                    <div class="col-lg-10">
                                                       	<select class="form-control" id="optCategory" name="categoryId" required="required">
                                                       		<option value="">Please choose your category</option>
                                                       	<%
                                                       		List<Category> categories = (ArrayList<Category>)request.getAttribute("categories");
                                                     		Product product = (Product)request.getAttribute("product"); 
                                                    		for(Category category : categories){
                                                    			if(category.getCatId()== product.getCategory().getCatId()){
                                                    				out.println("<option value="+category.getCatId()+" selected>"+category.getCatName()+"</option>");
                                                    			}else{
                                                    				out.println("<option value="+category.getCatId()+">"+category.getCatName()+"</option>");
                                                    			}
                                                    		}
                                                       	%>
                                       
                                                       	</select>
                                                    </div>
                                                </div>
                                                <%-- <div class="form-group ">
                                                    <label for="quantity" class="control-label col-lg-2">Quantity *</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control " id="quantity" name="quantity" type="text" value="${product.quantity }" required="required">
                                                    </div>
                                                </div> --%>
                                                <div class="form-group ">
                                                    <label for="price" class="control-label col-lg-2">Unit Price *</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control " id="unitPrice" name="unitPrice" type="text" value="${product.unitPrice }" required="required">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="costprice" class="control-label col-lg-2">Cost Price</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control " id="costPrice" name="costPrice" type="text" value="${product.costPrice }" required="required">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="costprice" class="control-label col-lg-2">Sale Price</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control " id="salePrice" name="salePrice" type="text" value="${product.salePrice }" required="required">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="costprice" class="control-label col-lg-2">Image</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control " id="images" name="images" type="file" value="${product.image }" required="required">
                                                        <img id="images_sample" name="images_sample" src="${pageContext.request.contextPath}/resources/images/products/${product.image}" width="400px" height="400px" class="img-thumbnail"/>
                                                        <input type="hidden" id="image" name="image" value="${product.image}"/>
                                                    </div>
                                                </div>                                                                                            

                                                <div class="form-group">
                                                    <div class="col-lg-offset-2 col-lg-10">
                                                        <button class="btn btn-success waves-effect waves-light" type="submit">Save</button>
                                                        <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-default waves-effect" type="button">Cancel</a>
                                                    </div>
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
               
        <!-- CUSTOM JS -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>

        <!-- Chat -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.chat.js"></script>

        <!-- Todo -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.todo.js"></script>
        
        <script src="${pageContext.request.contextPath}/resources/assets/notifications/notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/notifications/notify-metro.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/notifications/notifications.js"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js"></script>
		
        <script type="text/javascript">
            /* ==============================================
            Counter Up
            =============================================== */
            jQuery(document).ready(function($) {
                $(document).on('keypress','#quantity, #unitPrice, #costPrice, #salePrice', function(e){

    				if((e.keyCode == 8) || (e.keyCode == 46) || ((e.keyCode >=37) && (e.keyCode <= 40)))
    					return ;

    			var data = String.fromCharCode(e.which);	
    					var reg = new RegExp('^[0-9]+$');
    		    	    if(!reg.test(data)){
    		    	    	e.preventDefault();
    					}
    			     });
            });
        </script>
    	<script type="text/javascript">
    		$(function(){
    			$("#frmProductAdd").submit(function(e){
    				e.preventDefault();    				
    				if($("#optCategory").val()==""){
    					alert("PLEASE CHOOSE THE CATEGORY");
    					return;
    				}
    				if($("#image").val()==""){
    					alert("PLEASE SELECT THE IMAGE.");
    					return;
    				}
    				/* json = {
    					"productId"   : $("#productId").val(),
    					"productName" : $("#productname").val(),
    					"category"    : {
    										"catId"	: $("#optCategory").val()
    					},
    					"quantity"    : $("#quantity").val(),
    					"unitPrice"   : $("#unitprice").val(),
    					"costPrice"	  : $("#costprice").val(),
    					"salePrice"   : $("#saleprice").val()
    				};
    				$.ajax({ 
    				    url: "${pageContext.request.contextPath}/admin/product/update", 
    				    type: 'POST', 
    				    dataType: 'JSON', 
    				    data: JSON.stringify(json), 
    				    beforeSend: function(xhr) {
    	                    xhr.setRequestHeader("Accept", "application/json");
    	                    xhr.setRequestHeader("Content-Type", "application/json");
    	                },
    				    success: function(data) { 
    				        if(data){
    				        	alert('YOU HAVE BEEN UPDATED SUCCESSFULLY.');
    				        	location.href="${pageContext.request.contextPath}/admin/products";
    				        }else{
    				        	alert('YOU HAVE ERRORS WHEN UPDATE A PRODUCT.');
    				        }
    				    },
    				    error:function(data,status,er) { 
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				}); */
    				
    				$("#frmProductAdd").ajaxSubmit({
    					url: "${pageContext.request.contextPath}/admin/product/update",
    					dataType: 'JSON', 
    					type: 'POST',
    					success: function(data) { 
    						console.log(data);
     				        if(data){
     				        	alert('YOU HAVE BEEN UPDATED SUCCESSFULLY.');
     				        	location.href="${pageContext.request.contextPath}/admin/products";
     				        }else{
     				        	alert('YOU HAVE ERRORS WHEN UPDATED EXISING PRODUCT.');
     				        }
     				    },
     				    error:function(data,status,er) { 
     				        console.log("error: "+data+" status: "+status+" er:"+er);
     				    }
    				});
    			});
    			
    			$("#images").change(function(){			
					$("#frmProductAdd").ajaxSubmit({
						url: "${pageContext.request.contextPath}/admin/rest/images/",
						dataType: 'JSON', 
						type: 'POST',
						success: function(data) { 
							console.log(data);
					        if(data){
					        	$("#images_sample").attr("src", "${pageContext.request.contextPath}/resources/images/products/"+data.IMAGE);
					        	$("#images_sample").show();
					        	$("#image").val(data.IMAGE);
					        	//alert('YOU HAVE BEEN INSERTED SUCCESSFULLY.');
					        }else{
					        	//alert('YOU HAVE ERRORS WHEN INSERT NEW PRODUCT.');
					        }
					    },
					    error:function(data,status,er) { 
					        console.log("error: "+data+" status: "+status+" er:"+er);
					    }
					});
				});
    		});
    	</script>
    </body>
</html>
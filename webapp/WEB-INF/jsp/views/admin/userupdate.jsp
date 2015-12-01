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
                                <h4 class="pull-left page-title">Add New User</h4>
                            </div>
                        </div>
                        <!-- Form-validation -->
                        <div class="row">
                        
                            <div class="col-sm-12">
                                <div class="panel panel-default">
                                    <!-- <div class="panel-heading"><h3 class="panel-title">Form Add Product</h3></div> -->
                                    <div class="panel-body">
                                        <div class=" form">
                                            <form class="cmxform form-horizontal tasi-form" id="frmUpdateUser" method="POST" action="${pageContext.request.contextPath}/admin/users/add" novalidate="novalidate">
                                                <div class="form-group ">
                                                    <label for="productname" class="control-label col-lg-2">First Name *</label>
                                                    <div class="col-lg-10">
                                                    <input class=" form-control" id="userId" name="id" type="hidden" value="${user.id }">
                                                        <input class=" form-control" id="firstName" name="firstName" type="text" value="${user.firstName }">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="productname" class="control-label col-lg-2">Last Name *</label>
                                                    <div class="col-lg-10">
                                                        <input class=" form-control" id="lastName" name="lastName" type="text" value="${user.lastName }">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="productname" class="control-label col-lg-2">Username *</label>
                                                    <div class="col-lg-10">
                                                        <input class=" form-control" id="username" name="username" type="text" value="${user.username }">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="costprice" class="control-label col-lg-2">Email *</label>
                                                    <div class="col-lg-10">
                                                        <input class="form-control " id="email" name="email" type="email" value="${user.email }">
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="category" class="control-label col-lg-2">Gender *</label>
                                                    <div class="col-lg-10">
                                                       	<select class="form-control" id="gender" name="gender">
                                                       		<option value="M">Male</option>
                                                       		<option value="F">Female</option>
                                                       	</select>
                                                    </div>
                                                </div>
                                                <div class="form-group ">
                                                    <label for="category" class="control-label col-lg-2">User Type *</label>
                                                    <div class="col-lg-10">
                                                       	<select class="form-control" id="USER_ROLE" name="">
                                                       		<option value="0">-- SELECT USER ROLE --</option>
                                                       		<c:forEach items="${roles}" var="role">
                                                       			<c:forEach items="${user.userRoles}" var="userRole">
	                                                       			<c:choose>
	                                                       			 <c:when test="${userRole.id==role.id}">
																	  	<option value="${role.id }" selected="selected">${role.type}</option>
																	  </c:when>
																      <c:when test="${userRole.id!=role.id}">
																      	<option value="${role.id }">${role.type}</option>
																	  </c:when>
																	</c:choose>
                                                       			</c:forEach>
				                                       		</c:forEach>
                                                       	</select>
                                                    </div>
                                                </div>
                                                
                                                

                                                <div class="form-group">
                                                    <div class="col-lg-offset-2 col-lg-10">
                                                        <button class="btn btn-success waves-effect waves-light" type="submit">Save</button>
                                                        <button class="btn btn-default waves-effect" id="btncancel" type="button">Cancel</button>
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
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js"></script>

        <script type="text/javascript">
            /* ==============================================
            Counter Up
            =============================================== */
            jQuery(document).ready(function($) {
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
            });
        </script>
        
        <script type="text/javascript">
        
    		$(function(){
    			$("#btncancel").click(function(){
    				location.href="${pageContext.request.contextPath}/admin/userlist";
    			});
    			$("#frmUpdateUser").submit(function(e){
    				e.preventDefault();    				
    				json = {
    					"id"		: $("#userId").val(),
    					"username"  : $("#username").val(),
    					"firstName" : $("#firstName").val(),
    					"lastName"  : $("#lastName").val(),
    					"email"	    : $("#email").val(),
    					"status"    : 1, //$("#status").val(),
    					"userRoles": [
    					              {
    					              	"id" : $("#USER_ROLE").val()
    						
    					              }]
    				};
    				
    				$.ajax({ 
    				    url: "${pageContext.request.contextPath}/admin/users/update", 
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
    				        	location.href="${pageContext.request.contextPath}/admin/userlist";
    				        }else{
    				        	alert('YOU HAVE ERRORS WHEN UPDATE USER.');
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
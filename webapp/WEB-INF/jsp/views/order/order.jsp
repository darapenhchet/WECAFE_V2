<%@page import="com.kosign.wecafe.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html lang="en">
<head>
  <title>Order Produce</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/xregexp-all.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
 #btnCart, .panel-body:hover{
  		cursor: pointer;
  }
  .panel-body img{
  	width: 80px;
  	height: 100px;
  }
  #addtocart{
  	width: 80%;
  }
  .modal-content{
  	border-radius: 0;
  }
  .hidebtn{
  	display : none;
  }
  </style>
</head>
<body>  	 
	<div>
  		<div id="mySlideShow" class="carousel slide" data-ride="carousel">  	
		    <ol class="carousel-indicators">
		      <li data-target="#mySlideShow" data-slide-to="0" class="active"></li>
		      <li data-target="#mySlideShow" data-slide-to="1"></li>
		      <li data-target="#mySlideShow" data-slide-to="2"></li>
		      <li data-target="#mySlideShow" data-slide-to="3"></li>
		    </ol>
    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	       
	      <c:forEach items="${slides }" var="slide" varStatus="index">
	      		<c:choose>
	      		<c:when test="${index.count == '1'}">
	      			<div class="item active">
	      		</c:when>
	      		<c:otherwise>
	      			<div class="item">
	      		</c:otherwise>
	      		</c:choose> 
	      		
		        <img src="${pageContext.request.contextPath}/resources/images/products/${slide.image}" alt="Chania" style="width: 100%; height: 955px;"> 
		      </div>
	      </c:forEach>
<%-- 	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Chania" style="width: 100%; height: 955px;">
	      </div>    
	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Flower" style="width: 100%; height: 955px;">
	      </div>
	      <div class="item">
	        <img src="${pageContext.request.contextPath}/resources/images/img/slide4.png" alt="Flower" style="width: 100%; height: 955px;">
	      </div> --%>
	    </div>
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#mySlideShow" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#mySlideShow" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	      
	    </a>
	  </div>
</div>		
			<div align="right">
				<!-- <label style="color: red; margin-right: -20px;"><b>(5)</b></label> -->
				 <img src="${pageContext.request.contextPath}/resources/images/img/add_to_cart.jpg" width="55px"  height="34px">
				<button type="button" id="btnCart" class="btn btn-primary"><span id="totalproduce" class="badge">0 </span> produce</button>
				<!-- <button type="button" id="btnCart" class="btn btn-primary">Add to Cart</button> -->
				<!-- <i class="fa fa-shopping-cart fa-3x"><span class="badge" style="background:red;">7</span> </i> -->
			</div> 
			 
				  
					<div id="myCarousel1" class="carousel slide"> 
					    <!-- Wrapper for slides -->
					    <div class="carousel-inner container" role="listbox" style="height: 888px; overflow: hidden; ">
					    	 <% 
					    	 List<Product> products = (List<Product>)request.getAttribute("products");
					    	 	int  A =  products.size(); 
					    	 	int i;
					    	 	boolean T = true;
						    	 do{
						    		 
						    		 if(T){ T=false;%>						    	 
						    			<div class="item active" style="width : 70%; margin: 0 auto;">
						    		<%}else {%>
						    			<div class="item" style="width : 70%; margin: 0 auto;">
						    		<%}%>	
							    		<div style="margin-top: 17%">	 
							    		<% 
							    		
							    		for(i = A-1; i>=A- 6 && i >=0; i--) 							    			
							    		{ %>	
					    									    									    	 
												<div class="col-sm-6">
													<div class="panel panel-default form-group">
														<div class="panel-body">
															<div style="float: left;">
<div id="idpro" style="display: none;"><%=products.get(i).getProductId()%></div>	
<img id="imgpro" src="${pageContext.request.contextPath}/resources/images/products/<%=products.get(i).getImage()%>"> 
															<span id="Proname">	 <%=products.get(i).getProductName()%></span>
															</div>
															<div style="text-align: right;"><span id="PRICE"><%=products.get(i).getSalePrice()%></span><span>&nbsp; Riels</span></div>
														</div>
													</div>
												</div>										 
							    		<% }%>
										</div>
								    </div>
								    
								  <%
								 if(A/6>=1)
								 {
									 A = A - 6; 
								 }
								 else 
									 A = 0; 
						    	 }while(A >=1 );  
						    	 %>
							 </div>
							 <!-- Left and right controls -->
					    <a class="left carousel-control" href="#myCarousel1" role="button" data-slide="prev">
					      <span class="glyphicon glyphicon-chevron-left"></span>
					      <span class="sr-only">Previous</span>
					    </a>
					    <a class="right carousel-control" href="#myCarousel1" role="button" data-slide="next">
					      <span class="glyphicon glyphicon-chevron-right"></span>
					      <span class="sr-only">Next</span>
					    </a>
					    </div> 
					</div>
 
 
<!-- ############################################################# -->
	<!-- Modal HTML -->
    <div id="myModal" style="display: none;" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true"><span class="button b-close"><span>×</span></span></button>
                    <h4 class="modal-title" id="protitle"></h4>
                </div>
                <div class="modal-body form-horizontal" style="height: 290px;">
               
                    <div class="col-sm-4">
						  <img id="imgpath" style="width: 150px; height: 250px; ">  			
					</div>
					<div class="col-sm-8 container">
						<div class="form-group">
						    <label class="control-label col-sm-3">Price :</label>
						      <div class="col-sm-9">
						        	<label class="control-label col-sm-3" id="MOD_PRICE"></label>
						      </div>
						       <div style="display: none;" id="proid"></div>
					    </div>   	
					    <div class="form-group">
					      	<label class="control-label col-sm-3" for="proqty">Qty :</label>
					      	<div class="col-sm-9">
					         <input type="text" class="form-control" maxlength="30" id="proqty"> 
					    	</div>
    					</div>	 
    					<div class="form-group">
					      	<label class="control-label col-sm-3" for="txtcomment">Comment:</label>
					      	<div class="col-sm-9">
					         <textarea id="procomment" cols="33" rows="4" style="resize: none;"></textarea> 
					    	</div>
    					</div>
					</div>
                </div>
                <div class="modal-footer" style="height: 80px; overflow: auto;">
                    <button type="button" class="btn btn-default hidebtn" id="btnAddToCart"><span class="button b-close"><span>Add to cart</span></span></button>
                    <button type="button" class="btn btn-default hidebtn" id="btnok"><span class="button b-close"><span>Ok</span></span></button>
                    <button type="button" class="btn btn-primary hidebtn" id="btn_buy"> <span class="button b-close"><span>Buy</span></span></button>
                    <button type="button" class="btn btn-default hidebtn" id="btncancelup"><span class="button b-close"><span>Cancel</span></span></button>
                </div>
            </div>
        </div>
    </div>
<!-- ############################################################# -->
 
  
  <div id="addtocart" style="display: none;" style="width: 80%;">       
  	<div class="modal-content"> 
  	 <div class="modal-header">                     
                     
                    <button type="button" class="close" aria-hidden="true"><span class="button b-close"><span>×</span></span></button>
                    <h4 class="modal-title"  >Cart</h4>
                
                </div>
                <div class="modal-body" style="height: 290px;">
								  <table class="table table-hover">
								    <thead>
								      <tr> 
								        <th>Produce Name</th>
								        <th>Price</th>
								        <th>Qty</th>
								        <th>Total Amount</th> 
								        <th>Comment</th>
								        <th></th>
								      </tr>
								    </thead>
								    <tbody id="orderdetail">
								      
								    </tbody>
								  </table>
						 
							<div class="form-horizontal">
								<div class="form-group">
								      	<label class="control-label col-sm-10" for="txtName">Total Amount :</label>
								      	<div class="col-sm-2">
								         	<input type="text" class="form-control" maxlength="30" name="txtName" readonly="readonly" id="totalamount" style="margin-bottom: 2px;"> 
								    	</div>
		    					</div>
		    				 						 
					   </div>
				</div>
				<div class="modal-footer" style="height: 80px;">
					<div align="right">
						<button type="button" id="btnbuymore" class="btn btn-default"><span class="button b-close"><span>Buy more</span></span></button>
						<button type="button" id="btnconfirm" class="btn btn-default"><span class="button b-close"><span>Confirm</span></span></button>
						<button type="button" id="btncancel" class="btn btn-default"><span class="button b-close"><span>Cancel Order</span></span></button>		
					</div>
				</div>
		</div>
	</div>
 
<!-- ################################################################## -->
<div style="width: 100%; height: 30px; background-color: #E0E0E0;" align="center">
	Copyright&#64; 2015 kosign
</div>

</body>
	<script type="text/javascript">
		$(document).ready(function(){
			var wsURI = "ws://" + document.location.host + "${pageContext.request.contextPath}/notification";
			if (!("WebSocket" in window)) {
				console.log("WebSocket is not support on your browser...")
			} else {
				console.log("WebSocket is support on your browser...");
			}
			var connection = new WebSocket(wsURI);
			var sendedMessage = "";
			connection.binaryType = 'arraybuffer';
		
			connection.onopen = function(event) {
				onOpen(event);
			}
		
			connection.onerror = function(event) {
				onError(event);
		
			}
			
			function onOpen(event) {
				console.log("CONNECTED...")
			}
		
			function onError(event) {
				console.log(event);
			}
		
			function sendMessage() {
				sendedMessage = "SENT";
				if (connection.readyState != WebSocket.OPEN) {
					return;
				}
				if (connection.bufferedAmount == 0) {
					connection.send("SENT");
				} 
			}
			getsizeSession();
			
			$(document).on('keypress','#proqty', function(e){

				if((e.keyCode == 8) || (e.keyCode == 46) || ((e.keyCode >=37) && (e.keyCode <= 40)))
					return ;

			var data = String.fromCharCode(e.which);	
					var reg = new RegExp('^[0-9]+$');
		    	    if(!reg.test(data)){
		    	    	e.preventDefault();
					}
			     });	
		 
			$("#btnconfirm").click(function(){
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/order/insertcartorder/", 
				    type: 'POST', 
				    dataType: 'JSON', 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				       console.log(data);
				       getsizeSession();
						
					   sendMessage();
				       
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
				
				clearallsession();
			});
			$("#btncancel").click(function(){
			clearallsession();
		//	getsizeSession();	
			});
		
			
			$(document).on('click','#btnedit',function(){
				$("#btnok").removeClass("hidebtn");
				$("#btncancelup").removeClass("hidebtn");
				$("#btnAddToCart").addClass("hidebtn");
				$("#btn_buy").addClass("hidebtn");
				
				
				var _this = $(this);
			  	$.ajax({ 
				    url: "${pageContext.request.contextPath}/order/editproduct/"+$(this).parent().parent().children().html(), 
				    type: 'POST', 
				    dataType: 'JSON', 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				    	$("#MOD_PRICE").html(data.unitPrice);
		      			$("#proqty").val(_this.parent().parent().children().eq(3).html()); 
		      			$("#procomment").val(_this.parent().parent().children().eq(5).html());
		      			$("#protitle").html(data.productName);
		      			$("#proid").html(data.productId);
		      			$("#imgpath").attr('src','${pageContext.request.contextPath}/resources/images/products/' + data.image);
		      			$("#myModal").bPopup();
				       
				    },
				    error:function(data,status,er) { 
				       console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});   
			});
		 
			
			$(document).on('click',"#btndelete",function(){
				 
				$("#totalamount").val($("#totalamount").val() - ($(this).parent().parent().children().eq(4).html()));
				
    				$.ajax({ 
    				    url: "${pageContext.request.contextPath}/order/removetocart/"+$(this).parent().parent().children().html(), 
    				    type: 'POST', 
    				    dataType: 'JSON', 
    				    beforeSend: function(xhr) {
    	                    xhr.setRequestHeader("Accept", "application/json");
    	                    xhr.setRequestHeader("Content-Type", "application/json");
    	                },
    				    success: function(data) { 
    				       console.log(data);
    				       getsizeSession();
    				    },
    				    error:function(data,status,er) { 
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				});
				$(this).parents("tr").remove();
			});
			
			
			$(".panel-body").click(function() {
				
				$("#btnAddToCart").removeClass("hidebtn");
				$("#btn_buy").removeClass("hidebtn");
				$("#btnok").addClass("hidebtn");
				$("#btncancelup").addClass("hidebtn");
				
				var produecID = ($(this).find("#idpro").html());
				clear();
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/order/listcart", 
				    type: 'POST', 
				    dataType: 'JSON', 
				    /* data: JSON.stringify(json), */ 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) {  
				      	  for(i=0; i<data.length; i++)
				      		  { 
				      		  	if(data[i].productId == produecID)
				      		  		 {
						      		  	$("#MOD_PRICE").html($(this).find("#PRICE").html());
						      			$("#proqty").val(data[i].quantity); 
						      			$("#procomment").val(data[i].comment);
						      			$("#protitle").html($(this).find("#Proname").html());
						      			$("#proid").html($(this).find("#idpro").html());
						      			$("#imgpath").attr('src',$(this).find("#imgpro").attr('src'));
						      			$("#myModal").bPopup();
						      			return;
						      		}
				      		  	 
				      		  }
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});		
				
				$("#MOD_PRICE").html($(this).find("#PRICE").html());
				$("#protitle").html($(this).find("#Proname").html());
				$("#proid").html($(this).find("#idpro").html());
				$("#imgpath").attr('src',$(this).find("#imgpro").attr('src'));
				$("#myModal").bPopup();
			});
			
			$("#btnCart").click(function(){
				listorderproduce();
			});
			
			$("#btn_buy , #btnok").click(function(){
				
				json = {
    					"productId"   : $("#proid").html(),
    					"productName" : $("#protitle").html().trim(),
    					"quantity"    : $("#proqty").val(),
    					"totalAmount" : $("#MOD_PRICE").html() * $("#proqty").val(), 
    					"price"    		: $("#MOD_PRICE").html(),
    					"comment"	  : $("#procomment").val()
    				};
    				$.ajax({ 
    				    url: "${pageContext.request.contextPath}/order/addtocart", 
    				    type: 'POST', 
    				    dataType: 'JSON', 
    				    data: JSON.stringify(json), 
    				    beforeSend: function(xhr) {
    	                    xhr.setRequestHeader("Accept", "application/json");
    	                    xhr.setRequestHeader("Content-Type", "application/json");
    	                },
    				    success: function(data) { 
    				        console.log(data);
    						listorderproduce();
    						getsizeSession();
    				    },
    				    error:function(data,status,er) { 
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				});
    				clear();
			});
			 
			function getsizeSession(){
				    $.ajax({ 
				    url: "${pageContext.request.contextPath}/order/listcart", 
				    type: 'POST', 
				    dataType: 'JSON', 
				    /* data: JSON.stringify(json), */ 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) {   
				    	$("#totalproduce").html(data.length);			    	
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});	 
				
			}
			
			
			function listorderproduce(){
				$("#addtocart").bPopup();				
				 var st=""; var amount=0;
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/order/listcart", 
				    type: 'POST', 
				    dataType: 'JSON', 
				    /* data: JSON.stringify(json), */ 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) {  
				      	for(i=0; i<data.length; i++)				    	  
				      	{
				    	  	st += "<tr><td style='display: none;'>" + data[i].productId +"</td>"
				    	  	st += "<td>" + data[i].productName + "</td>";
				    	  	st += "<td>" + data[i].price + "</td>";
				    	  	st += "<td>" + data[i].quantity + "</td>";
				    	  	st += "<td>" + data[i].totalAmount + "</td>"; 
				    	  	st += "<td>" + data[i].comment +"</td>";
				    	  	st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> | <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
				    	  	amount += data[i].totalAmount;
				    	}
				      	 $("#totalamount").val(amount);
				      	$("#orderdetail").html(st);
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});				
			}
			function clear(){
				$("#proqty").val(""); 
				$("#procomment").val("");
			}
			function clearallsession(){
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/order/removeAllFromCart/", 
				    type: 'POST', 
				    dataType: 'JSON', 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				       console.log(data);
				       getsizeSession();
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
				return ;
			}
    		$(function(){
    			$("#btnAddToCart").click(function(){
    				    
    					json = {
    					"productId"   : $("#proid").html(),
    					"productName" : $("#protitle").html().trim(),
    					"quantity"    : $("#proqty").val(),
    					"totalAmount" : $("#MOD_PRICE").html() * $("#proqty").val(), 
    					"price"    		: $("#MOD_PRICE").html(),
    					"comment"	  : $("#procomment").val()
    				};
    				$.ajax({ 
    				    url: "${pageContext.request.contextPath}/order/addtocart", 
    				    type: 'POST', 
    				    dataType: 'JSON', 
    				    data: JSON.stringify(json), 
    				    beforeSend: function(xhr) {
    	                    xhr.setRequestHeader("Accept", "application/json");
    	                    xhr.setRequestHeader("Content-Type", "application/json");
    	                },
    				    success: function(data) { 
    				       console.log(data);
    				       getsizeSession(); 
    				    },
    				    error:function(data,status,er) { 
    				        console.log("error: "+data+" status: "+status+" er:"+er);
    				    }
    				});
    				clear();
    			});
    		});

		}); 
    	</script>
</html>

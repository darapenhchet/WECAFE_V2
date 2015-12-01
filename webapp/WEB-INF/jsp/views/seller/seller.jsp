<%@page import="com.kosign.wecafe.forms.Cart"%>
<%@page import="com.kosign.wecafe.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}

.panel-body:hover {
	cursor: pointer;
}

.panel-body img {
	width: 80px;
	height: 100px;
}

#addtocart {
	width: 80%;
}

.modal-content {
	border-radius: 0;
}

.hidebtn {
	display: none;
}
</style>
</head>
<body>

	<div id="wrapper">


		<!-- Top Bar Start -->
		<%@ include file="topbar.jsp"%>
		<!-- Top Bar End -->
		<div>
			<button id="btnSendMessage">SEND MESSAGE</button>
			<input type="text" id="txtMessage" />
			<div style="width: 50%; float: left; margin-left: 3%;">
				<img
					src="${pageContext.request.contextPath}/resources/images/img/user.png"
					width="35px" height="35px"> <label class="control-label"
					id="cusname" style="color: blue; margin-right: 1%;">
					${user.username} </label>
				<button type="button" id="btnSignout" class="btn btn-warning">Sign
					Out</button>
			</div>
			<div align="right">

				<div style="float: right; margin-left: 10px;">
					<img
						src="${pageContext.request.contextPath}/resources/images/img/add_to_cart.jpg"
						width="55px" height="34px">
					<!-- <button type="button" id="btnCart" class="btn btn-primary">
						<span id="totalproduce" class="badge">0 </span> product
					</button> -->
				</div>
				<div>
					<img
						src="${pageContext.request.contextPath}/resources/images/img/order.png"
						width="55px" height="34px">
					<button type="button" class="btn btn-primary">
						<span class="badge">0 </span> Order
					</button>
				</div>
			</div>
		</div>

		<div id="myCarousel1" class="carousel slide">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 888px;">
				<%
					List<Product> products = (List<Product>) request.getAttribute("products");
					int A = products.size();
					int i;
					boolean T = true;
					do {
						if (T) {
							T = false;
				%>
				<div class="item active" style="width: 70%; margin: 0 auto;">
					<%
						} else {
					%>
					<div class="item" style="width: 70%; margin: 0 auto;">
						<%
							}
						%>
						<div style="margin-top: 17%">
							<%
								for (i = A - 1; i >= A - 6 && i >= 0; i--) {
							%><div class="col-sm-6">
								<div class="panel panel-default form-group">
									<div class="panel-body">
										<div style="float: left;">
											<div id="idpro" style="display: none;"><%=products.get(i).getProductId()%></div>
											<div style="width: 300px;">
												<img id="imgpro"
													src="${pageContext.request.contextPath}/resources/images/products/<%=products.get(i).getImage()%>">
												<span id="Proname"> <%=products.get(i).getProductName()%></span>
											</div>

											<input type="text" class="form-control"
												value="<%=products.get(i).getProductId()%>" id="pro_id"
												style="display: none;"> <input type="text"
												class="form-control"
												value="<%=products.get(i).getProductName()%>" id="pro_nm"
												style="display: none;">
										</div>
										<div style="text-align: right;">
											<span id="PRICE"><%=products.get(i).getSalePrice()%></span><span>&nbsp;
												Riels</span>
											<div>
												<br> <a href="#"> <span id="btnminus"
													class="glyphicon glyphicon-minus"></span>
												</a>
												<%
													List<Cart> carts = (List<Cart>) request.getAttribute("carts");
															boolean exist = false;
															for (Cart cart : carts) {
																if (cart.getProductId().equals(products.get(i).getProductId())) {
																	exist = true;
												%>
												<input name="orderqty" id='txtqty' type="text"
													readonly="readonly" style="width: 10%; text-align: center;"
													value="<%=cart.getQuantity()%>">
												<%
													}
															}
															if (!exist) {
												%>
												<input id='txtqty' name="orderqty" type="text"
													readonly="readonly" style="width: 10%; text-align: center;"
													value="<%=0%>">
												<%
													}
												%>

												<a href="#"> <span id="btnplus"
													class="glyphicon glyphicon-plus"></span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>

					<%
						if (A / 6 >= 1) {
								A = A - 6;
							} else
								A = 0;
						} while (A >= 1);
					%>
				</div>
				<!-- Left and right controls -->

				<%-- <c:forEach items="${products}" var="product">
								<div class="col-sm-6">
									<div class="panel panel-default form-group">
										<div class="panel-body">
											
											<div style="float: left;">
												<img id="img"
												
													src="${pageContext.request.contextPath}/resources/images/products/${product.image}">
													<input type="text" name="" value="${product.productName}" id="pro_nm" style="display: none;">
												<input type="text" name="" value="${product.productId}" id="pro_id" style="display: none;">
												${product.productName}
											</div>
											
											<div style="text-align: right;">0.5$</div>
										</div>
									</div>
								</div>
							</c:forEach> --%>
				<a class="left carousel-control" href="#myCarousel1" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel1" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>




		<!-- ############################################################# -->
		<!-- Modal HTML -->
		<div id="myModal" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" aria-hidden="true">
							<span class="button b-close"><span>×</span></span>
						</button>
						<h4 class="modal-title" id="productNm">Coca Cola</h4>
					</div>
					<div class="modal-body form-horizontal" style="height: 290px;">
						<div class="col-sm-4">
							<img
								src="${pageContext.request.contextPath}/resources/images/products/drink.jpg"
								style="height: 250px;">
						</div>
						<div class="col-sm-8 container">
							<div class="form-group">
								<label class="control-label col-sm-3">Price :</label>
								<div class="col-sm-9">
									<label class="control-label col-sm-3" id="productprice">0.5$</label>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="txtName">Qty
									:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" maxlength="30"
										name="txtName" id="qtytxt">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" id="comment"
									for="txtcomment">Comment:</label>
								<div class="col-sm-9">
									<textarea id="procomment" cols="33" rows="4"
										style="resize: none;"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="height: 80px; overflow: auto;">
						<button type="button" class="btn btn-default" id="btnUpdate">
							<span class="button b-close"><span>Update</span></span>
							<!-- 							<span style="display:none;" class='btnhidden' id='orderID'></span> -->
						</button>
						<button type="button" class="btn btn-primary" id="cancelbtn">
							<span class="button b-close"><span>Cancel</span></span>
						</button>
					</div>
				</div>
			</div>
		</div>







		<!-- ############################################################# -->
		<!-- 
		<div id="myModal"  style="display: none;"  style="display: none;" 
			style="left: 321px; position: absolute; top: 827.182px; z-index: 9999; opacity: 1;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" aria-hidden="true">
							<span class="button b-close"><span>×</span></span>
						</button>
						<h4 class="modal-title" id="title"></h4>
					</div>
					<div class="modal-body form-horizontal" style="height: 290px;">

						<div class="col-sm-4">
							<img id="imgpath" style="width: 150px; height: 250px;"
								src="/WeCafe/resources/images/products/6e5f3438-bfbd-43e8-a3d8-be6a12619187.gif">
						</div>
						<div class="col-sm-8 container">
							<div class="form-group">
								<label class="control-label col-sm-3">Price :</label>
								<div class="col-sm-9">
									<label class="control-label col-sm-3" id="price">2500.00</label>
								</div>
								<div style="display: none;" id="proid">34</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="proqty">Qty :</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" maxlength="30"
										id="proqty">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" id="comment" for="txtcomment">Comment:</label>
								<div class="col-sm-9">
									<textarea id="procomment" cols="33" rows="4"
										style="resize: none;"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="height: 80px; overflow: auto;">
						<button type="button" class="btn btn-default" id="btnAddToCart">
							<span class="button b-close"><span>Add to cart</span></span>
						</button>
						<button type="button" class="btn btn-default hidebtn" id="btnok">
							<span class="button b-close"><span>Ok</span></span>
						</button>
						<button type="button" class="btn btn-primary" id="btn_buy">
							<span class="button b-close"><span>Buy</span></span>
						</button>
						<button type="button" class="btn btn-default hidebtn"
							id="btncancelup">
							<span class="button b-close"><span>Cancel</span></span>
						</button>
					</div>
				</div>
			</div>
		</div> -->


		<!-- ############################################################# -->



		<!-- ############################################################# -->

		<div id="addtocart" style="display: none;" style="width: 80%;">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" aria-hidden="true">
						<span class="button b-close"><span>×</span></span>
					</button>
					<h4 class="modal-title">Cart</h4>

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
							<label class="control-label col-sm-10" for="txtName">Total
								Amount :</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" maxlength="30"
									readonly="readonly" name="txtName" id="totalamount"
									style="margin-bottom: 2px;">
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer" style="height: 80px;">
					<div align="right">
						<button type="button" id="btnbuymore" class="btn btn-default">
							<span class="button b-close"><span>Buy more</span></span>
						</button>
						<button type="button" id="btnconfirm"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Confirm</span></span>
						</button>
						<button type="button" id="btnconfirmorder"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Confirm</span></span>
						</button>
						<button type="button" id="btncancel"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Cancel Order</span></span>
						</button>
						<button type="button" id="btncancelorder"
							class="btn btn-default hidebtn">
							<span class="button b-close"><span>Cancel Order</span></span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>

		<!-- ======================================================================================= -->
	</div>
	<script>
		var resizefunc = [];
	</script>

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
		src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>

	<!-- CUSTOM JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>
</body>
<script type="text/javascript">
    var _orderid = 0;
    var _productid = 0;
    var _qty = 0;
    var _thisRow;
    $(document).ready(function() {
        getsizeSession();
        getordered();
        $(document).on('keypress', '#qtytxt', function(e) {
            if ((e.keyCode == 8) || (e.keyCode == 46) || ((e.keyCode >= 37) && (e.keyCode <= 40)))
                return;
            var data = String.fromCharCode(e.which);
            var reg = new RegExp('^[0-9]+$');
            if (!reg.test(data)) {
                e.preventDefault();
            }
        });
        $("#btnlistorder").click(function() {
            getordered();
        });
        $('#btncancelorder, #btnconfirmorder').click(function() {
            if ($(this).attr('id') == 'btncancelorder')
                var updatestatus = 'cancelOrder/';
            else
                var updatestatus = 'confirmOrder/';
            $.ajax({
                url: "${pageContext.request.contextPath}/seller/" + updatestatus + _orderid,
                type: 'GET',
                dataType: 'JSON',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
                success: function(data) {

                },
                error: function(data, status, er) {
                    console
                        .log("error: " + data + " status: " + status + " er:" + er);
                }
            });

            $("#totalorder")
                .html(
                    $("#totalorder")
                    .html() - 1);
        });

        $('#btncancel').click(function() {
            clearallsession();

            $('input[name="orderqty"]').val('0');

        });

        $(document)
            .on('click', '#cusordered',function() {
                    _this = $(this);
                    _orderid = (_this.find("#orderedId").html());
                    $("#btnconfirmorder").removeClass(
                        "hidebtn");
                    $("#btncancelorder").removeClass(
                        "hidebtn");
                    $("#btncancel").addClass("hidebtn");
                    $("#btnconfirm")
                        .addClass("hidebtn");
                    $
                        .ajax({
                            url: "${pageContext.request.contextPath}/seller/getOrderedDetail/" + _this
                                .find(
                                    "#orderedId")
                                .html(),
                            type: 'GET',
                            dataType: 'JSON',
                            beforeSend: function(
                                xhr) {
                                xhr
                                    .setRequestHeader(
                                        "Accept",
                                        "application/json");
                                xhr
                                    .setRequestHeader(
                                        "Content-Type",
                                        "application/json");
                            },
                            success: function(data) {
                                var st = ""; // var amount = 0;
                                console.log(data);
                                for (i = 0; i < data.length; i++) {
                                    st += "<tr><td style='display: none;'>" + data[i][2].productId + "</td>"
                                    st += "<td>" + data[i][2].productName + "</td>";
                                    st += "<td>" + data[i][0].proUnitPrice + "</td>";
                                    st += "<td>" + data[i][0].proQty + "</td>";
                                    st += "<td>" + (data[i][0].proUnitPrice * data[i][0].proQty) + "</td>";
                                    st += "<td>" + data[i][0].proComment + "</td>";
                                    st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
                                    //amount += data[i][1].orderAmount;
                                }
                                $("#totalamount")
                                    .val(
                                        data[0][1].orderAmount);
                                $("#orderdetail")
                                    .html(st);
                                $("#orderID")
                                    .html(
                                        data[0][1].orderId);
                                $("#addtocart")
                                    .bPopup();
                            },
                            error: function(data,
                                status, er) {
                                console
                                    .log("error: " + data + " status: " + status + " er:" + er);
                            }
                        });
                });

        function listproductorder() {
            var st = "";
            var amount = 0;
            $
                .ajax({
                    url: "${pageContext.request.contextPath}/seller/listtocart",
                    type: 'POST',
                    dataType: 'JSON',
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept",
                            "application/json");
                        xhr.setRequestHeader(
                            "Content-Type",
                            "application/json");
                    },
                    success: function(data) {
                        console.log(data);
                        for (i = 0; i < data.length; i++) {
                            st += "<tr><td id='pro_id' style='display: none;'>" + data[i].productId + "</td>"
                            st += "<td>" + data[i].productName + "</td>";
                            st += "<td>" + data[i].price + "</td>";
                            st += "<td>" + data[i].quantity + "</td>";
                            st += "<td>" + data[i].totalAmount + "</td>";
                            st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
                            amount += data[i].totalAmount;
                        }
                        $("#totalamount").val(amount);
                        $("#orderdetail").html(st);
                    },
                    error: function(data, stutus, er) {
                        console.log("error:  " + data + " status: " + status + " er:" + er)
                    }
                });
        }

        $("#bt_add, #btnCart").click(function() {
            $("#btncancel").removeClass("hidebtn");
            $("#btncancelorder").addClass("hidebtn");
            $("#btnconfirmorder").addClass("hidebtn");
            $("#btnconfirm").removeClass("hidebtn");
            listproductorder();
            $("#addtocart").bPopup();

        });

        $(document)

        .on(
            'click',
            "#btndelete, #btnminus, #btnedit,#cancelbtn",
            function() {
                _thisRow = $(this).parents("tr");
                var st = "";
                var _url = "";
                var amount = 0;
                _this = $(this);

                if (_this.html() == "Delete") {
                    var proId = $(this).parent()
                        .parent().children()
                        .eq(0).html();
                    alert("ppppppp" + proId);
                    var txt;
                    var msg = confirm("Do you want to delete Order Numeber" + _orderid + "\nand Product Number " + proId);
                    if (msg == true) {
                        $
                            .ajax({
                                url: "${pageContext.request.contextPath}/seller/deletedOrderProduct/" + _orderid + "/" + proId,
                                type: 'GET',
                                dataType: 'JSON',
                                beforeSend: function(
                                    xhr) {
                                    xhr
                                        .setRequestHeader(
                                            "Accept",
                                            "application/json");
                                    xhr
                                        .setRequestHeader(
                                            "Content-Type",
                                            "application/json");
                                },
                                success: function(
                                    data) {
                                    console
                                        .log(data);
                                },
                                error: function(
                                    data,
                                    status,
                                    er) {
                                    console
                                        .log("error: " + data + " status: " + status + " er:" + er);
                                }
                            });
                        txt = "Successful";
                    } else {
                        // 												        txt = "You pressed Cancel!";
                    }
                    document.getElementById("demo").innerHTML = txt;

                } else if (_this.html() == "Edit") {
                    _productid = $(this).parent()
                        .parent().children()
                        .eq(0).html();
                    var proId = $(this).parent()
                        .parent().children()
                        .eq(0).html();
                    $("#productNm").html(
                        $(this).parent()
                        .parent()
                        .children().eq(
                            1)
                        .html());
                    $("#productprice").html(
                        $(this).parent()
                        .parent()
                        .children().eq(
                            2)
                        .html());
                    $("#qtytxt").val(
                        $(this).parent()
                        .parent()
                        .children().eq(
                            3)
                        .html());
                    $("#procomment").val(
                        $(this).parent()
                        .parent()
                        .children().eq(
                            5)
                        .html());
                    $("#myModal").bPopup();
                } else if (_this.html() == "Cancel") {

                } else
                    var proId = $(this).parent()
                        .parent().children()
                        .html();

                // 											$.ajax({
                // 												_url = "${pageContext.request.contextPath}/seller/removetocart/"+ _orderid + "/"+ proId;
                // 														url : _url,
                // 														type : 'POST',
                // 														dataType : 'JSON',
                // 														beforeSend : function(
                // 																xhr) {
                // 															xhr
                // 																	.setRequestHeader(
                // 																			"Accept",
                // 																			"application/json");
                // 															xhr
                // 																	.setRequestHeader(
                // 																			"Content-Type",
                // 																			"application/json");
                // 														},
                // 														success : function(data) {

                // 															if (_this
                // 																	.parents(
                // 																			".panel-body")
                // 																	.find(
                // 																			"#txtqty")
                // 																	.val() == 1)
                // 																_this
                // 																		.parents(
                // 																				".panel-body")
                // 																		.find(
                // 																				"#txtqty")
                // 																		.val(
                // 																				"0");
                // 															for (i = 0; i < data.length; i++) {
                // 																if (data[i].quantity >= 1) {
                // 																	st += "<tr><td style='display: none;'>"
                // 																			+ data[i].productId
                // 																			+ "</td>"
                // 																	st += "<td>"
                // 																			+ data[i].productName
                // 																			+ "</td>";
                // 																	st += "<td>"
                // 																			+ data[i].price
                // 																			+ "</td>";
                // 																	st += "<td>"
                // 																			+ data[i].quantity
                // 																			+ "</td>";
                // 																	st += "<td>"
                // 																			+ data[i].totalAmount
                // 																			+ "</td>";
                // 																	st += "<td><a href= 'javascript:;' id='btnedit'>Edit</a> <a href='javascript:;' id='btndelete'>Delete</a></td></tr>";
                // 																	amount += data[i].totalAmount;
                // 																}

                // 																if (data[i].productId == proId) {
                // 																	_this
                // 																			.parents(
                // 																					".panel-body")
                // 																			.find(
                // 																					"#txtqty")
                // 																			.val(
                // 																					data[i].quantity);
                // 																}

                // 															}

                // 															$("#totalamount")
                // 																	.val(amount);
                // 															$("#orderdetail")
                // 																	.html(st);
                // 															getsizeSession();
                // 														},
                // 														error : function(data,
                // 																status, er) {
                // 															console.log("error: " + data + " status: "
                // 																			+ status
                // 																			+ " er:"
                // 																			+ er);
                // 														}
                // 													});

            });

        $("#btnUpdate")
            .click(
                function() {
                    _qty = $("#qtytxt").val();
                    $
                        .ajax({
                            url: "${pageContext.request.contextPath}/seller/updateOrderProduct/" + _orderid + "/" + _productid + "/" + _qty,
                            type: 'GET',
                            dataType: 'JSON',
                            beforeSend: function(
                                xhr) {
                                xhr
                                    .setRequestHeader(
                                        "Accept",
                                        "application/json");
                                xhr
                                    .setRequestHeader(
                                        "Content-Type",
                                        "application/json");
                            },
                            success: function(data) {
                                var subtotal = $(
                                        "#qtytxt")
                                    .val() * _thisRow
                                    .children()
                                    .eq(
                                        2)
                                    .html();
                                var totalamount = $(
                                        "#totalamount")
                                    .val() - _thisRow
                                    .children()
                                    .eq(
                                        4)
                                    .html();

                                _thisRow
                                    .children()
                                    .eq(3)
                                    .html(
                                        $(
                                            "#qtytxt")
                                        .val());
                                _thisRow
                                    .children()
                                    .eq(4)
                                    .html(
                                        subtotal);
                                _thisRow
                                    .children()
                                    .eq(5)
                                    .html(
                                        $(
                                            "#procomment")
                                        .html());
                                $("#totalamount")
                                    .val(
                                        subtotal + totalamount);
                            },
                            error: function(data,
                                status, er) {
                                console
                                    .log("error: " + data + " status: " + status + " er:" + er);
                            }
                        });
                });
        $(document)
            .on(
                'click',
                '#btnplus',
                function() {

                    var proNm = $(this).parents(
                        ".panel-body").find(
                        "#pro_nm").val();
                    var proId = $(this).parents(
                        ".panel-body").find(
                        "#pro_id").val();
                    var price = $(this).parents(
                        ".panel-body").find(
                        "#PRICE").html();
                    var price = $(this).parents(
                        ".panel-body").find(
                        "#PRICE").html();
                    var proqty = 1;
                    var _this = $(this);
                    var totalAmount = proqty * price;
                    console.log(totalAmount);
                    json = {
                        "productId": proId,
                        "productName": proNm,
                        "price": price,
                        "quantity": proqty,
                        "totalAmount": totalAmount
                    };
                    $
                        .ajax({
                            url: "${pageContext.request.contextPath}/seller/addtocart",
                            type: 'POST',
                            datatype: 'JSON',
                            data: JSON
                                .stringify(json),
                            beforeSend: function(
                                xhr) {
                                xhr
                                    .setRequestHeader(
                                        "Accept",
                                        "application/json");
                                xhr
                                    .setRequestHeader(
                                        "Content-Type",
                                        "application/json");
                            },
                            success: function(data) {
                                getsizeSession();
                                for (i = 0; i < data.length; i++) {
                                    if (data[i].productId == proId) {
                                        _this
                                            .parents(
                                                ".panel-body")
                                            .find(
                                                "#txtqty")
                                            .val(
                                                data[i].quantity);
                                        break;
                                    }
                                }
                            },
                            error: function(data,
                                status, er) {
                                console
                                    .log("error: " + data + "status: " + status + "er: ");
                            }
                        });
                });

        $("#btnconfirm")
            .click(
                function() {
                    $
                        .ajax({
                            url: "${pageContext.request.contextPath}/seller/insertcartsell",
                            type: 'POST',
                            datatype: 'JSON',
                            data: JSON
                                .stringify(json),
                            beforeSend: function(
                                xhr) {
                                xhr
                                    .setRequestHeader(
                                        "Accept",
                                        "application/json");
                                xhr
                                    .setRequestHeader(
                                        "Content-Type",
                                        "application/json");
                            },
                            success: function(data) {
                                clearallsession();
                                $(
                                        'input[name="orderqty"]')
                                    .val('0');
                            },
                            error: function(data,
                                status, er) {
                                console
                                    .log("error: " + data + "status: " + status + "er: ");
                            }
                        });
                });

        function getsizeSession() {
            $.ajax({
                url: "${pageContext.request.contextPath}/order/listcart",
                type: 'POST',
                dataType: 'JSON',
                /* data: JSON.stringify(json), */
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept",
                        "application/json");
                    xhr.setRequestHeader(
                        "Content-Type",
                        "application/json");
                },
                success: function(data) {
                    $("#totalproduce")
                        .html(data.length);
                },
                error: function(data, status, er) {
                    console.log("error: " + data + " status: " + status + " er:" + er);
                }
            });

        }

        function clearallsession() {
            $
                .ajax({
                    url: "${pageContext.request.contextPath}/order/removeAllFromCart/",
                    type: 'POST',
                    dataType: 'JSON',
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept",
                            "application/json");
                        xhr.setRequestHeader(
                            "Content-Type",
                            "application/json");
                    },
                    success: function(data) {
                        console.log(data);
                        getsizeSession();
                    },
                    error: function(data, status, er) {
                        console.log("error: " + data + " status: " + status + " er:" + er);
                    }
                });
            return;
        }

        function getordered() {
            $
                .ajax({
                    url: "${pageContext.request.contextPath}/seller/getordered",
                    type: 'POST',
                    dataType: 'JSON',
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept",
                            "application/json");
                        xhr.setRequestHeader(
                            "Content-Type",
                            "application/json");
                    },
                    success: function(data) {
                        st = "";
                        console.log(data);
                        $("#totalorder").html(data.length);
                        for (i = 0; i < data.length; i++) {
                            st += "<a href='javascript:void(0);' id='cusordered' class='list-group-item'><div class='media'><div class='media-body clearfix'>- <span id='cusName'>" + data[i].customer.username + "</span> (<span id='cusorderqty'>" + data[i].orderQuantity + "</span>)</div></div>"
                            st += "<div style='display: none;' id='orderedId'>" + data[i].orderId + "</div></a>"
                        }
                        $("#listorder").html(st);
                    },
                    error: function(data, status, er) {
                        console.log("error: " + data + " status: " + status + " er:" + er);
                    }
                });
            return;

        }

        var wsURI = "ws://" + document.location.host + "${pageContext.request.contextPath}/notification";
        if (!("WebSocket" in window)) {
            console
                .log("WebSocket is not support on your browser...")
        } else {
            console
                .log("WebSocket is support on your browser...");
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

        connection.onmessage = function(event) {
            console.log("MESSAGE...")
            onMessage(event);
        }

        function onOpen(event) {
            console.log("CONNECTED...")
        }

        function onError(event) {
            console.log(event);
        }

        function onMessage(event) {
            console.log(event.data);
            if (sendedMessage == event.data) {
                return;
            }
            console.log(event.data);
            if (event.data == "SENT") {
                getsizeSession();
                getordered();
            }
        }
    });
</script>
</html>
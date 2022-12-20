<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/payment.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Thanh toán</title>
<script>
		$(document).ready(function(){
		    var price = ${Thiep.giaTien};
		    var value = $(".input-qty").attr('value');
		    $(".input-qty").change(function(){
		    	if(this.value !== value) {
		    		value = this.value;
		    		var total = value*price;
		    		if(value>=1&&value<=${Thiep.soLuongTon})
		    			$(".total").text(total+".0");
		    		else
		    			$(".total").text("0");
		    	}
		    	if(this.value==""){
		    		$(".btn-payment").prop('disabled', true);
		    		document.getElementById("error_sl").hidden=false;
		    	}
		    	else{
		    		$(".btn-payment").prop('disabled', false);
		    		document.getElementById("error_sl").hidden=true;
		    	}
		    })  
		})
    </script>
</head>
<body>
	<header id="header">
		<div class="header__top">
			<div class="grid option-menu">
				<div class="time-contact icon-menu">
					<i class='bx bx-phone-call'></i> <span>Hotline:</span> <a
						href="tel:0909030509">0909 030 509</a>
				</div>
				<form:form class="search" action="search" method="get">
					<input type="text" class="search__input" placeholder="Tìm kiếm..."
						name="keyword">
					<button class="search__btn" value="Search">
						<i class='bx bx-search'></i>
					</button>
				</form:form>
				<div class="acc-cart">
					<security:authorize access="hasRole('ROLE_NV')">
						<div class="acc-cart--item account manage icon-menu">
							<i class='bx bxs-add-to-queue'></i> <span>Quản lý</span>
							<ul class='acc-list'>
								<li><a
									href="${pageContext.request.contextPath}/product/showPageProductManage">Quản
										lý sản phẩm</a></li>
								<li><a
									href="${pageContext.request.contextPath}/invoice/showPageInvoiceManage">Quản
										lý đơn hàng</a></li>
							</ul>
						</div>
					</security:authorize>
					<div class="acc-cart--item account icon-menu">
						<i class='bx bx-user'></i>
						<security:authorize access="!hasAnyRole('ROLE_KH','ROLE_NV')">
							<span>Tài khoản </span>
						</security:authorize>
						<security:authorize access="hasAnyRole('ROLE_KH','ROLE_NV')">
							<span> <security:authentication
									property="principal.username" /> <security:authentication
									property="principal.authorities" />
							</span>
						</security:authorize>
						<ul class='acc-list'>
							<security:authorize access="!hasAnyRole('ROLE_KH','ROLE_NV')">
								<li><a
									href="${pageContext.request.contextPath}/register/showMyRegisterPage">Đăng
										ký</a></li>
								<li><a
									href="${pageContext.request.contextPath}/showMyLoginPage">Đăng
										nhập</a></li>
							</security:authorize>
							<security:authorize access="hasAnyRole('ROLE_KH','ROLE_NV')">
								<security:authentication var="userName"
									property="principal.username" />
							</security:authorize>
							<c:url var="listHDUrl" value="/invoice/showPageInvoiceCustomer">
								<c:param name="user" value="${userName}" />
							</c:url>
							<security:authorize access="hasAnyRole('ROLE_KH','ROLE_NV')">
								<c:if test="${param.error == null}">
									<li><a href="${listHDUrl}">Đơn hàng</a></li>
									<li><form:form
											action="${pageContext.request.contextPath}/logout"
											method="POST">
											<input type="submit" value="Đăng xuất" class="logout-btn">
										</form:form></li>
								</c:if>
							</security:authorize>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="header__bottom">
			<div class="grid navbar">
				<div class="navbar-logo">
					<a href="${pageContext.request.contextPath}/"> <img
						src="${pageContext.request.contextPath}/resources/img/logo.jpg"
						alt="Logo thiệp cưới forever">
					</a>
				</div>
				<ul class="navbar-list">
					<li class="navbar-item"><a
						href="${pageContext.request.contextPath}/">Trang chủ</a></li>
					<li class="navbar-item wedding"><a href="">Thiệp cưới </a> <!-- <ul class='list-product-wedding'>
							<li><a href="">Thiệp cưới cao cấp</a></li>
							<li><a href="">Thiệp cưới tối giãn</a></li>
							<li><a href="">Thiệp cưới vẽ màu nước</a></li>
							<li><a href="">Thiệp cưới in hình</a></li>
						</ul> --></li>
					<li class="navbar-item event"><a href="">Thiệp sự kiện </a> <!-- <ul class='list-product-event'>
							<li><a href="">Thiệp sinh nhật</a></li>
							<li><a href="">Thiệp thôi nôi</a></li>
						</ul> --></li>
					<li class="navbar-item"><a href="">Hỏi đáp</a></li>
					<li class="navbar-item"><a href="">Tin tức</a></li>
					<li class="navbar-item"><a href="">Liên hệ</a></li>
				</ul>
			</div>
		</div>
	</header>
	<div class="line"></div>
	<article class="article">
		<c:url var="saveUrl" value="/invoice/saveInvoice" />
		<div class="right">
			<H3>THÔNG TIN THANH TOÁN</H3>
			<form:form modelAttribute="Detail_HoaDon" method="POST"
				action="${saveUrl}">
				<form:hidden path="maHD" />
				<form:hidden path="maCTHD" />
				<form:hidden path="username" value="${userName}" />
				<form:hidden path="maThiep" value="${Thiep.maThiep}" />
				<form:hidden path="donGia" value="${Thiep.giaTien}" />
				<div>
					<label>Họ tên</label>
					<form:input path="hoTenNguoiNhan" placeholder="Họ tên.."
						class="form-control" />
					<form:errors path="hoTenNguoiNhan" cssClass="error-message" />
				</div>
				<div>
					<label>Số điện thoại</label>
					<form:input path="sDT" placeholder="Số điện thoại.."
						class="form-control" />
					<form:errors path="sDT" Class="error-message" />
				</div>
				<div>
					<label>Địa chỉ</label>
					<form:input path="diaChi" placeholder="Địa chỉ.."
						class="form-control" />
					<form:errors path="diaChi" Class="error-message" />
				</div>
		</div>
		<div class="left">
			<H3>ĐƠN HÀNG CỦA BẠN</H3>
			<table class="table">
				<tr class="cart-subtotal">
					<th>SẢN PHẨM</th>
					<th></th>
					<th>SỐ LƯỢNG</th>
					<th>TỔNG CỘNG</th>
				</tr>
				<tr class="order-total">
					<td><img src="${Thiep.hinhAnh}" alt="Sản phẩm" width="80px"
						height="80px"></td>
					<td>${Thiep.tenThiep}</td>
					<td><form:input path="soLuongMua" aria-label="quantity"
							class="input-qty" max="${Thiep.soLuongTon}" min="1" type="number"
							value="1" /> <span>Max:${Thiep.soLuongTon}</span>	
					</td>
					<td><span class="total">${Thiep.giaTien}</span> <span>&nbsp;<sup>&#8363;</sup></span>
					</td>
				</tr>
			</table>
			<span class="error-message" id="error_sl" hidden="false">Vui lòng nhập số lượng!</span>
			<button type="submit" class="btn-payment" style="width: 100%;">THANH
				TOÁN</button>
		</div>
		</form:form>

		<br style="clear: both;" />
	</article>

	<footer id="footer">
		<div class="grid">
			<div class="footer__top">
				<div class="footer__top-item footer__top-center col-4">
					<a href="" class="logo__footer"> <img
						src="${pageContext.request.contextPath}/resources/img/logo.jpg"
						alt="logo">
					</a>
					<p class="desc">Chúng tôi có một quy trình khép kín từ khâu
						thiết kế, in ấn đến gia công. Chính vì thế chúng tôi chủ động
						trong mọi việc của mình. Hơn thế nữa, chúng tôi là một tập thể rất
						yêu quý công việc của mình. Chúng tôi làm việc bằng chính niềm đam
						mê và lòng nhiệt quyết của chính mình.</p>
					<ul class="social">
						<li><a href=""><i class='bx bxl-twitter'></i></a></li>
						<li><a href=""><i class='bx bxl-facebook'></i></a></li>
						<li><a href=""><i class='bx bxl-pinterest-alt'></i></a></li>
						<li><a href=""><i class='bx bxl-google-plus'></i></a></li>
						<li><a href=""><i class='bx bxl-youtube'></i></a></li>
					</ul>
				</div>
				<div class="footer__top-item col-4">
					<h2 class="title">LIÊN HỆ VỚI CHÚNG TÔI</h2>
					<div class="desc">
						<p>
							<i class='bx bxs-home-alt-2'></i>THIỆP CƯỚI CAO CẤP FOREVER
						</p>
						<p>
							<i class='bx bxs-map'></i>Địa chỉ: Nguyễn Văn Bảo , phường 5 , Gò
							Vấp , TPHCM
						</p>
						<p>
							<i class='bx bx-phone-call'></i>Hotline:<a href="tel:0909030509">0909
								030 509</a>
						</p>
						<p>
							<i class='bx bxs-envelope'></i>Email: <a
								href="mailto:nhom10www@gmail.com">nhom10www@gmail.com</a>
						</p>
						<p>
							<i class='bx bxs-time'></i>Giờ làm việc: 9h - 21h, 7 ngày trong
							tuần
						</p>
					</div>
				</div>
				<div class="footer__top-item col-4">
					<h2 class="title">ĐĂNG KÝ NHẬN TIN</h2>
					<p class="desc">Đừng bỏ lỡ những sản phẩm và chương trình
						khuyến mãi hấp dẫn</p>
					<form action="" class="form__footer">
						<input type="text" class="form__footer--input"
							placeholder="Email của bạn"> <input type="submit"
							class="form__footer--btn" value="ĐĂNG KÝ">
					</form>
				</div>
			</div>
			<div class="line__footer"></div>
			<div class="footer__bottom">
				<p>
					© Bản quyền thuộc về THIỆP CƯỚI CAO CẤP FOREVER | Cung cấp bởi <a
						href="">Sapo</a>
				</p>
			</div>
		</div>
	</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.jpg" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lienhe.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
	<link
	href="https://fonts.googleapis.com/css?family=Bentham|Playfair+Display|Raleway:400,500|Suranna|Trocchi"
	rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
<title>Liên hệ</title>
<script>
	function login() {
		  swal({
				title: "Đăng nhập để mua hàng", 
				type: "warning",
				confirmButtonText: "Đăng nhập",
				showCancelButton: true
		    })
		    	.then((result) => {
					if (result.value) {
					    window.location = '${pageContext.request.contextPath}/showMyLoginPage';
					} 
				})
	}
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
						<span>Tài khoản
						</span>
					</security:authorize>
					<security:authorize access="hasAnyRole('ROLE_KH','ROLE_NV')">
						<span> <security:authentication
								property="principal.username" /> <security:authentication
								property="principal.authorities" />
						</span>
					</security:authorize>
						<ul class='acc-list'>
								<security:authorize access="!hasAnyRole('ROLE_KH','ROLE_NV')">
									<li><a href="${pageContext.request.contextPath}/register/showMyRegisterPage">Đăng ký</a></li>
									<li><a href="${pageContext.request.contextPath}/showMyLoginPage">Đăng nhập</a></li>
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
						
						
						
					<c:url var="listFilterUrlOne" value="/filter">
							<c:param name="maLoai" value="1"/>
					</c:url>
					<c:url var="listFilterUrlTwo" value="/filter">
							<c:param name="maLoai" value="2"/>
					</c:url>
					<li class="navbar-item wedding"><a href="${listFilterUrlOne}">Thiệp cưới </a> </li>
					<li class="navbar-item event"><a href="${listFilterUrlTwo}">Thiệp sự kiện </a></li>
					<li class="navbar-item"><a href="${pageContext.request.contextPath}/showQ&A">Hỏi đáp</a></li>
					<li class="navbar-item"><a href="${pageContext.request.contextPath}/showTrendPage">Xu hướng</a></li>
					<li class="navbar-item"><a href="${pageContext.request.contextPath}/showcontact">Liên hệ</a></li>
				</ul>
			</div>
		</div>
	</header>
	<div class="line"></div>
	 <div class="container">
      
        <div class="wrapper">
            <div class="product-img" >
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.0454338135005!2d106.69992221533441!3d10.80783226156729!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528bf0618558b%3A0x734ca668b4d05dc1!2zMjIyIELDuWkgxJDDrG5oIFR1w70sIFBoxrDhu51uZyAxMiwgQsOsbmggVGjhuqFuaCwgVGjDoG5oIHBo4buRIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1652159353078!5m2!1svi!2s" width="500" height="700" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="product-info">
               
                <div class="Contact">
                   
                <div class=".product-text">
                    <div class="footer__top-item ">
                        <h2 class="title">LIÊN HỆ VỚI CHÚNG TÔI</h2>
                        
                    </div>
                </div>
                    
                    <form action="https://docs.google.com/forms/d/e/1FAIpQLSd9szpe1arnzAJWFWsKWtEhuNByMdLDd1BXysOYelxiS2uStw/formResponse?embedded=true" class="blockform" id="form_dathang" method="POST" onsubmit="return emptycart()" style="display: block;" target="hidden_iframe">
                     <div class="Contact">
                   <fieldset>
                        
                            <legend><span class="number">1</span> Thông tin</legend>
                            <input type="text" name="entry.207526578" placeholder="Họ & Tên *" dir="auto" required="" value="">
                            <input type="email" name="entry.1574817216" placeholder="Email *" dir="auto" required="" value="">
                            <input type="tel" name="entry.1843697505" placeholder="Số điện thoại *" dir="auto" required="" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" value="">
                            
                        </fieldset>
                        <fieldset>
                            <legend><span class="number">2</span> Lời nhắn</legend>
                            <textarea name="entry.1441612600" placeholder="Lời nhắn" dir="auto" required="" value="" rows="5"></textarea>
                        </fieldset>
                        <input type="submit" id="btn" value="Gửi thông tin" /> </div></form>
              
                <script language="javascript">
                    var button = document.getElementById("btn");
                    button.onclick = function(){
                        alert("Đã gửi thành công. Cảm ơn bạn đã liên hệ");
                    }
                </script>
            </div>
           
          </div> 
    </div>
	
	
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
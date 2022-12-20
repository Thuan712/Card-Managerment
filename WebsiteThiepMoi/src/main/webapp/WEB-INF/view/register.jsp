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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.jpg" type="image/x-icon" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login_register.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<title>Register</title>
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
					<div class="acc-cart--item account icon-menu">
						<i class='bx bx-user'></i> <span>Tài khoản</span>
						<ul class='acc-list'>
							<li><a
								href="${pageContext.request.contextPath}/showMyLoginPage">Đăng
									nhập</a></li>
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

	<div class="body">
		<div class="container">
			<div class="forms">
				<div class="form register">
					<div style="position:relative;" class="title">Register</div>
					<c:if test="${registrationSuccess != null}">
						<i style="color: green;font-size:15px;position:absolute;">${registrationSuccess}</i>
					</c:if>
					
					
					<form:form
						action="${pageContext.request.contextPath}/register/processRegistrationForm"
						 modelAttribute="crmUser">
						 
						<div class="input-field">
							<form:input type="text" path="userName"  placeholder="Username"
								class="form-control"/> <i
								class='bx bxs-user icon'></i>
								<c:if test="${registrationError != null}">
						<i  style="color: red;font-size:14px;margin-top:5px"> ${registrationError}</i>
					</c:if> 
								<form:errors path="userName" style="color: red;font-size:14px;margin-top:5px"/>
					
					
							
						</div>
						
						<div class="input-field">
							<form:password  path="password" 
								placeholder="Password" class="form-control ippw"/>
							<i class='bx bxs-lock-alt icon'></i> 
							<i class='bx bxs-low-vision iconpw toggle'></i>
							
							<form:errors path="password" style="color: red;font-size:14px;margin-top:5px"/>
						</div>
						
						 <div class="input-field">
							<form:password  path="confirmpassword" 
								placeholder="Confirm password" class="form-control ippwcf"/> 
								<i class='bx bxs-lock-alt icon'></i> 
								<i class='bx bxs-low-vision iconpw togglecfpw'></i>
								<c:if test="${registrationPassword != null}">
						<i  style="color: red;font-size:14px;margin-top:5px"> ${registrationPassword}</i>
					</c:if> 
								<form:errors path="confirmpassword" style="color: red;font-size:14px;margin-top:5px"/>
						</div>
						<input type="submit" value="ĐĂNG KÝ" class="form-btn">
					</form:form>
					<div class="form-link">
						Nếu đã có tài khoản, <a
							href="${pageContext.request.contextPath}/showMyLoginPage">đăng
							nhập tại đây</a>
					</div>
				</div>
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
<script>
    const toggle = document.querySelector('.toggle')
    const inputpw = document.querySelector('.ippw')
    toggle.addEventListener('click', () => {
        if (inputpw.type === "password") {
            inputpw.type = "text"
            toggle.classList.replace('bxs-low-vision', 'bxs-show')
        } else {
            inputpw.type = "password"
            toggle.classList.replace('bxs-show', 'bxs-low-vision')
        }
    })


    const togglecfpw = document.querySelector('.togglecfpw')
    const ippwcf = document.querySelector('.ippwcf')
    togglecfpw.addEventListener('click', () => {
        if (ippwcf.type === "password") {
            ippwcf.type = "text"
            togglecfpw.classList.replace('bxs-low-vision', 'bxs-show')
        } else {
            ippwcf.type = "password"
            togglecfpw.classList.replace('bxs-show', 'bxs-low-vision')
        }
    })
</script>
</body>
</html>
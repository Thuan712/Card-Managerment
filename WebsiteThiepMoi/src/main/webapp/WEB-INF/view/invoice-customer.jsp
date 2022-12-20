<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	href="${pageContext.request.contextPath}/resources/css/invoice-customer.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<title>Thông tin đơn hàng</title>
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
								<li><a href="${pageContext.request.contextPath}/product/showPageProductManage">Quản lý sản phẩm</a></li>
								<li><a href="${pageContext.request.contextPath}/invoice/showPageInvoiceManage">Quản lý đơn hàng</a></li>
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
					<li class="navbar-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
					
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
        <div class="grid">
            <h3 class="page_title">Danh sách đơn hàng</h3>
        </div>
        <div class="grid_invoice">
           
            <ul class="list-invoice">
				<c:forEach items="${ListHD}" var="tempHD">
	                <li class="invoice-item row-invoice">
                    <div class="invoice-item-img col-3">
                     <c:forEach var="ctsp" items="${tempHD.cthds}">
                     <c:set var = "anhThiep"  value = "${ctsp.thiep.hinhAnh}"/>
	                        	
	                        </c:forEach>
                   
                        <img src="${anhThiep}" alt="anhThiep">
                    </div>
                    <div class="invoice-item-info col-9">
                        <div class="invoice-item-name">
	                        <c:forEach var="ctsp" items="${tempHD.cthds}">
	                        	${ctsp.thiep.tenThiep}
	                        </c:forEach>
                        </div>
                        <div class="line_item"></div>
                        <div class="invoice-item-desc">
                        	<c:forEach var="ctsp" items="${tempHD.cthds}">
	                        	${ctsp.thiep.moTa}
	                        </c:forEach>
                        </div>
                        <div class="invoice-item-name-person">
                            Họ tên người nhận:<span>${tempHD.hoTenNguoiNhan}</span>
                        </div>
                        <div class="invoice-item-phone">
                            Số điện thoại:<span>${tempHD.sDT}</span>
                        </div>
                        <div class="invoice-item-address">
                            Địa chỉ:<span>${tempHD.diaChi}</span>
                        </div>
                        <div class="invoice-item-address">
                            Ngày mua hàng:<span>${tempHD.ngayLapHD}</span>
                        </div>

                        <div class="invoice-item-price">
                        	<span>Đơn giá:</span>
                             <span>
                            	<c:forEach var="ctsp" items="${tempHD.cthds}">
	                        	${ctsp.donGia}
	                        </c:forEach>
                            </span><span>đ</span>
                        </div>
                        <div class="invoice-item-quantity">
                        	<span>Số lượng:</span>
                             <span>x</span><span>
                            	<c:forEach var="ctsp" items="${tempHD.cthds}">
	                        	${ctsp.soLuongMua}
	                        </c:forEach>
                            </span>
                        </div>
                        <div class="invoice-item-total">
                            <span>Total:</span>
                            <span><c:forEach var="ctsp" items="${tempHD.cthds}">
	                        	${ctsp.donGia*ctsp.soLuongMua}
	                        </c:forEach></span>
                            <span>đ</span>
                        </div>
                        <c:forEach var="ctsp" items="${tempHD.cthds}">
                        	<c:set var="IDThiep" value="${ctsp.thiep.maThiep}"></c:set>
	                       	<c:set var="SLMua" value="${ctsp.soLuongMua}"></c:set>
	                    </c:forEach>
                        
                        <c:url var="huydon" value="/invoice/huyDon">
	                        <c:param name="Id" value="${tempHD.maHD}"
	                         />
	                         <c:param name="MaThiep" value="${IDThiep}"
	                         />
	                         <c:param name="SoLuongMua" value="${SLMua}" />
	                          <c:param name="user" value="${userName}"
	                         />
                         </c:url>
                        <div class="invoice-item-status">
                        	<span>Trạng thái đơn hàng:</span>
                            <span>
                            	<c:if test="${tempHD.trangThai==1}">
                            		đã xử lý
                            	</c:if>
                            	<c:if test="${tempHD.trangThai==0}">
                            		chờ xử lý<a href="${huydon}"><input type="button" value="Huỷ đơn" class="delete-invoice"  /></a>
                            	</c:if>
                            	<c:if test="${tempHD.trangThai==2}">
                            		bạn đã hủy
                            	</c:if>
                            	<c:if test="${tempHD.trangThai==3}">
                            		nhân viên đã hủy
                            	</c:if>
                            </span>
                        </div>
                    </div>
                </li>
                </c:forEach>
                

            </ul>
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
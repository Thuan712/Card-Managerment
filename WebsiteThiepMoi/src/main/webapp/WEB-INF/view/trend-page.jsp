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
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.jpg" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/trend.css">
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
<title>Xu hướng</title>
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
	<div class="grid">
        <div class="body_news">
            <ul class="list_new">
                <li class="item_new row_news">
                    <div class="col-6">
                        <div class="center_new_img">
                            <div class="item_img">
                                <img src="${pageContext.request.contextPath}/resources/img/new1.webp" alt="ThiepMoi">
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="item_name">Bí quyết chọn thiệp ngày trọng đại</div>
                        <div class="line news"></div>
                        <div class="item_title">
                            Đối với ngày trọng đại, việc lựa chọn mẫu thiệp cưới là một công việc khá là thú vị và cũng mất rất nhiều thời gian. Các cặp đôi đều mong muốn mình sẽ có được mẫu thiệp cưới mang đậm phong cách của riêng mình thay vì những mẫu thiệp cưới thông thường.
                            Để gánh vác bớt nỗi lo lắng ấy, Forever sẽ đưa ra các bí quyết lựa chọn thiệp cưới hoàn hảo dành cho các cặp đôi.
                        </div>
                    </div>

                </li>
                <li class="item_new row_news">

                    <div class="col-6">
                        <div class="item_sub right_news">1. Lựa chọn phong cách thiệp cưới bạn thích</div>
                        <div class="line news"></div>
                        <div class="item_title">
                            Vì hiện nay có rất nhiều mẫu thiệp cưới, vô cùng đa dạng về màu sắc và mẫu mã nên việc lựa chọn một phong cách riêng không phải là công việc dễ dàng. Bạn khó khăn trong việc quyết định cho mình một mẫu thiệp ưng ý. Cách tốt nhất chúng tôi khuyên bạn là
                            hãy cùng với nửa kia chọn những hình ảnh mà cả hai cùng tâm đắc, sau đó là thông điệp cả hai muốn truyền tải thông qua tấm thiệp cưới. Cuối cùng là gửi gắm những ý tưởng đó cho đơn vị thiết kế thiệp cưới, họ sẽ đem đến cho
                            bạn sự hài lòng tuyệt đối.
                        </div>
                    </div>
                    <div class="col-6 img">
                        <div class="center_new_img">
                            <div class="item_img">
                                <img src="${pageContext.request.contextPath}/resources/img/new2.webp" alt="ThiepMoi">
                            </div>
                        </div>
                    </div>

                </li>
                <li class="item_new row_news">
                    <div class="col-6 img">
                        <div class="center_new_img">
                            <div class="item_img">
                                <img src="${pageContext.request.contextPath}/resources/img/new3.webp" alt="ThiepMoi">
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="item_sub">2. Lựa chọn màu sắc chủ đạo</div>
                        <div class="line news"></div>
                        <div class="item_title">
                            Mỗi màu sắc đều mang một ý nghĩa cho riêng mình. Bạn hãy lựa chọn cho mình một màu sắc mà thể hiện được mong muốn, cá tính của riêng hai bạn. Các màu sắc không thể thiếu khi thiết kế thiệp cưới là gam đỏ truyền thống, sắc trắng tinh khôi, xanh biếc nhẹ
                            nhàng, hồng phấn thờ ơ hay sắc tím lãng mạn…
                        </div>
                    </div>

                </li>
                <li class="item_new row_news">

                    <div class="col-6">
                        <div class="item_sub right_news">3. Tham khảo các xu hướng thiết kế hiện đại</div>
                        <div class="line news"></div>
                        <div class="item_title">
                            Bạn có thể tham khảo các mẫu thiệp cưới đang thịnh hành trên tạp chí cưới, các trang web về cưới, pinterst, đây là những nguồn tham khảo tuyệt vời. Các xu hướng có thể kể đến đó là:
                            <p>• Phong cách thiệp cưới đẹp chủ đề hoa</p>
                            <p>• Phong cách thiệp cưới letter press</p>
                            <p>• Phong cách thiệp cưới đẹp phong cách cổ điển</p>
                            <p>• Phong cách thiệp cưới tối giản</p>

                        </div>
                    </div>
                    <div class="col-6 img">
                        <div class="center_new_img">
                            <div class="item_img">
                                <img src="${pageContext.request.contextPath}/resources/img/new4.webp" alt="ThiepMoi">
                            </div>
                        </div>
                    </div>

                </li>
                <li class="item_new row_news">
                    <div class="col-6 img">
                        <div class="center_new_img">
                            <div class="item_img">
                                <img src="${pageContext.request.contextPath}/resources/img/new5.webp" alt="ThiepMoi">
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="item_sub">4. Lựa chọn loại giấy in</div>
                        <div class="line news"></div>
                        <div class="item_title">
                            Chọn chất liệu giấy cho thiệp cưới là việc làm đòi hỏi sự tỉ mỉ, bởi mỗi chất liệu lại mang một vẻ đẹp riêng. Việc này nhằm đảm bảo chất lượng màu sắc sản phẩm khi in gần đúng nhất với màu sắc trên file thiết kế, đồng thời mang lại cảm giác sang trọng
                            hơn hẳn các dòng giấy thông thường. Một số loại giấy được nhiều các cặp đôi lựa chọn như: Giấy can, Giấy ánh trai, Giấy ganh sần, Giấy eco – kraft, Giấy tiêu chuẩn, Giấy Romance, Giấy Sosilk – Stardream.
                        </div>
                    </div>

                </li>
            </ul>
            <div class="end_news">Nếu bạn vẫn còn gặp khó khăn khi chọn mẫu thiệp cưới thì đừng chần chừ gì nữa hãy liên hệ ngay Forever, chúng tớ sẵn sàng giúp bạn với sự tận tâm nhất</div>
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
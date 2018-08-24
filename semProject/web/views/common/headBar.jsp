<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="<%=request.getContextPath()%>/js/common/scroll.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<style>
a{
color:black;
}
#pagetext{
border-bottom:2px solid #00cca3;
font-size:30px;
width:200px;
margin-left:auto;
margin-right:auto;
}

.headr-wrap {
	width: 100%;
	display: inline-block;
	z-index: 1001;
	background: #fff;
	/* position: absolute; */
	position: fixed;
	top: 0px;
	left: 0px;
}


.headr-wrap h1 {
	float: left;
	padding: 1% 0;
	margin-left: 8%;
	color:url(../images/common/bg-content-title.png) no-repeat;
}

.headr-wrap .lg {
	display: inline-block;
	width: auto;
	background: white;
}

.headr-wrap .gnb-menu {
	display: inline-block;
	margin-left: 4%;
	width: 50%;
	height: 100%;
	vertical-align: top;
}

.headr-wrap .gnb-menu li {
	display: inline;
	letter-spacing: -0.04em;
	line-height: 86px;
}

.headr-wrap .gnb-menu li a {
	height: 100%;
	line-height: 56px;
	color: #44484b;
	font-weight: 700;
	margin: 0 4%;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	/* font-family: 'Jua', sans-serif; */
}

.headr-wrap .gnb-user {
	display: inline-block;
	margin-left: 4%;
	width: auto;
	height: 100%;
	vertical-align: top;
}

.headr-wrap .gnb-user li {
	display: inline;
	letter-spacing: -0.04em;
	line-height: 86px;
}

.headr-wrap .gnb-user li a {
	height: 100%;
	line-height: 56px;
	color: #9e9e9e;
	font-weight: 700;
	margin: 0 8px;
	font-size: 15px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	/* font-family: 'Jua', sans-serif; */
}

.headr-wrap h1:hover {
	cursor: pointer;
}

.headr-wrap .gnb-menu li a:hover {
	cursor: pointer;
}

.headr-wrap .gnb-user li a:hover {
	cursor: pointer;
}

/* 사이트 가로크기 조절시 상단바 위치 조정 */
/* @media ( max-width : 1510px ) {
	.headr-wrap h1 {
		float: left;
		padding: 1% 0;
		margin-left: 2%;
	}
	.headr-wrap .gnb-menu li a {
		margin-left: 4%;
		margin: 0 3%;
	}
}

@media ( max-width : 1200px ) {
	.headr-wrap .gnb-menu {
		margin-left: 0.1%;
	}
}

@media ( max-width : 1100px ) {
	.headr-wrap .gnb-user {
		margin-left: 0.1%;
	}
}

@media ( max-width : 1350px ) {
	.headr-wrap {
		width: 1350px;
	}
} */
.full-menu {
	width: 100%;
	display: inline-block;
	position: relative;
	z-index: 1001;
	background: #fff;
	border-bottom: 1px solid #9e9e9e;
	position: fixed;
	top: 85px;
	left: 0px;
	border-top: 1px solid #9e9e9e;
	opaque:0.8;
}

.full-menu .menu-container {
	margin-left: 28%;
}

.full-menu dl {
	float: left;
	width: 198px;
}

.full-menu ul {
	margin-left: -2px;
	list-style: none;
	padding-left: 0px;
}

.full-menu dt {
	margin: 32px 0 2px;
	line-height: 16px;
	color: #90949c;
	font-size: 14px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	/* font-family: 'Jua', sans-serif; */
}

.full-menu a {
	text-decoration: none;
	line-height: 34px;
	font-size: 15px;
	font-weight: 400;
	color: #1d2129;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	/* font-family: 'Jua', sans-serif; */
}

.headr-wrap .full-menu {
	display: none;
}

.headr-wrap:hover .full-menu {
	display: block;
}
</style>


</head>
<body style="background: white;">
	<div>
		<div class="headr-wrap" id="headr-wrap" style="min-width: 1500px;">

			<h1 class="lg" aria-label="Wadiz">로고출력부분</h1>
			<div class="gnb-menu">
				<ul>
					<li><a>투자하기</a></li>
					<li><a>프로젝트 신청</a></li>
					<li><a
						href="<%=request.getContextPath()%>/views/qna/guideMain.html">이용가이드</a></li>
					<li><a href="<%=request.getContextPath()%>/allBoard">공지사항</a></li>
					<li><a>마이페이지</a></li>

				</ul>
			</div>

			<div class="gnb-user">
				<ul>
					<li><a>로그인</a></li>
					<li><a>회원가입</a></li>
				</ul>


			</div>


			<div class="full-menu">
				<div class="menu-container">
					<dl>
						<dt>펀딩오픈</dt>

						<ul>
							<li><a href="">투자 오픈 신청하기</a></li>
							<li><a href="">펀딩 알아보기</a></li>
						</ul>

					</dl>
					<dl>
						<dt>iCrowd 메이커</dt>

						<ul>
							<li><a href="">메이커 뉴스레터</a></li>
							<li><a href="">- 스쿨</a></li>
							<li><a href="">수수료 안내</a></li>
						</ul>

					</dl>
					<dl>
						<dt>iCrowd 소개</dt>

						<ul>
							<li><a
								href="<%=request.getContextPath()%>/views/qna/guideMain.html">이용가이드</a></li>
							<li><a href="">iCrowd 이야기</a></li>
							<li><a href="">iCrowd 마스터</a></li>
							<li><a href="">iCrowd 파트너</a></li>
							<li><a href="">성공 프로젝트</a></li>
						</ul>

					</dl>
					<dl>
						<dt>공지</dt>

						<ul>
							<li><a href="<%=request.getContextPath()%>/allBoard">공지사항</a></li>
							<li><a href="">이벤트</a></li>
						</ul>

					</dl>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<main id="omcContainer" class="cont_guide">
	<div id="cMain">
	<div class="head_guide">
<!-- 	   <img src="../../../image/adminBanner.jpg" width="100%" height="150px"/>
 -->	
				<div class="wrap_txt">
				<br><br><br><br>
					<p id="pagetext" class="sub_txt" style="color: black;">관리자 페이지</p>
				</div>
			</div>

</div>
</main>


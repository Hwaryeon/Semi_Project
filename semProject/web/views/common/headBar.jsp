<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.*" %>
 <% Member loginUser = (Member)session.getAttribute("loginUser"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->

<script src="<%=request.getContextPath()%>/js/common/scroll.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main/style.css">
<style>
.headr-wrap {
	width: 100%;
	display: inline-block;
	z-index: 1001;
	background: #fff;
	border-bottom: 1px solid #9e9e9e;
	/* position: absolute; */
	position: fixed;
	top: 0px;
	left: 0px;
}

.headr-wrap h1 {
	float: left;
	margin-left: 8%;
}

.headr-wrap .lg {
	display: inline-block;
	width: auto;
	/* background: #00cca3; */
	height:auto;
}

.headr-wrap .gnb-menu {
	display: inline-block;
    margin-left: -2%;
    width: 65%;
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
	font-size: 16px;
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
	opacity: 0.8;
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
.lg{

    <%-- background: #fff url(<%=request.getContextPath()%>/images/common/logo.png) no-repeat 0 0;
     --%>
 }
</style>


</head>
<body style="" style="width:1500px; overflow:hidden;">
	<div >
		<div class="headr-wrap" id="headr-wrap" style="width:1600px;max-height:87px;">

			<h1 class="lg" ><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/images/common/logo.png" width="100" height="200" style="height:50px;"></a></h1>
			<div class="gnb-menu">
				<ul>
					<li><a href="<%=request.getContextPath()%>/SelectList.tn">투자하기</a></li>
					<li><a href="<%=request.getContextPath()%>/ptype">프로젝트 신청</a></li>
					<li><a href="<%=request.getContextPath()%>/views/qna/guideMain.jsp">이용가이드</a></li>
					<li><a href="<%=request.getContextPath()%>/allBoard">공지사항</a></li>
					<li><a href="<%=request.getContextPath()%>/views/myPage/mypageIndex.jsp">마이페이지</a></li>
					<li><a href="<%=request.getContextPath()%>/selectAllMember.adm">관리자페이지</a></li>
				</ul>
			</div>

			<div class="gnb-user">
				<ul>
					<% if(loginUser == null) { %>
						<li><a href="<%=request.getContextPath()%>/views/member/loginForm.jsp">로그인</a></li>
						<li><a href="<%=request.getContextPath()%>/views/member/memberJoinForm.jsp">회원가입</a></li>
					<% } else { %>
						<li><%= loginUser.getNickName() %> 님</li>
						<li><a href="<%=request.getContextPath()%>/logout.me">로그아웃</a></li>
					<% } %>
				</ul>
			</div>

			<div class="full-menu">
				<div class="menu-container">
					<dl>
						<dt>펀딩오픈</dt>
						<dd>
							<ul>
								<li><a href="">투자 오픈 신청하기</a></li>
								<li><a href="">펀딩 알아보기</a></li>
							</ul>
						</dd>
					</dl>
					<dl>
						<dt>iCrowd 메이커</dt>
						<dd>
							<ul>
								<li><a href="">메이커 뉴스레터</a></li>
								<li><a href="">- 스쿨</a></li>
								<li><a href="">수수료 안내</a></li>
							</ul>
						</dd>
					</dl>
					<dl>
						<dt>iCrowd 소개</dt>
						<dd>
							<ul>
								<li><a href="<%=request.getContextPath()%>/views/qna/guideMain.html">이용가이드</a></li>
								<li><a href="">iCrowd 이야기</a></li>
								<li><a href="">iCrowd 마스터</a></li>
								<li><a href="">iCrowd 파트너</a></li>
								<li><a href="">성공 프로젝트</a></li>
							</ul>
						</dd>
					</dl>
					
					
					
					<dl>
						<dt>공지</dt>
						<dd>
							<ul>
								<li><a href="<%=request.getContextPath()%>/allBoard">공지사항</a></li>
								<li><a href="">이벤트</a></li>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
		</div>
</div>

</body>
</html>
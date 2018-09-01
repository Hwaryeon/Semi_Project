<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 th{
 	background:#66CDAA;
 	color:white;
 }
 thead{
  	border-bottom:3px solid #f3d950;
 }
 
*, :after, :before, article, aside, div, footer, header, main, nav,
	section {
	/*-webkit-*/
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

#omcWrap {
	margin-top: 87px;
}

blockquote, body, button, code, dd, div, dl, dt, fieldset, figure, form,
	h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, pre, select, td,
	textarea, th, ul {
	margin: 0;
	padding: 0;
}



#omcContainer {
	background-color: #f7f7f7;
}

.head_guide {
	width: 100%;
	padding: 3.4% 0;
	background: url(../../images/qna/bg_guide.png) no-repeat 50% 0;
	background-size: cover;
}


a: /*-webkit-*/ any-link {
	color: /*-webkit-*/ link;
	cursor: pointer;
	/*  text-decoration: underline; */
}

.guide_nav .list_nav_guide .link_cont {
	display: block;
	padding: 5px 0;
	border-bottom: 1px solid #d6d6d6;
	font-size: 1.125em;
	color: #333;
}

 a, a:active, a:hover {
	text-decoration: none;
	color:#038dc7;
}


dl, li, menu, ol, ul {
	list-style: none;
}

ul, menu, dir {
	display: block;
	list-style-type: disc;
	/*-webkit-*/
	margin-before: 1em;
	/*-webkit-*/
	margin-after: 1em;
	/*-webkit-*/
	margin-start: 0px;
	/*-webkit-*/
	margin-end: 0px;
	/*-webkit-*/
	padding-start: 40px;
}

.inner {
	max-width: 1224px;
	margin-left: auto;
	margin-right: auto;
}

.guide_nav .inner {
	padding: 40px;
	border: 1px solid #d6d6d6;
	background-color: #fff;
}

#mContent, .cont_main #mContent {
	padding-top: 60px;
}

#mContent {
	min-height: 600px;
	padding-bottom: 60px;
}



.guide_cont {
	max-width: 1224px;
	margin-left: auto;
	margin-right: auto;
}

.guide_nav {
	float: left;
	width: 25%;
	padding-right: 12px;
	padding-left: 12px;
}

.screen_out {
	overflow: hidden;
	position: absolute;
	width: 0;
	height: 0;
	line-height: 0;
	text-indent: -9999px;
}

h3 {
	font-size: 1.25em;
}


.guide_article {
	float: left;
	width: 75%;
	padding-right: 12px;
	padding-left: 12px;
}

article, aside, figcaption, figure, footer, header, main, nav, section {
	display: block;
}


.guide_article .inner {
	padding: 70px 80px;
	border: 1px solid #d6d6d6;
	background-color: #fff;
}

.inner {
	max-width: 1224px;
	margin-left: auto;
	margin-right: auto;
}

.guide_article .box_guide {
	margin-bottom: 4.7%;
}


.guide_article .box_guide .tit_box {
	display: block;
	width: 100%;
	padding-bottom: 15px;
	border-bottom: 1px solid #8f8f8f;
	font-size: 1.25em;
	color: #000;
	font-weight: 400;
}



.guide_article .box_guide .txt_desc {
	padding-top: 24px;
	font-size: 1em;
	color: #48494a;
	line-height: 1.5em;
}

.guide_article .box_guide .wrap_img {
	display: block;
	margin: 15px 0;
	text-align: center;
}


	

.guide_article .box_guide .list_guide {
	margin-bottom: 20px;
}




.guide_article .box_guide .list_guide li {
	line-height: 1.75em;
	word-break: keep-all;
}

.guide_article .box_guide .list_guide>li {
	margin-top: 33px;
}

.guide_article .box_guide:last-of-type .tit_box {
	border-bottom: 0 none;
}


.guide_article .box_guide .tit_box {
	display: block;
	width: 100%;
	padding-bottom: 15px;
	border-bottom: 1px solid #8f8f8f;
	font-size: 1.25em;
	color: #000;
	font-weight: 400;
}

.faq_cont .list_accor {
	border-bottom: 1px solid #48494a;
}

.list_accor {
	width: 100%;
	border-top: 1px solid #48494a;
}

.list_accor li {
	border-bottom: 1px solid #d6d6d6;
}


.list_accor li .tit_accor {
	display: block;
	position: relative;
	padding: 2% 5% 2% 2%;
	color: #777;
	font-size: 1em;
	cursor: pointer;
}

address, caption, cite, code, dfn, em, var {
	font-style: normal;
	font-weight: 400;
}

.list_accor li .tit_accor .txt_cate {
	color: #48494a;
	font-weight: 500;
}



.list_accor li .tit_accor:after {
	display: block;
	position: absolute;
	top: 50%;
	right: 14px;
	width: 17px;
	height: 10px;
	margin-top: -5px;
	background: url(/omc/asset/images/sprites_pc/ico_down.png) no-repeat 0 0;
	content: "";
}



.list_accor li .cont_accor {
	display: none;
	padding: 3% 5.2%;
	background-color: #f7f7f7;
	color: #777;
	font-size: .875em;
}

.tit_down:hover .cont_accor {
	display: table;
}

.tit_down:hover {
	background: #c4e3be;
}

.guide_nav .list_nav_guide>li {
	margin-bottom: 30px;
}

.guide_nav .list_nav_guide .list_sub {
	margin-top: 10px;
}

.guide_top {
	max-width: 1224px;
	margin-left: auto;
	margin-right: auto;
}

.guide_top .search_area {
	margin-bottom: 28px;
}

.search_form {
	position: relative;
	width: 44%;
	margin: 0 auto;
}

fieldset, img {
	border: 0 none;
}

.search_form .tit_search {
	margin-bottom: 20px;
	font-size: 1.875em;
	text-align: center;
}

.tf_comm {
	display: block;
	position: relative;
}

.search_form .tf_comm .placehoder {
	padding: 3% 10px;
	font-size: 1em;
}

.tf_comm .placehoder {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	padding: 5px 10px;
	font-size: .875em;
	color: #999;
	cursor: text;
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	word-break: keep-all;
	word-wrap: break-word;
}

.search_form .tf_comm .tf_cont {
	width: 100%;
	padding: 3.2% 10px;
	text-align: center;
}

.tf_comm .tf_cont {
	display: block;
	padding: 5px 10px;
	border: 1px solid #e1e1e1;
	font-size: .875em;
	color: #303030;
}

.search_form .tf_comm .btn_search {
	position: absolute;
	top: 1px;
	right: 1px;
	width: 11%;
	height: 95%;
	background-color: #fff;
}

.search_form .tf_comm .btn_search .ico_comm {
	width: 26px;
	height: 28px;
	background-position: -909px -882px;
}

.ico_comm {
	display: inline-block;
	overflow: hidden;
	background-image: url(../../images/qna/search.png);
	vertical-align: middle;
	text-indent: -9999px;
}

.faq_panel {
	position: relative;
}

.faq_panel .tit_faq, .faq_panel .tit_target {
	height: 39px;
	font-weight: 400;
	line-height: 39px;
}

.faq_panel .tit_faq {
	font-size: 1.25em;
	color: #000;
}

.faq_panel .on .tit_target {
	z-index: 1;
	height: 40px;
	border-color: #8f8f8f;
	border-bottom: 0 none;
	background-color: #fff;
	color: #8f8f8f;
}

.faq_guest .tit_target {
	right: 114px;
}

.faq_panel .tit_target {
	position: absolute;
	top: 0;
	width: 115px;
	border: 1px solid #ccc;
	font-size: .875em;
	background-color: #e1e1e1;
	color: #777;
	text-align: center;
}

.faq_panel .on .list_top5 {
	display: block;
}

.faq_panel .list_top5 {
	display: none;
	border-top: 1px solid #8f8f8f;
	border-bottom: 1px solid #8f8f8f;
	background-color: #fff;
}

.faq_panel .list_top5 li:first-child {
	border-top: 0 none;
}

.faq_panel .list_top5 li {
	padding: 12px 0;
	border-top: 1px solid #d6d6d6;
}

.faq_host .tit_target {
	right: 0;
}

.guide_links {
	overflow: hidden;
	margin-top: 70px;
	border-right: 1px solid #e1e1e1;
}

.guide_links li {
	float: left;
	width: 33.333%;
	border-left: 1px solid #e1e1e1;
	text-align: center;
}



.guide_links strong {
	display: block;
	padding-bottom: 210px;
	font-weight: 400;
	font-size: 1.25em;
	line-height: 1.2;
}

.guide_links a {
	display: inline-block;
	padding: 12px 20px;
	font-size: .875em;
	background-color: #777;
	color: #fff;
}

.faq_panel .label_support {
	background-color: #80c72d;
}

.faq_panel .label_stock {
	background-color: #05a7e2;
}

.faq_panel .label_stock, .faq_panel .label_support {
	display: inline-block;
	width: 8.745%;
	height: 30px;
	margin-right: 5px;
	font-size: .875em;
	line-height: 30px;
	color: #fff;
	text-align: center;
	vertical-align: middle;
}

.faq_panel .on .tit_target {
	z-index: 1;
	height: 40px;
	border-color: #8f8f8f;
	border-bottom: 0 none;
	background-color: #fff;
	color: #8f8f8f;
}

.faq_panel .on .tit_target:after {
	position: absolute;
	bottom: 2px;
	left: 50%;
	width: 38px;
	height: 2px;
	margin-left: -19px;
	background-color: #f88b46;
	content: "";
}
ul li a:hover{
color: #038dc7;
}
.guide_nav .list_nav_guide .lnb_depth .link_depth {
    font-size: .875em;
    color: #999;
}
.link_depth{
cursor : pointer;
}

.list_nav_guide:hover{
	color:#5bc0de;
}
</style>
</head>
<body>
	<nav class="guide_nav">
		<h3 class="screen_out">이용가이드 서브메뉴</h3>
		<div class="inner">
			<ul class="list_nav_guide">
				<li id="comRoot"><a href="guide.jsp" class="link_cont">회원
						관리</a>
					<ul class="lnb_depth">			
						<li id="9 6b bgvt6 vg6tfvg7"class="link_depth" onclick="memberAll();">회원 조회</li>
						<li id="9 6b bgvt6 vg6tfvg7"class="link_depth" onclick="blackList();">블랙리스트 관리</li>
						<li id="9 6b bgvt6 vg6tfvg7"class="link_depth" onclick="invRankAll();">투자자 등급 관리</li>
					</ul></li>
				<li id="gstRoot"><a href="guest.jsp#gstRewPay"
					class="link_cont">펀딩 관리</a>
					
							<ul class="lnb_depth">
						<li id="9 6b bgvt6 vg6tfvg7"class="link_depth" onclick="selectAllProject();">펀딩 조회</li>
								<li id="gstRewPay_li"><a href="/sp/views/admin/confirmProject.jsp"
									class="link_depth">펀딩
										심사</a></li>
								<li id="gstRewFaq_li" onclick="selectAllDlineProject();" class="link_depth">
									펀딩 마감 관리</li>
							</ul></li>
							
							<li id="gstRoot"><a href="guest.jsp#gstRewPay"
					class="link_cont">통계 현황</a>
					
							<ul class="lnb_depth">
							<li id="gstRewPay_li"><a href="<%= request.getContextPath() %>/salesSt.adm"
									class="link_depth">매출 통계</a></li>
								<li id="gstRewPay_li"><a href="<%= request.getContextPath() %>/fundingSt.adm"
									class="link_depth">펀딩 통계</a></li>
								<li id="gstRewFaq_li"><a href="<%= request.getContextPath() %>/memberSt.adm"
									class="link_depth">가입자 통계</a></li>
							</ul></li>
					</ul></li>
			</ul>
		</div>
	</nav>
<script>
function memberAll(){
	location.href="<%=request.getContextPath()%>/selectAllMember.adm";
}
function blackList(){
	location.href="<%=request.getContextPath()%>/blackSelectAll.adm";
}
function invRankAll(){
	location.href="<%=request.getContextPath()%>/selectAllRank.adm";
}
function selectAllProject(){
	location.href="<%=request.getContextPath()%>/selectAllProject.adm";
}
function selectAllDlineProject(){
	location.href="<%=request.getContextPath()%>/dlineSelectAll.adm";
}

</script>
</body>
</html>
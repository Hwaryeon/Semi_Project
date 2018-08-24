<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset= "UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2><a href="views/common/loading.html">로딩</a></h2>
			<div class="menu" onclick="memberAll();">관리자</div>

<a href="views/admin/searchMember.jsp">상세 회원 보기</a>
<a href="views/admin/searchInvMember.jsp">상세 투자자 회원 보기</a>
<a href="views/admin/searchEnpMember.jsp">상세 사업자 회원 보기</a>


				<script>
		
		function memberAll(){
			location.href="<%=request.getContextPath()%>/selectAllMember.adm";
		}
		
	</script>
</body>
</html>
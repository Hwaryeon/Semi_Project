<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.kh.sp.member.model.vo.*"%>
<!DOCTYPE html>
<%String msg = (String)request.getAttribute("msg"); %>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style>
.outer {
   padding-left:0px;
   padding-right:0px;
   padding-bottom:0px;
}
legend {
   font-size: 24px;
}

.container {
   width: 100%;
   max-width: 400px;
   margin-top: 150px;
   margin-bottom: 100px;
   padding: 40px 40px;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
   border: 1px solid lightgray;
   border-radius: 10px;
}
#menubar {
   width:400px;
   height:30px;
   font-size:20px;
   text-align:center;
   font-family: Roboto, 'Noto Sans KR', sans-serif;
}

#menubar > td {
   border: 1px solid lightgray;
   border-radius: 10px;
   width:400px;
   
}
#menubar:hover {
   cursor:pointer;
}

#menutitle {
   font-size:16px;
   height:30px;
   text-align:center;
}
</style>
</head>
<body>
   <%@ include file="../common/headBar.jsp" %>
   
   <div class="container">
      <fieldset class="outer">
         <legend align="center">
            <b>마이페이지</b>
         </legend>
         <table align="center" height="450px">
            <tr id="menubar" class="mypage update">
               <td onclick="location.href='<%=request.getContextPath() %>/views/myPage/updateMember.jsp'">개인정보 수정</td>
            </tr>
            
            <tr id="menubar" class="mypage enroll">
               <td onclick="location.href='<%=request.getContextPath() %>/select.ep?userid=<%= loginUser.getUserId()%>&userclass=<%=loginUser.getUserClass() %>'">
              <% if(loginUser.getUserClass().equals("investor")) { %>참여 프로젝트
              <% } else if(loginUser.getUserClass().equals("business")) { %>개설 프로젝트
              <% } %> 
               </td>
            </tr>
            
            <tr align="center" class="investService">
               <td id="menutitle"><b>투자서비스</b></td>
            </tr>
            <tr id="menubar" class="investService updateRank">
               <td onclick="location.href='<%=request.getContextPath() %>/views/myPage/updateRank.jsp'">투자등급 변경 신청</td>
            </tr>
            <tr id="menubar" class="investService payment">
               <td onclick="location.href='<%= request.getContextPath() %>/show.pb?userid=<%= loginUser.getUserId()%>&userclass=<%=loginUser.getUserClass() %>'">
               <% if(loginUser.getUserClass().equals("investor")) { %>결제내역
               <% } else if(loginUser.getUserClass().equals("business")) { %>투자받은 내역
               <% } %></td>
            </tr>
            
            <tr class="certification">
               <td id="menutitle"><b>서비스 등록</b></td>
            </tr>
            <tr id="menubar" class="certification investor">
               <td onclick="location.href='<%=request.getContextPath() %>/views/myPage/normalInvestor.jsp'">일반 투자자 회원 인증</td>
            </tr>
            <tr id="menubar" class="certification business">
               <td onclick="location.href='<%=request.getContextPath() %>/views/myPage/licensee.jsp'">사업자 회원 인증</td>
            </tr>
         </table>
      </fieldset>
   </div>   
   <script> 
   
  	<% if(loginUser.getUserClass().equals("investor")) { %>
         //로그인 한 유저가 투자자일 경우
         $(".certification").hide(); //투자자 인증창 숨기기
      <% if(loginUser.getInvestorGrade().equals("PI")) { %>
         //전문 투자자인 경우
            $(".updateRank").hide();//투자등급 올리기 메뉴 숨기기
      <% } %>
         
    <% } else if(loginUser.getUserClass().equals("business")) { %>
         //로그인 한 유저가 사업자 회원일 경우
         $(".certification").hide();
         $(".updateRank").hide();
         
    <% } else if(loginUser.getUserClass().equals("general")){%>
         //로그인 한 유저가 일반회원일 경우
         $(".investService").hide();
         $(".enroll").hide();
    <% } %> 
      
    $(function(){
    	<%if(msg != null){ %>
    	    alert('<%= msg %>');
    	<% } %>
    });  
   </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sp.funding.model.vo.*, com.kh.sp.product.model.vo.*, java.util.*,com.kh.sp.board.model.vo.*" %>

<%HashMap<String,Object> hm = (HashMap<String,Object>)request.getAttribute("hm");
 ArrayList<HashMap<String,Object>> newsList =(ArrayList<HashMap<String,Object>>)request.getAttribute("newsList");
 HashMap<String,Object> h2 = (HashMap<String,Object>)request.getAttribute("h2");
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 페이지</title>
<link rel="stylesheet" href="css/bootstrap.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="js/bootstrap.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<style>

#auth,#popCloseBtn{
		width:100px;
		height:30px;
	}
	#auth{
		border:1px solid;
		background-color: #05a7e2;
		color: #fff;
	}
	#popCloseBtn{
		border:1px solid;
		color:#05a7e2;
		background-color:#fff;
	}
	#popupDiv {
    top : 0px;
    position: absolute;
    background: #fff;
    width: 400px;
    height: 220px;
    display: none; 
    text-align:center;
    font-size:17pt;
    }
    
    #popup_mask { 
        position: fixed;
        width: 100%;
        height: 1000px;
        top: 0px;
        left: 0px;
         display: none; 
         background-color:#000;
         opacity: 0.8;
    }
	#popupDiv2 {
    top : 0px;
    position: absolute;
    background: #fff;
    width: 400px;
    height: 220px;
    display: none; 
    text-align:center;
    font-size:17pt;
    }
    
    #popup_mask2 { 
        position: fixed;
        width: 100%;
        height: 1000px;
        top: 0px;
        left: 0px;
         display: none; 
         background-color:#000;
         opacity: 0.8;
    }
	
	#popupDiv3 {
    top : 0px;
    position: absolute;
    background: #fff;
    width: 400px;
    height: 220px;
    display: none; 
    text-align:center;
    font-size:17pt;
    }
    
    #popup_mask3 { 
        position: fixed;
        width: 100%;
        height: 1000px;
        top: 0px;
        left: 0px;
         display: none; 
         background-color:#000;                
         opacity: 0.8;
    }

.ttitle{
	margin-bottom : 0px;
	text-align : center;
	font-size : 20pt;
	background : #186ab7;
	height:100px;
	color:white;
}

.contents{
	width : 70%;
	height:300px;
	background-color: #fff;
	margin-left : auto;
	margin-right: auto;
	height : 400px;
	border : 1px solid #eee;
	box-shadow: 5px 5px 5px 0 #D8D8D8;
}
#picture{
	/* width : 80%;
	height: 70%; */
	display : inline-block;
	margin-top: 40px;
	margin-left : 10px;

}
#pic{
	width : 50%;
	margin-top : 0;
	margin-left : 40px;
	display: inline-block;
}
#text{
	
	width:40%;
	height:100px;
	float:right;
}
#p1{
	float:left;
	font-weight: bold;
	font-size : 15pt;
	margin-right:140px;
	color:#464646;
}
#p2{
	float: left;
    font-weight: bold;
    font-size: 15pt;
    color:#464646;
    margin-right:150px;
}
#p3{
	float: left;
    font-weight: bold;
    font-size: 15pt;
    color:#464646;
}
#p4{
	float: left;
    font-weight: bold;
    font-size: 15pt;
    color:#464646;
    margin-right:150px;
}
#bar{
	width:90%;
	height:10px;
	background-color:green;
}
#select{
		width:350px;
		height:40px;
	    cursor: pointer;
	    position : absolute;
	    left:870px;
	    background-color:#05a7e2;
	    color: #fff;
	    border : 1px solid white;
}
.integration{
	margin-top : 50px;
	margin-left : auto;
	margin-right: auto;
	width : 70%;
	height:500px;
	background-color: white;
	
}
#top_bar{
	text-align:center;
}

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding : 10px 20px;
	cursor:pointer;
}

ul.tabs li.current{
	background: #ededed;
	color:#222;
}
.tab-content{
	display : none;
	background : white;
	padding : 15px;
}

.tab-content.current{
	display:inherit;
}
#tab-1{
	height:100%;
	margin : 0 auto;
}
#tab-2{
	height:100%;
	margin : 0 auto;
	background-color:white;
}
#tab-3{
	height:100%;
	margin : 0 auto;
}
#footer{
	width:80%;
	height:100px;
	text-align:center;
	background-color:white;
	margin : 0 auto;
	margin-top : 10px;
}

#sort{
	width:40px;
	background-color:#038dc7;
	color:#fff;
	text-align:center;
	margin-top:20px;
	margin-left:320px;
}
.notitle{
	width:0px;
}
.qsample{
	background-color:white;
	margin : 0 auto;
}
textarea{
	cursor:text;
	border:1px solid gray;
}
.tinfo{
	width:80%;
	height:10%;
	margin: 0 auto;
	border:1px solid gray;
	border-top:0px;
}
.tbox{
	background-color:white;
	height: 40%;
	}
#comment{
	width:80%;
	height:60%;
}
#upcomment{
	padding-top:0;
	padding-bottom:0;
	float:right;
	border : 0;
	background-color : #038dc7;
	color : #fff;
	cursor : pointer;
	float:right;
}
#textin{
	width : 77%;
	background-color : #eaeaea;
	margin : 0 auto;
	text-align:justify;
}

.paging_comm a {
    cursor:pointer;
}


.layer{
	color: #000000a3;
    font-size: 20px;
    font-weight: 400;

}

.btn_search{
	cursor:pointer;
}

.body_group:hover{
	background:#c3bebe;
	cursor:pointer;
	color:blue;
}
#ps1{
	pont-size:10pt;
}
</style>


</head>
<body style="background: #F2F2F2;">
	  <%@ include file="../common/headBar.jsp"%>  
 <br><br><br>

<div class="ttitle"><br><%=hm.get("intro") %></div>
<br>

<div class="contents">
	 <div id="pic">
		<img id="picture" src="/sp/thumbnail_uploadFiles/<%=hm.get("changeName")%>" width="550px" height="300px">
	</div>
	<div id="text">
		<br>
		
			<div id="sort">채권</div>
		<br>
		<p id="p1"><%=hm.get("count")%>명 참여</p>
		<p id="p2"><%=hm.get("sum")%>/목표액 <%=hm.get("closingAmount")%> 원</p>
		<p id="p4"><%=hm.get("persentage")%>%달성</p>
		<p id="p3">투자마감(마감일 2018-xx-xx xx:00)</p>
		
		<!-- <div id="bar"></div> -->
		<!-- <div style=color:green;>xxx%</div> -->
		<br><br><br><br><br><br><br>
		<button id="select" type="button">투자하기</button>
		<br>
	</div>
		 <br><br><br><br><br><br><br><br><br>
		  
		<br><br><br><br><br><br><br><br><br> 
	
</div>
<div class="integration">
		<div id="top_bar">
		<ul class="tabs">
			<!-- <li class="notitle"></li> -->
			<li class="tab-link current" data-tab="tab-1">상품 정보</li>
			<li class="tab-link" data-tab="tab-2">상품 소식</li>
			<li class="tab-link" data-tab="tab-3">투자자 게시판</li>
		</ul>
		
		<hr>
		
		<div id="tab-1" class="tab-content">
			<div class="field_content article_intro" style="min-height:350px;">			
							<%=hm.get("content")%>				
		</div>
						
			</div>
		<div id="tab-2" class="tab-content current">
		
		</div>
		<div class="container">
	<%if(newsList != null) {%>
		 <% for(int i = 0; i < newsList.size(); i++){
 			HashMap<String,Object> h = newsList.get(i);
 		%>
			<table class="table table-striped">
				<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>상품명</th>
					<th>날짜</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><%=h.get("writtingNo") %></td>
					<td><%=h.get("title") %></td>
					<td><%=hm.get("pName") %></td>
					<td><%=h.get("registDate") %></td>
				</tr>
				</tbody>
			</table>
			<% } %>
			<%} %>
			<hr/> 
			<%if(loginUser != null && loginUser.getUserId()==0){ %>
			<button id="write">글쓰기</button>
			<% } %>
			<!-- <div class="text-center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div> -->
		</div>				
		</div>				
		
		<div id="tab-3" class="tab-content">
			투자자 게시판
		</div>
		</div>


<div id ="popup_mask" ></div>
    
    <div id="popupDiv">
    	
    	<p><br>투자자 인증이 필요합니다.<br>
    	</p>
    	<hr>
    	<button id="auth">인증하기</button>
        <button id="popCloseBtn">취소</button>
    </div>
    
<div id ="popup_mask2" ></div>
    
    <div id="popupDiv2">
    	<div> 투자 상품 명 : <%=hm.get("pName") %></div>
    	<div> 투자 금액 : <%=hm.get("amount") %>원</div>
    	  
    	<button id="confirm">결제 확인</button>
    	<button id="popCloseBtn2">취소</button>
    </div> 
       
    <script>
    
    $(document).ready(function(){
    	$("#select").click(function(event){
    		
    		
    		<% if(loginUser.getUserClass().equals("general")) { %>
             $("#popupDiv").css({
                "top": (($(window).height()-$("#popupDiv").outerHeight())/4+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#popupDiv").outerWidth())/2+$(window).scrollLeft())+"px"
             	}); 
            $("#popup_mask").css("display","block"); 
            $("#popupDiv").css("display","block");
            $("body").css("overflow","hidden");
    		
            <% } else if(loginUser.getUserClass().equals("investor")) {%>
            
            $("#popupDiv2").css({
                "top": (($(window).height()-$("#popupDiv2").outerHeight())/4+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#popupDiv2").outerWidth())/2+$(window).scrollLeft())+"px"
                
             }); 
            
            $("#popup_mask2").css("display","block"); 
            $("#popupDiv2").css("display","block"); 
            
            $("body").css("overflow","hidden");
       		<% } %>
    	});
    });
        
   
      $("#popCloseBtn2").click(function(event){
            $("#popup_mask2").css("display","none"); 
            $("#popupDiv2").css("display","none"); 
            $("body").css("overflow","auto");
        });
        
      $("#auth").click(function(event){
      	var contextPath = '<%= request.getContextPath() %>';
      	var loc = contextPath + '/views/myPage/normalInvestor.jsp';
      		
      	location.href=loc;
      });
      
      $("#popCloseBtn").click(function(event){
          $("#popup_mask").css("display","none"); 
          $("#popupDiv").css("display","none"); 
          $("body").css("overflow","auto");
      	});
	
    $(document).ready(function(){
    	$('ul.tabs li').click(function(){
    		var tab_id = $(this).attr('data-tab');

    		$('ul.tabs li').removeClass('current');
    		$('.tab-content').removeClass('current');

    		$(this).addClass('current');
    		$("#"+tab_id).addClass('current');
    	});
    });
 	
    
    $(document).ready(function(){
    $("#confirm").click(function(event){
    	 alert('전송');
    	 
    	    var IMP = window.IMP; // 생략가능
    	       IMP.init('imp67147309');  // 가맹점 식별 코드

    	       IMP.request_pay({
    	           pg : 'inicis', // 결제방식
    	           pay_method : 'card',   // 결제 수단
    	           merchant_uid : 'merchant_' + new Date().getTime(),
    	           name : '<%=hm.get("pId")%>',   // order 테이블에 들어갈 주문명 혹은 주문 번호
    	           amount : '<%=hm.get("amount")%>', 	
    	           buyer_email : '<%=loginUser.getEmail()%>', // 구매자 email
    	           buyer_name :  '<%=loginUser.getUserName()%>'  // 구매자 이름 
    	       }, function(rsp) {
    	       if ( rsp.success ) { // 성공시
    	          var msg = '결제가 완료되었습니다.';
    	          msg += '고유ID : ' + rsp.imp_uid;
    	          msg += '결제 금액 : ' + rsp.paid_amount;
    	          
    	          $("#popup_mask2").css("display","none"); 
    	            $("#popupDiv2").css("display","none"); 
    	            $("body").css("overflow","auto");
    	          //console.log();
    	          var contextPath = '<%= request.getContextPath() %>';
    	          var investId = rsp.imp_uid;
    	          var userId = '<%=loginUser.getUserId()%>';
    	          var pId = '<%=hm.get("pId")%>';
    	          var price = rsp.paid_amount;
    	          var status = rsp.status;
    	          var loc = contextPath + '/Insert.pm?investId=' + investId + "&userId=" + userId + "&pId=" + pId + "&price=" + price + "&status=" + status;
    	          
    	          location.href=loc;
    	       
    	          /*m_redirect_url : // 결제 완료 후 보낼 컨트롤러의 메소드명 */
    	       } else { // 실패시
    	          var msg = '결제에 실패하였습니다.';
    	          msg += '에러내용 : ' + rsp.error_msg;
    	          
    	       }
    	    });
    	 });
    });
    
    $(function(){
		$("#write").click(function(){
			
			var num = '<%=hm.get("pId")%>';
			var userId = '<%=hm.get("userId")%>';
			var contextPath = '<%= request.getContextPath() %>'; 
			var loc = contextPath + '/InsertNews1.pm?num=' + num;
			
			location.href=loc;
			
		})
	})
    
    </script>
     
</body>
	

</html>

<!-- <div class="qsample">
				<br><br><br><br>
				<ul id="textin">
					<li>Q&A게시판은 회원으로 로그인한 분만 글을 작성할 수 있으며 프로젝트 개설자는 투자자들의 질문과 의견을 임의로 삭제하거나 수정하지 않습니다.</li>
					<li>본 게시판에 타인의 참여1를 유도할 목적으로 허위의 의사표시를 하는 경우 부정거래행위 등으로 처벌받을 수 있습니다.</li>
					<li>개설자와 이해관계가 있는 자는 해당 이해관계 등을 명확히 표시하고 의견을 제시해야 합니다.</li>
				</ul>
				</div> -->
				<!-- <div id="outer">
					<div class="tbox">
						<div>			
							<textarea id="comment" cols="30" rows="5" maxlength="500"></textarea>
						</div>
						<div class="tinfo">
							<span class="txt" style=float:left>&nbsp;&nbsp;댓글을 남겨주세요</span>
							
							<button type="submit" id="upcomment">등록</button>
						</div>		
					</div>
				</div>	 -->
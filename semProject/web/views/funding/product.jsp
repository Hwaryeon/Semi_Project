<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.sp.funding.model.vo.*, java.util.*,com.kh.sp.board.model.vo.*" %>

<%HashMap<String,Object> hmap = (HashMap<String,Object>)request.getAttribute("hmap");%>
    
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

#login,#popCloseBtn{
		width:100px;
		height:30px;
	}
	#login{
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
	margin-bottom : 30px;
	text-align : center;
	font-size : 20pt;
}

.contents{
	width : 80%;
	height:300px;
	background-color:white;
	margin-left : auto;
	margin-right: auto;
	height : 400px;
}
#picture{
	/* width : 80%;
	height: 70%; */
	display : inline-block;
	margin-top: 40px;
	margin-left : 90px;

}
#pic{
	width : 50%;
	margin-top : 0;
	margin-left : 40px;
	display: inline-block;
}
#text{
	align:right;
	width:35%;
	float:right;
}
#p1{
	font-weight: bold;
	font-size : 15pt;
}
#p2{
	font-weight: normal;
	font-family: Spoqa Han Sans,Apple SD Gothic Neo,Malgun Gothic,Dotum,Hevetica,Arial,sans-serif;
}
#bar{
	width:90%;
	height:10px;
	background-color:green;
}
#select{
		width:230px;
		height:40px;
	    cursor: pointer;
	    position : absolute;
	    left:1010px;
	    background-color:#05a7e2;
	    color: #fff;
	    border : 1px solid white;
}
.integration{
	margin-top : 50px;
	margin-left : auto;
	margin-right: auto;
	width : 80%;
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
}
.notitle{
	width:350px;
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

</style>


</head>
<body style="background: #eaeaea;">
	  <%@ include file="../common/headBar.jsp"%>  
<br><br><br><br><br>

<p class="ttitle">[채권형] "다함께 사는 우리"
	다울쿠키가 만들어갑니다.</p>


<div class="contents">
	<div id="pic">
		<img id="picture" src="/sp/thumbnail_uploadFiles/<%=hmap.get("changeName")%>" width="300px" height="200px">
	</div>
	<div id="text">
		<br>
		<div class="sortd">
			<div id="sort">채권</div>
		</div>
		<p id="p1">97<span id="p2">명 참여</span></p>
		<p id="p1">194,500,000<span id="p2">원/목표액 <%=hmap.get("closingAmount")%> 원</span></p>
		<p id="p1">투자마감<span id="p2">(마감일 2018-xx-xx xx:00)</span></p>
		<div id="bar"></div>
		<div style=color:green;>xxx%</div>
		<br>
		<button id="select" type="button">투자하기</button>
		<button id="invest" type="button">투자하기2</button>
		<br>
		
		<br><br><br><br><br><br><br><br><br>
		<%-- <div class="field_content article_intro" style="min-height:350px;">			
							<%=hmap.get("content")%>				
		</div> --%>
		<br><br><br><br><br><br><br><br><br>
	</div>
</div>
<div class="integration">
		<div id="top_bar">
		<ul class="tabs">
			<li class="notitle"></li>
			<li class="tab-link current" data-tab="tab-1">상품소식</li>
			<li class="tab-link" data-tab="tab-2">상품Q&A</li>
			<li class="tab-link" data-tab="tab-3">투자자모임</li>
		</ul>
		
		<hr>
		<div id="tab-1" class="tab-content current">
		<div class="container">
			<table class="table table-striped">
				<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>165</td>
					<td>제목</td>
					<td>인소진</td>
					<td>2016.12.12</td>
				</tr>
				<tr>
					<td>165</td>
					<td>제목</td>
					<td>인소진</td>
					<td>2016.12.12</td>
				</tr>
				</tbody>
			</table>
			<hr/>
			<button id="summernote"><a href="<%=request.getContextPath()%>/views/funding/insertnews.jsp">글쓰기</button>
			
			<div class="text-center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
		</div>
		<div id="tab-2" class="tab-content">
			<div class="qsample">
				<br><br><br><br>
				<ul id="textin">
					<li>Q&A게시판은 회원으로 로그인한 분만 글을 작성할 수 있으며 프로젝트 개설자는 투자자들의 질문과 의견을 임의로 삭제하거나 수정하지 않습니다.</li>
					<li>본 게시판에 타인의 참여를 유도할 목적으로 허위의 의사표시를 하는 경우 부정거래행위 등으로 처벌받을 수 있습니다.</li>
					<li>개설자와 이해관계가 있는 자는 해당 이해관계 등을 명확히 표시하고 의견을 제시해야 합니다.</li>
				</ul>
				</div>
				<div id="outer">
					<div class="tbox">
						<div>			
							<textarea id="comment" cols="30" rows="5" maxlength="500"></textarea>
						</div>
						<div class="tinfo">
							<span class="txt" style=float:left>&nbsp;&nbsp;댓글을 남겨주세요</span>
							
							<button type="submit" id="upcomment">등록</button>
						</div>		
					</div>
				</div>			
			</div>				
		</div>				
		
		<div id="tab-3" class="tab-content">
			투자자모임 내용
		</div>
		</div>
</div>

<div id ="popup_mask" ></div>
    
    <div id="popupDiv">
    	
    	<p><br>로그인이 필요한 기능입니다.<br>
    	로그인 화면으로 이동하시겠습니까?</p>
    	<hr>
    	<button id="login">로그인하기</button>
        <button id="popCloseBtn">취소</button>
    </div>
    
<div id ="popup_mask2" ></div>
    
    <div id="popupDiv2">
    	<div> 투자 상품 명 : <%=hmap.get("pName") %></div>
    	<div> 투자 금액 : <%=hmap.get("amount") %>원</div>
    	  
    	<button id="confirm">결제 확인</button>
    	<button id="popCloseBtn2">취소</button>
    </div>
   
<div id ="popup_mask3" ></div>
    
    <div id="popupDiv3">
    	
    	
    	<div class="title1">타임라인 내용</div>
		<div class="title2" style="border: 1.2px solid black;">

			<input type="text" style="width: 100%; color: #8C8C8C;"
				name="fundingTitle" id="fundingTitle" value="" />
    	
				
    	<button id="confirm2">작성 완료</button>
    	<button id="popCloseBtn3">취소</button>
    </div>
      
    <script>
    
    $(document).ready(function(){
        
        $("#select").click(function(event){   
 
             $("#popupDiv").css({
                "top": (($(window).height()-$("#popupDiv").outerHeight())/4+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#popupDiv").outerWidth())/2+$(window).scrollLeft())+"px"
                
             
             }); 
            
            $("#popup_mask").css("display","block"); 
            $("#popupDiv").css("display","block"); 
            
            $("body").css("overflow","hidden");
        });
        
        $("#popCloseBtn").click(function(event){
            $("#popup_mask").css("display","none"); 
            $("#popupDiv").css("display","none"); 
            $("body").css("overflow","auto");
        });
    });
 
    
    $(document).ready(function(){
        
        $("#invest").click(function(event){   
 
             $("#popupDiv2").css({
                "top": (($(window).height()-$("#popupDiv2").outerHeight())/4+$(window).scrollTop())+"px",
                "left": (($(window).width()-$("#popupDiv2").outerWidth())/2+$(window).scrollLeft())+"px"
                
             
             }); 
            
            $("#popup_mask2").css("display","block"); 
            $("#popupDiv2").css("display","block"); 
            
            $("body").css("overflow","hidden");
        });
        
        $("#popCloseBtn2").click(function(event){
            $("#popup_mask2").css("display","none"); 
            $("#popupDiv2").css("display","none"); 
            $("body").css("overflow","auto");
        });
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
    	           name : '<%=hmap.get("pId")%>',   // order 테이블에 들어갈 주문명 혹은 주문 번호
    	           amount : '<%=hmap.get("amount")%>', 	
    	           buyer_email : '<%=loginUser.getEmail()%>',// 구매자 email
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
    	          var userId = '<%=hmap.get("userId")%>';
    	          var pId = '<%=hmap.get("pId")%>';
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
    
  <%--   $(function(){
		$("#summernote").click(function(){
			location.href="<%=request.getContextPath()%>/insertnews.jsp";
		})
	}) --%>
    
    </script>
</body>
<br><br><br><br><br><br>
<footer id="footer">
	Copyright (C) 2018 
</footer> 
</html>
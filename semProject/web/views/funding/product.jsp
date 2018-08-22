<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- <script src="<%=request.getContextPath()%>/js/common/scroll.js"></script> -->
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
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


.title{
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
	width : 80%;
	height: 70%;
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
	background : #ededed;
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

</style>
<script>

$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})
	</script>

</head>
<body style="background: #eaeaea;">
	  <%@ include file="../common/headBar.jsp"%>  
<br><br><br><br><br>
<p class="title">[채권형] "다함께 사는 우리"
다울쿠키가 만들어갑니다.</p>
<div class="contents">
	<div id="pic">
		<img id="picture" src="../../images/product2.PNG"/>
	</div>
	<div id="text">
		<br>
		<div class="sortd">
			<div id="sort">채권</div>
		</div>
		<p id="p1">97<span id="p2">명 참여</span></p>
		<p id="p1">194,500,000<span id="p2">원/목표액 185,000,000원</span></p>
		<p id="p1">투자마감<span id="p2">(마감일 2018-xx-xx xx:00)</span></p>
		<div id="bar"></div>
		<div style=color:green;>xxx%</div>
		<br>
		<button id="select" type="button">투자하기</button>
		<button id="invest" type="button">투자하기2</button>
		<br>
		
		<br><br><br><br><br><br><br><br><br>
		
	</div>
</div>
<div class="integration">
		<div id="top_bar">
		<ul class="tabs">
			<li class="notitle"></li>
			<li class="tab-link current" data-tab="tab-1">상품소식</li>
			<li class="tab-link" data-tab="tab-2">상품Q&A</li>
			<li classs="tab-link" data-tab="tab-3">투자자모임</li>
		</ul>
		
		<hr>
		<div id="tab-1" class="tab-content current">
			상품소식 내용
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
    	<div> 투자 상품 명 : 맛있는 쿠키</div>
    	<div> 투자 금액 : 500원</div>
    	<div> 구좌수 선택 : </div>
    	<button id="confirm">결제 확인</button>
    	<button id="popCloseBtn">취소</button>
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
        
        $("#popCloseBtn").click(function(event){
            $("#popup_mask2").css("display","none"); 
            $("#popupDiv2").css("display","none"); 
            $("body").css("overflow","auto");
        });
     
    
    });
 
 

    </script>
</body>
<br><br><br><br><br><br>
<footer id="footer">
	Copyright (C) 2018 
</footer> 
</html>
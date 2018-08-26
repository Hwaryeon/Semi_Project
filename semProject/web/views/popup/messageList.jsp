<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>받은쪽지함</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/popup/message.css" type="text/css">

<script>
function del(a,b,c) {

if (confirm("정말 삭제하시겠습니까?")) {
	window.location='del.asp?hompyidx=12&Category='+a+'&idx='+b+'&Pageno='+c;
    return;
	}
else {
     
	return;
   }  	
}

function del2(a,b,c) {

if (confirm("선택하신 쪽지를 삭제합니다.\n정말 삭제하시겠습니까?")) {
document.frmList.action="deleteall.asp";
document.frmList.submit();
    return;
	}
else {
     
	return;
   }  	
}

function del3(a,b,c) {

if (confirm("받은쪽지함에 있는 쪽지를 전부 삭제합니다.\n정말 삭제하시겠습니까?")) {
window.location="deleteall2.asp?hompyidx=12&category="+a;

    return;
	}
else {
     
	return;
   }  	
}


function OnClickAllSel()
{
	var frm, i, bAllSel;
	frm = document.frmList;

	if (typeof(frm.chkMailList) == "undefined") 
		return;
	
	bAllSel = frm.chkAllSel.checked;
	if (typeof(frm.chkMailList.length) == "undefined") {
		frm.chkMailList.checked = bAllSel;
//		TRChanged(frm.chkMailList);
	} else {
		for (i=0; i<frm.chkMailList.length; i++) {
			frm.chkMailList[i].checked = bAllSel;
//			TRChanged(frm.chkMailList[i]);
		}
	}
}
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0">

<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><	 src="<%=request.getContextPath() %>/images/message/bg_01.gif" width="750" height="19"></td>
  </tr>
  <tr> 
    <td>
      <table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="19"><img src="<%=request.getContextPath() %>/images/message/bg_03.gif" width="19" height="512"></td>
          <td width="126" valign="top" background="<%=request.getContextPath() %>/images/message/bg_00.gif"><img src="<%=request.getContextPath() %>/images/message/logo.gif" width="126" height="102"><br>
            <img src="<%=request.getContextPath() %>/images/message/left_img_01.gif" width="126" height="31"><br>
            <a href="/memo/01.html?hompyidx=12"><img src="<%=request.getContextPath() %>/images/message/b_01_r.gif" width="126" height="21" border="0"></a><br>
            <a href="/memo/04.html?hompyidx=12"><img src="<%=request.getContextPath() %>/images/message/b_02.gif" width="126" height="21" border="0"></a><br>
            <a href="/memo/02.html?hompyidx=12"><img src="<%=request.getContextPath() %>/images/message/b_03.gif" width="126" height="21" border="0"></a><br>
            <a href="/memo/03.html?hompyidx=12"><img src="<%=request.getContextPath() %>/images/message/b_04.gif" width="126" height="21" border="0"></a><br>
            <img src="<%=request.getContextPath() %>/images/message/left_img_02.gif" width="126" height="102"> </td>
          <td width="586" valign="top" background="<%=request.getContextPath() %>/images/message/bg_00.gif">
            <table width="586" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="138" height="78" valign="bottom"><img src="<%=request.getContextPath() %>/images/message/title_01.gif" width="138" height="68"></td>
                <td width="448" valign="top"> 
                  <table width="448" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="52" align="right" valign="top"> 
                        <div style='padding-top:25px'></div>
						<table border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="5"><img src="<%=request.getContextPath() %>/images/message/bg_06.gif" width="10" height="21"></td>
                            <td bgcolor="#78C6CC" align="center"><b></b>님의
                               받은 쪽지함</td>
                            <td width="5"><img src="<%=request.getContextPath() %>/images/message/bg_07.gif" width="10" height="21"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td height="26"><img src="<%=request.getContextPath() %>/images/message/bg_05.gif" width="448" height="26"></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <table width="586" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td background="<%=request.getContextPath() %>/images/message/bg_10.gif" height="380" valign="top" align="center"> 
                  <br>
             <form name="frmList" method="post" action="">
				  <input type="hidden" name="category" value="받은쪽지함">
				  <input type="hidden" name="hompyidx" value="12">
                  <table width="553" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="35" width="31" align="center"><input name="chkAllSel" onClick="OnClickAllSel();" type="checkbox" id="allcheck" value="Y">
</td>
                      <td width="99" align="center"><table width="0" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="5"><img src="<%=request.getContextPath() %>/images/message/bg_08.gif" width="5" height="20"></td>
                          <td bgcolor="#D7D7D7" class="tt">보낸이</td>
                          <td width="5"><img src="<%=request.getContextPath() %>/images/message/bg_09.gif" width="5" height="20"></td>
                        </tr>
                      </table></td>
                      <td width="325" align="center">
                        <table width="0" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="5"><img src="<%=request.getContextPath() %>/images/message/bg_08.gif" width="5" height="20"></td>
                            <td bgcolor="#D7D7D7" class="tt">제 목</td>
                            <td width="5"><img src="<%=request.getContextPath() %>/images/message/bg_09.gif" width="5" height="20"></td>
                          </tr>
                        </table>
                      </td>
                      <td width="98" align="center">
                        <table width="0" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="5"><img src="<%=request.getContextPath() %>/images/message/bg_08.gif" width="5" height="20"></td>
                            <td bgcolor="#D7D7D7" class="tt">받은날짜</td>
                            <td width="5"><img src="<%=request.getContextPath() %>/images/message/bg_09.gif" width="5" height="20"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4"><img src="<%=request.getContextPath() %>/images/message/line_553.gif" width="553" height="1"></td>
                    </tr>
                    
                    <tr>
                      <td height="25" colspan="4" align="center" class="name">자료가
                        없습니다.</td>
                    </tr>
                    <tr>
                      <td colspan="4"><img src="<%=request.getContextPath() %>/images/message/line_553.gif" width="553" height="1"></td>
                    </tr>
                    
                  </table>
                  <table width="553" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="25">&nbsp;<a href="javascript:del2('받은쪽지함','','1');"><strong>[선택삭제하기]</strong> </a> <a href="javascript:del3('받은쪽지함','','1');"><strong>[받은쪽지함비우기]</strong></a></td>
                    </tr>
                  </table>
                  </form></td>
              </tr>
              <tr>
                <td><img src="<%=request.getContextPath() %>/images/message/bg_11.gif" width="586" height="13"></td>
              </tr>
              <tr>
                <td height="40" align="center">
                  <img src="<%=request.getContextPath() %>/images/message/b_prev.gif" width="40" height="9" align="absmiddle">
                  
                  <a href="01.html?hompyidx=12&Category=받은쪽지함&pageNo=&board=&div=" onMouseOver="window.status='Go To  page'; return true">[]</a>
                  
                  <img src="<%=request.getContextPath() %>/images/message/b_next.gif" width="40" height="9" align="absmiddle">
                  
</td>
              </tr>
            </table>
          </td>
          <td width="19"><img src="<%=request.getContextPath() %>/images/message/bg_04.gif" width="19" height="512"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td><img src="<%=request.getContextPath() %>/images/message/bg_02.gif" width="750" height="19"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>

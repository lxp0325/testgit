<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工艺类型维护</title>
<script>
	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});
    	
    	$('#bbcid').focus();
	});

	function save(){
		if(checkForm(brankCardForm)){
		$("img").removeAttr("onclick");
		brankCardForm.action = "insertBrankCard.action";
		brankCardForm.submit();
		}
	}
	function clean(){
		$("input[clean=clean]").val("");
	} 
</script>
</head>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form action="" method="post" name="brankCardForm">
<input type="hidden" value="${moduleID }" name="moduleID" id="moduleID" />
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD>
    <br/>
    <!-- ?? Start 
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD class=menubar_title width="15%"><img border='0' src='${ctx}/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>工艺类型维护</TD>
          <td align="left"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：工艺类型维护新增</td>
          <TD class=menubar_readme_text vAlign=bottom>
          			<TABLE cellSpacing=0 cellPadding=0 border=0>
                      <TBODY>
                        <TR>
                          <TD class=menubar_button id=button_0 
                onmouseover=javascript:MenuOnMouseOut(this); 
                title="关闭页面" onClick="JavaScript:parent.hidePopWin();parentSelectShow(parent.document.all.dengji.value);"
                onmouseout=javascript:MenuOnMouseOver(this);><IMG 
                  src="${ctx}/css/button/style/icons/close.gif" width="15" height="15" 
                  border=0 align=textTop>&nbsp;关闭页面</TD>
                        </TR>
                      </TBODY>
                    </TABLE>
          </TD></TR>
        <TR>
          <TD class=menubar_function_text colspan="3"><table></table></TD>
          <TD class=menubar_function_text align=right>&nbsp;</TD></TR>
        <TR>
          <TD colSpan=2 height=5></TD></TR></TBODY></TABLE><!-- ?? End --><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD style="PADDING-LEFT: 2px; HEIGHT: 1px" 
          background=${ctx}/img/pic/tab_bg.gif>
            </TD>
					</TR>
        <TR>
          <TD bgColor=#ffffff>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=1 background=${ctx}/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx}/img/pic/tab_bg.gif" width=1></TD>
                <TD 
                style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; PADDING-TOP: 5px; HEIGHT: 100px" 
                vAlign=top><DIV id=tabContent__1>
                  <DIV>
				  <table width="100%" id="title0"  border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                              <TBODY>
                                <TR>
                                  <TD width="5%"><div align="left"><img src="${ctx}/img/pic/DetailInfo.gif" width="86" height="20" ></div></TD>
                                  <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                    <table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                        <TR>
						   <TD width="9%" height="26" class="table_body">编码</TD>
			               <TD width="30%" class="table_none"><input class="text_input100" value="${brankCardPo.bbcid}" name="brankCardPo.bbcid" id="bbcid" maxlength="5" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '编码不能为空！'},{'Type' : Type.String, 'Formula' : Formula.Word, 'Message' : '编码只允许输入整数和字母！'}]" clean=clean /><label style="color:red;">&nbsp;*</label></TD>
						
						  <TD width="9%" height="26" class="table_body">银行卡名称</TD>
                          <TD colspan="3" class="table_none"><input class="text_input160" value="${brankCardPo.bbcname}" name="brankCardPo.bbcname" id="bbcname"  maxlength="20" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '银行卡名称不能为空！'}]"  clean=clean /><label style="color:red;">&nbsp;*</label></TD>
			            </TR>
			            <TR>
						   <TD width="9%" height="26" class="table_body">银行卡卡号</TD>
			               <TD width="30%" class="table_none"><input class="text_input200" value="${brankCardPo.bbccardid}" name="brankCardPo.bbccardid" id="bbccardid" maxlength="30" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '卡号不能为空！'},{'Type' : Type.String, 'Formula' : Formula.Word, 'Message' : '卡号只允许输入整数和字母！'}]" clean=clean /><label style="color:red;">&nbsp;*</label></TD>
						
						  <TD width="9%" height="26" class="table_body">开户人</TD>
                          <TD colspan="3" class="table_none"><input class="text_input160" value="${brankCardPo.bbcpersonname}" name="brankCardPo.bbcpersonname" id="bbcpersonname"  maxlength="20" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '开户人不能为空！'}]" clean=clean /><label style="color:red;">&nbsp;*</label></TD>
			            </TR>
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
                        <TR>
                          <TD>
                             <img src="${ctx}/img/newbtn/btn_save_0.png" btn=btn id="submitButton" title='保存' onClick="save()">	
                             <img src="${ctx}/img/newbtn/btn_empty_0.png" btn=btn title='清空' onClick="clean()">	
                          </TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                
                  </DIV>
                </DIV>
                  <!--?End--></TD>
                <TD width=1 background=${ctx}/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx}/img/pic/tab_bg.gif" 
width=1></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=${ctx}/img/pic/tab_bg.gif bgColor=#ffffff><IMG height=1 
            src="${ctx}/img/pic/tab_bg.gif" width=1></TD></TR></TBODY></TABLE><!--?? End--></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV>
    </form>
    </BODY>
</html>
<%@ include file="/WEB-INF/inc/message.jsp" %>
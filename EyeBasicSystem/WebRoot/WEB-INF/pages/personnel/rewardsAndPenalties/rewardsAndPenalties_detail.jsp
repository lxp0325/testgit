<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css"> 
<!--
.STYLE1 {color: #FF0000;
	font-weight: bold;
}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工奖惩信息详细</title>
</head>
<script>	
	function trim(str){ //删除左右两端的空格
	    return str.replace(/(^\s*)|(\s*$)/g, "");
	}
	
	function save(){
		if(checkForm(personInfoForm)){
			if($("#mrprewardsorpenalties").val() == ''){
				alert("请选择类型！");
				$("#mrprewardsorpenalties").focus();
				return;
			}
			
			document.all.submitButton.disabled="true";
			personInfoForm.action = "updateRewardsAndPenaltiesPo.action";
			personInfoForm.submit();
		}
	}
	
	function openPersonInfo(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initWagePersonInfoSel.action?isOpen=1&moduleID=${requestScope.moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initWagePersonInfoSel.action?isOpen=1&moduleID=${requestScope.moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【人员查询】";
	}
	
	function openCustomerValues(json){
		document.getElementById('mrppersonid').value = json.id;
		document.getElementById('mrppersonname').value = json.value;
	}
</script>
<body onkeydown="KeyDown()"    onhelp="Showhelp();return false;">
<form name="personInfoForm" method="post" action="">
<input type="hidden" name="type" id="type" value="" /> 
<input type="hidden" value="2" name="dengji" id="dengji" />
<input type="hidden" name="moduleID" value="${moduleID }">
 
<DIV>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <tr height="20"><td></td></tr>
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
                <TD width=1 background=${ctx }/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx }/img/pic/tab_bg.gif" width=1></TD>
                <TD 
                style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; PADDING-TOP: 5px; HEIGHT: 100px" 
                vAlign=top><DIV id=tabContent__1>
                  <DIV>
				  <table width="100%" id="title0"  border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                              <TBODY>
                                <TR>
                                  <TD width="5%"><div align="left"><img src="${ctx }/img/pic/DetailInfo.gif" width="86" height="20" ></div></TD>
                                  <TD width="95%" background="${ctx }/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                    <table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                        <TR>
                          <TD width="10%" height="26" class="table_body">员工奖惩号</TD>
			              <TD width="23%" class="table_none">${rewardsAndPenaltiesPo.mrprewardsandpenaltiesid }<input type="hidden" id="mrprewardsandpenaltiesid" class="text_input160" name="rewardsAndPenaltiesPo.mrprewardsandpenaltiesid" value="${rewardsAndPenaltiesPo.mrprewardsandpenaltiesid }"/>
                          </TD>
						  <TD width="10%" height="26" class="table_body">ID号</TD>
			              <TD width="23%" class="table_none">${rewardsAndPenaltiesPo.mrppersonid }
                          </TD>
						  <TD width="10%" height="26" class="table_body">姓名</TD>
                          <TD width="23%" class="table_none">${rewardsAndPenaltiesPo.mrppersonname }</TD>
                        </TR>
                        <TR>	
                           <TD class="table_body" width="9%">类型</TD>
                           <TD height="26" align="left" class="table_none" width="24%">
                            ${rewardsAndPenaltiesPo.mrprewardsorpenalties == '1' ? '奖励':'罚款' }
						  </TD>
						   <TD class="table_body" width="9%">金额</TD>
						   <TD height="26" align="left" class="table_none" width="24%" colspan="3">${rewardsAndPenaltiesPo.mrprewardsorpenaltiesnum }
						   元
						   </TD>
      	                </TR>
      	                <tr>
                          <TD class="table_body">备注</TD>
                          <TD class="table_none" colspan="5" height="60">
                          	${rewardsAndPenaltiesPo.mrpremark }&nbsp;
                          </TD>
                        </TR>
                           </TBODY>
                    </TABLE>  
                  </DIV>
                </DIV>
                  <!--?End--></TD>
                <TD width=1 background=${ctx }/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx }/img/pic/tab_bg.gif" 
width=1></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=${ctx }/img/pic/tab_bg.gif bgColor=#ffffff><IMG height=1 
            src="${ctx }/img/pic/tab_bg.gif" width=1></TD></TR></TBODY></TABLE><!--?? End--></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV></BODY></html>
  <%@ include file="/WEB-INF/inc/message.jsp" %>

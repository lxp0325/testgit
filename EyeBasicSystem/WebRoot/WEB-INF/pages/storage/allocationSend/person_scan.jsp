<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/orderItem.js" ></script>
<script type="text/javascript" src="${ctx}/js/priceCount.js" ></script>
<title>条码扫描</title>
</head>
<script>

	$(document).ready(function (){
		$("#inputfocus").select();
		$("#inputfocus").focus();
		$("#ssesbsalesid").val(window.parent.$("#salesids").val());
		$("#ssesbdragstype").val(window.parent.$("#salestypes").val());
	});
	
	function getPersonDetails(obj){
		if(event.keyCode==13){
			$("#personcardid").val($(obj).val());
			if($("#personcardid").val() == '' || $("#personcardid").val() == null){
				alert("请扫描员工卡号！");
				return;
			}
			$("input").removeAttr("onkeypress");
			barcodeScanForm.action="updateAllocationSend.action?moduleID=${moduleID}&personcardid="+$("#personcardid").val();
			barcodeScanForm.submit();
		}
	}

</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' } style="overflow：none;">
<form name="barcodeScanForm" method="post">
<input type="hidden" name="type" id="type" value="" /> 
<input type="hidden" id="moduleID" name="moduleID" value="${requestScope.moduleID }" />
<input type="text" style="display:none" />
<input type="hidden" name="categoryid" id="categoryid" value="${categoryid }" /> 
<input type="hidden" id="personcardid" name="personcardid" value="${ppo.cardid }"/>
<input type="hidden" id="ssesbsalesid" name="ssesbsalesid" value=""/>
<input type="hidden" id="ssesbdragstype" name="ssesbdragstype" value=""/>
<input type="hidden" id="personid" name="personid" value="${ppo.id }"/>
<br/>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 class="privateBorder">
  <TBODY>
  <TR>
    <TD vAlign=top>
        <table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 >
        	<tr>
        		<td class="table_body" width="30%" >
        			员工卡号
        		</td>
        		<td class="table_none" width="70%">
        			<input id="inputfocus" type="text" value="${ppo.cardid }" maxlength="26" class="text_input200" onkeypress="getPersonDetails(this)"/>
           		</td>
           	</tr>
           </TABLE>
      </TD>
  </TR>
  </TBODY>
</TABLE>
</form>
</body></html>
<%@ include file="/WEB-INF/inc/message.jsp" %>
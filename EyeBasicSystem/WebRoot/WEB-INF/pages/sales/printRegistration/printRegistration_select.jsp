<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>银台</title>
</head>
<script>	
	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});
		if('${systemParameterPo.fsphisflag}' == '0' || '${person.bdplinkhisflag}' == '0'){
			document.getElementById('smecimemberid').focus(); 
        }
	});

	/**
	 *查看
	 */
	function selCustomer(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initSelCustomerInfoWin.action",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initSelCustomerInfoWin.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【会员查询】";
		printPrescriptionForm.action = "selectPrintRegistration.action";
    }
	
	
  
	/**
	 *详情
	 */
	function details(id){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initDetailsCustomerInfo.action?hid="+id,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initDetailsCustomerInfo.action?hid="+id,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【会员详细】";
	}	
	
	function setCustomer(memberid){
		document.getElementById('smecimemberid').value = memberid;
		document.forms[0].submit();
	}

	/**
	 * 挂号单打印主程序入口
	 * @salseID	会员卡号；
	 */
	function setReportEvent_GHF(billID,personName,customerName){
		var DataURL='';

		if ($.trim('${systemParameterPo.fspregisterbillname}') == ''){
            alert('请先配置挂号单样式!');
            return;
        }else{
    		if($.trim('${systemParameterPo.fspregisterbillserver}') =="1"){
    			DataURL="report.action?reportlet=${systemParameterPo.fspregisterbillname}&salseID="+billID;
    		}else if($.trim('${systemParameterPo.fspregisterbillserver}') =="2"){
    			DataURL = '<%= getServletContext().getInitParameter("rptUrl")%>';

    			DataURL+="eims_reporting/${systemParameterPo.fspregisterbillname}&salseID="+billID;
    			DataURL+="&personName=EncodeUtf8("+ personName +")";
    			DataURL+="&customerName="+customerName;
    			DataURL+="&rs:Command=Render";    			
    		}
        } 		
        
	    window.open (DataURL, '挂号单', 'fullscreen=no, top=150,left=150, toolbar=no, menubar=no, scrollbars=yes, location=no, status=no,resizable=yes');

	    printGSL_GHF('${departmentID}',billID);      
	}
	
	
	/**
	 *回车事件
	 */
function selectCust(flag){
    if(flag){
	    document.forms[0].submit();
    }
}
function selectCustomer(){
    if('${person.bdplinkhisflag}' == '1' && '${systemParameterPo.fsphisflag}' == '2'){
            alert('此门店已经连接HIS系统，不能查询会员!');
         return ;
	}
	if(document.getElementById('smecimemberid').value.trim() != ''){
		if(event.keyCode == 13){
				document.forms[0].submit();
		}
		printPrescriptionForm.action = "selectPrintRegistration.action";
	}
}
window.onload=function(){
    if('${isGO}'=='1' && $('#smecimemberid').val() == ''){
    	$('img[his=his]').trigger("click");
	}
}
</script>
<jsp:include page="/hisCusWin_js.jsp" flush="true" />
<body ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="printPrescriptionForm" method="post" action="">
<input type="hidden" name="hid">
<input type="hidden" name="type" id="type" value="" /> 
<input type="hidden" id="customerID" name="customerID" value="${requestScope.smecicustomerid }">
<input type="hidden" id="moduleID" name="moduleID" value="${requestScope.moduleID }">

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
          <TR>
            <TD class=menubar_title width="15%"><img border='0' src='${ctx}/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>银台</TD>
            <TD align="left"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：打印挂号单</TD>
          </TR>
          <TR>
            <TD class=menubar_function_text colspan="3"><table></table></TD>
          </TR>
        </TBODY>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <tr height="20"><td></td></tr>
        <TR>
          <TD style="PADDING-LEFT: 2px; HEIGHT: 1px" 
          background=${ctx}/img/pic/tab_bg.gif>
				</TD></TR>
        <TR>
          <TD bgColor=#ffffff>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=1 background=${ctx}/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx}/img/pic/tab_bg.gif" width=1></TD>
                <TD 
                style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px; HEIGHT: 100px" 
                vAlign=top><DIV id=tabContent__1>
                  <DIV>
                  
                  <fieldset>
						<legend>顾客资料</legend>
						<TABLE width="98%" border=0 align=center cellpadding=1 cellspacing=1 class="privateTable privateBorder">
					      <tr>
					        <td bgcolor="#cadee8" height="26">
					        
					          <li class="horizontal">卡号&nbsp;
					                <input type="text" id="smecimemberid" name="customerInfoPo.smecimemberid" class="text_input100" value="${customerInfoPo.smecimemberid }"
					                 onkeyup="selectCustomer();"${ systemParameterPo.fsphisflag == '2' && person.bdplinkhisflag == '1' ? 'readonly=readonly':'' } >
					               <input type="hidden" id="smecicustomerid" name="smecicustomerid" class="text_input100" value="${customerInfoPo.smecicustomerid }">
					          </li>
					            <li class="horizontal">
					              <img src="${ctx }/img/newbtn/btn_hydq_0.png" btn=btn his=his title='查找' >
					              <img src="${ctx }/img/newbtn/btn_search_0.png" btn=btn name="button22" title='查询' onclick="selCustomer();" >
					            </li>
					          <li class="horizontal">姓名&nbsp;
					                <input class="text_input60" readOnly="readOnly" value="${customerInfoPo.smeciname }">
					          </li>
					          <li class="horizontal">性别&nbsp;
					                <input value="${not empty(customerInfoPo.smecisex) ? (customerInfoPo.smecisex == '0' ? '男' : '女') : ''}" class="text_input40" readOnly="readOnly">
					          </li>
					          <li class="horizontal">年龄&nbsp;
					                <input value="${customerInfoPo.fmmdown }" class="text_input40" readOnly="readOnly">
					          </li>
					          <li class="horizontal">&nbsp;
					          <c:if test="${empty(customerInfoPo.smecicustomerid)}">
					          </c:if>
					          <c:if test="${not empty(customerInfoPo.smecicustomerid)}">
					          	<img src="${ctx }/img/newbtn/btn_details_0.png" btn=btn name="button32" title='详细' onClick="javascript:details('${customerInfoPo.smecicustomerid }');" >
					          </c:if>
					          </li>
					      </tr>
					    </table>
					</fieldset>
                  <br>
                   <c:if test="${not empty(registeredDetailsPosList)}"> 
                   <table width="100%"   border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                      <TBODY>
                        <TR>
                          <TD width="5%"><div align="left"><img src="${ctx}/img/pic/queryInfo.gif" width="86" height="20"></div></TD>
                          <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <TABLE width="100%" border=0 cellSpacing=1 class="Privateborder" id="ctl00_PageBody_GridView1">
                      <TBODY>
                        <TR class=table_title align=middle>
                          <TH width="4%" scope=col>操作</TH>
                          <TH width="25%" height="26" scope=col>挂号流水号</TH>
                          <TH width="15%" scope=col>挂号员</TH>
                          <TH width="15%" scope=col>收银员</TH>
                          <TH width="15%" scope=col>金额</TH>
                          <TH scope=col>收银日期</TH>
                          </TR>
                        <s:iterator  value="registeredDetailsPosList">
                        <TR class="row" onMouseOver="mover(this,'#a2c1eb')" onMouseOut="mout(this,'#cadee8')">
                          <TD width="4%" height="26">
                          		<img src="${ctx }/img/newbtn/print_0.png" btn=btn id="optometryid" name="sopipoptometryid" title="打印" onclick="setReportEvent_GHF('${scrrddetailsid }','${scrrdcashername }','${scrrdcustomerid}')" icon="icon-print">
                          </TD>
                          <td>${scrrddetailsid }</td>
 						  <TD>${scrrdcashername}</TD>
                          <TD>${scrrdregister}</TD>
                          <TD>${scrrdmoney }</TD>
                          <TD>${scrrdcasherdate }</TD>
                        </TR>
                        </s:iterator>
                      </TBODY>
                    </TABLE>
                  </c:if>
                  
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
    <TD height=5>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<!--     <form id="report" name="report" action="" method="post" target="_blank">-->
</form>
</body></html>
<%@ include file="/WEB-INF/inc/message.jsp" %>
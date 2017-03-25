<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});

		if($('#customerReadonly').val() == null){
			document.getElementById('smecimemberid').focus();
			$('#smecimemberid').keyup(function(){
				selectCustomer();
			});
		}else {
			document.getElementById('smecimemberid').readOnly = true;
		}
	});

	function customerDetails(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initDetailsCustomerInfo.action?hid=${customerInfoPo.smecicustomerid}",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initDetailsCustomerInfo.action?hid=${customerInfoPo.smecicustomerid}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【会员详细】";
	}

</script>
<fieldset>
	<legend>
		<table>
			<tr>
				<td valign="middle">
					验光信息
			  </td>
			</tr>
		</table>
	</legend>
	<TABLE width="98%" id="title1" border=0 align=center cellpadding=1 cellspacing=1 class="privateTable privateBorder">
	  <tr>
	    <td bgcolor="#cadee8"><li class="horizontal">验光号&nbsp;
	            <input type="text" name="optometryPo.sopoyoptometryid" class="text_input200" value="${optometryPo.sopoyoptometryid }" readOnly="readOnly">
	            <input type="hidden" value="${optometryPo.sopoyoptometryid }" name="optometryID"/>
	            <input type="hidden" name="optometryPo.sopoyoptometrybasicid" class="text_input200" value="${optometryPo.sopoyoptometrybasicid }" readOnly="readOnly">
	      </li>
	      <li class="horizontal">验光师&nbsp;
	            <input name="" class="text_input100" readOnly="readOnly" value="${optometryPo.sopoypersonname }">
	      </li>
	      <li class="horizontal">日期&nbsp;
	            <input name="userName423" class="text_input80" readOnly="readOnly" value="${fn:substring(optometryPo.sopoytime, 0, 10) }">
	      </li>
	  </tr>
</table>
 </fieldset>			
<br />		
 
<fieldset>
	<legend>顾客资料</legend>
	<TABLE width="98%" border=0 align=center cellpadding=1 cellspacing=1 class="privateTable privateBorder">
      <tr>
        <td bgcolor="#cadee8">
          <li class="horizontal">卡号&nbsp;
            <input type="text" id="smecimemberid" name="customerInfoPo.smecimemberid" class="text_input100" value="${customerInfoPo.smecimemberid }" >
            <input type="hidden" id="isfresh" name="isfresh" value="${customerInfoPo.smecimemberid }" >
            <input type="hidden" id="smecicustomerid" name="customerInfoPo.smecicustomerid" value="${customerInfoPo.smecicustomerid }">
            <input type="hidden" name="memberID" value="${ memberID}"/>
          </li>
        
          <li class="horizontal">
            <img name="button22" src="${ctx }/img/newbtn/btn_search_0.png" btn=btn title="查询" onclick="selCustomer();" id='searchbutton'>
          </li>
          <li class="horizontal">姓名&nbsp;
                <input class="text_input60" name="customerInfoPo.smeciname" readOnly="readOnly" value="${customerInfoPo.smeciname }">
          </li>
          <li class="horizontal">性别&nbsp;
                <input value="${not empty(customerInfoPo.smecisex) ? (customerInfoPo.smecisex == '0' ? '男' : '女') : ''}" class="text_input40" readOnly="readOnly">
          </li>
          <li class="horizontal">年龄&nbsp;
                <input value="${customerInfoPo.fmmage}" class="text_input40" readOnly="readOnly">
          </li>
          <li class="horizontal">&nbsp;
          <c:if test="${dontshow != '1'}">
          	<c:if test="${empty(customerInfoPo.smecicustomerid)}">
          	</c:if>
          	<c:if test="${not empty(customerInfoPo.smecicustomerid)}">
            	<img name="button32" title='详细' src="${ctx }/img/newbtn/btn_details_0.png" btn=btn onClick="javascript:customerDetails('${customerInfoPo.smecicustomerid }');">
          	</c:if>
          </c:if>
          </li>
      </tr>
    </table>
</fieldset>
<script>

	
	function selectCustomer(){
		if(document.getElementById('smecimemberid').value.trim() != '')
			if(event.keyCode == 13)
				document.forms[0].submit();
	}
	
	function details(id){
		showPopWin(""," ?hid="+id,screen.width-200,screen.height-200, '',null,true);
		selectHidden();
	}	
	function selCustomer(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initSelCustomerInfoWin.action",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initSelCustomerInfoWin.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【会员查询】";
	}
	function setCustomer(memberid){
		document.getElementById('smecimemberid').value = memberid;
		document.forms[0].submit();
	}

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>取镜处收货管理</title>
</head>
<script>
	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});
    	
if($("#title1").is(":visible"))
        {
        	$("input:text")[0].focus();
        }
	});
	
	function doList(link,perPage_Select,perPage_Text_Hidden){
     	var objOne = document.all[perPage_Select];
	  	document.all[perPage_Text_Hidden].value = objOne.options[objOne.selectedIndex].value;
	  	shopCodeTakeForm.action=link;
	  	shopCodeTakeForm.submit();
		showLoadingBar();
	}

	function selectContact(obj){
		var act = document.activeElement.id; 
		
		if(act == "pageNos"){
			$('#'+act).onkeyup();
		}else{
			if(event.keyCode==13){
				search();
			}
		}
	}
	function search(){
		$("img").removeAttr("onclick");
		shopCodeTakeForm.action = "selectShopCodeTake.action";
		shopCodeTakeForm.submit();
		showLoadingBar();
	}	

	function clean(){
	    document.all.shopsalesid.value="";
	    document.all.ssesbsalesdatestarttime.value="";
	    document.all.ssesbsalesdateendtime.value="";
	    document.all.shoppersonName.value="";
	    document.all.memberid.value="";
	    $('#djsbm').val('');
	    document.all.psbillid.value="";
	    
	}	
	function update(ssesbsalesid , ssesborderstype)
	{
		document.all.sales.value=ssesbsalesid;
		document.all.salesType.value=ssesborderstype;
		document.getElementById(ssesbsalesid).disabled="true";
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initInsertInTranit.action?sales="+ssesbsalesid+"&salesType="+ssesborderstype+"&moduleID="+$('#moduleID').val(),400,140,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initInsertInTranit.action?sales="+ssesbsalesid+"&salesType="+ssesborderstype+"&moduleID="+$('#moduleID').val(),400,140,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【取镜处收货】";
	}
	
	function shopTake(ssesbsalesid , ssesborderstype){
		document.all.sales.value=ssesbsalesid;
		document.all.salesType.value=ssesborderstype;
		document.getElementById(ssesbsalesid).disabled="true";
		shopCodeTakeForm.action = "insertInTranit.action?sales="+ssesbsalesid+"&salesType="+ssesborderstype+"&moduleID="+$('#moduleID').val();
		shopCodeTakeForm.submit();
	}
	
	function permissionMessage(){
       alert('您无此操作权限');
	}
	
	
	
	//打开配镜详细信息 
	 function printDetails(billID){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("selectInTransitDetails.action?hid="+billID,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("selectInTransitDetails.action?hid="+billID,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【配镜单详细】";
    }  
    
    /** 
     * 时间对象的格式化
     */  
    Date.prototype.format = function(format) {  
        /* 
         * eg:format="YYYY-MM-dd hh:mm:ss"; 
         */  
        var o = {  
            "M+" :this.getMonth() + 1, // month  
            "d+" :this.getDate(), // day  
            "h+" :this.getHours(), // hour  
            "m+" :this.getMinutes(), // minute  
            "s+" :this.getSeconds(), // second  
            "q+" :Math.floor((this.getMonth() + 3) / 3), // quarter  
            "S" :this.getMilliseconds()  
        // millisecond  
        }  
      
        if (/(y+)/.test(format)) {  
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
        }  
      
        for ( var k in o) {  
            if (new RegExp("(" + k + ")").test(format)) {  
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
            }  
        }  
        return format;  
    }

	function today(){
		
		var now = new Date().format("yyyy-MM-dd");  //设置你想要的格式
		
		document.getElementById('ssesbsalesdatestarttime').value = now;
		document.getElementById('ssesbsalesdateendtime').value = now;		
	}
	function chkAll(){  
        var chks=document.all.chks;
        $('input[id=chk]').each(function(){ 
            $(this).attr("checked",chks.checked);
        }); 
    }
	function updatebulk()
	{
		if ($('#InTransitCount').val() == 0){
		    alert("此功能对应的在途点已被停用,请先启用!");
		    return;
		}
		if(checkForm(document.all.shopCodeTakeForm)){
			if($('input[name=chk]:checked').length==0){
				alert("请选择配镜单号!");
				return;
			}
		}
		var salesids = ""; 
		var memberids = "";
		$("input[name=chk]:checked").each(function (){
			salesids = salesids + $(this).val()+",";			
			memberids = memberids + $(this).attr("memberIDs")+",";
		});
		
		salesids = salesids.substring(0,salesids.length-1);
		memberids = memberids.substring(0,memberids.length-1);
		$("#salesids").val(salesids);
		$("#memberids").val(memberids);
		
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;

		if(is_iPad()){
			showPopWin("initInsertInTranitBulk.action?moduleID=${moduleID}",400,140,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initInsertInTranitBulk.action?moduleID=${moduleID}",400,140,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【取镜处批量收货】";
	}
	
	function selectSalesID(){
		if(document.getElementById('shopsalesid').value.trim() != ''){
			if(event.keyCode == 13){
				search();
			}
	    }
	}
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="shopCodeTakeForm" method="post" action="">
<input type="hidden" name="hid">
<input type="hidden" name="type" id="type" value="" /> 
<input type="hidden" id="moduleID" name="moduleID" value="${requestScope.moduleID}">
<input type="hidden" id="sales" name="sales" value="${ssesbsalesid}">
<input type="hidden" id="salesType" name="salesType" value="${ssesborderstype}">
<input type="hidden" id="salesids" name="salesids" value="">
<input type="hidden" id="memberids" name="memberids" value="">

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
          <TR>
            <TD class=menubar_title width="15%"><img border='0' src='${ctx}/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>配镜管理</TD>
            <TD align="left"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：取镜处收货 </TD>
            
            <td align="right" valign="bottom">&nbsp;
            	<img src="${ctx }/img/newbtn/btn_isshowsearch_0.png" btn=btn title="显隐查询条件" onClick="JavaScript:searchContentShowOrHidden('title0,title1,title2');changeShowOrHidden();" />
            </td>
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
                style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; PADDING-TOP: 5px; HEIGHT: 100px" 
                vAlign=top><DIV id=tabContent__1>
                  <DIV>
                    <table width="100%" id="title0"  border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                              <TBODY>
                                <TR>
                                  <TD width="5%"><div><img src="${ctx}/img/pic/queryCondition.gif" width="86" height="20" ></div></TD>
                                  <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                            </TABLE>
							<table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
					  	<TR>
						   <TD width="8%" height="26" class="table_body">配镜单号</TD>
			               <TD class="table_none" width="23%">
                            <input class="text_input160" type="text"  id="shopsalesid" name="shopsalesid" value="${requestScope.shopsalesid}" onkeyup="selectSalesID()">
			               </TD>
			               <TD width="8%" height="26" class="table_body">会员卡号</TD>
			               <TD class="table_none" width="23%">
                            <input class="text_input160" type="text"  id="memberid" name="memberid" value="${requestScope.memberid}">
			               </TD>
			               <TD width="8%" height="26" class="table_body">配镜日期</TD>
                           <TD class="table_none" width="30%">
                           <li class="horizontal_onlyRight">
                           <input id="ssesbsalesdatestarttime"
					       name="ssesbsalesdatestarttime" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'ssesbsalesdateendtime\')}'})"
					       value="${requestScope.ssesbsalesdatestarttime}" /> 至 
					       <input id="ssesbsalesdateendtime"
					       name="ssesbsalesdateendtime" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'ssesbsalesdatestarttime\')}'})" 
					        value="${requestScope.ssesbsalesdateendtime}" />
					       </li>
					       <li class="horizontal_onlyRight">
					  	   <img src="${ctx }/img/newbtn/btn_today_0.png" btn=btn title="今天" onClick="today()">
					  	   </li>
			               </TD>
                        </TR>  
                        	<TR>
                        	 <TD width="8%" height="26" class="table_body">顾客姓名</TD>
			               <TD class="table_none" >
			               <input class="text_input160" type="text"  id="shoppersonName" name="shoppersonName" value="${requestScope.shoppersonName}">
                           </TD>
                           <TD width="8%" height="26" class="table_body">配送单号</TD>
			               <TD class="table_none" width="23%"  colspan="3">
                            <input class="text_input160" type="text"  id="psbillid" name="psbillid" value="${psbillid}">
			               </TD>
                        </TR> 
                        
                         <c:if test="${systemParameterPo.fspdjsbm == '1'}">
                         <TR>
			               <TD height="26" class="table_body">单据识别码</TD>
			               <TD class="table_none" colspan="5">
                              <input class="text_input160" type="text" id="djsbm" name="djsbm" value="${requestScope.djsbm}" onkeyup="selectContact(this)"/>
			               </TD>

                        </TR> 
                        </c:if>                              
                      </TBODY>
                    </TABLE>
                    <c:if test="${(permissionPo.keya==1)}"> 
                    <table id="title2" cellspacing="2" width="100%">
						<tr height="10">
							<td>
								<img src="${ctx }/img/newbtn/btn_search_0.png" btn=btn id="submitButton" title='查询' onClick="javascript:search()">
								<img src="${ctx }/img/newbtn/btn_empty_0.png" btn=btn title="清空" onClick="clean()">
							</td>
							<TD width="50%" align="right" valign="bottom">
							   <c:if test="${permissionPo.keyc==1}">
								 <img btn=btn  src="${ctx }/img/newbtn/btn_plsh_0.png" title="批量收货" onClick="javascript:updatebulk()">
							   </c:if>
							 </td>
						</tr>
					</table>
					</c:if>
					<!-- Loading Bar ----------------------------------------------------------------------------------------------------------------->
					<table id="loadingBar" width="100%" STYLE="display:none">
					  <tr><td height="10">&nbsp;</td></tr>
					  <tr>                         
					    <td style="padding-top:5px; padding-left:5px;padding-right:5px;" >
					    <div STYLE="padding-left:5px;border:1px dashed #000;"><img src="${ctx}/img/sys/loading.gif" border="0" width="50"/>正在进行查询，由于数据量较大可能需要较长时间，请耐心等候...</div>
						<script>
							function showLoadingBar(){
								gPopupMask.style.height=theBody.scrollHeight+107+"px";gPopupMask.style.width=theBody.scrollWidth+"px";gPopupMask.style.display = "block";
								document.getElementById("loadingBar").style.display="";
							}
						</script>                            
					    </td>
					</tr>
					</table>                      
					<!-- Loading Bar ----------------------------------------------------------------------------------------------------------------->
					<c:if test="${not empty(shopCodeTakeList)}"> 
					<table width="100%"   border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                              <TBODY>
                                <TR>
                                  <TD width="5%"><div><img src="${ctx}/img/pic/queryInfo.gif" width="86" height="20"></div></TD>
                                  <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                     </TABLE>

					  <table width="100%" border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder">
                      <TBODY>
                        <TR class=table_title align=middle>
                         <c:if test="${permissionPo.keyc==1}">
                          <TH width="5%" scope=col>全选<input type="checkbox" id="chks" name="chks" onclick="chkAll()"></TH>
                         </c:if>
                          <TH width="4%" scope=col>确认</TH>
                          <TH width="25%" height="26" scope=col>配镜单号</TH>
                          <TH width="10%" scope=col>配镜类型</TH>
						  <TH width="15%" scope=col>顾客姓名</TH>						
						  <TH width="15%" scope=col>联系电话</TH>
						  <TH width="15%" scope=col>配镜日期</TH>
						  <TH width="20%" scope=col>取镜日期</TH>
						</TR>
						<s:iterator value="shopCodeTakeList">
                        <TR class="row" onMouseOver="mover(this,'#a2c1eb')" onMouseOut="mout(this,'#cadee8')">
                        <c:if test="${permissionPo.keyc==1}">
                          <TD width="5%">

			                  <input type="checkbox" id="chk" name="chk" value="${ssesbsalesid }" memberIDs="${ssesbMemberId}">

			              </TD>
			            </c:if>
                          <TD width="4%">
                             <c:if test="${(permissionPo.keyb==1)}">
		                     	<img src="${ctx }/img/newbtn/btn_define_0.png" btn=btn id='${ssesbsalesid}' title='确认' onClick="javascript:update('${ssesbsalesid}','${ssesborderstype}')">
		                     </c:if>
		                  </TD>
                          <TD height="26"><a href="javascript:void(0);" onclick="printDetails('${ssesbsalesid }')" >${ssesbsalesid}</a></TD>
                          <TD>
                             <c:choose>
                          		<c:when test="${ssesborderstype=='1'}">框镜成品</c:when>
                          		<c:when test="${ssesborderstype=='2'}">框镜订做</c:when>
                          		<c:when test="${ssesborderstype=='3'}">隐形成品</c:when>
                          		<c:when test="${ssesborderstype=='4'}">隐形订做</c:when>
                          		<c:when test="${ssesborderstype=='5'}">辅料</c:when>
                          		<c:otherwise>&nbsp;</c:otherwise>
                          	</c:choose>
                          </TD>
                          <TD>${ssesbpersonName}</TD>
                          <TD>${ssesbphone}</TD>
                          <TD>${fn:substring(ssesbsalesdatetime,0,16)}</TD>
                          <TD>${fn:substring(ssesbtakeglassdata,0,16)}</TD>
						</TR>
						</s:iterator>						  
                      </TBODY>
                    </TABLE>
                    <!-- BEGIN 分页-->
						<div id="dividePage" align="center">        
							<jsp:include page="/WEB-INF/inc/Pagination.jsp" />
						</div>
					<!-- END 分页 -->
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
    <TD height=5></TD></TR></TBODY></TABLE></DIV>
</form>
</body></html>
<%@ include file="/WEB-INF/inc/message.jsp" %>
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
<title>误期管理</title>
</head>
<script>	
	function doList(link,perPage_Select,perPage_Text_Hidden){
     	var objOne = document.all[perPage_Select];
	  	document.all[perPage_Text_Hidden].value = objOne.options[objOne.selectedIndex].value;
	  	storageDelaysReminderSelForm.action=link;
	  	storageDelaysReminderSelForm.submit();
		showLoadingBar();
	}
	
	function insert(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("initStorageDelaysReminderRegistration.action?moduleID=${requestScope.moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initStorageDelaysReminderRegistration.action?moduleID=${requestScope.moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		
		document.getElementById('popupTitle').innerHTML="【误期登记新增】";
	
	}
	/*查看*/
	function search(){
		$("img").removeAttr("onclick");
		storageDelaysReminderSelForm.action = "selectStorageDelaysReminder.action";
		storageDelaysReminderSelForm.submit();
		showLoadingBar();
	}
		
	function del(id,ssedrsalesid){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("initDelaysReminderDel.action?hid="+id + '&ssedrsalesid=' + ssedrsalesid+"&moduleID=${requestScope.moduleID}",400,140,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initDelaysReminderDel.action?hid="+id + '&ssedrsalesid=' + ssedrsalesid+"&moduleID=${requestScope.moduleID}",450,140,topRows,topCols,returnRefresh(true),true);
		}
		
		document.getElementById('popupTitle').innerHTML="【误期登记删除】";
	}

	function clean(){
		document.getElementById('salesid').value = "";
		document.getElementById('customerName').value = "";
		document.getElementById('mirrorcheckstartdate').value = "";
		document.getElementById('mirrorcheckenddate').value = "";
		document.getElementById('expectedcheckstartdate').value = "";
		document.getElementById('expectedcheckenddate').value = "";
		document.getElementById('noticeperson').value = "";
		document.getElementById('noticestartdate').value = "";
		document.getElementById('noticeenddate').value = "";
		document.getElementById('noticestatus').value = "";
		
	}	
	function permissionMessage(){
       alert('您无此操作权限');
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
		
		document.getElementById('mirrorcheckstartdate').value = now;
		document.getElementById('mirrorcheckenddate').value = now;		
	}
	
	function today1(){
		
		var now = new Date().format("yyyy-MM-dd");  //设置你想要的格式
		
		document.getElementById('expectedcheckstartdate').value = now;
		document.getElementById('expectedcheckenddate').value = now;		
	}
	
	function today2(){
		
		var now = new Date().format("yyyy-MM-dd");  //设置你想要的格式
		
		document.getElementById('noticestartdate').value = now;
		document.getElementById('noticeenddate').value = now;		
	}
	
	$(document).ready(function() { 
$("img[btn=btn]").attr("style","cursor: hand"); 
$("img[btn=btn]").mouseover(function () { 
$(this).attr("src",$(this).attr("src").replace("0","1")); 
}).mouseout(function () { 
$(this).attr("src",$(this).attr("src").replace("1","0")); 
}); 
});
	
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="storageDelaysReminderSelForm" method="post" action="">
<input type="hidden" name="hid">
<input type="hidden" name="type" id="type" value="" />
<input type="hidden" name="moduleID" value="${requestScope.moduleID }">

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
          <TR>
            <TD class=menubar_title width="15%"><img border='0' src='${ctx}/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>误期管理</TD>
            <TD align="left"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：误期查询</TD>
             <td align="right" width="40%" valign="bottom">
            	<c:if test="${(permissionPo.keyb==1)}">
            		<img src="${ctx }/img/newbtn/btn_wqds_0.png" title="误期登记" onClick="insert()">
            	</c:if>
				<img src="${ctx }/img/newbtn/btn_isshowsearch_0.png" btn=btn title="显隐查询条件" onClick="JavaScript:searchContentShowOrHidden('title0,title1,title2');changeShowOrHidden();"  />
   			</td>
          </TR>
          <TR>
            <TD class=menubar_function_text colspan="3">
            	<table></table>
            	</TD>
          </TR>
        </TBODY>
      </TABLE><br/>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
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
                          <TD width="10%" height="30" class="table_body">配镜单号</TD>
                          <TD width="40%" class="table_none">
                          	<input class="text_input200" type="text"  id="salesid" name="salesid" value="${salesid}">
                          </TD>
                          <TD width="10%" class="table_body">顾客姓名</TD>
                          <TD width="40%" class="table_none">
                          	<input class="text_input200" type="text" id="customerName" name="customerName" value="${customerName}" >
						  </TD>
                        </TR> 
                        <TR>
                          <TD width="10%" height="30" class="table_body">原取镜日期</TD>
                          <TD class="table_none">
                             <li class="horizontal_onlyRight"> <input class="text_input100"
				               id="mirrorcheckstartdate"
						       name="mirrorcheckstartdate" value="${requestScope.ssedrmirrorcheckstartdate }"
						       type="text" 
						       onFocus="WdatePicker({readOnly:true})"
						       MAXDATE="#F{document.getElementById('mirrorcheckenddate').value}" 
						       readonly="readonly" />
						       至
					         <input class="text_input100"
						       id="mirrorcheckenddate"
						       name="mirrorcheckenddate" value="${requestScope.ssedrmirrorcheckenddate }"
						       type="text" 
						       onFocus="WdatePicker({readOnly:true})"
						       MINDATE="#F{document.getElementById('mirrorcheckstartdate').value}"
						       readonly="readonly" /></li><li class="horizontal_onlyRight">
<img src="${ctx }/img/newbtn/btn_today_0.png"  btn=btn title="今天" onClick="today()"></li>
			               </TD>
                          <TD width="10%" class="table_body">预计取镜日期</TD>
                          <TD class="table_none">
                            <li class="horizontal_onlyRight">  <input class="text_input100"
				               id="expectedcheckstartdate"
						       name="expectedcheckstartdate" value="${requestScope.ssedrexpectedcheckstartdate }"
						       type="text" 
						       onFocus="WdatePicker({readOnly:true})"
						       MAXDATE="#F{document.getElementById('expectedcheckenddate').value}" 
						       readonly="readonly" />
						       至
					         <input class="text_input100"
						       id="expectedcheckenddate"
						       name="expectedcheckenddate" value="${requestScope.ssedrexpectedcheckenddate }"
						       type="text" 
						       onFocus="WdatePicker({readOnly:true})"
						       MINDATE="#F{document.getElementById('expectedcheckstartdate').value}"
						       readonly="readonly" /></li><li class="horizontal_onlyRight">
<img src="${ctx }/img/newbtn/btn_today_0.png"  btn=btn title="今天" onClick="today1()"></li>
			               </TD>
                        </TR>
                        <TR> 
					      <TD width="10%" height="30" class="table_body">通知人</TD>
                          <TD width="40%" class="table_none">
                          	<input class="text_input200" type="text"  id="noticeperson" name="noticeperson" value="${noticeperson }">
						  </TD>
						   <TD width="10%" class="table_body">通知日期</TD>
                          <TD class="table_none">
                             <li class="horizontal_onlyRight"><input class="text_input100"
				               id="noticestartdate"
						       name="noticestartdate" value="${requestScope.ssedrnoticestartdate }"
						       type="text" 
						       onFocus="WdatePicker({readOnly:true})"
						       MAXDATE="#F{document.getElementById('noticeenddate').value}" 
						       readonly="readonly" />
						       至
					         <input class="text_input100"
						       id="noticeenddate"
						       name="noticeenddate" value="${requestScope.ssedrnoticeenddate}"
						       type="text" 
						       onFocus="WdatePicker({readOnly:true})"
						       MINDATE="#F{document.getElementById('noticestartdate').value}"
						       readonly="readonly" /></li><li class="horizontal_onlyRight">
<img src="${ctx }/img/newbtn/btn_today_0.png"  btn=btn title="今天" onClick="today2()"></li>
			               </TD>
                        </TR>
                        <TR> 
                        <TD width="10%" height="30" class="table_body">通知状态</TD>
                           <TD class="table_none" colspan="4">
                            <select id="noticestatus" name="noticestatus" value="${noticestatus}">
                                    <option value="">----请选择----</option>
							  		<option value="1" ${noticestatus!= "1"  ? '' : 'selected="selected"' }>已通知</option>
							  		<option value="0" ${noticestatus!= "0"  ? '' : 'selected="selected"' }>未通知</option>
	                          </select>
			               </TD>
                        </TR>
                        </TBODY>
                   </TABLE>
                   <c:if test="${(permissionPo.keya==1)}"> 
					<table id="title2" cellspacing="2">
                      <TBODY>
                        <TR>
                          <TD align="left">
                          <c:if test="${(permissionPo.keya==1)}">
							<img id="submitButton" src="${ctx }/img/newbtn/btn_search_0.png" btn=btn title='查询' onClick="javascript:search()">
							<img src="${ctx }/img/newbtn/btn_empty_0.png" btn=btn title='清空' onClick="clean()">
							</TD>
						  </c:if>
                        </TR>
                      </TBODY>
                    </TABLE>
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
                    <c:if test="${not empty(delaysReminderPoList ) }">
		                <table width="100%"   border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                              <TBODY>
                                <TR>
                                  <TD width="5%"><div align="left"><img src="${ctx }/img/pic/queryInfo.gif" width="86" height="20"></div></TD>
                                  <TD width="95%" background="${ctx }/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                            </TABLE>
							<table width="100%" cellspacing="1" cellpadding="1" border="0" align="center" class="privateBorder"> 
                      <tbody> 
                        <tr align="middle" class="table_title">
                          <th width="3%" height="26" scope="col">操作</th> 
                          <th width="15%"scope="col">配镜单号</th> 
						  <th scope="col">所属门店</th>
						  <th width="6%" scope="col">顾客姓名</th>
                          <th width="8%" scope="col">原取镜时间</th> 
						  <th width="8%" scope="col">预计取镜时间</th> 
						  <th width="15%" scope="col">误期原因</th>
						  <th width="6%" scope="col">审核人</th> 
						  <th width="8%" scope="col">审核日期</th> 
						  <th width="6%" scope="col">通知人</th> 
						  <th width="8%" scope="col">通知时间</th>				   
						 </tr> 
				      <s:iterator  value="delaysReminderPoList">
                        <tr class="row" onmouseover="mover(this,'#a2c1eb')" onmouseout="mout(this,'#cadee8')"> 
                        <TD width="3%">
	                          <c:if test="${(permissionPo.keyb==1)}">
	                          	<c:if test="${ssedrnoticestatus != 1}">
	                          		<img src="${ctx }/img/newbtn/delete_0.png" title='删除' btn=btn onClick="javascript:del('${ssedrid}','${ssedrsalesid }')" >
	                          	</c:if>
	                          	<c:if test="${ssedrnoticestatus == 1}">
	                          		<img src="${ctx }/img/newbtn/delete_2.png" title='删除'>
	                          	</c:if>
	                          </c:if>
                          </TD>
						  <td height="26">${ssedrsalesid }</td> 
						  <td>${ssedrshopcode }</td>
						  <td>${ssedrname }</td>
                          <td>${fn:substring(ssedrmirrorcheckdate ,0,10) } </td> 
						  <td>${fn:substring(ssedrexpectedcheckdate ,0,10) } </td> 
                          <td>${ssedrcausesdelays }</td>
						  <td>${ssedrauditperson } </td> 
                          <td>${fn:substring(ssedrauditdate ,0,10) } </td> 
                          <td>${ssedrnoticeperson } </td> 
                          <td>${fn:substring(ssedrnoticedate ,0,10) } </td> 
                          
                          </tr> 
                     </s:iterator>
                      </tbody> 
                    </table>
		
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
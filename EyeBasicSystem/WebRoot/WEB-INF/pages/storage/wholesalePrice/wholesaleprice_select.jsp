<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批发调价管理</title>
</head>

<!-- jquery.autocomplete -->
<script type='text/javascript' src='${ctx }/js/module/autocomplete.js'></script>
<script type='text/javascript' src='${ctx }/js/jquery/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='${ctx }/js/jquery/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='${ctx }/js/jquery/thickbox-compressed.js'></script>
<script type='text/javascript' src='${ctx }/js/jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="${ctx }/css/module/jquery.autocomplete.css" />
<!-- jquery.autocomplete end -->
<script>

	function update(bid){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initWholesalePriceUpdate.action?bid="+bid+"&moduleID=${requestScope.moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initWholesalePriceUpdate.action?bid="+bid+"&moduleID=${requestScope.moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【批发调价修改】";
	}
	function search(){
		$("img").removeAttr("onclick");
		allocationForm.action = "wholesalePriceSel.action";
		allocationForm.submit();
		showLoadingBar();
	}	
	function brandinsert(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initBrandPriceInsert3.action?moduleID=${requestScope.moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initBrandPriceInsert3.action?moduleID=${requestScope.moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【按品种调价新增】"
	}
	function details(bid){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initWholesalePriceDetails.action?bid="+bid,970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initWholesalePriceDetails.action?bid="+bid,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【批发调价详细】";
	}
	function insert(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initWholesalePriceInsert.action?moduleID=${requestScope.moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initWholesalePriceInsert.action?moduleID=${requestScope.moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【批发调价新增】"
	}
	function del(bid){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initWholesalePriceDelete.action?bid="+bid+"&moduleID=${requestScope.moduleID}",500,150,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initWholesalePriceDelete.action?bid="+bid+"&moduleID=${requestScope.moduleID}",500,150,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【批发调价删除】"
	}

	function clean(){
		document.getElementById('billID').value='';
		document.getElementById('billStartDate').value='';
		document.getElementById('billEndDate').value='';
		document.getElementById('createPersonName').value='';
		document.getElementById('createPersonID').value='';
		document.getElementById('auditPersonName').value='';
		document.getElementById('auditPersonID').value='';
		document.getElementById('auditState').value='';
		document.getElementById('effectiveState').value='';
		document.getElementById('effectiveStartDate').value='';
		document.getElementById('effectiveEndDate').value='';

	 	$('#goodsName').val('');
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
		
		document.getElementById('billStartDate').value = now;
		document.getElementById('billEndDate').value = now;		
	}
	
	function today1(){
		
		var now = new Date().format("yyyy-MM-dd");  //设置你想要的格式
		
		document.getElementById('effectiveStartDate').value = now;
		document.getElementById('effectiveEndDate').value = now;		
	}
	
	$(document).ready(function() { 
		$("img[btn=btn]").attr("style","cursor: hand"); 
		$("img[btn=btn]").mouseover(function () { 
		$(this).attr("src",$(this).attr("src").replace("0","1")); 
		}).mouseout(function () { 
		$(this).attr("src",$(this).attr("src").replace("1","0")); 
		}); 
	});

	function ljsx(id,whichprice,type){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		showPopWin("initChangeWholsSalesBillUpdate.action?id="+id+"&whichprice="+whichprice+"&type="+type+"&moduleID=${requestScope.moduleID}",500,150,topRows,topCols,returnRefresh(true),false);
		document.getElementById('popupTitle').innerHTML="【批发调价生效】"
    }
    
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="allocationForm" method="post" action="">
<input type="hidden" name="moduleID" value="${requestScope.moduleID}">
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ͷ˵ Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD class=menubar_title width="15%"><img border='0' src='${ctx}/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>营销管理</TD>
          <TD align="left"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：批发价格调价管理 </TD>
           <TD align="right" vAlign=bottom>&nbsp;
           <c:if test="${(permissionPo.keya==1)}">
			 <c:if test="${systemParameterPo.fspwholesalepriceset eq '0'}">
            	<img src="${ctx }/img/newbtn/btn_brandPriceinsert_0.png" btn=btn onmouseover="JavaScript:$(this).attr('src','${ctx }/img/newbtn/btn_brandPriceinsert_1.png');" onmouseout="JavaScript:$(this).attr('src','${ctx }/img/newbtn/btn_brandPriceinsert_0.png');" title="品种调价单新增" onClick="brandinsert()">
             </c:if>
			 <c:if test="${systemParameterPo.fspwholesalepriceset eq '1'}">
            	<img src="${ctx }/img/newbtn/btn_brandPriceinsert_0.png" btn=btn onmouseover="JavaScript:$(this).attr('src','${ctx }/img/newbtn/btn_brandPriceinsert_1.png');" onmouseout="JavaScript:$(this).attr('src','${ctx }/img/newbtn/btn_brandPriceinsert_0.png');" title="品种调价单新增" onClick="javascript:alert('系统已停用批发价,若要使用请联系管理员启用批发价!')">
             </c:if>
           </c:if>
            <c:if test="${(permissionPo.keya==1)}">
			 <c:if test="${systemParameterPo.fspwholesalepriceset eq '0'}">
            	<img src="${ctx }/img/newbtn/btn_pfjtjdadd_0.png" btn=btn title="批发价调价新增" onClick="insert()">
             </c:if>
			 <c:if test="${systemParameterPo.fspwholesalepriceset eq '1'}">
            	<img src="${ctx }/img/newbtn/btn_pfjtjdadd_0.png" btn=btn title="批发价调价新增" onClick="javascript:alert('系统已停用批发价,若要使用请联系管理员启用批发价!')">
             </c:if>
           </c:if>
            <img src="${ctx }/img/newbtn/btn_isshowsearch_0.png" btn=btn  title="显隐查询条件" onClick="JavaScript:searchContentShowOrHidden('title0,title1,title2');changeShowOrHidden();"  />
            </TD>
          </TR>
        <TR>
          <TD class=menubar_function_text colspan="3">
          	<table></table></TD>
          	</TR>
         </TBODY></TABLE>
      <!-- ͷ˵ End --><!-- ѡ Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <tr height="20"><td></td></tr>
        <TR>
          <TD style="PADDING-LEFT: 2px; HEIGHT: 1px" 
          background=${ctx}/img/pic/tab_bg.gif></TD></TR>
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
                          <TD width="5%"><div align="left"><img src="${ctx}/img/pic/queryCondition.gif" width="86" height="20" ></div></TD>
                          <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                     <table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
					  	<TR>
						   <TD width="9%" height="26" class="table_body">单据编号</TD>
			               <TD width="20%" class="table_none">
                            <input class="text_input160" type="text"  id="billID" name="billID" value="${requestScope.selBillID}">
			               </TD>
			               <TD width="9%" height="26" class="table_body">单据日期</TD>
			               <TD class="table_none" width="30%">
                           <li class="horizontal_onlyRight"> <input id="billStartDate"
					       name="billStartDate" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'billEndDate\')}'})"
					       value="${requestScope.selBillStartDate}" /> 至 
					       <input id="billEndDate"
					       name="billEndDate" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'billStartDate\')}'})" 
					        value="${requestScope.selBillEndDate}" /></li><li class="horizontal_onlyRight">
<img src="${ctx }/img/newbtn/btn_today_0.png"  btn=btn title="今天" onClick="today()"></li>
					        </TD>
                           <TD width="9%" height="26" class="table_body">制单人</TD>
			               <TD class="table_none">
                            <input class="text_input160" type="text"  id="createPersonName" name="createPersonName" value="${requestScope.selCreatePersonName}">
                            <input  type="hidden"  id="createPersonID" name="createPersonID" value="${requestScope.selCreatePersonID}">
			               </TD>
			               
                        </TR>
                        <TR>	
                           <TD height="26" class="table_body">审核人</TD>
			               <TD class="table_none">
						   			<input class="text_input160" type="text"  id="auditPersonName" name="auditPersonName" value="${requestScope.selAuditPersonName}">
                            <input  type="hidden"  id="auditPersonID" name="auditPersonID" value="${requestScope.selAuditPersonID}">
			               </TD>		               
						   <TD height="26" class="table_body">审核状态</TD>
			               <TD class="table_none">
                           <select id="auditState" name="auditState" value="${requestScope.selAuditState}">
                                    <option value="">----请选择----</option>
							  		<option value="1" ${requestScope.selAuditState!= "1"  ? '' : 'selected="selected"' }>已审核</option>
							  		<option value="0" ${requestScope.selAuditState!= "0"  ? '' : 'selected="selected"' }>未审核</option>
	                          </select>
			               </TD>


			               <TD height="26" class="table_body">生效状态</TD>
			               <TD  class="table_none" >
			               <select id="effectiveState" name="effectiveState" value="${requestScope.selEffectiveState}">
                                    <option value="">----请选择----</option>
							  		<option value="1" ${requestScope.selEffectiveState!= "1"  ? '' : 'selected="selected"' }>已生效</option>
							  		<option value="0" ${requestScope.selEffectiveState!= "0"  ? '' : 'selected="selected"' }>未生效</option>
	                          </select>		               
			               </TD>
                        </TR>
                        <tr><TD height="26" class="table_body">商品名称</TD>
			               <TD class="table_none">
			               	<input class="text_input160" type="text"  id="goodsName" name="goodsName" value="${requestScope.goodsName}" maxlength="32">
			               </TD>
                        <TD height="26" class="table_body">生效日期</TD>
			               <TD class="table_none" colspan="3">
                          <li class="horizontal_onlyRight">  <input id="effectiveStartDate"
					       name="effectiveStartDate" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'effectiveEndDate\')}'})"
					       value="${requestScope.selEffectiveStartDate}" /> 至 
					       <input id="effectiveEndDate"
					       name="effectiveEndDate" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'effectiveStartDate\')}'})" 
					        value="${requestScope.selEffectiveEndDate }" /></li><li class="horizontal_onlyRight">
<img src="${ctx }/img/newbtn/btn_today_0.png"  btn=btn title="今天" onClick="today1()"></li></TD>
                        </tr>
                       
                      </TBODY>
                    </table>
                    <TABLE id="title2" cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
                        <TR>
                        <c:if test="${(permissionPo.keyb==1)}">  
                          <TD align="left">
                              <img name="btnSearch" id="btnSearch" src="${ctx }/img/newbtn/btn_search_0.png" btn=btn title='查询' onClick="javascript:search()">
								<img src="${ctx }/img/newbtn/btn_empty_0.png" btn=btn title='清空' onClick="clean()">
                              </TD>
                        </c:if>
                        </TR>
                      </TBODY>
                    </TABLE>
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
                    <c:if test="${not empty(wholesalePriceList)}">
                    <table width="100%"   border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                      <TBODY>
                        <TR>
                          <TD width="5%"><div align="left"><img src="${ctx}/img/pic/queryInfo.gif" width="86" height="20"></div></TD>
                          <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="100%" border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder">
                      <TBODY>
                        <TR class=table_title align=middle>
                        <TH width="10%" height="26" scope=col colspan="3">操作</TH>
                          <TH width="15%" scope=col>单据编号</TH>					
                          <TH width="6%" scope=col>制单人</TH>
						  <TH width="15%" scope=col>单据日期</TH>
						  <TH width="6%" scope=col>审核人</TH>
						  <TH width="10%" scope=col>生效状态</TH>
						  <TH width="15%" scope=col>生效日期</TH>
						  <TH width="10%" scope=col>备注</TH>
						  
                        </TR>
                       <c:forEach var="wholesalePrice" items="${wholesalePriceList}">
                        <TR class="row" onMouseOver="mover(this,'#a2c1eb')" onMouseOut="mout(this,'#cadee8')">
                         <TD  height="26" width="4%">
	                          <c:if test="${(permissionPo.keye==1)}">
			                     <img src="${ctx }/img/newbtn/search_0.png" title='详细' btn=btn onmouseover="JavaScript:$(this).attr('src','${ctx }/img/newbtn/search_1.png');" onmouseout="JavaScript:$(this).attr('src','${ctx }/img/newbtn/search_0.png');" onClick="javascript:details('${wholesalePrice.cprwpbillid}')">
			                  </c:if>
			                   </TD>
			                   <TD width="4%">
			                  <c:if test="${(permissionPo.keyc==1)}">
	                          
	                          	<c:if test="${wholesalePrice.cprwpauditstate != 1}">
								  <c:if test="${systemParameterPo.fspwholesalepriceset eq '0'}">
	                          		<img src="${ctx }/img/newbtn/edit_0.png" title='修改' btn=btn onmouseover="JavaScript:$(this).attr('src','${ctx }/img/newbtn/edit_1.png');" onmouseout="JavaScript:$(this).attr('src','${ctx }/img/newbtn/edit_0.png');" onClick="update('${wholesalePrice.cprwpbillid}');">
	                          	  </c:if>
								  <c:if test="${systemParameterPo.fspwholesalepriceset eq '1'}">
	                          		<img src="${ctx }/img/newbtn/edit_0.png" title='修改' btn=btn onmouseover="JavaScript:$(this).attr('src','${ctx }/img/newbtn/edit_1.png');" onmouseout="JavaScript:$(this).attr('src','${ctx }/img/newbtn/edit_0.png');" onClick="javascript:alert('系统已停用批发价,若要使用请联系管理员启用批发价!')">
	                          	  </c:if>
	                          	</c:if>
	                          	<c:if test="${wholesalePrice.cprwpauditstate == 1}">
	                          		<img src="${ctx }/img/newbtn/edit_2.png" title='修改'>
	                          	</c:if>
	                          </c:if>
	                          </TD>
	                          <TD width="4%">
	                          <c:if test="${(permissionPo.keyd==1)}">
	                          	<c:if test="${wholesalePrice.cprwpauditstate != 1}">
	                          		<img src="${ctx }/img/newbtn/delete_0.png" title='删除' btn=btn onmouseover="JavaScript:$(this).attr('src','${ctx }/img/newbtn/delete_1.png');" onmouseout="JavaScript:$(this).attr('src','${ctx }/img/newbtn/delete_0.png');" onclick="del('${wholesalePrice.cprwpbillid}')" >
	                          	</c:if>
	                          	<c:if test="${wholesalePrice.cprwpauditstate == 1}">
	                          		<img src="${ctx }/img/newbtn/delete_2.png" title='删除'>
	                          	</c:if>
	                          </c:if>
                          </TD>
						  <TD>${wholesalePrice.cprwpbillid }</TD>
                          <TD>${wholesalePrice.cprwpcreatepersonname }</TD>
						  <TD>${fn:substring(wholesalePrice.cprwpcreatedate,0,16) }</TD>
                          <TD>${wholesalePrice.cprwpauditpersonname }</TD>
                         
                        <c:if test="${wholesalePrice.cprwpeffectivestate == '1' }">
                             <TD>已生效</TD>                     
                        </c:if> 
                        <c:if test="${wholesalePrice.cprwpauditstate == '1' && wholesalePrice.cprwpeffectivestate != '1' }">
                             <TD><img src="${ctx }/img/newbtn/doit_0.png" btn=btn title='立即生效' onClick="javascript:ljsx('${wholesalePrice.cprwpbillid}','','3')"></TD>
                        </c:if>
                        <c:if test="${wholesalePrice.cprwpauditstate != '1' }">
                             <TD>未审核</TD>                     
                        </c:if>  
                        
                          <TD>${fn:substring(wholesalePrice.cprwpeffectivedate,0,16) }</TD>
                          <TD>${wholesalePrice.cprwpremark }</TD>
                        </TR>
                        </c:forEach>
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
                  <!--ݿEnd--></TD>
                <TD width=1 background=${ctx}/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx}/img/pic/tab_bg.gif" 
width=1></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=${ctx}/img/pic/tab_bg.gif bgColor=#ffffff><IMG height=1 
            src="${ctx}/img/pic/tab_bg.gif" width=1></TD></TR></TBODY></TABLE><!--ѡ End--></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV>
</form>
</body></html>
<%@ include file="/WEB-INF/inc/message.jsp" %>
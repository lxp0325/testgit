	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>凭证管理</title>		
<script type="text/javascript">
	
   /**
    *  新增凭证
    */ 
	function insert(){	       
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		if(is_iPad()){
			showPopWin("ykinitVoucherInsert.action?moduleID=${moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("ykinitVoucherInsert.action?moduleID=${moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【凭证新增】";	
	}
	
   /**
    *  初始化修改凭证
    */ 
	function update(voucherID){	       
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		if(is_iPad()){
			showPopWin("ykinitVoucherUpdate.action?voucherID="+voucherID+"&parentID="+$("#parentID").val()+"&moduleID=${moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("ykinitVoucherUpdate.action?voucherID="+voucherID+"&parentID="+$("#parentID").val()+"&moduleID=${moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【凭证修改】";	
	}
	
   /**
    *  初始化删除凭证
    */ 
	function del(voucherID){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		showPopWin("ykinitVoucherDelete.action?voucherID="+voucherID+"&moduleID=${moduleID}" ,450,150,topRows,topCols,returnRefresh(true),true);
		document.getElementById('popupTitle').innerHTML="【凭证删除】";	
	}
	
   /**
    *  查询凭证详细信息
    */ 
	function detail(voucherID){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		if(is_iPad()){
			showPopWin("ykselVoucherDetail.action?voucherID="+voucherID+"&moduleID=${moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("ykselVoucherDetail.action?voucherID="+voucherID+"&moduleID=${moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【凭证详细】";	
	}
	
	/**
	 * 制造商开窗
	*/
	function openSupplier(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		if(is_iPad()){
			showPopWin("ykselSupplierOpen.action",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("ykselSupplierOpen.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}		
		document.getElementById('popupTitle').innerHTML="【制造商查询】";
	}
	
	/**
	 * 开窗赋值实现方法
	*/
	function openSupplierValues(json){		
		$("#supplierID").val(json.id);
		$("#supplierName").val(json.value);
	} 
	
   /**
    *  重置
    */        
	function clean(){
	    $('#clear').find("input").each(function(){
			$(this).val('');
		});
		$('#clear').find("select").each(function(){
			$(this).val('');
		});	
		$('#parentID').val('');
		document.all.sVoucherType.options.length = 0;
		document.all.sVoucherType.options.add(new Option("----请选择----",""));
	}
	
   /**
    *  根据条件查询相关凭证
    */        
	function search(){
	    voucherSelFrm.action = "ykselVoucher.action";
	    voucherSelFrm.submit();
		showLoadingBar();
	 }
	 
   /**
    *  根据凭证基本类型改变凭证具体类型
    */        
	 function changeParentID(){	    
	    $("#parentID").val($("#bVoucherType").val());
        $('#'+'sVoucherType').load("ykinitVoucherTypeByParentID.action?parentID="+$("#parentID").val()); 
	 }
	  
   /**
    *  导入总账
    */ 
	 function posting(){
	    if ($('#softwarePath').val() == ''){
	        alert("尚未连接任何财务软件!");
	    }else{
		    var topRows = top.document.getElementById("total").rows;
			var topCols = top.document.getElementById("btmframe").cols;
			showPopWin($('#softwarePath').val(),450,140,topRows,topCols,returnRefresh(true),true);
			document.getElementById('popupTitle').innerHTML="【凭证传递】";
	    }
	 }
	 
	$(document).ready(function(){    		 
		$('span[id=sLvvNotTaxRateAmount]').each(function(){
			$(this).text(parseFloat($(this).text()).toFixed(2));
		});
		
		if (document.all.sVoucherType.options.length == 0){
		    document.all.sVoucherType.options.add(new Option("----请选择----","")); 
		}
	});
	
	function selBill(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		if(is_iPad()){
			showPopWin("ykinitSelBill.action",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("ykinitSelBill.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}		
		document.getElementById('popupTitle').innerHTML="【单据查询】";	
	}
	
	function selInvoiceAndReversal(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		if(is_iPad()){
			showPopWin("ykinitSelInvoiceAndReversal.action",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("ykinitSelInvoiceAndReversal.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}		
		document.getElementById('popupTitle').innerHTML="【发票、冲回查询】";		
	}

	$(document).ready(function() { 
	    $("img[btn=btn]").attr("style","cursor: hand;"); 
	    $("img[btn=btn]").mouseover(function () { 
	    $(this).attr("src",$(this).attr("src").replace("0","1")); 
	    }).mouseout(function () { 
	      $(this).attr("src",$(this).attr("src").replace("1","0")); 
	    }); 
    });
    
</script>
	</head>	
<BODY bgColor=#ffffff topMargin=5 ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>	
<DIV>
<form method="post" id="voucherSelFrm" action="">
<input id="parentID" name="parentID" type="hidden" value="${requestScope.parentID}">
<input type="hidden" name="moduleID" value="${requestScope.moduleID}">
<input type="hidden" id="softwarePath" name="softwarePath" value="${requestScope.softwarePath}">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ͷ˵ Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD class=menubar_title width="15%"><img border='0' src='${ctx}/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>&nbsp;凭证管理</TD>
          <TD align="left" width="20%"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：凭证查询</TD>        
          <TD align="right" width="60%" valign="bottom">&nbsp;
              <img btn=btn src="${ctx }/img/newbtn/btn_fpchcx_0.png" title='发票冲回查询' onClick="selInvoiceAndReversal()" > 
              <img btn=btn src="${ctx }/img/newbtn/btn_fpdjcx_0.png" title='单据查询' onClick="selBill()" > 
              <img btn=btn src="${ctx }/img/newbtn/btn_pzxz_0.png" title='凭证新增' onClick="insert()" > 
              <img btn=btn src="${ctx }/img/newbtn/btn_drcwrj_0.png" title='导入财务软件' onClick="posting()" > 
          </TD>
        </TR>
          <TR>
            <TD class=menubar_function_text colspan="3">
            	<table></table>
            </TD>
          </TR>
      </TBODY></TABLE><!-- ͷ˵ End --><!-- ѡ Start -->
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
							<table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="clear">
                      <TBODY>
                        <TR height="30px">
                          <TD width="8%" class="table_body">凭证号</TD>
                          <TD width="30%" class="table_none"><input class="text_input200" id="voucherID" name="voucherID" type="text" value="${voucherID}" maxlength="19"></TD>
                          <TD width="10%" class="table_body">制造商</TD>
                          <TD class="table_none" width="30%">
                          <li class="horizontal_onlyRight">
                            <input type="text" id="supplierName" name="supplierName" class="text_input200" readonly="readonly" value="${supplierName}">
                            <input type="hidden" id="supplierID" name="supplierID" class="text_input200" readonly="readonly" value="${supplierID}">
                          </li>
                            <li class="horizontal_onlyRight">
                              <img btn=btn src="${ctx }/img/newbtn/btn_change_0.png" title="选择" onclick="openSupplier();">
                            </li>
                          </TD>
                          <TD width="7%" class="table_body" >审核状态</TD>
                           <TD class="table_none" width="26%">
						   <select name="auditStatue">
                            <option value="">----请选择----</option>
                            <option value='0' ${auditStatue == '0' ? 'selected="selected"' : '' }>未审核</option>
                            <option value='1' ${auditStatue == '1' ? 'selected="selected"' : '' }>已审核</option>
                          </select>						   
                          </TD>
                        </TR>
                        <TR height="30px">
						  <TD class="table_body">凭证日期</TD>
                          <TD class="table_none">
                        <li class="horizontal_onlyRight">
                           <input id="billStartTime"
					       name="billStartTime" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'billEndTime\')}'})"
					       value="${billStartTime }" /> 至 
					       <input id="billEndTime"
					       name="billEndTime" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'billStartTime\')}'})" 
					        value="${billEndTime }" />
					     </li><li class="horizontal_onlyRight">
                            <img btn=btn src="${ctx }/img/newbtn/btn_today_0.png" title="今天" onClick="today('billStartTime','billEndTime')"></li>
					      </TD>
                          <TD class="table_body">审核日期</TD>
                          <TD class="table_none" ${softwarePath != '' ? '' : 'colspan="3"' }>
                         <li class="horizontal_onlyRight">
                           <input id="auditStartTime"
					       name="auditStartTime" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'auditEndTime\')}'})"
					       value="${auditStartTime }" /> 至 
					       <input id="auditEndTime"
					       name="auditEndTime" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'auditStartTime\')}'})" 
					        value="${auditEndTime }" />
					    </li><li class="horizontal_onlyRight">
                            <img btn=btn src="${ctx }/img/newbtn/btn_today_0.png" title="今天" onClick="today('auditStartTime','auditEndTime')"></li>
					          </TD>   
                     <c:if test="${softwarePath != ''}"> 
                          <TD width="7%" class="table_body" >过账状态</TD>
                          <TD class="table_none">
						   <select name="postStatue">
                            <option value="">----请选择----</option>
                            <option value='0' ${postStatue == '0' ? 'selected="selected"' : '' }>未过账</option>
                            <option value='1' ${postStatue == '1' ? 'selected="selected"' : '' }>已过账</option>
                          </select>						   
                          </TD>
                    </c:if>
                        </TR>
                        <TR height="30px"> 
                          <TD class="table_body">凭证类型</TD>
                          <TD class="table_none">
                            <li class="horizontal_onlyRight">
                            <select id="bVoucherType" name="bVoucherType" ${empty(voucherTopIDList) ? 'disabled="disabled"' : ''} onChange="changeParentID()">
                                <option value="">----请选择----</option>
                              <s:iterator value="voucherTopIDList">
                                <c:if test="${sLvtvtId != '3' && sLvtvtId != '11'}">
                                <option value="${sLvtvtId}" ${parentID == sLvtvtId ? 'selected="selected"' : '' }>${sLvtvtTypeName}</option>
	     	                    </c:if>
	     	                  </s:iterator>                            
                            </select></li>
                            <li class="horizontal_onlyRight">                               
                            <select name="sVoucherType" id="sVoucherType">
                              <s:iterator value="voucherSubsetIDList">
                                <option value="${sLvtvtId}"} ${subID == sLvtvtId ? 'selected="selected"' : '' }>${sLvtvtTypeName}</option>
	     	                  </s:iterator> 
                            </select>
                            </li>
                          </TD> 
                          <TD class="table_body">制作人</TD>
                          <TD class="table_none" colspan="3">
                            <input type="text" class="text_input200" id="createPersonID" name="createPersonID" value="${createPersonID}">
                          </TD> 
                        </TR>
                        </TBODY>
                    </TABLE>
					<table id="searchBar" cellspacing="2">
                      <TBODY>
                        <TR>
                          <TD align="left">
							<img btn=btn src="${ctx }/img/newbtn/btn_search_0.png" title='查询' onclick="search();" >
                            <img btn=btn src="${ctx }/img/newbtn/btn_empty_0.png" title='清空' onclick="clean();" >	
						  </TD>
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
                    <c:if test="${not empty(voucherList)}">
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
                          <TH scope=col width="9%" colspan="3">操作</TH>
                          <TH scope=col width="15%" height="26">凭证号</TH>
						  <TH scope=col>制造商名称</TH>						
                          <TH scope=col width="10%">凭证日期</TH>
                          <TH scope=col width="8%">凭证制作人</TH>						  
						  <TH scope=col width="8%">成本合计</TH>
						  <TH scope=col width="8%">税额合计</TH>
						  <TH scope=col width="8%">价税合计</TH>
						  <TH scope=col width="7%">审核状态</TH>
                        </TR>
                      <s:iterator value="voucherList">
                        <TR class="row" onMouseOver="mover(this,'#a2c1eb')" onMouseOut="mout(this,'#cadee8')">
                          <c:if test="${sLvvAuditStatue=='1'}">
                          <TD>
                             <img btn=btn src="${ctx }/img/newbtn/search_0.png" title='详细' onClick="javascript:detail('${sLvvID}')">
		                  </TD>
		                  <TD>
                             <img src="${ctx }/img/newbtn/edit_2.png" title='修改'>
		                  </TD>
		                  <c:if test="${sLvvPosting=='1'}">
                          <TD>
                             <img src="${ctx }/img/newbtn/delete_2.png" title='删除'>
		                  </TD>
		                  </c:if>
		                  <c:if test="${sLvvPosting=='0'}">
                          <TD>
                             <img btn=btn src="${ctx }/img/newbtn/delete_0.png" title='删除' onClick="javascript:del('${sLvvID}')">
		                  </TD>
		                  </c:if>
		                  </c:if>		                  
		                  <c:if test="${sLvvAuditStatue=='0'}">
                          <TD>
                              <img src="${ctx }/img/newbtn/search_2.png" title='详细'
		                  </TD>
		                  <TD>
                             <img btn=btn src="${ctx }/img/newbtn/edit_0.png" title='修改' onClick="javascript:update('${sLvvID}')">
		                  </TD>
		                  <TD>
                             <img btn=btn src="${ctx }/img/newbtn/delete_0.png" title='删除' onClick="javascript:del('${sLvvID}')">
		                  </TD>
		                  </c:if>                        
                          <TD height="26">${sLvvID}</TD>
                          <TD>${sLvvSupplierName}</TD>
                          <TD>${fn:substring(sLvvDate,0,10)}</TD>
                          <TD>${sLvvPersonName}</TD>    
                          <TD><span id="sLvvNotTaxRateAmount">${sLvvNotTaxRateAmount}</span></TD>
                          <TD>${sLvvTaxAmount}</TD>
                          <TD>${sLvvCostPriceAmount}</TD>
                          <TD>
                          <c:if test="${sLvvAuditStatue=='1'}">
                                                                                已审核
                          </c:if>
                          <c:if test="${sLvvAuditStatue=='0'}">
                                                                                未审核
                          </c:if>
                          </TD>
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
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
					   <TR>
						  <TD align="left"></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
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
    <TD height=5></TD></TR></TBODY></TABLE></form></DIV></BODY>
</html>
<%@ include file="/WEB-INF/inc/message.jsp"%>
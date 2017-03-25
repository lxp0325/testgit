<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>收款单管理</title>
<script>
	
	function clean(){	 
		$('input[clean=clean]').each(function(){
			$(this).val('');
		});	
		$('select[clean=clean]').each(function(){
			$(this).val('');
		});	
	}

	function search(){
		$("img").removeAttr("onclick");
		insertReceiptMentFrm.action = "selFranchiseeOpen.action";
		insertReceiptMentFrm.submit();
		showLoadingBar();
	}	

	function detail(id){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initStoreGoodsDetails.action?hid="+id+"&moduleID=${requestScope.moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initStoreGoodsDetails.action?hid="+id+"&moduleID=${requestScope.moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【客户批发调货详细】";
	}
    
    $(document).ready(function() { 
	    $("img[btn=btn]").attr("style","cursor: hand;"); 
	    $("img[btn=btn]").mouseover(function () { 
	    $(this).attr("src",$(this).attr("src").replace("0","1")); 
	    }).mouseout(function () { 
	      $(this).attr("src",$(this).attr("src").replace("1","0")); 
	    }); 
    }); 
    
    	
	/**
	 *  checkbox全选
	 */	
	function chkAll(){	
        var chks=document.all.chks;
        $('input[id=chk]').each(function(){ 
            $(this).attr("checked",chks.checked);
        }); 
        if(chks.checked){
          setValue();
        }else{
          setDelValue();
        }        
    }
    
	$(document).ready(function (){
		setCheckValue();
	});
	
	/**
	 *  初始化判断checkbox的状态
	 */
    function setCheckValue(){
        var chktext="";
        $("input[id=chk]",window.parent.document).each(function(){
			chktext=chktext+","+$(this).val();
		});

        $("input[id=chk]").each(function(){
         	if(chktext.indexOf($(this).attr("billID"))>=0){
              $(this).attr("checked","checked");
           }
		});
    }
	/**
	 *  调用单个页面赋值添加
	 */
    function setSingleValue(obj){
        var objValue="["+obj.value+"]";;
        if(obj.checked==true){
           window.parent.openGoodSingleValues(objValue);
        }else if(obj.checked==false){
           window.parent.openGoodSingleDeleteValues(objValue);
        }

    }
    
	/**
	 *  调用页面赋值删除
	 */
	function setDelValue(){ 	         

        var objValue="";
        var count=0;

        $("input[id=chk]").each(function(){
         	if($(this).attr("checked")==false){
           	 if(objValue==""){
	           objValue=$(this).val();
	         }else{
	           objValue=objValue+","+$(this).val();
	         }
	         count++;  
	         }  
		});
        
         if(count==0){
          alert('请选择商品!');
          return false;
        }
        objValue="["+objValue+"]";
        window.parent.openGoodSingleDeleteValues(objValue);
        
	}		
	/**
	 *  调用页面赋值
	 */
	function setValue(){
        var objValue="";
        var count=0;
        $("input[id=chk]").each(function(){
         	if($(this).attr("checked")==true){
           	 if(objValue==""){
	           objValue=$(this).val();
	         }else{
	           objValue=objValue+","+$(this).val();
	         }
	         count++;    
		     }
		});
         if(count==0){
          alert('请选择商品!');
          return false;
        }
        objValue="["+objValue+"]";
        window.parent.openGoodSingleValues(objValue);     
	}
</script>
	</head>
	<BODY bgColor=#ffffff topMargin=5 ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
	<form action="" method="post" id="insertReceiptMentFrm">
	<input type="hidden" name="moduleID" id="moduleID" value="${moduleID}">
	<input type="hidden" name="franchiseeID" id="franchiseeID" value="${franchiseeID}">
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD>
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
                        <TR height="26px">
                          <TD width="9%" class="table_body">客户批发调货单号</TD>
                          <TD width="24%" class="table_none"><input type="text" clean="clean" class="text_input160" value="${allocationBillID }" id="allocationBillID" name="allocationBillID"></TD>
                          <TD class="table_body" width="9%">制单人</TD>
                          <TD class="table_none" width="24%"><input type="text" clean="clean" id="createPersonID" name="createPersonID" value="${createPersonID}" class="text_input100"/></TD>	
                          <TD class="table_body">制单日期</TD>
                          <TD class="table_none">
                          <li class="horizontal_onlyRight">
                            <input id="billStartTime" clean="clean" 
					       name="billStartTime" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'billEndTime\')}'})"
					       value="${billStartTime}" /> 至 
					       <input id="billEndTime"
					       name="billEndTime" 
					       type="text" class="text_input100" clean="clean" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'billStartTime\')}'})" 
					        value="${billEndTime}" />
					        
					     </li><li class="horizontal_onlyRight">
                            <img btn=btn src="${ctx }/img/newbtn/btn_today_0.png" title="今天" onClick="today('billStartTime','billEndTime')"></li>
					        
					        </TD>  
                        </TR>
                        <TR height="26px">
                          <TD class="table_body">审核日期</TD>
                          <TD class="table_none">
                         <li class="horizontal_onlyRight"> 
                            <input id="auditStartTime"
					       name="auditStartTime" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'auditEndTime\')}'})"
					       value="${auditStartTime}" clean="clean"/> 至 
					       <input id="auditEndTime"
					       name="auditEndTime" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'auditStartTime\')}'})" 
					        value="${auditEndTime}" clean="clean"/>
					        
					      </li><li class="horizontal_onlyRight">
                            <img btn=btn src="${ctx }/img/newbtn/btn_today_0.png" title="今天" onClick="today('auditStartTime','auditEndTime')" >
                            </li>
					        </TD>    
                          <TD class="table_body">核销状态</TD>
                          <TD class="table_none" colspan="3">
                              <select id="receiptMentBillCheckStatus" name="receiptMentBillCheckStatus" clean="clean">
                                 <option value="" ${receiptMentBillCheckStatus eq '' ? 'selected="selected"' : '' }>----请选择----</option>
                                 <option value="1" ${receiptMentBillCheckStatus eq '1' ? 'selected="selected"' : '' }>未核销</option>
                                 <option value="2" ${receiptMentBillCheckStatus eq '2' ? 'selected="selected"' : '' }>部分核销</option>
                                 <option value="3" ${receiptMentBillCheckStatus eq '3' ? 'selected="selected"' : '' }>完全核销</option>
                              </select>
                          </TD>

                        </TR>
                        </TBODY>
                    </TABLE>
					<table id="title2" cellspacing="2">
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
			<c:if test="${not empty(tracList)}">       
					        <table width="100%"   border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                              <TBODY>
                                <TR>
                                  <TD width="5%"><div align="left"><img src="${ctx}/img/pic/queryInfo.gif" width="86" height="20"></div></TD>
                                  <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                            </TABLE>
              		<table id="addTable" width="100%" border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder">
                      <TBODY>
                        <TR class=table_title align='middle'>
                          <TH scope=col width="5%" height="26"><input type="checkbox" id="chks" onclick="chkAll()">选择</TH>
                          <TH scope=col width="3%">操作</TH>
                          <TH scope=col width="15%">单据编号</TH>
                          <TH scope=col width="15%">客户名称</TH>
                          <TH scope=col width="10%">制单日期</TH>
                          <TH scope=col width="10%">审核日期</TH>
                          <TH scope=col width="10%">制单人</TH>
                          <TH scope=col width="10%">单据金额</TH>
                          <TH scope=col width="10%">未收金额</TH>                          
                        </TR>
                        <s:iterator value="tracList">
                        <TR class="row" onMouseOver="mover(this,'#a2c1eb')" onMouseOut="mout(this,'#cadee8')" id="invoiceRow">
						  <TD height="26">
						       <input type="checkbox" id="chk" name="chk" billID="${cstibillid}" onClick="setSingleValue(this);" value="{'billid':'${cstibillid}','billtype':'${cstibilltypeid == "2" ? "客户批发退货单" : "客户批发调货单"}','billdate':'${cstiauditdate}','costpriceamount':'${csticostpriceamount}','receiptMentamount':'${payMentAmount}','notreceiptmentamount':'${notPayMentAmount}'}" />
						  </TD>
						  <TD width="3%"><img btn=btn src="${ctx }/img/newbtn/search_0.png" title='详细' onClick="detail('${cstibillid}')"></TD>
						  <TD>${cstibillid }</TD>
						  <TD>${cstidepartmentname}</TD>
						  <TD>${cstibilldate}</TD>
						  <TD>${cstiauditdate}</TD>
						  <TD>${csticreatepersonname}</TD>
                          <TD>${csticostpriceamount}</TD>
                          <TD>${notPayMentAmount}</TD>
		                 </TR>
                      </s:iterator>

                      </TBODY>
                    </TABLE>
                    <div id="dividePage" align="center">        
							<jsp:include page="/WEB-INF/inc/Pagination.jsp" />
					</div>
             </c:if>
                  </DIV>
               </div>
                </TD>
                <TD width=1 background=${ctx}/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx}/img/pic/tab_bg.gif" 
width=1></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=${ctx}/img/pic/tab_bg.gif bgColor=#ffffff><IMG height=1 
            src="${ctx}/img/pic/tab_bg.gif" width=1></TD></TR></TBODY></TABLE><!--ѡ End--></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV></form></BODY>
</html>
<%@ include file="/WEB-INF/inc/message.jsp" %>
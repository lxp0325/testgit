<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>付款单管理</title>		
<script type="text/javascript">
   	
   	function doList(link,perPage_Select,perPage_Text_Hidden){
     	var objOne = document.all[perPage_Select];
	  	document.all[perPage_Text_Hidden].value = objOne.options[objOne.selectedIndex].value;
	  	payMentBillSelFrm.action=link;
	  	payMentBillSelFrm.submit();
		showLoadingBar();
	}
	
   /**
    *  查询付款单详细信息
    */ 
	function detail(billID){
		// showPopWin("","selPayMentBillSimpleDetail.action?payMentBillID="+billID+"&moduleID=${moduleID}",screen.width-200,screen.height-200, '',null,true);
		// selectHidden();
	}
	
   /**
    *  重置
    */        
	function clean(){
	    $('input[clean=clean]').each(function(){
			$(this).val('');
		});
		$('select[clean=clean]').each(function(){
			$(this).val('');
		});	
	}
	
   /**
    *  根据条件查询相关付款单
    */        
	function search(){
	    payMentBillSelFrm.action = "selProcurementBillOpen.action";
	    payMentBillSelFrm.submit();
		showLoadingBar();
	}
    
    $(document).ready(function() { 
	    $("img[btn=btn]").attr("style","cursor: hand;"); 
	    $("img[btn=btn]").mouseover(function () { 
	    $(this).attr("src",$(this).attr("src").replace("0","1")); 
	    }).mouseout(function () { 
	      $(this).attr("src",$(this).attr("src").replace("1","0")); 
	    }); 
	    
	    setCheckValue();
	    autoprice();
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
	
	/**
	 *  初始化判断checkbox的状态
	 */
    function setCheckValue(){
        var chktext="";
        $("input[id=chk]",window.parent.document).each(function(){
			chktext=chktext+","+$(this).val();
		});

        $("input[id=chk]").each(function(){
         	if(chktext.indexOf($(this).attr("payMentBillID"))>=0){
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

    function clickTab(obj){
    	$(obj).parent().find('input[id=chk]').attr('checked','checked')
    	setSingleValue($(obj).find('input[id=chk]'));
    	autoprice();
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

    function autoprice(){
        var total = 0;
        $('input[id=chk]').each(function(){ 
            if ($(this).attr('checked')){
            	total = accAdd($(this).attr('payMentAmount'),total);
            }
        }); 
        $('#td1t').text(parseFloat(total).toFixed(2));
    }
    function checkThisLpbpbId(thiz){
    	if($('input[type=checkbox]', thiz).eq(0).attr("checked")){
    		$('input[type=checkbox]', thiz).eq(0).click();
    		$('input[type=checkbox]', thiz).eq(0).attr("checked",false);
    	}else{
    		$('input[type=checkbox]', thiz).eq(0).click();
    		$('input[type=checkbox]', thiz).eq(0).attr("checked",true);
    		
    	}
    	document.selection.empty();
    }
</script>
	</head>
	<BODY bgColor=#ffffff topMargin=5 ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>	
<DIV>
<form method="post" id="payMentBillSelFrm" action="">
<input type="hidden" id="moduleID" name="moduleID" value="${requestScope.moduleID}">
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
                          <TD width="8%" class="table_body">源单单号</TD>
                          <TD width="30%" class="table_none"><input clean="clean" class="text_input160" id="payMentBillID" name="payMentBillID" type="text" value="${payMentBillID}" maxlength="30"></TD>
                          <TD width="8%" class="table_body">制造商</TD>
                          <TD class="table_none" width="30%">
                            ${supplierName}
                            <input type="hidden" id="supplierName" name="supplierName" class="text_input160" readonly="readonly" value="${supplierName}">
                            <input type="hidden" id="supplierID" name="supplierID" class="text_input160" readonly="readonly" value="${supplierID}">

                          </TD>
                          <TD width="8%" class="table_body">核销状态</TD>
                          <TD class="table_none" width="30%">
                              <select id="payMentBillCheckStatus" name="payMentBillCheckStatus" clean="clean">
                                 <option value="" ${payMentBillCheckStatus eq '' ? 'selected="selected"' : '' }>----请选择----</option>
                                 <option value="1" ${payMentBillCheckStatus eq '1' ? 'selected="selected"' : '' }>未核销</option>
                                 <option value="2" ${payMentBillCheckStatus eq '2' ? 'selected="selected"' : '' }>部分核销</option>
                                 <option value="3" ${payMentBillCheckStatus eq '3' ? 'selected="selected"' : '' }>完全核销</option>
                              </select>
                          </TD>
                        </TR>
                        <TR height="26px">
						  <TD class="table_body">单据日期</TD>
                          <TD class="table_none">
                          <li class="horizontal_onlyRight">
                           <input id="billStartTime"
					       name="billStartTime" clean="clean" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'billEndTime\')}'})"
					       value="${billStartTime }" /> 至 
					       <input id="billEndTime"
					       name="billEndTime" clean="clean" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'billStartTime\')}'})" 
					        value="${billEndTime }" />
					        
					      </li><li class="horizontal_onlyRight">
                            <img btn=btn src="${ctx }/img/newbtn/btn_today_0.png" title="今天" onClick="today('billStartTime','billEndTime')"></li>
                           <li class="horizontal_onlyRight">
                            <img btn=btn src="${ctx }/img/newbtn/btn_month_0.png" title="当月" onClick="currtMonth('billStartTime','billEndTime')"></li> 
					      </TD>
                          <TD class="table_body">结算日期</TD>
                          <TD class="table_none" colspan="3">
                          <li class="horizontal_onlyRight">
                           <input id="auditStartTime"
					       name="auditStartTime" clean="clean" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'auditEndTime\')}'})"
					       value="${auditStartTime }" /> 至 
					       <input id="auditEndTime"
					       name="auditEndTime" clean="clean" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'auditStartTime\')}'})" 
					        value="${auditEndTime }" />  
					      </li><li class="horizontal_onlyRight">
                           <img btn=btn src="${ctx }/img/newbtn/btn_today_0.png" title="今天" onClick="today('auditStartTime','auditEndTime')"></li>
                          <li class="horizontal_onlyRight">
                           <img btn=btn src="${ctx }/img/newbtn/btn_month_0.png" title="当月" onClick="currtMonth('auditStartTime','auditEndTime')"></li>      
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
                    <c:if test="${not empty(payMentBillList)}">
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
                          <TH scope=col width="5%" height="26"><input type="checkbox" id="chks" name="chks" onclick="chkAll();autoprice();">选择</TH>
                          <TH scope=col width="15%" >源单单号</TH>
						  <TH scope=col width="16%">结算日期</TH>						
                          <TH scope=col width="10%">审核人</TH>
						  <TH scope=col width="8%">单据金额</TH>
						  <TH scope=col width="8%">已核销金额</TH>
						  <TH scope=col width="8%">未核销金额</TH>
                        </TR>
                        <TR class=table_title align=middle >
                          <TD height="26" colspan="6" align="right">已选单据金额合计:&nbsp;&nbsp;&nbsp;&nbsp;</TD>
                          <TD id="td1t"></TD>                        
						</TR>
                      <s:iterator value="payMentBillList">
                        <TR class="row" onMouseOver="mover(this,'#a2c1eb')" onMouseOut="mout(this,'#cadee8')" ondblclick="checkThisLpbpbId(this);">
                          <TD height="26">
						       <input type="checkbox" id="chk" name="chk" payMentBillID="${sLpbpbID}" payMentAmount="${sLpbpbPayMentAmount}" onClick="setSingleValue(this);autoprice();"  value="{'payMentBillID':'${sLpbpbID}','payedMentDate':'${sLpbpbDate}','payedMentAmount':'${sLpbpbDiscountAmount}','costPriceAmount':'${sLpbpbCostPriceAmount}','notPayedMentAmount':'${sLpbpbPayMentAmount}','payMentBillType':'采购单'}" />
						  </TD>
                          <TD>${sLpbpbID}</TD>
                          <TD>${sLpbpbDate}</TD>
                          <TD>${sLpbpbAuditPersonName}</TD>
                          <TD>${sLpbpbCostPriceAmount}</TD>
                          <TD>${sLpbpbDiscountAmount}</TD>
                          <TD>${sLpbpbPayMentAmount}</TD>
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
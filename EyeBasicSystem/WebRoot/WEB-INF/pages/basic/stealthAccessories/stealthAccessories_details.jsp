<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>隐形护理液维护</title>
</head>
<script>
	function save(){
	if(checkForm(document.all.stealthAccessoriesForm)){  
	    var bgitaxrate= parseInt(document.all.bgitaxrate.value);
	    if(bgitaxrate>100||bgitaxrate<0){
	      alert('税率必须在0-100之间');
	      document.all.bgitaxrate.focus();
	      return false;
	    }
	    
	    var bbdvaliddateUL = parseFloat(document.getElementById('bgireturnmax').value).toFixed(1);
		var bbdvaliddateUP = parseFloat(document.getElementById('bgireturnmin').value).toFixed(1);
	
		if (bbdvaliddateUL < bbdvaliddateUP) {
			alert("上限效期不能小于下限效期！");
			document.getElementById('bgireturnmax').select();
			return false;
		}
	      
        $("img").removeAttr("onclick");	    
		stealthAccessoriesForm.action = "updateStealthAccessories.action";
		stealthAccessoriesForm.submit();
		}
	}
	
	function clean(){
		document.stealthAccessoriesForm.reset();
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
<form name="stealthAccessoriesForm" method="post" action="">

<input type="hidden" name="type" id="type" value="" /> 
<input type="hidden" name="moduleID" value="${requestScope.moduleID}" />

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><br/>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD style="PADDING-LEFT: 2px; HEIGHT: 1px" 
          background=${ctx}/img/pic/tab_top_bg.gif>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR><!--?Start-->
				<TD>
                  <TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD width=3><IMG id=tabImgLeft__1 height=22 
                        src="${ctx }/img/pic/tab_active_left.gif" width=3></TD>
                      <TD class=tab id=tabLabel__1 
                      background=${ctx }/img/pic/tab_active_bg.gif 
                      UNSELECTABLE="on">隐形护理液详细</TD>
                      <TD width=3><IMG id=tabImgRight__1 height=22 
                        src="${ctx }/img/pic/tab_active_right.gif" 
                    width=3></TD>
                     
                    <TD width=3><IMG id=tabImgLeft__1 height=22 
                        src="${ctx }/img/pic/tab_unactive_left.gif" width=3></TD>
                      <TD class=tab id=tabLabel__1 
                      background=${ctx }/img/pic/tab_unactive_bg.gif 
                      onclick="JavaScript:window.location.href='initPricesAbout.action?moduleID=${requestScope.moduleID}&goodsid=${goodsInfoPo.bgigoodsid}&returnUrl=retail';"
                      UNSELECTABLE="on">价格走势图</TD>
                      <TD width=3><IMG id=tabImgRight__1 height=22 
                        src="${ctx }/img/pic/tab_unactive_right.gif" 
                    width=3></TD>
                   
                    </TR></TBODY></TABLE></TD>
					</TR></TBODY></TABLE>
          </TD>
		</TR>
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
                    <br/>
                    <fieldset>
					<legend><font style="font-size: 14;font: bold">&nbsp;&nbsp;必&nbsp;填&nbsp;项&nbsp;&nbsp;</font></legend>
                    <table width="99%" border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                        <TR>
						   <TD width="9%" height="26" class="table_body">商品代码</TD>
			               <TD width="24%" class="table_none">
                            ${goodsInfoPo.bgigoodsid}<input class="text_input160" type="hidden" id="bgigoodsid" name="goodsInfoPo.bgigoodsid" value="${goodsInfoPo.bgigoodsid}">
			               </TD>
			               <TD width="9%" class="table_body">商品条码</TD>
			               <TD width="24%" class="table_none">
                            ${goodsInfoPo.bgigoodsbarcode}<input class="text_input160" type="hidden" id="bgigoodsbarcode" name="goodsInfoPo.bgigoodsbarcode" value="${goodsInfoPo.bgigoodsbarcode}">
			               </TD>
			               <TD width="9%" class="table_body">商品名称</TD>
			               <TD class="table_none">${goodsInfoPo.bgigoodsname}&nbsp;
                             </TD>
                        </TR>
                        <TR>
                        <TD height="26" class="table_body">制造商</TD>
			               <TD class="table_none">                          
                           ${goodsInfoPo.bgisuppliername}&nbsp;
			               </TD>
                           <TD class="table_body">商品品种</TD>
			               <TD class="table_none">
                           ${goodsInfoPo.bgibrandname}&nbsp;
			               </TD>			               
			               <TD class="table_body">型号</TD>
			               <TD class="table_none">
                             ${goodsInfoPo.bgispec}&nbsp;
			               </TD>
                        </TR>
                        <c:if test="${systemParameterPo.fspisusegoodslevel eq '1'}">
                         <tr>
                        <TD height="26" class="table_body">商品编号</TD>
			               <TD class="table_none">
                             ${goodsInfoPo.bgicolor}&nbsp;
			               </TD>	
						   <TD class="table_body">计量单位</TD>
			               <TD class="table_none">
                           ${goodsInfoPo.bgiunitname}&nbsp;
			               </TD>
			               <TD class="table_body">商品级别</TD>
			               <td align="left" class="table_none" colspan="3">
                              ${goodsInfoPo.bgidefaultdiscountvaluename }
                           </td>
                        </TR>
                        </c:if>
                        <c:if test="${systemParameterPo.fspisusegoodslevel ne '1'}">
                         <tr>
                        <TD height="26" class="table_body">商品编号</TD>
			               <TD class="table_none">
                             ${goodsInfoPo.bgicolor}&nbsp;
			               </TD>	
						   <TD height="26" class="table_body">计量单位</TD>
			               <TD class="table_none" colspan="3">
                           ${goodsInfoPo.bgiunitname}&nbsp;
			               </TD>
                        </TR>
                        </c:if>
                        <c:if test="${systemParameterPo.fsphisflag == '2'}">
	                      <TR> 
				            <TD height="26" class="table_body">收费项目</TD>
				            <TD class="table_none" colspan="5">
							   <li class="horizontal_onlyRight">
                                   <c:forEach var="optionParamPoTmp" items="${optionParamPolist}" >
		                              <c:if test="${optionParamPoTmp.fopparentid=='his_payfee'}">
		                               ${(goodsInfoPo.bgipayfeeid == optionParamPoTmp.fopparamid)? optionParamPoTmp.fopparamname :'' }
		                              </c:if>	                                      	
	                               </c:forEach> 
	                           </li>
		      	             </TD>                
	                      </TR>
                      	</c:if>
                      </TBODY>
                    </TABLE>
                    </fieldset>
                    <br/>
                    <fieldset>
					<legend><font style="font-size: 14;font: bold">&nbsp;&nbsp;非&nbsp;必&nbsp;填&nbsp;项&nbsp;&nbsp;</font></legend>
                    <table width="99%" border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                        <tr>
                           <TD height="26" class="table_body" width="9%">护理液类型</TD>
			                <TD class="table_none" width="24%">
			                <c:if test="${goodsInfoPo.bgistealthtype==0}">
			                                            软水
			                </c:if>
			                <c:if test="${goodsInfoPo.bgistealthtype==1}">
			                                            硬水
			                </c:if>&nbsp;
			                </TD>
                           <TD class="table_body" width="9%">主容量</TD>
			               <TD class="table_none" width="24%">${goodsInfoPo.bgicapacity}&nbsp;    
			               </TD>
			               <TD class="table_body" width="9%">次容量</TD>
			               <TD class="table_none">${goodsInfoPo.bgicapacityentry}&nbsp;
			               </TD>

                        </tr>
                        <TR>
                           <TD height="26" class="table_body" width="9%">效期提醒上限</TD>
			               <TD class="table_none">${goodsInfoPo.bgireturnmax }&nbsp;
                           </td>
                           <TD class="table_body">效期提醒下限</TD>
			               <TD class="table_none" colspan="5">${goodsInfoPo.bgireturnmin }&nbsp;
                           	</TD>			             
                        </TR>
                      </TBODY>
                    </TABLE>
                    </fieldset>
                    <br/>
                    <fieldset>
					<legend><font style="font-size: 14;font: bold">&nbsp;&nbsp;价&nbsp;格&nbsp;项&nbsp;&nbsp;</font></legend>
                    <table width="99%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
             <c:if test="${(permissionPo.keyf==1)}"> 
				<c:if test="${systemParameterPo.fspwholesalepriceset eq '0'}">          
                       <TR>
                       <TD height="26" class="table_body" width="9%">税率</TD>
			               <TD class="table_none" width="24%">${goodsInfoPo.bgitaxrate}&nbsp;</TD>                         
                           <TD class="table_body" width="9%">含税单价</TD>
			               <TD class="table_none" width="24%">${goodsInfoPo.bgicostprice}&nbsp;</TD>
                           <TD class="table_body" width="9%">批发价格</TD>
			               <TD class="table_none">${goodsInfoPo.bgiwholesaleprice}&nbsp;</TD>
                        </TR>
                        <%--<tr>                                     
                           <TD height="26" class="table_body">加权平均成本</TD>
			               <TD class="table_none" colspan="5">${goodsInfoPo.bgiaveragenotnaxrate}&nbsp;</TD>
                        </tr>--%>
                </c:if>
				<c:if test="${systemParameterPo.fspwholesalepriceset eq '1'}">          
                       <TR>
                       <TD height="26" class="table_body" width="9%">税率</TD>
			               <TD class="table_none" width="24%">${goodsInfoPo.bgitaxrate}&nbsp;</TD>                         
                           <TD class="table_body" width="9%">含税单价</TD>
			               <TD class="table_none" colspan="3">${goodsInfoPo.bgicostprice}&nbsp;</TD>
                        </TR>
                        <%--<tr>                                     
                           <TD height="26" class="table_body">加权平均成本</TD>
			               <TD class="table_none" colspan="5">${goodsInfoPo.bgiaveragenotnaxrate}&nbsp;</TD>
                        </tr>--%>
                </c:if>
            </c:if>
            <c:if test="${(permissionPo.keyf!=1)}">
				<c:if test="${systemParameterPo.fspwholesalepriceset eq '0'}">            
                    <tr>
                      <TD height="26" class="table_body" width="9%">税率</TD>
			          <TD class="table_none" width="24%">${goodsInfoPo.bgitaxrate}&nbsp;</TD>
                           <TD class="table_body" width="9%">批发价格</TD>
			               <TD class="table_none" colspan="3">${goodsInfoPo.bgiwholesaleprice}&nbsp;</TD> 
                    </tr>
                </c:if>
				<c:if test="${systemParameterPo.fspwholesalepriceset eq '1'}">            
                    <tr>
                      <TD height="26" class="table_body" width="9%">税率</TD>
			          <TD class="table_none" colspan="5">${goodsInfoPo.bgitaxrate}&nbsp;</TD> 
                    </tr>
                </c:if>
            </c:if>  
                      </TBODY>
                    </TABLE>
                	<%@ include file="/commons/basic_retailPrices.jsp" %>
                    </fieldset>
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
	
	
	





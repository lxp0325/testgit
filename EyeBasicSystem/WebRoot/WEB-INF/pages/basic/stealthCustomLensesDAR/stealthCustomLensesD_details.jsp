<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>软性接触镜订制</title>
</head>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="stealthCustomLensesForm" method="post" action="">
<input type="hidden" name="moduleID" value="${requestScope.moduleID}" />

<input type="hidden" name="type" id="type" value="" /> 

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
       <TBODY>
        <TR>
          <TD style="PADDING-LEFT: 2px; HEIGHT: 1px" 
          background=${ctx}/img/pic/tab_top_bg.gif>
			<TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR><!--?Start-->
				<TD>
                  <TABLE height=0 cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD width=3><IMG id=tabImgLeft__1 height=22 
                        src="${ctx }/img/pic/tab_active_left.gif" width=3></TD>
                      <TD class=tab id=tabLabel__1 
                      background=${ctx }/img/pic/tab_active_bg.gif 
                      UNSELECTABLE="on">硬性接触镜详细</TD>
                      <TD width=3><IMG id=tabImgRight__1 height=22 
                        src="${ctx }/img/pic/tab_active_right.gif" 
                    width=3></TD>
                     
                    <TD width=3><IMG id=tabImgLeft__1 height=22 
                        src="${ctx }/img/pic/tab_unactive_left.gif" width=3></TD>
                      <TD class=tab id=tabLabel__1 
                      background=${ctx }/img/pic/tab_unactive_bg.gif 
                      onclick="JavaScript:window.location.href='initPricesAbout.action?moduleID=${requestScope.moduleID}&goodsid=${goodsInfoPo.bgigoodsid}&returnUrl=retail&glassType=D';"
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
                    <table width="99%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                        <TR>
						   <TD width="9%" height="26" class="table_body">商品代码</TD>
			               <TD width="24%" class="table_none">
                            ${goodsInfoPo.bgigoodsid}&nbsp;
                            <input class="text_input160" type="hidden" id="bgigoodsid" name="goodsInfoPo.bgigoodsid" value="${goodsInfoPo.bgigoodsid}">
			               </TD>
			                <TD width="9%" height="26" class="table_body">商品代码</TD>
			               <TD width="24%" class="table_none">
                            ${goodsInfoPo.bgigoodsbarcode}&nbsp;
                            <input class="text_input160" type="hidden" id="bgigoodsbarcode" name="goodsInfoPo.bgigoodsbarcode" value="${goodsInfoPo.bgigoodsbarcode}">
			               </TD>
			               <TD width="9%" class="table_body">商品名称</TD>
			               <TD width="24%" class="table_none">${goodsInfoPo.bgigoodsname}&nbsp;</TD>
                        </TR>
                        
                        <TR>
                          <TD width="9%" height="26" class="table_body">制造商</TD>
			               <TD class="table_none">                             
			               	${goodsInfoPo.bgisuppliername}&nbsp;
			               </TD>
                           <TD class="table_body">商品品种</TD>
			               <TD class="table_none">
                           	${goodsInfoPo.bgibrandname}&nbsp;
			               </TD>
			               <TD height="26" class="table_body">型号</TD>
			               <TD class="table_none">
                             ${goodsInfoPo.bgispec}&nbsp;
			               </TD>
			             		               
                        </TR>                        
                           
                        <TR>
                          <TD height="26" class="table_body">商品编号</TD>
			               <TD class="table_none">
                             ${goodsInfoPo.bgicolor}&nbsp;
			               </TD>	
                           <TD class="table_body">计量单位</TD>
			               <TD class="table_none">
	                           ${goodsInfoPo.bgiunitname}&nbsp;
			               </TD>
						   <TD height="26" class="table_body">球镜</TD>
			               <TD class="table_none">
			               	   ${goodsInfoPo.bgisphup }-
	                           ${goodsInfoPo.bgisphul }
	                           &nbsp;
			               </TD>
                         
                        </TR>
                        
                        <TR>
						   <TD height="26" class="table_body">轴位</TD>
			               <TD class="table_none">${goodsInfoPo.bgiaxisup}-${goodsInfoPo.bgiaxisul}&nbsp;
	                         </TD>
						   <TD height="26" class="table_body">曲率1</TD>
			               <TD class="table_none">${goodsInfoPo.bgicurvature1up}-${goodsInfoPo.bgicurvature1ul}&nbsp;
	                         </TD>
			               <TD class="table_body">曲率2</TD>
			               <TD class="table_none">${goodsInfoPo.bgicurvature2up}-${goodsInfoPo.bgicurvature2ul}&nbsp;
	                        </TD>
                        </TR> 
 
                        <TR>
                           	<TD class="table_body">直径</TD>
			               	<TD class="table_none">${goodsInfoPo.bgidiaup}-${goodsInfoPo.bgidiaul}&nbsp;
	                       	</TD>
						  	<TD height="26" class="table_body">柱镜</TD>
			               	<TD class="table_none">
								${goodsInfoPo.bgicylup}-${goodsInfoPo.bgicylul }&nbsp;
	                        </TD>
							<TD  height="26" class="table_body">车房周期</TD>
			               	<TD  class="table_none">
	                          ${goodsInfoPo.bgiordercycle}天
			               	</TD>
                        </TR> 
                        <TR>
                        	<TD height="26" class="table_body">接触镜类别</TD> 
			                <TD class="table_none" colspan="5">
			                 		<c:forEach var="optionParamPoTmp" items="${optionParamPolist}" >
		                              <c:if test="${optionParamPoTmp.fopparentid=='GRType'}">
		                               ${(goodsInfoPo.bgicontacttyped == optionParamPoTmp.fopparamid)? optionParamPoTmp.fopparamname :'' }
		                              </c:if>                                  	
	                                </c:forEach>&nbsp;
			                </TD>
						</TR>
                        <c:if test="${systemParameterPo.fspisusegoodslevel eq '1'}">
                        	<TR>
	                           <TD height="26" class="table_body">商品级别</TD>
				               <td align="left" class="table_none" colspan="5">
	                              ${goodsInfoPo.bgidefaultdiscountvaluename }
	                           </td>
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
                    <table width="99%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                        <TR>
                           <TD height="26" class="table_body" width="9%">使用类型</TD>
			               <TD class="table_none" width="24%">
                           ${goodsInfoPo.bgiusetype != "1" ? '' : '常戴型' }
      		               ${goodsInfoPo.bgiusetype != "2" ? '' : '抛弃型' }
      		               ${goodsInfoPo.bgiusetype != "3" ? '' : '塑形镜' }&nbsp;
      	                 
			               </TD>
			               
			               <TD height="26" class="table_body">抛弃型分类</TD>
			               <TD class="table_none">
                           ${goodsInfoPo.bgistealthclass == "1" ? '日抛' : '' }
                             ${goodsInfoPo.bgistealthclass == "2" ? '周抛' : '' }
                             ${goodsInfoPo.bgistealthclass == "9" ? '双周抛' : '' }
                             ${goodsInfoPo.bgistealthclass == "3" ? '月抛' : '' }
                             ${goodsInfoPo.bgistealthclass == "4" ? '季抛' : '' }
                             ${goodsInfoPo.bgistealthclass == "5" ? '半年抛' : '' }
                             ${goodsInfoPo.bgistealthclass == "6" ? '年抛' : '' }
                             ${goodsInfoPo.bgistealthclass == "7" ? 'RGP' : '' }
                             ${goodsInfoPo.bgistealthclass == "8" ? '塑形镜' : '' }&nbsp;
			               </TD>
			               <TD height="26" class="table_body">产品可使用天数</TD>
			               <TD class="table_none" colspan="3">${goodsInfoPo.bginumberofdays}天</TD>
			            </TR> 
						<TR>
						   <TD height="26" class="table_body" width="9%">效期提醒上限</TD>
			               <TD class="table_none" width="24%">有效期前&nbsp;${goodsInfoPo.bgireturnmax }&nbsp;天提醒进入滞销状态
                           </td>
                           <TD height="26" class="table_body" width="9%">效期提醒下限</TD>
			               <TD class="table_none">有效期前&nbsp;${goodsInfoPo.bgireturnmin }&nbsp;天提醒进入即将失效状态
                           </TD>
			               <TD height="26" class="table_body" width="9%">颜色</TD>
			               <TD class="table_none" width="24%" colspan="3">
                         	 ${goodsInfoPo.bgichinesecolorname}&nbsp;
			               </TD>
                        </TR>            
                        
                        <TR>
			               <TD  height="26" class="table_body">联合光度</TD>
			               <TD  class="table_none" colspan="5">${goodsInfoPo.bgiunionsphcyl}</TD>			               
                        </TR>
                      </TBODY>
                    </TABLE>
                	
                    </fieldset>
                    <br/>
                    <fieldset>
					<legend><font style="font-size: 14;font: bold">&nbsp;&nbsp;价&nbsp;格&nbsp;项&nbsp;&nbsp;</font></legend>
                    <table width="99%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
            <c:if test="${(permissionPo.keyf!=1)}">   
				<c:if test="${systemParameterPo.fspwholesalepriceset eq '0'}">        
                       <TR>                        
                           <TD height="26" class="table_body" width="9%">税率</TD>
			               <TD class="table_none" width="24%">${goodsInfoPo.bgitaxrate}&nbsp;</TD>
                           <TD class="table_body" width="9%">批发价格</TD>
			               <TD class="table_none" colspan="3">${goodsInfoPo.bgiwholesaleprice}&nbsp;</TD>
                        </TR>
                </c:if>    
				<c:if test="${systemParameterPo.fspwholesalepriceset eq '1'}">        
                       <TR>                        
                           <TD height="26" class="table_body" width="9%">税率</TD>
			               <TD class="table_none" colspan="5">${goodsInfoPo.bgitaxrate}&nbsp;</TD>
                        </TR>
                </c:if> 
            </c:if>
            <c:if test="${(permissionPo.keyf==1)}" >  
				<c:if test="${systemParameterPo.fspwholesalepriceset eq '0'}">         
                       	<TR>                        
                           <TD height="26" class="table_body" width="9%">爱尔结算价</TD>
			               <TD class="table_none" width="24%">${goodsInfoPo.bgicostprice}&nbsp;</TD>
                           <TD class="table_body" width="9%">批发价格</TD>
			               <TD class="table_none"  colspan="3">${goodsInfoPo.bgiwholesaleprice}&nbsp;</TD>
                        </TR>
                 </c:if>
				 <c:if test="${systemParameterPo.fspwholesalepriceset eq '1'}">         
                        <TR>                        
                           <TD height="26" class="table_body" width="9%">爱尔结算价</TD>
			               <TD class="table_none" colspan="5" >${goodsInfoPo.bgicostprice}&nbsp;</TD>
                        </TR>
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
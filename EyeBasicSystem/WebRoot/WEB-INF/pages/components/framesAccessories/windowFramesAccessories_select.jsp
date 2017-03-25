<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择商品</title>
</head>
<script>	
	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});
	});
	
	function doList(link,perPage_Select,perPage_Text_Hidden){
     	 var objOne = document.all[perPage_Select];
	  	document.all[perPage_Text_Hidden].value = objOne.options[objOne.selectedIndex].value;
	  	framesAccessoriesForm.action=link;
	  	framesAccessoriesForm.submit();
	}
	function search(){
		if(checkForm(document.all.framesAccessoriesForm)){ 
			$("img").removeAttr("onclick"); 
			framesAccessoriesForm.action = "selectFramesAccessories.action";
			framesAccessoriesForm.submit();
		}
	}
	function selectFrames(obj){
		if(event.keyCode==13){
			if (obj.value === ''||obj.value.length<26) {
				alert('条码位数不符!');
				obj.value='';
				obj.focus();
				return;
			}else {
				framesAccessoriesForm.action = "selectFramesByGoodsbarcode.action";
			framesAccessoriesForm.submit();
			}
			
		}
	}
	function clean(){
		document.getElementById('goodsId').value = "";
		document.getElementById('goodsName').value = "";
		document.getElementById('supplierName').value = "";
		document.getElementById('supplierId').value = "";
		document.getElementById('brandName').value = "";
		document.getElementById('brandId').value = "";
	}	
	function permissionMessage(){
       alert('您无此操作权限');
	}
	
	function choose(json){
		parent.setCategory('镜架辅料');
		parent.addGoods(json);
		//parent.hidePopWin();
		parent.toRound();
		window.location.href='initFramesAccessoriesSel.action';
	}	
	
	
	
	$(document).ready(function(){
		$('#bgigoodsbarcode').focus();
	});
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="framesAccessoriesForm" method="post" action="">
<input type="hidden" name="moduleID" value="${requestScope.moduleID}">
<input name="" type="text" style="display:none">

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <tr height="20"><td></td></tr>
        <TR>
          <TD style="PADDING-LEFT: 2px; HEIGHT: 1px" 
          background=${ctx }/img/pic/tab_bg.gif>
				</TD></TR>
        <TR>
          <TD bgColor=#ffffff>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=1 background=${ctx }/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx }/img/pic/tab_bg.gif" width=1></TD>
                <TD 
                style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; PADDING-TOP: 5px; HEIGHT: 100px" 
                vAlign=top><DIV id=tabContent__1>
                  <DIV>		
				  <table width="100%" id="title0"  border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                     <TBODY>
                       <TR>
                         <TD width="5%"><div align="left"><img src="${ctx }/img/pic/queryCondition.gif" width="86" height="20" ></div></TD>
                         <TD width="95%" background="${ctx }/img/pic/msgbg.png" >&nbsp;</TD>
                       </TR>
                     </TBODY>
                   </TABLE>
				   <table width="100%"  border=0 align=center cellpadding=0 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                      <TR>
                      	<TD width="%15" height="26" class="table_body">商品条码</TD>
                      	<TD width="%35" class="table_none" colspan="3" >
                            <input class="text_input200" type="text" onkeydown="selectFrames(this)" id="bgigoodsbarcode" name="bgigoodsbarcode" value="" style="ime-mode:disabled">
                            <font color="red">按回车查询商品</font>
			               </TD>
                      </TR>
                      </TBODY>
                    </table>
					<c:if test="${not empty(framesAcessoriesList)}"> 
					<table width="100%"   border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                              <TBODY>
                                <TR>
                                  <TD width="5%"><div><img src="${ctx}/img/pic/queryInfo.gif" width="86" height="20"></div></TD>
                                  <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                     </TABLE>
                     <br/>
					  <table width="100%" border=0 align=center cellpadding=0 cellspacing=1 class="privateBorder">
                      <TBODY>
                        <TR class=table_title align=middle>
                          <TH width="4%" height="26" scope=col>操作</TH>                        
                          <TH width="16%" scope=col>商品代码</TH>
                          <TH width="20%" scope=col>商品名称</TH>
                          <TH width="20%" scope=col>品种</TH>
                          <TH width="10%" scope=col>型号</TH>
                          <TH width="10%" scope=col>颜色</TH>                         
                          <TH width="10%" scope=col>销售金额</TH>                                                                                                                               
						  <TH width="10%" scope=col>商品数量</TH> 
						</TR>
						<c:forEach var="i" items="${framesAcessoriesList}" varStatus="index"> 
                        <TR class="row" onMouseOver="mover(this,'#a2c1eb')" onMouseOut="mout(this,'#cadee8')">                         
                          <TD height="26">
                          <img src="${ctx }/img/newbtn/select_0.png" btn=btn title='选 择' onClick="choose({'bgigoodsid':'${i.bgigoodsid}','bgigoodsname':'${i.bgigoodsname}','bgibrandname':'${i.bgibrandname}','bgiretailprice':'${i.bgiretailprice}','bgicostprice':'${i.bgicostprice}','bginottaxrate':'${i.bginottaxrate}','bgigoodsbarcode':'${pcBarcode}'})">
                          </TD>
                          <TD>${i.bgigoodsid}</TD>
                          <TD>${i.bgigoodsname}</TD>
                          <TD>${i.bgibrandname}</TD>
                          <TD>${i.bgispec}</TD>
                          <TD>${i.bgicolor}</TD>
                          <TD>${i.bgiretailprice}</TD>  
                          <TD>${i.bgigoodsquantity}</TD> 
                          <input type="hidden" name="bgicostprice" id="bgicostprice" value="${i.bgicostprice}" /> 
                          <input type="hidden" name="bginottaxrate" id="bginottaxrate" value="${i.bginottaxrate}" />                     
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
                  <!--?End--></TD>
                <TD width=1 background=${ctx}/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx}/img/pic/tab_bg.gif" 
width=1></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
        <TD background=${ctx }/img/pic/tab_bg.gif bgColor=#ffffff><IMG height=1 
            src="${ctx }/img/pic/tab_bg.gif" width=1></TD></TR></TBODY></TABLE><!--?? End--></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV>
</form>
</body></html>
<%@ include file="/WEB-INF/inc/message.jsp" %>

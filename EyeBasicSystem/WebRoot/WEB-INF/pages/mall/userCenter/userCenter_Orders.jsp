<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微商城</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
</head>

	<link href="<%=request.getContextPath()%>/css/mall/header.css" type="text/css" rel="stylesheet"> 	
	<link href="<%=request.getContextPath()%>/css/mall/style.css" type="text/css" rel="stylesheet">    	
	<link href="<%=request.getContextPath()%>/css/mall/main.css" type="text/css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/mall/shop_pcs.css" type="text/css" rel="stylesheet">
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
    <div class="lay_header">
	    <a href="selectUserCenterList.action" class="func_page_tab">
	    	<i class="tab_i">
	        	<img src="<%=request.getContextPath()%>/img/mall/user.jpg">
	    	</i>
	    </a>
	    <span class="page_title">订单列表</span>
	    <a href="selectMallGoodsList.action" class="func_page_tab">
	    	<i class="tab_i">
	    		<img src="<%=request.getContextPath()%>/img/mall/mainpage.png">
	    	</i>
	    </a>
	    <a href="selectMallShoppingCartList.action" class="func_page_tab_last" rel="nofollow">
	    	<i class="last_tab_i">
	    		<img src="<%=request.getContextPath()%>/img/mall/gouwuche1.png">
	   		</i> 
	   	</a>
    </div>
  <div class="blockwidth" id="main"> 
   <div class="myorder"> 
    <div class="myorderM"> 
     <div class="myorder_m"> 
      <ul> 
       <li><a href="selectUserCenterOrders.action">已支付</a></li> 
       <li ><a href="selectUserCenterShoppingCarts.action" class="sel">未支付</a></li> 
       <li class="last"><a href="selectUserCenterOrders.action">已完成</a></li>
      </ul> 
      <div class="myorder_list"> 
       		<s:iterator value="mallShoppingOrderList" var="po">
			<div class="myorder_detail"> 
		       <div class="myorder_detail_m"> 
		          <p>
		          <div class="single_goods">
	                 <a href="selectMallGoodsDetail.action?hid=${po.msosmallid }" class="single_goods_img">
	                     <img src="<%=request.getContextPath()%>${po.msosmallpicurl }"></a>
	                 <div class="single_goods_info">
	                     <a href="selectMallGoodsDetail.action?hid=${po.msosmallid }" class="single_goods_name">${po.msosmallname }</a>
	                     <span class="single_goods_cs">
	                     	<c:if test="${not empty po.msocolor}">颜色：${po.msocolor }</c:if>&nbsp;
	                     	<c:if test="${not empty po.msospec}">型号：${po.msospec }</c:if>
	                     </span>
	                 </div>
	              </div>
		          </p> 
		          <p> 订单状态：<font>
						<c:choose>
							<c:when test="${po.msostate eq '0'}">
								订单已生成
							</c:when>
							<c:when test="${po.msostate eq '0'}">
								销售单已生成
							</c:when>
							<c:otherwise>
								商品已发货
							</c:otherwise>
						</c:choose>
					</font></p>  
		          <p> 下单时间：${fn:substring(po.msodatetime,0,16)}</p> 
		          <p> 订单金额：<font>￥${po.msopricesum }</font></p> 
		       </div> 
	        </div>
	        <div class="myorder_but"> 
	         <a href="#"> <p class="first"> 查看订单</p> </a> 
	        </div> 
         </s:iterator> 
      </div> 
     </div> 
    </div> 
   </div> 
  </div> 
</BODY>
</HTML>
<%@ include file="/WEB-INF/inc/message.jsp" %>
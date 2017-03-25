<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>价格表管理</title>
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

	function search(){
		$("img").removeAttr("onclick");
		personInfoForm.action = "priceListSel.action";
		personInfoForm.submit();
		showLoadingBar();
	}	
	function insert(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		if(is_iPad()){
			showPopWin("initPriceListInsert.action?moduleID=${requestScope.moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initPriceListInsert.action?moduleID=${requestScope.moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}		
		document.getElementById('popupTitle').innerHTML="【价格表新增】";
	}
	function update(hid){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		if(is_iPad()){
			showPopWin("initPriceListUpdate.action?moduleID=${requestScope.moduleID}&hid="+hid,970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initPriceListUpdate.action?moduleID=${requestScope.moduleID}&hid="+hid,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}		
		document.getElementById('popupTitle').innerHTML="【价格表修改】";
	}
	
	function del(id){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		showPopWin("initPriceListDelete.action?moduleID=${requestScope.moduleID}&hid="+id,400,160,topRows,topCols,returnRefresh(true),false);		
		document.getElementById('popupTitle').innerHTML="【价格表删除】";
	}	
	
	function uplod(id,TvUrl){
		if(''==TvUrl){
			alert('文件已损坏或不存在!');
			return;
		}
		//alert('2');
		personInfoForm.action = "exportPriceListFile.action?hid="+id;
		personInfoForm.submit();
	}
	
	function isNoUplod(id,TvUrl){
		//alert('1');
		uplod(id,TvUrl);
		/*
   	   	$.ajax({           
	   	 	type: "POST",          
   	   	    url: "IsNoPriceListUplod.action?",          
   	   	    async: true, 
   	   	    data: "hid="+id,     
   	   	    success: function(msg){
	   	   		if(msg==0){
	   	   			uplod(id,TvUrl);
	   	   		}else{
		   	   		alert("文件损坏或不存在!");
		   	   		return;
	   	   		}
   	   	    }    
	   	});
	   	*/
	}
	
	function clean(){
	    document.all.startDate.value="";
	    document.all.endDate.value="";
	    document.all.jcontent.value="";
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
		
		document.getElementById('stratdate').value = now;
		document.getElementById('enddate').value = now;		
	}
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="personInfoForm" method="post" action="">
<input type="hidden" name="moduleID" value="${requestScope.moduleID}">

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
          <TR>
            <TD class=menubar_title width="15%"><img border='0' src='${ctx }/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>价格表管理</TD>
            <TD align="left"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：价格表查询</TD>
            <td align="right" valign="bottom">&nbsp;
            	<c:if test="${(permissionPo.keya==1)}"> 
            		<img src="${ctx }/img/newbtn/btn_jgbxz_0.png " btn=btn title="价格表新增" onclick="insert()"/>
            	</c:if>
            	<img src="${ctx }/img/newbtn/btn_isshowsearch_0.png" btn=btn title="显隐查询条件" onClick="JavaScript:searchContentShowOrHidden('title0,title1,title2');changeShowOrHidden();" />
            </td>
          </TR>
          <TR>
            <TD class=menubar_function_text colspan="3"><table></table></TD>
          </TR>    
        </TBODY>
      </TABLE>
      <!-- ?? End --><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <tr height="20">
         <TD style="PADDING-LEFT: 2px; HEIGHT: 22px" background=${ctx }/img/pic/tab_top_bg.gif></TD>        
        </tr>
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
							<table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                     
                      <TBODY>
					  	<TR>
					  	  <TD width="15%" height="30" class="table_body">内容简介</TD>
                          <TD width="20%" class="table_none" colspan="3"><input class="text_input240" id="jcontent" name="jcontent" value="${jcontent }"></TD>
					  	
						   <TD width="15%" height="30" class="table_body">上传时间</TD>
			               <TD width="20%" class="table_none"><li class="horizontal_onlyRight"><input clean=clean id="startDate"
					       name="startDate" 
					       type="text" class="text_input100" 
					       onFocus="WdatePicker({readOnly:true, maxDate:'#F{$dp.$D(\'endDate\')}'})"
					       value="${startDate }" /> 至 <input clean=clean id="endDate"
					       name="endDate" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true, minDate:'#F{$dp.$D(\'startDate\')}'})" 
					        value="${endDate }" /></li>
					        <li class="horizontal_onlyRight">
					       <!--  <img src="${ctx }/img/newbtn/btn_today_0.png" btn=btn title="今天" onClick="today()"> -->
					        </li></TD>

                        </TR>
                      </TBODY>
                    </TABLE>
               <c:if test="${(permissionPo.keya==1)}">  
                    <table id="title2" cellspacing="2">
						<tr height="10">
							<td>
							  	<img src="${ctx }/img/newbtn/btn_search_0.png" btn=btn title='查询' onclick="search();" >
							    <img src="${ctx }/img/newbtn/btn_empty_0.png" btn=btn title='清空' onclick="clean();" >	
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
					<c:if test="${not empty(trainingCoursesList)}">
                    <table width="100%" id="title0"  border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                              <TBODY>
                                <TR>
                                  <TD width="5%"><div align="left"><img src="${ctx }/img/pic/queryInfo.gif" width="86" height="20" ></div></TD>
                                  <TD width="95%" background="${ctx }/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                    
					<table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                        <TR class=table_title align=middle>
                          <TH width="8%" height="30" scope=col>上传时间</TH>
                          <th width="4%">上传人</th>
                          <TH width="20%" scope=col>内容简介</TH>
						  <c:if test="${(permissionPo.keyb==1)}">   
                          <TH width="4%" scope=col>下载</TH>
                          </c:if>
                            <c:if test="${(permissionPo.keye==1)}"> 
                          <TH width="4%" scope=col>修改</TH> 
                          </c:if>
                           <c:if test="${(permissionPo.keyc==1)}"> 
                          <TH width="4%" scope=col>删除</TH> 
                          </c:if>
                        </TR>
                        <c:forEach var="po" items="${trainingCoursesList}" >
                        <TR class="row" onMouseOver="mover(this,'#a2c1eb')" onMouseOut="mout(this,'#cadee8')">
                          <TD height="28">${fn:substring(po.kjbcreasedate,0,16) }</TD>
						  <td>${po.kjbcreasepersonname }</td>
                          <TD>${po.kjbcoursescontent }</TD>
                        <c:if test="${(permissionPo.keyb==1)}">    
                          <TD><img src="${ctx }/img/newbtn/returnvisit_0.png" btn=btn title='下载' onClick="isNoUplod('${po.kjbid }','${po.kjbtvurl }')"></TD>
                       </c:if> 
                        <c:if test="${(permissionPo.keye==1)}">  
                       <TD><img src="${ctx }/img/newbtn/edit_0.png" btn=btn title='修改' onClick="update('${po.kjbid }')"></TD>
                       </c:if>
                        <c:if test="${(permissionPo.keyc==1)}">  
                          <TD><img src="${ctx }/img/newbtn/delete_0.png" btn=btn title='删除' onClick="del('${po.kjbid }')" ></TD>
                       </c:if>     
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
    <TD height=5></TD></TR></TBODY></TABLE></DIV></BODY></HTML>
<%@ include file="/WEB-INF/inc/message.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顾客取镜</title>
</head>
<script>
$(document).ready(function (){

	$("#salesids").val(window.parent.$("#salesids").val());
	$("#memberids").val(window.parent.$("#memberids").val());
	$('[name=salerid]').val('${person.id}');
	
});
	function del()
	{
		$("img").removeAttr("onclick");
		postForm.action = "insertCustInTranitBulk.action";
		postForm.submit();
	}
	
	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});
	});
	function disabledSelect(){
		$('#ssesbsalerid').attr("disabled","disabled");
		$('[name=salerid]').val($('#ssesbsalerid').val());
	}
	function changeSaleser(){
		$('#ssesbsalerid').attr("disabled","");
	}
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form action="" method="post" name="postForm">

<input type="hidden" id="salesids" name="salesids" value="">
<input type="hidden" id="memberids" name="memberids" value="">

<input type="hidden" value="${moduleID }" name="moduleID" id="moduleID" />
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <tr height="10"><td></td></tr>
        <TR>
          <TD style="PADDING-LEFT: 2px; HEIGHT: 1px" 
          background=${ctx}/img/pic/tab_bg.gif>
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
                    <table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 id="title1">
                      <TBODY>
                      <!--  
                      <c:if test="${first==1}" >                      
	                        <TR>
	                          <TD height="26" class="table_body" width="20%">短信内容</TD>
	                          <TD class="table_none">                         
	                            <textarea name="content" readonly="readonly" id="content" >${content }</textarea>
	                          </TD>
	                        </TR>
                        </c:if>
                        -->
                        <input type="hidden" name="content" id="content" value="${content}">
                      <TR>
						   <TD width="95%" height="26" colspan="2">
						   <li id="saleserDiv" class="horizontal">
						   		确认批量取镜?</li>

								<li id="saleserDiv" class="horizontal">

										<SELECT id="ssesbsalerid" name="ssesbsalerid" disabled="disabled" onchange="disabledSelect()">
											<c:forEach var="po" items="${personInfoPos}">
												<option value="${po.id }" ${person.id != po.id ? '':'selected=selected'}>${po.personName }</option>
											</c:forEach>
										</SELECT>								    

									<input name="salerid" type="hidden" value='' validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '请选择人员！'}]"> 
								</li>	
								<li id="saleserDiv" class="horizontal"><img name="button32" btn=btn id='saleser' src="${ctx}/img/newbtn/btn_gxry_0.png" title="更换人员" align="left" onclick="changeSaleser()">
								</li>					  
						  
						   </TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
                      <!--  
                      <c:if test="${first==1}" >  
                       <TR>                       
                          <TD>
                                                  
								<c:choose>
									<c:when test="${second==1}">
										<input type=checkbox id="isSend" name="isSend" value="1" checked="checked" >发送短信 &nbsp;&nbsp;
									</c:when>
									<c:otherwise>
										<input type=checkbox id="isSend" name="isSend" value="1" >发送短信 &nbsp;&nbsp;
									</c:otherwise>
								</c:choose>															
                             </TD>
                              </TR>
                         </c:if>
                         -->
                         <c:if test="${first==1}" >   
                            
								<c:choose>
									<c:when test="${second==1}">
										<input type="hidden" id="isSend" name="isSend" value="1" >
										
									</c:when>
									<c:otherwise>
										<input type="hidden" id="isSend" name="isSend" value="0" >
									</c:otherwise>
								</c:choose>
                         </c:if>  
                        <TR>
                          <TD><img src="${ctx }/img/newbtn/btn_define_0.png" btn=btn id="submitButton" title='确定' onClick="javascript:del()">
							
                          
                          
                          </TD>
						  </TR>
                      </TBODY>
                    </TABLE>
                	
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

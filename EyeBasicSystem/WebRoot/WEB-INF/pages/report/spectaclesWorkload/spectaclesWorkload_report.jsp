<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报表中心</title>
</head>
<script>	
	function search(){
		if(checkForm(document.all.goodsForm)){
			
			var dateyear = document.getElementById("years").value;
			var datemonth = document.getElementById("months").value;
			
			var url = '<%= getServletContext().getInitParameter("rptUrl")%>';
			url+="eims_reporting/logistics_spectaclesWorkloadRpt&year="+dateyear+"&month="+datemonth+"&rs:Command=Render"; 
			//window.open (url, 'checkPersonTotalStatisticsRpt', 'fullscreen=no, top=150,left=150, toolbar=no, menubar=no, scrollbars=yes, location=no, status=no,resizable=yes');
			var topRows = top.document.getElementById("total").rows;
			var topCols = top.document.getElementById("btmframe").cols;
			
			if(is_iPad()){
				showPopWin(url,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
			}else{
				showPopWin(url,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
			}
		}
	}
	
	function clean(){
		document.getElementById('startTime').value = "";
		document.getElementById('endTime').value = "";
	}
	function selectContact(obj){
		if(event.keyCode==13){
			search();
		}
	}
	
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' } onkeyup="selectContact(this)">
<form name="goodsForm" method="post" action="">
<input type="hidden" name="moduleID" value="${requestScope.moduleID}">
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
          <TR>
            <TD class=menubar_title width="15%"><img border='0' src='${ctx }/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>报表中心</TD>
            
            <TD width="45%"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：检验发料人员工作量统计表</TD>
            <TD>&nbsp;</TD>
          </TR>
          <TR>
            <TD class=menubar_function_text colspan="3">
            	<table></table>
            </TD>
          </TR>
        </TBODY>
      </TABLE>
      <!-- ?? End --><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <tr height="20"><td></td></tr>
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
                <TD width=1 background=${ctx }/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx }/img/pic/tab_bg.gif" width=1></TD>
                <TD 
                style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px; HEIGHT: 100px" 
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
			               <TD width="10%" class="table_body">年份</TD>
                          <TD width="40%" class="table_none">
					  		<select id="years" name="years" yyorder="3" 
						       	validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '请选择年份！'}]">
						       	 <option value="">请选择年份</option>
						       	 	<c:forEach var="yyyy" begin="0" end="${requestScope.endy - requestScope.beginy}" step="1" varStatus="index">
										<option value="${requestScope.endy - index.index}" 
										${requestScope.endy!= (requestScope.endy - index.index )? '' : 'selected="selected"'}>
										<!-- ${requestScope.year!= (requestScope.endy - index.index)  ? '' : 'selected="selected"' }> -->
										${requestScope.endy - index.index}
										</option>
			               			</c:forEach>
						       	 </select>
						     </TD>
			               <TD width="10%" height="30" class="table_body">月份</TD>
			               <TD width="40%" class="table_none">
			               	<select id="months" name="months" 
			               		validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '请选择月份！'}]">
			               		<option value="" ${requestScope.month!='' ? '' : 'selected="selected"' }>请选择月份</option>
			               		<option value="1" ${requestScope.month != '1' ? '' : 'selected="selected"' }>1</option>
			               		<option value="2" ${requestScope.month != '2' ? '' : 'selected="selected"' }>2</option>
			               		<option value="3" ${requestScope.month != '3' ? '' : 'selected="selected"' }>3</option>
			               		<option value="4" ${requestScope.month != '4' ? '' : 'selected="selected"' }>4</option>
			               		<option value="5" ${requestScope.month != '5' ? '' : 'selected="selected"' }>5</option>
			               		<option value="6" ${requestScope.month != '6' ? '' : 'selected="selected"' }>6</option>
			               		<option value="7" ${requestScope.month != '7' ? '' : 'selected="selected"' }>7</option>
			               		<option value="8" ${requestScope.month != '8' ? '' : 'selected="selected"' }>8</option>
			               		<option value="9" ${requestScope.month != '9' ? '' : 'selected="selected"' }>9</option>
			               		<option value="10" ${requestScope.month != '10' ? '' : 'selected="selected"' }>10</option>
			               		<option value="11" ${requestScope.month != '11' ? '' : 'selected="selected"' }>11</option>
			               		<option value="12" ${requestScope.month != '12' ? '' : 'selected="selected"' }>12</option>
			               	</select>
                          </TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table id="title2" cellspacing="2">
						<tr height="10">
							<td>
								<input id="submitButton" icon='icon-search' type='button' value='查询' onClick="javascript:search()">
								<input icon='icon-retry' type='button' value="清空" onClick="clean()">
							</td>
						</tr>
					</table>
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

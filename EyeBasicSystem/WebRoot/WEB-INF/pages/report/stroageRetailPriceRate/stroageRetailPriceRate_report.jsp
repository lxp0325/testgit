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
$(document).ready(function() { 
    $("img[btn=btn]").attr("style","cursor: hand;"); 
    $("img[btn=btn]").mouseover(function () { 
    $(this).attr("src",$(this).attr("src").replace("0","1")); 
    }).mouseout(function () { 
      $(this).attr("src",$(this).attr("src").replace("1","0")); 
    }); 
});
	function search(){		
		var goodscategoryID = document.getElementById("goodscategoryID").value;
		
		var DataURL = "report.action?reportlet=stroage_stroageRetailPriceRate.cpt&categoryid="+goodscategoryID;
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin(DataURL,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin(DataURL,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}

		document.getElementById('popupTitle').innerHTML="【存货产品预计销售额统计】";
	}

	function openBrand(){
		var goodscategoryID= document.all.goodscategoryID.value;
		var supplierID=document.getElementById('supplierID').value;
		
	    if(supplierID==''){
	      alert('请选择所属制造商');
	      return false;
	    }
	    var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("selBrandOpen.action?categoryID_open="+goodscategoryID+"&supplierID_open=" + document.getElementById('supplierID').value,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("selBrandOpen.action?categoryID_open="+goodscategoryID+"&supplierID_open=" + document.getElementById('supplierID').value,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【品种查询】";
	}
	
	/**
	 * 开窗赋值实现方法
	 */
	function openBrandValues(json){
		document.getElementById('brandID').value = json.brandID;
		document.getElementById('brandName').value = json.brandName;
	}
	
	function clean(){
		document.getElementById('goodscategoryID').value = "";
	}
	
	/**
	 * 制造商开窗
	 */
	function openSupplier(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("selSupplierOpen.action",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("selSupplierOpen.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		
		document.getElementById('popupTitle').innerHTML="【制造商查询】";
	}
	
	/**
	 * 开窗赋值实现方法
	 */
	function openSupplierValues(json){
		document.getElementById('supplierID').value = json.id;
		document.getElementById('supplierName').value = json.value;
		
	}
	
	/**
	 * 部门开窗
	 */
	function openDepartment(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;		
		if(is_iPad()){
			showPopWin("initDepartmentOpen.action",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initDepartmentOpen.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}		
		document.getElementById('popupTitle').innerHTML="【部门查询】";
	}

	/**
	 * 部门开窗赋值实现方法
	 */
	function openDepartmentValues(objValue){
		var arrayID = new Array();
		var arrayName = new Array();
		var departments = eval('(' + objValue + ')');
		for(var i = 0; i < departments.length; i++){	
			arrayID[i] = departments[i].bdpdepartmentid;
			arrayName[i] = departments[i].bdpdepartmentname;
		}
		
		document.getElementById('departmentID').value = arrayID.join(",");
		document.getElementById('bdpdepartmentname').value = arrayName.join(",");
		document.getElementById('ds').value = document.getElementById('bdpdepartmentname').value;
	}
</script>
<body ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
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
            <TD class=menubar_title width="15%"><img border='0' src='${ctx }/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>物流类报表</TD>
            
            <TD width="45%"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：存货产品预计销售额统计 </TD>
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
                           <TD height="26" class="table_body" width="9%">商品类别</TD>
			               <TD class="table_none">
							   <select id="goodscategoryID" name="goodscategoryID">
	      		                 <option value="">----请选择----</option>
	      		                 <s:iterator value="goodsCategorys">
					               <option value="${bgcid}">${bgcgoodscategoryname}</option>
		     	                 </s:iterator>
	      	                   </select>
	      	               </TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table id="title2" cellspacing="2">
						<tr height="10">
							<td>
								<img btn=btn src="${ctx }/img/newbtn/btn_search_0.png" title='查询' onclick="search();" >
								<img btn=btn src="${ctx }/img/newbtn/btn_empty_0.png" title='清空' onclick="clean();" >	
							</td>
						</tr>
					</table>
					
					<table width="100%">
						<tr height="50px">
							<div class="reportHelp">
								1.用&nbsp;&nbsp;&nbsp;途：根据查询条件对仓位中库存商品的预销售额占总库存的预销售额比率进行分析统计。<br/>
								2.查询条件：商品类别（按类别查询商品，如镜架、镜片等）
								</div>
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


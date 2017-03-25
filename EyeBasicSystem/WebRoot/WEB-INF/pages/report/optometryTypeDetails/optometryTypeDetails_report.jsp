<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type='text/javascript' src='${ctx }/js/currentDate.js'></script>
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
	    
	    if('${person.personcompanytype}' == '2'){
        	loadDepartmentids('${person.personcompanyid}');
        }
	}); 
	
	function search(){
		var shopCode=document.all.departmentID.value;
		if(shopCode == ''){
			shopCode = $("#dids").val();
		}
		
		var beginDate=document.all.startTime.value;
		var endDate=document.all.endTime.value;
		var memberID=document.all.memberid.value;
		var name=EncodeUtf8(document.all.customername.value);
		var Casher=document.all.cashierid.value;
		var RegisteredName=EncodeUtf8(document.all.registername.value);

		var departmentNames = EncodeUtf8(document.getElementById("ds").value);
		if(departmentNames == ''){
			departmentNames = EncodeUtf8($("#dnames").val());
		}
		
		var statisticsName = EncodeUtf8(getSelectText("whichtype", ""));
        var regname = '';
        if ($("#registername").val() != ''){
        	regname = EncodeUtf8($("#registername").find("option:selected").text());
        }

		var isShow = "";
		$("input[id=isShow]").each(function() {
			if($(this).attr("checked") == true) {
				isShow = $(this).val();
			}
		});
		if(beginDate=="" || endDate==""){
			alert('请选择日期!');
			return false;
		}
		if(!$("#whichtype").val()){
			alert("请选择统计类型！");
			return;
		}
		if($("#whichtype").val() == '1'){
			if($("input[name=queryType]:checked").val()==0){
				var DataURL = "report.action?reportlet=sales_optometryTypeSumRpt.cpt&logincompanyid="+'${person.personcompanyid}'+"&shopCode="+shopCode+"&beginDate="+beginDate+"&endDate="+endDate+"&departmentNames="+departmentNames+"&statisticsName="+statisticsName+'&isShow='+isShow;
			}else{
				var DataURL = "report.action?reportlet=sales_optometryTypeSumRpt1.cpt&logincompanyid="+'${person.personcompanyid}'+"&shopCode="+shopCode+"&beginDate="+beginDate+"&endDate="+endDate+"&departmentNames="+departmentNames+"&statisticsName="+statisticsName+'&isShow='+isShow;
			}
			var topRows = top.document.getElementById("total").rows;
			var topCols = top.document.getElementById("btmframe").cols;		
			if(is_iPad()){
				showPopWin(DataURL,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
			}else{
				openWindowForReport(DataURL); 
			}		
			document.getElementById('popupTitle').innerHTML="【挂号台收费汇总表】";
		}else{
			var DataURL = "report.action?reportlet=sales_optometryTypeDetailsRpt.cpt&logincompanyid="+'${person.personcompanyid}'+"&shopCode="+shopCode+"&beginDate="+beginDate+"&endDate="+endDate+"&memberID="+memberID+"&name="+name+"&Casher="+Casher+"&RegisteredName="+RegisteredName+"&departmentNames="+departmentNames+"&statisticsName="+statisticsName+'&isShow='+isShow+'&regname='+regname;
			var topRows = top.document.getElementById("total").rows;
			var topCols = top.document.getElementById("btmframe").cols;		
			if(is_iPad()){
				showPopWin(DataURL,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
			}else{
				openWindowForReport(DataURL); 
			}		
			document.getElementById('popupTitle').innerHTML="【挂号台收费明细表】";
		}
	}
	function clean(){
		goodsForm.reset();
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
		
		document.getElementById('startTime').value = now;
		document.getElementById('endTime').value = now;		
	}

	function clearFortype(obj){
		if($(obj).val() == '1'){
			$("tr[id=tr1]").hide();
			$("tr[id=tr2]").hide();
			$("tr[id=tr3]").show();
		}else{
			$("tr[id=tr1]").show();
			$("tr[id=tr2]").show();
			$("tr[id=tr3]").hide();
		}
		
		document.getElementById('memberid').value = "";
		document.getElementById('customername').value = "";
		document.getElementById('cashierid').value = "";
		document.getElementById('registername').value = "";
	}

	/**
	 * 部门开窗
	 */
	function openDepartment(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("selDepartmentOpen.action?departmentType=1&isclosed=0&companyid="+$("#companysid").val(),970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("selDepartmentOpen.action?departmentType=1&isclosed=0&companyid="+$("#companysid").val(),screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		
		document.getElementById('popupTitle').innerHTML="【部门查询】";
	}
	
	/**
	 * 开窗赋值实现方法
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
	/**
	 * 获取select标签Text
	 */
	function getSelectText(selectId, setEqualsNullValue){
		if(!selectId) {
			alert("未找到select标签");
		} else {
			var selectObj = document.getElementById(selectId);
			var userSelectedIndex = selectObj.selectedIndex;
			var selectText = selectObj.options[userSelectedIndex].text
			if(!setEqualsNullValue) {
				if(selectText == "----请选择----") {
					selectText = "";
				}
			} else {
				if(selectText == setEqualsNullValue){
					selectText == "";
				}
			}
			var endIndex = selectText.indexOf("￥");
			if(endIndex > 0) {
				selectText = selectText.substring(0, endIndex-1);
			}
			return selectText;
		}
	}
	
	function loadDepartmentids(cid) {  
		if(cid == ''){
			$("#departmentID").val('');
	   		$("#bdpdepartmentname").val('');
	   		$("#ds").val('');
	   		$("#dids").val('');
			$("#dnames").val('');
		}else{
			$.ajax({           
		   	 	type: "POST",          
	   	   	    url: "getAjaxDepartmentForCompanyID.action",          
	   	   	    async: true, 
	   	   	    data: "companysid="+cid+"&type=1",     
	   	   	    success: function(msg){
	   	   	    	var item = msg.split("/");
	                <c:if test="${person.departmenttype!=1}">
	                	$("#departmentID").val(item[0]);
	   	   	    		$("#bdpdepartmentname").val(item[1]);
	   	   	    		$("#ds").val(item[1]);
					$("#dids").val(item[0]);
					$("#dnames").val(item[1]);
					</c:if>  
	   	   	    }
			});
		}
    }
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="goodsForm" method="post" action="">
<input type="hidden" name="moduleID" value="${requestScope.moduleID}">
<input type="hidden" id="dids" name="dids" value="">
<input type="hidden" id="dnames" name="dnames" value="">

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
          <TR>
            <TD class=menubar_title width="15%"><img border='0' src='${ctx }/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>日常业务类报表</TD>
            
            <TD width="45%"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：挂号台收费统计表</TD>
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
						   <TD width="10%" height="26" class="table_body">所属公司</TD>
			               <TD height="26" class="table_none" colspan="5">
			                <c:if test="${person.personcompanytype eq '2'}">
			                	${person.personcompanyname }
	                        	<input type="hidden" id="companysid" name="companysid" value="${person.personcompanyid }">
	                        </c:if>
	                        
	                        <c:if test="${person.personcompanytype ne '2'}">
	                        	<c:if test="${person.departmenttype!=1}">
							   		<select clean="clean" id="companysid" name="companysid" onchange="loadDepartmentids(this.options[this.options.selectedIndex].value)" >
		                              <option value="">----请选择----</option>
		                              <s:iterator value="companyNamePos">
		                              <option value="${fcnId}" ctype="${fcnmasterorvice }" ${companysid == fcnId ? 'selected="selected"':''}>${fcnName}</option>
		                              </s:iterator>
		                            </select>
								</c:if>  
							    <c:if test="${person.departmenttype==1}">
		                            ${person.personcompanyname }
		                        	<input type="hidden" id="companysid" name="companysid" value="${person.personcompanyid }">
	                        	</c:if>
	                        </c:if>
                           </TD>
                        </TR>
					  	<TR>
			               <TD width="8%" height="26" class="table_body">销售门店</TD>
			               <TD class="table_none" width="30%">
			               <c:if test="${person.departmenttype != 1}">
				               <li class="horizontal_onlyRight">
							   		<input class="text_input300" id="bdpdepartmentname" name="bdpdepartmentname" type="hidden" />
							   		<textarea class="text_input200" id="ds"  name="ds" style='height:50px;width: 240px' readonly="readonly" value=""></textarea>							   		
							   		<input class="text_input100" type="hidden" id="departmentID" name="departmentID" value=""/>
							   </li>
							   <li class="horizontal_onlyRight">						  		
							  		<img src="${ctx }/img/newbtn/btn_change_0.png" btn=btn title="选择" onclick="openDepartment();">
							   </li>
      	                   </c:if>
      	                   <c:if test="${person.departmenttype==1}">
                            ${person.bdpdepartmentname}<input type="hidden" id="departmentID" value="${person.departmentID}" name="departmentID"/>
                            <input type="hidden" id="ds" value="${person.bdpdepartmentname}"/>
      	                   </c:if>
			               </TD>
			               <TD width="8%" height="26" class="table_body">日期</TD>
			               <TD class="table_none"  width="30%">
                               <jsp:include page="/commons/report_date.jsp" flush="true">
                                    <jsp:param name="fromDate" value="startTime"/> 
                                    <jsp:param name="toDate" value="endTime"/>                               
                               </jsp:include>
			               </TD>
			               <TD width="8%" height="26" class="table_body">统计类型</TD>
			               <TD class="table_none" width="23%">
	                            <select id="whichtype" name="whichtype" onchange="clearFortype(this);">
	      		                 	<option value="">----请选择----</option>
	      		                 	<option value="1">汇总</option>
	      		                 	<option value="2">明细</option>
	      	                   </select>
			               </TD>
                        </TR>
                        <TR id="tr1" style="display: none;">
						   <TD height="26" class="table_body">会员卡号</TD>
			               <TD class="table_none">
                            <input class="text_input120" type="text" id="memberid" name="memberid">
			               </TD>
			               <TD height="26" class="table_body">顾客姓名</TD>
			               <TD class="table_none">
                            <input class="text_input120" type="text" id="customername" name="customername">
			               </TD>
			               <TD height="26" class="table_body">收银员(工号)</TD>
			               <TD class="table_none">
                            <input class="text_input120" type="text" id="cashierid" name="cashierid">
			               </TD>
                        </TR>
                        <TR id="tr2" style="display: none;">
			               <TD height="26" class="table_body">挂号费名称</TD>
			               <TD class="table_none" colspan="5">
                           	<select id="registername" name="registername">
                        			<option value="" money="">---请选择---</option>
                              	<c:forEach var="po" items="${registeredPayments}">
                              		<option value="${po.frcid }" money="${po.frcmoney }" >${po.frcregisteredname }(￥${po.frcmoney })</option>                      
                                </c:forEach>
                             </select>
			               </TD>
                        </TR>
                        <TR id="tr3" style="display: none;">
			               <TD height="26" class="table_body">查看类型</TD>
			               <TD class="table_none" colspan="5">
                               <input type="radio" id="person" name="queryType" value="0" checked="checked"/> 按人员 &nbsp;&nbsp;
                               <input type="radio" id="depid" name="queryType" value="1" /> 按部门 &nbsp;&nbsp;
			               </TD>
                        </TR>
                        <TR>
			               <TD height="26" class="table_body">是否显示查询条件</TD>
			               <TD class="table_none" colspan="5">
                               <input type="radio" id="isShow" name="isShow" value="0" ${systemParameterPo.fspshowrptcondition eq 0 ? "checked" : "" }/>是
                               <input type="radio" id="isShow" name="isShow" value="1" ${systemParameterPo.fspshowrptcondition eq 1 ? "checked" : "" }/>否
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000;
	font-weight: bold;
}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工工资维护</title>
</head>
<script>	
$(document).ready(function() {
		document.getElementById("personid").focus();
		sumsalary();
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});
	});

	function sumsalary(){
		var msljibengongziSalary=formatToInt(document.getElementById('msljibengongzi').value);
		var mslgangweijintieSalary=formatToInt(document.getElementById('mslgangweijintie').value);
		var mslgonglingjintieSalary=formatToInt(document.getElementById('mslgonglingjintie').value);
		//var mslbaoxianSalary=formatToInt(document.getElementById('mslbaoxian').value);
		//var mslgongjijinSalary=formatToInt(document.getElementById('mslgongjijin').value);
		var mslwucanfeiSalary=formatToInt(document.getElementById('mslwucanfei').value);
		var mslxilifeiSalary=formatToInt(document.getElementById('mslxilifei').value);
		var msljiabanfeiSalary=formatToInt(document.getElementById('msljiabanfei').value);
		var mslnianzhongjiangSalary=formatToInt(document.getElementById('mslnianzhongjiang').value);
		var mslfuliSalary=formatToInt(document.getElementById('mslfuli').value);
		var msljiangjinSalary=formatToInt(document.getElementById('msljiangjin').value);
		
		var mslsumsalarySalary=0;
		mslsumsalarySalary=msljibengongziSalary+mslgangweijintieSalary+mslgonglingjintieSalary+mslwucanfeiSalary
		+mslxilifeiSalary+msljiabanfeiSalary+mslnianzhongjiangSalary+mslfuliSalary+msljiangjinSalary;
		mslsumsalarySalary=mslsumsalarySalary.toFixed(2); 
		document.getElementById('mslsumsalary').value=mslsumsalarySalary;
	}

	function formatToInt(obj){
		if(obj!=''){
			return parseFloat(obj);
		}else{
			return 0;
		}
	}

	/**
	 * 人员开窗
	 */
	function openPersonInfo(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("selPersonOpen.action?isOpen=1&moduleID=${requestScope.moduleID}",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("selPersonOpen.action?isOpen=1&moduleID=${requestScope.moduleID}",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【人员开窗】";
	}

	/**
	 * 部门开窗赋值实现方法
	 */
	function openPersonValues(objValue){
		var arrayID = new Array();
		var arrayName = new Array();
		var departmentname = new Array();
		var persons = eval('(' + objValue + ')');
		for(var i = 0; i < persons.length; i++){	
			arrayID[i] = persons[i].personid;
			arrayName[i] = persons[i].personname;
			departmentname[i] = persons[i].departmentname;
			
		}
		
		document.getElementById('personid').value = arrayID.join(",");
		document.getElementById('personname').value = arrayName.join(",");
		document.getElementById('departmentname').value = departmentname.join(",");
		salaryForm.action="initSalaryInsert.action?pid="+document.getElementById("personid").value.trim();
		salaryForm.submit();
	}
		
	function selectPerson()
	{
		if(document.getElementById("personid").value.trim() != '')
		if(event.keyCode == 13)
		{
			salaryForm.action="initSalaryInsert.action?pid="+document.getElementById("personid").value.trim();
			salaryForm.submit();
		}
		
	}
	function save(){
		if(checkForm(salaryForm))
		{
			
			document.all.submitButton.disabled="true";
			salaryForm.action = "insertSalaryPo.action";
			salaryForm.submit();
		}
	}
</script>
<body onkeydown="KeyDown()"    onhelp="Showhelp();return false;">
<form name="salaryForm" method="post" action="">
<input type="hidden" name="type" id="type" value="" /> 
<input type="hidden" value="2" name="dengji" id="dengji" />
<input type="hidden" name="moduleID" value="">

<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD class=menubar_title width="15%"><img border='0' src='${ctx }/img/pic/module.gif' align='absmiddle' hspace='3' vspace='3'>员工薪酬管理</TD>
          
          <TD width="45%"><%@ include file="/commons/helpMovie.jsp" %>目前操作功能：员工工资新增</TD>
          <TD align=right>&nbsp;</TD>
          </TR>
        <TR>         
<TD class=menubar_function_text colspan="3">
            	<table></table>
            </TD>
          </TR></TBODY></TABLE><!-- ?? End --><!-- ?? Start -->
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
                                  <TD width="5%"><div align="left"><img src="${ctx }/img/pic/DetailInfo.gif" width="86" height="20" ></div></TD>
                                  <TD width="95%" background="${ctx }/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                    <table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                        <TR>
						   <TD width="10%" height="30" class="table_body">ID号</TD>
			               <TD width="23%" class="table_none">
			                <li class="horizontal_onlyRight">
			               		<input class="text_input100" id="personid" name="salaryPo.mslpersonid" value="${salaryPo.mslpersonid }" onkeyup="selectPerson()" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : 'ID号不能为空!'}]">
			                </li>
						   	<li class="horizontal_onlyRight">
						  		<img src="${ctx }/img/newbtn/btn_change_0.png" btn=btn id=ctl00_PageBody_Button1 title="选 择" onClick="openPersonInfo();">
						   	</li>
			               </TD>
							<TD width="10%" height="30" class="table_body">姓名</TD>
                          	<TD width="23%" class="table_none"><input class="text_input100" id="personname" name="salaryPo.personname" value="${salaryPo.personname }" readonly="readonly" >
                            </TD>
						  	<TD width="10%" height="30" class="table_body">部门名称</TD>
                         	<TD width="24%" class="table_none"><input class="text_input100" id="departmentname" name="salaryPo.departmentname" value="${salaryPo.departmentname }" readonly="readonly"></TD>
                        </TR>
                        <TR>	
						   <TD class="table_body" width="9%">年度</TD>
						   <TD height="30" align="left" class="table_none" width="24%">
						   	<input id="mslyear" name="salaryPo.mslyear"  type="text" class="text_input100"  onFocus="WdatePicker({readOnly:true, dateFmt:'yyyy年'})" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '工资年份不能为空！'}]" value="" /></TD>
      	                   <TD class="table_body" width="9%">月份</TD>
						   <TD height="30" align="left" class="table_none" width="24%">
						   	<input id="mslmonth" name="salaryPo.mslmonth"  type="text" class="text_input100"  onFocus="WdatePicker({readOnly:true, dateFmt:'MM月'})" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '工资月份不能为空！'}]" value="" /></TD>
      	                   <TD class="table_body">&nbsp;</TD>
						   <TD height="30" align="left" class="table_none">&nbsp;</TD>
      	                </TR>
                       </TBODY>
                    </TABLE>
                 	<TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
	                   	<tr>
	                   		<td align="left"> 基本工资信息(模版提取)</td>
	                   	</tr>
                    </TABLE>                 
                    <table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>                        
						<TR>
							<TD width="10%" height="30" class="table_body">基本工资</TD>
				            <TD width="23%" class="table_none"><input class="text_input100" id="msljibengongzi" name="salaryPo.msljibengongzi" maxlength="7" value="${salaryPo.msljibengongzi }" readonly="readonly"> ${salaryPo.mslxueliname}</TD>
							<TD width="10%" height="30" class="table_body">岗位津贴</TD>
	                        <TD width="24%" class="table_none"><input class="text_input100" id="mslgangweijintie" name="salaryPo.mslgangweijintie" maxlength="7" value="${ salaryPo.mslgangweijintie}" readonly="readonly"> ${salaryPo.mslzhichengname}</TD>                         
							<TD width="10%" height="30" class="table_body">工龄工资</TD>
	                        <TD width="23%" class="table_none"><input class="text_input100" id="mslgonglingjintie"" name="salaryPo.mslgonglingjintie" maxlength="7" value="${salaryPo.mslgonglingjintie }" readonly="readonly"> ${salaryPo.mslgonglingname}年</TD> 
                        </TR>
						<TR>
							<TD width="10%" height="30" class="table_body">保险</TD>
				            <TD width="23%" class="table_none"><input class="text_input100" id="mslbaoxian"" name="salaryPo.mslbaoxian" maxlength="7" value="${salaryPo.mslbaoxian }" validate="[{'Type' : Type.String, 'Formula' : Formula.FloatORNULL, 'Message' : '只能是整数或小数！'}]"></TD>
							<TD width="10%" height="30" class="table_body">公积金</TD>
	                        <TD width="24%" class="table_none"><input class="text_input100" id="mslgongjijin" name="salaryPo.mslgongjijin" maxlength="7" value="${ salaryPo.mslgongjijin}" validate="[{'Type' : Type.String, 'Formula' : Formula.FloatORNULL, 'Message' : '只能是整数或小数！'}]"></TD>                         
							<TD width="10%" height="30" class="table_body">误餐费</TD>
	                        <TD width="23%" class="table_none"><input onBlur="sumsalary()" class="text_input100" id="mslwucanfei"" name="salaryPo.mslwucanfei" maxlength="7" value="${salaryPo.mslwucanfei }" validate="[{'Type' : Type.String, 'Formula' : Formula.FloatORNULL, 'Message' : '只能是整数或小数！'}]"></TD> 
                        </TR> 
						<TR>
							<TD width="10%" height="30" class="table_body">洗理费</TD>
				            <TD width="23%" class="table_none"><input onBlur="sumsalary()" class="text_input100" id="mslxilifei"" name="salaryPo.mslxilifei" maxlength="7" value="${salaryPo.mslxilifei }" validate="[{'Type' : Type.String, 'Formula' : Formula.FloatORNULL, 'Message' : '只能是整数或小数！'}]"></TD>
							<TD width="10%" height="30" class="table_body">&nbsp;</TD>
	                        <TD width="24%" class="table_none">&nbsp;</TD>                         
							<TD width="10%" height="30" class="table_body">&nbsp;</TD>
	                        <TD width="23%" class="table_none">&nbsp;</TD> 
                        </TR>                                               
                      </TBODY>
                    </TABLE>  
					<TABLE id=ctl00_PageBody_PostButton cellSpacing=1
						cellPadding=3 width="100%" align=center border=0>
						<tr>
							<td align="left">
								基本工资信息(非模版)
							</td>
						</tr>
					</TABLE>
					<table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>                        
						<TR>
							<TD width="10%" height="30" class="table_body">加班费</TD>
				            <TD width="23%" class="table_none"><input onBlur="sumsalary()" class="text_input100" id="msljiabanfei" name="salaryPo.msljiabanfei" maxlength="7" validate="[{'Type' : Type.String, 'Formula' : Formula.FloatORNULL, 'Message' : '只能是整数或小数！'}]" ></TD>
							<TD width="10%" height="30" class="table_body">年终奖</TD>
	                        <TD width="24%" class="table_none"><input onBlur="sumsalary()" class="text_input100" id="mslnianzhongjiang" name="salaryPo.mslnianzhongjiang" maxlength="7" validate="[{'Type' : Type.String, 'Formula' : Formula.FloatORNULL, 'Message' : '只能是整数或小数！'}]" ></TD>                         
							<TD width="10%" height="30" class="table_body">福利</TD>
	                        <TD width="23%" class="table_none"><input onBlur="sumsalary()" class="text_input100" id="mslfuli" name="salaryPo.mslfuli" maxlength="7" validate="[{'Type' : Type.String, 'Formula' : Formula.FloatORNULL, 'Message' : '只能是整数或小数！'}]" ></TD> 
                        </TR>
						<TR>
							<TD width="10%" height="30" class="table_body">奖金</TD>
				            <TD width="23%" class="table_none"><input onBlur="sumsalary()" class="text_input100" id="msljiangjin" name="salaryPo.msljiangjin" maxlength="7" validate="[{'Type' : Type.String, 'Formula' : Formula.FloatORNULL, 'Message' : '只能是整数或小数！'}]" ></TD>
							<TD width="10%" height="30" class="table_body">工资合计</TD>
	                        <TD width="24%" class="table_none"  colspan="3"><input class="text_input100" id="mslsumsalary" name="salaryPo.mslsumsalary" maxlength="7" readonly="readonly" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '工资合计不能为空！'},{'Type' : Type.String, 'Formula' : Formula.FloatORNULL, 'Message' : '只能是整数或小数！'}]" ></TD>                         
                        </TR> 
						<TR>
							<TD width="10%" height="30" class="table_body">备注</TD>
				            <TD class="table_none" colspan="5">
								<textarea  id="mslremark" name="salaryPo.mslremark" validate="[{'Type' : Type.String, 'Formula' : '', 'Expansion' : {Type : Expansion.LessThanLengthORNULL, Params : [101]}, 'Message' : '备注不能大于100字！'}]" style="width:100%" cols="80" rows="7"></textarea>
							</TD> 
                        </TR>                                               
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
                        <TR>
                          <TD><img src="${ctx}/img/newbtn/btn_save_0.png" btn=btn id="submitButton" title='保存' onClick="save()">	
						  </TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                  </DIV>
                </DIV>
                  <!--?End--></TD>
                <TD width=1 background=${ctx }/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx }/img/pic/tab_bg.gif" 
width=1></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=${ctx }/img/pic/tab_bg.gif bgColor=#ffffff><IMG height=1 
            src="${ctx }/img/pic/tab_bg.gif" width=1></TD></TR></TBODY></TABLE><!--?? End--></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV></BODY></html>
<%@ include file="/WEB-INF/inc/message.jsp" %>


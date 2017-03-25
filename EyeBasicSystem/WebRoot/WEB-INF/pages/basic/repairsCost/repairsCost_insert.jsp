<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>基础信息维护</title>
<script type="text/javascript">
     
	function save(){
	   if (checkForm(noticeTypeFrm)){
		   $("img").removeAttr("onclick");
		   noticeTypeFrm.action = "repairsCostSetInsert.action";
		   noticeTypeFrm.submit();
	   }
	}

	function trim(str){ //删除左右两端的空格
　　         return str.replace(/(^\s*)|(\s*$)/g, "");
　　 }
	
	$(document).ready(function() { 
	    $("img[btn=btn]").attr("style","cursor: hand;"); 
	    $("img[btn=btn]").mouseover(function () { 
	    $(this).attr("src",$(this).attr("src").replace("0","1")); 
	    }).mouseout(function () { 
	      $(this).attr("src",$(this).attr("src").replace("1","0")); 
	    }); 

	    $('#frcid').focus();
    }); 

    function frmreset(){
        $('#frcid').val('');
        $('#frcname').val('');
        $('#frcinmoney').val('');
        $('#frcoutmoney').val('');
    }
     
</script>
	</head>
	<BODY bgColor=#ffffff topMargin=5 ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
	<form action="" method="post" id="noticeTypeFrm" name="noticeTypeFrm">
<input type="hidden" name="moduleID" value="${requestScope.moduleID}">
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <tr height="20"><td></td></tr>
        <TR>
          <TD style="PADDING-LEFT: 2px; HEIGHT: 1px" 
          background=${ctx}/img/pic/tab_bg.gif></TD></TR>
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
							<table width="100%" id="title0"  border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                              <TBODY>
                                <TR>
                                  <TD width="5%"><div align="left"><img src="${ctx}/img/pic/DetailInfo.gif" width="86" height="20" ></div></TD>
                                  <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                                </TR>
                              </TBODY>
                            </TABLE>
							<table width="100%"  border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder" id="title1">
                      <TBODY>
                        <TR height="26px">
                          <TD width="9%" class="table_body">维修项编号</TD>
                          <TD width="24%" class="table_none">                              <input class="text_input160" id="frcid" name="repairsCostPo.frcid" type="text" maxlength="20" value="${repairsCostPo.frcid }" 
                              validate="[{'Type' : Type.String, 'Formula' : Formula.Word, 'Message' : '请填写维修项编号!'}]" ><label style="color:red;">&nbsp;*</label>
                         
                          </TD>
                          <TD width="9%" class="table_body">维修项名称</TD>
                          <TD width="24%" class="table_none">
                             <input clean="clean" class="text_input160" id="frcname" name="repairsCostPo.frcname" type="text" maxlength="50" value="${repairsCostPo.frcname }" 
                             validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '请填写维修项名称!'}]"><label style="color:red;">&nbsp;*</label>
                          </TD>                         
                        </TR>
                        <TR height="26px">
                          <TD width="9%" class="table_body">内部价格</TD>
                          <TD width="24%" class="table_none">
                             <input clean="clean" class="text_input160" id="frcinmoney" name="repairsCostPo.frcinmoney" type="text" maxlength="50" value="${repairsCostPo.frcinmoney }" 
                             validate="[{'Type' : Type.String, 'Formula' : Formula.UFloat, 'Message' : '请填写内部价格!'}]" onblur="if(!isNaN(this.value)) { if(trim(this.value)!='')this.value = new Number(this.value).toFixed(2);}"><label style="color:red;">&nbsp;*</label>
                          </TD>
                          <TD width="9%" class="table_body">外部价格</TD>
                          <TD width="24%" class="table_none">
                             <input clean="clean" class="text_input160" id="frcoutmoney" name="repairsCostPo.frcoutmoney" type="text" maxlength="50" value="${repairsCostPo.frcoutmoney}" 
                             validate="[{'Type' : Type.String, 'Formula' : Formula.UFloat, 'Message' : '请填写外部价格!'}]" onblur="if(!isNaN(this.value)) { if(trim(this.value)!='')this.value = new Number(this.value).toFixed(2);}"><label style="color:red;">&nbsp;*</label>
                          </TD>                         
                        </TR>
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
					   <TR>
						  <TD align="left">	
						    <img btn=btn src="${ctx}/img/newbtn/btn_save_0.png" title='保存' onclick="save()">
						    <img btn=btn src="${ctx}/img/newbtn/btn_empty_0.png" title='清空' onclick="frmreset()">
						  </TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                  </DIV>
                </DIV>
                  <!--ݿEnd--></TD>
                <TD width=1 background=${ctx}/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx}/img/pic/tab_bg.gif" 
width=1></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD background=${ctx}/img/pic/tab_bg.gif bgColor=#ffffff><IMG height=1 
            src="${ctx}/img/pic/tab_bg.gif" width=1></TD></TR></TBODY></TABLE><!--ѡ End--></TD></TR>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE></DIV></form></BODY>
</html>
<%@ include file="/WEB-INF/inc/message.jsp" %>
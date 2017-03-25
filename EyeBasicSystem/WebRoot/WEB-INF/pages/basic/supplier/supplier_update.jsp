<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>制造商维护</title>
</head>
<script>
	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});

		var showMonth = "${supplierPo.bspsettlement }";
		if(showMonth != "jxfs2") {
	    	$("input[month=month]").hide();
	    	$("span[month=month]").hide();
		}
	});

	function showMonth() {
		if($("select[id=bspsettlement]").val() == "jxfs2") {
			$("span[month=month]").show();
			$("input[month=month]").show();
		} else {
			$("span[month=month]").hide();
			$("input[month=month]").hide();
			$("input[month=month]").val("");
		}
	}

	function save(){
		if(checkForm(document.all.supplierForm)){ 
			var goodsCategoryID=document.getElementsByName("goodsCategoryID");
	    	var check=0; 
        	for(var i=0;i <goodsCategoryID.length;i++){ 
         		if(goodsCategoryID[i].checked){ 
          			check=1; 
         		} 
        	} 
       		if(check == 0){ 
          		alert("请选择类别!"); 
       			return false; 
       		}

			var bbdsettlementmonth = $("#bspsettlementmonth").val();

			if($("#bspsettlement").val() == '2') {
				if(bbdsettlementmonth != "" && isNaN(bbdsettlementmonth) || bbdsettlementmonth.indexOf("\.") >= 0 || bbdsettlementmonth<= 0) {
					alert("月数只能输入正整数!");
					$("#bspsettlementmonth").select();
					return;
				}
			}
			
			if($("input[id=goodsCategoryID][value=4]").attr("checked")){
				if(!$("input[id=bspylicenceid]").val()){
					alert("请填写医疗器械经营许可证号!");
					$("input[id=bspylicenceid]").focus();
					return;
				}
				
				if(!$("input[id=bspylicencevalidity]").val()){
					alert("请填写医疗器械经营许可证效期!");
					$("input[id=bspylicencevalidity]").focus();
					return;
				}
			}
			
			if($("input[id=goodsCategoryID][value=1]").attr("checked") || $("input[id=goodsCategoryID][value=6]").attr("checked") || $("input[id=goodsCategoryID][value=8]").attr("checked") || $("input[id=goodsCategoryID][value=3]").attr("checked")){
				if(!$("input[id=bspglicenceid]").val()){
					alert("请填写全国工业品生产许可证号!");
					$("input[id=bspglicenceid]").focus();
					return;
				}
				
				if(!$("input[id=bspglicencevalidity]").val()){
					alert("请填写全国工业品生产许可证有效期!");
					$("input[id=bspglicencevalidity]").focus();
					return;
				}
			}
       		
        	$("img").removeAttr("onclick");
			supplierForm.action = "updateSupplier.action";
			supplierForm.submit();
		}
	}
	
	function mentSupplierPerson(){
		if('${supplierPo.bspsupplierpersonid }'){ 
			window.location.href='initPersonInfoUpdateSupplier.action?moduleID=B0105&hid=${supplierPo.bspid}&flag=0';
		}else{
			window.location.href='initPersonInfoInsertSupplier.action?moduleID=B0105&hid=${supplierPo.bspid}&flag=0';
		}
	}

</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="supplierForm" method="post" action="">
<input type="hidden" name="type" id="type" value="" /> 
<input type="hidden" name="moduleID" value="${requestScope.moduleID}" />
<input type="hidden" name="goodsTree" id="goodsTree" value="${goodsTree }" /> 
<input type="hidden" name="parent" id="parent" value="${parent }" /> 
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD style="PADDING-LEFT: 2px; HEIGHT: 22px" 
          background=${ctx}/img/pic/tab_top_bg.gif>
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR><!--?Start-->
                <TD>
                  <TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD width=3><IMG id=tabImgLeft__0 height=22 
                        src="${ctx}/img/pic/tab_active_left.gif" width=3></TD>
                      <TD class=tab id=tabLabel__0 
                      background=${ctx}/img/pic/tab_active_bg.gif 
                      UNSELECTABLE="on">制造商修改</TD>
                      <TD width=3><IMG id=tabImgRight__0 height=22 
                        src="${ctx}/img/pic/tab_active_right.gif" 
                    width=3></TD></TR></TBODY></TABLE></TD>
                    
                    <TD>
                  <TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD width=3><IMG id=tabImgLeft__0 height=22 
                        src="${ctx}/img/pic/tab_unactive_left.gif" width=3></TD>
                      <TD class=tab id=tabLabel__0 
                      background=${ctx}/img/pic/tab_unactive_bg.gif
                      onClick="mentSupplierPerson();" 
                      UNSELECTABLE="on">制造商维护人</TD>
                      <TD width=3><IMG id=tabImgRight__0 height=22 
                        src="${ctx}/img/pic/tab_unactive_right.gif" 
                    width=3></TD></TR></TBODY></TABLE>
                    </TD>
                    
					</TR></TBODY></TABLE></TD>
					</TR></TBODY></TABLE></TD>
					
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
                        <TR>
						   <TD width="9%" height="26" class="table_body">制造商代码</TD>
			               <TD width="19%" class="table_none">${supplierPo.bspid}
                            <input type="hidden" id="bspid" name="supplierPo.bspid" value="${supplierPo.bspid}">
			               </TD>
			               <TD width="9%" height="26" class="table_body">制造商简称</TD>
			               <TD width="22%" class="table_none">
                             <input class="text_input160" type="text" id="bspsuppliername" name="supplierPo.bspsuppliername" value="${supplierPo.bspsuppliername}" maxlength="30" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '制造商简称不能为空！'},{'Type' : Type.String, 'Formula' : Formula.ObjectNameOrNULL, 'Message' : '制造商简称填写有误！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [31]}, 'Message' : '制造商简称不能大于30字符'}]" onblur="$(this).val($.trim($(this).val()));" ><label style="color:red;">&nbsp;*&nbsp;</label>
			               </TD>
			               <TD width="9%" height="26" class="table_body">制造商联系人</TD>
			               <TD width="19%" class="table_none">
                             <input class="text_input100" type="text" id="bspcontactperson" name="supplierPo.bspcontactperson" value="${supplierPo.bspcontactperson}" maxlength="16" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '制造商联系人不能为空！'},{'Type' : Type.String, 'Formula' : Formula.PersonNameOrNULL, 'Message' : '制造商联系人姓名填写有误！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [6]}, 'Message' : '制造商联系人不能大于5字符'}]" onblur="$(this).val($.trim($(this).val()));" ><label style="color:red;">&nbsp;*&nbsp;</label>
			               </TD>
                        </TR>
                        <TR>			               
			               <TD height="26" class="table_body">制造商全称</TD>
			               <TD class="table_none">
                             <input class="text_input200" maxlength="30" type="text" id="bspfroshort" name="supplierPo.bspfroshort" value="${supplierPo.bspfroshort }" onblur="$(this).val($.trim($(this).val()));"  
                             validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '制造商名称不能为空！'},{'Type' : Type.String, 'Formula' : Formula.ObjectNameOrNULL, 'Message' : '制造商名称填写有误！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [31]}, 'Message' : '制造商名称不能大于30字符'}]"><label style="color:red;">&nbsp;*&nbsp;</label>
			               </TD>
						   <TD height="26" class="table_body">制造商电话</TD>
			               <TD class="table_none">
                             <input class="text_input100" type="text" id="bspcontactphone" name="supplierPo.bspcontactphone" value="${supplierPo.bspcontactphone}" maxlength="18"  validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '制造商电话不能为空！'},{'Type' : Type.String, 'Formula' : Formula.Phone, 'Message' : '制造商电话填写有误！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [21]}, 'Message' : '制造商电话不能大于20字符'}]"><label style="color:red;">&nbsp;*&nbsp;如：022-85123455</label>
			               </TD>
			               <TD height="26" class="table_body">联系人电话</TD>
			               <TD class="table_none">
                             <input class="text_input100" type="text" id="bsplinkmanphonel" name="supplierPo.bsplinkmanphonel" value="${supplierPo.bsplinkmanphonel}" maxlength="18" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '联系人电话不能为空！'},{'Type' : Type.String, 'Formula' : Formula.Phone, 'Message' : '联系人电话填写有误！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [21]}, 'Message' : '联系人电话不能大于20字符'}]"><label style="color:red;">&nbsp;*&nbsp;如：022-85123455</label>
			               </TD>
                        </TR>
                        <TR>
						   <TD height="26" class="table_body">商品类别</TD>
			               <TD  class="table_none" colspan="3">
                             <c:forEach items="${goodsCategoryList}" var="goodsCategoryList" varStatus="linerole">
                             <input type=checkbox id="goodsCategoryID" name='goodsCategoryID' value='${goodsCategoryList.bgcid}' ${goodsCategoryList.flag=='1'? 'checked="checked"' : ''}>${goodsCategoryList.bgcgoodscategoryname}
                             </c:forEach><label style="color:red;">*&nbsp;</label>
			               </TD>
			               <TD height="26" class="table_body">制造商传真</TD>
			               <TD class="table_none">
                             <input class="text_input100" type="text" id="bspfax" name="supplierPo.bspfax" value="${supplierPo.bspfax}" maxlength="18" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '制造商传真不能为空！'},{'Type' : Type.String, 'Formula' : Formula.Phone, 'Message' : '制造商传真填写有误！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [21]}, 'Message' : '制造商传真不能大于20字符'}]"><label style="color:red;">&nbsp;*&nbsp;如：022-85123455</label>
			               </TD>
                        </TR>
                        <TR>
			               <TD height="26" class="table_body">制造商地址</TD>
			               <TD class="table_none" colspan="5">
                             <input class="text_input200" type="text" id="bspaddress" name="supplierPo.bspaddress" value="${supplierPo.bspaddress}" maxlength="50" style="width: 500" validate="[{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [51]}, 'Message' : '制造商地址不能大于50字符'}]">
			               </TD>
                        </TR>
                        <TR>
                           <TD height="26" class="table_body">采购结算方式</TD>
			               <TD class="table_none">
						     <li class="horizontal_onlyRight">
                            <select id="bspsettlement" name="supplierPo.bspsettlement" onChange="showMonth()">
                                   <option value="" selected></option>
                                   <c:forEach var="optionParamPoTmp" items="${optionParamPolist}" >
		                              <c:if test="${optionParamPoTmp.fopparentid=='jxfs'}">
		                               <option value="${optionParamPoTmp.fopparamid }" ${(supplierPo.bspsettlement == optionParamPoTmp.fopparamid)? 'selected=selected' :'' }>${optionParamPoTmp.fopparamname}</option>
		                              </c:if>	                                      	
	                               </c:forEach> 
                             </select></li>&nbsp;&nbsp;
      	                   <span month="month">
      	                     <input clean=clean type="text" class="text_input80" name="supplierPo.bspsettlementmonth" id="bspsettlementmonth" month="month" maxlength="4" value="${supplierPo.bspsettlementmonth }" />
      	                     &nbsp;&nbsp;天
						   </span>
						   
						     <input type="checkbox" value="updateBrand" id="updateBrand" name="updateBrand"/>
						     <span>更新制造商下所有品种</span>
      	                   </TD>
      	                   <TD height="26" class="table_body">开票状态</TD>
			               <TD class="table_none" colspan="3">
	                            <select clean=clean id="bspmakeinvoiceflag" name="supplierPo.bspmakeinvoiceflag">
	      		                 <option value="">----请选择----</option>
	                             <option ${supplierPo.bspmakeinvoiceflag eq '1' ? 'selected="selected"' : '' } value="1">开票</option>
	                             <option ${supplierPo.bspmakeinvoiceflag eq '0' ? 'selected="selected"' : '' } value="0">不开票</option>
	      	                   </select>
			               </TD>
                        </TR>
                        
                        <TR>
			               <TD height="26" class="table_body">三证号</TD>
			               <TD class="table_none">
                             <input clean=clean class="text_input160" maxlength="20" type="text" id="bsplicenceid" name="supplierPo.bsplicenceid" value="${supplierPo.bsplicenceid }"
                             validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '三证号不能为空！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [51]}, 'Message' : '三证号不能大于50字符'}]">
			               </TD>
			              <TD height="26" class="table_body">三证有效期</TD>
			               <TD class="table_none" colspan="3">
			               	 <input id="bsplicencevalidity"
					       name="supplierPo.bsplicencevalidity" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true})" 
					        value="${supplierPo.bsplicencevalidity}" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '三证有效期不能为空！'}]"/>
			               </TD>
                        </TR>
                        <TR>
			               <TD height="26" class="table_body">医疗器械经营许可证号</TD>
			               <TD class="table_none">
                             <input clean=clean class="text_input160" maxlength="20" type="text" id="bspylicenceid" name="supplierPo.bspylicenceid" value="${supplierPo.bspylicenceid }"
                             validate="[{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [51]}, 'Message' : '医疗器械经营许可证号不能大于50字符'}]">
			               </TD>
			              <TD height="26" class="table_body">医疗器械经营许可证有效期</TD>
			               <TD class="table_none" colspan="3">
			               	 <input id="bspylicencevalidity"
					       name="supplierPo.bspylicencevalidity" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true})" 
					        value="${supplierPo.bspylicencevalidity}"/>
			               </TD>
                        </TR>
                        <TR>
			               <TD height="26" class="table_body">全国工业品生产许可证号</TD>
			               <TD class="table_none">
                             <input clean=clean class="text_input160" maxlength="20" type="text" id="bspglicenceid" name="supplierPo.bspglicenceid" value="${supplierPo.bspglicenceid }"
                             validate="[{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [51]}, 'Message' : '全国工业品生产许可证号不能大于50字符'}]">
			               </TD>
			              <TD height="26" class="table_body">全国工业品生产许可证有效期</TD>
			               <TD class="table_none" colspan="3">
			               	 <input id="bspglicencevalidity"
					       name="supplierPo.bspglicencevalidity" 
					       type="text" class="text_input100" 
					       onfocus="WdatePicker({readOnly:true})" 
					        value="${supplierPo.bspglicencevalidity}"/>
			               </TD>
                        </TR>
                        
                        <TR>
			              <TD height="62" class="table_body">备注</TD>
			               <TD class="table_none" colspan="5">
                             <textarea id="textarea" name="supplierPo.bspremark">${supplierPo.bspremark}</textarea>
			               </TD>
                        </TR>
                        
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
                        <TR>
                          <TD><img src="${ctx}/img/newbtn/btn_save_0.png" btn=btn id="button1" title='保存' onClick="save()">
                        	  <!-- <img icon='icon-reload' type='reset' value='重置' >  -->
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
	
	
	





<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" src="${ctx }/js/zone.js"></script>
<script language="javascript" src="${ctx }/js/birthday.js"></script>
<title>会员管理</title>
</head>
<script>
	function defaulthide(){
		if('${customerInfoPo.smecisourcecard }' != ''){
			$("[id=phone]").hide();
			$("#nophone").attr("checked","checked");
			$("#customercard").show();
		}
	}

	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
	    	$(this).attr("src",$(this).attr("src").replace("0","1"));
		}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
		});
		if('${repeat}' == '1'){
			defaulthide();
		}
		changeAddressType('${systemParameterPo.fspaddresstype}');
	});

	function selCustomer(type,isnullfcustomerid){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initSelCustomerInfoWin.action?type="+type+"&customerjsp=1",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initSelCustomerInfoWin.action?type="+type+"&customerjsp=1",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【会员查询】";
	}

	function setCustomer(memberid,cname,cphone,cintegral,customerid){
		document.getElementById('smecisourcecard').value = memberid;
		document.getElementById('smeciphone').value = cphone;
	}

	function hidephone(obj){
		if($(obj).attr("checked")){
			$("[id=phone]").hide();
			$("[id=smeciphone]").val("");
			$("[id=smeciphone2]").val("");
			$("[id=smeciphone3]").val("");
			$("[id=customercard]").show();
			$("#smeciphone").attr("validate","");
			selCustomer('','');
		}else{
			$("[id=phone]").show();
			$("[id=customercard]").hide();
			$("[id=smecisourcecard]").val("");
			$("#smeciphone").attr("validate","[{'Type' : Type.String, 'Formula' : Formula.Phone, 'Message' : '电话格式不正确！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [16]}, 'Message' : '联系电话长度不能大于15个字符！'}]");
		}
	}

	function camera(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		var url='camera/camera.jsp?uid=<%=Math.round(Math.random() * 900) + 100 + ""%>&uploadtype=head';
		if(is_iPad()){
			showPopWin(url,450,250,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin(url,474,260,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【制作会员头像】";
	}

	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});

		var interests = '${customerInfoPo.smeciinterest}'.split(',');

		for(var i=0; i<interests.length; i++){
			$("input[id=interestpolists]").each(function (){
				if($(this).val() == interests[i].trim()){
					$(this).attr("checked","checked");
				}
			});
		}
	});

	function doSelect(item){	
		if(item.value=="tjyklaomo"){
			document.getElementById("tjyklaomo").style.display="block";
		}else{
			document.getElementById("tjyklaomo").style.display="none";
		}	
	}
	
	function save(){
		var memberID=document.getElementById("smecimemberid").value.trim();

		 var rad=$('input:radio[name="customerInfoPo.ctype"]:checked').val();
	        if(rad==0){
	        	if($('#smecimemberid').val()==""){
		        	alert("会员卡号不能为空!");
		        	$('#smecimemberid').focus();
		        	return;
	        	}
	        	if ('${systemParameterPo.fspcustomercardlen}' != '0' && (memberID.length != '${systemParameterPo.fspcustomercardlen}')){
	                alert("请重新输入会员卡号!");
	                $('#smecimemberid').focus();
	                return;
	            }
	        }
	    
		var days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 ,31];
		var days2 = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30 ,31];
		
		var year = parseFloat($('#birthYear').val());
		var month = parseFloat($('#birthMonth').val());
		
	    if(checkForm(document.all.customerInfoForm)){
	    	if (parseFloat($('#birthYear').val()) < 1900 || parseFloat($('#birthYear').val()) >3000){
	            alert("请输入正确的生日年份!");
	            $('#birthYear').focus();
	            $('#birthYear').val('')
	            return;
	        }
	        if (parseFloat($('#birthMonth').val()) > 12 || parseFloat($('#birthMonth').val()) < 1){
	            alert("请输入正确的生日月份!");
	            $('#birthMonth').focus();
	            $('#birthMonth').val('')
	            return;
	        }
	        if((year%4 == 0)&&((year%100 != 0)||(year%400 == 0))) { 
		        if (parseFloat($('#birthday').val()) > days2[month-1] || parseFloat($('#birthday').val()) < 1){
		            alert("请输入正确的生日日期!");
		            $('#birthday').focus();
		            $('#birthday').val('');
		            return;
		        }
	        }else{ 
		        if (parseFloat($('#birthday').val()) > days[month-1] || parseFloat($('#birthday').val()) < 1){
		            alert("请输入正确的生日日期!");
		            $('#birthday').focus();
		            $('#birthday').val('');
                   return;
		        }
	        }
	        if ($("#nophone").attr("checked")){
		        if($("#smecisourcecard").val().trim()== ''){
		        	alert("请输入关联顾客卡!");
		        	return;
			    }
	        }else{
			    if(($("#smeciphone").val().trim()==$("#smeciphone2").val().trim() || $("#smeciphone2").val().trim() == $("#smeciphone3").val().trim() || $("#smeciphone3").val().trim() == $("#smeciphone").val().trim())&&($("#smeciphone3").val().trim()!=''||$("#smeciphone2").val().trim()!='')){
					alert("存在重复电话，请更改！");
					return;
				}
		    }
			if(document.getElementById("smecimemberorigin").value=="tjyklaomo"&&document.getElementById("smecimodelworkerscode").value==""){
				alert("劳模顾客信息必须填写劳模证件号！");
				$('#smecimodelworkerscode').focus();
	            return;
			}
			        
	    	$("img").removeAttr("onclick");
			customerInfoForm.action = "insertCustomerInfo.action";
			customerInfoForm.submit();

	    }

	}

	var s = '';
	var opt0 = ["省份","地级市","市、县级市、县"];
	
	window.onload=function() {
		s = new Array();
		s[0] = document.getElementById("zone1");
		s[1] = document.getElementById("zone2");
		s[2] = document.getElementById("zone3");
		/*聚焦*/
		document.getElementById('smeciname').focus();  
				//回车
		$(':input[yyorder]').each(function(){
				$(this).unbind("keydown");
				$(this).keydown(function(){
					if(event.keyCode == 13){
						var index=$(this).attr('yyorder');
						$(':input[yyorder='+accAdd(index,1)+']').focus();
					}
				});
			});
		
		
		for(i=0;i<s.length-1;i++){
			s[i].onchange=new Function("change("+(i+1)+")");
		}
		
		change(0);
		document.getElementById("zone1").selectedIndex = 26;
		change(1);
		document.getElementById("zone3").selectedIndex = 2;
//区域赋值 Begin
		
		<c:if test="${fn:length(zones) > 0}">

			var options = document.getElementById("zone1").options;
			<c:if test="${fn:length(zones) >= 1}">
			var zone1 = '${zones[0]}';
			for(i = 0;i < options.length;i++){
				
				if(options[i].value.trim() == zone1){
					document.getElementById("zone1").selectedIndex = i;
					change(1);
					break;
				}
			}
			</c:if>
			<c:if test="${fn:length(zones) >= 2}" >
			var zone2 = '${zones[1]}';
			options = document.getElementById("zone2").options;
			for(i = 0;i < options.length;i++){				
				if(options[i].value == zone2){
					document.getElementById("zone2").selectedIndex = i;
					change(2);
					break;
				}
			}
			</c:if>
			<c:if test="${fn:length(zones) >= 3}" >
			var zone3 = '${zones[2]}';
			options = document.getElementById("zone3").options;
			
			for(i = 0;i < options.length;i++){
				if(options[i].value == zone3){
					document.getElementById("zone3").selectedIndex = i;
					change(3);
					break;
				}
			}
			</c:if>
		</c:if>
		
		<c:if test="${fn:length(zones) eq 0}">
		var zones="${systemParameterPo.fspcustomeraddress}".split(",");	
			
		if(zones.length>0){
			var options = "";
			for(j=0;j<zones.length;j++){
			
			if(j==0){
				var zone1 = zones[0].trim();
				options = document.getElementById("zone1").options;
				for(i = 0;i < options.length;i++){				
					if(options[i].value.trim() == zone1){
						document.getElementById("zone1").selectedIndex = i;
						change(1);
						break;
					}
				}
			}
					
			if(j==1){
				var zone2 = zones[1].trim();
				options = document.getElementById("zone2").options;
				
				for(i = 0;i < options.length;i++){	
					if(options[i].value.trim() == zone2){
						document.getElementById("zone2").selectedIndex = i;
						change(2);
						break;
					}
				}
			}
			
			if(j==2){
				var zone3 = zones[2].trim();
				options = document.getElementById("zone3").options;
				for(i = 0;i < options.length;i++){				
					if(options[i].value.trim() == zone3){
						document.getElementById("zone3").selectedIndex = i;
						change(3);
						break;
					}
				}
			}
		}
		}
		</c:if>
	//区域赋值 End	
	};	
	
	function customerName(){
		var name = document.getElementById('smeciname').value;
		if(!/^[a-zA-Z\u4E00-\uFA29]+$/g.test(name) && document.getElementById('smeciname').value!=""){
			document.getElementById('smeciname').value = "";
			document.getElementById('smeciname').focus();
			alert('顾客姓名只能输入中文或英文！');
		}
		document.getElementById('smeciname').value = document.getElementById('smeciname').value.replace(/[ ]/g,""); 
	}

    function setCustomer1(memberid,name,cphone,cintegral,customerid){
		document.getElementById('fmemberid').value = memberid;
		document.getElementById('fname').value = name;
		document.getElementById('fcustomerid').value = customerid;
	}
	
	function emptyf(){
		document.getElementById('fmemberid').value = "";
		document.getElementById('fname').value = "";
		document.getElementById('fcustomerid').value = "";
	}

    function getAreaAjaxData(level,pid) {  
    	switch(level)
    	{
    	case "2":
      	  $('#t2').load("getAjaxArea.action?level="+ level +"&pid="+ pid);
      	  $('#t3').empty();
      	  $('#t4').empty();
      	  $('#t5').empty();
      	  showHide();
    	  break;
    	case "3":
      	  $('#t3').load("getAjaxArea.action?level="+ level +"&pid="+ pid);
      	  $('#t4').empty();
      	  $('#t5').empty();      	  
      	  showHide();
      	  break;
    	case "4":
      	  $('#t4').load("getAjaxArea.action?level="+ level +"&pid="+ pid);
      	  $('#t5').empty();      	  
      	  showHide();    	  
      	  break;    
    	case "5":
       	  $('#t5').load("getAjaxArea.action?level="+ level +"&pid="+ pid);
      	  showHide();      	  
       	  break;       	    	  
    	}
    }	

    function showHide(){
    	  $('#t1').hide().show(); 
    	  $('#t2').hide().show(); 
    	  $('#t3').hide().show();  
      	  $('#t4').hide().show();  
      	  $('#t5').hide().show();       	  
    }

	function changeAddressType(typeid){
		if(typeid == '0'){
			$("tr[id=tradress3]").show();
			$("tr[id=tradress5]").hide();
		}else{
			$("tr[id=tradress3]").hide();
			$("tr[id=tradress5]").show();
		}
	}

	function check()
	{
		var rad=$('input:radio[name="customerInfoPo.ctype"]:checked').val();
		if(rad==1)
		{
			$('#smecimemberid').hide();
			document.getElementById('smecimemberid').validate="";
		}else
		{
			$('#smecimemberid').show();
			document.getElementById('smecimemberid').validate="[{'Type' : Type.String, 'Formula' : Formula.Word, 'Message' : '会员卡号只允许输入整数和字母！'}]";
		}		
	}
	
	function download(){
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("initCustomerInfoDownloadSel.action",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initCustomerInfoDownloadSel.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}		
		document.getElementById('popupTitle').innerHTML="【集团端顾客信息查询】";
	}
</script>

<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' } >
<form name="customerInfoForm" method="post" action="">
<input type="hidden" name="type" id="type" value="" />
<input type="hidden" name="arg0"  value="${arg0 }" />
<input type="hidden" name="repeat" id="repeat" value="${requestScope.repeat}" />
<input type="hidden" name="day" id="day" value="${requestScope.day}" />
<input type="hidden" name="moduleID" value="${requestScope.moduleID}">
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
           <TR>
              <td align="right" valign="bottom" colspan="3">&nbsp;
            	<img src="${ctx}/img/newbtn/btn_customerdowninsert_0.png" btn=btn title="集团顾客信息查询" onClick="download()">
              </td>
          </TR>

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
                style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; HEIGHT: 100px" 
                vAlign=top><DIV id=tabContent__1>
                  <DIV>
                 <TABLE width="100%" 
                  border=0 align=center cellPadding=3 cellSpacing=1 class="Privateborder">
                      <TBODY>						
                        <TR height="26">
                          <TD width="35%" class="table_body " align="right">顾客姓名</TD>
                          <TD width="65%" class="table_none ">
                           <input class="text_input100" type="text" yyorder="1"  id="smeciname" name="customerInfoPo.smeciname" 
                           value="${customerInfoPo.smeciname }"
			              validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '顾客姓名不能为空！'}]"/><label style="color:red;">&nbsp;*&nbsp;</label></TD>
					    </TR>
					    <TR height="26">
                          <TD width="35%" class="table_body" align="right">会员卡号</TD>
                          <TD width="65%" class="table_none">
                          <input class="text_input160" type="text" yyorder="2" id="smecimemberid" value="${customerInfoPo.smecimemberid}" name="customerInfoPo.smecimemberid" maxlength="30" validate="[{'Type' : Type.String, 'Formula' : Formula.Word, 'Message' : '会员卡号只允许输入整数和字母！'}]"><label style="color:red;">&nbsp;*&nbsp;</label>
                          <a href="#" onclick="camera()">拍照</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/img/camera/flashplayer11-6_install_win_ax.exe" ><img style="vertical-align:middle" src="${ctx}/img/camera/flash.jpg" border="0" width="22" title="Adobe Flash Player 11 插件下载"/></a>
                          <input type="text" style="display:none" name="customerInfoPo.memberPicPath" id="memberPicPath" value="${customerInfoPo.memberPicPath}" />
                          <input type="radio" name="customerInfoPo.ctype" id="ctype" value="0" checked="checked" onclick="check()">普通会员 <input type="radio" id="ctype" name="customerInfoPo.ctype" onclick="check()" value="1">自动生成
                          </TD>																									
					    </TR>
					<TR id="menberPic" height="26" <c:if test="${customerInfoPo.memberPicPath==null||customerInfoPo.memberPicPath==''}">style="display:none"</c:if>>
                          <TD width="35%" class="table_body " align="right">照片预览</TD>
                          <TD width="65%" class="table_none ">
                           	<img id="memberPicID" src="${customerInfoPo.memberPicPath}" width="125" border="0"/></TD>
					    </TR>  					    
                        <TR height="26">
                          <TD width="35%" class="table_body " align="right">顾客性别</TD>
                          <TD width="65%" class="table_none "><select yyorder="3"  id="smecisex" name="customerInfoPo.smecisex">
      		                 	<option value="0" select>男</option>
      		                 	<option value="1">女</option>
      	                    </select><label style="color:red;">&nbsp;*&nbsp;</label>
      	                  </TD>
					    </TR>
                        <TR height="26">
                          <TD width="35%" class="table_body" align="right">出生日期</TD>
                          <TD width="65%" class="table_none">
                          
                          <input type="text" class="text_input60" yyorder="4" id="birthYear" name="birthYear" maxlength="4" size="4" value="${year}"
                          	validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '出生日期格式有误！'},{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '出生日期格式有误！'}
                          	,{'Type' : Type.String, 'Expansion' : {Type : Expansion.EQLength, Params : [4]}, 'Message' : '年份长度为4位！'}]">                          
						
						<input type="text" class="text_input40" yyorder="5" id="birthMonth" name="birthMonth" maxlength="2" size="2" value="${month}"
						validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '出生日期格式有误！'},{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '出生日期格式有误！'}]">       	
								 
						<input type="text" class="text_input40" yyorder="6" id="birthday" name="birthday" maxlength="2" size="2" value="${day}"
						validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '出生日期格式有误！'},{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '出生日期格式有误！'}]" >		
							<label style="color:red;">&nbsp;*&nbsp;</label>	 
                          </TD>
                        </TR>
                        <TR height="26">
                        <li class="horizontal_onlyRight">
                          
                          <TD width="35%" class="table_body " align="right">联系电话1</TD>
                          <TD width="65%" class="table_none ">
                          <li class="horizontal_onlyRight">
                          <div id="phone">
                          <input class="text_input120" type="text" yyorder="7" value="${customerInfoPo.smeciphone }" 
                          id="smeciphone" name="customerInfoPo.smeciphone" maxlength="15" validate="[{'Type' : Type.String, 'Formula' : Formula.TelPhone, 'Message' : '电话格式不正确！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [16]}, 'Message' : '联系电话长度不能大于15个字符！'}]"><label style="color:red;">&nbsp;*&nbsp;<b>留存手机号才可以使用微信、短信功能</b></label>
                          </div>
                          </li>
                          <li class="horizontal_onlyRight">
                          	&nbsp;&nbsp;&nbsp;无电话<input type="checkbox" id="nophone" onclick="hidephone(this)"/>
                          </li>
                          </TD>																										
					   </TR>
					   <TR height="26" id="phone">
                          <TD width="35%" class="table_body " align="right">联系电话2</TD>
                          <TD width="65%" class="table_none ">
                          <input class="text_input120" type="text" value="${customerInfoPo.smeciphone2 }" 
                          id="smeciphone2" name="customerInfoPo.smeciphone2" maxlength="15" validate="[{'Type' : Type.String, 'Formula' : Formula.TelPhoneOrNull, 'Message' : '电话格式不正确！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [16]}, 'Message' : '联系电话长度不能大于15个字符！'}]">
                          </TD>																										
					   </TR>
					   <TR height="26" id="phone">
                          <TD width="35%" class="table_body " align="right">联系电话3</TD>
                          <TD width="65%" class="table_none ">
                          <input class="text_input120" type="text" value="${customerInfoPo.smeciphone3 }" 
                          id="smeciphone3" name="customerInfoPo.smeciphone3" maxlength="15" validate="[{'Type' : Type.String, 'Formula' : Formula.TelPhoneOrNull, 'Message' : '电话格式不正确！'},{'Type' : Type.String, 'Formula' : Formula.LongDateFormat, 'Expansion' : {Type : Expansion.LessThanLength, Params : [16]}, 'Message' : '联系电话长度不能大于15个字符！'}]">
                          </TD>																										
					   </TR>
					   <TR height="26" id="customercard" style="display: none;">
                          <TD width="35%" class="table_body" align="right">关联顾客卡</TD>
                          <TD width="65%" class="table_none">
	                          <li class="horizontal_onlyRight">
	                          <input class="text_input120" type="text" value="${customerInfoPo.smecisourcecard }" readonly="readonly"
	                          id="smecisourcecard" name="customerInfoPo.smecisourcecard">
	                          </li>
	                          <li class="horizontal_onlyRight">
	                          <img src="${ctx}/img/newbtn/btn_change_0.png" title="选择" btn="btn" onclick="selCustomer('0','')"/>
	                          </li>
	                          <li class="horizontal_onlyRight">
	                          <label style="color:red;">&nbsp;*&nbsp;</label>
	                          </li>
                          </TD>																										
					   </TR>
                        <TR height="26" id="tradress3">
                          <TD width="35%" class="table_body " align="right">地区(3级)</TD>
                          <TD width="65%" class="table_none ">
                          <select id="zone1" yyorder="8"  name="customerInfoPo.smecizone" value="${companyNamePo.fcnzone}"
                          validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '地区不能为空！'}]"></select>
                          <select id="zone2" yyorder="9" name="customerInfoPo.smecizone"></select>
                          <select id="zone3" yyorder="10" name="customerInfoPo.smecizone"></select><label style="color:red;">&nbsp;*&nbsp;</label>
                          </TD>
					    </TR>
                        <TR height="26" id="tradress5">
                          <TD width="35%" class="table_body " align="right">地区(5级)</TD>
                          <TD width="65%" class="table_none ">
	                          <select id="t1" name="customerInfoPo.smeciarea1" onchange="getAreaAjaxData('2',this.options[this.options.selectedIndex].value)">
	                          	 <option value="">${customerInfoPo.smeciarea1}---请选择---</option>
	                             <s:iterator value="area1List">
	                                 <option value="${faid}" ${(faid eq systemParameterPo.fsparea1)? 'selected':''}>${faname}</option>
	                             </s:iterator>
	                          </select>
	                          <select id="t2" name="customerInfoPo.smeciarea2" onchange="getAreaAjaxData('3',this.options[this.options.selectedIndex].value)">
	                          	<option value="">---请选择---</option>
	                          	 <s:iterator value="area2List">
	                                 <option value="${faid}" ${(faid eq systemParameterPo.fsparea2)? 'selected':''}>${faname}</option>
	                             </s:iterator>	
	                          </select>
	                          <select id="t3" name="customerInfoPo.smeciarea3" onchange="getAreaAjaxData('4',this.options[this.options.selectedIndex].value)">
	                          	<option value="">---请选择---</option>
	                          	 <s:iterator value="area3List">
	                                 <option value="${faid}" ${(faid eq systemParameterPo.fsparea3)? 'selected':''}>${faname}</option>
	                             </s:iterator>	
	                          </select>
	                          <select id="t4" name="customerInfoPo.smeciarea4" onchange="getAreaAjaxData('5',this.options[this.options.selectedIndex].value)">
	                          	<option value="">---请选择---</option>
	                          	 <s:iterator value="area4List">
	                                 <option value="${faid}" ${(faid eq systemParameterPo.fsparea4)? 'selected':''}>${faname}</option>
	                             </s:iterator>	
	                          </select>
	                          <select id="t5" name="customerInfoPo.smeciarea5">
	                          	<option value="">---请选择---</option>
	                          	 <s:iterator value="area5List">
	                                 <option value="${faid}" ${(faid eq systemParameterPo.fsparea5)? 'selected':''}>${faname}</option>
	                             </s:iterator>	
	                          </select>                      	                          	                          	                          
                          </TD>
					    </TR>					   
						<c:if test="${permissionPo.keyf==1}">   		    
					 	<TR height="26">       
						  <TD width="35%" class="table_body " align="right">会员卡类型</TD>
                          <TD width="65%" class="table_none ">
	                          <select name="customerInfoPo.smecicardtype" yyorder="11">
	                             <s:iterator value="memberManagementList">
	                                 <option value="${fmmid}">${fmmmembername}</option>
	                             </s:iterator>
	                          </select>
                          </TD>
                     	</TR> 
            			</c:if>    
            			<c:if test="${SystemParameterPo.fspidentitycard == '1'}">   
            			<TR height="26">
                          <TD width="35%" class="table_body " align="right">身份证</TD>
                          <TD width="65%" class="table_none ">
                           <input class="text_input200" type="text" yyorder="12" value="${customerInfoPo.smeidentitycard}" maxlength="20" 
                           id="smeidentitycard" name="customerInfoPo.smeidentitycard" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '请填写身份证！'},{'Type' : Type.String, 'Formula' : Formula.IdentityCard, 'Message' : '请填写正确的身份证格式！'}]">
                           <label style="color:red;">&nbsp;*&nbsp;</label>
                          </TD>
					    </TR> 
						</c:if>		        
						<TR height="26">
                          <td class="table_body" colspan="2" align="center">
                          <c:if test="${person.departmenttype eq '1' }">
                          		<img id="submitButton" btn=btn src="${ctx}/img/newbtn/btn_save_0.png" title='保存' onClick="save()">
                          	</c:if>
                          	<c:if test="${person.departmenttype ne '1' }">
                          		<font color="red">当前部门类型不是销售门店，不能保存！</font>
                          	</c:if>
                          </TD>
						  </TR>
					    <TR height="26">
                          <TD width="35%" class="table_body " align="center" colspan="2"><label style="color:red;"><b>以下为可选项</b></label></TD>
					    </TR>
					    <TR height="26">
                          <TD width="35%" class="table_body " align="right">主卡</TD>
                          <TD width="65%" class="table_none ">
                          <li class="horizontal_onlyRight"><input class="text_input160" type="text" yyorder="12" id="fmemberid" maxlength="20" readonly="readonly" name="customerInfoPo.smecifmemberid" value="${customerInfoPo.smecifmemberid }">
                          <input class="text_input160" type="hidden" yyorder="12" id="fcustomerid" maxlength="20" name="customerInfoPo.smecifcustomerid" value="${customerInfoPo.smecifcustomerid }">
                          </li>
				          <li class="horizontal_onlyRight">姓名&nbsp;<input class="text_input60" readOnly="readOnly" id="fname" name="customerInfoPo.smecifmemberidname" value="${customerInfoPo.smecifmemberidname }"></li>
                          <li class="horizontal_onlyRight"><img id="submitButton" btn=btn src="${ctx}/img/newbtn/btn_search_0.png" title='查询' onClick="selCustomer('1','1');"></li>
                          <li class="horizontal_onlyRight"><img id="submitButton" btn=btn src="${ctx}/img/newbtn/btn_empty_0.png" title='清空' onClick="emptyf();"></li>
                          <label style="color:red;">&nbsp;<b>(设置主卡后，本卡消费后获得积分将会累计到主卡上。)</b></label>
                          </TD>
					    </TR>
			 			<TR height="26">
                          <TD width="35%" class="table_body " align="right">人群分类</TD>
                          <TD width="65%" class="table_none ">
                          <select id="smecipersontype" yyorder="13" name="customerInfoPo.smecipersontype" >
      		                 	<option value="">----请选择----</option>
								<s:iterator value="persontypepolist">
									<option value="${bptid}" >
										${bptname}
									</option>
								</s:iterator>
      	                    </select>
      	                  </TD>
					    </TR>
					     <TR height="26">
                          <TD width="35%" class="table_body " align="right">推荐人手机号</TD>
                          <TD width="65%" class="table_none ">
                          <input name=customerInfoPo.smecitjrphone  yyorder="14" type="text" placeholder="推荐人手机号" value="${customerInfoPo.smecitjrphone}" id="smecitjrphone" maxlength="20" validate="[{'Type' : Type.String, 'Formula' : Formula.INTORNULL, 'Message' : '手机号应为数字！'}]"/>
                          </TD>
					    </TR>
					    <TR height="26">
                          <TD width="35%" class="table_body " align="right">职业</TD>
                          <TD width="65%" class="table_none ">
                          <select id="smeciwork" yyorder="15" name="customerInfoPo.smeciwork">
      		                 	<option value="">----请选择----</option>
								<s:iterator value="worktypepolist">
									<option value="${bwtid}" >
									${bwtname}
									</option>
								</s:iterator>
      	                    </select>
      	                  </TD>
					    </TR>
					    
					    <TR height="26">
                          <TD width="35%" class="table_body " align="right">QQ号码</TD>
                          <TD width="65%" class="table_none ">
                          <input class="text_input200" type="text" yyorder="16" value="${customerInfoPo.smeciqqnumber }" 
                          id="smeciqqnumber" name="customerInfoPo.smeciqqnumber" maxlength="12" validate="[{'Type' : Type.String, 'Formula' : Formula.INTORNULL, 'Message' : 'QQ号码应为整形！'}]">
                          </TD>
					    </TR>
                        <TR height="26">
                          <TD width="35%" class="table_body " align="right">E-Mail</TD>
                          <TD width="65%" class="table_none ">
                           <input class="text_input200" type="text" yyorder="17" value="${customerInfoPo.smeciemail }" 
                           id="smeciemail" name="customerInfoPo.smeciemail" validate="[{'Type' : Type.String, 'Formula' : Formula.emailORNULL, 'Message' : '请填写正确的E-Mail格式！'}]">
                          </TD>
                        </TR>
                        <TR height="26">
                          <TD width="35%" class="table_body " align="right">地址</TD>
                          <TD width="65%" class="table_none ">
                          <input class="text_input200" type="text" yyorder="18" value="${customerInfoPo.smeciaddress }" 
                          id="smeciaddress" name="customerInfoPo.smeciaddress" maxlength="25" validate="[{'Type' : Type.String, 'Formula' : Formula.CNORNULL, 'Message' : '地址应为中文！'}]">
                          </TD>
					    </TR>
                        <TR height="26">
                          <TD width="35%" class="table_body " align="right">邮编</TD>
                          <TD width="65%" class="table_none ">
                          <input class="text_input100" type="text" yyorder="19" value="${customerInfoPo.smecipostcode }" 
                          id="smecipostcode" name="customerInfoPo.smecipostcode" maxlength="6" validate="[{'Type' : Type.String, 'Formula' : Formula.INTORNULL, 'Message' : '邮编应为整形！'}]">
                          </TD>
						</TR>
 						  <TR height="26">
                          <TD width="35%" class="table_body " align="right">注册时间</TD>
                          <TD width="65%" class="table_none "><jsp:useBean id="now" class="java.util.Date" /><fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" />
                         </TD>
						</TR> 
						 <TR height="26">
                          <TD width="35%" class="table_body " align="right">兴趣爱好</TD>
                          <TD width="65%" class="table_none ">
                            <c:forEach items="${interestpolist}" var="interestpolist" varStatus="linerole">
                             <input type=checkbox id="interestpolists" name='interestpolists' value='${interestpolist.birid}'>${interestpolist.birname}
                           </c:forEach>
                         </TD>
						</TR>
						<TR height="26">
                          <TD width="35%" class="table_body " align="right">来源</TD>
                           <TD width="65%" class="table_none ">
                           <select id="smecimemberorigin" name="customerInfoPo.smecimemberorigin" yyorder="20" onchange="doSelect(this)">
      		                 	<option value="">----请选择----</option>
								<s:iterator value="memberoriginpolist">
									<option value="${bmoid}" ${customerInfoPo.smecimemberorigin == bmoid ? 'selected="selected"':'' }>${bmoname}</option>
								</s:iterator>
      	                    </select>
      	                  </TD>
						</TR>
            			<TR id="tjyklaomo" height="26" style="display: none">
                          <TD width="35%" class="table_body " align="right">劳模证</TD>
                          <TD width="65%" class="table_none ">
                           <input class="text_input200" type="text" yyorder="21" value="${customerInfoPo.smecimodelworkerscode}" maxlength="20" 
                           id="smecimodelworkerscode" name="customerInfoPo.smecimodelworkerscode">
                          </TD>
					    </TR> 						
			<c:if test="${SystemParameterPo.fspidentitycard == '2'}">   
            			<TR height="26">
                          <TD width="35%" class="table_body " align="right">身份证</TD>
                          <TD width="65%" class="table_none ">
                           <input class="text_input200" type="text" yyorder="22" value="${customerInfoPo.smeidentitycard}" maxlength="20" 
                           id="smeidentitycard" name="customerInfoPo.smeidentitycard" validate="[{'Type' : Type.String, 'Formula' : Formula.IdentityCard, 'Message' : '请填写正确的身份证格式！'}]">
                          </TD>
					    </TR> 
			</c:if>							
 						<TR height="26">
                          <TD width="35%" class="table_body " align="right">备注</TD>
                           <TD width="65%" class="table_none ">
                           <textarea id="smeciremark" yyorder="23" name="customerInfoPo.smeciremark" validate="[{'Type' : Type.String, 'Formula' : '', 'Expansion' : {Type : Expansion.LessThanLengthORNULL, Params : [1001]}, 'Message' : '备注不能大于1000字！'}]"></textarea>
      	                  </TD>
						</TR>
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
                        <TR>
                          <td align="center">
                          	<c:if test="${person.departmenttype eq '1' }">
                          		<img id="submitButton" btn=btn src="${ctx}/img/newbtn/btn_save_0.png" title='保存' onClick="save()">
                          	</c:if>
                          	<c:if test="${person.departmenttype ne '1' }">
                          		<font color="red">当前部门类型不是销售门店，不能保存！</font>
                          	</c:if>
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
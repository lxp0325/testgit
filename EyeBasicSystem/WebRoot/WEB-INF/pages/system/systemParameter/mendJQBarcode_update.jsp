<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ include file="/commons/printBarcode.jsp" %>

<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
<META HTTP-EQUIV="expires" CONTENT="0"> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" src="${ctx }/js/zone.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>条码样式设置</title>
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
	
	function isshowdiv(obj){
		var index = $(obj).val();
		$("div[a=a]").hide();
		$("input[bl=bl]").attr("disabled","disabled");
		$("div[id=type"+index+"]").show();
		$("input[bl=bl][group="+index+"]").attr("disabled","");
	}

	function save(){
		if(checkForm(companyNameForm)){
			$("img").removeAttr("onclick");
			companyNameForm.action = "mendBarcode.action?number="+Math.random();
			companyNameForm.submit();
		}
	}

	function batPrintGoodsBarCode(){
		var barCode = new Array();
		var quantity = new Array();
		var brandname = new Array();
		var source = new Array();
		var spec = new Array();
		var color = new Array();
		var retailprice = new Array();
		var person = new Array();
		
		person[person.length] = "0000";
		barCode[barCode.length] = "100.00-350.00";
		quantity[quantity.length] = "1";
		brandname[brandname.length] = "测试品种";
		source[source.length] = "测试产地";
		spec[spec.length] = "0001";
		color[color.length] = "FFFFFF";
		retailprice[retailprice.length] = "8888.88";
			
		var printtype = {"1":$("#fsptype").val()
						 ,"2":$("#fsptype").val()
						 ,"3":$("#fsptype").val()
						 ,"4":$("#fsptype").val()
						 ,"5":$("#fsptype").val()
						 ,"6":$("#fsptype").val()
						 ,"7":$("#fsptype").val()
						 ,"8":$("#fsptype").val()
						 ,"9":$("#fsptype").val()};
		
		PrintJQ("100.00--200.00", "1");
	}

	function inputForABS(obj){
		if(!$(obj).val()){
			return;
		}
		
		if($(obj).val().search("^-?\\d+$")!=0){
			alert("请输入整数！");
			$(obj).focus();
			$(obj).select();
		}else{
			$(obj).val(Math.abs($(obj).val()));
		}
	}
</script>
<body>
<form name="companyNameForm" method="post" action="">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<input type="hidden" name="systemParameterPo.fsptype" id="ctype" value="11"/>
<TBODY>
  <tr height="20px"><td></td></tr>
  <TR>
    <TD><!-- ?? Start -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
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
                <TD width="100%" 
                vAlign=top 
                style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px; HEIGHT: 100px"><DIV id=tabContent__1>
                  <DIV>
                    <TABLE width="100%" cellSpacing=1 cellPadding=3 align=center border=0 class="privateBorder">
                      <TBODY>
                      	 <TR height="30">
                          <TD class="table_body" colspan="8">
                          <div id="cname">价签</div>
                          </TD>
                         </TR>
                         <TR>
                          <TD class="table_body">RMB字符设置<input bl=bl onblur="inputForABS(this)" group="8" class="text_input40" type="hidden"  id="fsprows" name="systemParameterPo.fsprows" value="1"></TD>
                          <TD class="table_none">X轴坐标<input bl=bl onblur="inputForABS(this)" group="8" class="text_input40" type="text"  id="fspxs" name="systemParameterPo.fspxs" value="${barcodepo1[0].fspx }" maxlength="4" validate="[{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '请填写整数！'}]"></TD>
                          <TD class="table_none">Y轴坐标<input bl=bl onblur="inputForABS(this)" group="8" class="text_input40" type="text"  id="fspys" name="systemParameterPo.fspys" value="${barcodepo1[0].fspy }" maxlength="4" validate="[{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '请填写整数！'}]"></TD>
                          <TD class="table_none">打印字体大小<input bl=bl onblur="inputForABS(this)" group="8" class="text_input40" type="text"  id="fspsizes" name="systemParameterPo.fspsizes" value="${barcodepo1[0].fspsize }" maxlength="2" validate="[{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '请填写整数！'}]"></TD>
						  <TD class="table_none" rowspan="8"><img src="${ctx}/img/example/frameexample_8.jpg" width="400" height="300"><img src="${ctx}/img/newbtn/btn_printexamplebarcode_0.png" btn=btn id="printexamplebarcode" title='打印测试条码' onclick="batPrintGoodsBarCode();"></TD> 
                         </TR>
						 <TR>
                          <TD class="table_body">金额字符设置<input bl=bl onblur="inputForABS(this)" group="8" class="text_input40" type="hidden"  id="fsprows" name="systemParameterPo.fsprows" value="2"></TD>
                          <TD class="table_none">X轴坐标<input bl=bl onblur="inputForABS(this)" group="8" class="text_input40" type="text" id="fspxs" name="systemParameterPo.fspxs" value="${barcodepo1[1].fspx }" maxlength="4" validate="[{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '请填写整数！'}]"></TD>
                          <TD class="table_none">Y轴坐标<input bl=bl onblur="inputForABS(this)" group="8" class="text_input40" type="text" id="fspys" name="systemParameterPo.fspys" value="${barcodepo1[1].fspy }" maxlength="4" validate="[{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '请填写整数！'}]"></TD>
                          <TD class="table_none">打印字体大小<input bl=bl onblur="inputForABS(this)" group="8" class="text_input40" type="text" id="fspsizes" name="systemParameterPo.fspsizes" value="${barcodepo1[1].fspsize }" maxlength="2" validate="[{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '请填写整数！'}]"></TD>
                         </TR>
                         
                         <TR>
                         	<TD class="table_body" width="15%">传输端口</TD>
                         	<TD class="table_none" colspan="3"><input bl=bl group="8" class="text_input60" type="text" id="fspport" name="systemParameterPo.fspport" value="${barcodepo1[1].fspport }" maxlength="7"></TD>
                   		 </TR>
                   		 
                         <TR>   
                          <TD class="table_body" width="7%">字体</TD>
                          <TD class="table_none" colspan="3">
                          	<select id="fspfont" name="systemParameterPo.fspfont">
                          		<option value="AX" ${barcodepo1[0].fspfont == 'AX' ? 'selected="selected"':'' }>AX(GX430t)</option>
                          		<option value="A0" ${barcodepo1[0].fspfont == 'A0' ? 'selected="selected"':'' }>A0(105SL)</option>
                          	</select>
                          </TD>
                         </TR>
                         <TR>
						  <TD class="table_none" colspan="4">&nbsp;</TD>
                         </TR>
                         <TR>
						  <TD class="table_none" colspan="4">&nbsp;</TD>
                         </TR>
                         <TR>
						  <TD class="table_none" colspan="4">&nbsp;</TD>
                         </TR>
                         <TR>
						  <TD class="table_none" colspan="4">&nbsp;</TD>
                         </TR>
                         
						  <input class="text_input40" bl=bl onblur="inputForABS(this)" group="8" type="hidden" id="fsprowprintnum" name="systemParameterPo.fsprowprintnum" value="${barcodepo1[0].fsprowprintnum }" maxlength="2" validate="[{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '请填写整数！'}]">
                          <input bl=bl onblur="inputForABS(this)" group="8" class="text_input40" type="hidden"  id="fsprowprintspan" name="systemParameterPo.fsprowprintspan" value="${barcodepo1[0].fsprowprintspan }" maxlength="3" validate="[{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '请填写整数！'}]">
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                     
					   <TR>
						  <TD align="left"><img src="${ctx}/img/newbtn/btn_save_0.png" btn=btn id="submitButton" title='保存' onclick="save();"></TD>
                        </TR>                     
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                     
					   <TR>
						  <TD align="left"><font color="red">
						  X轴：用来控制打印区域的左右方向调整，一般以0为起点，数字越大越靠右。（只能输入正整数）</br></br>
						  Y轴：用来控制打印区域的上下方向调整，一般以0为起点，数字越大越靠下。（只能输入正整数）</br></br>
						     字体大小：用来控制打印区域内打印的大小，数字越大打印字符或二维码就越大。（只能输入正整数）</br></br>
						     每行打印个数：用来控制每行可以打印多少个此类条码签。（只能输入正整数）</br></br>
						     每行打印个数：用来控制每个打印条码签的间距，每隔多少坐标再打印一个。（只能输入正整数）</font>
						  </TD>
                        </TR>                     
                    </TABLE>
                  </DIV>
                </DIV>
                </TD>
                <TD width=24 background=${ctx}/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx}/img/pic/tab_bg.gif" width=1></TD>
              </TR></TBODY></TABLE></TD></TR>
              <tr>
              <TD width=24 background=${ctx}/img/pic/tab_bg.gif><IMG height=1 
                  src="${ctx}/img/pic/tab_bg.gif" width=1></TD>
              </tr>
    </TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
</form>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ include file="/commons/printBarcode.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" src="${ctx }/js/orderItem.js"></script>
<title>采购收货管理</title>
</head>
<script>
    var index = 0;
	$(document).ready(function() {
		$("img[btn=btn]").attr("style","cursor: hand");
		$("img[btn=btn]").mouseover(function () {
        	$(this).attr("src",$(this).attr("src").replace("0","1"));
    	}).mouseout(function () {
			$(this).attr("src",$(this).attr("src").replace("1","0"));
    	});
	});

	function addtdgoods(){
		procurementReceiptForm.action = "addProcurementReceiptDimensionyx.action";
		procurementReceiptForm.submit();
	}

	//子页面删除单行
	function openGoodSingleDeleteValues(objValue){
		var goodInfos = eval('(' + objValue + ')');
		
		for(var i = 0; i < goodInfos.length; i++){
			deleterow(goodInfos[i]);
		}
		
		amount();
	}	
	
	//条码批量打印
	function batPrintGoodsBarCode(){
		var flag = false;
		
		if(confirm("条码打印确认！")){
			var ids = document.getElementsByName("chk");
			var persons = $("input[id=person]");
			var barCodes = $("input[id=pcbarcode]");
			var goodsQuantitys = $("input[id=quantity]");
			var brandnames = $("input[id=brandname]");
			var sources = $("input[id=source]");
			var specs = $("input[id=spec]");
			var colors = $("input[id=color]");
			var retailprices = $("input[id=retailprice]");
			var guaranteeperiods = $("input[id=guaranteeperiod]");
			var batchs = $("input[id=batch]");
			
			var suffix;
			var barCount = 0;
			
			var barCode = new Array();
			var quantity = new Array();
			var brandname = new Array();
			var source = new Array();
			var spec = new Array();
			var color = new Array();
			var retailprice = new Array();
			var person = new Array();
			var guaranteeperiod = new Array();
			var batch = new Array();
			
			for(var i=0 ; i< barCodes.length; i++){
				if(ids[i].checked == true){
					/*alert(persons[0].value);
					alert(barCodes[i].value);
					alert(goodsQuantitys[i].value);
					alert(brandnames[i].value);
					alert(sources[i].value);
					alert(colors[i].value);
					alert(retailprices[i].value);
					alert(guaranteeperiods[i].value);
					alert(batchs[i].value);*/
				
					person[person.length] = persons.val();
					barCode[barCode.length] = barCodes[i].value;
					quantity[quantity.length] = goodsQuantitys[i].value;
					
					brandname[brandname.length] = brandnames[i].value;
					source[source.length] = sources[i].value;
					spec[spec.length] = specs[i].value;
					color[color.length] = colors[i].value;
					retailprice[retailprice.length] = retailprices[i].value;
					guaranteeperiod[guaranteeperiod.length] = guaranteeperiods[i].value;
					batch[batch.length] = batchs[i].value;
					
					flag = true;
				}
			}

			if(flag == false){
				alert("请钩选要打印的商品条码！");
			}else{
				var printtype = {"1":"${systemParameterPo.fspframebarcodetype}"
					 ,"2":"${systemParameterPo.fsppartsbarcodetype}"
					 ,"3":"${systemParameterPo.fspglassbarcodetype}"
					 ,"4":"${systemParameterPo.fspstealthbarcodetype}"
					 ,"5":"${systemParameterPo.fspsolutionbarcodetype}"
					 ,"6":"${systemParameterPo.fspsunglassesbarcodetype}"
					 ,"7":"${systemParameterPo.fspconsumebarcodetype}"
					 ,"8":"${systemParameterPo.fspoldglassesbarcodetype}"
					 ,"9":"${systemParameterPo.fspmetropiabarcodetype}"};
				try {
					printBarCode(barCode,quantity,brandname,source,spec,color,retailprice,person,printtype,guaranteeperiod,batch);
				} catch(e) {
					alert("打印失败!请检查条码打印机是否正确连接!");
					return;
				}
			}
		}
	}
	
	function barcodes(goodsid,goodsbarcode){
		if(goodsbarcode.value==''){
			return;
		}
		var tmp = goodsid.replace(/\./g,  "").toUpperCase();
		var tmp1 = goodsbarcode.value.substring(0,18);
		tmp1 = tmp1.toUpperCase();
		//alert(tmp1);
		if(tmp != tmp1){
			alert("商品不符！");
			goodsbarcode.value="";
			return;
		}
		if(goodsbarcode.value.length<26)
		{
			alert("商品位数不符！");
			goodsbarcode.value="";
			return;
		}
		if(goodsbarcode.value.length>26)
		{
			alert("商品位数不符！");
			goodsbarcode.value="";
			return;
		}
		
	}
	function save(){
	if(checkForm(document.all.procurementReceiptForm)){ 
		if('${systemParameterPo.fspisfillindeliveryid}' == '1'){
			if(!$("#deliveryID").val().trim()){
				alert("请填写运单单号！");
				$("#deliveryID").focus();
				return;
			}
		}
	
		var cstpgoodscategory = $('#cstigoodscategory').val();
		if(cstpgoodscategory == '4' || cstpgoodscategory == '5'){
			var guaranteeperiod = document.getElementsByName("goodsInfoTempPo.guaranteeperiod");
			for(i=0;i<guaranteeperiod.length;i++){
				
				if(guaranteeperiod[i].value==""){
					alert("请填写商品效期！");
					guaranteeperiod[i].focus();
					return;	
				}
			}
			
			var batch = document.getElementsByName("goodsInfoTempPo.batch");
			
			for(i=0;i<batch.length;i++){
				if(batch[i].value==""){
					alert("请填写商品批号！");
					batch[i].focus();
					return;	
				}
			}
			
			<c:if test="${systemParameterPo.fspisregistrationnum eq '1'}">
				var registrationnum = document.getElementsByName("goodsInfoTempPo.registrationnum");
				
				for(i=0;i<registrationnum.length;i++){
					if(registrationnum[i].value==""){
						alert("请填写商品注册证号！");
						registrationnum[i].focus();
						return;	
					}
				}
			</c:if>
		}
		var table = document.getElementById('addTable');
		
		//判断商品数量是否为空	
		var goodsquantityArray = document.getElementsByName("goodsInfoTempPo.goodsquantity");
		var goodsquantityCount=0;
		for(i=0;i<goodsquantityArray.length;i++){
			if(goodsquantityArray[i].value=="0"){
				alert("商品数量不能为0！");
				goodsquantityArray[i].focus();
				return;	
			}
			goodsquantityCount++;
		}
		
		if(goodsquantityCount==0){
        alert('请选择商品!');
        	return false;
        }
        
		//验证商品类别和制造商是否与添加商品一样
		var supplierID=document.all.cstisupplierid.value;
		var chk=document.getElementsByName("chk");
		var length = chk.length;
		
		var re = new RegExp();
		re.compile("^[1-9]\." + supplierID.toUpperCase());
		for(i = 0; i < length; i++){
			if(!re.test(chk[i].value.toUpperCase())){
				alert("制造商与添加的商品不匹配！");
				return;	
			}		
		}
		var cstiauditstate=0;
		if ($("#cstiauditstate").attr("checked")){
		    cstiauditstate=1;
		}	
		
		var goodsids = document.getElementsByName('goodsInfoTempPo.goodsid');
		var goodsbarcodes = document.getElementsByName('goodsInfoTempPo.pcbarcode');
		
		var size = goodsids.length;
		
		var submittype = 'a';
		for(var i = 0; i < size; i++){
			if(goodsids[i].value.replace(/\./g,"")!=goodsbarcodes[i].value.substring(0,18)){
				submittype = i;
				break;
			}
		}
		
		if(parseFloat(submittype) >= 0){
			goodsbarcodes[submittype].focus();
			goodsbarcodes[submittype].select();
			alert("条码不符");
			return;
		}
			
		$("img").removeAttr("onclick");
		procurementReceiptForm.action = "updateProcurementReceiptyx.action?cstiauditstate="+cstiauditstate;
		procurementReceiptForm.submit();
		}
	}

	function openOrders(){	
		var supplierID=document.all.cstisupplierid.value;
		var supplierName=$('#supplierName').val();
		var categoryID_open='';
		var category = $('#cstigoodscategory').val();
	    if(supplierID==''){
	      alert('请选择所属制造商');
	      return false;
	    }
	    var billID=document.all.cstibillid.value;
	    var billType=billID.substring(0,3);
	    var poType='';
	    if(billType=='PIN'){
	       poType='P'
	    }else if(billType=='OTI'){
	       poType='Q'
	    }
	    
	    var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("initProcurementOrdersForOpen.action?poType="+poType+"&updatepage=u&supplierID="+supplierID+"&supplierName="+supplierName+"&category="+category,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initProcurementOrdersForOpen.action?poType="+poType+"&updatepage=u&supplierID="+supplierID+"&supplierName="+supplierName+"&category="+category,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		
		document.getElementById('popupTitle').innerHTML="【采购订单查询】";
	}		
	function openGoodSingle(){
		var supplierID=document.all.cstisupplierid.value;
		var categoryID_open=$('#cstigoodscategory').val();
	    if(supplierID==''){
	      alert('请选择所属制造商');
	      return false;
	    }	
	    var iscustomize="";  
	    if(categoryID_open=='3'||categoryID_open=='4')
    	{
    		iscustomize="0";
	    }
	    var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("initGoodsSingleSel.action?categoryID_open="+categoryID_open+"&supplierID_open=" + supplierID+"&iscustomize="+iscustomize,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initGoodsSingleSel.action?categoryID_open="+categoryID_open+"&supplierID_open=" + supplierID+"&iscustomize="+iscustomize,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		
		document.getElementById('popupTitle').innerHTML="【商品查询】";
	}
	function openGoodSingleValues(objValue){
		var goodInfos = eval('(' + objValue + ')');
		
		for(var i = 0; i < goodInfos.length; i++){
			addRow(goodInfos[i]);			
		}
		
		var ordertype = goodInfos[0].bgigoodsid.substring(0,1);
		$('#goodstype').val(ordertype);
		isshow($('#goodstype').val());
		amount();

		$("input[name='goodsInfoTempPo\\.goodsquantity']").each(function(){
			$(this).bind("keyup",function(){
				$(this).val(
				$(this).val().replace(/[^0-9.][0-9]*/g,'')
				);
			});	
			$(this).bind("blur",function(){
				if(!isNaN($(this).val())){
					$(this).val(
					$(this).val().replace(/[^0-9.][0-9]*/g,'')
					);
				}else{
					$(this).val('');
				}
			});	
		});
	}
	
	function addRow(goodInfo){
		var table = document.getElementById('addTable');
		index = accAdd(table.rows.length - 1,index);
		// 商品id去重
		var issubmit = '0';
		$("input[id=chk]").each(function(){
         	if($(this).val()== goodInfo.bgigoodsid){
					issubmit='1';
           }
		});
		if(issubmit == '1'){
	        return;
	    }
		
		var row = table.insertRow(table.rows.length);
		var c1 = row.insertCell(0);		//选择
		var c2 = row.insertCell(1);		//代码		
		var c3 = row.insertCell(2);		//名称
		var c4 = row.insertCell(3);		//规格
		var c5 = row.insertCell(4);		//球镜
		var c6 = row.insertCell(5);		//柱镜
		var c7 = row.insertCell(6);		//曲率
		var c8 = row.insertCell(7);		//直径
		var c9 = row.insertCell(8);		//使用类型
		var c10 = row.insertCell(9);	//抛弃型分类
		var c11 = row.insertCell(10);	//主容量
		var c12 = row.insertCell(11);	//次容量
		var c13 = row.insertCell(12);	
		var c14 = row.insertCell(13);
		var c15 = row.insertCell(14);		
		var c16 = row.insertCell(15);	//条码
		var c17 = row.insertCell(16);	//数量	
				
		c5.group="qj";
		c6.group="zj";
		c7.group="ql";
		c8.group="zhj";
		c9.group="sylx";
		c10.group="pqxfl";
		c11.group="zrl";
		c12.group="crl";
		c13.group="xq";
		c14.group="xq1";
		c15.group="xq2";			
		
		row.className = 'row';
		row.height="26";

		c1.innerHTML = '<input id="chk" type="checkbox" value="' + goodInfo.bgigoodsid + '" >';
        c2.innerHTML = "<img src=\"${ctx}/img/newbtn/addgoods_0.png\" onmouseover=\"JavaScript:$(this).attr('src','${ctx }/img/newbtn/addgoods_1.png');\" onmouseout=\"JavaScript:$(this).attr('src','${ctx }/img/newbtn/addgoods_0.png');\" btn=btn title='复制商品' onClick=\"copyRow(this,{'bgigoodsid':'"+goodInfo.bgigoodsid+"','bgigoodsname':'"+goodInfo.bgigoodsname+"','bgispec':'"+goodInfo.bgispec+"','bgisph':'"+goodInfo.bgisph+"','bgicyl':'"+goodInfo.bgicyl+"','bgicurvature1':'"+goodInfo.bgicurvature1+"','bgidia':'"+goodInfo.bgidia+"','bgiusetype':'"+goodInfo.bgiusetype+"','bgistealthclass':'"+goodInfo.bgistealthclass+"','bgicapacity':'"+goodInfo.bgicapacity+"','bgibrandname':'"+goodInfo.bgibrandname+"','bgicapacityentry':'"+goodInfo.bgicapacityentry+"','bgipcbarcode':'"+goodInfo.bgipcbarcode+"','bgigoodsquantity':'','bgisource':'"+goodInfo.bgisource+"','bgiretailprice':'"+goodInfo.bgiretailprice+"','bgicostprice':'"+goodInfo.bgicostprice+"','bginottaxrate':'"+goodInfo.bginottaxrate+"','bgitaxrate':'"+goodInfo.bgitaxrate+"','bgicolor':'"+goodInfo.bgicolor+"','bgiregistrationnum':'"+goodInfo.bgiregistrationnum+"'});\">"+goodInfo.bgigoodsid + '<input type="hidden" name="goodsInfoTempPo.goodsid" value="' + goodInfo.bgigoodsid +'" /><input type="hidden" id="color" value="' + goodInfo.bgicolor +'" /><input type="hidden" id="spec" value="' + goodInfo.bgispec +'" /><input type="hidden" id="retailprice" value="' + goodInfo.bgiretailprice +'" /><input type="hidden" name="goodsInfoTempPo.costprice" value="' + goodInfo.bgicostprice +'" /><input type="hidden" name="goodsInfoTempPo.nottaxrate" value="' + goodInfo.bginottaxrate +'" /><input type="hidden" name="goodsInfoTempPo.taxrate" value="' + goodInfo.bgitaxrate +'" /><input type="hidden" id="goodsname" value="' + goodInfo.bgigoodsname +'" /><input type="hidden" id="source" value="' + goodInfo.bgisource +'" />';
        c3.innerHTML = goodInfo.bgigoodsname;
		c4.innerHTML = goodInfo.bgispec;
		c5.innerHTML = goodInfo.bgisph;		
		c6.innerHTML = goodInfo.bgicyl;				
		c7.innerHTML = goodInfo.bgicurvature1;
		c8.innerHTML = goodInfo.bgidia;

		var string5='';
		var string6='';
		
		if(goodInfo.bgiusetype=="1"){string5='常带型';}
		else if(goodInfo.bgiusetype=="2"){string5='抛弃型';} 
		else if(goodInfo.bgiusetype=="3"){string5='塑形镜';}
		else{string5='';}
		 c9.innerHTML = string5;
		if(goodInfo.bgistealthclass=="1"){string6='日抛';}
		else if(goodInfo.bgistealthclass=="2"){string6='周抛';} 
		else if(goodInfo.bgistealthclass=="9"){string6='双周抛';}
		else if(goodInfo.bgistealthclass=="3"){string6='月抛';}
		else if(goodInfo.bgistealthclass=="4"){string6='季抛';}
		else if(goodInfo.bgistealthclass=="5"){string6='半年抛';}
		else if(goodInfo.bgistealthclass=="6"){string6='年抛';}
		else if(goodInfo.bgistealthclass=="7"){string6='RGP';}
		else if(goodInfo.bgistealthclass=="8"){string6='塑形镜';}
		else{string6='';}
		c10.innerHTML = string6;
		c11.innerHTML = goodInfo.bgicapacity+'<input type="hidden" id="brandname" value="'+goodInfo.bgibrandname+'"/>';
		c12.innerHTML = goodInfo.bgicapacityentry;
		c13.innerHTML = '<input type="hidden" class="text_input100" maxlength="26" id="bgirksj" index="'+index+'" readonly="readonly" name="goodsInfoTempPo.bgirksj"  value="'+document.all.cstibilldate.value+'" />'+'<input type="text" class="text_input80" id="guaranteeperiod" name="goodsInfoTempPo.guaranteeperiod"  onblur="changebarcode('+index+',$(this));loadSimpleBatch('+index+',$(this).parent().parent().find(\'#pcbarcode\').val(),$(this).parent().parent().find(\'#batch\').val(),this);" value=""/>'
		c14.innerHTML = '<input type="text" class="text_input80" maxlength="15" id="batch" name="goodsInfoTempPo.batch"  value="" onblur="loadSimpleBatch('+index+',$(this).parent().parent().find(\'#pcbarcode\').val(),$(this).val(),this);"/>';
		c15.innerHTML = '<input type="text" class="text_input80" maxlength="15" id="registrationnum" index="'+index+'" name="goodsInfoTempPo.registrationnum"  value="'+goodInfo.bgiregistrationnum +'"/>';
		c16.innerHTML = '<input type="text" class="text_input200" maxlength="26" id="pcbarcode" readonly="readonly" index="'+index+'" name="goodsInfoTempPo.pcbarcode"  value="'+goodInfo.bgipcbarcode.substring(0,24)+'A0'+'" validate="[{\'Type\' : Type.String, \'Formula\' : Formula.notNull, \'Message\' : \'请填写商品条码！\'}]"/>';
		c17.innerHTML = '<input type="text" class="text_input40" maxlength="18" id="quantity" name="goodsInfoTempPo.goodsquantity" onblur="amount();" value="" validate="[{\'Type\' : Type.String, \'Formula\' : Formula.notNull, \'Message\' : \'请填写商品数量！\'},{\'Type\' : Type.String, \'Formula\' : Formula.INT, \'Message\' : \'商品数量应为整数！\'}]"/>';
    	$("#pdiv").hide();
    }
	function openProcurementOrdersValues(objValue,poID){
		
		document.all.cstisourcebillid.value=poID;
		
		var goodInfos = eval('(' + objValue + ')');
		
		for(var i = 0; i < goodInfos.length; i++){
			addRow2(goodInfos[i]);			
		}	
		var ordertype = goodInfos[0].bgigoodsid.substring(0,1);
		$('#goodstype').val(ordertype);
		isshow($('#goodstype').val());
		amount();
		$("input[name='goodsInfoTempPo\\.goodsquantity']").each(function(){
			$(this).bind("keyup",function(){
				$(this).val(
				$(this).val().replace(/[^0-9.][0-9]*/g,'')
				);
			});	
			$(this).bind("blur",function(){
				if(!isNaN($(this).val())){
					$(this).val(
					$(this).val().replace(/[^0-9.][0-9]*/g,'')
					);
				}else{
					$(this).val('');
				}
			});	
		});
	}
	
	function addRow2(goodInfo){
		var table = document.getElementById('addTable');
		index = accAdd(table.rows.length - 1,index);
		
		// 商品id去重
		var chk=document.getElementsByName("chk");
		if(goodInfo.bgigoodsid.substr(0, 1)!='4')
		{
			for(i = 0; i < chk.length; i++){
				if (chk[i].value == goodInfo.bgigoodsid) return;
			}
		}
		
		var row = table.insertRow(table.rows.length);
		row.name="tr"
		var c1 = row.insertCell(0);		//选择
		var c2 = row.insertCell(1);		//代码		
		var c3 = row.insertCell(2);		//名称
		var c4 = row.insertCell(3);		//规格
		var c5 = row.insertCell(4);		//球镜
		var c6 = row.insertCell(5);		//柱镜
		var c7 = row.insertCell(6);		//曲率
		var c8 = row.insertCell(7);		//直径
		var c9 = row.insertCell(8);		//使用类型
		var c10 = row.insertCell(9);	//抛弃型分类
		var c11 = row.insertCell(10);	//主容量
		var c12 = row.insertCell(11);	//次容量
		var c13 = row.insertCell(12);	//效期
		var c14 = row.insertCell(13);	//批号
		var c15 = row.insertCell(14);	//条码
		var c16 = row.insertCell(15);	//数量
		
		c5.group="qj";
		c6.group="zj";
		c7.group="ql";
		c8.group="zhj";
		c9.group="sylx";
		c10.group="pqxfl";
		c11.group="zrl";
		c12.group="crl";
		c13.group="xq";
		c14.group="xq1";
		
		row.className = 'row';
		row.height="26";
		var string6='';
		var string5='';
		c1.innerHTML = '<input id="chk" type="checkbox" value="' + goodInfo.bgigoodsid + '" >';
        c2.innerHTML = "<img src=\"${ctx}/img/newbtn/addgoods_0.png\" onmouseover=\"JavaScript:$(this).attr('src','${ctx }/img/newbtn/addgoods_1.png');\" onmouseout=\"JavaScript:$(this).attr('src','${ctx }/img/newbtn/addgoods_0.png');\" btn=btn title='复制商品' onClick=\"copyRow(this,{'bgigoodsid':'"+goodInfo.bgigoodsid+"','bgigoodsname':'"+goodInfo.bgigoodsname+"','bgispec':'"+goodInfo.bgispec+"','bgisph':'"+goodInfo.bgisph+"','bgicyl':'"+goodInfo.bgicyl+"','bgicurvature1':'"+goodInfo.bgicurvature1+"','bgidia':'"+goodInfo.bgidia+"','bgiusetype':'"+goodInfo.bgiusetype+"','bgistealthclass':'"+goodInfo.bgistealthclass+"','bgicapacity':'"+goodInfo.bgicapacity+"','bgibrandname':'"+goodInfo.bgibrandname+"','bgicapacityentry':'"+goodInfo.bgicapacityentry+"','bgipcbarcode':'"+goodInfo.bgipcbarcode+"','bgigoodsquantity':'','bgisource':'"+goodInfo.bgisource+"','bgiretailprice':'"+goodInfo.bgiretailprice+"','bgicostprice':'"+goodInfo.bgicostprice+"','bginottaxrate':'"+goodInfo.bginottaxrate+"','bgitaxrate':'"+goodInfo.bgitaxrate+"','bgicolor':'"+goodInfo.bgicolor+"','bgiregistrationnum':'"+goodInfo.bgiregistrationnum+"'});\">"+goodInfo.bgigoodsid + '<input type="hidden" name="goodsInfoTempPo.goodsid" value="' + goodInfo.bgigoodsid +'" /><input type="hidden" id="color" value="' + goodInfo.bgicolor +'" /><input type="hidden" id="spec" value="' + goodInfo.bgispec +'" /><input type="hidden" id="retailprice" value="' + goodInfo.bgiretailprice +'" /><input type="hidden" name="goodsInfoTempPo.costprice" value="' + goodInfo.bgicostprice +'" /><input type="hidden" name="goodsInfoTempPo.nottaxrate" value="' + goodInfo.bginottaxrate +'" /><input type="hidden" name="goodsInfoTempPo.taxrate" value="' + goodInfo.bgitaxrate +'" /><input type="hidden" id="goodsname" value="' + goodInfo.bgigoodsname +'" /><input type="hidden" id="source" value="' + goodInfo.bgisource +'" />';
        c3.innerHTML = goodInfo.bgigoodsname;
		c4.innerHTML = goodInfo.bgispec;
		c5.innerHTML = goodInfo.bgisph;		
		c6.innerHTML = goodInfo.bgicyl;				
		c7.innerHTML = goodInfo.bgicurvature1;
		c8.innerHTML = goodInfo.bgidia;
		if(goodInfo.bgiusetype=="1"){string5='常带型';}
		else if(goodInfo.bgiusetype=="2"){string5='抛弃型';} 
		else if(goodInfo.bgiusetype=="3"){string5='塑形镜';} 
		else{string5='';}
		c9.innerHTML = string5;
		if(goodInfo.bgistealthclass=="1"){string6='日抛';}
		else if(goodInfo.bgistealthclass=="2"){string6='周抛';} 
		else if(goodInfo.bgistealthclass=="9"){string6='双周抛';}
		else if(goodInfo.bgistealthclass=="3"){string6='月抛';}
		else if(goodInfo.bgistealthclass=="4"){string6='季抛';}
		else if(goodInfo.bgistealthclass=="5"){string6='半年抛';}
		else if(goodInfo.bgistealthclass=="6"){string6='年抛';}
		else if(goodInfo.bgistealthclass=="7"){string6='RGP';}
		else if(goodInfo.bgistealthclass=="8"){string6='塑形镜';}
		else{string6='';}

		c10.innerHTML = string6;
		c11.innerHTML = goodInfo.bgicapacity+'<input type="hidden" id="brandname" value="'+goodInfo.bgibrandname+'"/>';
		c12.innerHTML = goodInfo.bgicapacityentry;
		c13.innerHTML = '<input type="hidden" class="text_input100" maxlength="26" id="bgirksj" index="'+index+'" readonly="readonly" name="goodsInfoTempPo.bgirksj"  value="'+document.all.cstibilldate.value+'" />'+'<input type="text" class="text_input80" id="guaranteeperiod" name="goodsInfoTempPo.guaranteeperiod"  onblur="changebarcode('+index+',$(this));loadSimpleBatch('+index+',$(this).parent().parent().find(\'#pcbarcode\').val(),$(this).parent().parent().find(\'#batch\').val(),this);" value=""/>'
		c14.innerHTML = '<input type="text" class="text_input80" maxlength="15" id="batch" onblur="loadSimpleBatch('+index+',$(this).parent().parent().find(\'#pcbarcode\').val(),$(this).val(),this);" name="goodsInfoTempPo.batch"  value=""/>'
		c15.innerHTML = '<input type="text" class="text_input200" maxlength="26"  id="pcbarcode" readonly="readonly" index="'+index+'" name="goodsInfoTempPo.pcbarcode"  value="'+goodInfo.bgipcbarcode.substring(0,24)+'A0'+'" validate="[{\'Type\' : Type.String, \'Formula\' : Formula.notNull, \'Message\' : \'请填写商品条码！\'}]"/>';	
		c16.innerHTML = '<input type="text" class="text_input40" maxlength="18" id="quantity" name="goodsInfoTempPo.goodsquantity" onblur="amount();" value="' + goodInfo.bgigoodsquantity +'" validate="[{\'Type\' : Type.String, \'Formula\' : Formula.notNull, \'Message\' : \'请填写商品数量！\'},{\'Type\' : Type.String, \'Formula\' : Formula.INT, \'Message\' : \'商品数量应为整数！\'}]"/>';
    	$("#pdiv").hide();
    }        
    
    function deleteitem(){
    	$('input[id=chk]').each(function(){ 
           	if($(this).is(":checked")){ 
           		$(this).parent().parent().remove(); 
            } 
        }); 

		document.all.chks.checked = false;
		amount();
    }
    /**
	 * 制造商开窗
	 */
	function openSupplier(){
	    var goodscategoryID='';
		
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("selSupplierOpen.action?categoryID_open="+goodscategoryID,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("selSupplierOpen.action?categoryID_open="+goodscategoryID,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		
		document.getElementById('popupTitle').innerHTML="【制造商查询】";
	}
	
	/**
	 * 开窗赋值实现方法
	 */
	function openSupplierValues(json){
		document.getElementById('cstisupplierid').value = json.id;
		document.getElementById('cstisuppliername').value = json.value;
	}
	/**
	 *  checkbox全选
	 */	
	function chkAll(){
        var chks=document.all.chks;

        $('input[id=chk]').each(function(){ 
            $(this).attr("checked",chks.checked);
        });
    }
    
    function amount(){
    	var goodsquantityTotal = 0;
		var goodsquantity = document.getElementsByName("goodsInfoTempPo.goodsquantity");
		
		for(i=0;i<goodsquantity.length;i++){
			if(goodsquantity[i].value == '') continue;
			goodsquantityTotal = (parseFloat(goodsquantityTotal).add(parseFloat(goodsquantity[i].value))).toFixed(0);
		}
		
		document.getElementById("goodsquantityTotal").innerText=goodsquantityTotal;
	}
	
	$(document).ready(function(){
		isshow('${fn:substring(inventoryEntryList[0].cstiegoodsid,0,1) == '' ? fn:substring(goodsInfoPos[0].bgigoodsid,0,1):fn:substring(inventoryEntryList[0].cstiegoodsid,0,1)}');
		amount();
		$("input[name='goodsInfoTempPo\\.goodsquantity']").each(function(){
			$(this).bind("keyup",function(){
				$(this).val(
				$(this).val().replace(/[^0-9.][0-9]*/g,'')
				);
			});	
			$(this).bind("blur",function(){
				if(!isNaN($(this).val())){
					$(this).val(
					$(this).val().replace(/[^0-9.][0-9]*/g,'')
					);
				}else{
					$(this).val('');
				}
			});	
		});
	});
	
	   /**
	*  二维表开窗事件
	*/
	function open2D(){
		if ('${fn:substring(inventoryEntryList[0].cstiegoodsid,0,1) == '' ? fn:substring(goodsInfoPos[0].bgigoodsid,0,1):fn:substring(inventoryEntryList[0].cstiegoodsid,0,1)}' != '4'){
	        alert("请选择隐形镜片商品!");
	        return;
	    }
		 var goodsIdNew='';
		    var goodsNumNew='';
		    $("input[name=goodsInfoTempPo.goodsid]").each(function(){
		    	goodsIdNew=goodsIdNew+$(this).val()+",";
			});
		    $("input[name=goodsInfoTempPo.goodsquantity]").each(function(){
		    	goodsNumNew=goodsNumNew+$(this).val()+",";
			});
		    $('#tdgoodsids').val(goodsIdNew);
		    $('#tdvs').val(goodsNumNew);
	    var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("initGoodsOpen_dimensional.action?tdgoodsids="+$('#tdgoodsids').val()+"&tdvs="+$('#tdvs').val()+"&cstpgoodscategory="+'${fn:substring(inventoryEntryList[0].cstiegoodsid,0,1) == '' ? fn:substring(goodsInfoPos[0].bgigoodsid,0,1):fn:substring(inventoryEntryList[0].cstiegoodsid,0,1)}'+"&bspsuppliername="+EncodeUtf8($('#cstisuppliername').val())+"&cstpsupplierid="+$('#cstisupplierid').val(),970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initGoodsOpen_dimensional.action?tdgoodsids="+$('#tdgoodsids').val()+"&tdvs="+$('#tdvs').val()+"&cstpgoodscategory="+'${fn:substring(inventoryEntryList[0].cstiegoodsid,0,1) == '' ? fn:substring(goodsInfoPos[0].bgigoodsid,0,1):fn:substring(inventoryEntryList[0].cstiegoodsid,0,1)}'+"&bspsuppliername="+EncodeUtf8($('#cstisuppliername').val())+"&cstpsupplierid="+$('#cstisupplierid').val(),screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		
		document.getElementById('popupTitle').innerHTML="【二维表查询】";
	}
	
	// 二维开窗赋值实现方法
	function openGoodsDimensionValues(objValue){
		var goodInfos = eval('(' + objValue + ')');
		
		for(var i = 0; i < goodInfos.length; i++){
		  if(goodInfos[i].v!=''){
			addDimensionRow(goodInfos[i]);	
		  }		
		}
		
		var ordertype = goodInfos[0].goodsid.substring(0,1);
		$('#goodstype').val(ordertype);
		isshow($('#goodstype').val());
		amount();	
	}
	
	function addDimensionRow(goodInfo){
	    var table = document.getElementById('addTable');
	    index = accAdd(table.rows.length - 1,index);
		// 商品id去重
		var chk=document.getElementsByName("chk");
		if(goodInfo.goodsid.substr(0, 1)!='4'){
			for(i = 0; i < chk.length; i++){
				if (chk[i].value == goodInfo.goodsid) return;
			}
		}
		var row = table.insertRow(table.rows.length);
		var c1 = row.insertCell(0);		//选择
		var c2 = row.insertCell(1);		//代码		
		var c3 = row.insertCell(2);		//名称
		var c4 = row.insertCell(3);		//规格
		var c5 = row.insertCell(4);		//球镜
		var c6 = row.insertCell(5);		//柱镜
		var c7 = row.insertCell(6);		//曲率
		var c8 = row.insertCell(7);		//直径
		var c9 = row.insertCell(8);		//使用类型
		var c10 = row.insertCell(9);	//抛弃型分类
		var c11 = row.insertCell(10);	//主容量
		var c12 = row.insertCell(11);	//次容量
		var c13 = row.insertCell(12);	
		var c14 = row.insertCell(13);	
		var c15 = row.insertCell(14);	
		var c16 = row.insertCell(15);
				
		c5.group="qj";
		c6.group="zj";
		c7.group="ql";
		c8.group="zhj";
		c9.group="sylx";
		c10.group="pqxfl";
		c11.group="zrl";
		c12.group="crl";
		c13.group="xq";
		c14.group="xq1";
		
		row.className = 'row';
		row.height="26";
		var string6='';
		var string5='';
		c1.innerHTML = '<input id="chk" type="checkbox" value="' + goodInfo.goodsid + '" >';
        c2.innerHTML = "<img src=\"${ctx}/img/newbtn/addgoods_0.png\" onmouseover=\"JavaScript:$(this).attr('src','${ctx }/img/newbtn/addgoods_1.png');\" onmouseout=\"JavaScript:$(this).attr('src','${ctx }/img/newbtn/addgoods_0.png');\" btn=btn title='复制商品' onClick=\"copyRow(this,{'bgigoodsid':'"+goodInfo.bgigoodsid+"','bgigoodsname':'"+goodInfo.bgigoodsname+"','bgispec':'"+goodInfo.bgispec+"','bgisph':'"+goodInfo.bgisph+"','bgicyl':'"+goodInfo.bgicyl+"','bgicurvature1':'"+goodInfo.bgicurvature1+"','bgidia':'"+goodInfo.bgidia+"','bgiusetype':'"+goodInfo.bgiusetype+"','bgistealthclass':'"+goodInfo.bgistealthclass+"','bgicapacity':'"+goodInfo.bgicapacity+"','bgibrandname':'"+goodInfo.bgibrandname+"','bgicapacityentry':'"+goodInfo.bgicapacityentry+"','bgipcbarcode':'"+goodInfo.bgipcbarcode+"','bgigoodsquantity':'','bgisource':'"+goodInfo.bgisource+"','bgiretailprice':'"+goodInfo.bgiretailprice+"','bgicostprice':'"+goodInfo.bgicostprice+"','bginottaxrate':'"+goodInfo.bginottaxrate+"','bgitaxrate':'"+goodInfo.bgitaxrate+"','bgicolor':'"+goodInfo.bgicolor+"','bgiregistrationnum':'"+goodInfo.bgiregistrationnum+"'});\">"+goodInfo.bgigoodsid + '<input type="hidden" name="goodsInfoTempPo.goodsid" value="' + goodInfo.bgigoodsid +'" /><input type="hidden" id="color" value="' + goodInfo.bgicolor +'" /><input type="hidden" id="spec" value="' + goodInfo.bgispec +'" /><input type="hidden" id="retailprice" value="' + goodInfo.bgiretailprice +'" /><input type="hidden" name="goodsInfoTempPo.costprice" value="' + goodInfo.bgicostprice +'" /><input type="hidden" name="goodsInfoTempPo.nottaxrate" value="' + goodInfo.bginottaxrate +'" /><input type="hidden" name="goodsInfoTempPo.taxrate" value="' + goodInfo.bgitaxrate +'" /><input type="hidden" id="goodsname" value="' + goodInfo.bgigoodsname +'" /><input type="hidden" id="source" value="' + goodInfo.bgisource +'" />';
        c3.innerHTML = goodInfo.goodsName;
		c4.innerHTML = goodInfo.spec;
		
		c5.innerHTML = goodInfo.sph;
		c6.innerHTML = goodInfo.cyl;
		c7.innerHTML = goodInfo.curvature1;
		c8.innerHTML = goodInfo.dia;
		if(goodInfo.bgiusetype=="1"){string5='常带型';}
		else if(goodInfo.bgiusetype=="2"){string5='抛弃型';} 
		else if(goodInfo.bgiusetype=="3"){string5='塑形镜';} 
		else{string5='';}
		c9.innerHTML = string5;
		if(goodInfo.bgistealthclass=="1"){string6='日抛';}
		else if(goodInfo.bgistealthclass=="2"){string6='周抛';} 
		else if(goodInfo.bgistealthclass=="9"){string6='双周抛';}
		else if(goodInfo.bgistealthclass=="3"){string6='月抛';}
		else if(goodInfo.bgistealthclass=="4"){string6='季抛';}
		else if(goodInfo.bgistealthclass=="5"){string6='半年抛';}
		else if(goodInfo.bgistealthclass=="6"){string6='年抛';}
		else if(goodInfo.bgistealthclass=="7"){string6='RGP';}
		else if(goodInfo.bgistealthclass=="8"){string6='塑形镜';}
		else{string6='';}
		c10.innerHTML = string6;
		c11.innerHTML = goodInfo.bgicapacity+'<input type="hidden" id="brandname" value="'+goodInfo.bgibrandname+'"/>';
		c12.innerHTML = goodInfo.bgicapacityentry;
		c13.innerHTML = '<input type="text" class="text_input80" id="guaranteeperiod" name="goodsInfoTempPo.guaranteeperiod" onblur="changebarcode('+index+',$(this));loadSimpleBatch('+index+',$(this).parent().parent().find(\'#pcbarcode\').val(),$(this).parent().parent().find(\'#batch\').val(),this);" value=""/>'
		c14.innerHTML = '<input type="text" class="text_input80" maxlength="15" id="batch"  onblur="changebarcode('+index+',$(this));loadSimpleBatch('+index+',$(this).parent().parent().find("#pcbarcode").val(),$(this).val(),this);" name="goodsInfoTempPo.batch"  value=""/>'
		c15.innerHTML = '<input type="text" class="text_input200" onblur="loadSimpleBatch('+index+',$(this).parent().parent().find(\'#pcbarcode\').val(),$(this).val(),this);" maxlength="26"  id="pcbarcode" readonly="readonly" index="'+index+'" name="goodsInfoTempPo.pcbarcode"  value="'+goodInfo.pcbarcode.substring(0,24)+'A0'+'" validate="[{\'Type\' : Type.String, \'Formula\' : Formula.notNull, \'Message\' : \'请填写商品条码！\'}]"/>';
		c16.innerHTML = '<input type="text" class="text_input40" maxlength="18" id="quantity" name="goodsInfoTempPo.goodsquantity" onblur="amount();" value="'+goodInfo.v+'" validate="[{\'Type\' : Type.String, \'Formula\' : Formula.notNull, \'Message\' : \'请填写商品数量！\'},{\'Type\' : Type.String, \'Formula\' : Formula.INT, \'Message\' : \'商品数量应为整数！\'}]"/>';
		
		$("input[name='goodsInfoTempPo\\.goodsquantity']").each(function(){
			$(this).bind("keyup",function(){
				$(this).val(
				$(this).val().replace(/[^0-9.][0-9]*/g,'')
				);
			});	
			$(this).bind("blur",function(){
				if(!isNaN($(this).val())){
					$(this).val(
					$(this).val().replace(/[^0-9.][0-9]*/g,'')
					);
				}else{
					$(this).val('');
				}
			});	
		});
		$("#pdiv").hide();
    } 
     function deleterow(goodInfo){
    	// 商品id去重
		var table = document.getElementById('addTable');
		
		$("input[id=chk]").each(function(){
         	if($(this).val()== goodInfo.bgigoodsid){
			   $(this).parent().parent().remove();	
           }
		});
		
		amount();
		$("#pdiv").hide();
    } 
        
    function setValue(billid,id,name,type){
    	var cstibillid = $('#cstibillid').val();
		procurementReceiptForm.action="initInsertProcurementReceipt.action?hid="+billid+"&type="+type+"&cstibillid="+cstibillid;
		procurementReceiptForm.submit();
    }
    
    function isshow(ordertype){
    	if(ordertype==""){
    		type = $('#cstpgoodscategory').val();
    	}else{
    		type = ordertype;
    		$('#cstpgoodscategory').val(ordertype);
    	}
    	
    	if(type == ""){
    		$('#div_goodslist').attr("style","display: none;");
    	}else{
    		if(type == "1"){
    		
    			$('[group*=]').show();
    			$('[group=qj]').hide();
    			$('[group=zj]').hide();
    			$('[group=zx]').hide();
    			$('[group=ql]').hide();
    			$('[group=xq]').hide();
    			$('[group=zhj]').hide();
    			$('#heji').attr("colSpan","6");
    			
    		}else if(type == "2"){
    		
    			$('[group*=]').show();
    			$('[group=ys]').hide();
    			$('[group=qj]').hide();
    			$('[group=zj]').hide();
    			$('[group=zx]').hide();
    			$('[group=ql]').hide();
    			$('[group=xq]').hide();
    			$('[group=zhj]').hide();
    			$('#heji').attr("colSpan","5");
    			
    		}else if(type == "3"){
    		
    			$('[group*=]').show();
    			$('[group=ql]').hide();
    			$('[group=xq]').hide();
    			$('#heji').attr("colSpan","10");
    			
    		}else if(type == "4"){
    		
    			$('[group*=]').show();
    			$('[group=zrl]').hide();
    			$('[group=crl]').hide();
    			$('#heji').attr("colSpan","14");
    			
    		}else if(type == "5"){
    		
    			$('[group*=]').show();
    			$('[group=sylx]').hide();
    			$('[group=qj]').hide();
    			$('[group=zj]').hide();
    			$('[group=pqxfl]').hide();
    			$('[group=ql]').hide();
    			
    			$('[group=zhj]').hide();
    			$('#heji').attr("colSpan","10");
    			
    		}else if(type == "6"){
    		
    			$('[group*=]').show();
    			$('[group=ys]').hide();
    			$('[group=qj]').hide();
    			$('[group=zj]').hide();
    			$('[group=zx]').hide();
    			$('[group=ql]').hide();
    			$('[group=xq]').hide();
    			$('[group=zhj]').hide();
    			$('#heji').attr("colSpan","5");
    			
    		}else if(type == "7"){
    		
    			$('[group*=]').show();
    			$('[group=ys]').hide();
    			$('[group=qj]').hide();
    			$('[group=zj]').hide();
    			$('[group=zx]').hide();
    			$('[group=ql]').hide();
    			$('[group=xq]').hide();
    			$('[group=zhj]').hide();
    			$('#heji').attr("colSpan","5");
    			
    		}
    		
    		$('#div_goodslist').attr("style","display:");
    	}
    }  
    
    function changebarcode(index,obj){
		if(!obj.val()){
			return;
		}
   	   	
   	   	if(!/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})/.test(obj.val())&&obj.val()){
			alert("日期格式不正确！\n如：2013-04-01");
			obj.val("");
			obj.focus();
			return;
   	   	}
   	 	var str =obj.val();
   		str = str.replace(/-/g,"/");
   		var monthpart = str.split("/")[1];
   		if(monthpart == 0){
			alert("日期月份格式不正确！");
			obj.val("");
			obj.focus();
			return;
   	   	}
   		var daypart = str.split("/")[2];
   		if(daypart == 0){
			alert("日期天格式不正确！");
			obj.val("");
			obj.focus();
			return;
   	   	}
   		var date = new Date(str );
   		obj.val(ChangeDateToString(date));

   		if(isNaN(obj.val().substring(0,4))){
			alert("日期格式不正确！\n例如：2013-04-01");
			obj.val("");
			obj.focus();
			return;
		}

		if(obj.val().substring(0,4) < new Date().getYear()){
			alert("日期格式不正确，失效日期不得小于当前年份！");
			obj.val("");
			obj.focus();
			return;
		}
   		
   	   	if(obj.val().length==10){
	   		var pclength = obj.val().length;
	   		var pcvalue = obj.val();
	   		
	   		if(pclength < 8){
	   			for(pclength ; pclength < 8; pclength++){
	   				pcvalue = pcvalue + '0';
	   			}
	   		}else if(pclength > 8){
	   			pcvalue=pcvalue.substring(pclength-8,pclength);
	   		}	
	   		
	   		var tmvalue = $(obj).parent().parent().find("#pcbarcode").val().substring(0,18);
	   		var xqvalue = $(obj).val().replace(/\-/g,"").substring(2);
	   		var bcvalue = $(obj).parent().parent().find("#pcbarcode").val().substring(24,26);
	   		$(obj).parent().parent().find("input[id=pcbarcode][index="+index+"]").val(tmvalue+xqvalue+bcvalue);
   	   	}
   	}
   	
   	function changebarcodeload(index,obj){
		if(!obj.val()){
			return;
		}
   	   	
   	   	if(!/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})/.test(obj.val())&&obj.val()){
			alert("日期格式不正确！\n如：2013-04-01");
			obj.val("");
			obj.focus();
			return;
   	   	}
   	 	var str =obj.val();
   		str = str.replace(/-/g,"/");
   		var monthpart = str.split("/")[1];
   		if(monthpart == 0){
			alert("日期月份格式不正确！");
			obj.val("");
			obj.focus();
			return;
   	   	}
   		var daypart = str.split("/")[2];
   		if(daypart == 0){
			alert("日期天格式不正确！");
			obj.val("");
			obj.focus();
			return;
   	   	}
   		var date = new Date(str );
   		obj.val(ChangeDateToString(date));

   		if(isNaN(obj.val().substring(0,4))){
			alert("日期格式不正确！\n例如：2013-04-01");
			obj.val("");
			obj.focus();
			return;
		}

		if(obj.val().substring(0,4) < new Date().getYear()){
			alert("日期格式不正确，失效日期不得小于当前年份！");
			obj.val("");
			obj.focus();
			return;
		}
   		
   	   	if(obj.val().length==10){
	   		var pclength = obj.val().length;
	   		var pcvalue = obj.val();
	   		
	   		if(pclength < 8){
	   			for(pclength ; pclength < 8; pclength++){
	   				pcvalue = pcvalue + '0';
	   			}
	   		}else if(pclength > 8){
	   			pcvalue=pcvalue.substring(pclength-8,pclength);
	   		}	
	   		
	   		var tmvalue = $(obj).parent().parent().find("#pcbarcode").val().substring(0,18);
	   		var xqvalue = $(obj).val().replace(/\-/g,"").substring(2);
	   		var bcvalue = $(obj).parent().parent().find("#pcbarcode").val().substring(24,26);
	   		$(obj).parent().parent().find("input[id=pcbarcode][index="+index+"]").val(tmvalue+xqvalue+bcvalue);
   	   	}
   	}

    function loadSimpleBatch(index,barcode,batch,obj){
   	   	if(($(obj).attr("id") == "batch"&&$(obj).parent().parent().find("#guaranteeperiod").val() != "")||($(obj).attr("id") == "guaranteeperiod"&&$(obj).parent().parent().find("#batch").val() != "")){
	   	   	$.ajax({           
		   	 	type: "POST",          
	   	   	    url: "getAjaxSimpleBatch.action",          
	   	   	    async: true, 
	   	   	    data: "barcode="+barcode+"&batch="+batch,     
	   	   	    success: function(msg){
		   	   		var barcodestr = $(obj).parent().parent().find("#pcbarcode").val();   
		   	   	    $(obj).parent().parent().find("input[id=pcbarcode][index="+index+"]").val(barcodestr.substring(0,24)+msg);                       
	   	   	    }    
		   	});
   	   	}
    }
   	
   	
   	function check()
    {
      if(document.all.cstiauditstate1.checked==true)
      {
      	document.all.cstiauditstate.checked = true;	
      }else
      {
      	document.all.cstiauditstate.checked = false;	
      }
    }
    
     function check1()
    {
      if(document.all.cstiauditstate.checked==true)
      {
      	document.all.cstiauditstate1.checked = true;	
      }else
      {
      	document.all.cstiauditstate1.checked = false;	
      }
    }

     function copyRow(obj,json){     	
        if (typeof(json.bgipcbarcode) == 'undefined' || json.bgipcbarcode == ''){
        	json.bgipcbarcode = json.bgigoodsid.replace(/\./g,  "").toUpperCase()+'00000000';
        }
        addCopyRow(obj,json);
		isshow('${fn:substring(inventoryEntryList[0].cstiegoodsid,0,1) == '' ? fn:substring(goodsInfoPos[0].bgigoodsid,0,1):fn:substring(inventoryEntryList[0].cstiegoodsid,0,1)}');
     	amount();

 		$("input[name='goodsInfoTempPo\\.goodsquantity']").each(function(){
 			$(this).bind("keyup",function(){
 				$(this).val(
 				$(this).val().replace(/[^0-9.][0-9]*/g,'')
 				);
 			});
 			$(this).bind("blur",function(){
 				if(!isNaN($(this).val())){
 					$(this).val(
 					$(this).val().replace(/[^0-9.][0-9]*/g,'')
 					);
 				}else{
 					$(this).val('');
 				}
 			});	
 		});
 		
 	}

	function addCopyRow(obj,goodInfo){
	    var table = document.getElementById('addTable');
	    index = accAdd(table.rows.length - 1,index);
	    //alert(index);
		var htmltr  = document.createElement("tr");
		var c1 = document.createElement("td");
		var c2 = document.createElement("td");
		var c3 = document.createElement("td");
		var c4 = document.createElement("td");
		var c5 = document.createElement("td");
		var c6 = document.createElement("td");
		var c7 = document.createElement("td");
		var c8 = document.createElement("td");
		var c9 = document.createElement("td");
		var c10 = document.createElement("td");
		var c11 = document.createElement("td");
		var c12 = document.createElement("td");
		var c13 = document.createElement("td");
		var c14 = document.createElement("td");
		var c15 = document.createElement("td");
		var c16 = document.createElement("td");
		var c17 = document.createElement("td");

		htmltr.name="tr";	        
		htmltr.className = 'row';
		htmltr.height="26";		
			
		c5.group="qj";
		c6.group="zj";
		c7.group="ql";
		c8.group="zhj";
		c9.group="sylx";
		c10.group="pqxfl";
		c11.group="zrl";
		c12.group="crl";
		c13.group="xq";
		c14.group="xq1";
		c15.group="xq2";

		var string6='';
		var string5='';
		
		if(goodInfo.bgiusetype=="1"){string5='常带型';}
		else if(goodInfo.bgiusetype=="2"){string5='抛弃型';} 
		else if(goodInfo.bgiusetype=="3"){string5='塑形镜';} 
		else{string5='';}

		if(goodInfo.bgistealthclass=="1"){string6='日抛';}
		else if(goodInfo.bgistealthclass=="2"){string6='周抛';} 
		else if(goodInfo.bgistealthclass=="9"){string6='双周抛';}
		else if(goodInfo.bgistealthclass=="3"){string6='月抛';}
		else if(goodInfo.bgistealthclass=="4"){string6='季抛';}
		else if(goodInfo.bgistealthclass=="5"){string6='半年抛';}
		else if(goodInfo.bgistealthclass=="6"){string6='年抛';}
		else if(goodInfo.bgistealthclass=="7"){string6='RGP';}
		else if(goodInfo.bgistealthclass=="8"){string6='塑形镜';}
		else{string6='';}

        if (typeof(goodInfo.guaranteeperiod) == 'undefined'){
        	goodInfo.guaranteeperiod = '';
        }
        if (typeof(goodInfo.batch) == 'undefined'){
        	goodInfo.batch = '';
        }

		c1.innerHTML = '<input id="chk" type="checkbox" value="' + goodInfo.bgigoodsid + '" >';
        c2.innerHTML = "<img src=\"${ctx}/img/newbtn/addgoods_0.png\" onmouseover=\"JavaScript:$(this).attr('src','${ctx }/img/newbtn/addgoods_1.png');\" onmouseout=\"JavaScript:$(this).attr('src','${ctx }/img/newbtn/addgoods_0.png');\" btn=btn title='复制商品' onClick=\"copyRow(this,{'bgigoodsid':'"+goodInfo.bgigoodsid+"','bgigoodsname':'"+goodInfo.bgigoodsname+"','bgispec':'"+goodInfo.bgispec+"','bgisph':'"+goodInfo.bgisph+"','bgicyl':'"+goodInfo.bgicyl+"','bgicurvature1':'"+goodInfo.bgicurvature1+"','bgidia':'"+goodInfo.bgidia+"','bgiusetype':'"+goodInfo.bgiusetype+"','bgistealthclass':'"+goodInfo.bgistealthclass+"','bgicapacity':'"+goodInfo.bgicapacity+"','bgibrandname':'"+goodInfo.bgibrandname+"','bgicapacityentry':'"+goodInfo.bgicapacityentry+"','bgipcbarcode':'"+goodInfo.bgipcbarcode+"','bgigoodsquantity':'','bgisource':'"+goodInfo.bgisource+"','bgiretailprice':'"+goodInfo.bgiretailprice+"','bgicostprice':'"+goodInfo.bgicostprice+"','bginottaxrate':'"+goodInfo.bginottaxrate+"','bgitaxrate':'"+goodInfo.bgitaxrate+"','bgicolor':'"+goodInfo.bgicolor+"','bgiregistrationnum':'"+goodInfo.bgiregistrationnum+"'});\">"+goodInfo.bgigoodsid + '<input type="hidden" name="goodsInfoTempPo.goodsid" value="' + goodInfo.bgigoodsid +'" /><input type="hidden" id="color" value="' + goodInfo.bgicolor +'" /><input type="hidden" id="spec" value="' + goodInfo.bgispec +'" /><input type="hidden" id="retailprice" value="' + goodInfo.bgiretailprice +'" /><input type="hidden" name="goodsInfoTempPo.costprice" value="' + goodInfo.bgicostprice +'" /><input type="hidden" name="goodsInfoTempPo.nottaxrate" value="' + goodInfo.bginottaxrate +'" /><input type="hidden" name="goodsInfoTempPo.taxrate" value="' + goodInfo.bgitaxrate +'" /><input type="hidden" id="goodsname" value="' + goodInfo.bgigoodsname +'" /><input type="hidden" id="source" value="' + goodInfo.bgisource +'" />';
        c3.innerHTML = goodInfo.bgigoodsname;
		c4.innerHTML = goodInfo.bgispec;
		c5.innerHTML = goodInfo.bgisph;		
		c6.innerHTML = goodInfo.bgicyl;				
		c7.innerHTML = goodInfo.bgicurvature1;
		c8.innerHTML = goodInfo.bgidia;
		c9.innerHTML = string5;
		c10.innerHTML = string6;		
		c11.innerHTML = goodInfo.bgicapacity+'<input type="hidden" id="brandname" value="'+goodInfo.bgibrandname+'"/>';
		c12.innerHTML = goodInfo.bgicapacityentry;
		
		c13.innerHTML = '<input type="hidden" class="text_input100" maxlength="26" id="bgirksj" index="'+index+'" readonly="readonly" name="goodsInfoTempPo.bgirksj"  value="'+document.all.cstibilldate.value+'" />'+'<input type="text" class="text_input80" id="guaranteeperiod" name="goodsInfoTempPo.guaranteeperiod" onblur="changebarcode('+index+',$(this));loadSimpleBatch('+index+',$(this).parent().parent().find(\'#pcbarcode\').val(),$(this).parent().parent().find(\'#batch\').val(),this);" value="' + goodInfo.guaranteeperiod +'"/>'
		c14.innerHTML = '<input type="text" class="text_input80" maxlength="15" id="batch" onblur="loadSimpleBatch('+index+',$(this).parent().parent().find(\'#pcbarcode\').val(),$(this).val(),this);" name="goodsInfoTempPo.batch"  value="' + goodInfo.batch +'"/>';
		c15.innerHTML = '<input type="text" class="text_input80" maxlength="15" id="registrationnum" index="'+index+'" name="goodsInfoTempPo.registrationnum"  value="'+goodInfo.bgiregistrationnum +'"/>';
		c16.innerHTML = '<input type="text" class="text_input200" maxlength="26"  id="pcbarcode" readonly="readonly" index="'+index+'" name="goodsInfoTempPo.pcbarcode"  value="'+goodInfo.bgipcbarcode.substring(0,24)+'A0'+'" validate="[{\'Type\' : Type.String, \'Formula\' : Formula.notNull, \'Message\' : \'请填写商品条码！\'}]"/>';	
		c17.innerHTML = '<input type="text" class="text_input40" maxlength="18" id="quantity" name="goodsInfoTempPo.goodsquantity" onblur="amount();" value="' + goodInfo.bgigoodsquantity +'" validate="[{\'Type\' : Type.String, \'Formula\' : Formula.notNull, \'Message\' : \'请填写商品数量！\'},{\'Type\' : Type.String, \'Formula\' : Formula.INT, \'Message\' : \'商品数量应为整数！\'}]"/>';

		htmltr.appendChild(c1);
		htmltr.appendChild(c2);
		htmltr.appendChild(c3);
		htmltr.appendChild(c4);
		htmltr.appendChild(c5);
		htmltr.appendChild(c6);
		htmltr.appendChild(c7);
		htmltr.appendChild(c8);
		htmltr.appendChild(c9);
		htmltr.appendChild(c10);
		htmltr.appendChild(c11);
		htmltr.appendChild(c12);
		htmltr.appendChild(c13);
		htmltr.appendChild(c14);
		htmltr.appendChild(c15);
		htmltr.appendChild(c16);
		htmltr.appendChild(c17);

		obj.parentNode.parentNode.insertBefore(htmltr);
	} 

    function ChangeDateToString(DateIn){
    	   var Year=0;
    	   var Month= 0;
    	   var Day =0;
    	   var CurrentDate = "";
    	 
    	   //初始化时间
    	     
    	       Year  =DateIn.getYear();
    	    
    	       Month =DateIn.getMonth()+1;
    	    
    	       Day =DateIn.getDate();
    	    
    	       CurrentDate =Year +"-";
    	    
    	       
    	   if(Month >=10)
    	   {
    	     CurrentDate  =CurrentDate +Month + "-";
    	   }else{
    	     CurrentDate =CurrentDate+"0"+Month +"-";
    	   }
    	   if(Day >=10){
    	     CurrentDate=CurrentDate +Day;
    	   }else{
    	     CurrentDate =CurrentDate +"0"+Day;
    	   }
    	     
    	   return CurrentDate;
    	    
    	   }
    	   
   	function isshowpdiv(obj,v){
   		if($(obj).val() != v){
   			$("#pdiv").hide();
   		}
   	}
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="procurementReceiptForm" method="post" action="">
<input type="hidden" name="type" id="type" value="" /> 
<input type="hidden" name="moduleID" value="${requestScope.moduleID}">
<input type="hidden" id="goodstype" name="goodstype" value="${goodstype }">
<input type="hidden" id="person" value="${person.id }"/>
<input type="hidden" id="tdgoodsids" name="tdgoodsids" value="${tdgoodsids }" />
<input type="hidden" id="tdvs" name="tdvs" value="${tdvs }" />
<input type="hidden" id="ioru" name="ioru" value="u" />
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <tr height="20"><td></td></tr>
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
                <TD 
                style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; PADDING-TOP: 5px; HEIGHT: 100px" 
                vAlign=top><DIV id=tabContent__1>
                  <DIV>
					<table width="100%" id="title0"  border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                      <TBODY>
                        <TR>
                          <TD width="5%"><div align="left"><img src="${ctx}/img/pic/danjutou.gif" width="86" height="20" ></div></TD>
                          <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                        </TR>
                      </TBODY>
                    </TABLE>                  
                    <TABLE cellSpacing=1 cellPadding=3 width="100%" align=center 
                  border=0>
                      <TBODY>
                        <TR>
                          <TD height="27" width="9%" class="table_body" height="27">单据编号</TD>
                          <TD width="23%" class="table_none">${inventoryPo.cstibillid}<input type="hidden" id="cstibillid" name="inventoryPo.cstibillid" value="${inventoryPo.cstibillid}"></TD>
                         
                          <TD height="27" width="9%" class="table_body" height="27">订单单号</TD>
                          <TD width="23%" class="table_none">${inventoryPo.cstisourcebillid}&nbsp;<input type="hidden" name="inventoryPo.cstisourcebillid" id="cstisourcebillid" value="${inventoryPo.cstisourcebillid}" /></TD>
                          <TD height="27" width="9%" class="table_body">入库类型</TD>
                          <TD class="table_none">${inventoryPo.cstigoodscategoryname}
                          <input type="hidden" name="inventoryPo.cstibilltypeid" id="cstibilltypeid" value="${inventoryPo.cstibilltypeid}" /> 
                          <input type="hidden" id="cstigoodscategory" value="${fn:substring(inventoryEntryList[0].cstiegoodsid,0,1) == '' ? fn:substring(goodsInfoPos[0].bgigoodsid,0,1):fn:substring(inventoryEntryList[0].cstiegoodsid,0,1)}" /> 
						  </TD>
                        </TR>
                        <TR>  
						  <TD height="27" class="table_body">制造商</TD>
						   <TD class="table_none">
                                ${inventoryPo.cstisuppliername}
                                <input type="hidden" id="cstisuppliername" value="${inventoryPo.cstisuppliername}"/>
						   		<input type="hidden" id="cstisupplierid" name="inventoryPo.cstisupplierid" value="${inventoryPo.cstisupplierid}" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '所属制造商不能为空！'}]"/>
						   </TD>
						   <TD class="table_body" height="27">收入仓位</TD>
                           <TD class="table_none" >
                            <select id="cstiinstockid" name="inventoryPo.cstiinstockid" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '请选择收入仓位！'}]">
      		                   <option value="">请选择收入仓位</option>
      		                  <s:iterator value="warehouselist">
				               <option value="${bwhid}" ${inventoryPo.cstiinstockid == bwhid ? 'selected="selected"' : '' }>${bwhwarehouseName}</option>
	     	                  </s:iterator>
      	                    </select>
                           </TD>
                          <TD width="9%" class="table_body">运单号</TD>
                          <TD class="table_none"><input type="text" class="text_input160" name="inventoryPo.deliveryID" id="deliveryID" value="${inventoryPo.deliveryID }" maxlength="32"/></TD>
						</TR>
						<TR>
                          <TD height="27" class="table_body" >制单人</TD>
                          <TD class="table_none" >${inventoryPo.csticreatepersonname}<input type="hidden" name="inventoryPo.csticreateperson" value="${inventoryPo.csticreateperson}"></TD>
 						  <TD class="table_body" height="27">单据日期</TD>
                          <TD class="table_none" colspan="3">
                          ${fn:substring(inventoryPo.cstibilldate,0,10)}
                          <inputc id="cstibilldate" class="text_input200" name="inventoryPo.cstibilldate" type="hidden" value="${fn:substring(inventoryPo.cstibilldate,0,10)}"/></TD>
                        </TR>
                        <TR>
                          <TD height="27" class="table_body">备注</TD>
                          <TD class="table_none" colSpan=5><label>
                          <textarea id="textarea" name="inventoryPo.cstiremark">${inventoryPo.cstiremark}</textarea>
                          </label></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
                        <TR>
                          <TD align="left" width="60%">
						   <img src="${ctx}/img/newbtn/btn_addgoods_0.png" btn=btn title="单品添加商品" 
						  onClick="javascript:openGoodSingle();">
						 <!--  <img src="${ctx}/img/newbtn/btn_acgddgoods_0.png" btn=btn title="按采购订单添加商品" 
						  onClick="javascript:openOrders();"> -->
						  <img id="pdiv" src="${ctx}/img/newbtn/btn_printbarcode_0.png" btn=btn title="打印条码" id="addGodos"
					      onClick="javascript:batPrintGoodsBarCode();">
					     </TD>
					     <TD align="right" width="40%">
					      <img src="${ctx }/img/newbtn/btn_delete_0.png" btn=btn title="删除" onClick="deleteitem();" >
                         </TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <div id="div_goodslist" style="display: none;">
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                        <TR>
                          	<TD align="left">
                          		<li class="horizontal_onlyRight">
                          		<img id="button1" src="${ctx}/img/newbtn/btn_save_0.png" onmouseover="JavaScript:$(this).attr('src','${ctx }/img/newbtn/btn_save_1.png');" onmouseout="JavaScript:$(this).attr('src','${ctx }/img/newbtn/btn_save_0.png');" title='保存' onclick="save();">
                          		</li>
                          		<c:if test="${(permissionPo.keyk==1)}">
                          		<li class="horizontal_onlyRight">
                          		<input type="checkbox" id="cstiauditstate1" onclick="check()" value="1">保存并审核
                          		</li>
                          		</c:if>
                           	</TD>
					   </TR>
                    </TABLE>
					<table width="100%"   border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                       <TBODY>
                         <TR>
                           <TD width="5%"><div align="left"><img src="${ctx}/img/pic/danjuti.gif" width="86" height="20"></div></TD>
                           <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                         </TR>
                       </TBODY>
                    </TABLE>
					<table id="addTable" width="100%" border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder">
                      <TBODY>
                        <TR class=table_title align=middle>
                          <TH width="8%" height="27" scope=col>全选<input type="checkbox" id="chks" onclick="chkAll()"></TH>                        
                          <TH width="14%" scope=col>商品代码</TH>
                         
                          <TH width="13%" scope=col>商品名称</TH>
                          <TH width="5%" scope=col>型号</TH>
                         <TH width="6%" scope=col group=qj>球镜</TH>
                          <TH width="6%" scope=col group=zj>柱镜</TH>
                          <TH width="6%" scope=col group=ql>曲率</TH>
                          <TH width="6%" scope=col group=zhj>直径</TH>
                          <TH width="6%" scope=col group=sylx>使用类型 </TH>
                          <TH width="6%" scope=col group=pqxfl>抛弃型分类</TH> 
                          <TH width="6%" scope=col group=zrl>主容量</TH>
                          <TH width="6%" scope=col group=crl>次容量</TH> 
                          <TH width="6%" scope=col group=xq>效期</TH>
                          <TH width="6%" scope=col group=xq>批号</TH>
                          <TH width="6%" scope=col group=xq>注册证号</TH>
                          <TH width="8%" scope=col>商品条码</TH>
                          <TH width="5%" scope=col>数量</TH>                           
                        </TR>
                        <TR class=table_title align=middle> 
						  	<TH width="40%" height="27" id="heji" colSpan=12 scope=col align="right">合计：&nbsp;&nbsp;&nbsp;&nbsp;</TH>
					    	<TH scope=col width="5%" id="goodsquantityTotal">0</TH>
				   		</TR>
                        <s:iterator value="inventoryEntryList" status="idx">
                        <TR class="row">
                        <TD height="26"><input id="chk" type="checkbox" value="${cstiegoodsid}" ></TD>
                        <TD><img src="${ctx}/img/newbtn/addgoods_0.png" btn=btn title='复制商品' onClick="copyRow(this,{'bgigoodsid':'${cstiegoodsid}','bgigoodsname':'${cstiegoodsname }','bgispec':'${cstiespec}','bgisph':'${cstiesph}','bgicyl':'${cstiecyl}','bgicurvature1':'${cstiecurvature1}','bgidia':'${cstiedia}','bgiusetype':'${bgiusetype}','bgistealthclass':'${bgistealthclass}','bgicapacity':'${bgicapacity}','bgibrandname':'${cstiebrandname}','bgicapacityentry':'${bgicapacityentry}','bgipcbarcode':'','bgigoodsquantity':'','bgisource':'${cstiesource}','bgiretailprice':'${cstieretailprice}','bgicostprice':'${cstiecostprice}','bginottaxrate':'${cstienottaxrate}','bgitaxrate':'${cstietaxrate}','bgicolor':'${cstiecolor}','bgiregistrationnum':'${cstieregistrationnum}'});">${cstiegoodsid}
                        <input type="hidden" name="goodsInfoTempPo.goodsid" value="${cstiegoodsid}" />
                        <input type="hidden" name="goodsInfoTempPo.goodsbarcode" value="${fncstiebarcode}" />
                        <input type="hidden" name="goodsInfoTempPo.costprice" value="${cstiecostprice}" />
                        <input type="hidden" name="goodsInfoTempPo.nottaxrate" value="${cstienottaxrate}" />
                        <input type="hidden" name="goodsInfoTempPo.taxrate" value="${cstietaxrate}" />
                        <input type="hidden" id="goodsname" value="${cstiegoodsname}" />
                        <input type="hidden" id="brandname" value="${cstiebrandname}" />
                        <input type="hidden" id="source" value="${cstiesource}" />
                        <input type="hidden" id="spec" value="${cstiespec}" />
                        <input type="hidden" id="color" value="${cstiecolor}" />
                        <input type="hidden" id="retailprice" value="${cstieretailprice}" />
                        </TD>
                        	
                        <TD>${cstiegoodsname}</TD>
                        <TD>${cstiespec}</TD>
                                               
                        <TD group=qj>${cstiesph}</TD>
                        <TD group=zj>${cstiecyl}</TD>
                        <TD group=ql>${cstiecurvature1}</TD>
                        <TD group=zhj>${cstiedia}</TD>
                        <TD group=sylx><c:if test="${bgiusetype=='1'}"> 常带型</c:if>
		                          	<c:if test="${bgiusetype=='2'}">抛弃型</c:if>
		                          	<c:if test="${bgiusetype=='3'}">塑形镜</c:if>	 </TD>
                          <TD group=pqxfl><c:if test="${bgistealthclass=='1'}"> 日抛</c:if>
		                          	<c:if test="${bgistealthclass=='2'}"> 周抛</c:if>
		                          	<c:if test="${bgistealthclass=='9'}"> 双周抛</c:if>
		                          	<c:if test="${bgistealthclass=='3'}"> 月抛</c:if>		
		                          	<c:if test="${bgistealthclass=='4'}"> 季抛</c:if>
		                          	<c:if test="${bgistealthclass=='5'}"> 半年抛</c:if>
		                          	<c:if test="${bgistealthclass=='6'}"> 年抛</c:if>	  
		                          	<c:if test="${bgistealthclass=='7'}"> RGP</c:if>
		                          	<c:if test="${bgistealthclass=='8'}"> 塑形镜</c:if>
		                  </TD> 
                          <TD group=zrl>${bgicapacity}</TD>
                          <TD group=crl>${bgicapacityentry}</TD> 
                        <TD group=xq><input type="hidden" class="text_input100" maxlength="26" id="bgirksj"  readonly="readonly" name="goodsInfoTempPo.bgirksj"  value="${fn:substring(inventoryPo.cstibilldate,0,10)}" /><input type="text" class="text_input80" id="guaranteeperiod" name="goodsInfoTempPo.guaranteeperiod" onblur="changebarcodeload('${idx.index }',$(this));loadSimpleBatch('${idx.index }',$(this).parent().parent().find('#pcbarcode').val(),$(this).parent().parent().find('#batch').val(),this);isshowpdiv(this,'${cstieguaranteeperiod}');" value="${cstieguaranteeperiod}"/></TD>
						<TD group=xq><input type="text" class="text_input80" maxlength="15" id="batch" onblur="loadSimpleBatch('${idx.index }',$(this).parent().parent().find('#pcbarcode').val(),$(this).val(),this);isshowpdiv(this,'${cstiebatch}');" name="goodsInfoTempPo.batch"  value="${cstiebatch}"/></TD>
						<TD group=xq><input type="text" class="text_input80" maxlength="15" id="registrationnum" name="goodsInfoTempPo.registrationnum"  value="${cstieregistrationnum}"/></TD>
                        <td><input type="text" class="text_input200" onBlur="barcodes('${cstiegoodsid}',this)" maxlength="26" name="goodsInfoTempPo.pcbarcode" id="pcbarcode" readonly="readonly" index="${idx.index }" value='${cstiebarcode}' /></td>
                        <TD><input type="text" class="text_input40" id="quantity" name="goodsInfoTempPo.goodsquantity" onblur="amount();" value="${cstiegoodsquantity}" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '请填写商品数量！'},{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '商品数量应为整数！'}]"/></TD>                                                                        
                        </TR>
                        </s:iterator>
                        
                        <c:forEach var="po" items="${goodsInfoPos}">
				   		<TR class="row">
                        <TD height="26"><input id="chk" type="checkbox" value="${po.bgigoodsid}" ></TD>
                        <TD><img src="${ctx}/img/newbtn/addgoods_0.png" btn=btn title='复制商品' onClick="copyRow(this,{'bgigoodsid':'${po.bgigoodsid}','bgigoodsname':'${po.bgigoodsname }','bgispec':'${po.bgispec}','bgisph':'${po.bgisph}','bgicyl':'${po.bgicyl}','bgicurvature1':'${po.bgicurvature1}','bgidia':'${po.bgidia}','bgiusetype':'${po.bgiusetype}','bgistealthclass':'${po.bgistealthclass}','bgicapacity':'${po.bgicapacity}','bgibrandname':'${po.bgibrandname}','bgicapacityentry':'${po.bgicapacityentry}','bgipcbarcode':'','bgigoodsquantity':'','bgisource':'${po.bgisource}','bgiretailprice':'${po.bgiretailprice}','bgicostprice':'${po.bgicostprice}','bginottaxrate':'${po.bginottaxrate}','bgitaxrate':'${po.bgitaxrate}','bgicolor':'${po.bgicolor}'});">${po.bgigoodsid}
                        <input type="hidden" name="goodsInfoTempPo.goodsid" value="${po.bgigoodsid}" />
                        <input type="hidden" name="goodsInfoTempPo.goodsbarcode" value="${po.bgigoodsbarcode}" />
                        <input type="hidden" name="goodsInfoTempPo.costprice" value="${po.bgicostprice}" />
                        <input type="hidden" name="goodsInfoTempPo.nottaxrate" value="${po.bginottaxrate}" />
                        <input type="hidden" name="goodsInfoTempPo.taxrate" value="${po.bgitaxrate}" />
                        <input type="hidden" id="goodsname" value="${po.bgigoodsname}" />
                        <input type="hidden" id="brandname" value="${po.bgibrandname}" />
                        <input type="hidden" id="source" value="${po.bgisource}" />
                        <input type="hidden" id="spec" value="${po.bgispec }" />
                        <input type="hidden" id="color" value="${po.bgicolor}" />
                        <input type="hidden" id="retailprice" value="${po.bgiretailprice}" />
                        </TD>
                        	
                        <TD>${po.bgigoodsname}</TD>
                        <TD>${po.bgispec }</TD>
                                               
                        <TD group=qj>${po.bgisph }</TD>
                        <TD group=zj>${po.bgicyl }</TD>
                        <TD group=ql>${po.bgicurvature1}</TD>
                        <TD group=zhj>${po.bgidia}</TD>
                        <TD group=sylx>
                        <c:if test="${po.bgiusetype=='1'}"> 常带型</c:if>
		                <c:if test="${po.bgiusetype=='2'}">抛弃型</c:if>	 
		                </TD>
                          <TD group=pqxfl>	
                          			<c:if test="${po.bgistealthclass=='1'}"> 日抛</c:if>
		                          	<c:if test="${po.bgistealthclass=='2'}"> 周抛</c:if>
		                          	<c:if test="${po.bgistealthclass=='9'}"> 双周抛</c:if>
		                          	<c:if test="${po.bgistealthclass=='3'}"> 月抛</c:if>		
		                          	<c:if test="${po.bgistealthclass=='4'}"> 季抛</c:if>
		                          	<c:if test="${po.bgistealthclass=='5'}"> 半年抛</c:if>
		                          	<c:if test="${po.bgistealthclass=='6'}"> 年抛</c:if>	  
		                          	<c:if test="${po.bgistealthclass=='7'}"> RGP</c:if>
		                          	<c:if test="${bgistealthclass=='8'}"> 塑形镜</c:if>
		                </TD> 
		                <TD group=zrl>${po.bgicapacity}</TD>
                        <TD group=crl>${po.bgicapacityentry}</TD> 
                        <TD group=xq><input type="hidden"  id="bgirksj"  readonly="readonly" name="goodsInfoTempPo.bgirksj"  value="${fn:substring(inventoryPo.cstibilldate,0,10)}" /><input type="text" class="text_input80" id="guaranteeperiod" name="goodsInfoTempPo.guaranteeperiod" onblur="changebarcode('${idx.index }',$(this));loadSimpleBatch('${idx.index }',$(this).parent().parent().find('#pcbarcode').val(),$(this).parent().parent().find('#batch').val(),this);" onchange="isshowpdiv();" value=""/></TD>
						<TD group=xq><input type="text" class="text_input80" maxlength="15" id="batch" onblur="loadSimpleBatch('${idx.index }',$(this).parent().parent().find('#pcbarcode').val(),$(this).val(),this);isshowpdiv();" name="goodsInfoTempPo.batch"  value=""/></TD>
						<td><input type="text" class="text_input200" onBlur="barcodes('${po.bgigoodsid}',this);" maxlength="26" name="goodsInfoTempPo.pcbarcode" id="pcbarcode" readonly="readonly" index="${idx.index }" value='${po.bgigoodsbarcode}' /></td>
                        <TD><input type="text" class="text_input40" id="quantity" name="goodsInfoTempPo.goodsquantity" onblur="amount();" value="${po.bgigoodsquantity }" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '请填写商品数量！'},{'Type' : Type.String, 'Formula' : Formula.INT, 'Message' : '商品数量应为整数！'}]"/></TD>                                                                        
                        </TR>
				   		</c:forEach>    
                      </TBODY>
                    </TABLE>
                    </div>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                        <TR>
                          	<TD align="left">
                          		<li class="horizontal_onlyRight">
                          		<img id="button1" src="${ctx}/img/newbtn/btn_save_0.png" onmouseover="JavaScript:$(this).attr('src','${ctx }/img/newbtn/btn_save_1.png');" onmouseout="JavaScript:$(this).attr('src','${ctx }/img/newbtn/btn_save_0.png');" title='保存' onclick="save();">
                          		</li>
                          		<c:if test="${(permissionPo.keyk==1)}">
                          		<li class="horizontal_onlyRight">
                          		<input type="checkbox" id="cstiauditstate" onclick="check1()" name="inventoryPo.cstiauditstate" value="1">保存并审核
                          		</li>
                          		</c:if>
                           	</TD>
					   </TR>
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
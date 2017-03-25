<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" src="${ctx }/js/orderItem.js"></script>
<title>商品退货</title>
</head>
<script>
	function save(){
	if(checkForm(document.all.preSalesForm)){ 
		var table = document.getElementById('addTable');
		var total = 0;
		$("input[id=departmentIds]").each(function() {
			if($(this).attr("disabled") == false && 
					$(this).attr("checked") == true) {

				total++;
			}
			//alert("disabled:" + $(this).attr("disabled"));
			//alert("checked:" + $(this).attr("checked"));
		})
		if(total <= 0) {
			alert("请选择销售门店!");
			return;
		}
		
		//判断商品数量是否为空
		var goodsquantityArray = document.getElementsByName("preSalesPo.salesQuantities");
		var goodsquantityCount=0;
		for(i=0;i<goodsquantityArray.length;i++){
			if(goodsquantityArray[i].value=="0"){
				alert("计划销售数量不能为0！");
				goodsquantityArray[i].focus();
				goodsquantityArray[i].select();
				return;	
			}
			goodsquantityCount++;
		}
		if(goodsquantityCount==0){
          alert('请选择计划销售品种!');
          return false;
        }
        
			$("img").removeAttr("onclick");
			preSalesForm.action = "insertSetPreSales.action";
			preSalesForm.submit();
		}
	}
	
	function openGoodSingle(){
		var supplierID=document.all.cstisupplierid.value;
		var categoryID_open='';
	    if(supplierID==''){
	      alert('请选择所属制造商');
	      return false;
	    }	
		
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initGoodsSingleSel.action?categoryID_open="+categoryID_open+"&supplierID_open=" + supplierID,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initGoodsSingleSel.action?categoryID_open="+categoryID_open+"&supplierID_open=" + supplierID,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【商品查询】";
	}
	
	function openOrders(){	
		var supplierID=document.all.cstisupplierid.value;
		var categoryID_open='';
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
			showPopWin("initProcurementOrdersOpen.action?poType="+poType+"&supplierID=" + supplierID,970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initProcurementOrdersOpen.action?poType="+poType+"&supplierID=" + supplierID,screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		document.getElementById('popupTitle').innerHTML="【采购订单查询】";
	}
	
	function openGoodSingleValues(objValue){
		var goodInfos = eval('(' + objValue + ')');
		
		for(var i = 0; i < goodInfos.length; i++){
			if('${systemParameterPo.fspstealtheffective}' == '1' || '${systemParameterPo.fspstealtheffective}' == '2'){	
				if(goodInfos[i].bgigoodsid.substring(0,1) == '4' || goodInfos[i].bgigoodsid.substring(0,1) == '5'){
					addRow(goodInfos[i]);
				}else{
					addRowUpdateNumber(goodInfos[i]);
				}	
			}else{
				addRowUpdateNumber(goodInfos[i]);
			}
		}
		
		for(var j = 0; j < goodInfos.length; j++){
			var gsize = goodInfos[j].bginumber;
			for(var h = 0; h < gsize; h++){
				searchBar(goodInfos[j].bgigoodsbarcode);
			}
		}
		
		document.getElementById('cstisupplierid').value = goodInfos[0].bgisupplierid;
		document.getElementById('cstisuppliername').value = goodInfos[0].bgisuppliername;
		amount();
	}
	
	$(document).ready(function() { 
		$("img[btn=btn]").attr("style","cursor: hand"); 
		$("img[btn=btn]").mouseover(function () { 
		$(this).attr("src",$(this).attr("src").replace("0","1")); 
		}).mouseout(function () { 
		$(this).attr("src",$(this).attr("src").replace("1","0")); 
		}); 
		<s:iterator value="preDepPoList">
			setCheckDp('${prePlanDepId }');
		</s:iterator>
	});
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
	function openGoodSingle(){
		var total = 0;
		$("input[id=departmentIds]").each(function() {
			if($(this).attr("disabled") == false && 
					$(this).attr("checked") == true) {

				total++;
			}
			//alert("disabled:" + $(this).attr("disabled"));
			//alert("checked:" + $(this).attr("checked"));
		})
		if(total <= 0) {
			alert("请选择销售门店!");
			return;
		}
		var supplierID=$("#cstisupplierid").val();
		var categoryID_open='';	
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		
		if(is_iPad()){
			showPopWin("initBrandPriceSel4.action?whichretail=1&select_retail=1",970,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}else{
			showPopWin("initBrandPriceSel4.action?whichretail=1&select_retail=1",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),false);
		}
		
		document.getElementById('popupTitle').innerHTML="【品种添加】";
	}
	
	function openGoodSingleValues(objValue){
		var goodInfos = eval('(' + objValue + ')');
		for(goodsI = 0; goodsI < goodInfos.length; goodsI++){
			addRow(goodInfos[goodsI]);
		}
	}
	function addRow(goodInfo){
		var table = document.getElementById('addTable');
		var index = table.rows.length - 1;
		
		// 商品id去重
		var chk=document.getElementsByName("chk");
		for(i = 0; i < chk.length; i++){
			if (chk[i].value == goodInfo.goodsid) return;
		}
		
		var row = table.insertRow(table.rows.length);
		var c1 = row.insertCell(0);
		var c2 = row.insertCell(1);
		var c3 = row.insertCell(2);
		var c4 = row.insertCell(3);
		//var c5 = row.insertCell(4);
		var c5 = row.insertCell(4);
		
		
		row.className = 'row';
		row.height="26";
		c1.innerHTML = '<input id="chk" name="chk" type="checkbox" value="' + goodInfo.brands + '" >';
        c2.innerHTML = goodInfo.brands + '<input type="hidden" id="brandIds" name="preSalesPo.brandIds" value="' + goodInfo.bbdid +'" />'+ '<input type="hidden" name="preSalesPo.supplierAndBrandIds" id="supplierAndBrandIds" value="' + goodInfo.brands +'" />';
        c3.innerHTML = goodInfo.bbdbrandname+ '<input type="hidden" id="brandNames" name="preSalesPo.brandNames" value="' + goodInfo.bbdbrandname +'" />';
		c4.innerHTML = goodInfo.bspsuppliername+ '<input type="hidden" name="preSalesPo.supplierNames" id="suppliername" value="' + goodInfo.bspsuppliername +'" />'+ '<input type="hidden" id="supplierid" name="preSalesPo.supplierIds" value="' + goodInfo.bbdsupplierid +'" />';
		//c5.innerHTML = goodInfo.bbdretailprice+ '<input type="hidden" id="retailprice" name="brandTempPo.retailprice" value="' + goodInfo.bbdretailprice +'" />';
		c5.innerHTML = '<input  type="text" id="quantity" onblur="amount()" onKeyUp="value=value.replace(\/[^\\d]\/g,\'\')"  name="preSalesPo.salesQuantities" value="" class="text_input60" validate="[{\'Type\' : Type.String, \'Formula\' : Formula.notNull, \'Message\' : \'数量不能为空!\'}]" />';	
		
		$('#del' + index).btn().init();
		$("#bgiwhichretail").val(goodInfo.bbdwhichretail);
		$("#td_whichretail").text("零售价格"+goodInfo.bbdwhichretail);
    }
	//子页面删除单行
	function openGoodSingleDeleteValues(objValue){
		var goodInfos = eval('(' + objValue + ')');
		
		for(var i = 0; i < goodInfos.length; i++){
			deleterow(goodInfos[i]);
		}
	}
	function deleterow(goodInfo){
    	// 商品id去重
		var table = document.getElementById('addTable');
		$("input[id=chk]").each(function(){
			
         	if($(this).val()== goodInfo.brands){
			   $(this).parent().parent().remove();	
           }
		});
    }
	
	  function deleteitem(){
			var chk=document.getElementsByName("chk");
			var table = document.getElementById('addTable');
			for(i = 0; i < chk.length; i++){
				if (chk[i].checked ) {
					var curRow = chk[i].parentNode.parentNode;		
					table.deleteRow(curRow.rowIndex);
					i = -1;
				}
			}
			document.all.chks.checked = false;
	 
			if($("[id=addTable]>tbody").children("tr").length == 1){
				$("#bgiwhichretail").val("");
				$("#td_whichretail").text(" ");
			}
			amount();
	    }

	function amount() {
		var sum = 0;
		$("input[id=quantity]").each(function() {
			sum = new Number(sum) + new Number($(this).val());
		})
		$("TH[id=goodsquantityTotal]").html(sum);
	}
	function today(){
		var now = new Date().format("yyyy-MM-dd");  //设置你想要的格式
		document.getElementById('startDate').value = now;
		document.getElementById('endDate').value = now;		
	}
	
	function checkAll() {
		$("input[id=chk]").each(function() {
			$(this).attr("checked", $("#chks").attr("checked"));
		});
	}
	
	function checkDp() {
		$("input[id=departmentIds]").each(function() {
			if($(this).attr("disabled") == "") {
				$(this).attr("checked", $("input[id=all]").attr("checked"));
			}
		})
	}

	function setCheckDp(departmentId) {
		$("input[id=departmentIds]").each(function() {
			if($(this).val() == departmentId) {
				$(this).attr("checked", "checked");
				$(this).attr("disabled", "disabled");
				$(this).parents("td").attr("style", "color:red");
			}
		})
	}

	function insertPrePlan() {
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("initInsertPrePlan.action",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("initInsertPrePlan.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【计划销售表名称新增】";
	}
	function delBrand(obj) {
		//alert($("input[id=chk]").length);
		if($("input[id=chk]").length > 0 && obj.checked == false) {
			if(confirm("是否将品种清空?")) {
				$("input[id=chk]").each(function() {
					$(this).parent().parent().remove();
				})
			}
		}
	}
	function openPrePlan() {
		var topRows = top.document.getElementById("total").rows;
		var topCols = top.document.getElementById("btmframe").cols;
		if(is_iPad()){
			showPopWin("selPrePlanOpen.action",970,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}else{
			showPopWin("selPrePlanOpen.action",screen.width-100,screen.height-200,topRows,topCols,returnRefresh(true),true);
		}
		document.getElementById('popupTitle').innerHTML="【计划销售表名称查询】";
	}
	function setPrePlanIdAndName(id, name) {
		$("#planName").val(name);
		$("#planId").val(id);
		preSalesForm.action = 'initInsertSetPreSales.action';
		preSalesForm.submit();
	}
	function batchUpdate() {
		var val = $("#batchValue").val();
		if($("input[id=chk]").length <= 0) {
			alert("请先添加品种!");
		} else {
			if(!val) {
				alert("请填入数量!");
				$("#batchValue").focus();
			} else {
				$("input[id=quantity]").val(val);
			}
		}	
	}
</script>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="preSalesForm" method="post" action="">
<input type="hidden" name="type" id="type" value="" /> 
<input type="hidden" name="moduleID" value="${requestScope.moduleID}" />
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><br/>
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
                    <TABLE cellSpacing=1 cellPadding=0 width="100%" align=center class="privateBorder"
                  border=0>
                      <TBODY>
                        <TR height="26">
                          <TD width="10%" align="center" class="table_body">
                           	 计划名称
                          </TD>
                          <TD width="40%" class="table_none">
                          <li class="horizontal_onlyRight">
                            <input type="text" class="text_input160" id="planName" name="prePlanPo.planName" value="${requestScope.prePlanPo.planName }" readonly="readonly" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '计划销售名称不能为空!'}]"/>
                          </li>
                            <input type="hidden" id="planId" name="prePlanPo.planId" value="${requestScope.prePlanPo.planId }" validate="[{'Type' : Type.String, 'Formula' : Formula.notNull, 'Message' : '计划销售名称不能为空!'}]"/>
                          </li>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                          <li class="horizontal_onlyRight">
                          <img src="${ctx }/img/newbtn/btn_change_0.png" btn=btn title='选择' onclick="openPrePlan()" >
                          </li> &nbsp;&nbsp;&nbsp;&nbsp;
                          <li class="horizontal_onlyRight">
                          <img src="${ctx }/img/newbtn/btn_planinsert_0.png" btn=btn title='新增计划' onclick="insertPrePlan()" >
                          </li>
                          </TD>
                          <TD width="10%" align="center" class="table_body" colspan="3">
                            	计划日期
                          </TD>
                          <TD width="25%" class="table_none">
                          	${fn:substring(requestScope.prePlanPo.startDate, 0, 10) }&nbsp;${(requestScope.prePlanPo.startDate eq null || requestScope.prePlanPo.startDate eq null) ? "" : "至" }&nbsp;${fn:substring(requestScope.prePlanPo.endDate, 0, 10) }
                          </TD>
						</TR>
                        <TR height="40">
                          <TD width="10%" align="center" class="table_body">门店名称</TD>
                          <TD width="90%" class="table_none" colspan="5">
                          	<table>
                          		<tr>
                          			<td colspan="7"><input id="all" type="checkbox" value="" onclick="checkDp()"/>全选</td>
                          		</tr>
                          	<s:iterator value="departmentsList" status="indexFlag">
                          		${indexFlag.index mod 7 eq 0 ? "<tr>" : "" }
                          		<td>
                          			<input id="departmentIds" name="preSalesPo.departmentIds" type="checkbox" value="${bdpdepartmentid }" onclick="delBrand(this)"/>${bdpdepartmentname }&nbsp;
                          		</td>
                          		${indexFlag.index mod 7 eq 6 ? "</tr>" : "" }
                          	</s:iterator>
                          	</table>
                          </TD>					       
						</TR>
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                      <TBODY>
                        <TR>
                          <TD align="left">
						   <img src="${ctx}/img/newbtn/btn_ppaddgoods_0.png" btn=btn title="添加品种" onClick="javascript:openGoodSingle();">
						   <img id="del" src="${ctx }/img/newbtn/btn_delete_0.png" btn=btn title='删除' onClick="deleteitem();"></br>
                           <li class="horizontal_onlyRight">
						   <input class="text_input80" id="batchValue" type="text" maxlength="18" onKeyUp="value=value.replace(/[^\d]/g,'')"/>
						   </li>
                           <li class="horizontal_onlyRight">
						   <img src="${ctx }/img/newbtn/btn_plxg_0.png" btn=btn title='批量修改' onClick="batchUpdate()">
						   </li>
                         </TD>
                        </TR>
                      </TBODY>
                    </TABLE>
					<table width="100%"   border=0 align=center cellpadding=0 cellspacing=0 class="privateTable">
                       <TBODY>
                         <TR>
                           <TD width="5%"><div align="left"><img src="${ctx}/img/pic/danjuti.gif" width="86" height="20"></div></TD>
                           <TD width="95%" background="${ctx}/img/pic/msgbg.png" >&nbsp;</TD>
                         </TR>
                       </TBODY>
                    </TABLE>
					<TABLE id="addTable" width="100%" border=0 align=center cellpadding=1 cellspacing=1 class="privateBorder">
                      <TBODY>
                        <TR class=table_title align=middle>
                          <TH width="7%" height="26" scope=col>全选<input type="checkbox" id="chks" onclick="checkAll()"></TH>                        
                          <TH width="15%" scope=col>品种代码</TH>
                          <TH width="20%" scope=col>品种名称</TH>
                          <TH width="20%" scope=col>制造商名称</TH>
                          <TH width="20%" scope=col>计划销售数量</TH>
                        </TR>
                        <TR class=table_title align=middle> 
						  	<TH width="40%" height="26"  colSpan=4 scope=col align="right">合计：&nbsp;&nbsp;&nbsp;&nbsp;</TH>
						  	<TH scope=col width="5%" id="goodsquantityTotal">0</TH>
				   		</TR>
                      </TBODY>
                    </TABLE>
                    <TABLE id=ctl00_PageBody_PostButton cellSpacing=1 cellPadding=3 width="100%" align=center border=0>
                        <TR>
                          <TD align="left">
                          	<li class="horizontal_onlyRight">

                          		<img id="button1" src="${ctx}/img/newbtn/btn_save_0.png" btn=btn  title='保存' onclick="save();">
                          	</li>
                          	<%--<li class="horizontal_onlyRight">
                          		<input type="checkbox" id="cstiauditstate" name="inventoryPo.cstiauditstate" value="1">保存并审核
                          	</li>--%>
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
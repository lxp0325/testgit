<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<input type="hidden" id="showhider" name="showhider" value="${requestScope.showhider}">
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<c:set var="paginationName" value="pagination" />

<c:if test="${not empty param.pageIndex}">
    <c:set var="paginationName" value="${paginationName}${param.pageIndex}" />
</c:if>

<c:set var="pagination" value="${requestScope[paginationName]}" />

<c:if test="${not empty param.modelName}">
    <c:set var="pagination" value="${requestScope[param.modelName][paginationName]}" />
</c:if>
<script>
function doList1(link,perPage_Select,perPage_Text_Hidden,objOne){
  	document.all[perPage_Text_Hidden].value = objOne.value;
  	var firstFrom = document.forms[0]; 
  	link=link.replace(/(&?)showhider=[^&]+/g,"")+"&showhider="+$('#showhider').val();
  	link=link.replace(/(&?)perPage=[^&]+/g,"")+"&perPage="+objOne.value;
  	firstFrom.action=link;
  	$("img").removeAttr("onclick");
  	firstFrom.submit();
	showLoadingBar2();
}

function changePage(link,obj){
	if(event.keyCode==13){		
		$("img").removeAttr("onclick");
	    var firstFrom = document.forms[0];
	  	firstFrom.action=link.replace(/(&?)showhider=[^&]+/g,"")+$(obj).val()+"&showhider="+$('#showhider').val();
	  	firstFrom.submit();
		showLoadingBar2();
	}
}

function changeLink(obj,link){
    $("img").removeAttr("onclick");
    var firstFrom = document.forms[0];
    showLoadingBar2();
    firstFrom.action=link.replace(/(&?)showhider=[^&]+/g,"")+"&showhider="+$('#showhider').val();
    firstFrom.submit();
}

function showLoadingBar2(){
	try{  
		if(typeof(eval(showLoadingBar))=="function"){
			showLoadingBar();
		}
	}catch(e){
	}
}


</script>
<table width="100%">
	<tr>
		<td style="text-align: left;">
		共&nbsp;<c:out value="${pagination.total}" />&nbsp;条数据&nbsp;&nbsp;&nbsp;&nbsp;当前第&nbsp;<c:out value="${pagination.pageNo}" />&nbsp;页/共&nbsp;<c:out value="${pagination.totalPage}" />&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;每页显示
		<%--每页顯示--%>
			<select id="perPageSelect" name="perPageSelect" onchange="doList1('<c:out value="${pagination.startLink}"/>','perPage','perPageNo',this);">
				
				<c:if test="${pagination.pageSize=='10'}">
					<option value="10" selected><c:out value="${pagination.pageSize}" /></option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</c:if>
				
				<c:if test="${pagination.pageSize=='15'}">
					<option value="15" selected><c:out value="${pagination.pageSize}" /></option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</c:if>
				
				<c:if test="${pagination.pageSize=='20'}">
					<option value="20" selected><c:out value="${pagination.pageSize}" /></option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="30">30</option>
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</c:if>
				
				<c:if test="${pagination.pageSize=='30'}">
					<option value="30" selected><c:out value="${pagination.pageSize}" /></option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>					
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</c:if>
				
				<c:if test="${pagination.pageSize=='50'}">
					<option value="50" selected><c:out value="${pagination.pageSize}" /></option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</c:if>
				
				<c:if test="${pagination.pageSize=='100'}">
					<option value="100" selected><c:out value="${pagination.pageSize}" /></option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="50">50</option>
					<option value="200">200</option>
				</c:if>
								
				<c:if test="${pagination.pageSize=='200'}">
					<option value="200" selected><c:out value="${pagination.pageSize}" /></option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="50">50</option>
					<option value="100">100</option>
				</c:if>
			</select>
			条记录
		</td>
		<td style="text-align: right;width: 140px;padding-top: 3px;">
			<c:choose>
				<c:when test="${pagination.previousPage}">
					<li class="horizontal_onlyRight"><a onclick="changeLink(this,'${pagination.startLink}')" style="cursor: hand;" ><img src="${ctx}/img/pic/firstPage.png" border="0" /><%--首页--%></a></li>
				</c:when>
				<c:otherwise><li class="horizontal_onlyRight"><img src="${ctx}/img/pic/firstPage_bw.png" title="首页" /><%--首页--%></li></c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${pagination.previousPage}">
					<li class="horizontal_onlyRight"><a onclick="changeLink(this,'${pagination.previousLink}')" style="cursor: hand;" ><img src="${ctx}/img/pic/previousPage.png" border="0" /><%--上一页--%></a></li>
				</c:when>
				<c:otherwise><li class="horizontal_onlyRight"><img src="${ctx}/img/pic/previousPage_bw.png" title="上一页" /><%--上一页--%></li></c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${pagination.nowLink}">
				<li class="horizontal_onlyRight"><input class="text_input40" type="text" id="currentPageNo"  value="${pagination.pageNo}" onkeyup="changePage('<c:out value="${pagination.nowLink}"/>');"/></li>
				</c:when>
				<c:otherwise><li class="horizontal_onlyRight"><input class="text_input40" type="text" id="currentPageNo" value="${pagination.pageNo}" onkeyup="changePage('<c:out value="${pagination.nowLink}"/>',this);"/></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${pagination.nextPage}">
					<li class="horizontal_onlyRight"><a onclick="changeLink(this,'${pagination.nextLink}')" style="cursor: hand;"><img src="${ctx}/img/pic/nextPage.png" border="0" /><%--下一页--%></a></li>
				</c:when>
				<c:otherwise><li class="horizontal_onlyRight"><img src="${ctx}/img/pic/nextPage_bw.png" title="下一页" /><%--下一页--%></li></c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${pagination.nextPage}">
					<li class="horizontal_onlyRight"><a onclick="changeLink(this,'${pagination.endLink}')" style="cursor: hand;" ><img src="${ctx}/img/pic/lastPage.png" border="0" /><%--尾页--%></a></li>
				</c:when>
				<c:otherwise><li class="horizontal_onlyRight"><img src="${ctx}/img/pic/lastPage_bw.png" title="尾页" /><%--尾页--%></li></c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>

<input type="hidden" name="perPageNo" id="perPageNo" value='<c:out value="${pagination.pageSize}" />' />

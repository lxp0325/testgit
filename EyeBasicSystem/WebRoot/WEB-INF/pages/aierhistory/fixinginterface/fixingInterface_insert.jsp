<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script language="javascript" src="${ctx}/js/orderItem.js"></script>
		<title>屈光检查</title>
	</head>
	<script type="text/javascript">
	function save(){
		if(checkForm(refractiveForm)){
			$("img").removeAttr("onclick");
			refractiveForm.action="insertFixingInterfaceAier.action?source=refractiveiou";
			refractiveForm.submit();
		}
	}

	$(document).ready(function() {
		document.getElementById('smecimemberid').readOnly = true;
	});

	function refractive(){
		$("img").removeAttr("onclick");
		refractiveForm.action="refractiveToolAier.action?source=refractiveiou";
		refractiveForm.submit();
	}
	
	function inspection(){
		$("img").removeAttr("onclick");
		refractiveForm.action="inspectionToolAier.action?source=inspectioniou";
		refractiveForm.submit();
	}
	function contactGlass(){
		refractiveForm.action="contactGlassToolAier.action?source=contactGlassiou";
		$("img").removeAttr("onclick");
		refractiveForm.submit();
	}
	function doubleEyeFun(){
		$("img").removeAttr("onclick");
		refractiveForm.action="doubleEyeFunToolAier.action?source=doubleeyefuncopy";
		refractiveForm.submit();
	}
	function specialCheck(){
		$("img").removeAttr("onclick");
		refractiveForm.action="specialCheckToolAier.action?source=specialcheckcopy";
		refractiveForm.submit();
	}

	function refractiveCopy(){
		$("img").removeAttr("onclick");
		location.href="refractiveCopyAier.action?chuyanfuyan="+'${chuyanfuyan}'+"&oldOptometryID="+'${oldOptometryID}'+"&customerID="+'${customerID }'+"&optometryBasicID="+'${copyBasicOptometryID}'+"&moduleID="+'${moduleID}'+"&optometryID="+'${optometryID}';
	}
	
	function glassHistory(){
		if('${customerInfoPo.smecicustomerid }'==''){
			alert('请输入顾客卡号!');
			return;
		}
		refractiveForm.action="selectGlassesHistoryAier.action?customerID="+'${customerInfoPo.smecicustomerid }';
		refractiveForm.submit();
	}
	
	function cornealContactlLens(){
		$("img").removeAttr("onclick");
		refractiveForm.action="cornealContactlLensToolAier.action?source=cornealContactlLensu";
		refractiveForm.submit();
	}

	function fixingInterface(){
		$("img").removeAttr("onclick");
		refractiveForm.action="fixingInterfaceToolAier.action?source=fixingInterfacecopy";
		refractiveForm.submit();
	}
</script>
<%@ include file="/commons/uploadFile.jsp" %>
<body  ${sessionScope.systemParameterPo.fsprightshowurl eq '1' ? 'onkeydown="KeyDown()" oncontextmenu="event.returnValue=false" onhelp="Showhelp();return false;"' : '' }>
<form name="refractiveForm" method="post" action="">
<input type="hidden" name="customerID" value="${requestScope.customerID}" /> 
<input type="hidden" name="optometryBasicID"  value="${requestScope.optometryBasicID}" /> 
<input type="hidden" name="optometryID"  value="${requestScope.optometryID}" />  
<input type="hidden" name="chuyanfuyan"  value="${requestScope.chuyanfuyan}" />  
<input type="hidden" name="oldOptometryID"  value="${requestScope.oldOptometryID}" />
<input type="hidden" name="oldOptometryIDFirst"  value="${requestScope.oldOptometryIDFirst}" />  
<input type="hidden" id="moduleID" name="moduleID" value="${moduleID }"/>

<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR>
					<TD>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
						<TBODY>
						<TR><!--ťStart-->
							<TD style="PADDING-LEFT: 2px; HEIGHT: 22px"  background=${ctx }/img/pic/tab_top_bg.gif>
								<TABLE cellSpacing=0 cellPadding=0 border=0>
				 				<TBODY>
				 				<tr>
				 				<c:if test="${(permissionPo.keya==1)}">
				 					<TD>
									  <TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
										<TBODY>
										<TR>
					                      <TD width=3><IMG id=tabImgLeft__1 height=22 
					                        src="${ctx}/img/pic/tab_unactive_left.gif" width=3></TD>
					                      <TD class=tab id=tabLabel__1                       
					                      background=${ctx}/img/pic/tab_unactive_bg.gif 
					                      onclick="glassHistory()"
					                      UNSELECTABLE="on">戴镜史</TD>
					                      <TD width=3><IMG id=tabImgRight__1 height=22 
					                        src="${ctx}/img/pic/tab_unactive_right.gif" 
					                    width=3></TD>
					                </TR>
									</TBODY>
								  </TABLE>
								  </TD>
					            </c:if>				 				
 
							  <TD>
						 		<TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
									  <TD width=3><IMG id=tabImgLeft__1 height=22 
											src="${ctx }/img/pic/tab_unactive_left.gif" width=3></TD>
									  <TD class=tab id=tabLabel__1 
										  onclick="refractive()" 
										  background=${ctx }/img/pic/tab_unactive_bg.gif
										  UNSELECTABLE="on">屈光检查</TD>
									  <TD width=3><IMG id=tabImgRight__1 height=22 
										src="${ctx }/img/pic/tab_unactive_right.gif" 
										width=3></TD>
									</TR>
									</TBODY>
								  </TABLE>
							  </TD>
								<TD>
								 <TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
										<TBODY>
											<TR>
												  <TD width=3><IMG id=tabImgLeft__1 height=22 
													src="${ctx }/img/pic/tab_unactive_left.gif" width=3></TD>
												  <TD class=tab id=tabLabel__1 
												  onclick="doubleEyeFun()" 
												  background=${ctx }/img/pic/tab_unactive_bg.gif 
												  UNSELECTABLE="on">双眼视功能检查</TD>
												  <TD width=3><IMG id=tabImgRight__1 height=22 
													src="${ctx }/img/pic/tab_unactive_right.gif" 
												width=3></TD>
												</TR>
												</TBODY>
											  </TABLE>
											</TD>
										  <TD>
											  <TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
												<TBODY>
												<TR>
												  <TD width=3><IMG id=tabImgLeft__1 height=22 
													src="${ctx}/img/pic/tab_unactive_left.gif" width=3></TD>
												  <TD class=tab id=tabLabel__1 
												  onclick="specialCheck()" 
												  background=${ctx}/img/pic/tab_unactive_bg.gif 
												  UNSELECTABLE="on">相关检查</TD>
												  <TD width=3><IMG id=tabImgRight__1 height=22 
													src="${ctx}/img/pic/tab_unactive_right.gif" 
												width=3></TD>
												</TR>
												</TBODY>
											  </TABLE>
										  </TD>
										  
										  <TD>
											  <TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
												<TBODY>
												<TR>
												  <TD width=3><IMG id=tabImgLeft__1 height=22 
													src="${ctx}/img/pic/tab_unactive_left.gif" width=3></TD>
												  <TD class=tab id=tabLabel__1 
												  onclick="contactGlass()" 
												  background=${ctx}/img/pic/tab_unactive_bg.gif 
												  UNSELECTABLE="on">接触镜评估</TD>
												  <TD width=3><IMG id=tabImgRight__1 height=22 
													src="${ctx}/img/pic/tab_unactive_right.gif" 
												width=3></TD>
												</TR>
												</TBODY>
											  </TABLE>
										  </TD>										  
										  <TD>
									 		<TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
											<TBODY>
												<TR>
												  <TD width=3><IMG id=tabImgLeft__1 height=22 
														src="${ctx }/img/pic/tab_unactive_left.gif" width=3></TD>
												  <TD class=tab id=tabLabel__1 
													  onclick="inspection()" 
													  background=${ctx }/img/pic/tab_unactive_bg.gif
													  UNSELECTABLE="on">检查结论</TD>
												  <TD width=3><IMG id=tabImgRight__1 height=22 
													src="${ctx }/img/pic/tab_unactive_right.gif" 
													width=3></TD>
												</TR>
												</TBODY>
											  </TABLE>
										  </TD>	

				  				<TD>
								  <TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
									<TBODY>
									<TR>
									  <TD width=3><IMG id=tabImgLeft__0 height=22 src="${ctx}/img/pic/tab_active_left.gif" width=3></TD>
									  <TD class=tab id=tabLabel__0  onclick="JavaScript:void(0);"  
									  background=${ctx}/img/pic/tab_active_bg.gif 
									  UNSELECTABLE="on">验光设备接口</TD>
									  <TD width=3><IMG id=tabImgRight__0 height=22 
										src="${ctx}/img/pic/tab_active_right.gif" 
									width=3></TD>
									</TR>
									</TBODY>
								  </TABLE>
								</TD>
								  									  
										  <c:if test="${requestScope.chuyanfuyan == '1'}">
										  <TD>
											  <TABLE height=22 cellSpacing=0 cellPadding=0 border=0>
												<TBODY>
												<TR>
												  <TD width=3><IMG id=tabImgLeft__1 height=22 
													src="${ctx}/img/pic/tab_unactive_left.gif" width=3></TD>
												  <TD class=tab id=tabLabel__1 
												  onclick="cornealContactlLens()" 
												  background=${ctx}/img/pic/tab_unactive_bg.gif 
												  UNSELECTABLE="on">角膜接触镜复查</TD>
												  <TD width=3><IMG id=tabImgRight__1 height=22 
													src="${ctx}/img/pic/tab_unactive_right.gif" 
												width=3></TD>
												</TR>
												</TBODY>
											  </TABLE>
										  </TD>
										  </c:if>
									</TR>
								</tbody>
							</table>
							</TD>
						    <td align="right" style="PADDING-LEFT: 2px; HEIGHT: 22px"  background=${ctx }/img/pic/tab_top_bg.gif>
						    
				            </td>	
						                  
						</TR>		
						<TR>
							<TD bgColor=#ffffff colspan="3">
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >
									<TBODY>
										<TR>
											<TD width=1 background=${ctx}/img/pic/tab_bg.gif>
												<IMG height=1 src="${ctx}/img/pic/tab_bg.gif" width=1>
											</TD>
											<TD style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; PADDING-TOP: 15px;" vAlign=top>
												<input type="hidden" id="customerReadonly" name="customerReadonly" value="readOnly" />
												<s:action name="initCustomerOptometryTitleN" executeResult="true" />
												
									<input type="hidden" class="text_input400" name="optometryPhotoPo.sopoppicurlarray" id="bdppicurls" value="${optometryPhotoPo.sopoppicurlarray}" readonly="readonly"/>

									<s:iterator value = "optionParamPolist" status="index">	
												 <br/>												
												 <fieldset>
													<table width="99%" border=0 align=center cellpadding=1	cellspacing=1 class="privateTable privateBorder">
														<TR style="height: 25px" align="center">
															<TD width="10%" align="center" class="PrivateBorderBlue" bgcolor="#CADEE8">
															${fopparamname}
															</td>
															<TD width="90%" align="center" class="PrivateBorderBlue" bgcolor="#CADEE8">

                            <input type="button" onclick="startLoad('/upload/fixinginterface','100','bdppicurls','bdppicurlsDiv${index.index}','300','200','insert','${fopparamid}')" value="图片上传"/>

							<div id="bdppicurlsDiv${index.index}">
                              <s:iterator value="optometryPhotoPoList">
                                <c:if test="${fopparamid == sopopfixid}">                                   
                                   <p><img src="${ctx}${sopoppicurl}" width="300" height="200" title='点击查看大图' onclick="imgclick(this)" width2="600" height2="400" style="cursor: hand;" border="0"/><a style='cursor:hand' onclick=deleteServerFile(this,"${sopoppicurl}","bdppicurls","${fopparamid}");>删除</a></p>
                                </c:if>
                              </s:iterator>
                            </div>
															</td>
														</TR>

													</TABLE>
												 </fieldset>
                                     </s:iterator>
												<TABLE id=ctl00_PageBody_PostButton cellSpacing=1
													cellPadding=3 width="100%" align=center border=0>
													<TBODY>
														<TR>
															<TD align="center">
																<div align="center">
																	<img src="${ctx}/img/newbtn/btn_save_0.png" btn=btn id="button1" name="button1"  title="保存" onClick="save()">
																</div>
															</TD>
														</TR>
													</TBODY>
												</TABLE>																
											</td>
											<TD width=1 background=${ctx}/img/pic/tab_bg.gif>
															</TD>
														</tr>
													</table>
												<!--ݿEnd-->
											</TD>
									</TR>
								</tbody></TABLE></td></tr>	
								<TR>
									<TD  background=${ctx}/img/pic/tab_bg.gif colspan="2">
									</TD>
								</TR>											
								<!--ťEnd-->
								</TBODY>
			</TABLE>
		</form>
	</body>
</html>
<%@ include file="/WEB-INF/inc/message.jsp"%>
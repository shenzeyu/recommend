<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>编辑资料</title>
	<%@ include file="/commons/meta.jsp" %>
	<%@ include file="/commons/taglibs.jsp" %>
	
	<link rel="stylesheet" type="text/css" href="${ctx }/scripts/framework/easyui/themes/b2bBlue/easyui.css">
<!--	<link rel="stylesheet" type="text/css" href="${ctx }/scripts/framework/easyui/themes/icon.css">	-->
	<link rel="stylesheet" type="text/css" href="${ctx }/scripts/framework/easyui/themes/default/easyui.css">
	
	<link id="currentCss" name="currentCss" rel="StyleSheet" type="text/css" href="${ctx}/styles/kuquForm/form.css">
	<script language="JavaScript" type="text/javascript" src="${ctx}/scripts/framework/jquery.js"></script>
	<script language="JavaScript" type="text/javascript" src="${ctx}/scripts/framework/jquery.form.js"></script>
	<script language="javascript" type="text/javascript" src="${ctx}/scripts/framework/easyui/jquery.easyui.min.js"></script>
	<script language="javascript" type="text/javascript" src="${ctx}/scripts/common/common.js"></script>
	<script language="javascript" type="text/javascript" src="${ctx}/scripts/good/good/edit_good.js"></script>
	<script language="javascript" type="text/javascript" src="${ctx}/scripts/common/upload.js"></script>
	<script language="JavaScript" type="text/javascript" src="${ctx}/scripts/framework/ckeditor/ckeditor.js"></script>
	<script language="JavaScript" type="text/javascript" src="${ctx}/scripts/framework/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
    <table border="0" cellspacing="0" cellpadding="0" class="gdcn-table-E">
    	<tr>
    		<td class="gdcn-table-D">
				<div class="tab-pane" id="tabPane1" style="margin: 10px 10px 10px 10px;">
					<form id="goodForm" method="post" action="">
			    		<s:hidden name="good.id" id="id" />
			    		<s:hidden name="goodExtend.id" />
			    		<s:hidden name="good.creatorId" />
			    		<s:hidden name="good.creatorName" />
			    		<s:hidden name="good.createTime" />
			    		<s:hidden name="good.modifierId" />
			    		<s:hidden name="good.modifierName" />
			    		<s:hidden name="good.modifyTime" />
			    		<s:hidden name="good.state" />
			    		<s:hidden name="good.totalNum" />
			    		<s:hidden name="imgIdStr" id="imgIdStr"/>
			    		<input type="hidden" name="good.warehousePositionId" id="warehousePositionId" value=""/>
						<input type="hidden" name="good.warehouseId" id="warehouseId" value=""/>
									
									
			    		<div class="easyui-tabs" fit="true" plain="true" style="height:500px;width:300px;">
							<div title="基本信息" style="padding:10px;">
								<table width="100%"  border="0" cellpadding="0" cellspacing="1" class="gdcn-table-bgcolor">
						    	  <tr></tr>
						    	   <tr>
										<td class='gridtitle' width="15%">资料编号:</td>
										<td class='gridbody'>
											<input name="good.code" id="code" onchange="checkeCode(this.value)" value="${good.code }"/><font color="red">*</font>
										</td>
										<td class='gridtitle'>资料名称:</td>
										<td class='gridbody'>
											<s:textfield name="good.name" id="name"/><font color="red">*</font>
										</td>
									</tr>
									<tr>
										<td  class='gridtitle'>资料类别:</td>
										<td class='gridbody'>
											<s:textfield name="good.goodTypeName" id="goodTypeName" onclick="selectType(this)" readonly="true"/><font color="red">*</font>
											<s:hidden name="good.goodTypeId" id="goodTypeId" />
										</td>
									</tr>
<%-- 									<s:hidden name="good.isInventory" id="isInventory" value="0"></s:hidden> --%>
									<tr style="display: none;">
										<td  class='gridtitle'>资料类型:</td>
										<td class='gridbody'>
											<select name="good.isInventory" id="isInventory" onchange="changeValue(this.value)">
								                <option value="0" <c:if test="${good.isInventory == '0'}">selected</c:if> >普通资料</option>
								                <option value="1" <c:if test="${good.isInventory == '1'}">selected</c:if> >团购资料</option>
								                <option value="2" <c:if test="${good.isInventory == '2'}">selected</c:if> >抢购资料</option>
								                <option value="3" <c:if test="${good.isInventory == '3'}">selected</c:if> >秒杀资料</option>
								                <!-- <option value="4" <c:if test="${good.isInventory == '4'}">selected</c:if> >特殊资料</option> -->
								            </select>
										</td>
									</tr>
									<s:hidden name="good.property" id="property" value="2"/>
									<tr style="display: none;">
									    <td class='gridtitle'>资料属性</td>
										<td class='gridbody' colspan="5">
											<select name="good.property" id="property" onchange="ChekeisQgGood()">
												<option value="">-- 请选择资料属性 --</option>
												<option value="1" <c:if test="${good.property == '1'}">selected</c:if> >热卖资料</option>
												<option value="2" <c:if test="${good.property == '2'}">selected</c:if> >新品上架</option>
												<option value="3" <c:if test="${good.property == '3'}">selected</c:if> >猜您喜欢</option>
												<option value="4" <c:if test="${good.property == '4'}">selected</c:if> >最新降价</option>
												<option value="5" <c:if test="${good.property == '5'}">selected</c:if> >今日推荐</option>
											</select>										
										</td>
									</tr>
									
									
									<tr></tr>
									
									<tr>
										<td class='gridtitle'>上传资料缩略图:</td>
										<td class='gridbody' colspan="3">
											<a href="javascript:void(0);" onclick="upload.open(this,'Good')">上传</a>
											<c:if test="${good.pic != null && good.pic != ''}">
												<img id="pic" border="0" src="${ctx}${good.pic }" width="130px" height="130px"/>
												&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deletePic(this)">删除</a>
											</c:if>
											<input type="hidden" name="picId" id="fileUploadId" value="${good.picId}" /><%-- name必须为fileUploadId --%>
											<input type="hidden" name="pic" id="picPath" value="${good.pic }" class="picPath">
										</td>
									</tr>
									<tr>
										<td class='gridtitle'>备注:</td>
										<td class='gridbody' colspan="3">
											<s:textarea id="remark" name="good.remark" cols="100" rows="3"/>
										</td>
									</tr>
								</table>
							</div>
							
							<div title="详细信息" style="padding:10px;">
								<table width="100%"  border="0" cellpadding="0" cellspacing="1" class="gdcn-table-bgcolor">	    	
									<tr>
										<td  class='gridtitle'>资料简介:</td>
										<td class='gridbody'>
											<s:textarea name="goodExtend.introBrief" id="introBrief" cols="60" rows="3"/>
										</td>
									</tr>
									<tr>
										<td  class='gridtitle'>资料详情:</td>
										<td class='gridbody' >
											<textarea id="intro" name="goodExtend.intro" cols="60" rows="10">${goodExtend.intro}&nbsp;</textarea>
										</td>
									</tr>
									<tr>
										<td  class='gridtitle'>规格参数:</td>
										<td class='gridbody' >
											<textarea id="introWholesale" name="goodExtend.introWholesale" cols="60" rows="10">${goodExtend.introWholesale}&nbsp;</textarea>
										</td>
									</tr>
									<tr>
										<td  class='gridtitle'>包装清单:</td>
										<td class='gridbody' >
											<textarea id="introDelivery" name="goodExtend.introDelivery" cols="60" rows="10">${goodExtend.introDelivery}&nbsp;</textarea>
										</td>
									</tr>
										<tr>
										<td  class='gridtitle'>售后服务:</td>
										<td class='gridbody' >
											<textarea id="afterSale" name="goodExtend.afterSale" cols="60" rows="10">${goodExtend.afterSale}&nbsp;</textarea>
										</td>
									</tr>
									
										<tr>
										<td  class='gridtitle'>实用指南:</td>
										<td class='gridbody' >
											<textarea id="practiceGuidelinesFAQS" name="goodExtend.practiceGuidelinesFAQS" cols="60" rows="10">${goodExtend.practiceGuidelinesFAQS}&nbsp;</textarea>
										</td>
									</tr>
		
								</table>
							</div>
							
							<div title="资料相册" style="padding:10px;">
								<table width="100%"  border="0" cellpadding="0" cellspacing="1" class="gdcn-table-bgcolor">	 
									<c:forEach items="${goodPicList}" var="goodPic" varStatus="m"> 	
									<tr>
										<td  class='gridtitle'  width="10%">上传资料图片${m.index + 1}:</td>
										<td class='gridbody'>
											<a href="javascript:void(0);" onclick="upload.open(this,'GoodAlbum')">上传</a>
											<c:if test="${goodPic.relativePath != null && goodPic.relativePath  != ''}">
												<img id="pic" border="0" src="${ctx}${goodPic.relativePath }" width="130px" height="130px"/>
												&nbsp;&nbsp;<a href="javascript:void(0);" onclick="deletePic(this)">删除</a>
											</c:if>
											<input type="hidden" name="picIdArr" id="fileUploadId" value="${goodPic.id}" /><%-- id必须为fileUploadId --%>
											<input type="hidden" name="picArr" id="picPath" value="${goodPic.relativePath }" class="picPath">
										</td>
									</tr>
									</c:forEach>  
								</table>
							</div>																		
						</div>
						<center>
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="submitSaveForm()">保存</a>
						</center>
					</form>
				</div>
	    	</td>
	    </tr>
	</table>
</body>
</html>


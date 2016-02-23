﻿<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<title>上理在线学院</title>
	<%@ include file="/commons/taglibs.jsp" %>
	<%@ include file="/commons/meta.jsp" %>
	
	<link rel="stylesheet" type="text/css" href="${ctx }/styles/index/index4.css" />
	<link rel="stylesheet" type="text/css" href="${ctx }/scripts/framework/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx }/scripts/framework/easyui/themes/icon.css">	
	<script language="JavaScript" type="text/javascript" src="${ctx }/scripts/framework/jquery.js"></script>
	<script type="text/javascript" src="${ctx }/scripts/framework/easyui/jquery.easyui.min.js"></script>
	<script language="JavaScript" type="text/javascript" src="${ctx }/scripts/index/main.js"></script>
</head>

<body class="easyui-layout">
		<div region="north" style="height:70px;">
	        <div class="banner for">
	            <div class="peo3"><img src="${ctx }/Images/index/peo3.gif" height="23" width="17"/></div>
	            <div class="font1">
	            	${loginUser.roleName}&nbsp;系统           	
	            </div>
	            <div class="font2">
	            	${loginUser.name},欢迎登录!
					<a href="javascript:void(0)" target="_self" onClick="javascript:logout();">
						<img src="${ctx }/Images/index/bott.gif" alt="退出" width="46" height="16" border="0">
					</a>		            	
	            </div>
	        </div>	        
		</div> 
		
        <div region="west" title="菜单" style="width:161px;padding:0px;overflow:hidden;">
	      	<div class="leftbanner">
	            
	            <!-- 菜单 开始 -->
	            
	            <c:if test="${not empty powerMap['customer'] }">
		            <div class="ban1">
		            	<div class="pic"><img src="${ctx }/Images/index/peo3.gif" width="21" height="18" /></div>
		                <div class="font4">学员管理</div>
		            </div>
		            <div class="submenu">
		            	<ul>
		            		<li><a href="javascript:void(0)" onclick="addTab('学员列表','${ctx}/customers!list.do')">学员列表</a></li>
		                	<li><a href="javascript:void(0)" onclick="addTab('咨询管理','${ctx}/message!list.do?message.state=c')">咨询管理</a></li>
		                    <li><a href="javascript:void(0)" onclick="addTab('学员评论','${ctx}/wareComment!list.do')">学员评论</a></li>
		                	<li><a href="javascript:void(0)" onclick="addTab('学员等级','${ctx}/vipLevel!list.do')">学员等级</a></li>
		               </ul>
		            </div>		            
	            </c:if>
	            
	            <c:if test="${not empty powerMap['good'] }">
		            <div class="ban1">
		            	<div class="pic"><img src="${ctx }/formImg/303.gif" width="21" height="18" /></div>
		                <div class="font4">学习资料管理</div>
		            </div>
		            <div class="submenu">
		            	<ul>
		            		<li><a href="javascript:void(0)" onclick="addTab('资料列表','${ctx}/good!list.do')">资料列表</a></li>		            	
							<li><a href="javascript:void(0)" onclick="addTab('资料类别','${ctx}/goodType!list.do?goodType.isInventory=0')">资料类别</a></li>		            	
							<li><a href="javascript:void(0)" onclick="addTab('资料规格','${ctx}/goodSpecification!list.do')">资料规格</a></li>
		                </ul>
		            </div>		            
	            </c:if>	
	            <c:if test="${not empty powerMap['market'] }">
		            <div class="ban1">
		            	<div class="pic"><img src="${ctx }/formImg/icon_16.gif" width="21" height="18" /></div>
		                <div class="font4">学员活动</div>
		            </div>
		            <div class="submenu">
		            	<ul>
							<li><a href="javascript:void(0)" onclick="addTab('广告管理','${ctx}/advertise!list.do')">广告管理</a></li>
		                	<li><a href="javascript:void(0)" onclick="addTab('杂志管理','${ctx}/magazine!list.do')">杂志管理</a></li>
		                </ul>
		            </div>		    
	            </c:if>	  	                                         
	            
	            
	            <c:if test="${not empty powerMap['information'] }">
		            <div class="ban1">
		            	<div class="pic"><img src="${ctx }/formImg/104.gif" width="21" height="18" /></div>
		                <div class="font4">资讯管理</div>
		            </div>
		            <div class="submenu">
		            	<ul>         	
							<li><a href="javascript:void(0)" onclick="addTab('公告管理','${ctx}/information!list.do?information.type=0')">公告管理</a></li>
							<li><a href="javascript:void(0)" onclick="addTab('新闻管理','${ctx}/information!list.do?information.type=1')">新闻管理</a></li>
		                </ul>
		            </div>		            
	            </c:if>
	            
	            
		        <!-- 流量统计 -->
		        <c:if test="${not empty powerMap['dataflow'] }">
		            <div class="ban1">
		            	<div class="pic"><img src="${ctx }/formImg/notepad.gif" width="21" height="18" /></div>
		                <div class="font4">流量统计</div>
		            </div>
		            <div class="submenu">
		            	<ul>
		            		<li><a href="javascript:void(0)" onclick="flowmeter()">流量分析</a></li>
		                </ul>
		            </div>
		        </c:if>	        
	            
	            <c:if test="${not empty powerMap['system'] }">
		            <div class="ban1">
		            	<div class="pic"><img src="${ctx }/formImg/user.gif" width="21" height="18" /></div>
		                <div class="font4">系统管理</div>
		            </div>
		            <div class="submenu">
		            	<ul>
							<li><a href="javascript:void(0)" onclick="addTab('系统用户','${ctx }/SysUser!list.do')">系统用户</a></li>
							<li><a href="javascript:void(0)" onclick="addTab('系统部门','${ctx }/SysDept!list.do')">组织部门</a></li>
							<li><a href="javascript:void(0)" onclick="addTab('系统角色','${ctx }/SysRole!list.do')">系统角色</a></li>
							<li><a href="javascript:void(0)" onclick="addTab('系统普通权限','${ctx }/SysPower!list.do')">系统普通权限</a></li>
							<li><a href="javascript:void(0)" onclick="addTab('系统高级权限','${ctx }/SysRole!roleAnduserList.do')">系统高级权限</a></li>
							<li><a href="javascript:void(0)" onclick="backupData()">数据备份</a></li>
		            	</ul>
		            </div>
		        </c:if>
		     
	            <c:if test="${not empty powerMap['desktop'] }">
		            <div class="ban1">
		            	<div class="pic"><img src="${ctx }/Images/index/maintenance.gif" width="21" height="18" /></div>
		                <div class="font4">我的桌面</div>
		            </div>
		            <div class="submenu">
		            	<ul>
							<li><a href="javascript:void(0)" onclick="addTab('修改密码','${ctx }/SysUser!editPassword.do')">修改密码</a></li>
		                </ul>
		            </div>		            
	            </c:if>		                   
	            <!-- 菜单 结束 -->
	            
	   		 </div>        
        </div> 
         
        <div region="center" >
	        <div id="tab_area" >
	        
	       	</div>
        </div>
</body>

</html>

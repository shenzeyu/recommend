<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
 <head>
	<title></title>
	<%@ include file="/commons/taglibs.jsp" %>
	<%@ include file="/commons/meta.jsp" %>
	
	<link rel="stylesheet" type="text/css" href="${ctx }/styles/index/mainInfo.css" />
	<script language="JavaScript" type="text/javascript" src="${ctx}/scripts/index/mainInfo.js"></script>
	<script language="JavaScript" type="text/javascript" src="${ctx }/scripts/framework/jquery.js"></script>
	<script language="JavaScript" type="text/javascript" src="${ctx }/scripts/index/bgIndex.js"></script>
</head>
<body>
<input type="hidden" value="${sysUser.roleCode}" id="roleCode">
<div class="whole">
         <div class="right">
         	<div class="righttop">
            	<div class="order">
                	<div class="width1 for"><div class="font3"></div></div>
                    <div class="pic1"><img src="${ctx }/Images/index/login.jpg"  width="100%" height="100%"/></div>
                </div>
                <div class="news">
<div class="width2 for"><div class="font3">最新信息</div></div>
                    <div class="new">
                    	<div class="new1">最新选课</div>
                    	<marquee width="290" height="125" direction="up" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()">
                            <ul>
                            	<c:forEach var="order" items="${resultList}" varStatus="i">
                            		<c:if test="${i.index<6}">
                                	<li><a href="javascript:void(0)" onclick="addTab('学员选课','${ctx}/saleOrder!list.do')"><span style="color: red;">${order.code}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${order.customerName}</span></a></li>
                                	</c:if>
                                 </c:forEach>
                            </ul>
                         </marquee>
                    </div>
                    <div class="new"><div class="new1" align="left">最新学员</div>
                    	<div>
                            <ul>
                            	<c:forEach var="customer" items="${customerList}" varStatus="i">
                            		<c:if test="${i.index<6}">
                                	<li><a href="javascript:void(0)" onclick="addTab('学员列表','${ctx}/customers!list.do?customer.type=s')"><span style="color: blue;"><fmt:formatDate pattern="yyyy-MM-dd" value="${customer.createTime}" /></span>&nbsp;&nbsp;&nbsp;&nbsp;<span>帐号:${customer.code}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>${fn:substring(customer.areaNames,0,10)}</span></a></li>
                                	</c:if>
                                 </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbottom">
            	<div class="loding">
                	<div class="width3 for"><div class="font3">登陆消息</div></div>
                    <div class="pic2"><img src="${ctx }/Images/index/peo2.gif" width="46" height="58" /></div>
                    <div class="people"><font color="blue">${loginUser.name }&nbsp;&nbsp;,欢迎您<br/></font>三天内共登陆了${Static.SESSION_USER }次<br />上次登陆时间： 2011-5-7 20:17:52</div>
                </div>
                <div class="message">
                	<div class="width3 for"><div class="font3">版权信息</div></div>
                	<div>
                         <ul>
                         <li>系统名称： 上理在线学院 </li>
                             <li>系统版本：  V2.12.3版</li>
                             <li>官方网站：  <a href="http://www.usst.edu.cn/"  target="_blank">http://www.usst.edu.cn/</a></li>
                             <li>版权所有： 上海理工大学</li>
                             <li>技术支持：   <font color="blue" size="+1">021-55277040</font>
                             <li>授权提示：  <font style="color:#FF0000;">版权所有 &copy; 2016 上海理工大学</font></li>
                         </ul>
                    </div>
                </div>
            </div>
		 </div>
		 </div>
</body>
</html>

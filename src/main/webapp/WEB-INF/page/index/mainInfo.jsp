﻿<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<title></title>
	<%@ include file="/commons/taglibs.jsp" %>
	<%@ include file="/commons/meta.jsp" %>
	
	<link rel="stylesheet" type="text/css" href="${ctx }/styles/index/mainInfo.css" />
	<script language="JavaScript" type="text/javascript" src="${ctx}/scripts/index/mainInfo.js"></script>
	<script language="JavaScript" type="text/javascript" src="${ctx }/scripts/framework/jquery.js"></script>
</head>


<body>
<input type="hidden" value="${sysUser.roleCode}" id="roleCode">
<div class="whole">
         <div class="right">
         	<div class="righttop">
            	<div class="order">
                	<div class="width1 for"><div class="font3">order information</div></div>
                    <div class="fontorder">
                    <c:if test="${sysUser.roleCode == 'supplier'}">
                    	 你有未审核的订单<a style="text-decoration: underline;color: red;" href="javascript:showOrder()">&nbsp;&nbsp;${orderNumOne}&nbsp;&nbsp;</a>笔<br/>
                    	<span>你有未发货的订单<a style="text-decoration: underline;color: red;" href="javascript:showDealOrder()">&nbsp;&nbsp;${orderNumTwo}&nbsp;&nbsp;</a>笔</span><br/>
                    </c:if>
                    <c:if test="${sysUser.roleCode == 'operator' || sysUser.roleCode == 'admin'}">
                     	你有未确认的订单<a style="text-decoration: underline;color: red;" href="javascript:showOrder()">&nbsp;&nbsp;${orderNumOne}&nbsp;&nbsp;</a>笔<br/>
                    	<span></span><br/>
                    </c:if>
                    <c:if test="${sysUser.roleCode == 'buyer'}">
                    	 你有未确认的订单<a style="text-decoration: underline;color: red;" href="javascript:showOrder()">&nbsp;&nbsp;${orderNumOne}&nbsp;&nbsp;</a>笔<br/>
                    	<span>你有未收货的订单<a style="text-decoration: underline;color: red;" href="javascript:showDealOrder()">&nbsp;&nbsp;${orderNumTwo}&nbsp;&nbsp;</a>笔</span><br/>
                    </c:if>
                    <span style="text-decoration:underline"></span></div>
                    <div class="pic1"><img src="${ctx }/Images/index/histogram.gif" width="555" height="235" /></div>
                </div>
                <div class="news">
                	<div class="width2 for"><div class="font3">Latest News</div></div>
                    <div class="new"><div class="new1">最新公告</div>
                    	<div>
                        <marquee width="290" height="125" direction="up" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()">
                            <ul>
                            	<c:forEach var="news" items="${bulletinList}">
                                	<li><a href="javascript:showNews('${news.id}');">[最新消息]“${news.title}”</a></li>
                                </c:forEach>
                            </ul>
                            </marquee>
                        </div>
                    </div>
                    <div class="new"><div class="new1">业内动态</div>
                    	<div>
                            <ul>
                            	<c:forEach var="news1" items="${newsList}">
                                	<li><a href="javascript:showNews('${news1.id}');">[最新资讯]“${news1.title}”</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbottom">
            	<div class="loding">
                	<div class="width3 for"><div class="font3">Login information</div></div>
                    <div class="pic2"><img src="${ctx }/Images/index/peo2.gif" width="46" height="58" /></div>
                    <div class="people">您三天内共登陆了6次<br />上一次登陆 2011-5-7 20:17:52</div>
                </div>
                <div class="message">
                	<div class="width3 for"><div class="font3">Copyright</div></div>
                	<div>
                         <ul>
                             <li>系统名称：  中建投外贸分销平台</li>
                             <li>系统版本：  V2011商业版</li>
                             <li>官方网站：  www.egshops.com</li>
                             <li>授权查询：  在线查询</li>
                             <li>授权提示：  <font style="color:#FF0000;">在未取得商业授权之前，您不能将本软件应用于商业用途</font></li>
                             <li>技术支持：  <a href="http://www.kuquo.com" target="_blank">Guangzhou COOL FUN SCIENCE</a></li>
                         </ul>
                    </div>
                </div>
            </div>
		 </div>
</body>

</html>

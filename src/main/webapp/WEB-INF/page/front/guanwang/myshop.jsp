<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上理在线学院</title>
<link href="${ctx}/styles/front/style/base.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/styles/front/style/myshop.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/styles/front/pro_dropdown_2/pro_dropdown_2.css" />
<script src="${ctx}/scripts/front/js/stuHover.js" type="text/javascript"></script>
<script language="${ctx}/scripts/front/javascript" src="js/jquery.js"></script>
<script language="${ctx}/scripts/front/javascript" src="js/index20110925_mini.js"></script>
<script language="${ctx}/scripts/front/javascript" src="js/jquery2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/front/js/jquery1.js"></script>

<script>
function changeDiv(tag,method){document.getElementById(tag).style.display = method;}
</script>
<script>
<!--
/*第一种形式 第二种形式 更换显示样式*/
function secBoard(name,cursel,n){
for(i=1;i<=n;i++){
var menu=document.getElementById(name+i);
var con=document.getElementById("con_"+name+"_"+i);
menu.className=i==cursel?"hover":"";
con.style.display=i==cursel?"block":"none";

}
}
//-->
</script>
</head>

<body>
<div class="box">
 <%@ include file="/WEB-INF/page/front/guanwang/header.jsp"%>
<!--[if !IE]>我的上理在线学院<![endif]-->
<div class="content">
<div class="coupon">
 <div class="coupon_left">
        <div class="couponleft_title"><a href="${ctx }/customersManage.do">我的在线学院</a></div>
        <!--[if !IE]>订单中心<![endif]-->
        <script language=javascript id=clientEventHandlersJS>
<!--
var number=0;

function LMYC() {
var lbmc;
//var treePic;
    for (i=1;i<=number;i++) {
        lbmc = eval('LM' + i);
        //treePic = eval('treePic'+i);
        //treePic.src = '${ctx }/Images/images/file.gif';
        lbmc.style.display = 'none';
    }
}
 
function ShowFLT(i) {
    lbmc = eval('LM' + i);
    var treePic = document.getElementById('pic' + i);
    if (lbmc.style.display == 'none') {
        LMYC();
        treePic.src = '${ctx }/Images/images/bit07.gif';
        lbmc.style.display = '';
    }
    else {
        treePic.src = '${ctx }/Images/images/bit08.gif';
        lbmc.style.display = 'none';
    }
}
//-->
      </script>
        <div class="couponleft_text">
          <div class="couponleft_text01"><A onclick="javascript:ShowFLT(1)" href="javascript:void(null)" ><span>订单中心</span><samp><IMG id="pic1" 
                  height=14 src="${ctx }/Images/images/bit07.gif" width=14
                 ></samp></A></div>
          <div class="couponleft_text02" id=LM1>
            <ul>
<<<<<<< Updated upstream
<li><a href="${ctx }/orderManage.do" id="visited">我的订单<span>(<samp>${total }</samp>)</span></a></li>
<li><a href="${ctx }/paymentOrder.do?saleOrder.iscancel=0">待付款订单<span>(<samp>${payment }</samp>)</span></a></li>
<li><a href="${ctx }/paymentOrder.do?saleOrder.iscancel=1">已取消订单<span>(<samp>${cancelOrder }</samp>)</span></a></li>
<li><a href="${ctx }/shippedGoods.do?saleOrder.deliveryState=1">已发货资料<span>(<samp>${deliveryOrder }</samp>)</span></a></li>
<li><a href="${ctx }/shippedGoods.do?saleOrder.deliveryState=0">未发货资料<span>(<samp>${deliveryOrder2 }</samp>)</span></a></li>
<li id="bor"><a href="${ctx }/pingjiaTwo.do" >待评价资料<span>(<samp>${commentOrder}</samp>)</span></a></li>
=======
<li><a href="${ctx }/orderManage.do" id="visited">我的课程<span>(<samp>${total }</samp>)</span></a></li>
<li><a href="${ctx }/paymentOrder.do?saleOrder.iscancel=0">待付款课程<span>(<samp>${payment }</samp>)</span></a></li>
<li><a href="${ctx }/paymentOrder.do?saleOrder.iscancel=1">已取消课程<span>(<samp>${cancelOrder }</samp>)</span></a></li>
<li><a href="${ctx }/shippedGoods.do?saleOrder.deliveryState=1">已完成课程<span>(<samp>${deliveryOrder }</samp>)</span></a></li>
<li><a href="${ctx }/shippedGoods.do?saleOrder.deliveryState=0">未开始课程<span>(<samp>${deliveryOrder2 }</samp>)</span></a></li>
<li id="bor"><a href="${ctx }/pingjiaTwo.do" >待评价课程<span>(<samp>${commentOrder}</samp>)</span></a></li>
>>>>>>> Stashed changes
</ul>
          </div>
        </div>
		 <!--[if !IE]>课程中心<![endif]-->
         <c:if test="${customer.type == '1'}">
         	 <div class="couponleft_text">
	          <div class="couponleft_text01"><A onclick="javascript:ShowFLT(2)" href="javascript:void(null)" ><span>课程中心</span><samp><IMG id="pic2" 
	                  height=14 src="${ctx }/Images/images/bit07.gif" width=14
	                 ></samp></A></div>
	          <div class="couponleft_text02" id=LM2 >
	            <ul>
	              <li><a href="${ctx }/lianmengSales.do">销售/收入</a></li>
	              <li id="bor"><a href="${ctx }/salesAnalysis.do" >销售/收入分析</a></li>
	            </ul>
	          </div>
	        </div>
         </c:if>
        <!--[if !IE]>课程中心<![endif]-->
        <div class="couponleft_text">
          <div class="couponleft_text01"><A onclick="javascript:ShowFLT(3)" href="javascript:void(null)" ><span>课程中心</span><samp><IMG id="pic3" 
                  height=14 src="${ctx }/Images/images/bit07.gif" width=14
                 ></samp></A></div>
          <div class="couponleft_text02" id=LM3 >
            <ul>
              <li><a href="${ctx }/myFavorite.do">我的收藏<span>(<samp>${favolist }</samp>)</span></a></li>
<li id="bor"><a href="${ctx }/myCoupon.do" >我的优惠券<span>(<samp>${couponList }</samp>)</span></a></li>
            </ul>
          </div>
        </div>
        <!--[if !IE]>交流与讨论<![endif]-->
        <div class="couponleft_text">
          <div class="couponleft_text01"><A onclick="javascript:ShowFLT(4)" href="javascript:void(null)" ><span>交流与讨论</span><samp><IMG id="pic4" 
                  height=14 src="${ctx }/Images/images/bit07.gif" width=14
                 ></samp></A></div>
          <div class="couponleft_text02" id=LM4>
            <ul>
              <li><a href="${ctx }/tuihuan.do">练习/提问</a></li>
<li><a href="${ctx }/myMessage.do">我的咨询</a></li>
<li id="bor"><a href="${ctx }/myComment.do" >我的评价</a></li>
            </ul>
          </div>
        </div>
        <!--[if !IE]>个人中心<![endif]-->
        <div class="couponleft_text" >
          <div class="couponleft_text01"><A onclick="javascript:ShowFLT(5)" href="javascript:void(null)" ><span>个人中心</span><samp><IMG id="pic5" 
                  height=14 src="${ctx }/Images/images/bit07.gif" width=14
                 ></samp></A></div>
          <div class="couponleft_text02" id=LM5>
            <ul>
            <li><a href="${ctx }/myinfor.do">个人信息</a></li>
<li><a href="${ctx }/security.do">安全设置</a></li>
<li id="bor"><a href="${ctx }/myaddress.do" >地址管理</a></li>
            </ul>
          </div>
        </div>
        <!--[if !IE]>end<![endif]-->
      </div>  
<!--[if !IE]>右侧<![endif]-->
<div class="coupon_right">
<div class="courht">

<!--[if !IE]>用户中心<![endif]-->
<div class="wanshop">
<div class="wanshop01">
<div class="wanshop01_img">
<span><a href="${ctx }/myinfor.do"><img src="${ctx }${customer.pic }" border="0" /></a></span>
<samp><a href="${ctx }/myinfor.do">个人信息</a></samp></div>
<div class="wanshop01_text">
<div class="wanshop01_text01">
<h1>${customer.name }，</h1>
<h2>欢迎您回来！</h2>
<h3><a href="${ctx }/myaddress.do">地址管理</a></h3>
</div>
<div class="wanshop01_text02">
<h1><a href="${ctx }/paymentOrder.do?saleOrder.iscancel=0">待付款&nbsp;(<span>${payment }</span>)</a></h1>
<h1><a href="${ctx }/pingjiaTwo.do">待评价&nbsp;(<span>${commentOrder }</span>)</a></h1>
<h1><a href="${ctx }/myMessage.do">已回复咨询&nbsp;(<span>${messagelist }</span>)</a></h1>
<h2><a href="${ctx }/myCoupon.do">我的优惠券&nbsp;<span>${couponList }</span>&nbsp;张</a></h2>
</div>
</div>
</div>
</div>
<!--[if !IE]>列表结束<![endif]-->
<!--[if !IE]>选项卡<![endif]-->
<div id="Tab2">
<div class="Menubox">
<ul>
<li id="two1" onclick="secBoard('two',1,4)"  class="hover">猜你喜欢</li>
<li id="two2" onclick="secBoard('two',2,4)" >您关注的资料</li>
<li id="two3" onclick="secBoard('two',3,4)">今日团购</li>
<li id="two4" onclick="secBoard('two',4,4)" >疯狂抢购</li>
</ul>
</div>
<div class="Contentbox">
<!--[if !IE]>猜你喜欢<![endif]-->
<div id="con_two_1" >
	<div class="photolist02">
	    <ul>
	    <!--[if !IE]>第一个产品<![endif]-->
	        <c:forEach items="${browseList}" var="good" begin="0" end="3">
		         <li> <a href="${ctx }/cpxq.do?good.id=${good.goodId }"><img src="${ctx }${good.goodPic }" /></a>
		            <p><a href="${ctx }/cpxq.do?good.id=${good.goodId }">${good.goodName }<span>${good.introBrief }</span></a></p>
		            <h1><span class="font2">¥${good.goodPrice }</span><span>市场价：</span><samp><span class="font">¥</span>${good.priceMarket }</samp></h1>  
		         </li>
	        </c:forEach>
	     <!--[if !IE]>第一个产品<![endif]-->
		</ul>
	</div>
<!--[if !IE]>产品列表结束<![endif]-->
</div>
<!--[if !IE]>您关注的资料<![endif]-->

<div id="con_two_2" style="display:none">
	<div class="photolist02">
	    <ul>
	    <!--[if !IE]>第一个产品<![endif]-->
	    <c:if test="${not empty goodlist }">
	        <c:forEach items="${goodlist}" var="good" begin="0" end="3">
		         <li><a href="${ctx }/cpxq.do?good.id=${good.goodId }"><img src="${ctx }${good.pic }" /></a>
		            <p><a href="${ctx }/cpxq.do?good.id=${good.goodId }">${good.goodName }<span>${good.introBrief }</span></a></p>
		            <h1><span class="font2">¥${good.price }</span><span>市场价：</span><samp><span class="font">¥</span>${good.priceMarket }</samp></h1>  
		         </li>
	        </c:forEach>
	    </c:if>
	     <!--[if !IE]>第一个产品<![endif]-->
		</ul>
	</div>
</div>

<!--[if !IE]>今日团购<![endif]-->
<div id="con_two_3" style="display:none">
	<div class="photolist02">
	    <ul>
	    <!--[if !IE]>第一个产品<![endif]-->
	        <c:forEach items="${goodList}" var="good" begin="0" end="3">
		         <li> <a href="${ctx }/cpxq.do?good.id=${good.id }"><img src="${ctx }${good.pic }" /></a>
		            <p><a href="${ctx }/cpxq.do?good.id=${good.id }">${good.name }<span>${good.introBrief }</span></a></p>
		            <h1><span class="font2">¥${good.price }</span><span>市场价：</span><samp><span class="font">¥</span>${good.priceMarket }</samp></h1>  
		         </li>
	        </c:forEach>
	     <!--[if !IE]>第一个产品<![endif]-->
		</ul>
	</div>
</div>
<!--[if !IE]>疯狂抢购<![endif]-->
<div id="con_two_4" style="display:none">
<div class="photolist02">
	    <ul>
	    <!--[if !IE]>第一个产品<![endif]-->
	        <c:forEach items="${goodList2}" var="good" begin="0" end="3">
		         <li> <a href="${ctx }/cpxq.do?good.id=${good.id }"><img src="${ctx }${good.pic }" /></a>
		            <p><a href="${ctx }/cpxq.do?good.id=${good.id }">${good.name }<span>${good.introBrief }</span></a></p>
		            <h1><span class="font2">¥${good.price }</span><span>市场价：</span><samp><span class="font">¥</span>${good.priceMarket }</samp></h1>  
		         </li>
	        </c:forEach>
	     <!--[if !IE]>第一个产品<![endif]-->
		</ul>
	</div>


</div>
<!--[if !IE]>疯狂抢购结束<![endif]-->
</div>
</div>
<div class="courht_img">
<c:forEach items="${advertiseList}" var="promotionActivity" begin="0" end="0">
<a href="${promotionActivity.url }"><img src="${ctx }${promotionActivity.pic }" width="960" height="110" border="0" /></a>
</c:forEach>
</div>
</div>
</div>
<!--[if !IE]>右侧结束<![endif]-->
</div>
</div>
<!--[if !IE]>我的壹万店结束<![endif]-->
  <%@ include file="/WEB-INF/page/front/guanwang/bottom.jsp"%> 
  </div>
</body>
</html>


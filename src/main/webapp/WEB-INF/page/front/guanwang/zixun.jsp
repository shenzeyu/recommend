<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上理在线学院</title>
<link href="${ctx}/styles/front/style/base.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/styles/front/style/zixun_page.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/styles/front/pro_dropdown_2/pro_dropdown_2.css" />
<script src="${ctx}/scripts/front/js/stuHover.js" type="text/javascript"></script>
<script language="javascript" src="${ctx}/scripts/front/js/jquery.js"></script>
<script language="javascript" src="${ctx}/scripts/front/js/index20110925_mini.js"></script>
<script language="javascript" src="${ctx}/scripts/front/js/jquery2.js"></script>
<SCRIPT type="text/javascript" src="${ctx}/scripts/front/js/jquery1.js"></SCRIPT>
<script>
function changeDiv(tag,method){document.getElementById(tag).style.display = method;}
</script>
</head>
<body>
<div class="box">
 <%@ include file="/WEB-INF/page/front/guanwang/header.jsp"%>
<!--[if !IE]>我的壹万店<![endif]-->
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
<li><a href="${ctx }/orderManage.do">我的订单<span>(<samp>${total }</samp>)</span></a></li>
<li><a href="${ctx }/paymentOrder.do?saleOrder.iscancel=0">待付款订单<span>(<samp>${payment }</samp>)</span></a></li>
<li><a href="${ctx }/paymentOrder.do?saleOrder.iscancel=1">已取消订单<span>(<samp>${cancelOrder }</samp>)</span></a></li>
<li><a href="${ctx }/shippedGoods.do?saleOrder.deliveryState=1">已发货商品<span>(<samp>${deliveryOrder }</samp>)</span></a></li>
<li><a href="${ctx }/shippedGoods.do?saleOrder.deliveryState=0">未发货商品<span>(<samp>${deliveryOrder2 }</samp>)</span></a></li>
<li id="bor"><a href="${ctx }/pingjiaTwo.do" >待评价商品<span>(<samp>${commentOrder}</samp>)</span></a></li>
</ul>
          </div>
        </div>
		 <!--[if !IE]>交易中心<![endif]-->
         <c:if test="${customer.type == '1'}">
         	 <div class="couponleft_text">
	          <div class="couponleft_text01"><A onclick="javascript:ShowFLT(2)" href="javascript:void(null)" ><span>销售中心</span><samp><IMG id="pic2" 
	                  height=14 src="${ctx }/Images/images/bit07.gif" width=14
	                 ></samp></A></div>
	          <div class="couponleft_text02" id=LM2 >
	            <ul>
	              <li><a href="sales.html">销售/收入</a></li>
	              <li id="bor"><a href="salesAnalysis.html" >销售/收入分析</a></li>
	            </ul>
	          </div>
	        </div>
         </c:if>
        <!--[if !IE]>交易中心<![endif]-->
        <div class="couponleft_text">
          <div class="couponleft_text01"><A onclick="javascript:ShowFLT(3)" href="javascript:void(null)" ><span>交易中心</span><samp><IMG id="pic3" 
                  height=14 src="${ctx }/Images/images/bit07.gif" width=14
                 ></samp></A></div>
          <div class="couponleft_text02" id=LM3 >
            <ul>
              <li><a href="${ctx }/myFavorite.do">我的收藏<span>(<samp>${favolist }</samp>)</span></a></li>
<li id="bor"><a href="${ctx }/myCoupon.do" >我的优惠券<span>(<samp>${couponList }</samp>)</span></a></li>
            </ul>
          </div>
        </div>
        <!--[if !IE]>客户服务<![endif]-->
        <div class="couponleft_text">
          <div class="couponleft_text01"><A onclick="javascript:ShowFLT(4)" href="javascript:void(null)" ><span>客户服务</span><samp><IMG id="pic4" 
                  height=14 src="${ctx }/Images/images/bit07.gif" width=14
                 ></samp></A></div>
          <div class="couponleft_text02" id=LM4>
            <ul>
              <li><a href="${ctx }/tuihuan.do">返修/退换货</a></li>
<li><a href="${ctx }/myMessage.do" id="visited">我的咨询</a></li>
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
<div class="applyReturn_right">
<div class="applyright">
<div class="courht_title">
<span>我的咨询</span>
</div>
<!--[if !IE]>我的咨询列表<![endif]-->
<div class="courht_text2">
<div class="table">
<table width="962" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="33" height="32" align="center" valign="middle"></td>
    <td width="280" align="center" valign="middle">商品</td>
    <td width="58" align="center" valign="middle"> </td>
    <td width="146" align="center" valign="middle">咨询分类</td>
    <td width="188"  align="center" valign="middle">咨询内容</td>
	<td width="35"  align="center" valign="middle"></td>
	<td width="222" align="center" valign="middle">回复</td>
  </tr>
</table>
</div>
<div class="table1">
<table width="962" border="0" cellspacing="0" cellpadding="0" align="center">
<!--[if !IE]>列表1<![endif]-->
<c:forEach items="${messageList}" var="message">
  <tr>
    <td width="33"  align="center" valign="middle"></td>
    <td width="280" align="left" valign="middle">
	<div class="phlist">
	<h2><a href="${ctx }/cpxq.do?good.id=${message.goodId }"><img src="${ctx}${message.pic }" border="0" /></a></h2>
    <h3><a href="${ctx }/cpxq.do?good.id=${message.goodId }">${message.goodName }</a></h3>
	</div>
	</td>
      <td width="58" align="center" valign="middle"></td>
    <td width="146" align="center" valign="middle">
	    <c:if test="${message.type=='0'}">商品咨询</c:if>
	    <c:if test="${message.type=='1'}">配送/支付咨询</c:if>
	    <c:if test="${message.type=='2'}">发票/安装保修咨询</c:if>
    </td>
    <td width="188" align="center" valign="middle">${message.content }</td>
	<td width="35"  align="center" valign="middle"></td>
	<td width="222" align="left" valign="middle"><div class="myconsulting"><c:if test="${message.replyState =='1' }">${message.replyContent }</c:if><c:if test="${message.replyContent == '0' }">暂无回复</c:if></div></td>
  </tr>
 </c:forEach>
  <!--[if !IE]>列表1end<![endif]-->
</table>
</div>
</div>
<!--[if !IE]>列表结束<![endif]-->
</div>
<!--[if !IE]>右侧结束<![endif]-->
</div>
</div>
</div>
  <!--[if !IE]>待付款订单完成<![endif]-->
<%@ include file="/WEB-INF/page/front/guanwang/bottom.jsp"%>
</div>
</body>
</html>

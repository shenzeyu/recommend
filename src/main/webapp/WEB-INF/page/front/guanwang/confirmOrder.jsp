<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上理在线学院</title>
<link href="${ctx}/styles/front/style/base.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/styles/front/style/confirmOrder_page.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/styles/front/pro_dropdown_2/pro_dropdown_2.css" />

<script language="javascript" src="${ctx}/scripts/front/js/jquery.js"></script>
<script language="javascript" src="${ctx}/scripts/front/js/index20110925_mini.js"></script>
<script language="javascript" src="${ctx}/scripts/front/js/jquery2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/front/js/jquery1.js"></script>
<script type="text/javascript" src="${ctx}/scripts/front/clients_js/confirmOrder.js"></script>

<script type="text/javascript" src="${ctx }/scripts/front/customer/jquery.provincesCity.js"></script>
<script type="text/javascript" src="${ctx }/scripts/front/customer/provincesdata.js"></script>
<script>
$(document).ready(function(){
  $("#test").ProvinceCity();
});
function changeDiv(tag,method){document.getElementById(tag).style.display = method;}
</script>
<script>
//完成下拉框选择时的模拟行为
function changeSelect(formV,toV){
    document.getElementById(toV).innerHTML = formV.options[formV.selectedIndex].text;
}

</script>

</head>
<body>
<div class="box">
<!--[if !IE]>和确认订单中的加盟店长是一样的<![endif]-->
  <!--[if !IE]>头部<![endif]-->
  <div class="ctop">
    <div class="top_con">
     <div class="top_ctext">您好 ，欢迎您！<span id="top_ctextys"><c:if test="${loginCustomer!=null }">${loginCustomer.code }</c:if></span></div>
      <div class="top_ctext1">
        <input name="" type="button" class="subbmit" onclick="loginOut()" value="退出" />
      </div>
     <div class="top_ctext2"><span class="ys1">
		<c:if test="${loginCustomer!=null }"><a href="${ctx }/customersManage.do" target="_blank">我的在线学院</a> |</c:if>
      <c:if test="${loginCustomer==null }"><a href="javascript:void(0);" onclick="myShops()">我的在线学院</a> |</c:if>
	</span><span class="ys2"><img src="${ctx}/Images/images/a1.jpg" /></span>
	<span class="ys3"><a href="${ctx}/ShoppingCar.do">购物车<c:if test="${shoppingCarSize==null}">0</c:if>${shoppingCarSize }件</a> 
      	
        | <a href="${ctx}/infor.do?information.type=6" >售后服务</a>
        | <a href="${ctx}/infor.do?information.type=7">企业采购</a>
      	| <a href="${ctx}/infor.do?information.type=3">购物指南</a>
      	</span>
      	</div>
    </div>
     
    <!--[if !IE]>logo和搜索框<![endif]-->
    <div class="top_logo">
      <div class="topf">
        <div class="logo">
          <div class="logo01"><a href="${ctx }/index.do"><img src="${ctx }/Images/images/logo2.jpg" /></a></div>


        </div>
        <!--[if !IE]>购物车步骤<![endif]-->
        <div class="shopcart">
          <h1>1、我的购物车</h1>
          <h2>2、填写核对订单信息 </h2>
          <h3>3、成功提交订单</h3>
        </div>
      </div>
    </div>
  </div>
  <!--[if !IE]>中间<![endif]-->
  <div class="content">
    <!--[if !IE]>收货信息 <![endif]-->
    <div class="lookproduct"><span>收货信息 </span></div>
    <!--[if !IE]>收货信息 <![endif]-->
    <input id="linkman" type="hidden" value="$"/>
    <input id="province" type="hidden" value=""/>
    <input id="city" type="hidden" value=""/>
    <input id="region" type="hidden" value=""/>
    <input id="street" type="hidden" value=""/>
    <input id="zipCode" type="hidden" value=""/>
    <input id="mobile" type="hidden" value=""/>
    <input id="customerAdds" type="hidden" value=""/>

    <div class="confirm">
    	<c:forEach items="${customerAddressList}" var="cusAddress">
	      <div class="confirm_text">
	        <h1>
	          <input name="areaclick" type="radio" onclick="hiddenAddress()" id="radio_area_1" value="${cusAddress.id }"  <c:if test="${cusAddress.whetherordrer=='0' }">checked="checked"</c:if>/>
	        </h1>
	        <h2>${cusAddress.name }&nbsp;${cusAddress.address }&nbsp;${cusAddress.street }&nbsp;${cusAddress.zipCode }&nbsp;${cusAddress.mobile }&nbsp;</h2>
	        <h3><a href="javascript:newDisplayAdress('${cusAddress.id }','${cusAddress.name }','${cusAddress.address }','${cusAddress.street }','${cusAddress.zipCode }','${cusAddress.mobile }','${cusAddress.phone }')">修改</a> | <a href="javascript:delectAdress('${cusAddress.id }')">删除</a></h3>
	      </div>	      
      	</c:forEach>
      	<input type="hidden" id="customerAddressId" value=""/>
      <div class="confirm_text">
        <h1>
          <input name="areaclick" type="radio" onclick="newAddress()" id="radio_area_2" value="2" <c:if test="${customerAddressList==null}">checked="checked"</c:if> />
        </h1>
        <h2>新地址</h2>
      </div>
      <div id="newAdress" <c:if test="${customerAddressList!=null}">style="display: none"</c:if>>
		<div class="confirm_text1">
		    <h1><span>*</span>收件人姓名：</h1>
		    <h2>
		       <input id="con_linkman" type="text"  class="confirminput" value="${customerAddress.name }"/>
		    </h2>
	    </div>
	    <!-- 
	    	<div class="confirm_text1">
		       	<h3><span>*</span>省市区：</h3>
				<div class="sb w_50">
	   			<div class="b" id="selectTest0">${customerAddress.province }</div>
				    <select name="RegAndLoginInPublishPage1:dpSex" id="option1" onchange="selectCity(this,'option2',0)">
				    	<option value=''>请选择</option>
				        <c:forEach items="${arealist1}" var="area">
				            <option value="${area.id }">${area.name }</option>
				     	</c:forEach>
				    </select>
				</div>
	    		<h2><span>-</span></h2>
	     		<div class="sb w_50">
	     		<div class="b" id="selectTest1">${customerAddress.city }</div>
	    			<select name="RegAndLoginInPublishPage1:dpSex" id="option2" onchange="selectCity(this,'option3',1)"></select>    
	    		</div>
	         	<h2><span>-</span></h2>
	       		<div class="sb w_50">
	     			<div class="b" id="selectTest2">${customerAddress.region }</div>模拟下拉框的列表显示区域
	    				<select name="RegAndLoginInPublishPage1:dpSex" id="option3" onchange="changeSelect(selectCity(this,'',2))"></select>
	    		</div>
	      	</div>
	     -->
      	
      	<div class="confirm_text1">
	       	<h3><span>*</span>省市区：</h3>
			
			<div id="test"></div>
		</div>
		<div class="confirm_text1" >
	        <h1></h1>
	        <h2>
	          <input type="hidden" name="" id="address1" type="text"  />
              <input type="hidden" name="" id="address2" type="text"  />
              <input type="hidden" name="" id="address3" type="text"  />  
	        </h2>
		</div>
      	
		<div class="confirm_text1">
	        <h1><span>*</span>街道地址：</h1>
	        <h2>
	          <input id="con_street" type="text"  class="confirminput1" value="${customerAddress.street }"/>
	        </h2>
		</div>
		<div class="confirm_text1">
	        <h1><span>*</span>邮政编码：</h1>
	        <h2>
	          <input id="con_zipCode" type="text"  class="confirminput" value="${customerAddress.zipCode }"/><!-- onkeydown="zipCheck()" -->
	        </h2>
		</div>
		<div class="confirm_text1">
	        <h1><span>*</span>手机号码：</h1>
	        <h2>
	          <input id="con_mobile" type="text"  class="confirminput" value="${customerAddress.mobile }"/>
	        </h2>
		</div>
		<div class="confirm_text1">
	        <h1><span>*</span>电话号码：</h1>
	        <h2>
	          <input id="con_phone" type="text"  class="confirminput" value="${customerAddress.phone }"/>
	        </h2>
		</div>
		<div class="confirm_text1">
	        <h4>
			<!--[if !IE]>收获信息确认按钮<![endif]-->
	          <input type="button"  class="confirmbtn" onclick="setinformation()"/>
	        </h4>
		</div>
	   </div>			
    </div>
    <!--[if !IE]>配送方式<![endif]-->
    <div class="lookproduct"><span>配送方式</span></div>
    <div class="confirm">
      <c:forEach items="${deliveryList}" var="delivery" varStatus="i">
	      <div class="confirm_text">
	        <h1>
	          <input name="saleOrder.deliveryId" type="radio" value="${delivery.id }" <c:if test="${i.index=='0' }">checked="checked"</c:if> onclick="selectdeliveryfee('${delivery.deliveryFee}')"/>
	        </h1>
	        <h5>${delivery.name}</h5>
	        <h5>${delivery.deliveryFee}</h5>
	        
	        <h3><a href="${ctx }/infor.do?information.id=3B74DAD74177D1635FD0DD0B85567AC7" target="_blank">查看e购商城配送的适用范围</a></h3>
	      </div>
      </c:forEach>
      <div class="confirm_text">
        <h4>送货时间（送货时间仅作参考，快递公司会尽量满足您的要求）</h4>
      </div>
      <div class="confirm_text">
        <h1>
          <input name="saleOrder.deliveryDate" type="radio" value="0"  checked="checked"/>
        </h1>
        <h2>工作日送</h2>
      </div>
      <div class="confirm_text">
        <h1>
          <input name="saleOrder.deliveryDate" type="radio" value="1"/>
        </h1>
        <h2>作日、双休及节假日都可以送</h2>
      </div>
      <div class="confirm_text">
        <h1>
          <input name="saleOrder.deliveryDate" type="radio" value="2"/>
        </h1>
        <h2>双休日、节假日送</h2>
      </div>
    </div>
    <!--[if !IE]>支付方式<![endif]-->
    <div class="lookproduct1"><span>支付方式</span></div>
    <div class="confirm">
    <c:forEach items="${paymentList}" var="payment">
    	<c:if test="${payment.code != 'payonline' && payment.code != 'alipay'}">
    		<div class="confirm_text2">
		        <h1>
		          <input name="saleOrder.paymentId" type="radio" value="${payment.id }" />
		        </h1>
		        <h2>${payment.name }</h2>
		        <h4>备注：</h4>
		      </div>
    	</c:if>
        <c:if test="${payment.code == 'payonline' || payment.code == 'alipay'}">
        	<div class="confirm_text2">
		        <h1>
		          <input name="saleOrder.paymentId" type="radio" value="${payment.id }" checked="checked"/>
		        </h1>
		        <h2>${payment.name }</h2>
		        <h4>备注：<c:if test="${payment.code == 'payonline'}">通过网上银行或支付平台在线付款</c:if></h4>
		      </div>
        </c:if>
     </c:forEach>
    
      
      <!--[if !IE]>网上银行<![endif]-->
      <div class="Payment">
        <div class="Payment01">网上银行</div>
        <div class="Payment02">
          <ul>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="ICBCB2C" checked="checked" />
              </h1>
              <h2><img src="${ctx }/Images/bank/ICBCB2C.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="BOCB2C" />
              </h1>
              <h2><img src="${ctx }/Images/bank/BOCB2C.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="CMB" />
              </h1>
              <h2><img src="${ctx }/Images/bank/CMB.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="CCB" />
              </h1>
              <h2><img src="${ctx }/Images/bank/CCB.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="ABC" />
              </h1>
              <h2><img src="${ctx }/Images/bank/ABC.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="CIB" />
              </h1>
              <h2><img src="${ctx }/Images/bank/CIB.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="COMM" />
              </h1>
              <h2><img src="${ctx }/Images/bank/COMM.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="NBBANK" />
              </h1>
              <h2><img src="${ctx }/Images/bank/NBBANK.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="SHBANK" />
              </h1>
              <h2><img src="${ctx }/Images/bank/SHBANK.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="CEBBANK" />
              </h1>
              <h2><img src="${ctx }/Images/bank/CEBBANK.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="HZCBB2C" />
              </h1>
              <h2><img src="${ctx }/Images/bank/HZCBB2C.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="SPDB" />
              </h1>
              <h2><img src="${ctx }/Images/bank/SPDB.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="CITIC" />
              </h1>
              <h2><img src="${ctx }/Images/bank/CITIC.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="CMBC" />
              </h1>
              <h2><img src="${ctx }/Images/bank/CMBC.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="GDB" />
              </h1>
              <h2><img src="${ctx }/Images/bank/GDB.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="CIB" />
              </h1>
              <h2><img src="${ctx }/Images/bank/CIB.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="SPABANK" />
              </h1>
              <h2><img src="${ctx }/Images/bank/SPABANK.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="BJRCB" />
              </h1>
              <h2><img src="${ctx }/Images/bank/BJRCB.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="FDB" />
              </h1>
              <h2><img src="${ctx }/Images/bank/FDB.jpg" /></h2>
            </li>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="POSTGC" />
              </h1>
              <h2><img src="${ctx }/Images/bank/POSTGC.jpg" /></h2>
            </li>
          </ul>
        </div>
        <div class="Payment03">支付平台</div>
        <div class="Payment02">
          <ul>
            <li>
              <h1>
                <input name="bank_code" type="radio" value="ZFB" />
              </h1>
              <h2><img src="${ctx }/Images/bank/ZFB.jpg" /></h2>
            </li>
          </ul>
        </div>
      </div>
      <!--[if !IE]>网上银行结束<![endif]-->
    </div>
    
    <!--[if !IE]>发票信息<![endif]-->
    <!-- 储存发票信息 -->
      <input type="hidden" id="invoiceType" value="${order.invoiceType}"/>			<!-- 类型 -->
      <input type="hidden" id="invoicePayable" value="${order.invoicePayable}"/>		<!-- 类型抬头 -->
      <input type="hidden" id="invoiceContent" value="${order.invoiceContent}"/>		<!-- 类型类容 -->
    <div class="lookproduct1"><span>发票信息</span></div>
    <div class="confirm">
      <div class="confirm_text2">
        <h1>
          <input name="invoice" id="invoiceid" type="radio" <c:if test="${order.invoicePayable!=null }">checked="checked"</c:if>/>
        </h1>
        <h2>普通发票</h2>
        <h3><a href="javascript:invoiceDiv('1')">修改</a> | <a href="javascript:Delinvoice()">删除</a></h3>
      </div>
      <div class="confirm_text2">
        <h1>
          <input name="invoice" type="radio" onclick="invoiceDiv('')" <c:if test="${order.invoicePayable==null }">checked="checked"</c:if>/>
        </h1>
        <h2>使用新发票</h2>
      </div>
      <div class="Invoice" id="iInvoices" <c:if test="${order.invoicePayable!=null }">style="display: none"</c:if>>
        <div class="Invoice01">
          <h1><span>*</span>发票类型：</h1>
          <h2><span>
            <input id="con_invoiceType" type="radio" value="0" <c:if test="${order.invoiceType==null||order.invoiceType=='0'}">checked="checked"</c:if>/>
            </span><samp>普通</samp></h2>
          <h3>开增值税发票请<a href="#">联系客服</a></h3>
        </div>
        <div class="Invoice02">
          <h1><span>*</span>发票抬头：</h1>
          <h2>
            <input id="con_invoicePayable" type="text"  class="confirminput" />
          </h2>
        </div>
        <div class="Invoice01">
          <h1><span>*</span>发票内容：</h1>
          <h2><span>
            <input id="con_invoiceContent" type="radio" checked="checked" value="0" />
            </span><samp>商品明细</samp></h2>
        </div>
        <div class="Invoice03">
		<!--[if !IE]>使用发票确认按钮<![endif]-->
          <input name="" type="button"  class="confirmbtn" onclick="setinvoice()"/>
        </div>
      </div>
    </div>
    <!--[if !IE]>商品清单<![endif]-->
    <div class="lookproduct5"><span>商品清单</span><samp><a href="${ctx }/ShoppingCar.do">返回购物车修改</a></samp></div>
    <!--[if !IE]>商品清单列表<![endif]-->
    <div class="itemList">
      <table width="1199" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="itemListborder" height="42" width="33"></td>
          <td width="627" align="left" valign="middle" class="itemListborder">产品</td>
          <td width="100" align="center" valign="middle" class="itemListborder">数量</td>
          <!-- <td width="100" align="center" valign="middle" class="itemListborder">服务</td> -->
          <td width="150" align="center" valign="middle" class="itemListborder">规格</td>
          <td width="100" align="center" valign="middle" class="itemListborder">价格</td>
          <td width="139" align="center" valign="middle" class="itemListbg1">小计 </td>
        </tr>
		<c:set var="totalMoney" value="0"/>
        <c:forEach items="${goodsInCarList}" var="good">
			<c:set var="totalMoney" value="${totalMoney + good.totalMoney}"/>
	        <tr>
	          <td width="33" height="42" align="center" valign="middle" class="itemListborder1"></td>
	          <td width="627" align="left" valign="middle" class="itemListborder1"><div class="phlist">
	              <h2><a href="${ctx }/cpxq.do?good.id=${good.goodId }" target="_blank"><img src="${ctx }${good.pic }" border="0" /></a></h2>
	              <h3><a href="${ctx }/cpxq.do?good.id=${good.goodId }" target="_blank">${good.name }</a></h3>
	            </div></td>
	          <td width="100" align="center" valign="middle" class="itemListborder1"><span class="itemListys">${good.count }</span></td>
	          <!-- <td width="100" align="center" valign="middle" class="itemListborder1">上门安装</td> -->
	          <td width="150" align="center" valign="middle" class="itemListborder1">${good.specificationVal }</td> 
	          <td width="100" align="center" valign="middle" class="itemListborder1"><span class="font">¥<span>${good.price }</td>
	          <td width="139" align="center" valign="middle" class="itemListbg"><span class="font">¥<span>${totalMoney}</td>
	        </tr>
        </c:forEach>
      </table>
    </div>
    <!--[if !IE]>商品清单列表结束<![endif]-->
    <!--[if !IE]>运费<![endif]-->
    <div class="itemList1">
      <h1>
      	  <span class="fontys1">运费</span>
	      <span id="font1">¥</span> 
	      <span class="fontys2" id="fontDIV">
	      	 <c:forEach items="${deliveryList}" var="delivery" varStatus="i">
		          <c:if test="${i.index=='0' }">
		          	${delivery.deliveryFee }
		          </c:if>
	      	 </c:forEach>
	      </span>
      </h1>
    </div>
    <!--[if !IE]>运费结束<![endif]-->
	<!--[if !IE]>订单结算<![endif]-->
	<div class="itemList2">
	<div class="itemList201">
	<div class="itemList201_text">订单结算</div>
	<!--[if !IE]>优惠券的使用<![endif]-->
	<div class="itemList201_text1">
	<div class="itemList201_text101"><h1>使用优惠券：</h1><h2>  <input id="srachcode" type="text"  class="confirminput2"/></h2></div>
	<div class="itemList201_text102"><h1>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</h1><h2><textarea name="" cols="" rows="" class="confirmtextare"></textarea></h2></div>
	</div>
	<div class="itemList201_text103">
	<div class="itemList201_text10302"><a href="#" >确认</a></div>
	<div class="itemList201_text10301"><a href="javascript:void(0)" onclick="srachCoupon()">选择优惠券</a></div>
	<!--[if !IE]>点击使用出现的使用优惠券弹出层<![endif]-->
	<div class="layer" id="surch" style="display: none">
	<div class="layer01">
	<h1>选择要使用的现金券</h1>
	<!--[if !IE]>弹出层关闭按钮<![endif]-->
	<h2><input name="" type="button"  class="layer01btn" onclick="closesrach()"/></h2>
	</div>
	<div class="layer02" id="layer_yh">
	<div class="layer02_text">没有现金券可用</div>
	</div>
	</div>
	<!--[if !IE]>弹出层结束<![endif]-->
	</div>
	</div>
	<!--[if !IE]>总运算<![endif]-->
	<div class="itemList202">
	<input type="hidden" id="totalMoney" value="${totalMoney }"/>
	<input type="hidden" id="totalMoney2" value="${totalMoney }"/>
	<div class="itemList20201" id="money1DIV"><h1>合&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计：</h1><h2><samp>¥</samp>${totalMoney }</h2></div>
	<div class="itemList20201"><h1>优&nbsp;&nbsp;惠&nbsp;&nbsp;券：</h1><h3 id="surmony"><span style="padding-right:5px;">-</span><samp>¥</samp>0.00</h3></div>
	<div class="itemList20201" id="money2DIV"><h1>&nbsp;应付总额：</h1><h4 id="surmeryt"><span>¥</span>${totalMoney}</h4></div>
	<!--[if !IE]>确认按钮-提交订单<![endif]-->
	<div class="itemList20202"><input name="" type="button" class="itemList20202btn" onclick="sumbitOrder()"/></div>
	<!--[if !IE]>确认按钮<![endif]-->
	</div>
	<!--[if !IE]>总运算结束<![endif]-->
	</div>
	<!--[if !IE]>订单运算结束<![endif]-->
  </div>
  <!--[if !IE]>注释<![endif]-->
<!--  <div style="font-size:30px; font-weight:bold; text-align:center; color:#FF0000;">和确认订单中的加盟店长是一样的(收获信息里没有新地址，下面没有合计和优惠券金额)</div>-->
   <!--[if !IE]>注释完成<![endif]-->
  <!--[if !IE]>中间完成<![endif]-->
  <%@ include file="/WEB-INF/page/front/guanwang/bottom.jsp"%> 
<!--  <iframe width="100%" height="500" frameborder=0 scrolling=no src="bottom.htm" style="padding-top:0px;"></iframe>-->
  
</div>

</body>
</html>

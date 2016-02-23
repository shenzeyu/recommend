<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml;http://open.weibo.com/wb" >
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上理在线学院</title>
<link href="${ctx}/styles/front/style/base.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/styles/front/style/login_page.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/styles/front/pro_dropdown_2.css" />
<script src="${ctx}/scripts/front/js/stuHover.js" type="text/javascript"></script>
<script language="javascript" src="${ctx}/scripts/front/js/jquery.js"></script>
<script language="javascript" src="${ctx}/scripts/front/js/index20110925_mini.js"></script>
<script language="javascript" src="${ctx}/scripts/front/js/jquery2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/front/js/jquery1.js"></script>
<script type="text/javascript" src="${ctx }/scripts/front/customer/login.js"></script>
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" 
	data-appid="100254019" data-redirecturi="www.1wandian.com" charset="utf-8"></script><!-- QQ登录最新版本的JS SDK --> 
	
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=922377257" type="text/javascript" charset="utf-8"></script>

<script>
function changeDiv(tag,method){document.getElementById(tag).style.display = method;}
</script>


<script type="text/javascript">
    QC.Login({
       btnId:"qqLoginBtn"	//插入按钮的节点id
}); 

</script>
<script type="text/javascript">
WB2.anyWhere(function(W){
		W.widget.connectButton({
			id: "wb_connect_btn",	
			type:'2,2',
			callback : {
				login:function(o){	//登录后的回调函数
					alert("login: "+o.screen_name)	
				},
				logout:function(){	//退出后的回调函数
					alert('logout');
				}
			}
		});
	});
		

function login(o){
	alert(o.screen_name)
}
function logout(){
	alert('logout');
}



</script>

</head>
<body>
<div class="box">
<!--<script id='denglu_login_js' type='text/javascript' charset='utf-8'></script>-->
<!--<script type='text/javascript' charset='utf-8'>-->
<!--	(function() {-->
<!--		var _dl_time = new Date().getTime();-->
<!--		var _dl_login = document.getElementById('denglu_login_js');-->
<!--		_dl_login.id = _dl_login.id + '_' + _dl_time;-->
<!--		_dl_login.src = 'http://open.denglu.cc/connect/logincode?appid=97794denR7Az3eQYNT8GDaqAAeflxA&v=1.0.2&widget=1&styletype=1&size=452_132&asyn=true&time=' + _dl_time;-->
<!--	})();-->
<!--</script>-->
<%@ include file="/WEB-INF/page/front/guanwang/header.jsp"%>
  <!--[if !IE]>中间<![endif]-->
  <div class="content">
  <div class="login">
  <!--[if !IE]>左侧<![endif]-->
  <div class="login01">
  <div class="login01_text">
  <div class="login01_text01">
  <span>行货正品</span>
  全部资料保证行货正品，您可放心购物
  </div>
  <div class="login01_text01">
  <span>正规发票</span>
  全部资料均可提供正规商业发票
  </div>
   <div class="login01_text01">
  <span>当日发货</span>
  资料购买后当天发货，部分地区24小时内到货
  </div>
   <div class="login01_text01">
  <span>七天包退</span>
  购买七天之内可无理由退货
  </div>
  </div>
  </div>
  <!--[if !IE]>右侧<![endif]-->
  <div class="login02">
  <div class="login0201"><img src="${ctx}/Images/images/y4.jpg" /></div>
  <div class="login0202">
     <form action="" id="loginForm" name="loginForm" method="post">
	  <div class="login0202_text">e购商城学员登录</div>
	  <div class="login0202_text1" style="padding-top: 15px; height: 50px;">
	  <h1>账号：</h1>
	  	  <h2><input style="color:#CCC" name="customer.code" id="codesY" type="text"  class="login0202_text1input" onfocus="dlbh()" onblur="sqbh()"  value="昵称/邮箱/已注册手机"  /></h2>
	  	  <h3 id="loginMessage" style="display: none;"></h3>
	  </div>
	   <div class="login0202_text1">
	  <h1>密码：</h1>
	  <h2><input name="customer.pwd" id="pwdsY" type="password"  class="login0202_text1input" onclick="dlbh1()" onfocus="this.style.border='1px solid #FEA710'" onblur="this.style.border='1px solid #dadada';"  /></h2>
	  
	  </div>
	  <div class="login0202_text2">
	  <h1><input name="" type="button"  class="login0202_text1btn" value="登录"  onclick="submitForm()"/></h1>
	  <h2><a href="#">忘记密码</a></h2><!-- forgotPassword.html -->
	  </div>
     </form>
  <div class="login0202_text3">
  <div class="login0202_text301">
 <samp>还不是e购商城用户？</samp></div>
 <div class="login0202_text302">
现在免费注册e购商城学员，便能立即享<br />受便宜又放心的购物乐趣!
<span><a href="${ctx }/zhuce.do">学员注册</a></span>  
</div>
  </div>
  <div class="login0202_text4">
  <h1>使用其他方式登录</h1>
  <h2>
  		<!-- https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=100254019&redirect_uri=www.1wandian.com&scope=get_user_info -->
	  <span id=""><a href="#"><img src="${ctx}/Images/images/lon1.jpg" border="0" alt="QQ登录" onclick="toQzoneLogin()"/></a></span>
	  <span id=""><img src="${ctx}/Images/images/lon2.jpg" border="0"  alt="新浪微博登录"/></span>
	  <span><a href="javascript:void(0);"><img src="${ctx}/Images/images/lon3.jpg" border="0"  alt="支付宝登录"/></a></span>
  </h2>
  </div>
  </div>
  <div class="login0201"><img src="${ctx}/Images/images/y7.jpg" /></div>
  </div>
  <!--[if !IE]>右侧结束<![endif]-->
  </div>
  </div>
  <!--[if !IE]>中间登录结束<![endif]--> 
  <%@ include file="/WEB-INF/page/front/guanwang/bottom.jsp"%> 
</div>


</body>
</html>

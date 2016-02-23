<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上理在线学院系统</title>
<link href="${ctx}/styles/front/style/index_page.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/styles/front/style/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/styles/front/pro_dropdown_2/pro_dropdown_2.css" />
<script language="javascript" src="${ctx}/scripts/front/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/scripts/front/js/lanrentuku.js"></script>
<script language="javascript" src="${ctx}/scripts/front/js/index20110925_mini.js"></script>
<script type="text/javascript" src="${ctx}/scripts/front/clients_js/index.js"></script>	


<script id='denglu_login_js' type='text/javascript' charset='utf-8'></script>
<script type='text/javascript' charset='utf-8'>
	(function() {
		var _dl_time = new Date().getTime();
		var _dl_login = document.getElementById('denglu_login_js');
		_dl_login.id = _dl_login.id + '_' + _dl_time;
		_dl_login.src = 'http://open.denglu.cc/connect/logincode?appid=97794denR7Az3eQYNT8GDaqAAeflxA&v=1.0.2&widget=1&styletype=1&size=452_132&style=popup&asyn=true&time=' + _dl_time;
	})();
</script>


<style type="text/css">  
        /*滚动广告样式*/  
        .ad {margin:1px;width:935px; height:321px;overflow:hidden;border:0px solid #AAAAAA;position:relative;}  
        .slider,.num{position:absolute;}  
        .slider li{ list-style:none;display:inline;}  
        .slider img{ width:935px; height:321px;display:block;}  
        .num{ right:5px; bottom:5px;}  
        .num li{float: left;color: #FF7300;text-align: center;line-height: 16px;width: 16px;height: 16px;font-family: Arial;font-size: 12px;cursor: pointer;overflow: hidden;margin: 3px 1px;border: 1px solid #FF7300;background-color: #fff;}  
        .num li.on{color: #fff;line-height: 21px;width: 21px;height: 21px;font-size: 16px;margin: 0 1px;border: 0;background-color: #FF7300;font-weight: bold;}  
</style>



</head>
<body>
<%@ include file="/WEB-INF/page/front/guanwang/header.jsp"%>
<script> 
	d = document.getElementById("nav1"); 
	var aa = d.getElementsByTagName("a"); 
	aa[0].className = "link_on";   //加载默认
	d.l = aa[0]; 
	for(var i in aa){ 
		var a = aa[i]; 
		a.onclick = function(){
			if(d.l==this){
				return; 
			}else{
				this.className = d.l.className; 
				d.l.className = ""; 
				d.l = this; 
			}
		}; 
	};
</script>
<div class="box">
<!--<iframe width="100%" height=191 frameborder=0 scrolling=no src="${ctx}/WEB-INF/page/front/guanwang/header.jsp"></iframe>-->

  <!--[if !IE]>中间<![endif]-->
  <div class="content">
    <div class="brand">
      <!--[if !IE]>左侧分类<![endif]-->
      <div class="brang01">
        <div id="warp1000">
          <div id="allsort">
            <div id="allsortlist">
            <c:forEach items="${goodTypeList}" var="goodType1" begin="0" end="8">
              <!--[if !IE]>大家电<![endif]-->
              <div class="navlist icon01">
                <h3>
                  <div id="t_text">
                    <div id="t_text01" onmouseover="PromotionBrand('${goodType1.id}','${ctx}')"><a href="${ctx }/getFirstLevelPage.do?goodtype.id=${goodType1.id}&goodtype.searchType=1" >${goodType1.name}</a></div>
                    <div id="t_text02">
                    	<c:forEach items="${goodType1.children}" var="goodType2" begin="0" end="2">
                    		<a href="${ctx }/getSecondGoods.do?goodType.id=${goodType2.id }" id="ta">${goodType2.name}</a> <!-- &goodType.parentId=${goodType1.id }&good.str=1 -->
                    	</c:forEach>
                    </div>
                  </div>
                </h3>
                <div class="navmore">
                  <div class="tv">
                 	 <c:forEach items="${goodType1.children}" var="goodType2" >
                    	<div class="tv01">
                    		<div class="tv01_title"><a href="${ctx }/getSecondGoods.do?goodType.id=${goodType2.id }" style="color:#333333; font-size:14px; font-family:'宋体'; font-weight:bold;">${goodType2.name}</a></div>
		                    <div class="tv01_title2">
			                    <c:forEach items="${goodType2.children}" var="goodType3">
			                    	<a href="${ctx }/getSecondGoods.do?goodType.id=${goodType3.id }" >${goodType3.name}</a>
			                    </c:forEach>		
		                    </div>
	                	</div>
	                </c:forEach>	
                   </div>
                  <div class="tv1">
                  </div>
                </div>
              </div>
              </c:forEach>
              <!--[if !IE]>end<![endif]-->
            </div>
          </div>
        </div>
      </div>
      <!--[if !IE]>右侧<![endif]-->
      <div class="brang02">
        <!--[if !IE]>banner<![endif]-->
<div class="ad" >  
  	<ul class="slider" >
	    	<li><a href=""><IMG alt="1" src="${ctx}/Images/adShow/adShow01.jpg" /></a></li>
	        <li><a href=""><IMG alt="2" src="${ctx}/Images/adShow/adShow02.jpg" /></a></li>
	        <li><a href=""><IMG alt="3" src="${ctx}/Images/adShow/adShow03.jpg" /></a></li>
	        <li><a href=""><IMG alt="4" src="${ctx}/Images/adShow/adShow04.jpg" /></a></li>
  	</ul>
  	<ul class="num" >  
        <li>1</li>  
        <li>2</li>  
        <li>3</li>  
        <li>4</li>     
  	</ul>  
</div>
      </div>
    </div>
  </div>
  <!--[if !IE]>下面内容<![endif]-->
  <div class="content1">
    <!--[if !IE]>为你推荐<![endif]-->
    <div class="buy">
      <div class="buy01">
        <div class="buy01_text"> <samp>为你推荐</samp> <span><a href="${ctx }/miaosha.do"><img src="${ctx}/Images/images/a15.jpg" border="0" /></a></span></div>
        <div class="buy01_text2">
          <!--[if !IE]>第一个小图<![endif]-->
          <c:forEach items="${goodList1}" begin="0" end="3" var="good" varStatus="i">
	          <div class="tg01">
	            <div class="tg01_text2"><a href="${ctx }/cpxq.do?good.id=${good.id }"><img src="${ctx}${good.pic }" border="0" /></a></div>
	            <div class="tg01_text3">
	            <div class="tg01_text301">
	             <div class="tg01_text301_title"><a href="${ctx }/cpxq.do?good.id=${good.id }">${good.name }<span>${good.introBrief }</span></a></div>
	              </div>
	            </div>
	          </div>
         </c:forEach>
        </div>
      </div>
      <!--[if !IE]>公告<![endif]-->
      <div class="tug02">
        <div class="tug02_news">
          <div class="tug02_news01"> <samp>公&nbsp;&nbsp;告</samp> <span><a href="${ctx }/newnews.do"><img src="${ctx}/Images/images/a15.jpg" border="0" /></a></span> </div>
          <div class="tug02_news02">
            <div class="tug02_ntext">
              <ul>
              	<c:forEach items="${inforlist}" var="information" begin="0" end="8" varStatus="i">
              		<c:if test='${i.index==0 }'>
   						<li class="tugys" style="margin: 0;"><a href="${ctx }/oneNewsdetail.do?information.id=${information.id }">${information.title }</a></li>
   					</c:if>		           			
               		<c:if test='${i.index!=0 }'>
   						<li style="margin: 0;"><a href="${ctx }/oneNewsdetail.do?information.id=${information.id }">${information.title }</a></li>
   					</c:if>	
               	</c:forEach>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!--[if !IE]>end<![endif]-->
    </div>
    <!--[if !IE]>为你推荐结束<![endif]-->
    <!--[if !IE]>最新课程<![endif]-->
    <div class="Interest">
    <div class="Interest01"><samp>最新课程</samp></div>
    <div class="Interest02">
    <ul>
    
    <!--[if !IE]>第一个产品循环<![endif]-->
   
	    <c:forEach items="${goodList2}" var="good" begin="0" end="4">
	    <li><a href="${ctx }/cpxq.do?good.id=${good.id }"><img src="${ctx}${good.pic }" /></a>
	      <p><a href="${ctx }/cpxq.do?good.id=${good.id }">${good.name }<samp>${good.introBrief }</samp></a></p>
	    </c:forEach>
  
    
   
    <!--[if !IE]>第一个产品结束<![endif]-->
		
    </ul>
    </div>
    </div>
  </div>
 <%@ include file="/WEB-INF/page/front/guanwang/bottom.jsp"%> 
<!--<iframe width="100%" height="500" frameborder=0 scrolling=no src="bottom.htm" ></iframe>-->
</div>
</body>

</html>

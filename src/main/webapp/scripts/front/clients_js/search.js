$(document).ready(function(){
  hiddens();
  shoptypeGoods('','','','1');  //调用查询方法
  shoptypeGoods2('','','','1');  //调用查询方法
});


function hiddens(){
	$('#button2').hide();
}

//改变价格图片按钮样式
function chgbPrice(){	
	if(document.getElementById("px1").className=="contr"){		
		document.getElementById("px1").className="contr2"
		changeSort('recommend');
	}else{		
		document.getElementById("px1").className="contr";	
		changeSort('ascPrice');
	}
}


//改变被选中资料属性的css
function upstyle(obj,i,value,str){  //参数value的值即为选择的属性值
	document.getElementsByName(str)[0].id="";  
	var arrVal='';
	var brandVal='';
	var to='';
	var tobrand='';
	if(obj.id=="current"){  //取消  
		if(str!='brand'){   //非品牌
			obj.id="";
			var str=$('#proptStr').val();
			var arr = new Array();
			arr = str.split(",");
			for(a=0;a<arr.length;a++){
				if(value!=arr[a]){
					if(arr[a]!='')
					arrVal+=arr[a]+',';
				}
			}
			$('#proptStr').val(arrVal);	
		}else{      //品牌类
			obj.id="";
			var str=$('#brandStr').val();
			var arr = new Array();
			arr = str.split(",");
			for(a=0;a<arr.length;a++){
				if(value!=arr[a]){
					if(arr[a]!='')
					brandVal+=arr[a]+',';
				}
			}
			$('#brandStr').val(brandVal);	
		}
		shoptypeGoods('','','','1');  //调用查询方法
	}else{     //选中
		if(str!='brand'){
			obj.id="current";
			var str=$('#proptStr').val();
			to +=str+value+',';
			$('#proptStr').val(to);
		}else{
			obj.id="current";
			var str=$('#brandStr').val();
			tobrand +=str+value+',';
			$('#brandStr').val(tobrand);
		}
		shoptypeGoods('','','','1');  //调用查询方法
	}
}
function selectAlltype(obj,str){ 
	obj.id="current2";
	if(str=='goodbrand'){
		$('#brandStr').val('');	
	}
	if(str=='goodprop'){
		$('#proptStr').val('');
	}

	for(i=0;i<document.getElementsByName(str).length;i++){
			document.getElementsByName(str)[i].id="";  
		}
	shoptypeGoods('','','','1');  //调用查询方法
}

//取值
function changeSort(values){
	var a = $('#apptypes').val();  
	if(values!=null){
		$('#proptes').val(values);
		if(a == 'tuxing'){
			shoptypeGoods('','','','1');  //调用查询方法
		} else {
			shoptypeGoods2('','','','1');  //调用查询方法
		}
	}
}

//资料以图片形式展示
function shoptypeGoods(aa,bb,cc,pageIndex){    
	var typeid=$('#typeid').val();  //用于第一次访问
	var url='';  
	
	var a = $('#proptStr').val();	
	if(a != ''){
		url += '&good.filesPage3='+a;
	}
	var b = $('#brandStr').val();	
	if(b!=''){
		url += '&good.brandseaPage3='+b; 
	}
	var proptes = $('#proptes').val();
	if(proptes != ''){
		url += '&good.sortVal='+proptes;
	}

	var apptypes = $('#apptypes').val();
	if(proptes != ''){
		url += '&good.apptypes='+apptypes;
	}
	
	var typeNames = $('#typeNames').val();
	if(typeNames != ''){
		url += '&good.name=' + typeNames;
	}
	
	var shoptypeNames = $('#shoptypeNames').val();
	if(shoptypeNames != ''){
		url += '&good.name=' + shoptypeNames;
	}
	
	var goodBrandId = $('#goodBrandId').val();
	if(goodBrandId != ''){
		url += '&good.brandId=' + goodBrandId;
	}
	
	var htmlText=""; 
	$('#photolist02').empty();
	$.ajax({
			type: "POST",
			async: false,
			cache: false,
			url: ctx+'/productPage3Json.do?good.typeidPage3='+typeid+'&pageInfo.pageIndex='+pageIndex,
			data:url,
			success : function(returnData){    
				rows=eval(returnData).rows;
				pageInfo=eval(returnData).pageInfo;
				htmlText+="<ul>";
				for(i=0;i<rows.length;i++){
					var good=rows[i];
                    htmlText+="<li> <a href='"+ctx+"/cpxq.do?good.id="+good.id+"'><img id='img1154"+i+"' src='"+ctx+good.pic+"' /></a>";
                    htmlText+="<p><a href='"+ctx+"/cpxq.do?good.id="+good.id+"'>"+good.name+"<span>"+good.introBrief+"</span></a></p>";
                    htmlText+="<h1>¥"+good.price+"<span>市场价：</span><samp><span class='font'>¥</span>"+good.priceMarket+"</samp></h1>";
                    htmlText+="<h2><span><img src='"+ctx+"/Images/images/photo9.jpg' /></span><samp><a href='"+ctx+"/cpxq.do?good.id="+good.id+"'>(已有";
                    if(good.commentCount==null){
						htmlText+="0";
					}
					if(good.commentCount!=null){
						htmlText+=good.commentCount;
					}
                    htmlText+="人评价)</a></samp></h2>";
                    htmlText+="<h3><span><a href=javascript:addGoodToCart('"+good.id+"') id='1154"+i+"' class='listcart'>加入购物车</a></span><a href='javascript:void(0);' onclick=addGoodToFavorite('"+good.id+"')>收藏</a></h3></li>";
				}
				$('#photolist02').append(htmlText);	
				//设置分页参数
				$('#count').val(pageInfo.count);      
				$('#pageSize').val(pageInfo.pageSize);
				$('#pageCount').val(pageInfo.pageCount);
				$('#pageIndex').val(pageInfo.pageIndex);
				
				$('#page1').text(pageInfo.pageIndex);
				$('#page2').text(pageInfo.pageCount);
				
				init(pageInfo.pageIndex);
				if(pageInfo.count>0)$('#pagerBot').css('display','block');
				if(pageInfo.count<1)$('#pagerBot').css('display','none');
			},
			error : function(){
				alert('系统错误!');
			}
		});
}


//资料以列表形式展示
function shoptypeGoods2(aa,bb,cc,pageIndex){    
	var typeid=$('#typeid').val();  //用于第一次访问
	var url='';  
	
	var a = $('#proptStr').val();	
	if(a != ''){
		url += '&good.filesPage3='+a;
	}
	var b = $('#brandStr').val();	
	if(b!=''){
		url += '&good.brandseaPage3='+b; 
	}
	var proptes = $('#proptes').val();
	if(proptes != ''){
		url += '&good.sortVal='+proptes;
	}

	var apptypes = $('#apptypes').val();
	if(proptes != ''){
		url += '&good.apptypes='+apptypes;
	}
	
	var typeNames = $('#typeNames').val();
	if(typeNames != ''){
		url += '&good.name=' + typeNames;
	}
	
	var shoptypeNames = $('#shoptypeNames').val();
	if(shoptypeNames != ''){
		url += '&good.name=' + shoptypeNames;
	}
	
	var goodBrandId = $('#goodBrandId').val();
	if(goodBrandId != ''){
		url += '&good.brandId=' + goodBrandId;
	}
	
	var htmlText=""; 
	$('#con_one_2').empty();
	$.ajax({
			type: "POST",
			async: false,
			cache: false,
			url: ctx+'/productPage3Json.do?good.typeidPage3='+typeid+'&pageInfo.pageIndex='+pageIndex,
			data:url,
			success : function(returnData){    
				rows=eval(returnData).rows;
				pageInfo=eval(returnData).pageInfo;

				for(i=0;i<rows.length;i++){
					var good=rows[i];
                   
                    htmlText+="<div class='wantedList'>";
	                htmlText+="<div class='wantedList01'>";
		            htmlText+="<div class='wantedList01_text'><a href='"+ctx+"/cpxq.do?good.id="+good.id+"'><img src='"+ctx+good.pic+"' /></a></div>";
		            htmlText+="<div class='wantedList01_text1'>"; 
					htmlText+="<p><a href='"+ctx+"/cpxq.do?good.id="+good.id+"'>"+good.name+"<span class='wancolor'>"+good.introBrief+"</span></a></P>";
					htmlText+="<samp>¥"+good.price+"</samp>";
			        htmlText+="<h1><span><img src='"+ctx+"/Images/images/photo9.jpg' /></span><samp><a href='"+ctx+"/cpxq.do?good.id="+good.id+"'>(已有";
			        if(good.commentCount==null){
						htmlText+="0";
					}
					if(good.commentCount!=null){
						htmlText+=good.commentCount;
					}
			        htmlText+="人评价)</a></samp></h1></div></div>";
	                htmlText+="<div class='wantedList02'><a href=javascript:addGoodToCart('"+good.id+"') id='1154"+i+"' class='listcart'>加入购物车</a><span><a href='javascript:void(0);' onclick=addGoodToFavorite('"+good.id+"')>收藏</a></span></div>";
                 	htmlText+="</div>";
                   
                   
                   
//                    htmlText+="<h3><span><a href=javascript:addGoodToCart('"+good.id+"') id='1154"+i+"' class='listcart'>加入购物车</a></span><a href='javascript:void(0);' onclick=addGoodToFavorite('"+good.id+"')>收藏</a></h3></li>";
				}
				$('#con_one_2').append(htmlText);	
				//设置分页参数
				$('#count').val(pageInfo.count);      
				$('#pageSize').val(pageInfo.pageSize);
				$('#pageCount').val(pageInfo.pageCount);
				$('#pageIndex').val(pageInfo.pageIndex);
				
				$('#page1').text(pageInfo.pageIndex);
				$('#page2').text(pageInfo.pageCount);
				
				init(pageInfo.pageIndex);
				if(pageInfo.count>0)$('#pagerBot').css('display','block');
				if(pageInfo.count<1)$('#pagerBot').css('display','none');
			},
			error : function(){
				alert('系统错误!');
			}
		});
}



//加入收藏
function addGoodToFavorite(goodId){
    // 资料Id
	if(goodId != ''){
		var url = ctx +"/addGoodToFavorite.do?favorite.goodId="+goodId;
		$.ajax({
			type: "POST",
		  	async: false,
		  	cache: false,
		  	url: url,  
		  	success : function(returnData){ 
				if(returnData=='true'){
					alert("收藏成功");
				}else if(returnData=='frontLogin'){
					ShowDiv('MyDiv','fade');
				}else if(returnData=='error'){
					alert('您已经收藏过此资料，不用再收藏!');
				}else{
					alert('加入收藏失败!');
				}
			},
			error : function(){
				alert('系统错误，加入收藏失败!');
		 	}
		});
	}else{
		alert('你选择的资料不存在 ');
	}
}


//添加资料到购物车
 function addGoodToCart(id){
	if(id != ''){
		var url = ctx +"/addGoodseewareToCart.do?good.id="+id;
		url = encodeURI(encodeURI(url));
		$.ajax({
			type: "POST",
		  	async: false,
		  	cache: false,
		  	url: url,
		  	success : function(returnData){
				if(returnData=='true'){
					shoppingCar();
				}
			},
			error : function(){
				alert('系统错误，添入如购物车失败!');
		 	}
		});
	}
}

//查询购物车层
function shoppingCar(){
	var htmlText="";
	$.ajax({
			type: "POST",
			async: false,
			cache: false,
			url: ctx+"/getshoppingcar.do",
			success : function(returnData){
				var rowssize=eval(returnData).rowssize;
				$('#shoppingCarSize').html("<h1>已添加<span>("+rowssize+")</span>件</h1>");
				var shoppingCar=eval(returnData).rows;
				$('#cartItem').empty();
				for(i=0;i<shoppingCar.length;i++){
					if(i<5){			//最多取5条
						goodInCar=shoppingCar[i];
						htmlText+="<div id='cartItem_"+i+"' class='shoppingCart1_text'>";
						htmlText+="<div class='shoppingCart1_text01'>";
						htmlText+="<a href='"+ctx+"/cpxq.do?good.wareId="+goodInCar.id+"'><img src='"+ctx+goodInCar.pic+"' border='0' title='"+goodInCar.name+"' /></a></div>";
        				htmlText+="<div class='shoppingCart1_text02'>";
          				htmlText+="<h1>¥"+goodInCar.price+"</h1>";
						htmlText+="<h2><img src='"+ctx+"/Images/images/img23.jpg'/></h2>";
						htmlText+="<h3>"+goodInCar.count+"</h3>";
						htmlText+="<h4>件</h4>";
						htmlText+="</div>";
						htmlText+="<div class='shoppingCart1_text03'><a class='delCartItem' href='javascript:deleteGood('"+goodInCar.id+"');'><img src='"+ctx+"/Images/images/img21.jpg' border='0' /></a></div></div>";
					}
				}
				$('#cartItem').append(htmlText);
//				$('.ys3').html('<a href="'+ctx+'/ShoppingCar.do">购物车'+rowssize+'件</a> | <a href="qiye.html" target="_blank">企业用户</a> | <a href="#">售后服务</a> | <a href="#">全国站</a>');
			},
			error : function(){
				alert('系统错误!');
			}
		});
}

// 删除购物车中的资料
function deleteGood(wareId){
	if (confirm("您确定要删除吗?")){
		$.ajax({
			  type: "POST",
			  async: false,
			  cache: false,
			  url: ctx+"/deleteGoodFromCar.do",
			  data: "id=" + wareId,
			  success : function(returnData){ 
					if(returnData == 'true'){
						window.location.reload();
					}else{
						alert('删除失败');
					}
				},
				error : function(){
					alert('删除失败');
			 	} 
		});
	}
}


//去结算
function jiesuan(){
	//验证登陆
	var checkLogin=validationLogin();
	if(checkLogin=='false'){
		$("#geturl").val('/jiesuan.do');
		ShowDiv('MyDiv','fade');
	}else{		
		window.location.href=ctx+"/jiesuan.do";
	}
}


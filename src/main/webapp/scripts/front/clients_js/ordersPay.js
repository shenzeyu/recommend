//支付宝付款
function aliPay(orderId){
	$.ajax({
		type: "POST",
		async: false,
		cache: false,
		url: ctx+"/getZfbPayError.do",
		data: "orderId="+orderId,
		success : function(returnData){
					if(returnData == 'true'){
						window.open(ctx + '/alipayto.do?orderId='+orderId);
					}else{
						alert(returnData);
					}
				},
		error : function(){
			alert('系统错误!');
		} 
	});
}
//银行付款准备
function bankPayPre(orderId){
	var temp=document.getElementsByName("bank_code");
	var bankCode="ZFB";
	for(var i=0;i<temp.length;i++){
		if(temp[i].checked){
			bankCode=temp[i].value;
		}
	}
	
	bankPay(orderId,bankCode);
}
//银行付款		
function bankPay(orderId,bankCode){
	var url="";
	
	if(bankCode=='ZFB'){
		url=ctx+"/getZfbPayError.do";
	}else{
		url=ctx+"/getZfbPayError2.do";
	}
	$.ajax({
		type: "POST",
		async: false,
		cache: false,
		url: url,
		data: "orderId="+orderId+"&bankCode="+bankCode,
		success : function(returnData){
					if(returnData == 'true'){
						if(bankCode=='ZFB'){
							window.open(ctx + '/alipayto.do?orderId='+orderId);
						}else{
							window.open(ctx + '/alipayto2.do?orderId='+orderId+"&bankCode="+bankCode);
							
						}
						
					}else{
						alert(returnData);
					}
				},
		error : function(){
			alert('系统错误!');
		} 
	});
}

//弹出隐藏层
function odpy(odpy,bg_div){
	document.getElementById(odpy).style.display='block';
	document.getElementById(bg_div).style.display='block' ;
	var bgdiv = document.getElementById(bg_div);
	bgdiv.style.width = document.body.scrollWidth;
	// bgdiv.style.height = $(document).height();
	$("#"+bg_div).height($(document).height());
};
//关闭弹出层
function gbpdpy(odpy,bg_div)
{
	document.getElementById(odpy).style.display='none';
	document.getElementById(bg_div).style.display='none';
};





 window.onbeforeunload = onbeforeunload_handler;   
    window.onunload = onunload_handler;   
    function onbeforeunload_handler(url){ 
//        var warning="确认退出?";
         window.location.href=url;  
    } 
    
    function onunload_handler(){   
//        var warning="谢谢光临";   
//        alert(warning);   
        var url="http://localhost:8080/demo2/ShoppingCar.do";
       
        onbeforeunload_handler(url);

        return true;
    }  


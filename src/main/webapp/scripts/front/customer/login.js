//跳转到注册页面
function zhuce(){
	var geturl=$("#geturl").val();
	document.location="zhuce.do";  //?url="+geturl
}

//登陆提交检查
function checkForm(){
	if(''==$('#codes').val()){
		alert('请输入登陆账户!');
		$('#codes').focus();
		return false;
	}else if(''==$('#pwds').val()){
		alert('请输入密码!');
		$('#pwds').focus();
		return false;
	}
	return true;
}

//客户登录
function submitForm(){
		var codeObj = $("#codesY").val();
		var pwd = $('#pwdsY').val();
		if(codeObj==''||codeObj=='昵称/邮箱/已注册手机'){
			$("#loginMessage").empty();
			$("#loginMessage").append("<span><img src='"+ctx+"/Images/images/pass9.jpg' /></span>请填写帐号！");
			$("#loginMessage").css({display:'block'});
		}else if(pwd==''){
			$("#loginMessage").empty();
			$("#loginMessage").append("<span><img src='"+ctx+"/Images/images/pass9.jpg' /></span>请输入密码！");
			$("#loginMessage").css({display:'block'});
		}else{
			var url=ctx+'/loginV.do?customer.code='+codeObj+'&customer.pwd='+pwd;
			
			$.ajax({
				url : url,
				async: false,
				cache: false,
				type : 'POST', 
				success : function(returnData){
					
					if(returnData == 'true'){
						window.location.href = ctx+'/index.do';
					}
					if(returnData=='mobile'){
						$("#loginMessage").empty();
						$("#loginMessage").append("<span><img src='"+ctx+"/Images/images/pass9.jpg' /></span>该手机号不存在！");
						$("#loginMessage").css({display:'block'});
					}
					if(returnData=='account'){
						$("#loginMessage").empty();
						$("#loginMessage").append("<span><img src='"+ctx+"/Images/images/pass9.jpg' /></span>该账号不存在！");
						$("#loginMessage").css({display:'block'});
					}
					if(returnData=='email'){
						$("#loginMessage").empty();
						$("#loginMessage").append("<span><img src='"+ctx+"/Images/images/pass9.jpg' /></span>该Email地址不存在！");
						$("#loginMessage").css({display:'block'});
					}	
					if(returnData=='pw'){
						$("#loginMessage").empty();
						$("#loginMessage").append("<span><img src='"+ctx+"/Images/images/pass9.jpg' /></span>密码错误，请重新填写！");
						$("#loginMessage").css({display:'block'});
					}
						
				},
				error : function(){
					alert('系统错误!');
				}
			});
		}
}
//客户登录
function submitHeadForm(){
	if(!checkHeadForm()){
		return false;
	}else{
		var codeObj = $("#codeUser").val();
		var pwd = $('#pwdUser').val();
		var url=ctx+'/login.do?customer.code='+codeObj+'&customer.pwd='+pwd;
		$.ajax({ 
			url : url,
			async: false,
			cache: false,
			type : 'POST', 
			success : function(returnData){ 
				if(returnData == 'true'){
					window.location.href = ctx+'/index.do';
				}else{
					alert('用户名或密码错误，登录失败!');
				}
			},
		error : function(){
			alert('系统错误!');
		}
	});
		
	}
}

    function dlbh(){	
	    if(document.getElementById("codesY").value=="昵称/邮箱/已注册手机") {document.getElementById("codesY").value="";}document.getElementById("codesY").style.color="#333";
	    document.getElementById("codesY").className="login0202_text1input2";  
	    $("#loginMessage").empty();
 	}
 	
 	function dlbh1(){
 		$("#loginMessage").empty();
 	}

    function sqbh(){	
	    if(document.getElementById("codesY").value=="") {document.getElementById("codesY").value="昵称/邮箱/已注册手机";}document.getElementById("codesY").style.color="#ccc";
	    document.getElementById("codesY").className="login0202_text1input"; 
	    $("#loginMessage").empty();  
 	}

//登陆提交检查
function checkHeadForm(){
	if(''==$('#codeUser').val()){
		alert('请输入登陆账户!');
		$('#codeUser').focus();
		return false;
	}else if(''==$('#pwdUser').val()){
		alert('请输入密码!');
		$('#codeUser').focus();
		return false;
	}
	return true;
}

//ShowDiv('MyDiv','fade')
function checkUsers(){
	//验证登陆
	var checkLogin=validationLogin();
	if(checkLogin=='false'){
		$("#geturl").val('/customersManage.do');
		ShowDiv('MyDiv','fade');
	}else{
		document.href=ctx+"/customersManage.do";
	}
}


function submitDIVForm(){
	if(!checkDIVForm()){
		return false;
	}else{
		var codeObj = $("#customersCode").val();
		var pwd = $('#customersPwd').val();
		var url=ctx+'/login.do?customer.code='+codeObj+'&customer.pwd='+pwd;
		$.ajax({ 
			url : url,
			async: false,
			cache: false,
			type : 'POST', 
			success : function(returnData){ 
				if(returnData == 'true'){
					var geturl=$("#geturl").val();  
					window.location.href=ctx+geturl;
				}else{
					alert('用户名或密码错误，登录失败!');
				}
			},
		error : function(){
			alert('系统错误!');
		}
	});
		
	}
}

 function dlbhDIV(){	
    if(document.getElementById("customersCode").value=="昵称/邮箱/已注册手机") {document.getElementById("customersCode").value="";}document.getElementById("customersCode").style.color="#333";
    document.getElementById("customersCode").className="login0202_text1inputs2";   
 }
function sqbhDIV(){	
    if(document.getElementById("customersCode").value=="") {document.getElementById("customersCode").value="昵称/邮箱/已注册手机";}document.getElementById("customersCode").style.color="#ccc";
    document.getElementById("customersCode").className="login0202_text1inputs";   
 }
function checkDIVForm(){
	if(''==$('#customersCode').val()){
		alert('请输入登陆账户!');
		$('#customersCode').focus();
		return false;
	}else if(''==$('#customersPwd').val()){
		alert('请输入密码!');
		$('#customersPwd').focus();
		return false;
	}
	return true;
}

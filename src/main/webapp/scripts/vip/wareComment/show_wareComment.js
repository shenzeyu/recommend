$(document).ready(function(){
	initForm();
	saveFormRewrite();
});


//重写form的submit方法
function saveFormRewrite(){
	$('#saveForm').submit(function(){
		return submitForm(false);
	});
}
//提交表单
function submitForm(isConfirm){
	//审核时更新数据状态
	var stateObj = $('#state');  alert(stateObj.val());
	if(isConfirm){
		if('s'==stateObj.val()){
			alert('此信息已被审核,无需再次审核!');
			return;
		}
		stateObj.val('s');
	}else{
		if(''==stateObj.val()){
			$('#state').val('c');
		}
	}
	var options = { 
		url : ctx+'/wareComment!save.do',
		async: false,
		cache: false,
		type : 'POST', 
		//timeout : 10000,
		success : function(returnData){
			var succInfo = '';
			var errorInfo = '';
			if(!isConfirm){
				info = '保存成功';
				errorInfo = '保存失败';
			}else{
				info = '审核成功';
				errorInfo = '审核失败';
			}
			if(returnData == 'true'){
				alert(info);
				parent.closePopWindow();
				parent.reloadDataGrid();
			}else{
				alert(errorInfo);
			}
		},
		error : function(){
			alert('系统错误');
		} 
	};
	$('#saveForm').ajaxSubmit(options); 
	return false; 
}

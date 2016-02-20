$(document).ready(function(){
   getNowTime();
   dateValid();
});

function getNowTime(){
//SimpleDateFormat time = new SimpleDateFormat('yyyy-MM-dd HH:mm:ss');
  var time = new Date();
  $('#nowTime').html("<samp>当前时间："+time.getHours()+":"+time.getMinutes()+":"+time.getSeconds()+"</samp>")
  setTimeout("getNowTime()",1000);
}

function changeDateFormat(cellval) {  
	
  	return "<span>"+"倒计时："+"</span>"+"<samp>"+Math.abs(parseInt((cellval)/1000/60/60))+"</samp>"+"<span>"+"&nbsp;时&nbsp;"+"</span>"+"<samp>"+Math.abs(parseInt((cellval)/1000/60%60))+"</samp><span>&nbsp;分&nbsp;</span><samp>"+Math.abs(parseInt((cellval)/1000%60))+"</samp><span>&nbsp;秒</span>";
}
var flag="true";
function dateValid(){
	var nowDate =  new Date();
	var now = nowDate.getTime();
	
	$("[id=test]").each(function(){ 						
		var beginTime=Date.parse($(this).find('#countDown').attr("name").replace(/-/g,"/"));
		$(this).find('#countDown').html(changeDateFormat(beginTime-now));
		if((beginTime-now)<0){
			var goodId=$(this).find('#gi').val();	
			$(this).find('#start').html("<a href='"+ctx+"/cpxq.do?good.id="+goodId+"'><img src='"+ctx+"/Images/images/miao10.JPG' border='0'></a>");
			
		}	
	});


//	alert(parseInt((cellval)/1000/60/60/24));	
	setTimeout("dateValid()",1000);
}
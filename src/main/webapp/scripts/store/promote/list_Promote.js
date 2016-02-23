var gId = '#dataGrid';
var buyInserts='#buyInserts';
var buyDeletes='#buyDeletes';
var buySelects='#buySelects';
var buyUpdates='#buyUpdates';
$(document).ready(function(){
	//列表
	$(gId).datagrid({
		url:getUrlOpt(),
		idField:'id',
		fitColumns:true,
		frozenColumns:[[
               {field:'ck',checkbox:true}
        ]],
		columns:[
		    getTableHeadOpt(),
			getColumnsOpt()
		],
		pageSize:20,
		rownumbers:true,
		pagination:true,
		loadMsg:'数据装载中...',
		toolbar:getToolBarOpt()
	});
	
	//分页区	
	$(gId).datagrid('getPager').pagination(getPagerOpt());
});


//获取表头参数
function getTableHeadOpt(){
	var opt = [];
	var operate = '';
	opt.push({title:'基本信息',colspan:5});
	if('' == todo){
		opt.push(
			{field:'opt',title:'操作',width:25,align:'left', rowspan:2,
				formatter:function(value,rowData,rowIndex){
					var html = '';
					if(rowData._state == 's' && $(buySelects).val()=='1'){
						operate = '查看';
					}else if(rowData._state != 's' && $(buyUpdates).val()=='1')
					{
						operate = '编辑';
					}
					if('' == todo){
						if($(buySelects).val()=='1' || $(buyUpdates).val()=='1')
						{
							html = '<a href="javascript:void(0)" onclick="editData(\''+rowData.id+'\');">'+operate+'</a>';
						}
						if(rowData._state != 's' && $(buyDeletes).val()=='1'){
							html += '&nbsp;&nbsp;<a href="javascript:void(0)" onclick="deleteData(\''+rowData.id+'\');">删除</a>';
						}
					}					
					return html;
				}
			}			
		);		
	}
   return opt;		
}
//获取列头参数
function getColumnsOpt(){
	var opt = [
		{field:'code',title:'编号',width:20,align:'left'},
		{field:'subject',title:'专题主题',width:25,align:'left'},
		{field:'creatorName',title:'创建人',width:25,align:'left'},
		{field:'createTime',title:'创建时间',width:20,align:'left',formatter:beginSaleTimeFormat},
		{field:'type',title:'显示位置',width:25,align:'left'}
	];
	return opt;
}

//添加工具条
function getToolBarOpt(){
	var opt=[];
	if($(buyInserts).val()=='1')
	{
			opt = [{	
			text:'新增',
	 		iconCls:'icon-add',
	 		handler:function(){
	 			editData('');
			}
		}];
	}
    return opt;		
}

//Json加载数据路径
function getUrlOpt(){
	var url = ctx+'/Promote_json!listJosn.do';
	return url;
}	

//编辑数据
function editData(id){
	var url = ctx+'/promote!edit.do?1=1';
	var title = '新增专题';
	if(id != ''){
		url += '&promote.id='+id;
		title = '编辑专题';
	}
	window.parent.addTab(title,url);
}

//重新加载
function reloadDataGrid(){
	$(gId).datagrid('reload');
}

//搜索框检查用户是否按下‘回车键’，按下则调用搜索方法
function checkKey(){
	if(event.keyCode=='13'){
		searchData();
	}
}

//搜索功能
function searchData(){
	var code = $("#code").val(); 
	var subject = $("#subject").val();
	var goodTypeId = $("#goodTypeId").val();
    realoadGrid(code,subject,goodTypeId);
}

//清空
function cancelSearch(){
	 $("#code").val('');
	 $("#subject").val('');
	 $("#goodTypeId").val('');
	 $("#goodTypeName").val('');
	 searchData();
}

//确定搜索时重新加载datagrid
function realoadGrid(code,subject,goodTypeId){
	var queryParams = $(gId).datagrid('options').queryParams;
	queryParams={"promote.code":code,"promote.subject":subject,"promote.goodTypeId":goodTypeId};
	$(gId).datagrid('options').queryParams = queryParams;
	$(gId).datagrid('reload');
}

//删除订单
function deleteData(id){
	if(confirm('你确定要删除吗?')){
		$.ajax({
			  type: "POST",
			  async: false,
			  cache: false,
			  url: ctx+"/promote!delete.do",
			  data: "promote.id=" + id,
			  success : function(returnData){ 
					if(returnData == 'true'){
						alert('删除成功!');
						reloadDataGrid();
					}else {
						alert('删除失败!');
					}
				},
			  error : function(){
					alert('系统错误!');
			  } 
		});
	}
}
//格式化送货状态
function stateFormat(value,rowData,rowIndex){
	var result = '未审核';
	var state = rowData._state;
	if('s' == state){
		result = '已审核';
	}
	return result;
}


function beginSaleTimeFormat(value,rowData,rowIndex){
	var createTime = rowData.createTime;
	return dateFormat(createTime);
}

//格式化日期
function dateFormat(date){
	var dateStr = '';
	if(date && date!=null && date!=''){
		dateStr = date.substring(0,10);
	}
	return dateStr;
}

//选择资料类别弹出窗
function selectType(){
    var url = ctx+'/goodType!list.do?todo=show';
	var dataArr = window.showModalDialog(url, '',"status:no;left:yes;scroll:yes;resizable:no;help:no;dialogWidth:800px;dialogHeight:600px");
	if(dataArr!=null){
		if(dataArr.level=="1"){
			$("#goodTypeName").val(dataArr.typeName);
			$("#goodTypeId").val(dataArr.typeId);
			$(obj).focus();
		}else{
			alert("请选择资料大类");
		}
	}
}

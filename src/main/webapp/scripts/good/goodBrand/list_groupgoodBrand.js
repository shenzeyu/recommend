var gId = '#dataGrid';
var goodInserts='#goodInserts';
var goodDeletes='#goodDeletes';
var goodSelects='#goodSelects';
var goodUpdates='#goodUpdates';
$(document).ready(function(){
	$(gId).treegrid(getGridOpt());//树
	//获取列表参数
	function getGridOpt(){
		var opt = {
			url:getUrlOpt(),
			idField:'id',
			fitColumns:true,
			treeField:'name',
			columns:[
				getTableHeadOpt(),
				[
					{field:'code',title:'编号',width:130,align:'left'},
					{field:'name',title:'名称',width:300,align:'left'}
				]
			],
			pageSize:20,
			rownumbers:false,
			pagination:false,
			loadMsg:'数据装载中......',
			onClickRow:function(){
				var node = $(gId).treegrid('getSelected');
				if(node.level == '2'){
					selectBrand(node.id,node.name);
				}else{
					selectBrandone(node.id)
				}
			},
		    toolbar:getToolBarOpt()
		};
		return opt;
	}
});

//获取url参数
function getUrlOpt(){
	var url = ctx+'/GroupGoodBrand_json!listJson.do?1=1';
	 var IsInventory =$('#IsInventory').val();
    
    if(IsInventory!=""){
      url+= '&goodBrand.isInventory='+IsInventory;
    }
	return url;
}	

//获取表头参数
function getTableHeadOpt(){
	var opt = [];
	opt.push({title:'基本信息',colspan:2});
	if('' == todo){
		opt.push(
			{field:'opt',title:'操作',width:100,align:'left', rowspan:2,
				formatter:function(value,rowData,rowIndex){
					var html = '&nbsp;&nbsp;';
					if('' == todo){
						if(rowData.level == '1' && $(goodInserts).val()=='1'){
							 html += '<a href="javascript:editBrand(\'\',\''+rowData.id+'\','+(rowData.level+1)+');">添加品牌</a>';	
						}
						if(rowData.level == '2'){
							if($(goodUpdates).val()=='1')
							{
							html += '<a href="javascript:void(0)" onclick="editBrand(\''+rowData.id+'\',\'\','+rowData.level+');">编辑</a>'
							 	  + '&nbsp;&nbsp;';
							}
							if($(goodDeletes).val()=='1')
							{
							 	  html+='<a href="javascript:deleteGoodsType(\''+rowData.id+'\','+rowData.level+');">删除</a>';
							}
						}
					}
					return html;
				}
			}			
		);		
	}

   return opt;		
}	

//获取工具条参数
function getToolBarOpt(){
	var opt = [];
	 return opt;
}

//重新加载
function reloadGrid(){
	$(gId).treegrid('reload');
}

//关闭弹出窗
function closePopWindow(){
	$('#edit').window('close');
}

//编辑资料类别
function editBrand(brandId,parentId,level){
	var url = ctx+'/groupGoodBrand!edit.do?1=1';
	var isInventory=$('#isInventory').val();
	if(brandId){
		url +='&goodBrand.id='+brandId;
	}
	if(parentId){
		url += '&goodBrand.parentId='+parentId;
	}
	if(level){
		url += '&goodBrand.level='+level;
	}
	if(isInventory!=''){
		url += '&goodBrand.isInventory='+isInventory;
	}
	 //弹出框
	$('#edit').dialog({
		title:"资料品牌管理",
		iconCls:'icon-edit',
	    modal:true,
	    draggable:true,
	    minimizable:false,
	    maximizable:false,
	    resizable:false,
	    toolbar:[{
	        text:'保存',
	        iconCls:'icon-save',
	        handler:function(){
	            editDataPage.submitForm();
	        }
	    }]
	});
	$('#editDataPage').attr('src',url);
    $('#edit').window('open');
}
//搜索框检查用户是否按下‘回车键’，按下则调用搜索方法
function checkKey(){
	if(event.keyCode=='13'){
		searchData();
	}
}

//搜索功能
function searchData(){

	var brandCode = $("#brandCode").val(); 
	var brandName = $('#brandName').val();
	if(brandCode=='' && brandName=='')
	{
		alert('请输入查询条件！');
		return false;
	}
    realoadGrid(brandCode,brandName);
}
//确定搜索时重新加载datagrid
function realoadGrid(brandCode,brandName){
	var url = ctx+'/groupGoodBrand!findBrand.do?1=1';
	if(brandCode)
	{
		url+='&goodBrand.code='+brandCode;
	}
	if(brandName)
	{
		url+='&goodBrand.name='+brandName;
	}
	url = encodeURI(encodeURI(url));
	 //弹出框
	$('#search').dialog({
		title:"资料品牌搜索",
		iconCls:'icon-edit',
	    modal:true,
	    draggable:true,
	    minimizable:false,
	    maximizable:false,
	    resizable:false
	});
    $('#getBrand').attr('src',url);
    $('#search').window('open');
}
//删除资料品牌
function deleteGoodsType(id,level){
	if(confirm('您确定要删除吗？')){
		$.ajax({
		 type: "POST",
		  async: false,
		  cache: false,
		  url: ctx+"groupGoodBrand!delete.do",
		  data: "goodBrand.id=" + id+'&goodBrand.level='+level,
		  success : function(returnData){ 
				if(returnData == 'true'){
					alert('删除成功');
					window.location.href = ctx+"/groupGoodBrand!list.do";
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
//查询选中品牌的所有下级品牌
function selectBrandone(parentId){
	$(gId).treegrid(getGridOpt());//树
	//获取列表参数
	function getGridOpt(){
		var isInventory=$('#IsInventory').val();
		var opt = {
			url:ctx+'/GroupGoodBrand_json!listJson.do?goodBrand.parentId='+parentId+'&goodBrand.isInventory='+isInventory,
			idField:'id',
			fitColumns:true,
			treeField:'name',
			columns:[
				getTableHeadOpt(),
				[
					{field:'code',title:'编号',width:130,align:'left'},
					{field:'name',title:'名称',width:300,align:'left'}
				]
			],
			pageSize:20,
			rownumbers:false,
			pagination:false,
			loadMsg:'数据装载中......',
			onClickRow:function(){
				var node = $(gId).treegrid('getSelected');
				if(node.level == '2'){
					selectBrand(node.id,node.name);
				}else{
					selectBrandone(node.id)
				}
			},
		    toolbar:getToolBarOpt()
		};
		return opt;
	}
}
//获取选中资料品牌
function selectBrand(brandId,brandName){
	if(todo=='show'){
		window.returnValue = {'brandId':brandId,'brandName':brandName};
		window.close();
	}
}
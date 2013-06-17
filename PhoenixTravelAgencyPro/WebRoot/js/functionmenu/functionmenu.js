/**
 * datagrid的最后一列的操作
 * @param val
 * @param row
 * @returns {String}
 */
function onOperateStyle(val,row,index){
       var returnStyleValue='<img alt="修改" src="js/themes/icons/pencil.png" onclick="onOperateUpdate('+row.id+','+index+');">';
       returnStyleValue+='<img alt="删除" src="js/themes/icons/cancel.png" onclick="onOperateDelete('+row.id+');">';
       return returnStyleValue;
 }


/**
 * 执行更新事件
 * @param id
 */
function onOperateUpdate(id,index){
	$('#dgFuncMenu').datagrid('selectRow', index);
	var row = $("#dgFuncMenu").datagrid("getSelected");
	$("#editFuncMenu").dialog("open");
	$("#newFunMenuForm").form("load",row);	
}

/**
 * 删除事件
 * @param id
 */
function onOperateDelete(id){
		var param = {
			"id" :id
		};
		$.ajax({
			url : "fenghuang/deleteFunctionMeun.do",
			data : param,
			dataType : "json",
			success : function(data) {
				if (data.success) {
					$.messager.alert("保存成功", "保存成功！", "info");
					$("#dgFuncMenu").datagrid('reload');
				} else {
					$.messager.alert("保存失败", "保存失败!", "error");
				}
			},
			error : function() {
				$.messager.alert("保存失败", "服务器请求失败!", "error");
			}
		});

}

/**
 * 新增弹出框操作
 */
function newFunctionMenu(){
	$("#editFuncMenu").dialog("open");
	$("#newFunMenuForm").form("clear");	
}

/**
 * 关闭操作
 */
function clostEditFuncMenu(){
	$("#editFuncMenu").dialog("close");
}

/**
 * 新增保存
 */
function newFunctionMenuSave(){
	
	$("#newFunMenuForm").form("submit",{
		url:'fenghuang/saveFunctionMeun.do',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success : function(result) {
			var result = eval('(' + result + ')');
			if(result.success){
				$('#editFuncMenu').dialog('close');
				$.messager.alert("保存成功", "保存成功！", "info");
				$('#dgFuncMenu').datagrid('reload');
			}else{
				$('#editFuncMenu').dialog('close');
				$.messager.alert("保存失败", "保存失败!", "error");
				$('#dgFuncMenu').datagrid('reload');
			}
			
			
		}
	});
}

/**
 * 查询按钮
 */
function searchFunctionMenu(){
	$('#dgFuncMenu').datagrid('load',{
		id:$("#id").val()==""?0:$("#id").val(),
		meunName:$("#meunName").val(),
		sortNo:$("#sortNo").val(),
		menuPath:$("#menuPath").val(),
		parentId:$('#parentId').combobox('getValue')==""?0:$('#parentId').combobox('getValue')
	});
}

/**
 * 重置
 */
function searchFunctionMenuReset(){
	$("#meunName").val("");
	$("#sortNo").val("");
	$("#id").val("");
	$("#menuPath").val("");
	$('#parentId').combobox('setValue','');
}







/**
 * 
 * @param val
 * @param row
 * @param index
 * @returns {String}
 */
function onOperateStyle(val,row,index){
       var returnStyleValue='<img alt="修改" src="js/themes/icons/pencil.png" onclick="onOperateUpdate('+row.id+','+index+');">';
       returnStyleValue+='&nbsp;&nbsp;&nbsp;&nbsp;<img alt="删除" src="js/themes/icons/cancel.png" onclick="onOperateDelete('+row.id+');">';
       return returnStyleValue;
 }

function onOperateUpdate(id,index){
	
	$('#dgDepartment').datagrid('selectRow', index);
	var row = $("#dgDepartment").datagrid("getSelected");
	$("#editDepartment").dialog("open");
	$("#newDepartment").form("load",row);	
	
}

function onOperateDelete(id){
	var param = {
			"id" :id
		};
		$.ajax({
			url : "fenghuang/deleteDepartmentById.do",
			data : param,
			dataType : "json",
			success : function(data) {
				if (data.success) {
					$.messager.alert("保存成功", "保存成功！", "info");
					$("#dgDepartment").datagrid('reload');
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
 * 新建部门的弹出框
 */
function newDepartment(){
	$("#editDepartment").dialog("open");
	$("#newDepartment").form("clear");	
	
}


/**
 * 新建部门保存方法
 */
function newDepartmentSave(){
	$("#newDepartment").form("submit",{
		url:'fenghuang/saveOrUpdateDepartment.do',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success : function(result) {
			var result = eval('(' + result + ')');
			if(result.success){
				$('#editDepartment').dialog('close');
				$.messager.alert("保存成功", "保存成功！", "info");
				$('#dgDepartment').datagrid('reload');
			}else{
				$('#editDepartment').dialog('close');
				$.messager.alert("保存失败", "保存失败!", "error");
				$('#dgDepartment').datagrid('reload');
			}
			
			
		}
	});
}
/**
 * 关闭弹出框
 */
function closeDepartment(){
	$("#editDepartment").dialog("close");
}

function searchDepartment(){
	$('#dgDepartment').datagrid('load',{
		departNo:$("#departNo").val(),
		departName:$("#departName").val()
		
	});
	
}
function searchDepartmentReset(){
	$("#departNo").val("");
	$("#departName").val("");
}
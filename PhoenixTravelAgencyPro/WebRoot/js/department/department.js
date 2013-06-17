function onOperateStyle(val,row){
       var returnStyleValue='<img alt="修改" src="js/themes/icons/pencil.png" onclick="onOperateUpdate('+row.id+');">';
       returnStyleValue+='<img alt="删除" src="js/themes/icons/cancel.png" onclick="onOperateDelete('+row.id+');">';
       return returnStyleValue;
 }

function onOperateUpdate(id){
	
	alert("执行更新操作");
	
}

function onOperateDelete(id){
	
	alert("执行删除操作");
}
function mainBanMoshiSave() {
			$('#userForm').form('submit', {
				url : 'fenghuang/saveUsers.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
					}
				}
			});
}
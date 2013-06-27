var editIndex = undefined;
		function endEditing() {
			if (editIndex == undefined) {
				return true
			}
			if ($('#dgUsers').datagrid('validateRow', editIndex)) {
				$('#dgUsers').datagrid('endEdit', editIndex);
				$('#dgUsers').datagrid('unselectRow', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function addHangMoshi() {
			$("#dgUsers").datagrid("insertRow", {
				index : 0,
				row:{}
			});
			editIndex = undefined;
		}
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#dgUsers').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#dgUsers').datagrid('selectRow', editIndex);
				}
			}
		}
		function getChanges() {
			$('#dgUsers').datagrid('endEdit', editIndex);
			var rows = $("#dgUsers").datagrid("getChanges");
			if (rows.length > 0) {
				var param = {
					"updateRows" : $.toJSON(rows)
				};
				$.ajax({
					url : "fenghuang/updateCompanys.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("保存成功", "保存成功！", "info");
							$("#dgUsers").datagrid('reload');
							editIndex = undefined;
						} else {
							$.messager.alert("保存失败", "保存失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("保存失败", "服务器请求失败!", "error");
					}
				});
			}

		}

		function addMianBanMoshi() {
			$("#editCompany").dialog("open");
			$("#companyFrome").form("clear");
		}

		function mainBanMoshiSave() {
			$('#companyFrome').form('submit', {
				url : 'fenghuang/saveCompanyInfo.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#editCompany').dialog('close');
						$('#dgUsers').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgUsers').datagrid('reload');
					}
				}
			});
		}

		function shanchu() {
			var rows = $("#dgUsers").datagrid("getSelections");
			if (rows.length > 0) {
				var param = {
					"deleteRows" : $.toJSON(rows)
				};
				$.ajax({
					url : "",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgUsers").datagrid('reload');
						} else {
							$.messager.alert("删除失败", "删除失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
			}
		}
		function closeEditRole() {
			$('#editCompany').dialog('close');
		} 

		//
		function searchDiJi() {
			$("#searchCompany").dialog("open");
			$("#searchCompanyForm").form("clear");
		}
		function searchFormSubmit() {
			$("#searchCompany").dialog("close");
			$("#dgUsers").datagrid("load", {
				companyNumber : $("#companyNumber").val(),
				companyName : $("#companyName").val(),
				parentId:$('#parentNumber').combobox('getValue')==""?0:$('#parentNumber').combobox('getValue')
			});

		}

		function closedSearch() {
			$('#searchCompany').dialog('close');
		}
var editIndex = undefined;
		function endEditing() {
			if (editIndex == undefined) {
				return true
			}
			if ($('#dgMenuPermission').datagrid('validateRow', editIndex)) {
				$('#dgMenuPermission').datagrid('endEdit', editIndex);
				$('#dgMenuPermission').datagrid('unselectRow', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function addHangMoshi() {
			$("#dgMenuPermission").datagrid("insertRow", {
				index : 0,
				row:{}
			});
			editIndex = undefined;
		}
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#dgMenuPermission').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#dgMenuPermission').datagrid('selectRow', editIndex);
				}
			}
		}
		function getChanges() {
			$('#dgMenuPermission').datagrid('endEdit', editIndex);
			var rows = $("#dgMenuPermission").datagrid("getChanges");
			if (rows.length > 0) {
				var param = {
					"updateRows" : $.toJSON(rows)
				};
				$.ajax({
					url : "fenghuang/updateMenuPermissionInfo.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("保存成功", "保存成功！", "info");
							$("#dgMenuPermission").datagrid('reload');
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
			$("#editMenuPermission").dialog("open");
			$("#menuPermissionFrome").form("clear");
		}

		function mainBanMoshiSave() {
			$('#menuPermissionFrome').form('submit', {
				url : 'fenghuang/saveMenuPermissionInfo.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#editMenuPermission').dialog('close');
						$('#dgMenuPermission').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgMenuPermission').datagrid('reload');
					}
				}
			});
		}

		function shanchu() {
			var rows = $("#dgMenuPermission").datagrid("getSelections");
			if (rows.length > 0) {
				var param = {
					"deleteRows" : $.toJSON(rows)
				};
				$.ajax({
					url : "fenghuang/deleteMenuPermissions.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgMenuPermission").datagrid('reload');
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
			$('#editMenuPermission').dialog('close');
		} 

		//
		function searchDiJi() {
			$("#searchMenuPermission").dialog("open");
			$("#searchMenuPermissionForm").form("clear");
		}
		function searchFormSubmit() {
			$("#searchMenuPermission").dialog("close");
			$("#dgMenuPermission").datagrid("load", {
				mpNo : $("#searchMpNo").val(),
				mpName : $("#searchMpName").val(),
				mpDesc : $("#searchMpDesc").val(),
				functionNo:$('#searchFunctionNo').combobox('getValue')==""?0:$('#searchFunctionNo').combobox('getValue')
			});

		}

		function closedSearch() {
			$('#searchMenuPermission').dialog('close');
		}
		
		$('#dgMenuPermission').datagrid({
			onRowContextMenu : onRowContextMenu,
		});
		function onRowContextMenu(e, rowIndex, rowData) {
			e.preventDefault();
			var selected = $("#dgMenuPermission").datagrid('getRows'); //获取所有行集合对象
			selected[rowIndex].id; //index为当前右键行的索引，指向当前行对象
			$('#dgMenuPermission').datagrid('selectRow', rowIndex);
			$('#dgMenuPermissionMm').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
		
		function  editRoleRightMenu(){
			var row = $("#dgMenuPermission").datagrid("getSelected");
			var index = $('#dgMenuPermission').datagrid('getRowIndex', row);
			$("#dgMenuPermission").datagrid("unselectRow",index);
			$("#editMenuPermission").dialog("open");
			$("#menuPermissionFrome").form("load",row);	
			
			
		}
		
		
var editIndex = undefined;
		function endEditing() {
			if (editIndex == undefined) {
				return true
			}
			if ($('#dgRole').datagrid('validateRow', editIndex)) {
				$('#dgRole').datagrid('endEdit', editIndex);
				$('#dgRole').datagrid('unselectRow', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function addHangMoshi() {
			$("#dgRole").datagrid("insertRow", {
				index : 0,
				row:{}
			});
			editIndex = undefined;
		}
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#dgRole').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#dgRole').datagrid('selectRow', editIndex);
				}
			}
		}
		function getChanges() {
			$('#dgRole').datagrid('endEdit', editIndex);
			var rows = $("#dgRole").datagrid("getChanges");
			if (rows.length > 0) {
				var param = {
					"updateRows" : $.toJSON(rows)
				};
				$.ajax({
					url : "fenghuang/updateRoleInfo.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("保存成功", "保存成功！", "info");
							$("#dgRole").datagrid('reload');
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
			$("#editRole").dialog("open");
			$("#roleFrome").form("clear");
		}

		function mainBanMoshiSave() {
			$('#roleFrome').form('submit', {
				url : 'fenghuang/saveRole.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#editRole').dialog('close');
						$('#dgRole').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgRole').datagrid('reload');
					}
				}
			});
		}

		function shanchu() {
			var rows = $("#dgRole").datagrid("getSelections");
			if (rows.length > 0) {
				var param = {
					"deleteRows" : $.toJSON(rows)
				};
				$.ajax({
					url : "fenghuang/deleteRoles.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgRole").datagrid('reload');
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
			$('#editRole').dialog('close');
		} 

		//
		function searchDiJi() {
			$("#searchRole").dialog("open");
			$("#searchRoleForm").form("clear");
		}
		function searchFormSubmit() {
			$("#searchRole").dialog("close");
			$("#dgRole").datagrid("load", {
				roleNo : $("#searchRoleNo").val(),
				roleName : $("#searchRoleName").val(),
				roleDesc : $("#searchRoleDesc").val()
			});

		}

		function closedSearch() {
			$('#searchRole').dialog('close');
		}
		
		$('#dgRole').datagrid({
			onRowContextMenu : onRowContextMenu,
		});
		function onRowContextMenu(e, rowIndex, rowData) {
			e.preventDefault();
			var selected = $("#dgRole").datagrid('getRows'); //获取所有行集合对象
			selected[rowIndex].id; //index为当前右键行的索引，指向当前行对象
			$('#dgRole').datagrid('selectRow', rowIndex);
			$('#dgRoleMm').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
		
		function  editRoleRightMenu(){
			var row = $("#dgRole").datagrid("getSelected");
			var index = $('#dgRole').datagrid('getRowIndex', row);
			$("#dgRole").datagrid("unselectRow",index);
			$("#editRole").dialog("open");
			$("#roleFrome").form("load",row);	
			
			
		}
		
		function editAllocationMenuPerission(){
			var row = $("#dgRole").datagrid("getSelected");
			var rowHref = "menuPermissionAllocation.do?roleId="+row.id;
			   var tab = $('#tt').tabs('getSelected');
			   
				if (tab){  
	                   var index = $('#tt').tabs('getTabIndex', tab);  
	                   $('#tt').tabs('close', index);  
	                } 
					$('#tt').tabs('add', {
						title : "分配菜单权限",
						href : rowHref,
						closable : true
					});
			
		}
		
		
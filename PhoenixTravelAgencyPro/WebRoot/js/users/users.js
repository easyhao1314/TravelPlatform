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
					url : "fenghuang/updateUsers.do",
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
			$("#editUsers").dialog("open");
			$("#userForm").form("clear");
		}

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
						$('#editUsers').dialog('close');
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
					url : "fenghuang/deleteUsers.do",
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
		function closeEditUsers() {
			$('#editUsers').dialog('close');
		} 

		//
		function searchDiJi() {
			$("#searchUsers").dialog("open");
			$("#searchUsersForm").form("clear");
		}
		function searchFormSubmit() {
			$("#searchUsers").dialog("close");
			$("#dgUsers").datagrid("load", {
				userNumber:$("#searchUserNumber").val(),
				userName:$("#searchUserName").val(),
				loginName:$("#searchLoginName").val(),
				enName:$("#searchEnName").val(),
				sex:$("#searchSex").combobox('getValue'),
				enName1:$("#searchEnName1").val(),
				telephone:$("#searchTelephone").val(),
				birthday:$("#searchBirthday").datebox("getValue"),
				telephoneExt:$("#searchTelephoneExt").val(),
				email:$("#searchEmail").val(),
				mobilePhone:$("#searchMobilePhone").val(),
				msn:$("#searchMsn").val(),
				fax:$("#searchFax").val(),
				msn2:$("#searchMsn2").val(),
				skype:$("#searchSkype").val(),
				msn3:$("#searchMsn3").val(),
				companyId:$("#searchCompanyId").combobox('getValue'),
				departmentId:$("#searchDepartmentId").combobox('getValue'),
				jobDescription:$("#searchjobDescription").val(),
				sortNumber:$("#searchSortNumber").val(),
				address:$("#searchAddress").val(),
				zip:$("#searchZip").val(),
				qq:$("#searchQq").val()
			});

		}

		function closedSearch() {
			$('#searchUsers').dialog('close');
		}
		function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
		$('#dgUsers').datagrid({
			onRowContextMenu : onRowContextMenu,
		});
		function onRowContextMenu(e, rowIndex, rowData) {
			e.preventDefault();
			var selected = $("#dgUsers").datagrid('getRows'); //获取所有行集合对象
			selected[rowIndex].id; //index为当前右键行的索引，指向当前行对象
			$('#dgUsers').datagrid('selectRow', rowIndex);
			$('#dgUserMm').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
		
		function editUsersMenu(){
			var row = $("#dgUsers").datagrid("getSelected");
			var index = $('#dgUsers').datagrid('getRowIndex', row);
			$("#dgUsers").datagrid("unselectRow",index);
			$("#editUsers").dialog("open");
			$("#userForm").form("load",row);	
			
		}
		
		
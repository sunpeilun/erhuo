<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- 页面meta -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>规格管理</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		//拷贝编辑页面
		var emdal = $("#editModal").clone();
		var e_tr;
		var path;
		var url;
		
		$(function(){
			
			e_tr = $(".e_tr:first").clone();
			
			/**页面数据加载开始*/
			//数据
			var tableRow = $(".table_row:first").clone();
			var tbody = $("#dataList tbody");
			
			path = "${pageContext.request.contextPath}/"; //项目名称
			url = path + "StandardServlet"; //servlet
			
			//显示数据
			function show(){
				$("#find").show();
				var temp = {"method":"findStandard"};
				
				tbody.html("");
				$.post(url,temp,function(data){
					if(data == null || data.length <= 0){
						$("#msg").text("已无数据...")
					} else {
						$("#find").hide();
					}
                    for(var i = 0; i < data.length;i++){
                    	var s = data[i];
                    	var tr = tableRow.clone();

                    	tr.find("input[type='checkbox']").val(s.sid);
                    	tr.find(".td_sid").html(s.sid);
                    	tr.find(".td_sname").html(s.sname);
                    	tbody.append(tr);
                    }
                    
				},"json");
				
			}
			show();
			/**页面数据加载结束*/
			
			/*查询开始*/
			$("#search_btn").click(function(){
				var temp = {
					"method":"findStandard",
					"sname":$("#search_text").val()
				};
				
				tbody.html("");
				$.post(url,temp,function(data){
                    for(var i = 0; i < data.length;i++){
                    	var s = data[i];
                    	var tr = tableRow.clone();

                    	tr.find("input[type='checkbox']").val(s.sid);
                    	tr.find(".td_sid").html(s.sid);
                    	tr.find(".td_sname").html(s.sname);
                    	tbody.append(tr);
                    }
                    
				},"json");
			});
			
			/*查询结束*/
			
			/**全选开始*/
			$("#selall").click(function(){
				$(".r_checkbox").prop("checked",this.checked);
			});
			
			/*全选结束*/
			
			/*规格选项--开始*/
			//添加规格选项
			$("#e_addType").click(function(){
				$("#e_tbody").append(e_tr.clone());
			})
			
			/*规格选项--结束*/
			
			/**删除开始*/
			$("#del").click(function(){
				if($(".r_checkbox:checked").size() <= 0){
					return;
				}
				var ids = "";
				$(".r_checkbox:checked").each(function(){
					var sid = $(this).val();
					ids += sid + ",";
				});
				
				var temp = {
					"method":"delStandard",
					"bid":ids
				};
				
				$.post(url,temp,function(data){
					window.location.reload();
					alert(data);
				});
			});
			
			/**删除*/

		});
		//$(function(){})结束
		
			/**添加*/
			function addModal(){
				$("#submit").unbind();
				$("#e_tbody").html("");
				$("#e_tbody").append(e_tr.clone());
				$("#e_sname").val("");
				
				$("#submit").click(function(){
					var types = "";
					$(".tname").each(function(i){
						var tname = $(this).val();
						var sort = $(".sort").eq(i).val();
						if(tname != null && sort != null){
							types += tname + ":" + sort + ",";
						}
					})
					
					var em = $("#editModal");
					var temp = {
						"method":"addStandard",
						"sname":em.find("#e_sname").val(),
						"types":types
					};
					$.post(url,temp,function(data){
						window.location.reload();
						alert(data);
						$("#submit").unbind();
					});
					
				})
			};
			
			/**点击编辑按钮编辑*/
			function editModal(e){
				$("#submit").unbind();
				var tbody = $("#e_tbody");
				tbody.html("");
				var tr = $(e).parent().parent();
				$("#e_sname").val(tr.find(".td_sname").html());
				var sid = tr.find(".td_sid").html();
				var temp = {
					"method":"findType",
					"sid":sid
				}
				$.post(url,temp,function(data){
					for(var i = 0; i < data.length;i++){
                    	var s = data[i];
						var newTr = e_tr.clone();
						newTr.find(".tname").val(s.tname);
						newTr.find(".sort").val(s.sort);
						tbody.append(newTr);
                    }
				},"json");
				
				$("#submit").click(function(){
					var types = "";
					$(".tname").each(function(i){
						var tname = $(this).val();
						var sort = $(".sort").eq(i).val();
						if(tname != null && sort != null){
							types += tname + ":" + sort + ",";
						}
					})
					
					var em = $("#editModal");
					var temp2 = {
						"method":"updateStandard",
						"sid":sid,
						"sname":em.find("#e_sname").val(),
						"types":types
					};
					$.post(url,temp2,function(data){
						window.location.reload();
						alert(data);
						$("#submit").unbind();
					});
				})
			}
			
			function checkbox(){
				$("#selall").prop("checked", $(".r_checkbox").size() == $(".r_checkbox:checked").size());
			}
			
			//删除规格
			function delType(e){
				var tr = $(e).parent().parent();
				tr.remove();
			}

			
	</script>
</head>

<body class="hold-transition skin-red sidebar-mini" >
  <!-- .box-body -->                
                    <div class="box-header with-border">
                        <h3 class="box-title">规格管理</h3>
                    </div>
                    <div class="box-body">
                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" onclick="addModal();" title="新建"data-toggle="modal" data-target="#editModal" ><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="删除" id="del"><i class="fa fa-trash-o"></i> 删除</button>
                                        
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
							                    规格名称：<input type="text" id="search_text" name="sname" >									
									<button class="btn btn-default" id="search_btn" >查询</button>                                    
                                </div>
                            </div>
                            <!--工具栏/-->
			                  <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
			                              <th class="" style="padding-right:0px">
			                                  <input id="selall" type="checkbox" class="icheckbox_square-blue">
			                              </th> 
										  <th class="sorting_asc">规格ID</th>
									      <th class="sorting">规格名称</th>									     												
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                          <tr class="table_row">
			                              <td><input class="r_checkbox" onclick="checkbox();" type="checkbox" ></td>			                              
				                          <td class="td_sid"></td>
									      <td class="td_sname"></td>
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs"  onclick="editModal(this);" data-toggle="modal" data-target="#editModal">修改</button>                                           
		                                  </td>
			                          </tr>
			                      </tbody>
			                  </table>
			                  <!--数据列表/-->    
			                  <div id="find" style="text-align: center;"><font size="5" id="msg">正在加载...</font></div>
                        </div>
                        <!-- 数据表格 /--> 
                     </div>
                    <!-- /.box-body -->                    
	          		    
                                
<!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">规格编辑</h3>
		</div>
		<div class="modal-body">							
			
			<table class="table table-bordered table-striped"  width="800px">
		      	<tr>
		      		<td>规格名称</td>
		      		<td><input  class="form-control" id="e_sname" placeholder="规格名称" >  </td>
		      	</tr>
			 </table>				
			 
			 <!-- 规格选项 -->
			 <div class="btn-group">
                  <button type="button" class="btn btn-default" title="新建" id="e_addType" ><i class="fa fa-file-o"></i> 新增规格选项</button>
                  
             </div>
			 
			 <table class="table table-bordered table-striped table-hover dataTable">
                    <thead>
                        <tr>
                          
					 
				      <th class="sorting">规格选项</th>
				      <th class="sorting">排序</th>																
                      <th class="sorting">操作</th>	
                    </thead>
                    <tbody id="e_tbody">
                      <tr class="e_tr">
				            <td>
				            	<input  class="form-control tname"  placeholder="规格选项"> 
				            </td>
				            <td>
				            	<input  class="form-control sort" placeholder="排序"> 
				            </td>
							<td>
								<button type="button" class="btn btn-default" class="delbtn" onclick="delType(this);" title="删除" ><i class="fa fa-trash-o"></i> 删除</button>
							</td>
                      </tr>
                    </tbody>
			  </table> 
			
			
		</div>
		<div class="modal-footer">						
			<button class="btn btn-success" id="submit" data-dismiss="modal" aria-hidden="true">保存</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>    
</body>
</html>
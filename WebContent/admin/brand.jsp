<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>品牌管理</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){

			
			/**页面数据加载开始*/
			var tableRow = $(".table_row:first").clone();
			var tbody = $("#dataList tbody");
			
			var path = "${pageContext.request.contextPath}/";
			
			function show(){
				var url = path + "Brand/findBrand.admin";
				$("#find").show();
				var temp = {};
				
				tbody.html("");
				$.post(url,temp,function(data){
					if(data == null || data.length <= 0){
						$("#msg").text("已无数据...")
					} else {
						$("#find").hide();
					}
                    for(var i = 0; i < data.length;i++){
                    	var b = data[i];
                    	var tr = tableRow.clone();
                    	tr.find("input[type='checkbox']").val(b.bid);
                    	tr.find(".bid").html(b.bid);
                    	tr.find(".bname").html(b.bname);
                    	tr.find(".fistName").html(b.fistName);
                    	tbody.append(tr);
                    }
                    
				},"json");
				
			}
			show();
			/**页面数据加载结束*/
			
			
			/**全选*/
			$("#selall").click(function(){
				$(".r_checkbox").prop("checked",this.checked);
			});
			
			/**------------*/
			
			/**删除*/
			$("#del").click(function(){
				if($(".r_checkbox:checked").size() <= 0){
					return;
				}
				var ids = "";
				$(".r_checkbox:checked").each(function(i){
					var bid = $(this).val();
					ids += bid + ",";
				});
				
				var temp = {
					"bid":ids
				};
				var url = path + "Brand/delBrand.admin";
				$.post(url,temp,function(data){
					window.location.reload();
					alert(data.msg);
				});
			});
			
			/**删除*/
			
			/**编辑*/
			$("#editSubmit").click(function(){
				var em = $("#editModal");
				var temp = {
					"bid":em.find("#bid").val(),
					"bname":em.find("#bname").val(),
					"fistName":em.find("#fistName").val()
				};
				var url = path + "Brand/updateBrand.admin";
				$.post(url,temp,function(data){
					window.location.reload();
					alert(data.msg);
				});
				
			});
			
			/**添加*/
			$("#addSubmit").click(function(){
				var em = $("#addModal");
				var temp = {
					"bname":em.find("#addBname").val(),
					"fistName":em.find("#addFistName").val()
				};
				var url = path + "Brand/addBrand.admin";
				$.post(url,temp,function(data){
					window.location.reload();
					alert(data.msg);
				});
				
			})
			
		})
			/**点击编辑按钮编辑*/
			function editModal(e){
				var tr = $(e).parent().parent();
				
				var em = $("#editModal");
				em.find("#bid").val(tr.find(".bid").html());
				em.find("#bname").val(tr.find(".bname").html());
				em.find("#fistName").val(tr.find(".fistName").html());
				
			};
			
			
			function checkbox(){
				$("#selall").prop("checked", $(".r_checkbox").size() == $(".r_checkbox:checked").size());
			}
			
	</script>
    
</head>
<body class="hold-transition skin-red sidebar-mini">
  <!-- .box-body -->
                    <div class="box-header with-border">
                        <h3 class="box-title">品牌管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建" data-toggle="modal" data-target="#addModal" ><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="删除" id="del" >删除</button>           
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
							                                         
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
										  <th class="sorting_asc">品牌ID</th>
									      <th class="sorting">品牌名称</th>									      
									      <th class="sorting">品牌首字母</th>									     				
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                          <tr class="table_row">
			                              <td><input  type="checkbox"  onclick="checkbox();" class="r_checkbox" ></td>			                              
				                          <td class="bid" ></td>
									      <td class="bname"></td>									     
		                                  <td class="fistName"></td>		                                 
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs edit" onclick="editModal(this);" data-toggle="modal" data-target="#editModal">修改</button>                                           
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
         
<!-- 添加窗口 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">品牌添加</h3>
		</div>
		<div class="modal-body">		
			<table class="table table-bordered table-striped"  width="800px">
		      	<tr>
		      		<td>品牌名称</td>
		      		<td><input  class="form-control" id="addBname" name="bname" placeholder="品牌名称" >  </td>
		      	</tr>		      	
		      	<tr>
		      		<td>首字母</td>
		      		<td><input  class="form-control" id="addFistName" name="fistName" placeholder="首字母">  </td>
		      	</tr>		      	
			 </table>				
		</div>
		<div class="modal-footer">						
			<button class="btn btn-success" id="addSubmit" data-dismiss="modal" aria-hidden="true">保存</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>

<!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">品牌编辑</h3>
		</div>
		<div class="modal-body">
			<input type="hidden" name="bid" id="bid" value="" />
			<table class="table table-bordered table-striped"  width="800px">
		      	<tr>
		      		<td>品牌名称</td>
		      		<td><input  class="form-control" id="bname" name="bname" placeholder="品牌名称" >  </td>
		      	</tr>		      	
		      	<tr>
		      		<td>首字母</td>
		      		<td><input  class="form-control" id="fistName" name="fistName" placeholder="首字母">  </td>
		      	</tr>		      	
			 </table>				
		</div>
		<div class="modal-footer">						
			<button class="btn btn-success" id="editSubmit" data-dismiss="modal" aria-hidden="true">保存</button><!--  -->
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>
</body>
</html>
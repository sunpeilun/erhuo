<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>分类管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2-bootstrap.css" />
    <script src="${pageContext.request.contextPath}/plugins/select2/select2.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		//拷贝编辑页面
		var emdal = $("#editModal").clone();
		var e_tr;
		var e_brand;
		var e_standard;
		var path = "${pageContext.request.contextPath}/";
		
		$(function(){
			
			e_tr = $(".e_tr:first").clone();
			e_brand = $(".e_brand");
			e_standard = $(".e_standard:first").clone();
			
			/**页面数据加载开始*/
			//数据
			var tableRow = $(".table_row:first").clone();
			var tbody = $("#dataList tbody");
			
			//显示数据
			function show(mname){
				$("#find").show();
				var temp = {
					"classificationName":mname
				};
				
				var url = path + "Classify/findClassify.admin";
				tbody.html("");
				$.post(url,temp,function(data){
					if(data == null || data.length <= 0){
						$("#msg").text("已无数据...")
					} else {
						$("#find").hide();
					}
                    for(var i = 0; i < data.length;i++){
                    	var mod = data[i];
                    	var tr = tableRow.clone();

                    	tr.find("input[type='checkbox']").val(mod.classificationId);
                    	tr.find(".td_mid").html(mod.classificationId);
                    	tr.find(".td_mname").html(mod.classificationName);
                    	tr.find(".td_brand").html();
                    	tbody.append(tr);
                    }
                    
				},"json");
				
			}
			show("");
			/**页面数据加载结束*/
			
			/*查询开始*/
			$("#search_btn").click(function(){
				show($("#search_text").val());
			});
			
			/*查询结束*/
			
			/**全选开始*/
			$("#selall").click(function(){
				$(".r_checkbox").prop("checked",this.checked);
			});
			$("#e_all").click(function(){
				$(".e_checkbox").prop("checked",this.checked);
			});
			
			/*全选结束*/
			
			//添加拓展属性
			$("#e_add_attr").click(function(){
				$("#e_tbody").append(e_tr.clone());
				e_checkbox();
			})
			
			/*添加拓展属性--结束*/
			
			/**删除开始*/
			$("#del").click(function(){
				if($(".r_checkbox:checked").size() <= 0){
					return;
				}
				if(!confirm("您确定要删除吗?")){
					return;
				}
				var ids = "";
				$(".r_checkbox:checked").each(function(){
					var mid = $(this).val();
					ids += mid + ",";
				});
				
				var temp = {
					"method":"delModule",
					"mid":ids
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
				$("#e_brand_td").html("");
				$("#e_tbody").append(e_tr.clone());
				$("#e_mname").val("");
				var brandUrl = path + "Brand/findBrand.admin";
				//显示所有品牌
					$.post(brandUrl,{},function(data){
						for(var i = 0; i < data.length;i++){
	                    	var s = data[i];
							var newEb = e_brand.clone();
							newEb.append(s.bid);
							
							$("#e_brand_td").append(newEb);
							$("#e_brand_td").append(s.bname + " ");
	                    }
					},"json");
				
				$("#submit").click(function(){
					var attrValue = "";
					var modBrand = "";
					var modStandard = "";
					
					//获取拓展属性
					$(".e_tr").each(function(){
						if($(this).find(".e_checkbox").prop("checked")){
							var attr = $(this).find(".attrValue").val();
							if(attr != null){
								attrValue += attr + ",";
							}
						}
					})
					//获取关联品牌
					$(".e_brand:checked").each(function(i){
						var brand = $(this).val();
						if(brand != null){
							modBrand += brand + ",";
						}
					})
					//获取关联规格
					$(".e_standard:checked").each(function(i){
						var standard = $(this).val();
						if(standard != null){
							modStandard += standard + ",";
						}
					})
					
					var em = $("#editModal");
					var temp = {
						"method":"addModule",
						"mname":em.find("#e_mname").val(),
						"modBrand":modBrand,
						"modStandard":modStandard,
						"attrValue":attrValue
					};
					$.post(url,temp,function(data){
						window.location.reload();
						alert(data);
					});
					
				})
			};
			
			/*添加结束*/
			
			/**点击编辑按钮编辑--更新开始*/
			function editModal(e){
				$("#submit").unbind();
				$("#e_tbody").html("");
				$("#e_brand_td").html("");
				$("#e_standard_td").html("");
				
				//获取当前模板的全部信息
				var mid = $(e).parent().parent().find(".td_mid").text();
				var t = {
						"method":"selectModule",
						"mid":mid
				}
				//请求
				$.post(url,t,function(mod){
					$("#e_mname").val(mod.mname);
					$("#e_mname").data("mid",mod.mid);
					//显示所有品牌
					$.post((path + "BrandServlet"),{"method":"findBrand"},function(data){
						for(var i = 0; i < data.length;i++){
	                    	var s = data[i];
							var newEb = e_brand.clone();
							var bid = s.bid;
							newEb.val(bid);
							var bList = mod.bList;
							for(var j = 0;j < bList.length;j++){
								if(bid == bList[j].bid){
									newEb.prop("checked","checked");
								}
							}
							$("#e_brand_td").append(newEb);
							$("#e_brand_td").append(s.bname + " ");
	                    }
					},"json");
				
					//显示所有规格
					$.post((path + "StandardServlet"),{"method":"findStandard"},function(data){
						for(var i = 0; i < data.length;i++){
	                    	var s = data[i];
							var newEs = e_standard.clone();
							var sid = s.sid;
							newEs.val(sid);
							var sList = mod.sList;
							for(var j = 0;j < sList.length;j++){
								if(sid == sList[j].sid){
									newEs.prop("checked","checked");
								}
							}
							$("#e_standard_td").append(newEs);
							$("#e_standard_td").append(s.sname + " ");
	                    }
					},"json");
					
					//显示拓展属性
					var avList = mod.avList;
					for(var j = 0;j < avList.length;j++){
						var temp_tr = e_tr.clone();
						temp_tr.find(".attrValue").val(avList[j].attrValue);
						$("#e_tbody").append(temp_tr);
					}
					$("#e_all").prop("checked", "checked");
					$(".e_checkbox").prop("checked","checked");
				},"json");
				
				$("#submit").click(function(){
					var attrValue = "";
					var modBrand = "";
					var modStandard = "";
					
					//获取拓展属性
					$(".e_tr").each(function(){
						if($(this).find(".e_checkbox").prop("checked")){
							var attr = $(this).find(".attrValue").val();
							if(attr != null){
								attrValue += attr + ",";
							}
						}
					})
					//获取关联品牌
					$(".e_brand:checked").each(function(i){
						var brand = $(this).val();
						if(brand != null){
							modBrand += brand + ",";
						}
					})
					//获取关联规格
					$(".e_standard:checked").each(function(i){
						var standard = $(this).val();
						if(standard != null){
							modStandard += standard + ",";
						}
					})
					
					var em = $("#editModal");
					var temp = {
						"method":"upModule",
						"mid":em.find("#e_mname").data("mid"),
						"mname":em.find("#e_mname").val(),
						"modBrand":modBrand,
						"modStandard":modStandard,
						"attrValue":attrValue
					};
					$.post(url,temp,function(data){
						window.location.reload();
						alert(data);
					});
					
				})
			}
			/*更新结束*/
			
			function checkbox(){
				$("#selall").prop("checked", $(".r_checkbox").size() == $(".r_checkbox:checked").size());
			}
			function e_checkbox(){
				$("#e_all").prop("checked", $(".e_checkbox").size() == $(".e_checkbox:checked").size());
			}
			
			//删除拓展属性
			function delAttr(e){
				var tr = $(e).parent().parent();
				tr.remove();
			}

			
	</script>
</head>

<body class="hold-transition skin-red sidebar-mini" >
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">商品分类管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" onclick="addModal()" title="新建" data-toggle="modal" data-target="#editModal" ><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" id="del" class="btn btn-default" title="删除"><i class="fa fa-trash-o"></i> 删除</button>
                                       
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
							                  分类名称：<input type="text" id="search_text">									
									<button id="search_btn" class="btn btn-default">查询</button>                                    
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
										  <th class="sorting_asc">分类ID</th>
									      <th class="sorting">分类名称</th>
									      <th class="sorting">关联品牌</th>
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                          <tr class="table_row">
			                              <td><input  class="r_checkbox"  onclick="checkbox();" type="checkbox"></td>			                              
				                          <td class="td_mid"></td>
									      <td class="td_mname"></td>
									      <td class="td_brand"></td>
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs"   onclick="editModal(this);"  data-toggle="modal" data-target="#editModal" >修改</button>                                           
		                                  </td>
			                          </tr>
			                      </tbody>
			                  </table>
			                  <!--数据列表/-->                        
							  <div id="find" style="text-align: center;"><font size="5">正在加载...</font></div>
							 
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
			<h3 id="myModalLabel">添加商品分类</h3>
		</div>
		<div class="modal-body">							
			
			<table class="table table-bordered table-striped"  width="800px">
		      	<tr>
		      		<td>商品分类</td>
		      		<td><input id="e_mname" class="form-control" placeholder="分类名">  </td>
		      	</tr>			   

		      	<tr>
		      		<td>关联品牌</td>
		      		<td>
		      			<div class="btn-group">
                             <button type="button" class="btn btn-default" id="e_add_attr" title="添加品牌"><i class="fa fa-file-o"></i> 添加品牌</button>
                                                                    
                        </div>
						<table class="table table-bordered table-striped"  width="800px">
							<thead>
								<tr>
								    <td><input type="checkbox" id="e_all" class="icheckbox_square-blue"></td>
									<td>品牌</td>									
									<td>操作</td>
								</tr>
							</thead>
							<tbody id="e_tbody">
								<tr class="e_tr">
									<td><input type="checkbox"  onclick="e_checkbox();" class="icheckbox_square-blue e_checkbox" ></td>
									<td class="e_brand_td">
										<select class="form-control e_brand">
											<option>--请选择--</option>
											<option>小米</option>
											<option>魅族</option>
											<option>华为</option>
										</select>
									</td>
									<td><button type="button" class="btn btn-default" onclick="delAttr(this);" title="删除"><i class="fa fa-trash-o"></i> 删除</button></td>
								</tr>
							</tbody>
						</table>	
           
		      		</td>
		      	</tr>	
		      	      
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
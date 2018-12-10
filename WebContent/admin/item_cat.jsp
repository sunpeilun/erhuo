<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品分类管理</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>

</head>

<body class="hold-transition skin-red sidebar-mini" >
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">商品分类管理     
                       	</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">
							
                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" onclick="addClass()" title="新建" data-toggle="modal" data-target="#editModal" ><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" id="del" title="删除" ><i class="fa fa-trash-o"></i> 删除</button>
                                        <a href="${pageContext.request.contextPath}/admin/item_cat.jsp?cid=${param.cid}">
	                                        <button type="button" class="btn btn-default" title="刷新" ><i class="fa fa-check"></i> 刷新</button>
                                        </a> 
                                    </div>
                                </div>
                            </div>                          
                       		
                        
			                <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
			                              <th class="" style="padding-right:0px">
			                                  <input  id="selall" type="checkbox" class="icheckbox_square-blue">
			                              </th> 
										  <th class="sorting_asc">分类ID</th>
									      <th class="sorting">分类名称</th>									   
									      <th class="sorting">类型模板ID</th>
									     						
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                          <tr class="table_row">
			                              <td><input class="r_checkbox" onclick="checkbox();" type="checkbox" ></td>			                              
				                          <td class="td_cid"></td>
									      <td class="td_cname"></td>									    
									      <td class="td_mid"></td>									      
		                                  <td class="text-center">
		                                  	<a href="" class="a_guide a_next">
		                                  		<button type="button" class="btn bg-olive btn-xs" >查询下级</button>
											</a> 	                                     
		                                 	  <button type="button" class="btn bg-olive btn-xs" onclick="upClass(this);" data-toggle="modal" data-target="#editModal" >修改</button>                                           
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
			<h3 id="myModalLabel">商品分类编辑</h3>
		</div>
		<div class="modal-body">							
			
			<table class="table table-bordered table-striped"  width="800px">
				<tr>
		      		<td>上级商品分类</td>
		      		<td id="boss">
		      		   珠宝 >>  银饰
		      		</td>
		      	</tr>
		      	<tr>
		      		<td>商品分类名称</td>
		      		<td><input type="text" id="e_cname" class="form-control" placeholder="商品分类名称">  </td>
		      	</tr>			  
		      	<tr>
		      		<td>类型模板</td>
		      		<td>
		      			<select class="form-control" id="e_select">
		      				<option id="e_opt" selected="selected">--请选择模板--</option>
		      			</select>
		      			<!-- <input select2 config="options['type_template']" placeholder="商品类型模板" class="form-control" type="text"/> -->
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
	<script type="text/javascript">

		var emdal = $("#editModal").clone();
		var path = "${pageContext.request.contextPath}/";
		var url = path + "ClassesServlet";
		var myurl = "${pageContext.request.contextPath}/admin/item_cat.jsp";

		var bossId = "${param.cid}";

		/**页面数据加载开始*/
		//数据
		var tableRow = $(".table_row:first").clone();
		var tbody = $("#dataList tbody");
		var breadcrumb = $(".breadcrumb:first");
		var li_guide = breadcrumb.find(".li_guide:first").clone();
		//显示数据
		function show(cid) {
			$("#find").show();
			var temp = {
				"method" : "findClass",
				"cid" : cid
			};

			tbody.html("");
			breadcrumb.html(li_guide.clone());
			$.post(url, temp, function(data) {
				var guide = data.guide;
				var list = data.list;
				if(list == null || list.length <= 0){
					$("#msg").text("已无数据...")
				} else {
					$("#find").hide();
				}
				var allBoss = "";
				for (var i = guide.length - 1; i >= 0; i--) {
					var li = li_guide.clone();
					var a_guide = li.find(".a_guide");
					var cname = guide[i].cname;
					allBoss += cname
					a_guide.text(cname);
					a_guide.prop("href", myurl + "?cid=" + guide[i].cid);
					breadcrumb.append(li);
					if (i != 0) {
						allBoss += " >> ";
					}
				}

				$("#boss").text(allBoss);
				$("#boss").data("bossId", bossId);

				for (var i = 0; i < list.length; i++) {
					var c = list[i];
					var tr = tableRow.clone();

					tr.find("input[type='checkbox']").val(c.cid);
					tr.find(".td_cid").html(c.cid);
					tr.find(".td_cname").html(c.cname);
					tr.find(".td_mid").html(c.mid);
					tr.find(".a_next").prop("href", myurl + "?cid=" + c.cid);
					tbody.append(tr);
				}

			}, "json");
		}
		//show("${param.cid}");
		/**页面数据加载结束*/

		var e_select = $("#e_select");
		var e_opt = $("#e_opt");

		/*新建--开始*/
		function addClass() {
			$("#submit").unbind();
			$("#e_cname").val("")
			e_select.html(e_opt);

			$.post((path + "ModuleServlet"), {
				"method" : "findModule"
			}, function(data) {
				for (var i = 0; i < data.length; i++) {
					var mod = data[i];
					var opt = $("<option></option>");
					opt.val(mod.mid);
					opt.text(mod.mname);
					e_select.append(opt);
				}

			}, "json");

			$("#submit").click(function() {
				var temp = {
					"method" : "addClass",
					"cname" : $("#e_cname").val(),
					"bossId" : bossId,
					"mid" : e_select.find("option:selected").val()
				};

				$.post(url, temp, function(data) {
					show(bossId);
					alert(data);
				});
			})
		}
		/*新建--结束*/
		
		/*编辑--开始*/
		function upClass(e) {
			$("#submit").unbind();
			var cid;
			var mid;
			var cid = $(e).parent().parent().find(".td_cid").text();
			$.post(url,{"method" : "selectClass","cid":cid},function(data){
				$("#e_cname").val(data.cname);
				cid = data.cid;
				mid = data.mid;
			},"json");
			
			e_select.html(e_opt);

			$.post((path + "ModuleServlet"), {
				"method" : "findModule"
			}, function(data) {
				for (var i = 0; i < data.length; i++) {
					var mod = data[i];
					var opt = $("<option></option>");
					if(mod.mid == mid){
						e_opt.prop("selected",false);
						opt.prop("selected","selected");
					}
					opt.val(mod.mid);
					opt.text(mod.mname);
					e_select.append(opt);
				}

			}, "json");

			$("#submit").click(function() {
				var temp = {
					"method" : "upClass",
					"cid":cid,
					"cname" : $("#e_cname").val(),
					"bossId" : bossId,
					"mid" : e_select.find("option:selected").val()
				};

				$.post(url, temp, function(data) {
					show(bossId);
					alert(data);
				});
			})
		}
		/*编辑--结束*/
		
		/*删除--开始*/

		$("#del").click(function() {
			if($(".r_checkbox:checked").size() <= 0){
				return;
			}
			if (!confirm("您确定要删除吗?")) {
				return;
			}
			var ids = "";
			$(".r_checkbox:checked").each(function() {
				var id = $(this).val();
				ids += id + ",";
			});

			var temp = {
				"method" : "delClass",
				"ids" : ids
			};

			$.post(url, temp, function(data) {
				show(bossId);
				alert(data);
			});
		});
		/*删除--结束*/

		/**全选开始*/

		$("#selall").click(function() {
			$(".r_checkbox").prop("checked", this.checked);
		});
		function checkbox() {
			$("#selall").prop("checked",
					$(".r_checkbox").size() == $(".r_checkbox:checked").size());
		}
		/**全选--结束*/
	</script>
</html>
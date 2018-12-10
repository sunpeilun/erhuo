<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>广告管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    $(function(){
    	
		function show(){
			var tbody=$("#dataList tbody");
			var tableRow=$(".tr_row:first").clone();
			tbody.html(""); 
    		var url="${pageContext.request.contextPath}/"+"AdverServlet";
            var params={"method":"findAll"}
            $.post(url,params,function(data){
            	 for(var i = 0; i < data.length;i++){
                 	var b = data[i];
                 	var tr = tableRow.clone();
                 	tr.find("input[type='checkbox']").val(b.advId);
                 	tr.find(".advId").html(b.advId);
                 	tr.find(".adClassId").html(b.adClassId);
                 	tr.find(".title").html(b.title);
                 	tr.find(".url").html(b.url);
                	tr.find(".image").html();
                 	tr.find(".sort").html(b.sort);
                 	tr.find(".state").html(b.state);
                 	tbody.append(tr);
                 }
            },"json")
		}
    	show();
    	
    	$("#delete").click(function(){
    		var dl="";
    		$("#check:checked").each(function(){
    			var re=$(this).val();
    			dl+=re+",";

    		})
    		var url="${pageContext.request.contextPath}/"+"AdverServlet";
    			var params={"method":"delete",
    				 	    "dl":dl
    		               };
    			$.post(url,params,function(data){
    				window.location.reload();
    				alert(data);
    			})
    	})
    	
    	$("#start").click(function(){
    		var st="";
    		$("#check:checked").each(function(){
    			var re=$(this).val();
    			st+=re+",";
    		})
    		var url="${pageContext.request.contextPath}/"+"AdverServlet";
    			var params={"method":"start",
    				 	    "start":st
    		               };
    			$.post(url,params,function(data){
    				window.location.reload();
    				alert(data);
    			})
    	})
    	var add_select = $("#add_select");
		var add_opt = $("#add_opt");
		add_select.html(add_opt);

			$.post(("${pageContext.request.contextPath}/" + "AdvServlet"), {"method" : "findAll"}, function(data) {
				for (var i = 0; i < data.length; i++) {
					var adv = data[i];
					var opt = $("<option></option>");
					opt.val(adv.classId);
					opt.text(adv.className);
					add_select.append(opt);
				}

			}, "json");
    	
    	$("#submit").click(function(){
    		var url="${pageContext.request.contextPath}/"+"AdverServlet";
    		var value=$("#editModal");
    		var params={"method":"add",
    			       "title":value.find("#title").val(),
    			       "url":value.find("#url").val(),
    			       "sort":value.find("#sort").val(),
    			       "state":value.find("#state").prop("checked"),
    			       "adClassId":value.find("#add_select option:selected").val(),
    			       "image":value.find("#image").val(),
    			       };
    		$.post(url,params,function(data){
    			window.location.reload();
    			alert(data)
    		})
    	})
    	
    	
    	    $("#update").click(function(){
    		var v=$("#editModal2");
    		var advId= v.find("#advId").val();
    		var title=v.find("#title").val();
    		var urls=v.find("#url").val();
    		var sort=v.find("#sort").val();
    		var state=v.find("#state").prop("checked");
    		var adClassId=v.find("#up_select option:selected").val();
    		var image=v.find("#image").val();
    	    if(state==true){
    	    	state="有效";
    	    }else{
    	    	state="无效";
    	    }
    		var url="${pageContext.request.contextPath}/"+"AdverServlet";
    		var params={"method":"update",
    				    "advId":advId,
    				    "state":state,
    				    "url":urls,
    				    "title":title,
    				    "sort":sort,
    				    "adClassId":adClassId,
    				    "image":image
    				    };
    		$.post(url,params,function(data){
    			window.location.reload();
    			alert(data);
    		})
    	})
    	
    	$("#close").click(function(){
    		var cl="";
    		$("#check:checked").each(function(){
    			var re=$(this).val();
    			cl+=re+",";
    		})
    		var url="${pageContext.request.contextPath}/"+"AdverServlet";
    			var params={"method":"close",
    				 	    "close":cl
    		               };
    			$.post(url,params,function(data){
    				window.location.reload();
    				alert(data);
    			})
    	})
    	
      
    	
  
    })
      function edit(date){
    	/* var params={"method":"update",
			    "advId":advId,
			    "state":state,
			    "url":url,
			    "title":title,
			    "sort":sort,
			    "adClassId":adClassId,
			    "image":image
			    }; */
			
			    var up_select = $("#up_select");
				var up_opt = $("#up_opt");
				up_select.html(up_opt);

			
    		var advId=$(date).parent().parent().find(".advId").html();
        	var state=$(date).parent().parent().find(".state").html();
        	var url=$(date).parent().parent().find(".url").html();
        	var title=$(date).parent().parent().find(".title").html();
        	var sort=$(date).parent().parent().find(".sort").html();
        	var adClassId=$(date).parent().parent().find(".adClassId").html();
        	var vs=$("#editModal2");
        	
        	$.post(("${pageContext.request.contextPath}/" + "AdvServlet"), {"method" : "findAll"}, function(data) {
				for (var i = 0; i < data.length; i++) {
					var adv = data[i];
					var opt = $("<option></option>");
					if(adClassId == adv.classId){
						opt.prop("selected","selected")
					}
					opt.val(adv.classId);
					opt.text(adv.className);
					up_select.append(opt);
				}

			}, "json");
        	
        	vs.find("#state").val(state);
        	vs.find("#url").val(url);
        	vs.find("#title").val(title);
        	vs.find("#sort").val(sort);
        	vs.find("#adClassId").val(adClassId);
        	vs.find("#advId").val(advId);
        	if(state=="有效"){
        		vs.find("#state").prop("checked","chekced")
        		}else{
        			vs.find("#state").prop("checked",false)
        		}
        	
    	}
    
    </script>
</head>


<body class="hold-transition skin-red sidebar-mini">
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">广告管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建" data-toggle="modal" data-target="#editModal" ><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="删除" id="delete"><i class="fa fa-trash-o"></i> 删除</button>
                                        <button type="button" class="btn btn-default" title="开启" onclick='confirm("你确认要开启吗？")' id="start"><i class="fa fa-check"></i> 开启</button>
                                        <button type="button" class="btn btn-default" title="屏蔽" onclick='confirm("你确认要屏蔽吗？")' id="close"><i class="fa fa-ban"></i> 屏蔽</button>
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
										  <th class="sorting_asc">广告ID</th>
									      <th class="sorting">分类ID</th>
									      <th class="sorting">标题</th>
									      <th class="sorting">URL</th>		
									      <th class="sorting">图片</th>	
									      <th class="sorting">排序</th>		
									      <th class="sorting">是否有效</th>											     						      							
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                       <tbody>
			                          <tr class="tr_row">
			                              <td><input  type="checkbox" id="check"></td>			                              
				                          <td class="advId">1</td>
									      <td class="adClassId">1</td>
									      <td class="title">促销海报1</td>
									      <td class="url">http://wwww.hb.com/hd1.html</td>
									      <td class="image">
									      	<img alt="" src="" width="100px" height="50px">
									      </td>
									      <td class="sort">1</td>
									      <td class="state">有效</td>									     								     
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal2" onclick="edit(this);">修改</button>                                           
		                                  </td>
			                          </tr>
			                      </tbody>
			                  </table>
			                  <!--数据列表/--> 
			                  
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
			<h3 id="myModalLabel">广告编辑</h3>
		</div>
		<div class="modal-body">							
			<input type="hidden" id="advId" value="" />
			<table class="table table-bordered table-striped"  width="800px">
				<tr>
		      		<td >广告分类</td>
		      		<td>
		      			<select class="form-control" id="add_select">
		      				<option id="add_opt" selected="selected">--请选择分类--</option>
		      			</select>
		      		</td>
		      	</tr>
		      	<tr>
		      		<td>标题</td>
		      		<td><input  class="form-control" placeholder="标题" id="title">  </td>
		      	</tr>
			    <tr>
		      		<td>URL</td>
		      		<td><input  class="form-control" placeholder="URL" id="url" >  </td>
		      	</tr>	
		      	<tr>
		      		<td>排序</td>
		      		<td><input  class="form-control" placeholder="排序" id="sort">  </td>
		      	</tr>			      	
		      	<tr>
		      		<td>广告图片</td>
		      		<td>
						<input  id="image" />				                
		      		</td>
		      	</tr>	      
		      	<tr>
		      		<td>是否有效</td>
		      		<td>
		      		   <input type="checkbox" class="icheckbox_square-blue" id="state" >
		      		</td>
		      	</tr>  	
			 </table>				
			
		</div>
		<div class="modal-footer">						
			<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="submit" >保存</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>


<div class="modal fade" id="editModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">广告编辑</h3>
		</div>
		<div class="modal-body">							
			<input type="hidden" id="advId" value="" />
			<table class="table table-bordered table-striped"  width="800px">
				<tr>
		      		<td >广告分类</td>
		      		<td>
		      			<select class="form-control" id="up_select">
		      				<option id="up_opt">--请选择分类--</option>
		      			</select>
		      		</td>
		      	</tr>
		      	<tr>
		      		<td>标题</td>
		      		<td><input  class="form-control" placeholder="标题" id="title">  </td>
		      	</tr>
			    <tr>
		      		<td>URL</td>
		      		<td><input  class="form-control" placeholder="URL" id="url" >  </td>
		      	</tr>	
		      	<tr>
		      		<td>排序</td>
		      		<td><input  class="form-control" placeholder="排序" id="sort">  </td>
		      	</tr>			      	
		      	<tr>
		      		<td>广告图片</td>
		      		<td>
						<input  id="image" />				                
		      		</td>
		      	</tr>	      
		      	<tr>
		      		<td>是否有效</td>
		      		<td>
		      		   <input type="checkbox" class="icheckbox_square-blue" id="state" >
		      		</td>
		      	</tr>  	
			 </table>				
			
		</div>
		<div class="modal-footer">						
			<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" id="update">保存</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>

</body>

</html>
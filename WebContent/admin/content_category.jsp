<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>广告分类管理</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(function(){
		var tableRow = $(".table_row:first").clone();
		var tbody = $("#dataList tbody");
		
		var path = "${pageContext.request.contextPath}/";
		var url = path + "AdvServlet";
		
		function show(){
			var temp = {"method":"findAll"};
			tbody.html("");
			$.post(url,temp,function(data){
                for(var i = 0; i < data.length;i++){
                	var b = data[i];
                	var tr = tableRow.clone();
                	tr.find("input[type='checkbox']").val(b.classId);
                	tr.find(".classId").html(b.classId);
                	tr.find(".className").html(b.className);
                	tr.find(".group").html(b.group);
                	tr.find(".advKey").html(b.advKey);
                	tr.find(".state").html(b.state);
                	tbody.append(tr);
                }
                
			},"json");
			
		}
		show();
    	
    	function checkbox(datas){
			$("#check").prop("checked", $(".r_checkbox").size() == $(".r_checkbox:checked").size());
		}
    	
    	
    	$("#delete").click(function(){
    		var dl="";
    		$("#check:checked").each(function(){
    			var re=$(this).val();
    			dl+=re+",";

    		})
    		var url="${pageContext.request.contextPath}/"+"AdvServlet";
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
    		var url="${pageContext.request.contextPath}/"+"AdvServlet";
    			var params={"method":"start",
    				 	    "start":st
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
    		var url="${pageContext.request.contextPath}/"+"AdvServlet";
    			var params={"method":"close",
    				 	    "close":cl
    		               };
    			$.post(url,params,function(data){
    				window.location.reload();
    				alert(data);
    			})
    	})
    	$("#update").click(function(){
    		var v=$("#editModal2");
    		var classId= v.find("#classId").val();
    		var className=v.find("#className").val();
    		var advKey=v.find("#advKey").val();
    		var group=v.find("#group").val();
    		var state=v.find("#state").prop("checked");
    	    if(state==true){
    	    	state="有效";
    	    }else{
    	    	state="无效";
    	    }
    		var url="${pageContext.request.contextPath}/"+"AdvServlet";
    		var params={"method":"update",
    				    "classId":classId,
    				    "state":state,
    				    "advKey":advKey,
    				    "group":group,
    				    "className":className
    				    };
    		$.post(url,params,function(data){
    			window.location.reload();
    			alert(data);
    		})
    	})
    	
    	
    })
    function edit(date){
    		var id=$(date).parent().parent().find(".classId").html();
        	var className=$(date).parent().parent().find(".className").html();
        	var group=$(date).parent().parent().find(".group").html();
        	var advKey=$(date).parent().parent().find(".advKey").html();
        	var state=$(date).parent().parent().find(".state").html();
        	var vs=$("#editModal2");
        	vs.find("#classId").val(id);
        	vs.find("#className").val(className);
        	vs.find("#group").val(group);
        	vs.find("#advKey").val(advKey);
        	if(state=="有效"){
        		vs.find("#state").prop("checked","chekced")
        		}else{
        			vs.find("#state").prop("checked",false)
        		}
        	
    	}
    function search(){
    	var url="${pageContext.request.contextPath}/"+"AdvServlet";
    	var params={"method":"search",
    			    "value":$("#search").val()
    			};
    	$.post(url,params,function(data){
    		var tableRow = $(".table_row:first").clone();
			var tbody = $("#dataList tbody");
			tbody.html("");
    		$(data).each(function(){
    			var b = this;
            	var tr = tableRow.clone();
            	tr.find("input[type='checkbox']").val(b.classId);
            	tr.find(".classId").html(b.classId);
            	tr.find(".className").html(b.className);
            	tr.find(".group").html(b.group);
            	tr.find(".advKey").html(b.advKey);
            	tr.find(".state").html(b.state);
            	tbody.append(tr);
    		})
    	},"json")
    }
    </script>
</head>

<body class="hold-transition skin-red sidebar-mini"  >
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">广告分类管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建" data-toggle="modal" data-target="#editModal" ><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="删除" id="delete"><i class="fa fa-trash-o" ></i> 删除</button>
                                        <button type="button" class="btn btn-default" title="开启" onclick='confirm("你确认要开启吗？")' id="start"><i class="fa fa-check"></i> 开启</button>
                                        <button type="button" class="btn btn-default" title="屏蔽" onclick='confirm("你确认要屏蔽吗？")' id="close"><i class="fa fa-ban"></i> 屏蔽</button>
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
							        名称：<input id="search">	<button class="btn btn-default" onclick="search();">查询</button>                                    
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
									      <th class="sorting">分组</th>
									      <th class="sorting">KEY</th>
									      <th class="sorting">状态</th>								      							
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                          <tr class="table_row">
			                              <td><input  type="checkbox" onclick="checkbox();" id="check" ></td>			                              
				                          <td class="classId"></td>
									      <td class="className"></td>
									      <td class="group"></td>
									      <td class="advKey"></td>
		                                  <td class="state">							                                    
		                                  </td>
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"   onclick="edit(this);" data-target="#editModal2" >修改</button>     
		                                 	                          
		                                  </td>
			                          </tr>
			                      </tbody>
			                  </table>
			                  <!--数据列表/--> 
                        </div>
                        <!-- 数据表格 /-->
                     </div>
                    <!-- /.box-body -->
	            <!-- 分页 -->
				
				                
<!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">广告分类编辑</h3>
		</div>
		<form action="${pageContext.request.contextPath}/AdvServlet" method="post"> 
		<div class="modal-body">							
			<input type="hidden" name="method" value="addAdv" />
			<table class="table table-bordered table-striped"  width="800px">
		      	<tr>
		      		<td>分类名称</td>
		      		<td><input  class="form-control" placeholder="分类名称" name="className">  </td>
		      	</tr>
		      	<tr>
		      		<td>分组</td>
		      		<td><input  class="form-control" placeholder="分组" name="group">  </td>
		      	</tr>	
			    <tr>
		      		<td>KEY</td>
		      		<td><input  class="form-control" placeholder="KEY" name="advKey">  </td>
		      	</tr>		      
		      	<tr>
		      		<td>是否有效</td>
		      		<td>
		      		 <input type="checkbox" class="icheckbox_square-blue" name="state">
		      		</td>
		      	</tr>  	
			 </table>	
				
			
		</div>
		<div class="modal-footer">						
			<button class="btn btn-success"  aria-hidden="true" type="submit">保存</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div></form>
	  </div>
	</div>
</div>
<!-- 编辑窗口 -->
<div class="modal fade" id="editModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">广告分类编辑</h3>
		</div>
		<div class="modal-body">
			<input type="hidden" name="classId" id="classId" value="" />
			<table class="table table-bordered table-striped"  width="800px">
			
		      	<tr>
		      		<td>分类名称</td>
		      		<td><input  class="form-control" placeholder="分类名称" id="className">  </td>
		      	</tr>
		      	<tr>
		      		<td>分组</td>
		      		<td><input  class="form-control" placeholder="分组" id="group">  </td>
		      	</tr>	
			    <tr>
		      		<td>KEY</td>
		      		<td><input  class="form-control" placeholder="KEY" id="advKey">  </td>
		      	</tr>		      
		      	<tr>
		      		<td>是否有效</td>
		      		<td>
		      		 <input type="checkbox" class="icheckbox_square-blue" id="state">
		      		</td>
		      	</tr>  	
			 </table>	
				
			
		</div>
		<div class="modal-footer">						
			<button class="btn btn-success"  aria-hidden="true" data-dismiss="modal" id="update">保存</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>

    
</body>

</html>
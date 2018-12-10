<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商家管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
		 	#hiddenDiv{
		 	 position:absolute;
		 	 width:200px;
		 	 height:100px;
		 	 background:#fff;
		 	 border:1px solid #999;
		 	 border-radius:4px;
		 	 display:none;
		 	margin-left:70px;
		 	}
			#hiddDiv{
		 	 position:absolute;
		 	 width:200px;
		 	 height:100px;
		 	 background:#fff;
		 	 border:1px solid #999;
		 	 border-radius:4px;
		 	 display:none;
		 	margin-left:310px;
		 	}
		</style>
    <script type="text/javascript">
    	//全选
    	$(function(){
    		$("#selall").click(function(){
    			$(".checkbox").prop("checked",this.checked);
    		});
    		var url = "${pageContext.request.contextPath}/ShangJiaServlet";
    		var params = {
					"method":"findByState"
			};

    		 var tbodyClo =$("#tbodyId").clone();
    		 var tbody = $("#tbodyId");
    		 var trObj = $("#trId").clone();
    		$.post(url,params,function(data){
    			$(tbody).html("");
    			$(data).each(function(i){
    				var obj = data[i];
    				var cloneObj = $(trObj).clone();
    				 $(cloneObj).find("#sjId").html(obj.sjId);
    				 $(cloneObj).find("#cname").html(obj.companyName);
    				 $(cloneObj).find("#sId").html(obj.shopName);
    				 $(cloneObj).find("#linkId").html(obj.linkmaName);
    				 $(cloneObj).find("#phoneId").html(obj.companyDianhua);
    				 $(cloneObj).find("#tdbtn").append(" <button type='button' class='btn bg-olive btn-xs' data-toggle='modal'  data-target='#sellerModal' onclick='selectOne("+obj.sjId+")'>详情</button>");
    				 tbody.append(cloneObj);
    			});
    		},"json");
    		
    		//刷新列表
    		$("#flash").click(function(){
    			//从新加载
    			window.location.reload();
    		})
    		//查询按钮
    		$("#selectBtn").click(function(){
    			//隐藏帮助div
    			$("#hiddenDiv").hide();
    			$("#hiddDiv").hide();
    			//获取输入框内容
    			var comVal=$("#comId").val();
    			var shopVal=$("#shopId").val();
    				var url = "${pageContext.request.contextPath}/ShangJiaServlet";
    				var params = {
    						"method":"findByBtn",
    						"companyName":comVal,
    						"shopName":shopVal,
    						"state":"审核通过"
    						
    						
    				};
    				$.post(url,params,function(data){
    					$(tbody).html("");
    	    			$(data).each(function(i){
    	    				var obj = data[i];
    	    				var cloneObj = $(trObj).clone();
    	    				 $(cloneObj).find("#sjId").html(obj.sjId);
    	    				 $(cloneObj).find("#cname").html(obj.companyName);
    	    				 $(cloneObj).find("#sId").html(obj.shopName);
    	    				 $(cloneObj).find("#linkId").html(obj.linkmaName);
    	    				 $(cloneObj).find("#phoneId").html(obj.companyDianhua);
    	    				 $(cloneObj).find("#tdbtn").append(" <button type='button' class='btn bg-olive btn-xs' data-toggle='modal'  data-target='#sellerModal' onclick='selectOne("+i+")'>详情</button>");
    	    				 tbody.append(cloneObj);
    	    			});
    	    		},"json");
    		});
    		//帮助div设置
    		$("#comId").keyup(function(){
    			//获得公司输入框内容
    			var comVal = $(this).val();
    			$("#hiddenDiv").hide();
    			if(comVal.length > 0){
    				var url = "${pageContext.request.contextPath}/ShangJiaServlet";
    				var params = {
    						"method":"findByName",
    						"companyName":comVal,
    						
    				};
    				$.post(url,params,function(data){
    					// $("#itemul").append("<li class='list-group-item' id='liId"+i+"' onclick='dianji("+i+")'>"+v+"</li>");
    					if(data.length>0){
    						$("#itemul").empty();
    						$(data).each(function(){
    							var v = this.companyName;
    							$("#itemul").append("<li class='list-group-item'  onclick='dianji(this)'>"+v+"</li>");
    						});
    						$("#hiddenDiv").show();
    					}else{
    						$("#hiddenDiv").hide();
    					}
    				},"json");
    			}
    		});
    		$("#shopId").keyup(function(){
    			//获得公司输入框内容
    			var shopVal = $(this).val();
    			$("#hiddDiv").hide();
    			if(shopVal.length > 0){
    				var url = "${pageContext.request.contextPath}/ShangJiaServlet";
    				var params = {
    						"method":"findByName",
    						"shopName":shopVal
    				};
    				$.post(url,params,function(data){
    					if(data.length>0){
    						$("#hidUl").empty();
    						$(data).each(function(){
    							var v = this.shopName;
    							var div = $("#hiddDiv");
    							var name = $("#shopID");
    							$("#hidUl").append("<li class='list-group-item'  onclick='djClick(this)'>"+v+"</li>");
    						});
    						$("#hiddDiv").show();
    					}else{
    						$("#hiddDiv").hide();
    					}
    				},"json");
    			}
    		}).focus(function(){
    			$("#hiddenDiv").hide();
    		});
    		
    	});
    	//追加 li 点击事件（公司）
    	function dianji(obj){
    		var liVal  =$(obj).html();
    		$("#comId").prop("value",liVal);
    		$("#hiddenDiv").hide();
    	}
    	//追加 li 点击事件（店铺）
    	function djClick(obj){
    		var liVal  =$(obj).html();
    		$("#shopId").prop("value",liVal);
    		$("#hiddDiv").hide();
    	}
    	
    	//详情状态按钮
    	function shenghe(obj){
    		var sjId = $("#xqId").find(":hidden").val();
    		var state = $(obj).text();
    		var url = "${pageContext.request.contextPath}/ShangJiaServlet";
    		var params = {
    				"method":"updateState",
    				"sjId":sjId,
    				"state":state
    		};
    		$.post(url,params,function(){
    			window.location.reload();
    		});
    	}
    	
    	//商家详情
    	function selectOne(sjId){
    		var url = "${pageContext.request.contextPath}/ShangJiaServlet";
    		var params = {
    				"method":"findById",
    				"id":sjId
    		};
    		$.post(url,params,function(data){
    			$("#companyName").html(data.companyName);
    			$("#companyPhone").html(data.companyPhone);
    			$("#companyDianhua").html(data.companyDianhua);
    			$("#companyAddress").html(data.companyAddress);
    			$("#linkmaName").html(data.linkmaName);
    			$("#linkmanQq").html(data.linkmanQq);
    			$("#linkmanPhone").html(data.linkmanPhone);
    			$("#linkmanEmail").html(data.linkmanEmail);
    			$("#companyName").html(data.companyName);
    			$("#salesLicense").html(data.salesLicense);
    			$("#taxAregisterCarnum").html(data.taxAregisterCarnum);
    			$("#organCodeCarnum").html(data.organCodeCarnum);
    			$("#legalTypicalPerson").html(data.legalTypicalPerson);
    			$("#legalTypicalPersonCarnum").html(data.legalTypicalPersonCarnum);
    			$("#openName").html(data.openName);
    			$("#openBank").html(data.openBank);
    			$("#bankNum").html(data.bankNum); 
    			var gbbtn = $("#xqId").find("#gbbtn").clone();
    			var gb =$("#xqId").find("#gbId").clone();
    			var xqObj = $("#xqId");
    			$("#xqId").empty();
    			//<input type="hidden" value='审核通过'>
    			var hid = $("<input type='hidden'>");
    			hid.val(data.sjId);
    			$(gbbtn).append(hid);
    			$(xqObj).append(gbbtn).append(gb);
    		},"json");
    	}
    </script>
</head>

<body class="hold-transition skin-red sidebar-mini"  >
  <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">商家审核</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
							         公司名称：<input  type="text" id="comId" >
									<div id="hiddenDiv" style="display: none; " >
											<ul id="itemul" class="list-group">
											</ul>
										</div>
									店铺名称： <input  type="text" id="shopId" >
									<div id="hiddDiv" style="display: none;">
											<ul id="hidUl" class="list-group">
											</ul>
										</div>												
									<button class="btn btn-default" id="selectBtn" >查询</button>
									<button class="btn btn-default" id="flash" >刷新</button>                                      
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
										  <th class="sorting_asc">商家ID</th>
									      <th class="sorting">公司名称</th>
									      <th class="sorting">店铺名称</th>
									      <th class="sorting">联系人姓名</th>
									      <th class="sorting">公司电话</th>
									      <th class="sorting">操作</th>										
			                          </tr>
			                      </thead>
			                    
			                     <tbody id="tbodyId">
			                      		<tr id="trId">
			                              <td><input  type="checkbox" class="checkbox"></td>			                              
				                          <td id="sjId"></td>
									      <td id="cname"></td>
									      <td id="sId"></td>
									      <td id="linkId"></td>
									      <td id="phoneId"></td>
		                                  <td class="text-center" id="tdbtn">                                           
		                                  </td>
			                          </tr>
			                      
			                          
			                      </tbody>
			                  </table>
			                  <!--数据列表/-->                        
							  
							 
                        </div>
                        <!-- 数据表格 /-->
                        
                        
                        
                        
                     </div>
                    <!-- /.box-body -->
                    
	          
					    
                                
<!-- 商家详情 -->
<div class="modal fade" id="sellerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">商家详情</h3>
		</div>
		<div class="modal-body">							
			
			 <ul class="nav nav-tabs">
			  <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
			  <li><a href="#linkman" data-toggle="tab">联系人</a></li>
			  <li><a href="#certificate" data-toggle="tab">证件</a></li>
			  <li><a href="#ceo" data-toggle="tab">法定代表人</a></li>
			  <li><a href="#bank" data-toggle="tab">开户行</a></li>
			</ul>							
			
			<!-- 选项卡开始 -->         
		    <div id="myTabContent" class="tab-content">
			    <div class="tab-pane active in" id="home">
			      <br>
			      <table class="table table-bordered table-striped"  width="800px">
			      	<tr>
			      		<td>公司名称</td>
			      		<td id="companyName">美琪数码经营店</td>
			      	</tr>
			      	<tr>
			      		<td>公司手机</td>
			      		<td id="companyPhone">13900221212</td>
			      	</tr>
			      	<tr>
			      		<td>公司电话</td>
			      		<td id="companyDianhua">010-20112222</td>
			      	</tr>
			      	<tr>
			      		<td>公司详细地址</td>
			      		<td id="companyAddress">北京市西三旗建材城西路888号</td>
			      	</tr>
			      </table>			      
      			</div>	
			    <div class="tab-pane fade" id="linkman">
			    	<br>
					<table class="table table-bordered table-striped" >
			      	<tr>
			      		<td>联系人姓名</td>
			      		<td>王美琪</td>
			      	</tr>
			      	<tr>
			      		<td>联系人QQ</td>
			      		<td id="linkmanQq">78223322</td>
			      	</tr>
			      	<tr>
			      		<td>联系人手机</td>
			      		<td id="linkmanPhone">13500223322</td>
			      	</tr>
			      	<tr>
			      		<td>联系人E-Mail</td>
			      		<td id="linkmanEmail">78223322@qq.com</td>
			      	</tr>
			      </table>
			    </div>
			    <div class="tab-pane fade" id="certificate">
					<br>
					<table class="table table-bordered table-striped" >
				      	<tr>
				      		<td>营业执照号</td>
				      		<td id="salesLicense" >330106000109206</td>
				      	</tr>
				      	<tr>
				      		<td>税务登记证号</td>
				      		<td id="taxAregisterCarnum">0292039393011</td>
				      	</tr>
				      	<tr>
				      		<td>组织机构代码证号</td>
				      		<td id="organCodeCarnum">22320320302421</td>
				      	</tr>				      	
			     	</table>
			    </div>
			    <div class="tab-pane fade" id="ceo">
					<br>
					<table class="table table-bordered table-striped" >
				      	<tr>
				      		<td>法定代表人</td>
				      		<td id="legalTypicalPerson">王小聪</td>
				      	</tr>
				      	<tr>
				      		<td>法定代表人身份证号</td>
				      		<td id="legalTypicalPersonCarnum">211030198503223122</td>
				      	</tr>					   			      	
			     	</table>
			    </div>
			    <div class="tab-pane fade" id="bank">
					<br>
					<table class="table table-bordered table-striped" >
				      	<tr>
				      		<td>开户行名称</td>
				      		<td id="openName">中国建设银行北京市分行</td>
				      	</tr>
				      	<tr>
				      		<td>开户行支行</td>
				      		<td id="openBank">海淀支行</td>
				      	</tr>		
				      	<tr>
				      		<td>银行账号</td>
				      		<td id="bankNum">999000111222</td>
				      	</tr>			   			      	
			     	</table>					
			    </div>
  			    </div> 			
           <!-- 选项卡结束 -->          
			
			
		</div>
		<div class="modal-footer" id="xqId">						
            <button class="btn btn-danger" data-dismiss="modal" onclick="shenghe(this)" aria-hidden="true" id="gbbtn">关闭商家</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true" id="gbId">关闭</button>
		</div>
	  </div>
	</div>
</div>


</body>

</html>
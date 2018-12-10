<%@page import="com.sun.glass.ui.Application"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商品管理</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>

</head>

<body class="hold-transition skin-red sidebar-mini">
	<!-- .box-body -->

	<div class="box-header with-border">
		<h3 class="box-title">商品审核</h3>
	</div>

	<div class="box-body">

		<!-- 数据表格 -->
		<div class="table-box">

			<!--工具栏-->
			<div class="pull-left">
				<div class="form-group form-inline">
					<div class="btn-group">
						<button type="button" class="btn btn-default" id="del" title="删除">
							<i class="fa fa-trash-o"></i>
							删除
						</button>
						<button type="button" class="btn btn-default" onclick="pass('审核通过');" title="审核通过">
							<i class="fa fa-check"></i>
							审核通过
						</button>
						<button type="button" class="btn btn-default" onclick="pass('驳回');" title="驳回">
							<i class="fa fa-ban"></i>
							驳回
						</button>
						<button type="button" class="btn btn-default" title="刷新" onclick="show();">
							<i class="fa fa-refresh"></i>
							刷新
						</button>
					</div>
				</div>
			</div>
			<div class="box-tools pull-right">
				<div class="has-feedback">
					商品名称：
					<input id="search_text">
					<button class="btn btn-default" id="search_btn">查询</button>
				</div>
			</div>
			<!--工具栏/-->

			<!--数据列表-->
			<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
				<thead>
					<tr>
						<th class="" style="padding-right: 0px">
							<input id="selall" type="checkbox" class="icheckbox_square-blue">
						</th>
						<th class="sorting_asc">商品ID</th>
						<th class="sorting">分类</th>
						<th class="sorting">品牌</th>
						<th class="sorting">商品名称</th>
						<th class="sorting">商品价格</th>
						<th class="sorting">状态</th>
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr class="table_row">
						<td>
							<input class="r_checkbox" onclick="checkbox();" type="checkbox">
						</td>
						<td class="td_cid"></td>
						<td class="td_class"></td>

						<td class="td_brand">华为</td>
						<td class="td_cname"></td>
						<td class="td_price"></td>
						<td>
							<span class="td_status"> </span>
						</td>
						<td class="text-center">
							<a href="#" target="blank" class="btn bg-olive btn-xs">详情</a>
						</td>
					</tr>
				</tbody>
			</table>
			<!--数据列表/-->
			<div id="find" style="text-align: center;">
				<font size="5" id="msg"></font>
			</div>

		</div>
		<!-- 数据表格 /-->


	</div>
	<!-- /.box-body -->

</body>
<script type="text/javascript">
	var path = "${pageContext.request.contextPath}/";

	/**页面数据加载开始*/
	//数据
	var tableRow = $(".table_row:first").clone();
	var tbody = $("#dataList tbody");

	/**页面数据加载开始*/
	//数据
	var tableRow = $(".table_row:first").clone();
	var tbody = $("#dataList tbody");

	//显示数据
	function show(gname) {
		$("#find").show();
		var temp = {
			"commodityName" : gname
		};

		tbody.html("");
		var url = path + "findGoods.admin";
		$.post(url, temp, function(data) {
			if (data == null || data.length <= 0) {
				$("#msg").text("已无数据...")
			} else {
				$("#find").hide();
			}

			for (var i = 0; i < data.length; i++) {
				var g = data[i];
				var tr = tableRow.clone();

				tr.find("input[type='checkbox']").val(g.commodityId);
				tr.find(".td_cid").html(g.commodityId);
				tr.find(".td_cname").html(g.commodityName);
				tr.find(".td_price").html(g.nowPrice);
				tr.find(".td_brand").html(g.bname);
				tr.find(".td_class").html(g.className);
				tr.find(".td_status").html(g.status);
				tr.find("a").prop("href", path + "/good/showp2.apx?cid=" + g.commodityId);
				tbody.append(tr);
			}

		}, "json");
	}
	show("");
	/**页面数据加载结束*/

	/*查询开始*/
	$("#search_btn").click(function() {
		show($("#search_text").val());

	});

	/*查询结束*/

	/*删除--开始*/

	$("#del").click(function() {
		if ($(".r_checkbox:checked").size() <= 0) {
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
			"method" : "delGoods",
			"ids" : ids
		};

		$.post(url, temp, function(data) {
			window.location.reload();
			alert(data);
		});
	});
	/*删除--结束*/

	/*审核通过--开始*/

	function pass(status) {
		if ($(".r_checkbox:checked").size() <= 0) {
			return;
		}

		if (!confirm("您确定" + status + "吗?")) {
			return;
		}
		var ids = "";
		$(".r_checkbox:checked").each(function() {
			var id = $(this).val();
			ids += id + ",";
		});

		var temp = {
			ids : ids,
			status : status == "审核通过" ? 1 : 2
		}

		var url = "${pageContext.request.contextPath}/auditing.admin"
		$.post(url,temp,function(data){
			window.location.reload();
			alert(data.msg);
		},"json")

	}
	/*审核通过--结束*/

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
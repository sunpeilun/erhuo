<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>发布-二货-校园二手网</title>
	<script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/lib/layui/css/layui.css"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/public.css?v=0.1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/publish.css">
</head>
<body>
<%@include file="top.jsp"%>
	<div id="main" class="clearfix">
		<h2>发布 二货</h2>
		<div class="publish-main layui-form layui-form-pane">
			<div class="input-line image">
				<input type="file" name="picFile" class="layui-upload-file info-img-upload">
			</div>
			<div class="layui-form-item input-line">
				<label class="layui-form-label">二货名称</label>
				<div class="layui-input-inline" style="width: 390px;">
					<input type="text" name="title" autocomplete="off" placeholder="请输入商品名称" class="layui-input goods-title">
				</div>
				<div class="layui-form-mid layui-word-aux">14个字以内</div>
  			</div>
  			<div class="layui-form-item layui-form-text input-line">
				<label class="layui-form-label good-description">商品详情</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入商品详情" class="layui-textarea goods-des"></textarea>
				</div>
			</div>
			<div class="layui-form-item input-line" id="price">
				<label class="layui-form-label">价格</label>
				<div class="layui-input-inline">
					<input type="text" name="title" autocomplete="off" placeholder="请输入价格" class="layui-input price">
				</div>
				<div class="layui-form-mid layui-word-aux">元</div>
				<label class="layui-form-label">原价</label>
				<div class="layui-input-inline">
					<input type="text" name="title" autocomplete="off" placeholder="请输入原价" class="layui-input original-price">
				</div>
				<div class="layui-form-mid layui-word-aux">元</div>
			</div>
			<div class="layui-form-item input-line">
				<label class="layui-form-label">分类</label>
				<div class="layui-input-inline">
					<select name="categorys" id="categorys">
						<option value="">请选择分类</option>
						<c:forEach items="${classList}" var="c">
							<option data-cid="${c.classificationId}" value="${c.classificationId}">${c.classificationName}</option>
						</c:forEach>
					</select>
				</div>
  			</div>
			<div class="layui-form-item input-line">
				<label class="layui-form-label">交易方式</label>
				<div class="layui-input-block">
      				<input type="radio" class="buyMethod" name="transactionMode" value="1" title="线下交易" checked>
      				<input type="radio" class="buyMethod" name="transactionMode" value="2" title="线上交易" checked>
				</div>
  			</div>
			<div class="layui-form-item input-line" id="address">
				<label class="layui-form-label">交易地址</label>
				<div class="layui-input-block">
					<input type="text" name="title" autocomplete="off" placeholder="请输入交易地址" class="layui-input goods-address">
				</div>
  			</div>
			<div class="layui-form-item input-line" id="phoneNumber">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input type="text" name="title" autocomplete="off" placeholder="请输入手机号" class="layui-input phone-number" value="">
				</div>
				<label class="layui-form-label">QQ号</label>
				<div class="layui-input-inline">
					<input type="text" name="title" autocomplete="off" placeholder="请输入QQ号" class="layui-input qq-number">
				</div>
				<label class="layui-form-label">微信号</label>
				<div class="layui-input-inline">
					<input type="text" name="title" autocomplete="off" placeholder="请输入微信号" class="layui-input wx-number">
				</div>
  			</div>
			<!-- <div class="layui-form-item input-line" id="qqNumber">
				<label class="layui-form-label">QQ号</label>
				<div class="layui-input-inline">
					<input type="text" name="title" autocomplete="off" placeholder="请输入QQ号" class="layui-input">
				</div>
  			</div>
			<div class="layui-form-item input-line" id="wxNumber">
				<label class="layui-form-label">微信号</label>
				<div class="layui-input-inline">
					<input type="text" name="title" autocomplete="off" placeholder="请输入微信号" class="layui-input">
				</div>
  			</div> -->
  			<div class="publish-submit">
  				<button class="layui-btn submit">确认发布</button>
  			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
	<script src="${pageContext.request.contextPath}/js/web/common.js"></script>
	<%@include file="bottom.jsp"%>
	<script src="${pageContext.request.contextPath}/js/web/publish.js"></script>
</body>
</html>
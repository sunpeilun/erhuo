<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>个人资料-二货-大学生二手网</title>
	<script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/lib/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/public.css">
	<script src="${pageContext.request.contextPath}/js/web/common.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/user.css">
</head>
<body>
	<%@include file="../top.jsp"%>
<div id="main" class="clearfix">
		<div class="user-sider fl">
		<div class="user-info">
			<img src="${pageContext.request.contextPath}/image.apx?path=${sessionScope.loginUser.avatar}" class="user-header">
			<a href="userinfo.jsp" class="username">${sessionScope.loginUser.userName}</a>
	<!-- 		<div class="auth">
				<a class="realname-auth" href="/auth.jsp"><i class="icon" title=未实名认证 >&#xe605;</i></a>
				<a class="phone-auth" href="/auth.jsp"><i class="icon" style=color:#f40; title=已绑定手机>&#xe624;</i></a>
				<a class="email-auth" href="/auth.jsp"><i class="icon" title=未绑定邮箱>&#xe623;</i></a>
			</div> -->
		</div>
		<div class="sider-nav">
			<ul>
				<li><a href="index.jsp" class=""><i class="icon">&#xe666;</i>我发布的</a></li>
				<li><a href="want.jsp" class=""><i class="icon">&#xe64f;</i>我想要的</a></li>
				<li><a href="message.jsp" class=""><i class="icon">&#xe622;</i>我的留言</a></li>
				<li><a href="userinfo.jsp" class="active"><i class="icon">&#xe653;</i>个人信息</a></li>
				<!-- <li><a href="/auth.jsp" class=""><i class="icon">&#xe65c;</i>实名认证</a></li> -->
				<li><a href="help.jsp" class=""><i class="icon">&#xe617;</i>意见反馈</a></li>
			</ul>
		</div>
	</div>
		<div class="user-main userinfo fr" data-uid="${sessionScope.loginUser.uid}">
			<div class="layui-form">
				<div class="layui-form-item">
					<label class="layui-form-label picture-para">头像</label>
					<div class="layui-input-block">
						<img src="${pageContext.request.contextPath}/image.apx?path=${sessionScope.loginUser.avatar}" data-path="${sessionScope.loginUser.avatar}" class="user-info-picture">
						<input type="file" name="picFile" lay-type="images" class="change-picture" value="修改头像">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><em>*</em>　昵称</label>
					<div class="layui-input-inline">
						<input type="text" name="userName" autocomplete="off" class="layui-input userName" value="${sessionScope.loginUser.userName}">
					</div>
					<div class="layui-form-mid layui-word-aux">3-16位 汉字、数字、字母（大小写）、下划线组成</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">个性签名</label>
					<div class="layui-input-block">
						<input type="text" name="signature" autocomplete="off" class="layui-input signature" value="${sessionScope.loginUser.signature}" style="width: 79%;">
					</div>
				</div>
				<!-- <div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="real-name" autocomplete="off" class="layui-input real-name" value="">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-inline">
						<input type="text" name="phone" autocomplete="off" class="layui-input layui-input-disabled phone_number" disabled value="18779669792">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-inline">
						<input type="text" name="email" autocomplete="off" class="layui-input email" value="">
					</div>
				</div> -->
				<div class="layui-form-item">
					<label class="layui-form-label"><em>*</em>　性别</label>
					<div class="layui-input-inline sex-wrap">
						<input type="radio" name="sex" value="男" title="男" ${sessionScope.loginUser.sex =="男"?"checked='checked'":""} >
      					<input type="radio" name="sex" value="女" title="女" ${sessionScope.loginUser.sex =="女"?"checked='checked'":""}>

					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">生日</label>
					<div class="layui-input-inline">
						<input class="layui-input birthday" name="birthday" placeholder="" onclick="layui.laydate({elem: this})" value="<fmt:formatDate value="${sessionScope.loginUser.birthday}" pattern="yyyy-MM-dd"/>">
					</div>
					<div class="layui-form-mid layui-word-aux">（该信息其他人不可见）</div>
				</div>
				<div class="layui-form-item area" data-area="${sessionScope.loginUser.residence}">
					<label class="layui-form-label">所在地区</label>
					<div class="layui-input-inline">
						<select id="province" name="province">
							<option value="请选择">请选择省份</option>
				      	</select>
					</div>
					<div class="layui-input-inline">
						<select id="city" name="city">
							<option value="请选择">请选择城市</option>
				      	</select>
					</div>
					<div class="layui-input-inline">
						<select id="county" name="county">
							<option value="请选择">请选择区县</option>
				      	</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"></label>
					<div class="layui-input-inline">
						<a href="javascript:;" class="userinfo-submit layui-btn">保存修改</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../bottom.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/allcity.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/web/userinfo.js"></script>
</body>
</html>
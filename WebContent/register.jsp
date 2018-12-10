<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>注册-二货-校园二手网</title>
	<script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/lib/layui/css/layui.css"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/public.css">
<script src="${pageContext.request.contextPath}/js/web/common.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/login.css">
</head>
<body>
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<div id="header">
		<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
			<img src="${pageContext.request.contextPath}/images/web/new-logo.png" alt="淘二淘-大学生二手网 是一个为全国高校在校大学生提供的一个安全、方便、快捷的二手闲置物品交易平台和校园二手信息发布网站。">
		</a>
	</div>
	<div id="register-main" class="clearfix">
		<div class="layui-tab layui-tab-brief reg-left fl">
			<ul class="layui-tab-title">
				<li class="layui-this">用户注册</li>
				<!-- <li>邮箱注册</li> -->
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show layui-form">
					<div class="layui-form-item">
						<input type="text" name="userName" autocomplete="off" placeholder="请输入用户名称" class="layui-input userName">
					</div>
					<div class="layui-form-item">
						<input type="password" name="password" autocomplete="off" placeholder="请输入密码" class="layui-input password">
					</div>
					<div class="layui-form-item captcha">
						<input type="text" name="captchaCode" autocomplete="off" placeholder="请输入图形验证码" class="layui-input captchaCode">
						<!-- <a href="${pageContext.request.contextPath}/javascript:;" class="layui-btn get-captchaCode">获取验证码</a> -->
						<img class="captchaImage" src="${pageContext.request.contextPath}/user/validateCode.apx" title="点击刷新" />
					</div>
					<label class="layui-form-item check-wrap">
						<input type="checkbox" name="checkbox" class="checkbox">我已阅读并同意 <a href="${pageContext.request.contextPath}/service/protocol.jsp" target="_blank">《二货网用户协议》</a>
					</label>
					<a href="javascript:;" class="layui-btn register-btn">注 册</a>
				</div>
				<!-- <div class="layui-tab-item">内容2</div> -->
			</div>
		</div>
		<div class="reg-right right-box fr">
			<p>已有二货网账号：</p>
			<a href="${pageContext.request.contextPath}/login.jsp">立即登录</a>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/web/register.js"></script>
</body>
</html>
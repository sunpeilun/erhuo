<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>忘记密码-二货-校园二手网</title>
	<script src="js/jquery/2.1.4/jquery.min.js"></script>
<script src="js/lib/layui/lay/dest/layui.all.js"></script>
<link rel="stylesheet" href="js/lib/layui/css/layui.css"></script>

<link rel="stylesheet" href="css/web/public.css">
<script src="js/web/common.js"></script>
	<link rel="stylesheet" href="css/web/login.css">
</head>
<body>
	<div id="header">
		<a href="detail/www_taoertao_default.html" class="logo"></a>
	</div>
	<div id="register-main" class="clearfix">
		<div class="layui-tab layui-tab-brief reg-left fl">
			<!-- <ul class="layui-tab-title">
				<li class="layui-this">手机号注册</li>
				<li>邮箱注册</li>
			</ul> -->
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show layui-form">
					<div class="layui-form-item">
						<input type="text" name="phoneNum" lay-verify="title" autocomplete="off" placeholder="请输入手机号" class="layui-input phoneNum">
					</div>
					<div class="layui-form-item captcha">
						<input type="text" name="captchaCode" autocomplete="off" placeholder="请输入图形验证码" class="layui-input captchaCode">
						<!-- <a href="javascript:;" class="layui-btn get-captchaCode">获取验证码</a> -->
						<img class="captchaImage" src="forget.htm" title="点击刷新" />
					</div>
					<div class="layui-form-item phone">
						<input type="text" name="phoneCode" lay-verify="title" autocomplete="off" placeholder="请输入短信验证码" class="layui-input phoneCode">
						<a href="javascript:;" class="layui-btn get-phoneCode">获取验证码</a>
						<span class="showbox"></span>
					</div>
					<div class="layui-form-item">
						<input type="password" name="password" lay-verify="title" autocomplete="off" placeholder="请输入新密码" class="layui-input password">
					</div>
					<div class="layui-form-item">
						<input type="password" name="password" lay-verify="title" autocomplete="off" placeholder="请确认新密码" class="layui-input repassword">
					</div>
					<a href="javascript:;" class="layui-btn register-btn">修改密码</a>
				</div>
				<!-- <div class="layui-tab-item">内容2</div> -->
			</div>
		</div>
		<div class="reg-right right-box fr">
			<p>已有淘二淘账号：</p>
			<a href="user/login_2.htm">立即登录</a>
		</div>
	</div>
	<script src="js/lib/jquery.md5.js"></script>
	<script src="js/web/forget.js"></script>
</body>
</html>
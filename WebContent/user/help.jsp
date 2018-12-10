<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>意见反馈-二货-大学生二手网</title>
	<script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/lib/layui/css/layui.css"></script>
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
			<a href="userinfo.jsp" class="username">${sessionScope.loginUser.userName }</a>
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
				<li><a href="userinfo.jsp" class=""><i class="icon">&#xe653;</i>个人信息</a></li>
				<!-- <li><a href="/auth.jsp" class=""><i class="icon">&#xe65c;</i>实名认证</a></li> -->
				<li><a href="help.jsp" class="active"><i class="icon">&#xe617;</i>意见反馈</a></li>
			</ul>
		</div>
	</div>
		<div class="user-main fr">
			<div class="feedback">
				<h1>意见反馈</h1>
				<div class="feedback-content">
					<textarea placeholder="欢迎提出任何疑问与建议"></textarea>
					<a href="javascript:;" class="layui-btn feedback-submit">提交</a>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../bottom.jsp"%>
	<script>
		$(function(){
			layui.use(['layer'], function () {
				var layer = layui.layer
				$('.feedback-submit').click(function(){
					if($(".feedback-content textarea").val() == '' || $(".feedback-content textarea").val() == undefined){
						$(".feedback-content textarea").focus()
						return layer.msg('请输入反馈内容！')
					}

					var url = '${pageContext.request.contextPath}/regis/sugg.apx'
					var Data = {
						content: $(".feedback-content textarea").val()
					}
					Common.ajax(url, Data, function (data) {
						if(data.success){
							layer.msg(data.msg)
							setTimeout(function(){
								location.reload()
							}, 1000)
						}else{
							layer.msg(data.msg)
						}
					}, function (err) {
						console.log(err)
					}, function (){}, true, 'POST')
				})
			})
		})
	</script>
</body>
</html>
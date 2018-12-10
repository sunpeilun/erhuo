<%@ page import="java.io.File"%>
<%@ page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>登录-二货-校园二手网</title>
<script
	src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/lib/layui/css/layui.css">
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/web/public.css">
<script src="${pageContext.request.contextPath}/js/web/common.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/web/login.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/verify.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/verify.js"></script>

</head>
<body>
	<%
		String referer = request.getHeader("Referer");
		request.setAttribute("referer", referer);
	%>
	<script type="text/javascript">
		var refererPath = "${referer}";
		if (refererPath.indexOf("/register.jsp", 0) > -1) {
			refererPath = "${pageContext.request.contextPath}/index.jsp";
		}
	</script>
	<div id="header">
		<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
			<img src="${pageContext.request.contextPath}/images/web/new-logo.png"
			alt="淘二淘-大学生二手网 是一个为全国高校在校大学生提供的一个安全、方便、快捷的二手闲置物品交易平台和校园二手信息发布网站。">
		</a>
	</div>
	<div id="login-main">
		<div class="layui-tab layui-tab-brief reg-left fl">
			<!-- <ul class="layui-tab-title">
				<li class="layui-this">手机号注册</li>
				<li>邮箱注册</li>
			</ul> -->
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show layui-form">
					<div class="layui-form-item">
						<img
							src="${pageContext.request.contextPath}/images/web/user/default.png"
							class="user-header">
					</div>
					<div class="layui-form-item">
						<input type="text" name="userName" autocomplete="off"
							placeholder="请输入用户名" class="layui-input userName">
					</div>
					<div class="layui-form-item">
						<input type="password" name="password" autocomplete="off"
							placeholder="请输入密码" class="layui-input password">
					</div>
					<div id="mpanel4"></div>
					<script type="text/javascript">
						var flag = false;
						$('#mpanel4')
								.slideVerify(
										{
											type : 2, //类型
											vOffset : 5, //误差量，根据需求自行调整
											vSpace : 5, //间隔
											imgName :
					<%=Arrays.toString(new File(request.getSession().getServletContext().getRealPath("related")).list())
					.replaceAll(",", "','").replace("[", "['").replace("]", "']").replaceAll(" ", "")%>
						,
											imgSize : {
												width : '280px',
												height : '130px',
											},
											blockSize : {
												width : '40px',
												height : '40px',
											},
											barSize : {
												width : '280px',
												height : '40px',
											},
											ready : function() {
											},
											success : function() {
												flag = true;
											},
											error : function() {
												flag = false;
											}
										});
					</script>
					<div class="layui-form-item forgetpwd">
						<a href="${pageContext.request.contextPath}/forget.jsp">忘记密码？</a>
					</div>
					<a href="javascript:;" class="layui-btn login-btn">登 录</a>
					<!-- 测试跳转,功能用上面那个 -->
					<!-- <a href="user/index.jsp" class="layui-btn login-btn">登 录</a> -->
				</div>
				<!-- <div class="layui-tab-item">内容2</div> -->
			</div>
		</div>
		<div class="log-right right-box fr">
			<p>没有二货网账号：</p>
			<a href="${pageContext.request.contextPath}/register.jsp">立即注册</a>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/lib/jquery.md5.js"></script>
	<script src="${pageContext.request.contextPath}/js/web/login.js"></script>
</body>
</html>
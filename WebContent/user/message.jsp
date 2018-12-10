<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>我的消息-二货-大学生二手网</title>
	<script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/lib/layui/css/layui.css"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/public.css">
	<script src="${pageContext.request.contextPath}/js/web/common.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/user.css">
	    	<style type="text/css">
			.table_message {
				padding: 5px 0px;
				float:left;
				font-size: 15px;
				color: #888;
			}
			.lou {
				padding: 5px 10px 30px 10px;
				border: 1px solid #11cd6e;
				border-radius: 5px;
			}
			
			.table_img {
				height: 40px;
				width: 40px;
				border-radius: 80px;
			}
		</style>
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
				<li><a href="${pageContext.request.contextPath}/user/index.jsp" class=""><i class="icon">&#xe666;</i>我发布的</a></li>
				<li><a href="${pageContext.request.contextPath}/user/want.jsp" class=""><i class="icon">&#xe64f;</i>我想要的</a></li>
				<li><a href="${pageContext.request.contextPath}/user/message.jsp" class="active"><i class="icon">&#xe622;</i>我的留言</a></li>
				<li><a href="${pageContext.request.contextPath}/user/userinfo.jsp" class=""><i class="icon">&#xe653;</i>个人信息</a></li>
				<!-- <li><a href="/auth.jsp" class=""><i class="icon">&#xe65c;</i>实名认证</a></li> -->
				<li><a href="${pageContext.request.contextPath}/user/help.jsp" class=""><i class="icon">&#xe617;</i>意见反馈</a></li>
			</ul>
		</div>
	</div>
		<div class="user-main message-main fr">
			<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				<ul class="layui-tab-title">
					<li class="layui-this">收到的留言</li>
					<li>发布的留言</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<ul class="comment-list">
						</ul>
						<div id="page1"></div>
					</div>
					<div class="layui-tab-item">
						<ul class="published-comment-list">
							<li class="published-li" style="display: none;">
	                             <div class="lou">
									<a href="#" style="padding-bottom: 15px;">
										<img src="#" class="table_img" />
										<span style="font-size: 20px; color: #000;" class="userName"></span>
									</a>
									<div style="font-size: 20px; margin-left: 50px;">
										<div style="width: 100%; height:auto;word-wrap:break-word; " class="msg_text"></div>
									</div>
									<br/>
									<div class="table_message">
										&nbsp;&nbsp;回复时间:&nbsp;&nbsp;<font class="sendTime"></font>
									</div>
									<div style="float: right;">
										<a href="#" class="li_a">查看详情</a>
									</div>
									
								</div>
							</li>
						</ul>
						<div id="page2"></div>
					</div>
				</div>
			</div> 
		</div>
	</div>
	<%@include file="../bottom.jsp"%>
	<script src="${pageContext.request.contextPath}/js/web/message.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<style>
 .bbbb-btn {
    display: inline-block;
    border: 0px solid #000;s
    border-radius: 5px;
}
</style>
	<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	</script>
<div id="header">
	<!--a id="topbanner" href="${pageContext.request.contextPath}/https://s.click.taobao.com/8gaPEZw" target="_blank">
		<img src="/images/activity/topbanner.png">
	</a-->
	<div class="header-wrap">
		<a href="${pageContext.request.contextPath}/index.jsp" class="logo fl">
			<img src="${pageContext.request.contextPath}/images/web/new-logo.png" alt="淘二淘-大学生二手网 是一个为全国高校在校大学生提供的一个安全、方便、快捷的二手闲置物品交易平台和校园二手信息发布网站。">
			<h1>新淘二淘 大学生二手网</h1>
		</a>
		<ul class="nav fl">
			<li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
		</ul>
		<div class="nav-right fr">
			<c:if test="${empty sessionScope.loginUser}">
				<a href="${pageContext.request.contextPath}/register.jsp" class="log-btn">注册</a>
				<a href="${pageContext.request.contextPath}/login.jsp" class="log-btn">登录</a>
			</c:if>
			<c:if test="${!empty sessionScope.loginUser}">
				<a href="${pageContext.request.contextPath}/user/index.jsp" class="log-btn">
					<img src="${pageContext.request.contextPath}/image.apx?path=${sessionScope.loginUser.avatar}" class="user-header-image">${sessionScope.loginUser.userName}
				</a>
				<a href="${pageContext.request.contextPath}/user/logout.apx" class="log-btn">退出</a>
			</c:if>
		</div>
	</div>
</div>
<div id="header-bottom">
	<div class="header-bottom-wrap clearfix">
		<div class="search-wrap fl">
			<div class="search">
				<form action="${pageContext.request.contextPath}/Classify/search.apx" method="post">
					<input type="text" class="keywords" name="commodityName" value="${commodityName}" placeholder="请输入关键词">
					<input type="submit" class="search-btn search-normal-btn bbbb-btn" value="搜索"> 
					<!-- <a href="javascript:;" class="search-btn search-normal-btn">搜索</a> -->
				</form>
			</div>
		</div>
		<div class="publish fr">
			<a href="${pageContext.request.contextPath}/good/publish.apx" class="publish-btn"><i class="icon">&#xe615;</i>发布二货</a>
		</div>
	</div>
</div>


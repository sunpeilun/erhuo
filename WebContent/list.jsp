<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	
	<script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
	<link rel="${pageContext.request.contextPath}/stylesheet" href="js/lib/layui/css/layui.css"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/public.css">
	<script src="${pageContext.request.contextPath}/js/web/common.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/category_list.css">
</head>
<body>
<%@include file="/top.jsp"%>
	<div id="main" class="clearfix">
		<div class="cate-name-list">
			<!-- <span>分类：</span> -->
			<span><a class="${empty classId ? 'active' : '' }" href="${pageContext.request.contextPath}/good/showAll.apx">全部分类</a></span>
			
			<c:forEach items="${classList}" var="cla">
				<span>
					<a class="${cla.classificationId eq classId ? 'active' : '' }" href="${pageContext.request.contextPath}/good/showp.apx?id=${cla.classificationId}">${cla.classificationName}</a>
				</span>
			</c:forEach>
		
		</div>
		<div class="list-body">
			<ul class="clearfix">
				<!-- <li>
					<a href="/detail" class="good-image"><img src="http://img03.taobaocdn.com/bao/uploaded/i3/TB1TN9JOpXXXXasXpXXXXXXXXXX_!!0-item_pic.jpg" alt=""></a>
					<a href="" class="good-title">标题标题标题标题标题标题标题标题标题标题</a>
					<span class="good-price">￥200.0</span>
				</li> -->
			
			<c:forEach items="${list}" var="pro">
				<li>
					<a href="${pageContext.request.contextPath}/good/showp2.apx?cid=${pro.commodityId}" class="good-image" target="_blank">
						<img src="${pageContext.request.contextPath}/goodImage.apx?path=${pro.commodityImgList[0].imgUrl}" alt="${pro.commodityName}">
					</a>
					<a href="${pageContext.request.contextPath}/good/showp2.apx?cid=${pro.commodityId}" class="good-title" target="_blank">${pro.commodityDetails}</a>
					<span class="good-price">${pro.nowPrice}</span>	
				</li>
			</c:forEach>
				
			</ul>
			<div id="page"></div>
		</div>
	</div>
	<%@include file="/bottom.jsp"%>
</body>
</html>
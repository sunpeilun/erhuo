<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	
	<script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/lib/layui/css/layui.css"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/public.css">
<script src="${pageContext.request.contextPath}/js/web/common.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/category_list.css">
</head>
<body>
<%@include file="/top.jsp"%>
	<div id="main" class="clearfix">
		<div class="cate-name-list">
			<!-- <span>分类：</span> -->
			<a class="${empty classId ? 'active' : '' }" href="${pageContext.request.contextPath}/Classify/searchClassify.apx?commodityName=${commodityName}">全部分类</a>
		
			<c:forEach items="${classifyList}" var="classify">
				<a class="${classify.classificationId eq classId ? 'active' : '' }" href="${pageContext.request.contextPath}/Classify/searchClassify.apx?id=${classify.classificationId}&commodityName=${commodityName}">${classify.classificationName}</a>
			</c:forEach>
		
		</div>
		<c:if test="${not empty commodityList}">
		<div class="list-body">
			<ul class="clearfix">


				 <c:forEach items="${commodityList}" var="commodity">
			 		<li style="height: 259.5px;">
						<a href="${pageContext.request.contextPath}/good/showp2.apx?cid=${commodity.commodityId}" class="good-image" target="_blank">
							<img src="${pageContext.request.contextPath}/goodImage.apx?path=${commodity.commodityImgList[0].imgUrl}" alt="${commodity.commodityDetails}">
						</a>
						<a href="${pageContext.request.contextPath}/good/showp2.apx?cid=${commodity.commodityId}" class="good-title" target="_blank">${commodity.commodityName}</a>
						<span class="good-price">￥${commodity.nowPrice}</span>
					</li>
         		</c:forEach>
				
			
				<!-- <li>
					<a href="details.jsp" class="good-image" target="_blank"><img src="upload/goods/20185/1527058532324543390.png" alt="有两台手机，三星s8，oppor11"></a>
					<a href="details.jsp" class="good-title" target="_blank">有两台手机，三星s8，oppor11</a>
					<span class="good-price">￥550</span>
				</li> -->
				
			</ul>
			<div id="page"></div>
		</div>
		</c:if>
		<c:if test="${empty commodityList}">
           		<div id="main" class="clearfix notfound">
           			
           			<p><font><b>暂 无 搜 索 结 果</b></font></p>
				    <!-- <p><font size="7" ></font>暂无搜索结果</p> -->
			    </div>
		</c:if>
	</div>
	<%@include file="/bottom.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>二货-校园二手网</title>
    <meta name="keywords" content="大学生二手网,淘二手,大学生二手交易网,淘二手网,大学生二手交易平台,大学生二手市场,校园二手街,淘二淘,大学城二手网,二手交易网">
    <meta name="description" content="淘二淘-大学生二手网是一个为全国高校在校大学生提供的一个安全、方便、快捷的二手闲置物品交易平台和校园二手信息发布网站。">
    <script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/lib/layui/css/layui.css"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/public.css">
	<script src="${pageContext.request.contextPath}/js/web/common.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/index.css">
	<style type="text/css">
		.layui-box a{
			width: 40px;
			height: 30px;
		}
	</style>
</head>

<body>
<% 
if(request.getAttribute("classifyList") == null){
	response.sendRedirect(request.getContextPath() + "/Classify/showThreeList.apx");
}
%>
<%@include file="/top.jsp"%>
    <div id="main" class="clearfix">
        <div class="category fl">
            <ul id="classifyListId">
            	 <c:forEach items="${classifyList}" var="classify">
            		<li>
                    	<a href="${pageContext.request.contextPath}/good/showp.apx?id=${classify.classificationId}">${classify.classificationName}<i class="icon">&#xe600;</i></a>
                	</li>
            	</c:forEach>
                <!--li><a class="shuang11" target="_blank" href="https://s.click.taobao.com/8gaPEZw"><img src="/images/activity/index_nav_img.jpg" /></a></li-->
            </ul>
        </div>
        <div class="main-box fl">
            <div class="banner">
                <div class="focusMap fl">
                    <span class="prev"><i class="icon">&#xe601;</i></span>
                    <span class="next"><i class="icon">&#xe600;</i></span>
                    <ul class="rImg">
                        
                        <li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/upload/focus/upload_2e73fa873e076d76e14f27e7311e0dee.jpg" alt="200红包"></a></li>
                        
                        <%-- <li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/upload/focus/upload_61d168788c11d5df8676fbf84e638640.png" alt="爱布衣回收"></a></li> --%>
                        
                        <li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/upload/focus/upload_7c1f54831e00901522745a16174b5f99.jpg" alt="500元红包"></a></li>
                        
                        <li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/upload/focus/upload_9c5c3113afac358a56b903dc776a4026.jpg" alt="beatsep"></a></li>
                        
                        <li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/upload/focus/upload_a1d47804bc5d5cd73e8c7930357ac766.jpg" alt="创业技术服务"></a></li>
                        
                        
                        
                    </ul>
                    
					<ul class="button">
                    
                        <li class="on"></li>
                    
                        <li></li>
                        <li></li>
                        <li></li>
                    
					</ul>
					
                </div>
            </div>
            <div class="index-list">
                <div class="list-header">
                    <a href="${pageContext.request.contextPath}/Classify/showThreeList.apx" id="recommend" class="${tab ? 'active':''}">推荐</a>
                    <a href="${pageContext.request.contextPath}/Classify/newestList.apx" id="new" class="${tab ? '':'active'}">最新</a>
                    <a href="${pageContext.request.contextPath}/good/publish.apx" class="fr"><i class="icon">&#xe62d;</i>发布二货</a>
                </div>
                <div class="list-body">
                    <ul class="clearfix">
                        
                        <c:forEach items="${commodityList}" var="commodity">
                        	<li>
	                            <a href="${pageContext.request.contextPath}/good/showp2.apx?cid=${commodity.commodityId}" target="_blank" class="good-image">
	                                <img class="image-show-box" src="${pageContext.request.contextPath}/goodImage.apx?path=${commodity.commodityImgList[0].imgUrl}">
	                            </a>
	                            <a href="${pageContext.request.contextPath}/good/showp2.apx?cid=${commodity.commodityId}" target="_blank" class="good-title">
	                                ${commodity.commodityName}
	                            </a>
	                            <span class="good-price">￥${commodity.nowPrice}</span><br/>
	                            <span class="pub-time fr">发布于<fmt:formatDate value="${commodity.releaseDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
	                        </li>
            			</c:forEach>
                        
                        <!-- <li>
                            <a href="/detail" class="good-image"><img src="http://img03.taobaocdn.com/bao/uploaded/i3/TB1TN9JOpXXXXasXpXXXXXXXXXX_!!0-item_pic.jpg" alt=""></a>
                            <a href="" class="good-title">标题标题标题标题标题标题标题标题标题标题</a>
                            <span class="good-price">￥200.0</span>
                        </li>-->
                    </ul>
                </div>
                <div id="page"></div>
            </div>
        </div>
        <div class="sidebar fr">
            <div class="sidebar-main-right">
                <ul class="jizhuan-list">
	                <c:forEach items="${MaxNumList}" var="commodity">
						<li>
	                        <a href="${pageContext.request.contextPath}/good/showp2.apx?cid=${commodity.commodityId}" class="jizhuan" target="_blank">
	                            <img class="jizhuan-image" src="${pageContext.request.contextPath}/goodImage.apx?path=${commodity.commodityImgList[0].imgUrl}" alt="${commodity.commodityDetails}">
	                            <p class="jizhuan-title"> ${commodity.commodityName}</p>
	                            <p>
									<span class="yhq">￥${commodity.nowPrice}</span>
									<span class="jizhuan-price">￥${commodity.costPrice}</span>
								</p>
	                        </a>
	                    </li>
					</c:forEach>
                </ul>
            </div>
        </div>
        <div id="page">
        	<div style="width: 100%; margin-top: 10px;">
				<div class="layui-box layui-laypage layui-laypage-default">
					<c:if test="${pageNum != 1}">
						<a href="${pageContext.request.contextPath}/Classify/${tab ? 'showThreeList.apx':'newestList.apx'}?pageNum=1" class="layui-laypage-last" title="首页">首页</a>
						<a href="${pageContext.request.contextPath}/Classify/${tab ? 'showThreeList.apx':'newestList.apx'}?pageNum=${pageNum-1}" class="layui-laypage-prev"><em>&lt;</em></a>
					</c:if>
						<c:forEach begin="1" end="${findListSizeMax}" step="1" varStatus="staus">
							<a href="${pageContext.request.contextPath}/Classify/${tab ? 'showThreeList.apx':'newestList.apx'}?pageNum=${staus.count}">${staus.count}</a>
						</c:forEach>
					<c:if test="${pageNum != findListSizeMax}">
						<a href="${pageContext.request.contextPath}/Classify/${tab ? 'showThreeList.apx':'newestList.apx'}?pageNum=${pageNum+1}" class="layui-laypage-next"><em>&gt;</em></a>
						<a href="${pageContext.request.contextPath}/Classify/${tab ? 'showThreeList.apx':'newestList.apx'}?pageNum=${findListSizeMax}" class="layui-laypage-last" title="尾页">末页</a>
					</c:if>
				</div>
        	</div>
		</div>
    </div>
<%@include file="/bottom.jsp"%>
    <script> var goodsCount = 10 </script>
     <script src="${pageContext.request.contextPath}/js/web/index.js"></script> 
</body>

</html>
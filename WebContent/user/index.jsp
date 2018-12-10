<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>个人中心-二货-大学生二手网</title>
	<script src="../js/jquery/2.1.4/jquery.min.js"></script>
	<script src="../js/lib/layui/lay/dest/layui.all.js"></script>
	<link rel="stylesheet" href="../js/lib/layui/css/layui.css"></script>
	<link rel="stylesheet" href="../css/web/public.css">
	<script src="../js/web/common.js"></script>
	<link rel="stylesheet" href="../css/web/user.css">
	<script type="text/javascript">
		$(function(){
			var myPublishs = $(".myPublishs");
			var PublishCommodity = $(".PublishCommodity").clone();
			PublishCommodity.removeAttr("style");
			var url = "${pageContext.request.contextPath}/user/myPublish.apx";
			var param = {};
			$.ajax({
				"url":url, 
				"data":JSON.stringify(param),
				"type":"post",
				"contentType":"appliction/json;charset=UTF-8",
				"success":function( data ){
			    	if(data.length != 0){
						myPublishs.html("");
						$(data).each(function(i){	
						var p = data[i];
						var li = PublishCommodity.clone();
						li.find(".myPublishreleaseDate").text("发布时间: " + p.releaseDate);
						if(p.commodityStatic == 0){
							li.find(".list-header").append("<a href='javascript:void(0)' class='static' style='font-size:13px;color:red;'>审核中</a>");
							li.find(".goods-images").prop("href",  "javascript:;");
							li.find(".goods-title").prop("href",  "javascript:;");
							li.find(".delete").css("display", "none");
						}else if(p.commodityStatic == 1){
							li.find(".delete").prop("href", "${pageContext.request.contextPath}/user/deleteMyPublish.apx?commodityId=" + p.commodityId);
							li.find(".goods-images").prop("href", "${pageContext.request.contextPath}/good/showp2.apx?cid=" + p.commodityId);
							li.find(".goods-title").prop("href",  "${pageContext.request.contextPath}/good/showp2.apx?cid=" + p.commodityId);
						}else if(p.commodityStatic == 2){
							li.find(".list-header").append("<a href='javascript:void(0)' class='static' style='font-size:13px;color:red;'>审核未通过</a>");
							li.find(".goods-images").prop("href",  "javascript:;");
							li.find(".goods-title").prop("href",  "javascript:;");
							li.find(".delete").css("display", "none");
						}else if(p.commodityStatic == 3){
							li.find(".list-header").append("<a href='javascript:void(0)' class='static' style='font-size:13px;color:red;'>已下架</a>");
							li.find(".goods-images").prop("href",  "javascript:;");
							li.find(".goods-title").prop("href",  "javascript:;");
							li.find(".delete").css("display", "none");
						}
						li.find(".myPublishImg").prop("src","${pageContext.request.contextPath}/goodImage.apx?path=" + p.commodityImgUrl);
						li.find(".myPublishPrice").text(p.nowPrice);
						li.find(".goods-title").text(p.commodityName);
						
						li.find(".delete").bind('click', function(){
					    	return confirm("您确定要下架吗？");
							Delete(p.commodityId);
							return false;
						});
						myPublishs.append(li);
						});
					}
				},
				"error":function(){
				},
				"dataType":"json"
			});
		});
		function Delete(commodityId){
			var url = "${pageContext.request.contextPath}/user/deleteMyPublish.apx";
			var param = {
				"commodityId":commodityId		
			};
			$.ajax({
				"url":url, 
				"data":param,
				"type":"post",
				"contentType":"appliction/json;charset=UTF-8",
				"success":function( data ){
					if(data.success == "true"){
					layer.msg(data.msg);
					li.find(".delete").css("display", "none");
					/* setTimeout(function(){
						window.location.reload();
			        }, 800) */
					}
				},
				"error":function(){
					layer.msg("下架失败")
				},
				"dataType":"json"
		 });
	   }
	</script>
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
				<li><a href="index.jsp" class="active"><i class="icon">&#xe666;</i>我发布的</a></li>
				<li><a href="want.jsp" class=""><i class="icon">&#xe64f;</i>我想要的</a></li>
				<li><a href="message.jsp" class=""><i class="icon">&#xe622;</i>我的留言</a></li>
				<li><a href="userinfo.jsp" class=""><i class="icon">&#xe653;</i>个人信息</a></li>
				<!-- <li><a href="/auth.jsp" class=""><i class="icon">&#xe65c;</i>实名认证</a></li> -->
				<li><a href="help.jsp" class=""><i class="icon">&#xe617;</i>意见反馈</a></li>
			</ul>
		</div>
	</div>
		<div class="user-main fr">
			<ul class="myPublishs">
			<li class="PublishCommodity" style="display:none;">
				<div class="list-header">
						<span class="myPublishreleaseDate"></span>
						&nbsp;
					</div>
						
					<div class="list-main clearfix">
						<a href="" class="goods-images fl"><img class="myPublishImg" src="" ></a>
						<div class="good-info fl">
							<a href="" class="goods-title"></a>
							<p class="goods-price">￥<span class="myPublishPrice"></span></p>
						</div>
						<div class="operation fr">
							<a href="#" class="delete">下架</a>
						</div>
					</div>
				</li>
			<div class="no-data">
				<p>您没有发布任何二货哦~</p>
			</div>
			</ul>
			<div id="page"></div>
		</div>
	</div>
	<%@include file="../bottom.jsp"%>
	<script> var count = 0</script>
	<script src="../js/web/user_index.js"></script>
</body>
</html>
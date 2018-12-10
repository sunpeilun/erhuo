<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>我想要的-二货-大学生二手网</title>
	<script src="../js/jquery/2.1.4/jquery.min.js"></script>
	<script src="../js/lib/layui/lay/dest/layui.all.js"></script>
	<link rel="stylesheet" href="../js/lib/layui/css/layui.css"></script>
	<link rel="stylesheet" href="../css/web/public.css">
	<script src="../js/web/common.js"></script>
	<link rel="stylesheet" href="../css/web/user.css">
	<script type="text/javascript">
		$(function(){
			var myWant = $(".myWants");
			var wantCommodity = $(".wantCommodity").clone();
			wantCommodity.removeAttr("style");
			var url = "${pageContext.request.contextPath}/user/myWant.apx";
			var params = {};
			$.ajax({
				"url":url, 
				"data":JSON.stringify(params),
				"type":"post",
				"contentType":"appliction/json;charset=UTF-8",
				"success":function( data ){
			    	if(data.length != 0){
			    		myWant.html("");
						$(data).each(function(i){	
						var p = data[i];
						var li = wantCommodity.clone();
						li.find(".myWantreleaseDate").text("收藏时间: " + p.collectDate);
						li.find(".myWantImg").prop("src","${pageContext.request.contextPath}/goodImage.apx?path=" + p.commodityImgUrl);
						li.find(".goods-images").prop("href", "${pageContext.request.contextPath}/good/showp2.apx?cid=" + p.commodityId);
						li.find(".myWantPrice").text(p.nowPrice);
						li.find(".goods-title").text(p.commodityName);
						li.find(".goods-title").prop("href",  "${pageContext.request.contextPath}/good/showp2.apx?cid=" + p.commodityId);
						li.find(".details").prop("href", "${pageContext.request.contextPath}/good/showp2.apx?cid=" + p.commodityId);
						li.find(".delete").prop("href", "${pageContext.request.contextPath}/user/deleteMyWant.apx?commodityId=" + p.commodityId);
						myWant.append(li);
						});
					}
				},
				"error":function(){
				},
				"dataType":"json"
			});
		});
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
			<a class="realname-auth" href="/user/auth"><i class="icon" title=未实名认证 >&#xe605;</i></a>
			<a class="phone-auth" href="/user/auth"><i class="icon" style=color:#f40; title=已绑定手机>&#xe624;</i></a>
			<a class="email-auth" href="/user/auth"><i class="icon" title=未绑定邮箱>&#xe623;</i></a>
		</div> -->
	</div>
	<div class="sider-nav">
		<ul>
			<li><a href="index.jsp" class=""><i class="icon">&#xe666;</i>我发布的</a></li>
			<li><a href="want.jsp" class="active"><i class="icon">&#xe64f;</i>我想要的</a></li>
			<li><a href="message.jsp" class=""><i class="icon">&#xe622;</i>我的留言</a></li>
			<li><a href="userinfo.jsp" class=""><i class="icon">&#xe653;</i>个人信息</a></li>
			<!-- <li><a href="/auth.jsp" class=""><i class="icon">&#xe65c;</i>实名认证</a></li> -->
			<li><a href="help.jsp" class=""><i class="icon">&#xe617;</i>意见反馈</a></li>
		</ul>
	</div>
</div>
		<div class="user-main fr">
			<ul class="myWants" >
				<li class="wantCommodity" style="display:none;">
					<div class="list-header">
						<span class="myWantreleaseDate"></span>
					</div>
					<div class="list-main clearfix">
						<a href="" class="goods-images fl"><img class="myWantImg" src="" ></a>
						<div class="good-info fl">
							<a href="" class="goods-title"></a>
							<p class="goods-price">￥<span class="myWantPrice"></span></p>
						</div>
						<div class="operation fr">
							<a href="" class="details">查看详情</a>
							<a href="" class="delete">移除想要</a>
						</div>
					</div>
				</li>
				<div class="no-data">
					<p>您没有收藏任何二货哦~</p>
				</div>
				
			</ul>
			<div id="page"></div>
		</div>
	</div>
	<%@include file="../bottom.jsp"%>
	<script src="../js/web/detail.js"></script>
<!-- 	<script>
		$(function(){
		    layui.use(['layer', 'laypage'], function(){
		        var layer = layui.layer

		        layui.laypage({
		            cont: 'page', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
		            pages: 0, //通过后台拿到的总页数
		            curr: Common.getQuery('page') || 1, //当前页
		            jump: function(obj, first){ //触发分页后的回调
		                if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
		                    window.location.href = '/user/want?page=' + obj.curr
		                }
		            }
		        })

		        $('.delete-want').click(function(){
		        	var url = '/user/collect_delete'
					var Data = { gid: $(this).attr('data-gid')}
					Common.ajax(url, Data, function (data) {
						layer.msg(data.msg)
					    if(data.success){
					        setTimeout(function(){ location.reload() }, 2000)
					    }
					}, function (err) {
					    console.log(err)
					}, function () {}, true, 'POST')
		        })
		    })
		})
	</script> -->
</body>
</html>
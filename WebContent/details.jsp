<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">

<head>
<meta charset="UTF-8">
<title>${commodity.commodityName}-二货-校园二手网</title>
<meta name="description" content="刚买一个半月，由于特殊原因出掉，有意者私聊我，保证正品，如假包换。">
<script src="${pageContext.request.contextPath}/js/jquery/2.1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/layui/lay/dest/layui.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/lib/layui/css/layui.css">
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/public.css">
<script src="${pageContext.request.contextPath}/js/web/common.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web/detail.css">
<style type="text/css">
.table_message {
	padding: 5px 0px;
	float: left;
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

.huifu {
	margin: 10px 0px;
	display: none;
}
</style>
</head>

<body>
	<%@include file="top.jsp"%>
	<div id="main" class="clearfix">
		<div class="detail fl clearfix">

			<div class="title">
				<!-- <h2>商品标题商品标题</h2> -->

				<span class="publish-time fl">
					发布于：
					<fmt:formatDate value="${commodity.releaseDate}" pattern="yyyy-MM-dd HH:mm:ss" />
				</span>
				<span class="view-number fl">${commodity.clickNumber}次浏览</span>
				<a href="javascript:;" class="report fr">举报</a>
			</div>
			<div id="MagnifierWrap2" class="fl">
				<div class="MagnifierMain">
					<img class="MagTargetImg" src="${pageContext.request.contextPath}/goodImage.apx?path=${img[0].imgUrl}">

				</div>
				<span class="spe_leftBtn">&lt;</span>
				<span class="spe_rightBtn">&gt;</span>
				<div class="spec-items">
					<ul>
						<c:forEach items="${img}" var="tp">
							<li>
								<img src="${pageContext.request.contextPath}/goodImage.apx?path=${tp.imgUrl}">
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<div class="good-info fr">
				<h2>${commodity.commodityName}</h2>
				<div class="info-line">
					<span class="param-name">价格</span>
					<span class="param-value good-price">￥${commodity.nowPrice}</span>
				</div>
				<div class="info-line">
					<span class="param-name">原价</span>
					<span class="param-value good-old-price">￥${commodity.costPrice}</span>

				</div>

				<div class="info-line">
					<span class="param-name">交易地址</span>
					<span class="param-value">${commodity.tradeAddress}</span>
				</div>

				<div class="info-line">
					<span class="param-name">卖家</span>
					<span class="param-value">${user.userName}
					</span>
				</div>
				<div class="info-line">
					<span class="param-name">交易方式</span>
					<span class="param-value">${commodity.tradeWay == "1"?"线下交易":"线上交易"}</span>
				</div>
				<div class="info-line btns">
					<a href="javascript:;" class="info-btn contect-seller">联系卖家</a>
					<a href="javascript:;" data-user="${sessionScope.loginUser.uid}" data-id="${commodity.commodityId}" class="info-btn want">
						<i class="icon ${empty collect ? '':'wanted'}">&#xe616;</i>
						想要
					</a>
				</div>
			</div>
			<div class="good-description">
				<div class="description-title">
					<span>二货描述</span>
				</div>
				<div class="description-body">
					<p>${commodity.commodityDetails}</p>
				</div>
			</div>


			<div class="good-description">
				<div class="description-title">
					<span>二货留言</span>
				</div>
				<div class="description-body">
					<div class="comment-list">
						<ul>
							<c:forEach items="${messageList}" var="msg">
								<li id="${msg.mid}">
									<div class="lou" >
										<a href="#" style="padding-bottom: 15px;">
											<img src="${pageContext.request.contextPath}/image.apx?path=${msg.sendUser.avatar}" class="table_img" />
											<span style="font-size: 20px;">${msg.sendUser.userName}</span>
										</a>
										<div style="margin-left: 50px;">
											<div style="width: 100%; font-size: 16px; height: auto; word-wrap: break-word;">${msg.text}</div>
										</div>

										<div class="table_message">
											&nbsp;&nbsp;回复时间:
											<fmt:formatDate value="${msg.sendTime}" pattern="yyyy-MM-dd HH:mm" />
										</div>
										<c:if test="${not empty msg.reviews}">
										<div class="lou" style="margin: 50px 25px 0px 50px">
											<ul>
												<c:forEach items="${msg.reviews}" var="msg1">
													<li onClick="a('${msg1.sendUid}','${msg1.sendUser.userName}')">
														<a href="#" style="color: #37C1F1; font-size: 13px; padding-bottom: 20px;"> ${msg1.sendUser.userName} </a>
														&nbsp;&nbsp;回复&nbsp;&nbsp;
														<a href="#" style="color: #FF8000; font-size: 13px; padding-bottom: 15px;"> ${msg1.receiveUser.userName} </a>
														&nbsp;  : ${msg1.text}
													</li>
												</c:forEach>

											</ul>
										</div>
										</c:if>
										<c:if test="${not empty sessionScope.loginUser}">
											<div class="huifu" style="height: auto;">
												<span style="width: 100%; padding-bottom: 60px;">
													<span>
														<input class="huifu_input layui-input" onClick="b()" type="text" style="width: 90%; float: left;" name="text" />
													</span>
													<span>
														<input type="button" class="layui-btn" style="float: right;" value="发送" onClick="send(this,'${msg.mid}')" />
													</span>
												</span>
												<br>
											</div>
										</c:if>
										<br />

									</div>
								</li>
							</c:forEach>
						</ul>
					</div>

					<c:if test="${empty sessionScope.loginUser}">
						<!--没有登录-->
						<div class="user-not-login">
							<p>
								<a class="lgbtn" href="${pageContext.request.contextPath}/login.jsp">登录</a>
								<a class="lgbtn" href="${pageContext.request.contextPath}/register.jsp" target="_blank">注册</a>
							</p>
						</div>
					</c:if>
					<c:if test="${!empty sessionScope.loginUser}">
						<!-- 已经登陆 -->
						<textarea name="" required="" lay-verify="required" placeholder="请输入留言内容" class="layui-textarea comments"></textarea>
						<div class="comment-btns">
							<button class="layui-btn comment-submit">提交</button>
							<span class="comments-words">0/100</span>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="detail-sidebar fr">
			<div class="sidebar-header">推荐二货</div>
			<ul class="sidebar-list">
				<!--  MaxNumList -->
				<c:forEach items="${MaxNumList}" var="commodity">
					<li>
						<a href="${pageContext.request.contextPath}/good/showp2.apx?cid=${commodity.commodityId}" class="sidebar clearfix">
							<img class="sidebar-image fl" src="${pageContext.request.contextPath}/goodImage.apx?path=${commodity.commodityImgList[0].imgUrl}" alt="${commodity.commodityDetails}">
							<p class="sidebar-title">${commodity.commodityName}</p>
							<p class="sidebar-price">￥${commodity.nowPrice}</p>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="user-contect" style="display: none;">
		<div class="contect-header">联系方式</div>
			<c:if test="${empty sessionScope.loginUser}">
				<p>
					<a href="${pageContext.request.contextPath}/login.jsp">请先登录</a>
				</p>
			</c:if>
			<c:if test="${not empty sessionScope.loginUser}">
				<p>
					<c:if test="${not empty commodity.phoneNumber}">
						手机号码: ${commodity.phoneNumber}
					</c:if>
					<c:if test="${empty commodity.phoneNumber}">
						手机号码: 暂无
					</c:if>
				</p>
				<p>
					<c:if test="${not empty commodity.qqNumber}">
						QQ号: ${commodity.qqNumber}
					</c:if>
					<c:if test="${empty commodity.qqNumber}">
						QQ号: 暂无
					</c:if>
				</p>
				<p>
					<c:if test="${not empty commodity.wxNumber}">
						微信号: ${commodity.wxNumber}
					</c:if>
					<c:if test="${empty commodity.wxNumber}">
						微信号: 暂无
					</c:if>
				</p>
			</c:if>
	</div>
	<script type="text/javascript">
		var receiveId;
		var cid = '${commodity.commodityId}';
		var uid = '${sessionScope.loginUser.uid}';
		function b(){
			event.stopPropagation();
		}
		function a(rid,name) {

			receiveId = rid;
			$(".huifu").hide();
			$(".huifu_input").prop( "placeholder","回复"+name+" :");
			$(".lou").children().show();
			event.stopPropagation();
		}
		function send(e, fid) {
			console.log($(e).parent().parent())
			var url = "/erhuo/message/addMessage2.apx";
			var par = {
				"text" : $(e).parent().parent().find(".huifu_input").val(),
				"receiveUid" : receiveId,
				"sendUid" : uid,
				"fatherMid" : fid,
				"level" : 2,
				"commodityId" : cid
			};

			$.ajax({
				type : "post",
				url : url,
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(par),
				success : function(d) {
					receiveId=null;
					console.log(d)
					location.reload()
				}
			});

		}

		$(".lou").click(function() {
			$(".huifu_input").prop( "placeholder","回复层主 :");
			$(".huifu").hide();
			$(this).children().show();
		});
	</script>
	<%@include file="bottom.jsp"%>
	<script src="${pageContext.request.contextPath}/js/lib/MagnifierF.js"></script>
	<script src="${pageContext.request.contextPath}/js/web/detail.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<title>二货网运营管理后台</title>
	 <link rel="icon" href="../assets/img/favicon.ico">


    <link rel="stylesheet" type="text/css" href="css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="css/pages-login-manage.css" />
</head>

<body>
	<div class="loginmanage">
		<div class="py-container">
			<h4 class="manage-title">二货网运营管理后台</h4>
			<div class="loginform">

				<ul class="sui-nav nav-tabs tab-wraped">
					<li>
						<a href="#index" data-toggle="tab">
							<h3>扫描登录</h3>
						</a>
					</li>
					<li class="active">
						<a href="#profile" data-toggle="tab">
							<h3>账户登录</h3>
						</a>
					</li>
				</ul>
				<div class="tab-content tab-wraped">
					<div id="index" class="tab-pane">
						<p>二维码登录，暂为官网二维码</p>
						<img src="/erhuo/img/avatar04.png" />
					</div>
					<div id="profile" class="tab-pane  active">
						<form   class="sui-form" action="${pageContext.request.contextPath }/login.admin" method="post">
							<div class="input-prepend"><span class="add-on loginname"></span>
								<input id="prependedInput" name="cname" type="text" placeholder="邮箱/用户名/手机号" class="span2 input-xfat">
							</div>
							<div class="input-prepend"><span class="add-on loginpwd"></span>
								<input id="prependedInput" name="cpassword" type="password" placeholder="请输入密码" class="span2 input-xfat">
							</div>
							<div class="setting">
								 <div id="slider">
									<div id="slider_bg"></div>
									<span id="label">>></span> <span id="labelTip">拖动滑块验证</span>
									</div>
							</div>
							<div>${Msg }</div>
							<div class="logined">
							<%-- 	<a class="sui-btn btn-block btn-xlarge btn-danger" href="${pageContext.request.contextPath }/admin/login.admin" target="_blank">登&nbsp;&nbsp;录</a> --%>
								<input type="submit"   class="sui-btn btn-block btn-xlarge btn-danger"  value="登&nbsp;&nbsp;录" target="_blank">
							</div>
							 
						</form>

					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>


	<!--foot-->
	<div class="py-container copyright">
		<ul>
			<li>关于我们</li>
			<li>联系我们</li>
			<li>联系客服</li>
			<li>商家入驻</li>
			<li>营销中心</li>
			<li>手机品优购</li>
			<li>销售联盟</li>
			<li>品优购社区</li>
		</ul>
		<div class="address">地址：北京市昌平区建材城西路金燕龙办公楼一层 邮编：100096 电话：400-618-4000 传真：010-82935100</div>
		<div class="beian">京ICP备08001421号京公网安备110108007702
		</div>
	</div>


<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery-placeholder/jquery.placeholder.min.js"></script>
<script src="js/pages/jquery.slideunlock.js"></script>
<script>
	$(function(){

		$("input[type='submit']").prop("disabled","disabled")
		var slider = new SliderUnlock("#slider",{
				successLabelTip : "欢迎访问二货网"	
			},function(){
				// alert("验证成功,即将跳转至首页");
				 
				$("input[type='submit']").prop("disabled","")
        	});
        slider.init();
	})
	</script>
</body>

</html>
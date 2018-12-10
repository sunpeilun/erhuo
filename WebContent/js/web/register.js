$(function(){
	$('.userName').blur(function(){
		var name=$('.userName').val();
		if(name != '' && name != undefined){
			var url = 'user/isUsername.apx'
			var params={"username":name};
			$.post(url,params,function(data){
				if(data=="false"){
				$('.userName').focus()
				return layer.tips('用户名已存在', '.userName')	
				}	
			})
  		}
	})
	

	$(".captchaImage").click(function() {
		$(".captchaImage").prop("src", "/erhuo/user/validateCode.apx?time=" + new Date().getTime())
	})
	
  	//注册
  	$('.register-btn').click(function(){
  		if($('.userName').val() == '' || $('.userName').val() == undefined){
  			$('.userName').focus()
  			return layer.tips('请输入用户名', '.userName')
  		}
  		//检测图形验证码
  		if($('.captchaCode').val() == '' || $('.captchaCode').val() == undefined){
  			$('.captchaCode').focus()
  			return layer.tips('请输入图形验证码', '.captchaCode')
  		}

  		//检测密码
  		if($('.password').val() == '' || $('.password').val() == undefined){
  			$('.password').focus()
  			return layer.tips('请输入密码', '.password')
  		}

  		//检测用户协议
  		if($('.checkbox[name=checkbox]:checked').length != 1){
  			return layer.tips('请同意《二货网用户协议》', '.checkbox')
  		}

  		var url = 'user/register.apx'
  			
		var Data = {
  			userName: $('.userName').val(),
			password: $('.password').val(),
			captchaCode: $('.captchaCode').val(),
		}
		Common.ajax(url, Data, function (data) {
		    if(data.success == "true"){
		        layer.msg(data.msg)
		        setTimeout(function(){
		        	location.href = 'login.jsp'
		        }, 1000)
		    }else{
		        layer.msg(data.msg)
		    }
		}, function (err) {
		    console.log(err)
		}, function (){}, true, 'POST')
  	})

})
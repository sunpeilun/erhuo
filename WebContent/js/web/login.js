$(function(){
	
	
	layui.use(['element', 'layer'], function(){
	  	var element = layui.element(),
	  		layer = layui.layer

	  	var redirectURL =  Common.getQuery('redirectURL');
	  	
	  	$('.login-btn').click(function(){
	  	
	  		
	  		if($('.userName').val() == '' || $('.userName').val() == undefined){
	  			$('.userName').focus()
	  			return layer.tips('请输入用户名', '.userName')
	  		}
	  		if($('.password').val() == '' || $('.password').val() == undefined){
	  			$('.password').focus()
	  			return layer.tips('请输入密码', '.password')
	  		}
	  		if(!flag){
	  			return layer.tips('请完成校验', '#mpanel4')
	  		}

	  		var url = '/erhuo/user/login.apx'
			var par = {
	  			userName: $('.userName').val(),
				password: $('.password').val()
			}
	  		
			Common.ajax(url, par, function (data) {
			    if(data.success == "true"){
			        layer.msg(data.msg)
			        if(refererPath){
			        	setTimeout(function(){
				        	location.href = refererPath;
				        }, 300)
			        }else{
				        setTimeout(function(){
				        	location.href = 'index.jsp';
				        }, 300)
			        }
			    }else{
			        layer.msg(data.msg)
			    }
			}, function (err) {
			    console.log(err)
			}, function (){}, true, 'post')
	  	})
	})
	$('.userName').keyup(function(){
		var name=$('.userName').val();
		if(name != '' && name != undefined){
			var url = 'user/isUserPicture.apx'
			var params={"userName":name};
			$.post(url,params,function(data){
				var header = $(".user-header");
				if(data.success == "true"){
					header.prop("src", "/erhuo/image.apx?path=" + data.src);
				} else {
					header.prop("src", "images/web/user/default.png");
				}
			},"json")
  		}
	})
})
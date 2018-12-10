$(function(){

    //首次加载图形验证
    Common.getCaptcha()
    //点击刷新图片验证码
    $('.captchaImage').click(function(){
        Common.getCaptcha()
    })

    //请求短息验证码
    $('.get-phoneCode').click(function(){
        //检测手机号
        var phoneReg = /^1[3|4|5|7|8][0-9]\d{8}$/
        if($('.phoneNum').val() == '' || $('.phoneNum').val() == undefined){
            $('.phoneNum').focus()
            return layer.tips('请输入手机号', '.phoneNum')
        }else if(!phoneReg.test($('.phoneNum').val())){
            $('.phoneNum').focus()
            return layer.tips('手机号格式有误', '.phoneNum')
        }
        //检测图形验证码
        if($('.captchaCode').val() == '' || $('.captchaCode').val() == undefined){
            $('.captchaCode').focus()
            return layer.tips('请输入图形验证码', '.captchaCode')
        }
        var url = '/user/get_verify_code'
        var Data = {
            phonenum: $('.phoneNum').val(),
            captcha: $('.captchaCode').val(),
            id: $('.captchaImage').attr('data-id'),
            type: 1
        }
        Common.ajax(url, Data, function (data) {
            if(data.success){
                layer.msg(data.msg)
                $('.get-phoneCode').hide()
                $('.showbox').show()
                Common.time()
            }else{
                layer.msg(data.msg)
            }
        }, function (err) {
            console.log(err)
        }, function (){}, true, 'POST')
    })

    //提交
    $('.register-btn').click(function(){
        var phoneReg = /^1[3|4|5|7|8][0-9]\d{8}$/
        if($('.phoneNum').val() == '' || $('.phoneNum').val() == undefined){
            $('.phoneNum').focus()
            return layer.tips('请输入手机号', '.phoneNum')
        }else if(!phoneReg.test($('.phoneNum').val())){
            $('.phoneNum').focus()
            return layer.tips('手机号格式有误', '.phoneNum')
        }
        //检测图形验证码
        if($('.captchaCode').val() == '' || $('.captchaCode').val() == undefined){
            $('.captchaCode').focus()
            return layer.tips('请输入图形验证码', '.captchaCode')
        }
        //检测短信验证码
        if($('.phoneCode').val() == '' || $('.phoneCode').val() == undefined){
            $('.phoneCode').focus()
            return layer.tips('请输入手机验证码', '.phoneCode')
        }
        //检测两次输入的密码
        if($('.password').val() == '' || $('.password').val() == undefined){
            $('.password').focus()
            return layer.tips('请输入新密码', '.password')
        }
        if($('.repassword').val() == '' || $('.repassword').val() == undefined){
            $('.repassword').focus()
            return layer.tips('请确认新密码', '.repassword')
        }
        if($('.password').val() != $('.repassword').val()){
            $('.repassword').focus()
            return layer.tips('两次输入的密码不一致', '.repassword')
        }

        var url = '/user/forget'
        var Data = {
            phone_number: $('.phoneNum').val(),
            phoneCode: $('.phoneCode').val(),
            password: $.md5($('.password').val() ),
        }
        Common.ajax(url, Data, function (data) {
            if(data.success){
                layer.msg(data.msg)
                setTimeout(function(){
                    location.href = '/login'
                }, 1500)
            }else{
                layer.msg(data.msg)
            }
        }, function (err) {
            console.log(err)
        }, function (){}, true, 'POST')
    })
})
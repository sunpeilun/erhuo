var num = 0

$(function () {
	
	layui.use(['form', 'upload', 'layer'], function () {
		var form = layui.form(),
			layer = layui.layer

		layui.upload({
			url: '/erhuo/goods.image',
			elem: '.info-img-upload', //指定原始元素，默认直接查找class="layui-upload-file"
			method: 'post', //上传接口的http类型
			success: function (data) {
				layer.msg(data.msg)
				if (data.success == "true") {
					$('.layui-upload-button').before('<div class="uploaded">' +
						'<img class="good-image" data-src="' + data.src + '" src="' + "/erhuo/goodImage.apx?temp=1&path=" + data.src + '">' +
						'<i class="icon delete" data-src="' + data.src + '" onclick="deleteImage(this);">&#xe6a2;</i>' +
						'</div>')
					num++
					if (num == 5) {
						$('.layui-upload-button').hide()
					}
				}
			}
		})

		//交易方式切换
		$('.layui-form-radio').click(function () {
			if ($('.buyMethod[name=transactionMode]:checked').val() == 1) {
				$('#address').hide()
			} else {
				$('#address').show()
			}
		})

	})

	$('.submit').click(function () {

		//检测是否上传图片
		if ($('.uploaded').length < 1) {
			layer.msg('请先上传图片')
			$("html,body").animate({
				scrollTop: $('.image').offset().top - 5
			}, 500)
			return false
		}

		//检测商品名称
		if (!($('.goods-title').val() && $('.goods-title').val().length < 14)) {
			layer.msg('请输入商品名称 且 长度不得超过14字')
			$("html,body").animate({
				scrollTop: $('.goods-title').parent('.layui-input-inline').offset().top - 5
			}, 500)
			$('.goods-title').parent('.layui-input-inline').find('input').addClass('no-data')
			return false
		}
		$('.goods-title').parent('.layui-input-inline').find('input').removeClass('no-data')

		//检测商品详情
		if (!($('.goods-des').val() && $('.goods-des').val().length > 10 && $('.goods-des').val().length < 500)) {
			layer.msg('请输入商品描述 且 长度必须在 10 - 500 字之间')
			$("html,body").animate({
				scrollTop: $('.goods-des').parent('.layui-input-block').offset().top - 5
			}, 500)
			$('.goods-des').parent('.layui-input-block').find('textarea').addClass('no-data')
			return false
		}
		$('.goods-des').removeClass('no-data')

		//检测价格
		if (!$('.price').val()) {
			layer.msg('请输入商品价格')
			$("html,body").animate({
				scrollTop: $('.price').parent('.layui-input-inline').offset().top - 5
			}, 500)
			$('.price').parent('.layui-input-inline').find('input').addClass('no-data')
			return false
		}
		var priceReg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/
		if (!priceReg.test($('.price').val())) {
			layer.msg('请输入正确的商品价格，如：0.00')
			$("html,body").animate({
				scrollTop: $('.price').parent('.layui-input-inline').offset().top - 5
			}, 500)
			$('.price').addClass('no-data')
			return false
		}
		$('.price').removeClass('no-data')

		//检测原价
		if (!$('.original-price').val()) {
			layer.msg('请输入商品价格')
			$("html,body").animate({
				scrollTop: $('.original-price').parent('.layui-input-inline').offset().top - 5
			}, 500)
			$('.original-price').parent('.layui-input-inline').find('input').addClass('no-data')
			return false
		}
		if (!priceReg.test($('.original-price').val())) {
			layer.msg('请输入正确的商品价格，如：0.00')
			$("html,body").animate({
				scrollTop: $('.original-price').parent('.layui-input-inline').offset().top - 5
			}, 500)
			$('.original-price').addClass('no-data')
			return false
		}
		$('.original-price').removeClass('no-data')

		//检测分类
		if (!$('#categorys').val()) {
			layer.msg('请选择分类')
			$("html,body").animate({
				scrollTop: $('#categorys').parent('.layui-input-inline').offset().top - 5
			}, 500)
			$('#categorys').parent('.layui-input-inline').find('input').addClass('no-data')
			return false
		}
		$('#categorys').parent('.layui-input-inline').find('input').removeClass('no-data')

		//检测交易类型
		if ($('.buyMethod[name=transactionMode]:checked').length != 1) {
			layer.msg('请选择交易方式')
			$("html,body").animate({
				scrollTop: $('.buyMethod').parent('.layui-input-inline').offset().top - 5
			}, 500)
			$('.buyMethod').parent('.layui-input-inline').find('input').addClass('no-data')
			return false
		}
		$('.buyMethod').parent('.layui-input-inline').find('input').removeClass('no-data')

		if ($('.buyMethod[name=transactionMode]:checked').val() != 1 && $('.goods-address').val() == '') {
			layer.msg('请输入交易地址')
			$("html,body").animate({
				scrollTop: $('.goods-address').parent('.layui-input-block').offset().top - 5
			}, 500)
			$('.goods-address').parent('.layui-input-block').find('input').addClass('no-data')
			return false
		}
		$('.goods-address').parent('.layui-input-block').find('input').removeClass('no-data')

		//检测手机号
		if (!$('.phone-number').val()) {
			layer.msg('请输入手机号')
			$("html,body").animate({
				scrollTop: $('.phone-number').parent('.layui-input-inline').offset().top - 5
			}, 500)
			$('.phone-number').parent('.layui-input-inline').find('input').addClass('no-data')
			return false
		}
		$('.phone-number').parent('.layui-input-inline').find('input').removeClass('no-data')

		//检测全部通过
		$('.no-data').removeClass('no-data')

		var good_images = []
		for (var i = 0; i < $('.uploaded').length; i++) {
			good_images.push($('.uploaded').eq(i).find('img').data('src'))
		}

		var goodinfo = {
			imgList: JSON.stringify(good_images),
			commodityName: $('.goods-title').val(), //商品名称
			commodityDetails: $('.goods-des').val(), //商品详情
			nowPrice: $('.price').val(),//现价
			costPrice: $('.original-price').val(),//原价
			classificationId: $('#categorys').val(),//商品分类id
			tradeWay: $('.buyMethod[name=transactionMode]:checked').val(),//交易方式
			tradeAddress: $('.goods-address').val(),//交易地址
			phoneNumber: $('.phone-number').val(),//手机号码
			qqNumber: $('.qq-number').val(),//qq号码
			wxNumber: $('.wx-number').val(),//微信号码
		}
		// console.log(goodinfo)

		var url = '/erhuo/good/addGood.apx'
		Common.ajax(url, goodinfo, function (data) {
			layer.msg(data.msg)
			if (data.success == "true") {
				// console.log(data)
				setTimeout(function () {
					//TODO 跳转到我的发布商品列表
					location.href = '/erhuo/user/index.jsp' 
				}, 2000)
			}
		}, function (err) {
			console.log(err)
		}, function () {}, true, 'POST')
	})


})

//删除已上传的图片
function deleteImage(obj) {
	var path = $(obj).attr('data-src')

	var url = '/erhuo/deleteImage.apx'
	var Data = {
		type:"good",
		temp:"Temp",
		path: path
	}
	Common.ajax(url, Data, function (data) {
		layer.msg(data.msg)
		if (data.success == "true") {
			num--
			if (num < 5) {
				$('.layui-upload-button').show()
			}
			$(obj).parent('.uploaded').remove()
		}
	}, function (err) {
		console.log(err)
	}, function () {}, true, 'POST')
}
$(function() {

    MagnifierF("MagnifierWrap2")

    layui.use(['layer'], function() {
        var layer = layui.layer

        //联系卖家
        $('.contect-seller').click(function() {
            // $('.user-contect').show()
            layer.open({
                type: 1,
                shade: false,
                title: false, //不显示标题
                content: $('.user-contect'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                cancel: function() {
                    //layer.closeAll()  //TODO 不知道是啥
                    $('.user-contect').hide()
                }
            });
        })

        //收藏
        $('.want').click(function() {
        	var loginUser = $(this).data('user');
        	if(loginUser == '' || loginUser == undefined){
        		return layer.msg('请先登录~')
        	}
            if ($('.want i').hasClass('wanted')) {
                return layer.msg('您已经收藏过该二货了哦~')
            }
            var url = "/erhuo/user/addMyWant.apx"
            var Data = {
                cid: $(this).data('id')
            }
            Common.ajax(url, Data, function(data) {
                if (data.success == "true") {
                	layer.msg(data.msg)
                    $('.want i').addClass('wanted')
                } else{
                	layer.msg('收藏失败~')
                }
            }, function(err) {
            	layer.msg('收藏失败~')
            }, function() {}, true, 'POST')
        })

        //举报
        $('.report').click(function() {
            layer.open({
                type: 1,
                title: '举报提交',
                skin: 'report-layer', //加上边框
                area: ['420px', '300px'], //宽高
                content: '<p class="r-title">举报 “' + $('.good-info h2').html() + '” </p>' +
                    '<textarea class="description" cols="30" rows="10" placeholder="举报描述"></textarea>' +
                    '<p><a href="javascript:;" class="layui-btn layui-btn-normal submit-report">提交</a></p>'
            })

            $('.submit-report').click(function() {
                if ($('.description').val() == '' || $('.description').val() == undefined) {
                    return layer.msg('请输入举报描述')
                }
                if ($('.description').val().length > 100 || $('.description').val().length < 10) {
                    return layer.msg('举报描述字数必须在10~100字之间！')
                }
                var url = '/user/report'
                var Data = {
                    gid: $('.want').attr('data-id'),
                    good_title: $('.good-info h2').html(),
                    description: $('.description').val()
                }
                Common.ajax(url, Data, function(data) {
                    layer.msg(data.msg)
                }, function(err) {
                    console.log(err)
                }, function() {}, true, 'POST')
            })
        })

        //评论
        $('.comments').on('input', function(e) {
            let words_number = $('.comments').val().length
            if (words_number > 100) {
                $('.comments-words').html('<span style="color: red;">' + words_number + '</span>' + '/100')
            } else {
                $('.comments-words').html(words_number + '/100')
            }

        })

        $('.comment-submit').click(function() {
            let comment = {
            	commodityId: $('.want').attr('data-id'),
            	text: $('.comments').val()
            }

            if (comment.text.length > 100) {
                return layer.msg('评论内容不得超过100字！')
            }

            let url = '/erhuo/message/addMessage.apx'
                // debugger
            Common.ajax(url, comment, function(data) {
                if (data.success == "true") {
                    setTimeout(function() {
                        location.reload()
                    }, 1000)
                }
                layer.msg(data.msg)
            }, function(err) {
                console.log(err)
            }, function() {}, true, 'POST')
        })


    })


})
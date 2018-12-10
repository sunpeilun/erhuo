$(function() {
    layui.use(['element'], function() {
        var element = layui.element()
    })

    //第一次获取我发布的	
    var published_li = $(".published-li").clone();
    published_li.removeAttr("style");
    
    var received_ul = $('.comment-list');
    received_ul.html('');

    //获取我收到的列表	
    function getReceived(page) {
        var url = '/erhuo/message/received.apx'
        var Data = {
            page: page
        }
        Common.ajax(url, Data, function(data) {
            if (data.length > 0) {
            	received_ul.html('')
               $(data).each(function(i) {
            	   var m = data[i];
            	   var li = published_li.clone();
            	   li.find(".table_img").prop("src", "/erhuo/image.apx?path=" + m.sendUser.avatar);
            	   li.find(".li_a").prop("href","/erhuo/good/showp2.apx?cid=" + m.commodityId+"#"+m.mid);
            	   li.find(".userName").text(m.sendUser.userName);
            	   li.find(".msg_text").text(m.text);
            	   li.find(".sendTime").text(m.sendTime);
            	   received_ul.append(li);
               })

            } else {
            	received_ul.html('<div class="nodata">您还没有收到过留言</div>')
            }
        }, function(err) {
            console.log(err)
        }, function() {}, true, 'POST')
    }
    
    var published_ul = $('.published-comment-list');
    published_ul.html('');
    //我发布的
    function getPublished(page) {
        var url = '/erhuo/message/published.apx'
        var Data = {
            page: page
        }
        Common.ajax(url, Data, function(data) {
            if (data.length > 0) {
            	published_ul.html('')
               $(data).each(function(i) {
            	   var m = data[i];
            	   var li = published_li.clone();
            	   li.find(".table_img").prop("src", "/erhuo/image.apx?path=" + m.sendUser.avatar);
            	   li.find(".li_a").prop("href","/erhuo/good/showp2.apx?cid=" + m.commodityId+"#"+m.mid);
            	   li.find(".userName").text(m.sendUser.userName);
            	   li.find(".msg_text").text(m.text);
            	   li.find(".sendTime").text(m.sendTime);
            	   published_ul.append(li);
               })

            } else {
            	published_ul.html('<div class="nodata">您还没有发布过留言</div>')
            }
        }, function(err) {
            console.log(err)
        }, function() {}, true, 'POST')
    }
    getReceived(1);
    getPublished(1);
})
/**
 * jQuery的ajax扩展
 * @Author 梁桐
 * @Email liangtong@itcast.cn
 * 
 *   data = data || {}   运行结果
 *   
 *   true ||  ...  		--> true
 *   false || true 		-->  true
 *   
 *   Object || ...  	--> Object
 *   false || Object2 	--> Object2
 *   
 *   undefined / null / 0 / false  转换boolean --> false
 *   
 */

$.extend({
	"myPost" : function(url,data,callback,errorcallback,type){
		//处理数据
		data = data || {};								//如果data有数据使用data数据，如果data没有数据使用空数据{}
		callback = callback || function(){};			//默认空函数
		errorcallback = errorcallback || function(){};
		type = type || "json";							//默认json
		
		//发送ajax
		$.ajax({
			"url" : url,
			"data" : data,
			"success" : callback,
			"error" : errorcallback,
			"dataType" : type,
			"type" : "post"
		});
	},
	"mywindow" : function(id,title,url,height,width){
		//1 创建div
		var newDiv = $("<div id='"+id+"'></div> ");
		$("body").append(newDiv);
		
		//处理数据
		height = height || 400;
		width = width || 600;
		
		
		//2 渲染window
		newDiv.window({
			"title":title,
			"content" :"<iframe src='"+url+"' frameborder='0' width='100%' height='100%'></iframe>",
			 "width":width,    		//宽
			 "height":height,    	//高
			 modal:true ,		//是否是模式窗口
		});
	}
});




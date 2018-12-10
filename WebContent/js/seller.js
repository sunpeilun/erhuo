//追加 li 点击事件
function dianji(obj,Id,divId){
	var liVal = $(obj).html();
	//赋值
	$("#"+Id).prop("value",liVal);
	$("#"+divId).hide();
}
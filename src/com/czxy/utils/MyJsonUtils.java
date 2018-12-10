package com.czxy.utils;

import java.util.Collection;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MyJsonUtils {

	/**
	 * 将Java任意对象转换成json字符串
	 * @param data
	 * @return
	 */
	public static String getJsonString(Object data){
		//如果是数组，或 集合  (JSONArray)
		if( data.getClass().isArray() || data instanceof Collection ){
			return JSONArray.fromObject(data).toString();
		} else {
			//否则 JSONObject
			return JSONObject.fromObject(data).toString();
		}
	}
}

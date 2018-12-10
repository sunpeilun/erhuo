package com.czxy.dao;

import java.util.List;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.czxy.domain.Message;

import tk.mybatis.mapper.common.Mapper;

public interface MessageMapper extends Mapper<Message> {

	@Select("SELECT * FROM message WHERE `send_uid` = '${uid}' ORDER BY `send_time` DESC")
	@Results(id = "message", value = { 
		@Result(column = "mid", property = "mid"),
		@Result(column = "send_uid", property = "sendUid"),
		@Result(column = "receive_uid", property = "receiveUid"),
		@Result(column = "commodity_id", property = "commodityId"),
		@Result(column = "text", property = "text"),
		@Result(column = "send_time", property = "sendTime"),
		@Result(column = "father_mid", property = "fatherMid"),
		@Result(column = "send_uid", one=@One(select="com.czxy.dao.UserMapper.selectByPrimaryKey"), property = "sendUser"),
		@Result(column = "receive_uid", one=@One(select="com.czxy.dao.UserMapper.selectByPrimaryKey"), property = "receiveUser"),
		@Result(column = "mid", one=@One(select="com.czxy.dao.MessageMapper.selectByFatherMid"), property = "reviews")
	})
	List<Message> selectBySendUser(@Param("uid") Integer uid);
	
	@Select("SELECT * FROM message WHERE `receive_uid` = '${uid}' AND `receive_uid` != `send_uid` ORDER BY `send_time` DESC")
	@ResultMap("message")
	List<Message> selectByReceiveUser(@Param("uid") Integer uid);
	
	@Select("SELECT * FROM message WHERE `commodity_id` = '${cid}' and LEVEL IS null")
	@ResultMap("message")
	List<Message> selectByCommodity(@Param("cid") String cid);

	
	
	@Select("SELECT * FROM message WHERE `father_mid` = #{mid} ")
	@ResultMap("message")
	List<Message> selectByFatherMid(@Param("mid") Integer mid);
	
	
	
	@Select("SELECT * FROM message WHERE `mid` = #{mid} ")
	@ResultMap("message")
	Message selectByMid(Integer mid);

}

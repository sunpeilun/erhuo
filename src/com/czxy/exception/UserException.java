package com.czxy.exception;

/**
 * 自定义异常
 * 使用中实例：
 * 	throw new UserException();
 * 	throw new UserException("出错了");
 * 	throw new UserException( e );
 * 
 * 需要提供多种构造方法
 * 
 * @author liangtong
 */
public class UserException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UserException() {
		super();
	}

	public UserException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public UserException(String message, Throwable cause) {
		super(message, cause);
	}

	public UserException(String message) {
		super(message);
	}

	public UserException(Throwable cause) {
		super(cause);
	}

}

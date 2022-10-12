package com.exception;

public class InvalidUserNameException extends Exception{
	private static final long serialVersionUID = 1L;

	public InvalidUserNameException(String msg) {
		super(msg);
	}
}


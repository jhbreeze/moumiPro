package com.moumi.app.chatting;

import java.util.List;

public interface UserChatService {
	public void insertDialog() throws Exception;
	public long dataCount();
	public List<UserChat> listDialog();
	public UserChat readDialog();
}

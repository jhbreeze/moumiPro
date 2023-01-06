package com.moumi.app.chatting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("chattting.userChatService")
public class UserChatServiceImpl implements UserChatService {
	@Autowired
	private ChatMongoOperations chatMongo;

	@Override
	public void insertDialog() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public long dataCount() {
		long result = 0;
		try {
			result = chatMongo.dataCount();
		} catch (Exception e) {
		}

		return result;
	}

	@Override
	public List<UserChat> listDialog() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserChat readDialog() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}

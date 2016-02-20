package com.usst.app.vip.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.usst.app.vip.message.model.Message;
import com.usst.code.ibatis.impl.PublicDAO;
import com.usst.code.service.BaseService;

public class MessageService extends BaseService<Message> {
	public void deleteByMessageId(String intoId) throws Exception {
		if (StringUtils.isBlank(intoId)) {
			throw new Exception("intoId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("id", intoId);
		this.publicDAO.delete("Message.Message_messageId", param);
	}

	public void updatReplyState(String id) throws Exception {
		if (StringUtils.isBlank(id)) {
			throw new Exception("id is null");
		}
		Map param = new HashMap();
		param.put("id", id);
		param.put("replyState", "1");
		this.publicDAO.update("Message.Message_replyState", param);
	}

	public List<Message> getRevovery(String messageId) throws Exception {
		if (StringUtils.isBlank(messageId)) {
			throw new Exception("id is null");
		}
		Map param = new HashMap();
		param.put("messageId", messageId);
		List<Message> list = this.publicDAO.select("Message.Message", param);
		return list;
	}

	public List<Message> getMessageByGoodId(String goodId) throws Exception {
		if (StringUtils.isBlank(goodId)) {
			throw new Exception("goodId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		param.put("replyState", "1");
		List<Message> list = this.publicDAO.select("Message.Message", param);
		return list;
	}

	public List<Message> getReplyMessageByGoodId(String goodId) throws Exception {
		if (StringUtils.isBlank(goodId)) {
			throw new Exception("goodId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("goodId", goodId);
		param.put("state", "s");
		List<Message> list = this.publicDAO.select("Message.Message", param);
		return list;
	}

	public Message getRepalyById(String messageId) throws Exception {
		if (StringUtils.isBlank(messageId)) {
			throw new Exception("messageId is null!");
		}
		Map<String, String> map = new HashMap();
		map.put("messageId", messageId);
		Message message = (Message) this.publicDAO.selectOne("Message.Message", map);
		return message;
	}

	public List<Message> getMessageReplyStateSum(Message message) {
		List<Message> list = this.publicDAO.select("Message.Message", message);
		return list;
	}

	public List<Message> getReplyByCustomerId(String creatorId) throws Exception {
		if (StringUtils.isBlank(creatorId)) {
			throw new Exception("goodId is null");
		}
		Map<String, String> param = new HashMap();
		param.put("creatorId", creatorId);
		List<Message> list = this.publicDAO.select("Message.Message_reply", param);
		return list;
	}
}

package net.haebang.reply.service;

import java.util.List;

import net.haebang.vo.ReplyVo;


public interface ReplyService {

	List<ReplyVo> selectAllReply(int q_no);
	void insertReply(ReplyVo reply);
	void modifyReply(ReplyVo reply);
	void deleteReply(int r_no);
	
}

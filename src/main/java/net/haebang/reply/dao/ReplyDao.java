package net.haebang.reply.dao;

import java.util.List;

import net.haebang.vo.ReplyVo;


public interface ReplyDao {

	List<ReplyVo> selectAll(int q_no);
	void insert(ReplyVo reply);
	void modify(ReplyVo reply);
	void delete(int r_no);
	
}

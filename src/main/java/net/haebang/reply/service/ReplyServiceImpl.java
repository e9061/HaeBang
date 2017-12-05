package net.haebang.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.haebang.reply.dao.ReplyDao;
import net.haebang.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyDao dao;
	
	@Override
	public List<ReplyVo> selectAllReply(int q_no) {
		List<ReplyVo> list = dao.selectAll(q_no);
		return list;
	}

	@Override
	public void insertReply(ReplyVo reply) {
		dao.insert(reply);
		
	}

	@Override
	public void modifyReply(ReplyVo reply) {
		dao.modify(reply);
		
	}

	@Override
	public void deleteReply(int r_no) {
		dao.delete(r_no);
		
	}

	
	
}

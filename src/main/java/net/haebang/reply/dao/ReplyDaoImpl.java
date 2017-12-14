package net.haebang.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.haebang.vo.ReplyVo;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<ReplyVo> selectAll(int q_no) {
		List<ReplyVo> list = sqlSession.selectList("net.haebang.reply.dao.replyDao.selectAllreply", q_no);
		System.out.println(list);
		return list;
	}

	@Override
	public void insert(ReplyVo reply) {
		sqlSession.insert("net.haebang.reply.dao.replyDao.insertReply", reply);
		
	}

	@Override
	public void modify(ReplyVo reply) {
		sqlSession.insert("net.haebang.reply.dao.replyDao.updateReply",reply);
		
	}

	@Override
	public void delete(int r_no) {
		sqlSession.delete("net.haebang.reply.dao.replyDao.deleteReply", r_no);
		
	}
	
	

	
	
}

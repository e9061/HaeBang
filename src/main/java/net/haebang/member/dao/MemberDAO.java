package net.haebang.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import net.haebang.vo.MemberVo;

public interface MemberDAO {

        List<MemberVo> selectAll();
        void insert(MemberVo QnA);
        MemberVo selectOne(String m_id);
        /*boolean loginCheck(MemberVO Member);
        MemberVO viewMember(MemberVO Member);*/
        void logout(HttpSession session);
        MemberVo login(MemberVo member);

}

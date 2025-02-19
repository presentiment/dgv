package com.dgv.web.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminCouponVO;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminRankVO;
import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.admin.vo.AdminVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserVO;

@Repository
public class AdminUserDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserVO> userList(){
		return sqlSessionTemplate.selectList("AdminUserDAO.UserList");
	}
	
	public int userDelete(UserVO vo) {
		return sqlSessionTemplate.delete("AdminUserDAO.UserDelete",vo);
	}
	
	public AdminVO adminLogin(String id) {
		return sqlSessionTemplate.selectOne("AdminUserDAO.AdminLogin", id);
	}
	
	public List<AdminTermVO> termList(){
		return sqlSessionTemplate.selectList("AdminUserDAO.termList");
	}
	
	public int termInsert(AdminTermVO vo) {
		return sqlSessionTemplate.insert("AdminUserDAO.termInsert",vo);
	}
	
	public List<AdminRankVO> rankList(){
		return sqlSessionTemplate.selectList("AdminUserDAO.rankList");
		
	}
	public int rankInsert(AdminRankVO vo) {
		return sqlSessionTemplate.insert("AdminUserDAO.rankInsert", vo);
	}
	
	public int userRankUpdate(UserDetailVO vo) {
		return sqlSessionTemplate.update("AdminUserDAO.userRankUpdate", vo);
	}
	public AdminRankVO rankOneSelect(int num) {
		return sqlSessionTemplate.selectOne("AdminUserDAO.rankOneSelect",num);
	}
	
	public AdminRankVO rankNameSelect(String name) {
		return sqlSessionTemplate.selectOne("AdminUserDAO.rankNameSelect", name);
	}
	public UserVO userNumList(int num) {
		return sqlSessionTemplate.selectOne("AdminUserDAO.userNumList",num);
	}
	
	public AdminTermVO userTermNumVo(int num) {
		return sqlSessionTemplate.selectOne("UserDAO.userTermNumVo",num);
	}
	
	public int userStatus(UserVO vo) {
		return sqlSessionTemplate.update("AdminUserDAO.userStatus",vo);
	}
	
	// 이벤트 삭제
	public int eventDelete(AdminEventVO vo) {
		return sqlSessionTemplate.delete("AdminBoardDAO.EventDelete",vo);
	}
	
	// 공지사항 삭제
	public int noticeDelete(AdminNoticeVO vo) {
		return sqlSessionTemplate.delete("AdminBoardDAO.NoticeDelete",vo);
	}
	
	// 쿠폰 삭제
	public int couponDelete(AdminCouponVO vo) {
		return sqlSessionTemplate.delete("AdminBoardDAO.CouponDelete",vo);
	}
	
}

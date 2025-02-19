package com.dgv.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;

import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminCouponVO;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminInquiryVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.dgv.web.admin.vo.AdminParUserEventVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRankVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminSeatVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.user.controller.Pagination;
import com.dgv.web.user.vo.Criteria;
import com.dgv.web.user.vo.CriteriaBoard;
import com.dgv.web.user.vo.MyPagePaging;
import com.dgv.web.user.vo.SearchVO;
import com.dgv.web.user.vo.UserCommentVO;
import com.dgv.web.user.vo.UserCommunityVO;
import com.dgv.web.user.vo.UserCouponUseVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserFAQKindVO;
import com.dgv.web.user.vo.UserFAQVO;
import com.dgv.web.user.vo.UserInquiryVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserMoiveImgVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;

@Repository
public class UserBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminNoticeVO> noticeList(){
		return sqlSessionTemplate.selectList("UserBoardDAO.NoticeList");
	}
	
	public List<UserInquiryVO> userQnaOneList(String id){
		return sqlSessionTemplate.selectList("UserBoardDAO.UserQnaOneList",id);
	}
	
	public int insertMyQna(UserInquiryVO vo){
		return sqlSessionTemplate.insert("UserBoardDAO.InsertMyQna",vo);
	}
	
	///도시별 극장
	public List<AdminCityVO> cityTheaterList(){
		return sqlSessionTemplate.selectList("UserMovieDAO.TheaterList");
	}
	public List<AdminRegionVO> regionTheaterList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.RegionList",num);
	}
	public UserMapVO mapList(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.MapList", num);
	}
	public int insertMap(UserMapVO vo) {
		return sqlSessionTemplate.insert("UserMovieDAO.InsertMap",vo);
	}
	
	public List<AdminTheaterVO> theaterCodeList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.TheaterCodeList", num);
	}
	public AdminTimeVO timeStatusList(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.timeStatusList",num);
	}
	
	public AdminSeatVO seatListInfo(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.seatListInfo", num);
	}
	
	public AdminMovieVO movieList(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.MovieList", num);
	}
	public AdminTheaterVO theaterListInfo(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.theaterListInfo",num);
	}
	
	public List<AdminParVO> parList(int num) {
		return sqlSessionTemplate.selectList("UserMovieDAO.parList",num);
	}

	public List<AdminParVO> distinctGroupList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.distinctGroupList",num);
	}
	
	public List<AdminActorVO> actorList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorList", num);
	}
	
	public List<AdminGroupVO> groupList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.groupList", num);
	}
	public UserMoiveImgVO imgList(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.imgList",num);
	}
	
	public AdminGroupVO actorGroup(int num) {
		return sqlSessionTemplate.selectOne("AdminGroupDAO.actorGroup",num);
	}
	
	public List<AdminParVO> actorMovieList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorMovieList", num);
	}
	
	public List<AdminMovieVO> actorParMovieList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorParMovieList", num);
	}
	
	public List<AdminGenreVO> actorGenreList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorGenreList", num);
	}
	
	public List<AdminAgeVO> actorAgeList(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.actorAgeList", num);
	}
	
	public void viewCount(int num) {
		sqlSessionTemplate.update("UserBoardDAO.viewCount",num);
	}
	
	public AdminNoticeVO noticeView(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.noticeView",num);
	}
	
	public List<UserFAQVO> faqList(int num){
		return sqlSessionTemplate.selectList("UserBoardDAO.faqList",num);
	}
	public UserFAQKindVO faqKindList(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.faqKindList",num);
	}
	
	public void faqCount(int num) {
		sqlSessionTemplate.update("UserBoardDAO.faqCount",num);
	}
	
	public UserFAQVO faqVoSelect(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.faqVoSelect", num);
	}
	public int communityInsert(UserCommunityVO vo) {
		return sqlSessionTemplate.insert("UserBoardDAO.communityInsert",vo);
	}
	
	public List<UserCommunityVO> communitySelect(CriteriaBoard cri){
		return sqlSessionTemplate.selectList("UserBoardDAO.communitySelect",cri);
	}
	public UserCommunityVO communityChoiceNum(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.communityChoiceNum",num);
	}
	
	public int userReserveInsert(UserReserveVO reserveVo) {
		return sqlSessionTemplate.insert("UserMovieDAO.userReserveInsert", reserveVo);
	}
	
	public List<UserReserveVO> userReserveMyPage(String id){
		return sqlSessionTemplate.selectList("UserMovieDAO.userReserveMyPage", id);
	}
	public List<UserReserveVO> userReserveSeatStatus(UserReserveVO vo) {
		return sqlSessionTemplate.selectList("UserMovieDAO.userReserveSeatStatus", vo);
	}
	
	public int UpdateReserveStatus(UserReserveVO vo) {
		return sqlSessionTemplate.update("UserMovieDAO.UpdateReserveStatus", vo);
	}
	
	public List<AdminMovieVO> userArtHouseList(){
		return sqlSessionTemplate.selectList("UserMovieDAO.userArtHouseList");
	}
	public UserVO communityUserInfo(String id) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.communityUserInfo",id);
	}
	
	public List<UserCommunityVO> getCommunityList(SearchVO vo) throws Exception{
		return sqlSessionTemplate.selectList("UserBoardDAO.getSearchList", vo);
	}
	
	public int getCommunityCnt(){
		return sqlSessionTemplate.selectOne("UserBoardDAO.getCommunityCnt");
	}
	public List<AdminMovieVO> myPaging(Criteria cri){
		return sqlSessionTemplate.selectList("UserBoardDAO.myPagingMovie", cri);
	}
	public int getTotal() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.getTotal");
	}
	public int communityCountView(int num) {
		return sqlSessionTemplate.update("UserBoardDAO.communityCountView",num);
	}
	public int CommentInsert(UserCommentVO vo) {
		return sqlSessionTemplate.insert("UserBoardDAO.CommentInsert",vo);
	}
	public List<UserCommentVO> commentSelect(int num){
		return sqlSessionTemplate.selectList("UserBoardDAO.commentSelect",num);
	}
	

	public List<AdminEventVO> eventList(){
		return sqlSessionTemplate.selectList("UserBoardDAO.eventList");

	}
	public UserVO userNumSelect(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.userNumSelect",id);
	}

	public List<UserReserveVO> userIdMovieReserveList(String id){
		return sqlSessionTemplate.selectList("UserMovieDAO.userIdMovieReserveList", id);

	}
	
	public int continueTotal() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.continueTotal");
	}
	
	public int endTotal() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.endTotal");
	}
	
	public int yetTotal() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.yetTotal");
	}
	
	public List<UserVO> userIdList(){
		return sqlSessionTemplate.selectList("UserDAO.userIdList");
	}
	
	public List<AdminCouponVO> myCouponList(int num){
		return sqlSessionTemplate.selectList("UserBoardDAO.myCouponList", num);
	}
	
	public AdminCouponVO myCouponVo(int num){
		return sqlSessionTemplate.selectOne("UserBoardDAO.myCouponVo", num);
	}
	
	public int CouponUseInsert(UserCouponUseVO vo){
		return sqlSessionTemplate.insert("UserBoardDAO.CouponUseInsert", vo);
	}
	
	public List<UserCouponUseVO> CouponUseSelect(UserCouponUseVO vo){
		return sqlSessionTemplate.selectList("UserBoardDAO.CouponUseSelect", vo);
	}
	public AdminInquiryVO adminAnswer(int num){
		return sqlSessionTemplate.selectOne("UserBoardDAO.adminAnswer", num);
	}
	
	public UserInquiryVO userQnaVO(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.userQnaVO", num);
	}
	
	public int parUserEventInsert(AdminParUserEventVO vo) {
		return sqlSessionTemplate.insert("UserBoardDAO.parUserEventInsert",vo);
	}
	public List<AdminParUserEventVO> parUserEventSelect(){
		return sqlSessionTemplate.selectList("UserBoardDAO.parUserEventSelect");
	}
	public int parEventCheck(AdminParUserEventVO vo) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.parEventCheck",vo);
	}
	
	public UserReserveVO userReserveFinish(String merchantUid) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.userReserveFinish",merchantUid);
	}
	
	public List<AdminParUserEventVO> participantList(int num){
		return sqlSessionTemplate.selectList("UserBoardDAO.participantList", num);
	}
	
	public AdminEventVO eventNumVo(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.eventNumVo",num);
	}
	public UserReserveVO movieDetailChart(UserReserveVO vo) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.movieDetailChart",vo);
	}
	
	public UserVO userRankEarnPoint(String id) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.userRankEarnPoint",id);
	}
	
	public int userPointInsert(UserDetailVO vo) {
		return sqlSessionTemplate.update("UserMovieDAO.userPointInsert",vo);
	}
	
	public UserDetailVO userPointSelect(UserDetailVO vo) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.userPointSelect",vo);
	}
	public int moviePeopleTotalCount() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.moviePeopleTotalCount");
	}
	
	public List<UserCouponUseVO> userCouponList(String id){
		return sqlSessionTemplate.selectList("UserMovieDAO.userCouponList", id);
	}
	
	public int usePointReset(String id) {
		return sqlSessionTemplate.update("UserMovieDAO.usePointReset",id);
	}
	public AdminCouponVO couponCancel(AdminCouponVO vo) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.couponCancel",vo);
	}
	
	public List<UserCouponUseVO> couponUseAbleList(UserCouponUseVO vo){
		return sqlSessionTemplate.selectList("UserMovieDAO.couponUseAbleList", vo);
	}
	public List<UserCouponUseVO> couponUseEnAbleList(UserCouponUseVO vo){
		return sqlSessionTemplate.selectList("UserMovieDAO.couponUseEnAbleList", vo);
	}
	
	public int couponUseFalse(int cuCode) {
		return sqlSessionTemplate.update("UserMovieDAO.couponUseFalse",cuCode);
	}
	public int couponUseTrue(int cuCode) {
		return sqlSessionTemplate.update("UserMovieDAO.couponUseTrue",cuCode);
	}
	public List<UserReserveVO> myPagePaging(MyPagePaging page){
		return sqlSessionTemplate.selectList("UserBoardDAO.myPagePaging", page);
	}
	
	public int myReserveCount(String id) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.myReserveCount",id);
	}
	
	public List<UserFAQVO> userFaqTotalList(){
		return sqlSessionTemplate.selectList("UserBoardDAO.userFaqTotalList");
	}
	
	public int myCouponCount(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.myCouponCount",id);
	}
	
	public List<AdminEventVO> myJoinEvent(int num){
		return sqlSessionTemplate.selectList("UserMovieDAO.myJoinEvent", num);
	}
	
	public UserReserveVO userReserveDetailView(int num) {
		return sqlSessionTemplate.selectOne("UserMovieDAO.userReserveDetailView",num);
	}
	public List<UserReserveVO> userMyPointLog(String id){
		return sqlSessionTemplate.selectList("UserBoardDAO.userMyPointLog", id);
	}
	
	public AdminRankVO userRankPoint(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.userRankPoint",num);
	}
	
	public int userEarnPoint(UserReserveVO vo) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.userEarnPoint",vo);
	}
	
	public AdminNoticeVO mainNotice() {
		return sqlSessionTemplate.selectOne("UserBoardDAO.mainNotice");
	}
	
	public int commentCount(int num) {
		return sqlSessionTemplate.selectOne("UserBoardDAO.commentCount",num);
	}
}

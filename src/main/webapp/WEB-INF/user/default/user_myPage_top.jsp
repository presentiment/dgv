<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/user/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	var userId = "${userEmail}"
	$(function(){
		console.log("아이디 : "+ userId)
		
		$.ajax({
			method:"POST",
			url:"/userMyPageTopInfo.do",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify({"user_id":userId}),
			success:function(result){
				console.log(result)
				var userVo = JSON.parse(result)
				console.log(userVo.user_email)

				$("#userEmail").val(userVo.user_email)
			}
		})
	})
</script>
<!DOCTYPE html>
<div class="myPage-sect-common">    
                        <div class="mydgv-info-wrap">
                            <div class="sect-person-info">
                            <div class="myPage-title-box">
                                <h2 class="myPage-top">My Dgv</h2>
                                  <img src="${pageContext.request.contextPath }/resources/images/default_profile.gif"/>   
                            </div >
                                <div class="myPage-box-contents  newtype">
                                    <div class="person-info">
                                        <strong>${userID}님</strong>
                                       	<em>${userEmail}</em>
                                        <span>닉네임 :
                                            <i>닉네임을 설정해주세요.</i>
                                        </span>
                                        <button id="myPage-change-info" type="button" onclick="location.href='/myPage_checkData.do'" title="새창열림">나의 정보 변경</button>
                                    </div>
                                    <div class="myPage-grade-info">
                                       <div class="myPage-grade-title">
                                          <span>MY GRADE</span>
                                       </div>
                                        <div class="myPage-info-box">
                                           <p> Grade :</p>
                                           
                                        </div>
                                        <button type="button" id="myPage-view_usergrade" class="myPage-round black">
                                            <span>MY 지난등급이력 보기</span>
                                        </button>
                                    <div class="myPage-benefit-info">
                                      <div class="myPage-coupon">
                                      <div class="myPage-coupon-title">
                                          <span>MY COUPON</span>
                                          </div>
                                            <div class="myPage-coupon-count">
                                                  <strong>DGV 할인쿠폰</strong>
                                                  <span><em>0</em>개</span>
                                             </div>
                                        </div>
                                   </div>


                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
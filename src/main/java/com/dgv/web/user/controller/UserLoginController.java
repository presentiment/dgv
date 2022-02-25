package com.dgv.web.user.controller;

import static org.junit.Assert.assertThat;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class UserLoginController {

	private final UserService userService;


	// @RequestMapping("/login.do")
//	public String login() {
//		return "/login/user_login";
//	}
	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}

	// 로그인 페이지
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("userVo") UserVO userVo) {
		return "/login/user_loginForm";
	}

	// 로그인 처리
	@PostMapping("/login.do")
	@ResponseBody
	public String loginPOST(@RequestBody UserVO userVO, HttpSession session, Model model) {
		System.out.println("id : "+ userVO.getUser_id());
		System.out.println("pw : "+ userVO.getUser_pw());
		UserVO userId = userService.login(userVO);
		
		System.out.println(BCrypt.checkpw(userVO.getUser_pw(), userId.getUser_pw()));
		System.out.println("TEST 1 : "+userId.getUser_pw() );
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		if(userVO.getUser_id().equals(userId.getUser_id())&&BCrypt.checkpw(userVO.getUser_pw(), userId.getUser_pw())) {
			System.out.println("로그인 성공!!");
			jsonObject.addProperty("msg", "SUCCESS");
			session.setAttribute("userID", userId.getUser_name());
			System.out.println(jsonObject);		
		}else { 
			System.out.println("로그인 실패");
<<<<<<< HEAD
			return "/login/user_loginForm";
		} else {
			httpSession.setAttribute("userId", userVO.getUser_id());
			model.addAttribute("user", userVo);
			model.addAttribute("userId", userVO.getUser_id());
			model.addAttribute("userName", userVo.getUser_name());
			System.out.println("로그인 성공");
			 return "/login/user_login";
=======
			jsonObject.addProperty("msg", "FAIL");
			System.out.println(jsonObject);		
>>>>>>> e8d06dd947be5e2e2c1cbb9c60c1103f5c3b1527
		}
		String jsonResult = gson.toJson(jsonObject);
		
		return jsonResult;
 	}
	
	// 로그아웃 처리
	@RequestMapping("/logout.do")
	public String userLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return"redirect:loginForm.do";
	}
}

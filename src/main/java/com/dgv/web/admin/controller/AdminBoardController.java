package com.dgv.web.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.vo.AdminNoticeVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class AdminBoardController {
	
	@Autowired
	private AdminMovieService adminMovieService;
	

	@RequestMapping("/adminNotice.mdo")
	public String adminNotice(Model model) {
		
		model.addAttribute("noticeList", adminMovieService.noticeList());
		return "/board/admin_board_notice";
	}
	//공지사항 등록창 
		@RequestMapping("/adminNoticeRegister.mdo")
		public String adminNoticeRegister() {
			return "/board/admin_board_notice_register";
		}
		
		@PostMapping("/InsertNotice.mdo")
		@ResponseBody
		public String insertNotice(@RequestBody AdminNoticeVO vo) {
			
			int num = adminMovieService.insertNotice(vo);
			System.out.println("내용" +vo.getNotice_text());
			
			Gson gson = new Gson();
			JsonObject jsonObject =new JsonObject();
			
			if(num ==0) {
				System.out.println("등록 실패");
				jsonObject.addProperty("msg", "FAIL");
			}else {
				System.out.println("등록 성공!");
				jsonObject.addProperty("msg", "SUCCESS");
			}
			String jsonResult = gson.toJson(jsonObject);
			return jsonResult;
		}
		
	
	
	@RequestMapping("/adminEnquriy.mdo")
	public String adminEnquriy() {
		return "/board/admin_board_enquriy";
	}
	
	@RequestMapping("/adminAnswerOk.mdo")
	public String adminAnswer() {
		return "/board/admin_board_answerOk";
	}
	
	@RequestMapping("/adminChart.mdo")
	public String adminChart() {
		return "/movie/admin_movie_chart";
	}
	
	@RequestMapping("/adminBest.mdo")
	public String adminBest() {
		return "/movie/admin_movie_best";
	}
}

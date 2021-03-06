package org.gidal.waiting.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.gidal.reserve.domain.ReserveVO;
import org.gidal.review.service.ReviewService;
import org.gidal.waiting.domain.WaitingVO;
import org.gidal.waiting.service.WaitingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/waiting/")
public class WaitingController {


	@Inject private WaitingService service;
	@Inject private ReviewService re;


	/**
	 * 웨이팅 페이지 이동
	 *
	 * 로그인 세션을 이용하여, 이름과 전화번호를 세션에 넣어주어 페이지 이동.
	 *
	 * @param int, HttpSession, Model
	 * @return Model
	 * @throws
	 */

	@RequestMapping(value = "/waiting", method = RequestMethod.GET)
	public String enterprise_details(@RequestParam("enterprise_code") int code, HttpSession session, Model model) {

		String email = (String)session.getAttribute("LOGIN");

		if (email == null) {
			return "redirect:/authentication/signIn";
		}else {

		session.setAttribute("user", service.selectOne(email));
		model.addAttribute(service.selectOne(code));
		model.addAttribute("list",service.waiting_view(code));
		model.addAttribute("count",service.waiting_count(code));


		return "/waiting/waiting";
		}
	}

	/**
	 * 웨이팅 처리 메소드
	 *
	 * @param WaitingVO
	 * @return String
	 * @throws
	 */

	@RequestMapping(value = "/waiting_insert", method = RequestMethod.GET)
	public String waiting_insert(HttpSession session, WaitingVO vo) {
		
		String email = (String)session.getAttribute("LOGIN");	
		int result = service.duplicationWaiting(email);
		
		if(result == 0) {
			service.waiting_insert(vo);
			return "/waiting/success";			
		}else {
			return "/waiting/fail";
		}
	
	}
	
	@RequestMapping(value = "/waiting_cancel", method = RequestMethod.GET)
	public String waiting_cancel(String check, String waiting_code) throws Exception {
		
		if(check.equals("user")) {
			service.waiting_cancel(waiting_code);
			return "redirect:/waiting/cancelResult";
		} else {
			return "redirect:/";
		}
		
	}

	@RequestMapping(value = "/cancelResult", method = RequestMethod.GET)
	public String cancelResult() throws Exception {

		return "/waiting/cancelResult";
	}




}

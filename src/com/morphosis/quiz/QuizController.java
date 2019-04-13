package com.morphosis.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuizController {
	@RequestMapping("/questions")
	public String listCustomers(Model theModel) {
		
		return "questions";
	}
	
	@RequestMapping("/")
	public String home(Model theModel) {
		
		return "index";
	}
	@RequestMapping("/myservlet")
	public String scoreCount(Model theModel) {
		
		return "myservlet";
	}
	
	@RequestMapping("/q1")
	public String question1(Model theModel) {
		
		return "q1";
	}
	
	@RequestMapping("/q2")
	public String question2(Model theModel) {
		
		return "q2";
	}
	
	@RequestMapping("/q3")
	public String question3(Model theModel) {
		
		return "q3";
	}
	@RequestMapping("/score")
	public String score(Model theModel) {
		
		return "score";
	}


	
}

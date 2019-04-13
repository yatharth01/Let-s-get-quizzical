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
}

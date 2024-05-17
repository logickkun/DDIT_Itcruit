package kr.co.itcruit.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/service")
public class FooterMenu {
	
	@RequestMapping(value = "/company", method = RequestMethod.GET)
	public String company() {
		return "footerMenu/company";
	}
	
	
	@RequestMapping(value = "/privacyPolicy", method = RequestMethod.GET)
	public String privacyPolicy() {
		return "footerMenu/privacyPolicy";
	}
	
	@RequestMapping(value = "/provisionGG", method = RequestMethod.GET)
	public String provisionGG() {
		return "footerMenu/provisionGG";
	}

}

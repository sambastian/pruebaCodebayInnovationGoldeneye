package com.codebay.goldeneye.controllers;

import java.util.Arrays;

import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.GetMapping;  
import org.springframework.web.bind.annotation.PostMapping;

import com.codebay.goldeneye.beans.EmailBean;
import com.codebay.goldeneye.enums.OfficeLocationEnum;

@Controller
public class WebController {  
	
    @GetMapping("/")
    public String index() {
        return "redirect:/email_form";
    }

    @GetMapping("/email_form")
    public String formGet(Model model) {
    	model.addAttribute("officeLocationList", Arrays.asList(OfficeLocationEnum.values()));
        return "index";
    }

    @PostMapping("/email_form")
    public String formPost(EmailBean email, Model model) {
    	model.addAttribute("officeLocationList", Arrays.asList(OfficeLocationEnum.values()));
        model.addAttribute("email", reviewEmail(email));
        return "index";
    }
    
    public String reviewEmail(EmailBean email) {
    	// TODO Implement the API when ready
    	return email.toString();
    }
    
}
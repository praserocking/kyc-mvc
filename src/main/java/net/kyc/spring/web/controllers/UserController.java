package net.kyc.spring.web.controllers;

import javax.servlet.http.HttpServletRequest;

import net.kyc.errorcodes.ErrorCodes;
import net.kyc.spring.web.candidate.model.Poll;
import net.kyc.spring.web.feedback.model.Feedback;
import net.kyc.spring.web.feedback.service.FeedbackService;
import net.kyc.spring.web.user.model.User;
import net.kyc.spring.web.user.service.UserService;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FeedbackService feedbackService;
	
	@RequestMapping(value="/user/loginpage")
	public String loginpage(){
		return "login";
	}
	
	@RequestMapping(value="/feedback")
	public String feedBackPage(){
		return "feedback";
	}
	
	@RequestMapping(value="/user/poll", method = RequestMethod.POST)
	public @ResponseBody String getPoll()
	{
		String message;
		message="{\"question\":\"Next PM\",\"options\":\"2\",\"option\":{\"Rahul Gandhi\":23,\"Narendra Modi\":49}}";
		return message;
	}
	
	@RequestMapping(value="/user/feedback", method = RequestMethod.POST)
	@ResponseBody
	public String feedBack(@RequestParam(value="name", required=true) String name, @RequestParam(value="age", required=true) int age,
			@RequestParam(value="gender", required=true) String gender,@RequestParam(value="email", required=true) String email,
			@RequestParam(value="feedback", required=true) String feedBack, @RequestParam(value="recaptcha_challenge_field", required=true) String challenge, 
			@RequestParam(value="recaptcha_response_field", required=true) String uresponse, HttpServletRequest request){
		String message = "";
		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey("6Lc7au4SAAAAAF4LbtPwGI59Ysvk6yG0x1gdNfQz ");
		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(request.getRemoteAddr(), challenge, uresponse);
		if(reCaptchaResponse.isValid()){
			Feedback feedback = new Feedback();
			feedback.setAge(age);
			feedback.setEmail(email);
			feedback.setFeedback(feedBack);
			feedback.setGender(gender);
			feedback.setName(name);
			feedbackService.saveFeedback(feedback);
			message = "{state:\'success\'}";
		}
		else{
			message = "{state:\'Invalid Captcha\'}";
		}
		return message;
	}
	
	
	@RequestMapping(value="/user/login")
	public String login(@RequestParam("user_identifier") String userIdentifier,
			@RequestParam("password") String password, WebRequest request){
		User user = userService.validateUserLogin(userIdentifier, password);
		if(user == null){
			request.setAttribute("error", "0", WebRequest.SCOPE_REQUEST);
			request.setAttribute("errorMessage", ErrorCodes.userLoginError, WebRequest.SCOPE_REQUEST);
		}
		else{
			request.setAttribute("userName", user.getUserName(), WebRequest.SCOPE_SESSION);
			request.setAttribute("firstName", user.getFirstName(), WebRequest.SCOPE_SESSION);
		}
		
		return "login";
	}
	
	@RequestMapping(value="/user/logout")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "login";
	}

	@RequestMapping(value="/user/register")
	public String register(){
		return "/users/register";
	}
	
	@RequestMapping(value="/user/add", method=RequestMethod.POST)
	public String addUser(	@RequestParam(value="email", required=true) String email,
			@RequestParam(value="password", required=true) String password,
			@RequestParam(value="dob", required=true) String dob,
			@RequestParam(value="user_name", required=true) String userName,
			@RequestParam(value="gender", required=true) String gender,
			@RequestParam(value="mobile", required=true) String mobile,
			Model model){
		User user = new User();
		user.setUserName(userName);
		//user.setUserId(userId);
		user.setPassword(password);
		user.setEmail(email);
		user.setGender(gender);
		user.setDob(dob);
		String status = userService.addUser(user);
		System.out.println(status);
		model.addAttribute("status", status);
		return "login.jsp";
	}	
}

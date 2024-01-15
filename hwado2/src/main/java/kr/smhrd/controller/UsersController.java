package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Users;
import kr.smhrd.entity.WISHLIST;
import kr.smhrd.mapper.UsersMapper;

@Controller
public class UsersController {
	
	@Autowired 
	private UsersMapper usersMapper;
	
	//메인 페이지
	@RequestMapping("/")
	public String mainPage() {
		return "main";
	}
	
	// 로그인 페이지
	@RequestMapping("/signin")
	public String signin() {
		return "signin";
	}
	
	// 회원가입 
	@RequestMapping("/usersInsert")
	public String usersInsert(Users users, Model model) {
		System.out.println(users.toString());
		usersMapper.usersInsert(users); // 인터페이스는 추상메소드만 존재
		model.addAttribute("user_email",users.getUser_email());
		return "signin";
	}
	
	//Email 중복체크
	@RequestMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("inputE") String inputE) {
		System.out.println("[emailCheck]");
		Users users = usersMapper.emailCheck(inputE); //인터페이스 안의 추상메소드
		
		if(users != null) {
			//사용 불가능한 이메일
			return 0;
		}else {
			//사용 가능한 이메일
			return 1;
		}
	}
	

	//로그인
	@RequestMapping("/userSelect")
    public String userSelect(Users users, HttpSession session) {
        System.out.println("로그인 시도: Email: " + users.getUser_email() + ", Password: " + users.getUser_pw());
        Users userLogin = usersMapper.userSelect(users);
        if (userLogin != null) {
        	System.out.println(userLogin.toString());
            session.setAttribute("userLogin", userLogin);
            
         // 관심 작품 불러오기
            List<WISHLIST> wishList = usersMapper.getWish(userLogin.getUser_email());
            session.setAttribute("wishList", wishList);
            System.out.println(wishList.toString());
            
            return "main"; // 로그인 성공 시 리다이렉트
        } else {
            return "redirect:/signin"; // 로그인 실패 시 리다이렉트
        }
    }
	
	

	// 회원관리 페이지로 이동 - 바로 회원관리 수정하는 곳으로 감
		@RequestMapping("/user_management") 
		public String user_management(@RequestParam(value = "page", defaultValue = "0") int page,Model model) {
			List<Users> list = usersMapper.user_management();
			model.addAttribute("list",list);
			
			 int maxpage = 0;
				
				if (list.size() %9 == 0) {
					maxpage = list.size()/9-1;
				} else {
					maxpage = list.size()/9 ;
				}
				
				System.out.println("maxpage : "+maxpage);
				System.out.println("page : " + page);
				if(page < 0) {
					page = 0;
				} else if (page > maxpage) {
					page = maxpage;
				}
				
				System.out.println("page : " + page);
				
				model.addAttribute("pageN", page);
			    model.addAttribute("maxpage", maxpage);
			
			return "user_management";
		}
	
	
	// 회원영구정지 시키기
		@RequestMapping("/stopUser")
		public String stopUser(@RequestParam("email") String email) {
			usersMapper.stopUser(email);
			return "redirect:/user_management";
		}	
	
	// 회원영구정지풀기
		@RequestMapping("/unfreezeUser")
		public String unfreezeUser(@RequestParam("email") String email) {
			usersMapper.unfreezeUser(email);
			return "redirect:/user_management";
		}
		
	
	
	
	
	
	
	
	
	
	
	
}//class

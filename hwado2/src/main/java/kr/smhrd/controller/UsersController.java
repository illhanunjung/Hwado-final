package kr.smhrd.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.entity.ArtworkImage;
import kr.smhrd.entity.IMAGES;
import kr.smhrd.entity.Portfolios;
import kr.smhrd.entity.Users;
import kr.smhrd.entity.WISHLIST;
import kr.smhrd.mapper.ArtworksMapper;
import kr.smhrd.mapper.UsersMapper;

@Controller
public class UsersController {
	
	@Autowired
	private ArtworksMapper mapper;
	@Autowired 
	private UsersMapper usersMapper;
	
	//메인 페이지
	@RequestMapping("/")
	public String mainPage(Model model) {
		List<ArtworkImage> monthArtworks = mapper.getArtworks_Month();
		List<IMAGES> recentImages = mapper.getRecentArtworkImages();
		model.addAttribute("monthArtworks", monthArtworks);
		model.addAttribute("recentImages", recentImages);
		
		mapper.artworksdeadline();
		mapper.auctiondeadline();
		return "main";
	}
	
	// 로그인 페이지
	@RequestMapping("/signin")
	public String signin() {
		return "signin";
	}
	// 회원수정 페이지
	@RequestMapping("/user_edit")
	public String user_edit() {
		return "user_edit";
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
            
            return "redirect:/"; // 로그인 성공 시 리다이렉트
        } else {
            return "redirect:/signin"; // 로그인 실패 시 리다이렉트
        }
    }
	
	// 개인정보 수정
	@RequestMapping("/updateUser")
	public String updateUser(Users users,Model model, HttpSession session) { 
		System.out.println("들어왔음 : "+users.toString());
		
		
		 usersMapper.updateUser(users); 
		 
		 Users userLogin = usersMapper.userSelect(users);
		 session.setAttribute("userLogin", userLogin);
		 System.out.println(userLogin.toString());
		return "redirect:/";
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
		
	
	
	// 마이페이지 이동
		@RequestMapping("/myPage")
		public String myPage() {
			return "mypage";
		}
	
	
	// 작가페이지 이동
		@RequestMapping("/artist")
		public String artist(Model model) {
			List<ArtworkImage> Author_page = usersMapper.Author_page();
			model.addAttribute("Author_page", Author_page);
			return "artist";
		}
	
	
	// 로그아웃
		@RequestMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			
			return "redirect:/";
		}
	
	
		// 예술가 승인	
		@RequestMapping("/approvalPf")
		public String approvalPf(@RequestParam("user_email") String email) {
			usersMapper.approvalPf(email);
			usersMapper.updateArtist(email);
			return "redirect:/artist_approval";
		}	
		
		// 예술가 거절	
		@RequestMapping("/refusePf")
		public String refusePf(@RequestParam("user_email") String email) {
		usersMapper.refusePf(email);
		return "redirect:/artist_approval";
				}	
		
		
		// 회원관리 검색 
		@GetMapping("/user_management_search")
		 public String user_management_search(@RequestParam("query") String query, Model model) {
	      		System.out.println(query);
				 List<Users> users = usersMapper.searchByQuery(query);
			
				 model.addAttribute("users", users);
				 
	        return "user_management_search";
				}

		  //작가 등록 페이지
		  
		  @RequestMapping("/artist_registration")
		  public String artist_registration(HttpSession session, Model model) {
		  Users userLogin = (Users) session.getAttribute("userLogin");
		    if (userLogin != null) {
		        model.addAttribute("user", userLogin);
		    }
		    return "artist_registration";
		}
		  
		//포폴 페이지
		  @RequestMapping("/portfolio")
		  public String  portfolio(@RequestParam("user_email") String user_email, Model model) {
			  Portfolios portfolio = mapper.detailport(user_email);	
				model.addAttribute("portfolio",portfolio);
				return "portfolio";
		}
			// 작가 등록
			@SuppressWarnings("deprecation")
			@RequestMapping("/regiPortfolio")
			public String regiPortfolio(HttpServletRequest request, HttpSession session,  Model model) {

				Users userLogin = (Users) session.getAttribute("userLogin");

				MultipartRequest multi = null;

				if (userLogin == null) {
					return "redirect:/signin";
				}
				DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy();
				String savePath = request.getRealPath("./resources/portfolios");
				
		        
				int maxSize = 1024 * 1024 * 10; // 10MB
				String enc = "UTF-8";

				try {
					multi = new MultipartRequest(request, savePath, maxSize, enc, new DefaultFileRenamePolicy());

					String pf_title = multi.getParameter("pf_title");
					String pf_desc = multi.getParameter("pf_desc");
					String pf_file1 = multi.getFilesystemName("pf_file1");
					String pf_file2 = multi.getFilesystemName("pf_file2");
					String pf_file3 = multi.getFilesystemName("pf_file3");

					Portfolios portfolio = new Portfolios();
					portfolio.setUser_email(userLogin.getUser_email());
					portfolio.setPf_title(pf_title);
					portfolio.setPf_desc(pf_desc);
					portfolio.setPf_file1(pf_file1);
					portfolio.setPf_file2(pf_file2);
					portfolio.setPf_file3(pf_file3);
					
					
					
					// 포폴 작품 등록 mapper
					int cnt_re = usersMapper.regiPortfolio(portfolio);
					;

					if (cnt_re > 0) {
						System.out.println("포폴 등록 성공");
						
					    // 업로드된 대표 파일이 실제로 존재하는지 확인
					    File file1 = new File(savePath, pf_file1);
					    if (file1.exists() && !file1.isDirectory()) {
					        System.out.println("파일 업로드 성공: " + pf_file1);
					    } else {
					        System.out.println("파일 업로드 실패 또는 파일이 존재하지 않음: " + pf_file1);
					    }


					    session.setAttribute("portfolio", portfolio);
						 
					} else {
						System.out.println("포폴 등록 실패");
					}

				} catch (IOException e) {
					e.printStackTrace();
				}

				System.out.println("성공");
				
				return "redirect:/";
			}
			
			
			// 구매내역 이동
			@RequestMapping("/purchase_history")
			public String purchase_history(Model model , HttpSession session) {
				Users user = (Users)session.getAttribute("userLogin");
				List<ArtworkImage> purchase_history = usersMapper.purchase_history(user.getUser_email());
				model.addAttribute("purchase_history",purchase_history);
				return "purchase_history";
			}
		
		
		
}//class

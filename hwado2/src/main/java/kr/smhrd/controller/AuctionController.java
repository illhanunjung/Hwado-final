package kr.smhrd.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.smhrd.entity.AUCTIONS;
import kr.smhrd.entity.Artworks;
import kr.smhrd.entity.Bidding;
import kr.smhrd.entity.Users;
import kr.smhrd.mapper.ArtworksMapper;

@Controller
public class AuctionController {

	
	@Autowired
	private ArtworksMapper mapper;
	
	
	
	// 경매 입찰 페이지 이동
    @RequestMapping("/auction_bid")
    public String auction_bid(@RequestParam("auc_seq") String auc_seq, Model model) {
        // auc_seq 값을 모델에 추가
        model.addAttribute("auc_seq", auc_seq);
        return "auction_bid"; // auction_bid.jsp로 이동
    }
 // 경매 입찰  정보
    @RequestMapping("/bid_submit")
    public String bidSubmit(Bidding bidding, HttpSession session) {
        Users userLogin = (Users) session.getAttribute("userLogin");
        // Bidding 객체에 사용자 이메일 설정
        bidding.setUser_email(userLogin.getUser_email());
        System.out.println(bidding.toString());
        // 입찰 정보 데이터베이스에 저장
        mapper.insertBid(bidding);

        // 경매 상세 페이지나 확인 페이지로 리다이렉트
        return "redirect:/auction_page";
    }
	
	

	// 경매관리페이지
	@RequestMapping("/auction_management")
	public String auction_management(HttpSession session,Model model) {
		System.out.println("안녕");
	Users user = (Users)session.getAttribute("userLogin");
	System.out.println(user.toString());
	String email = user.getUser_email();
	List<Bidding> bid = mapper.bidList(email);
	model.addAttribute("bid",bid);
	return "auction_management";
	}
	
	// 입찰상세페이지
	@GetMapping("/bid_reason")
	public String bid_reason(@RequestParam("user_email") String user_email ,Model model) {
		Bidding bid = mapper.bidDetail(user_email);	
		model.addAttribute("bid",bid);
		return "bid_reason";
	}
	
	@RequestMapping("/bidder")
	public String bidder(@RequestParam("user_email") String user_email,@RequestParam("auc_seq") int auc_seq) {
		System.out.println(user_email);
		System.out.println(auc_seq);
		
		AUCTIONS auction = new AUCTIONS();
	    auction.setAuc_seq(auc_seq);
	    auction.setBidder_email(user_email);
		
		
		mapper.bidder(auction);	
		mapper.aucStatus(auc_seq);
		
		return "redirect:/auction_management";
	}
	
		// 경매관리페이지 - 유저
		@RequestMapping("/auction_management_user")
		public String auction_management_user(HttpSession session,Model model) {
		System.out.println("안녕");
		Users user = (Users)session.getAttribute("userLogin");
		System.out.println(user.toString());
		String email = user.getUser_email();
		List<Artworks> art = mapper.bidList_user(email);
		model.addAttribute("art",art);
		
		List<AUCTIONS> bid = mapper.aucList_user(email);
		model.addAttribute("bid",bid);
		
		return "auction_management_user";
		}
}

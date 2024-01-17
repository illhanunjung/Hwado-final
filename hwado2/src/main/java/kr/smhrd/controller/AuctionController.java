package kr.smhrd.controller;


import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.entity.AUCTIONS;
import kr.smhrd.entity.ArtworkImage;
import kr.smhrd.entity.Artworks;
import kr.smhrd.entity.Bidding;
import kr.smhrd.entity.Cart;
import kr.smhrd.entity.IMAGES;
import kr.smhrd.entity.Portfolios;
import kr.smhrd.entity.Users;
import kr.smhrd.entity.WISHLIST;
import kr.smhrd.mapper.ArtworksMapper;
import kr.smhrd.mapper.UsersMapper;

@Controller
public class AuctionController {

	
	@Autowired
	private ArtworksMapper mapper;
	
	@Autowired 
	private UsersMapper usersMapper;
	
	
	
	

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
}
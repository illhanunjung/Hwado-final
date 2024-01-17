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
import kr.smhrd.entity.Cart;
import kr.smhrd.entity.IMAGES;
import kr.smhrd.entity.Portfolios;
import kr.smhrd.entity.Users;
import kr.smhrd.entity.WISHLIST;
import kr.smhrd.mapper.ArtworksMapper;
import kr.smhrd.mapper.UsersMapper;

@Controller
public class ArtworksController {
	
	@Autowired
	private ArtworksMapper mapper;
	
	@Autowired 
	private UsersMapper usersMapper;
		
	// 상품 등록 페이지 이동
	@RequestMapping("/prd_regi_page")
	public String prd_regi_page() {
		return "product_registration";
	}
	
	
	//경매 등록 페이지 이동
	@RequestMapping("/auction_regi_page")
	public String auction_regi_page() {
		return "auction_registration";
	}
	
	// 일반 작품 출력 페이지 이동
		@RequestMapping("/product_page")
		public String product_page(@RequestParam(value = "page", defaultValue = "0") int page , Model model, @RequestParam(value = "category_seq", defaultValue = "0") int category_seq) {
			
			List<Artworks> artList = null;
			List<IMAGES> imgList = null;
			
			if(category_seq == 0) {
				artList = mapper.artList();
				imgList = mapper.imgList();
			} else {
				artList = mapper.artCategory(category_seq);
				imgList = mapper.imgCategory(category_seq);			
			}
			
			model.addAttribute("artList", artList);
			model.addAttribute("imgList", imgList);
			
			System.out.println(artList.size());
			System.out.println(imgList.size());
			
			ArrayList<Users> artistList = new ArrayList<Users>();
			
			for(Artworks art : artList) {
				artistList.add(mapper.getArtist(art.getUser_email()));
			}
			
			System.out.println(artistList.size());
			
			model.addAttribute("artistList", artistList);
			
			int maxpage = 0;
			
			if (imgList.size() %16 == 0) {
				maxpage = imgList.size()/16-1;
			} else {
				maxpage = imgList.size()/16 ;
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
			
			return "product";
		}
	
	
	//일반 상품 등록
	@RequestMapping("/prd_regi")
	public String prd_regi( Artworks art, HttpServletRequest request) {
		MultipartRequest multi = null;
	
		
		String savePath = request.getRealPath("./resources/artworks");
		
		int maxSize = 1024 * 1024 *10; //10MB
		
		String enc = "UTF-8";
		
		DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy();
		
		try {
			multi = new MultipartRequest(request, savePath, maxSize, enc, dftrp);
			String user_email = multi.getParameter("user_email");
			String file1 = multi.getFilesystemName("file1");
			String desc1 = multi.getParameter("desc1");
			String aw_name = multi.getParameter("aw_name");
			int aw_price = Integer.parseInt(multi.getParameter("aw_price"));
			int category_seq = Integer.parseInt(multi.getParameter("category_seq"));
			String file2 = multi.getFilesystemName("file2");
			String desc2 = multi.getParameter("desc2");
			String file3 = multi.getFilesystemName("file3");
			String desc3 = multi.getParameter("desc3");
			String file4 = multi.getFilesystemName("file4");
			String desc4 = multi.getParameter("desc4");
			
			
			art = new Artworks(user_email, aw_name, aw_price, category_seq, "일반");
			System.out.println(art.toString());
			
			//작품 등록 mapper
			int cnt_a =mapper.artRegi(art);
			
			if(cnt_a >0) {
				System.out.println("작품 등록 성공");
			} else {
				System.out.println("작품 등록 실패");
			}
			
			
			String img = savePath + "/" + file1;
			
			 BufferedImage image = ImageIO.read(new File(img));
             Color color = new Color(image.getRGB(0, 0)); // 색상을 추출
     
             // rgb 추출
             int red = color.getRed();
             int green = color.getGreen();
             int blue = color.getBlue();
             
             String img_rgb = red+"/"+green+"/"+blue;
             
             //작품 seq 추출
             int seq = mapper.getAwSeq(art);
             
             IMAGES img1 = new IMAGES(seq, file1, img_rgb, "0", desc1);
             System.out.println(img1.toString());
             
             
             
             
             
             // 작품 이미지 등록
             int cnt_i = mapper.imgRegi(img1);
             
             if(cnt_i >0) {
 				System.out.println("이미지 등록 성공");
 			} else {
 				System.out.println("이미지 등록 실패");
 			}
             
             if(file2 != null) {
            	 IMAGES img2 = new IMAGES(seq, file2, "1", desc2);
            	 mapper.imgRegi(img2);
             }
             if(file3 != null) {
            	 IMAGES img3 = new IMAGES(seq, file3, "1", desc3);
            	 mapper.imgRegi(img3);
             }
             if(file4 != null) {
            	 IMAGES img4 = new IMAGES(seq, file4, "1", desc4);
            	 mapper.imgRegi(img4);
             }
             
			
			
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		System.out.println("성공");
		
		return "auction_registration";
	}
	
	
	// 경매 등록
	@RequestMapping("/auction_regi")
	public String auction_regi(Artworks art, HttpServletRequest request) {
		MultipartRequest multi = null;
		
	
		
		String savePath = request.getRealPath("./resources/artworks"); 
		
		int maxSize = 1024 * 1024 *10; //10MB
		
		String enc = "UTF-8";
		
		DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy();
		
		try {
			multi = new MultipartRequest(request, savePath, maxSize, enc, dftrp);
			
			String user_email = multi.getParameter("user_email");
			String file1 = multi.getFilesystemName("file1");
			String desc1 = multi.getParameter("desc1");
			String aw_name = multi.getParameter("aw_name");
			int aw_price = Integer.parseInt(multi.getParameter("aw_price"));
			String auc_ended_at = multi.getParameter("auc_ended_at");		
			String file2 = multi.getFilesystemName("file2");
			String desc2 = multi.getParameter("desc2");
			String file3 = multi.getFilesystemName("file3");
			String desc3 = multi.getParameter("desc3");
			String file4 = multi.getFilesystemName("file4");
			String desc4 = multi.getParameter("desc4");
			
			
			art = new Artworks(user_email, aw_name, aw_price, 5, "경매");
			System.out.println(art.toString());
			
			//작품 등록 mapper
			int cnt_a =mapper.artRegi(art);
			
			if(cnt_a >0) {
				System.out.println("작품 등록 성공");
			} else {
				System.out.println("작품 등록 실패");
			}
			
			
			String img = savePath + "/" + file1;
			
			 BufferedImage image = ImageIO.read(new File(img));
             Color color = new Color(image.getRGB(0, 0)); // 색상을 추출
     
             // rgb 추출
             int red = color.getRed();
             int green = color.getGreen();
             int blue = color.getBlue();
             
             String img_rgb = red+"/"+green+"/"+blue;
             
             //작품 seq 추출
             int seq = mapper.getAwSeq(art);
             
             // 경매 상태 경매로 바꾸기
             mapper.auctionUpdate(seq);
             
             

             
             IMAGES img1 = new IMAGES(seq, file1, img_rgb, "0", desc1);
             System.out.println(img1.toString());
             
             
             
             // 작품 이미지 등록
             int cnt_i = mapper.imgRegi(img1);
             
             if(cnt_i >0) {
 				System.out.println("이미지 등록 성공");
 			} else {
 				System.out.println("이미지 등록 실패");
 			}
             
             if(file2 != null) {
            	 IMAGES img2 = new IMAGES(seq, file2, "1", desc2);
            	 mapper.imgRegi(img2);
             }
             if(file3 != null) {
            	 IMAGES img3 = new IMAGES(seq, file3, "1", desc3);
            	 mapper.imgRegi(img3);
             }
             if(file4 != null) {
            	 IMAGES img4 = new IMAGES(seq, file4, "1", desc4);
            	 mapper.imgRegi(img4);
             }
             
             //경매 등록
             AUCTIONS auction = new AUCTIONS(seq, auc_ended_at);
             int cnt = mapper.auctionRegi(auction);
             
             if(cnt >0) {
            	 System.out.println("경매 등록 성공");
             } else {
            	 System.out.println("경매 등록 실패");
             }
             
             
			
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		System.out.println("성공");
		
		return "auction";
	}
	
	// 상품 상세 보기
	@RequestMapping("/product_detail")
	public String product_detail(@RequestParam("aw_seq") int aw_seq ,Model model) {
		String similar_images = "";
		System.out.println("성공");
		Artworks art = mapper.getArt(aw_seq);
		model.addAttribute("art", art);
		
		// 상품 이미지 불러오기
		List<IMAGES> images = mapper.getimges(art);
		model.addAttribute("images", images);
		
		// 작가 정보
		Users artist = mapper.getArtist(art.getUser_email());
		model.addAttribute("artist", artist);
		
		// 추천 이미지
		 try {
	            // 파이썬 Flask 서버의 URL 지정
	            String serverUrl = "http://211.227.224.159:9001/get_similar_images";

	            // 요청을 위한 JSON 데이터 설정
	            String jsonData = "{\"query_image_path\": \"C:/eGovFrame-4.0.0/workspace.edu/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/hwado4/resources/artworks/"+images.get(0).getImg_filename()+"\"}";

	            // 연결 생성
	            URL url = new URL(serverUrl);
	            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	            connection.setRequestMethod("POST");
	            connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
	            
	            connection.setDoOutput(true);

	            // JSON 데이터를 요청에 기록
	            try (OutputStream os = connection.getOutputStream()) {
	                byte[] input = jsonData.getBytes(StandardCharsets.UTF_8);
	                os.write(input, 0, input.length);
	            }
	            

	            // 응답 받기
	            int responseCode = connection.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) {
	                // 응답 처리
	                System.out.println("응답: " + connection.getResponseMessage());
	                
	             // 응답을 읽어옴
	                try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
	                    String inputLine;
	                    StringBuilder response = new StringBuilder();

	                    while ((inputLine = in.readLine()) != null) {
	                        response.append(inputLine);
	                    }

	                    // 응답 내용 출력
	                    similar_images = response.toString();
	                    similar_images = StringEscapeUtils.unescapeJava(similar_images);
	                    
	                    
	                    
	                }
	            } else {
	                System.out.println("HTTP 요청이 오류 코드와 함께 실패했습니다: " + responseCode);
	            }

	            // 연결 닫기
	            connection.disconnect();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		 System.out.println(similar_images);
         
         
		 similar_images = similar_images.split("\\[")[1];
		 similar_images = similar_images.split("\\]")[0];
         System.out.println(similar_images);
         
         // 비슷한 이미지 20개
         String[] similar_img_all = similar_images.split(",");
         
         // 상세 이미지 최대 3개 가져오기
         List<String> showArtImg = mapper.showImg(aw_seq);
         
         // 현재 보고 있는 작품 이미지 제거
         ArrayList<String> similar_img_list = new ArrayList<String>();
         List<Artworks> artList = mapper.artAllList();
     	 List<IMAGES> imgList = mapper.imgAllList();
        		 
         for(String i : similar_img_all) {
        	 i = i.replace("\"", "");
        	 
        	for (IMAGES img : imgList) {
        		int k = 0;
        			for(int j = 0; j < showArtImg.size(); j++) {
	        			 if(!i.equals(showArtImg.get(j))) {
	            			 k++;
	            		 }
        		 }
        		if(k==showArtImg.size() && i.equals(img.getImg_filename())) {
           			 
           			 similar_img_list.add(i);
           		 }
        		
        		if(similar_img_list.size() == 5) {
       			 
       			 break;
       		 }
        	}
        	 
        	 if(similar_img_list.size() == 5) {
    			 
    			 break;
    		 }
        	 
         }
         
         ArrayList<Artworks> similar_art = new ArrayList<Artworks>();
         
         
         for(String i : similar_img_list) {
        	 
        	 for(IMAGES img : imgList) {
        		 if(i.equals(img.getImg_filename())) {;
        			 similar_art.add(mapper.getArt(img.getAw_seq()));
        		 }
        		 
        	 }
         }
         
         System.out.println(similar_img_list.size());
         System.out.println(similar_art.size());
         
        
         model.addAttribute("similar_img_list", similar_img_list);
        model.addAttribute("similar_art", similar_art);
		
		return "product_detail";
	}

	//경매 페이지 이동
	@RequestMapping("/auction_page")
	public String auction_page(@RequestParam(value = "page", defaultValue = "0") int page , Model model) {
		List<Artworks> auctionList = mapper.auctionList();
		List<IMAGES> auctionImgList = mapper.auctionImgList();
		List<AUCTIONS> auctioninfo = mapper.auctioninfo();
		
		model.addAttribute("auctionList", auctionList);
		model.addAttribute("auctionImgList", auctionImgList);
		model.addAttribute("auctioninfo", auctioninfo);
		
		ArrayList<Users> artistList = new ArrayList<Users>();
		
		for(Artworks art : auctionList) {
			artistList.add(mapper.getArtist(art.getUser_email()));
		}
		
		model.addAttribute("artistList", artistList);
		
		System.out.println(auctionList.size());
		System.out.println(auctionImgList.size());
		System.out.println(auctioninfo.size());
		
		int maxpage = 0;
		
		if (auctionImgList.size() %16 == 0) {
			maxpage = auctionImgList.size()/16-1;
		} else {
			maxpage = auctionImgList.size()/16 ;
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
		
		return "auction";
	}
	
	// 경매 상세 페이지
	@RequestMapping("/auction_detail")
	public String auction_detail(@RequestParam("aw_seq") int aw_seq ,Model model) {
		String similar_images = "";
		System.out.println("성공");
		
		Artworks art = mapper.getArt(aw_seq);
		model.addAttribute("art", art);
		
		// 상품 이미지 불러오기
		List<IMAGES> images = mapper.getimges(art);
		model.addAttribute("images", images);
		
		// 경매 불러오기
		AUCTIONS auction = mapper.getAuction(aw_seq);
		model.addAttribute("auction", auction);
		
		// 작가 정보
		Users artist = mapper.getArtist(art.getUser_email());
		model.addAttribute("artist", artist);
		
		
		// 추천 이미지
		 try {
	            // 파이썬 Flask 서버의 URL 지정
	            String serverUrl = "http://211.227.224.159:9001/get_similar_images";

	            // 요청을 위한 JSON 데이터 설정
	            String jsonData = "{\"query_image_path\": \"C:/eGovFrame-4.0.0/workspace.edu/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/hwado4/resources/artworks/"+images.get(0).getImg_filename()+"\"}";

	            // 연결 생성
	            URL url = new URL(serverUrl);
	            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	            connection.setRequestMethod("POST");
	            connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
	            
	            connection.setDoOutput(true);

	            // JSON 데이터를 요청에 기록
	            try (OutputStream os = connection.getOutputStream()) {
	                byte[] input = jsonData.getBytes(StandardCharsets.UTF_8);
	                os.write(input, 0, input.length);
	            }
	            

	            // 응답 받기
	            int responseCode = connection.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) {
	                // 응답 처리
	                System.out.println("응답: " + connection.getResponseMessage());
	                
	             // 응답을 읽어옴
	                try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
	                    String inputLine;
	                    StringBuilder response = new StringBuilder();

	                    while ((inputLine = in.readLine()) != null) {
	                        response.append(inputLine);
	                    }

	                    // 응답 내용 출력
	                    similar_images = response.toString();
	                    similar_images = StringEscapeUtils.unescapeJava(similar_images);
	                    
	                    
	                    
	                }
	            } else {
	                System.out.println("HTTP 요청이 오류 코드와 함께 실패했습니다: " + responseCode);
	            }

	            // 연결 닫기
	            connection.disconnect();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		 System.out.println(similar_images);
         
         
		 similar_images = similar_images.split("\\[")[1];
		 similar_images = similar_images.split("\\]")[0];
         System.out.println(similar_images);
         
         // 비슷한 이미지 20개
         String[] similar_img_all = similar_images.split(",");
         
         // 상세 이미지 최대 3개 가져오기
         List<String> showArtImg = mapper.showImg(aw_seq);
         
         // 현재 보고 있는 작품 이미지 제거
         ArrayList<String> similar_img_list = new ArrayList<String>();
         List<Artworks> artList = mapper.artAllList();
     	 List<IMAGES> imgList = mapper.imgAllList();
        		 
         for(String i : similar_img_all) {
        	 i = i.replace("\"", "");
        	 
        	for (IMAGES img : imgList) {
        		int k = 0;
        			for(int j = 0; j < showArtImg.size(); j++) {
	        			 if(!i.equals(showArtImg.get(j))) {
	            			 k++;
	            		 }
        		 }
        		if(k==showArtImg.size() && i.equals(img.getImg_filename())) {
           			 
           			 similar_img_list.add(i);
           		 }
        		
        		if(similar_img_list.size() == 5) {
       			 
       			 break;
       		 }
        	}
        	 
        	 if(similar_img_list.size() == 5) {
    			 
    			 break;
    		 }
        	 
         }
         
         ArrayList<Artworks> similar_art = new ArrayList<Artworks>();
         
         
         for(String i : similar_img_list) {
        	 
        	 for(IMAGES img : imgList) {
        		 if(i.equals(img.getImg_filename())) {;
        			 similar_art.add(mapper.getArt(img.getAw_seq()));
        		 }
        		 
        	 }
         }
         
         System.out.println(similar_img_list.size());
         System.out.println(similar_art.size());
         
        
         model.addAttribute("similar_img_list", similar_img_list);
        model.addAttribute("similar_art", similar_art);
		return "auction_detail";
	}
	
	// 관심 등록
	@ResponseBody
	@RequestMapping("/whishList")
	public boolean whishList(@RequestParam("userEmail") String userEmail, @RequestParam("awSeq") int awSeq, HttpSession session) {
		WISHLIST wish = new WISHLIST(userEmail, awSeq);
		// 관심 등록 확인
		int TF = mapper.wishCheck(wish);
		
		int cnt = 0;
		
		if (TF > 0) {
			cnt = mapper.deleteWish(wish);
		} else {
			cnt = mapper.wishList(wish);
		}
		
		List<WISHLIST> wishList = usersMapper.getWish(userEmail);
		session.setAttribute("wishList", wishList);
		
		if(cnt >= 0) {
			return true;
		}else {
			return false;
		}
		
	}

	
	// 작품관리 페이지로 이동	
		@RequestMapping("/artwork_management") 
		public String artwork_management(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
		    List<Artworks> artworkList = mapper.artworkList();
	        List<IMAGES> imgsList = mapper.imgsList();
					
			model.addAttribute("imgsList", imgsList);
		    model.addAttribute("artworkList", artworkList);
		    
		    System.out.println(imgsList.size());
		    
	       int maxpage = 0;
			
			if (imgsList.size() %9 == 0) {
				maxpage = imgsList.size()/9-1;
			} else {
				maxpage = imgsList.size()/9 ;
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
		    
		    return "artwork_management";
		}
	
	
	
	
		// 관심 작품 페이지
		@RequestMapping("/wishPage")
		public String wishPage(HttpSession session, Model model, @RequestParam(value = "page", defaultValue = "0") int page) {
			Users userLogin = (Users)session.getAttribute("userLogin");
			List<WISHLIST>wishList = usersMapper.getWish(userLogin.getUser_email());
			session.setAttribute("wishList", wishList);
			
			ArrayList<Artworks> wishArtList = new ArrayList<Artworks>();
			ArrayList<IMAGES> wishImgList = new ArrayList<IMAGES>();
			ArrayList<Users> artistList = new ArrayList<Users>();
			
			if(wishList != null) {
				System.out.println("들어옴1");
				for(WISHLIST wish : wishList) {
					System.out.println("들어옴2");
					wishArtList.add(mapper.getArt(wish.getAw_seq()));
					wishImgList.add(mapper.getWishImg(wish.getAw_seq()));
				}
				
				for(Artworks art : wishArtList) {
					artistList.add(mapper.getArtist(art.getUser_email()));
				}
			}
			
			model.addAttribute("wishArtList", wishArtList);
			model.addAttribute("wishImgList", wishImgList);
			model.addAttribute("artistList", artistList);
			
			int maxpage = 0;
			
			if(wishImgList.size() == 0) {
				maxpage = 0;
				
			} else if (wishImgList.size() %16 == 0) {
				maxpage = wishImgList.size()/16-1;
			} else {
				maxpage = wishImgList.size()/16 ;
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
			
			return "favorite_products";
		}

		
		
		// 작품승인 버튼
				@RequestMapping("/approvalAw")
				public String approvalAw(@RequestParam("aw_seq") String aw_seq) {
					mapper.approvalAw(aw_seq);
					return "redirect:/artwork_management";
				}	
				
				
				 // 작품거절 버튼
				  
				  @RequestMapping("/refuseAw") 
				  public String refuseAw(@RequestParam("aw_seq") String aw_seq) { 
					  mapper.refuseAw(aw_seq); 
					  return "redirect:/artwork_management"; 
					  }
				  
					// 예술가 승인 페이지로 이동	
					@RequestMapping("/artist_approval") 
					public String artist_approval(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
					    List<Users> artistApproval = mapper.artistApproval();
				        List<Portfolios> artistPf = mapper.artistPf();
								
						model.addAttribute("artistPf", artistPf);
					    model.addAttribute("artistApproval", artistApproval);
					    
					    System.out.println(artistPf.size());
					    
				       int maxpage = 0;
						
						if (artistPf.size() %16 == 0) {
							maxpage = artistPf.size()/16-1;
						} else {
							maxpage = artistPf.size()/16 ;
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
					    
					    return "artist_approval";
					}

		// 검색기능
					
					@GetMapping("/search")
					 public String search(@RequestParam(value = "page", defaultValue = "0") int page, @RequestParam("searchAw") String searchAw, Model model) {
						
						System.out.println(searchAw);
						 List<Users> artist = usersMapper.searchArtist(searchAw); 
							 List<Artworks> artwork = mapper.searchArtw(searchAw);							
								 List<IMAGES> image = mapper.searchImage(searchAw);
								  model.addAttribute("artist", artist);
								
							 model.addAttribute("artwork", artwork);
								 model.addAttribute("image",image); 
							 
							 System.out.println(model.toString());
							 
							 int maxpage = 0;
								
								if (artwork.size() %16 == 0) {
									maxpage = artwork.size()/16-1;
								} else {
									maxpage = artwork.size()/16 ;
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
								
								
				        return "search _result";
							
					}

		
					
					// 장바구니 등록
					@ResponseBody					
					@RequestMapping(value =  "Cart", produces = "application/text; charset=UTF-8")
					public String Cart(@RequestParam("userEmail") String userEmail, @RequestParam("awSeq") int awSeq, HttpServletResponse response ) {
						
						Artworks art = new Artworks(awSeq, userEmail);
						
						// 장바구니 상품 확인
						int count = mapper.cartCheck(art);
						int cnt = 0;
						response.setCharacterEncoding("UTF-8");
						if(count > 0) {
							System.out.println("이미 존재");
							return "이미 존재하는 상품입니다";
						} else {
							System.out.println("들어왔음");
							cnt = mapper.insertCart(art);
						}
						
						
						if (cnt > 0) {
							return "장바구니에 추가되었습니다.";
						} else {
							return "추가에 실패되었습니다.";
						}
						
					}
					
					// 장바구니 이동
					@RequestMapping("/shoppingCart")
					public String shoppingCart(HttpSession session, Model model) {
						Users userLogin = (Users)session.getAttribute("userLogin");
						List<Cart> cartList = mapper.getCart(userLogin.getUser_email());
						
						ArrayList<Artworks> artList = new ArrayList<Artworks>();
						ArrayList<IMAGES> imgList = new ArrayList<IMAGES>();
						ArrayList<Users> artistList = new ArrayList<Users>();
						
						if(cartList != null) {
							for(Cart cart : cartList) {
								artList.add(mapper.cartArt(cart.getAw_seq()));
								imgList.add(mapper.cartImg(cart.getAw_seq())); 
								artistList.add(mapper.catArtist(cart.getAw_seq()));
								
							}
						}
						
						
						model.addAttribute("artList", artList);
						model.addAttribute("imgList", imgList);		
						model.addAttribute("artistList", artistList);
						
						return "shoppig_cart";
					}
					
					// 장바구니 제거
					@ResponseBody	
					@RequestMapping("/deleteCart")
					public String deleteCart(@RequestParam("awSeq") String awSeq, HttpSession session) {
						Users userLogin = (Users)session.getAttribute("userLogin");
						System.out.println("들어왔음");
						System.out.println(awSeq);
						String[] aw_seq = awSeq.split(" ");
						for(String i : aw_seq) {
							Cart cart = new Cart(userLogin.getUser_email(), Integer.parseInt(i));
							System.out.println(cart.toString());
							mapper.deleteCart(cart);
						}
						
						return "shoppingCart";
						
					}
					
					// 결제 페이지 출력
					@ResponseBody
					@RequestMapping(value = "/payment", produces = "application/text; charset=UTF-8")
					public String payment(@RequestParam("awSeq") String awSeq) {
						System.out.println(awSeq);
						
						String[] aw_seq = awSeq.split(" ");
						
						ArrayList<Artworks> payList = new ArrayList<Artworks>();
						
						for(String i : aw_seq) {
							payList.add(mapper.getArt(Integer.parseInt(i)));
						}
						
						int total = 0;
						
						for (Artworks art : payList) {
							total += art.getAw_price();
						}
						
						String result = payList.get(0).getAw_name() + " 외 " + (payList.size()-1) +"개 상품/"+total;
						
						return result;
					}				
}



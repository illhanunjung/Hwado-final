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
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.entity.AUCTIONS;
import kr.smhrd.entity.Artworks;
import kr.smhrd.entity.IMAGES;
import kr.smhrd.entity.WISHLIST;
import kr.smhrd.mapper.ArtworksMapper;

@Controller
public class ArtworksController {
	
	@Autowired
	private ArtworksMapper mapper;
	
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
	public String product_page(@RequestParam(value = "page", defaultValue = "0") int page , Model model) {
		
		List<Artworks> artList = mapper.artList();
		List<IMAGES> imgList = mapper.imgList();
		
		model.addAttribute("artList", artList);
		model.addAttribute("imgList", imgList);
		
		System.out.println(artList.size());
		System.out.println(imgList.size());
		
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
		
		return "Test";
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
		
		return "Test";
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
	public boolean whishList(@RequestParam("userEmail") String userEmail, @RequestParam("awSeq") int awSeq) {
		WISHLIST wish = new WISHLIST(userEmail, awSeq);
		// 관심 등록 확인
		int TF = mapper.wishCheck(wish);
		
		int cnt = 0;
		
		if (TF > 0) {
			cnt = mapper.deleteWish(wish);
		} else {
			cnt = mapper.wishList(wish);
		}
		
		
		
		if(cnt >= 0) {
			return true;
		}else {
			return false;
		}
		
	}
}

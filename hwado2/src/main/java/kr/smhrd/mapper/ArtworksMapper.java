package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.AUCTIONS;
import kr.smhrd.entity.Artworks;
import kr.smhrd.entity.IMAGES;

@Mapper
public interface ArtworksMapper {

	// 일반 상품 등록
	public int artRegi(Artworks art);
	
	// 상품 seq 추출
	public int getAwSeq(Artworks art);

	// 상품 이미지 등록
	public int imgRegi(IMAGES img1);

	// 경매 등록
	public int auctionRegi(AUCTIONS auction);

	// 경매 상태 업데이트
	public void auctionUpdate(int seq);

	// 작품 상세보기 이미지 불러오기
	public List<IMAGES> getimges(Artworks art);

	// 일반 작품 불러오기
	public List<Artworks> artList();

	// 일반 작품 이미지 불러오기
	public List<IMAGES> imgList();
	
	// 전체 작품 불러오기
	public List<Artworks> artAllList();
	
	// 전체 작품 이미지 불러오기
	public List<IMAGES> imgAllList();

	// 상세 작품 불러오기
	public Artworks getArt(int aw_seq);

	public List<String> showImg(int aw_seq);

	// 경매 상품 불러오기
	public List<Artworks> auctionList();

	// 경매 상품 이미지 불러오기
	public List<IMAGES> auctionImgList();

	public List<AUCTIONS> auctioninfo();

	public AUCTIONS getAuction(int aw_seq);

	


	

}

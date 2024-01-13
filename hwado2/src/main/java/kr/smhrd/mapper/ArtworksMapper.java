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

	


	

}

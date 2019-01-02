package com.sb.mall.crowd.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sb.mall.crowd.model.CrowdBoard;
import com.sb.mall.crowd.model.CrowdGoods;
import com.sb.mall.crowd.model.CrowdOption;
import com.sb.mall.crowd.model.CrowdOrder;
import com.sb.mall.crowd.model.CrowdOrderDetail;
import com.sb.mall.crowd.model.CrowdProduct;
import com.sb.mall.crowd.model.CrowdProductPhoto;

public interface CrowdDao {
	
	public int insertCrowdBoard(CrowdBoard crowdBoard); // board 추가
	public int insertCrowdProduct(CrowdProduct crowdProduct); //product 추가 (사진 있을 때)
	public int insertCrowdProductNull(CrowdProduct crowdProduct); //product 추가(사진 없을 때)
	public int insertCrProductPhoto(CrowdProductPhoto crowdProductPhoto); //photo 추가
	public int insertCrProductPhotoNo(CrowdProductPhoto crowdProductPhoto);
	public int insertCrowdGoods(CrowdGoods crowdGoods); // goods추가
	public int insertCrowdOption(CrowdOption crowdOption); //option 추가
	public int getBoardPageCnt(); // 페이지 카운트
	public List<Map<String, Object>> selectCrowdBoard(int pageNum, int pageShowCnt); // 전체 게시판 select
	public List<Map<String, Object>> getDetailBoard(int crowdBoardSeq); // 디테일 board&product select
	public List<Map<String, Object>> getDetailGoods(int crProductSeq); //디테일 goods select
	public List<Map<String, Object>> getDetailPhoto(String productNo); // 디테일 photo select
	public int getPhotoCount(String productNo); // 사진 갯수 파악
	public void setViewSeqUp(int crowdBoardSeq);// 조회수 증가
	public int getViewSeq(int crowdBoardSeq);//조회수 조회
	public String getDelivery(int crowdBoardSeq); //salesDay 구하기
	public List<Map<String, Object>> getOpt1(String goodsNo);// opt1 구하기
	public List<Map<String, Object>> getOpt2(String goodsNo, String opt1Name); //opt2 구하기
	public String getUserName(int userSeq); // 유저 네임 구하기
	public void insertOrderDetail2(String orders);//order프로시저
	public int insertOrderList(CrowdOrder crowdOrder);//order추가
	public int getOrderPrice(String goodsNo, int optionSeq); //주문한 금액의 값 확인을 위해 goods+option의 가격 조회
	public int insertOrderDetail(CrowdOrderDetail crowdOrderDetail);//orderDetail추가
	public void updateOrderedPriceByOrder(int totalAmount, int crowdBoardSeq); // order 후 board update
	public void updateOrderedOptionByOrder(int quantity, int optionSeq); // order 후 option update
}

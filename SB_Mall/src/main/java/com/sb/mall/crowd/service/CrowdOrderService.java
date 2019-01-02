package com.sb.mall.crowd.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.crowd.dao.CrowdDao;
import com.sb.mall.crowd.model.CrowdOrder;
import com.sb.mall.crowd.model.CrowdOrderDetail;
import com.sb.mall.member.service.AES256Util;

@Component
public class CrowdOrderService {
	@Autowired
	private AES256Util AES256;
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	private CrowdDao crowdDao;
	
	public String getUserName(int userSeq) {
		crowdDao = sessionTemplate.getMapper(CrowdDao.class);
		String userName = crowdDao.getUserName(userSeq);
		
		return userName;
	}
	
	public int insertOrder(List<CrowdOrder> orderList, CrowdOrderDetail orderDetail) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		int orderOk = 0
			,detailOk = 0
			,orderNo = 0
			,detailNo = 0
			,totalAmount=0
			,result=0;
		
		// order for
		for(int i=0; i<orderList.size(); i++) {
			// DB Price 가격 가져오기
			int price = crowdDao.getOrderPrice(orderList.get(i).getGoodsNo(),orderList.get(i).getOptionSeq());
			totalAmount += price;
			
			// orderPrice DB 값으로 변경
			orderList.get(i).setOnePrice(price);
//			System.out.println("salePrice : "+orderList.get(i).getQuantity()*price);
			orderList.get(i).setSalePrice(orderList.get(i).getQuantity()*price);
			
		}
		
		// detail insert
		// detail cardNo
		String cardNo = AES256.encrypt(orderDetail.getCardNo());
		orderDetail.setCardNo(cardNo);
		
		// detail cardPassword
		String cardPass = AES256.encrypt(orderDetail.getCardPassword());
		orderDetail.setCardPassword(cardPass);
		
		orderDetail.setTotalAmount(totalAmount);
		int checkD = crowdDao.insertOrderDetail(orderDetail);
		if(checkD==1) {
			detailOk++;
		}else {
			detailNo++;
		}
		
		// orderList insert
		for(int i=0; i<orderList.size(); i++) {
			int check=0;
			
			check = crowdDao.insertOrderList(orderList.get(i));
			if(check==1) {
				orderOk++;
				// order 추가 후 option amount 줄이기
				crowdDao.updateOrderedOptionByOrder(orderList.get(i).getQuantity(), orderList.get(i).getOptionSeq());
				
			}else {
				orderNo++;
			}
		}
		
		if(detailNo==0 && orderNo==0) {
			result=1;
		}
		
		if(result==1) {
			crowdDao.updateOrderedPriceByOrder(totalAmount, orderList.get(0).getCrowdBoardSeq());
			
		}
		
		System.out.println("totalTry : "+orderOk+orderNo+detailOk+detailNo);
		System.out.println("orderList - success "+orderOk+", fail : "+orderNo);
		System.out.println("orderDetail - success "+detailOk+", fail : "+detailNo);
		
		return result;
	}
	
	
	
	
	
}

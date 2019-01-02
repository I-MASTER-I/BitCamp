package com.sb.mall.crowd.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.crowd.dao.CrowdDao;
import com.sb.mall.crowd.model.CrowdProductPhoto;
import com.sb.mall.crowd.model.CrowdWriteCommand;

@Repository
public class CrowdWriteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private CrowdDao crowdDao;
	
	@Transactional
	public boolean insertCrowdCommand(CrowdWriteCommand command) {
			crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
			
			int totalTry = command.getGoodsList().size()+command.getOptionList().size()+command.getCrowdPhoto().size()+2;
			int sussecc = 0;
			int fail = 0;
			
			//board 등록
			int boardSC = crowdDao.insertCrowdBoard(command.getCrowdBoard());
			//db등록 후, seq가져오기
			int crowdBoardSeq = command.getCrowdBoard().getCrowdBoardSeq();
			if(boardSC>0) {
				sussecc++;
			}else {
				fail++;
			}

			
			//product 등록
			//product와 board연결
			int ProductSC=0;
			command.getCrowdProduct().setCrowdBoardSeq(crowdBoardSeq);
			if(command.getCrowdProduct().getCrPhoto().isEmpty()) {
				System.out.println("사진이 없을때");
				System.out.println("photo : "+command.getCrowdProduct().getCrPhoto());
				ProductSC = crowdDao.insertCrowdProductNull(command.getCrowdProduct());
			}else {
				System.out.println("사진이 있을때");
				System.out.println("photo : "+command.getCrowdProduct().getCrPhoto());
				ProductSC = crowdDao.insertCrowdProduct(command.getCrowdProduct());
			}
			
			if(ProductSC>0) {
				sussecc++;
			}else {
				fail++;
			}
			
			
			//ProductPhoto 등록
			int photoSC=0;
			for(int i=0; i<command.getCrowdPhoto().size(); i++) {
					
				if(!command.getCrowdPhoto().get(i).getCrPhotoList().equals("0")) {
					System.out.println("뭔가 photoList가 있을 때");
					System.out.println("photoList : "+command.getCrowdPhoto().get(i).getCrPhotoList());
					photoSC = crowdDao.insertCrProductPhoto(command.getCrowdPhoto().get(i));
				}else {
					photoSC = crowdDao.insertCrProductPhotoNo(command.getCrowdPhoto().get(i));
				}
				if(photoSC>0) {
					sussecc++;
				}else {
					fail++;
				}
			}
			
			
			//goods 등록
			//product와 goods연결
			//db등록 후 seq가져오기
			int productSeq = command.getCrowdProduct().getCrProductSeq();
			for(int i=0; i<command.getGoodsList().size(); i++) {
				System.out.println("goodsSize : "+command.getGoodsList().size());
				command.getGoodsList().get(i).setCrProductSeq(productSeq);
				int goodsSC = crowdDao.insertCrowdGoods(command.getGoodsList().get(i));
				if(goodsSC>0) {
					sussecc++;
				}else {
					fail++;
				}
			}
			
			//option 등록.
			for(int i=0; i<command.getOptionList().size(); i++) {
				System.out.println("OptionSize : "+command.getOptionList().size());
				
				int optionSC = crowdDao.insertCrowdOption(command.getOptionList().get(i));
				
				if(optionSC>0) {
					sussecc++;
				}else {
					fail++;
				}
			}
			
			
			
			boolean result = false;
			
			if(totalTry==sussecc) {
				result=true;
			}
			
			System.out.println("total : "+totalTry);
			System.out.println("sussecc : "+sussecc);
			System.out.println("fail : "+fail);
			
			return result;
	}
}

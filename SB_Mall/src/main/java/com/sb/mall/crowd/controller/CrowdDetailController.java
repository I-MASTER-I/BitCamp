package com.sb.mall.crowd.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.crowd.model.CrowdBoardRating;
import com.sb.mall.crowd.service.CrowdDetailService;

@Controller
@RequestMapping
public class CrowdDetailController {
	
	@Autowired
	private CrowdDetailService dtService;
	
	@RequestMapping(value = "crowd/crowdDetail/{crBoardSeq}", method = RequestMethod.GET)
	public ModelAndView getDetailBoard(@PathVariable("crBoardSeq")int crBoardSeq) throws ParseException {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("store/crowdFunding/crowdError");
		
		List<Map<String, Object>> boardPro = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> photo = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> goods = new ArrayList<Map<String,Object>>();
		
		System.out.println("detail controller 입장");
		
		//조회수 올리기~
		dtService.setViewSeqUps(crBoardSeq);
		
		//board & product
		boardPro = dtService.getCrBoard(crBoardSeq);
		int boardSeq = (int) boardPro.get(0).get("crowdBoardSeq");
		
		//crPhoto
		//productNo 추출
		String productNo = (String) boardPro.get(0).get("productNo");
		photo = dtService.getCrPhoto(productNo);
		int photoNum = dtService.getPhotoCount(productNo);
		int photoCnt = 5-photoNum;
		
		//crGoods
		//crProduct추출
		int crProductSeq = (int) boardPro.get(0).get("crProductSeq");
		goods = dtService.getCrGoods(crProductSeq);
		
		//평점 관련 데이터
		CrowdBoardRating Rating = dtService.topRating(crBoardSeq);
		
		//조회수 조회
		int viewSeq = dtService.getViewCount(crBoardSeq);
		
		//끝나는 날짜.
		String date = dtService.getDelivery(crBoardSeq);
		System.out.println("끝나는 날짜 : "+date);
		
		//board & product & goods의 값이 있다면 성공
		if(boardPro!=null && goods!=null) {
			modelAndView.addObject("photoCnt", photoCnt);
			modelAndView.addObject("boardSeq", boardSeq);
			modelAndView.addObject("boardPro", boardPro);
			modelAndView.addObject("photo", photo);
			modelAndView.addObject("goods", goods);
			modelAndView.addObject("Rating", Rating);
			modelAndView.addObject("viewSeq", viewSeq);
			modelAndView.addObject("data", date);
			
			modelAndView.setViewName("store/crowdFunding/crowdDetailPage");
		}
		
		return modelAndView;
	}
	
	
	

	
	
	
	
	
	
	
}

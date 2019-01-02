package com.sb.mall.store.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.store.model.GoodsOption;
import com.sb.mall.store.service.StoreGoodsOptionService;

@Controller
public class StoreGoodsOptionController {
	
	@Autowired
	StoreGoodsOptionService storeGoodsOptionService;
	
	@RequestMapping(value="store/goodsOption",method=RequestMethod.GET)
	@ResponseBody
	public List<GoodsOption> getGoodsOptionList(String goodsNo){
		List<GoodsOption> list = null;
		try {
			list = storeGoodsOptionService.getGoodsOptionList(goodsNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@RequestMapping(value="store/goodsOption/{goodsNo}",method=RequestMethod.GET)
	@ResponseBody
	public GoodsOption getGoodsOption(@PathVariable("goodsNo") String goodsNo,String opt1Name,String opt2Name) {
		GoodsOption goodsOption = new GoodsOption();
		goodsOption.setGoodsNo(goodsNo);
		goodsOption.setOpt1Name(opt1Name);
		goodsOption.setOpt2Name(opt2Name);
		try {
			goodsOption=storeGoodsOptionService.getGoodsOption(goodsOption);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goodsOption; 
	}
	
}

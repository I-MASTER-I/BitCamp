package com.sb.mall.store.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.store.model.Goods;
import com.sb.mall.store.service.StoreGoodsListViewService;

@Controller
public class StoreGoodsListViewController {
	
	@Autowired
	StoreGoodsListViewService storeGoodsListViewService;
	
	@RequestMapping("store/getGoodsList")
	@ResponseBody
	public List<Goods> getGoodsList(int productSeq) {
		List<Goods> list = null;
		try {
			list = storeGoodsListViewService.getGoodsList(productSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/*@RequestMapping("store/getGoodsOptionList")
	@ResponseBody
	public List<GoodsOption> getGoodsOption(String goodsNo){
		List<GoodsOption> list = null;
		try {
			list = storeGoodsListViewService.getGoodsOptionList(goodsNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}*/

}

package com.sb.mall.store.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sb.mall.store.model.Goods;
import com.sb.mall.store.model.GoodsOption;
import com.sb.mall.store.model.Product;
import com.sb.mall.store.model.SalesBoard;

public interface StoreDao {
	
	public void insertSalesBoard(SalesBoard salesBoard);
	public void insertProduct(Product product);
	public void insertGoods(HashMap<String, Object> goodsMap);
	public void insertGoodsOption(List<GoodsOption> goodsOptions);
	public List<Map<String,Object>> selectProAndSalList(
			String tag,String sortType,int firstRow,int endRow);
	public int countProAndSalList(String tag);
	public Map<String,Object> selectProAndSal(int salSeq);
	public List<Product> selectProductList();
	public List<SalesBoard> selectSalBoardList();
	public List<Goods> selectGoodsList(int productSeq);
	public List<GoodsOption> selectGoodsOptionList(String goodsNo);
	public GoodsOption selectGoodsOption(GoodsOption goodsOption);
	public List<GoodsOption> checkGoodsOptionIsNull(int productSeq);
	public SalesBoard selectSalBoard(int salSeq);
	public void deleteSalesBoard(int salSeq);
	public void updateSalesBoard(SalesBoard salesBoard);
	public void updateSalBoardCnt(int salSeq);
}

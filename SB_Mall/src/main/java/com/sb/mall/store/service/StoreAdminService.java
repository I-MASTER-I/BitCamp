package com.sb.mall.store.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.store.dao.StoreDao;
import com.sb.mall.store.model.Goods;
import com.sb.mall.store.model.GoodsOption;
import com.sb.mall.store.model.Product;
import com.sb.mall.store.model.SalesBoard;
import com.sb.mall.store.model.StoreWriteCommend;

@Service
public class StoreAdminService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private StoreDao storeDao;

	@Transactional
	public void productAndBoardWrite(StoreWriteCommend storeWriteCommend) throws SQLException {
		Product product = storeWriteCommend.getProduct();
		SalesBoard salesBoard = storeWriteCommend.getSalesBoard();
		List<Goods> goods = storeWriteCommend.getGoods();
		List<GoodsOption> goodsOptions = storeWriteCommend.getGoodsOptions();
		HashMap<String, Object> goodsMap = new HashMap<>();
		storeDao = sqlSessionTemplate.getMapper(StoreDao.class);
		
		storeDao.insertSalesBoard(salesBoard);
		// 생성된 salesBoard의 pk를 product객체에 적용
		product.setSalesSeq(salesBoard.getSalesSeq());
		storeDao.insertProduct(product);
		// 생성된 product의 pk를 goodsMap에 저장
		goodsMap.put("productSeq", product.getProductSeq());
		goodsMap.put("goodsList", goods);
		storeDao.insertGoods(goodsMap);
		if(goodsOptions!=null) { // 옵션이 존재할때
		storeDao.insertGoodsOption(goodsOptions);
		}
	}

	@Transactional
	public void deleteStore(int salSeq) throws SQLException {
		storeDao = sqlSessionTemplate.getMapper(StoreDao.class);
		storeDao.deleteSalesBoard(salSeq);
	}

	@Transactional
	public void updateSalesBoard(SalesBoard salesBoard) throws SQLException {
		storeDao = sqlSessionTemplate.getMapper(StoreDao.class);
		storeDao.updateSalesBoard(salesBoard);
	}

	public SalesBoard selectSalesBoard(int salSeq) throws SQLException {
		storeDao = sqlSessionTemplate.getMapper(StoreDao.class);
		SalesBoard salesBoard = storeDao.selectSalBoard(salSeq);
		if (salesBoard == null) {
			throw new SQLException();
		}
		return salesBoard;
	}

}

package com.sb.mall.store.model;

import java.util.List;

public class StoreWriteCommend {
	
	private Product product;
	private SalesBoard salesBoard;
	private List<Goods> goods;
	private List<GoodsOption> goodsOptions;
	
	@Override
	public String toString() {
		return "StoreWriteCommend [product=" + product + ", salesBoard=" + salesBoard + ", goods=" + goods
				+ ", goodsOptions=" + goodsOptions + "]";
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public SalesBoard getSalesBoard() {
		return salesBoard;
	}

	public void setSalesBoard(SalesBoard salesBoard) {
		this.salesBoard = salesBoard;
	}

	public List<Goods> getGoods() {
		return goods;
	}

	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}

	public List<GoodsOption> getGoodsOptions() {
		return goodsOptions;
	}

	public void setGoodsOptions(List<GoodsOption> goodsOptions) {
		this.goodsOptions = goodsOptions;
	}
	
}

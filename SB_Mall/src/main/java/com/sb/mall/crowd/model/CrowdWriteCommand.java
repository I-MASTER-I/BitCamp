package com.sb.mall.crowd.model;

import java.util.List;

public class CrowdWriteCommand {
	private CrowdBoard crowdBoard;
	private CrowdProduct crowdProduct;
	private List<CrowdGoods> goodsList;
	private List<CrowdOption> optionList;
	private List<CrowdProductPhoto> crowdPhoto;
	
	public CrowdBoard getCrowdBoard() {
		return crowdBoard;
	}
	public void setCrowdBoard(CrowdBoard crowdBoard) {
		this.crowdBoard = crowdBoard;
	}
	public CrowdProduct getCrowdProduct() {
		return crowdProduct;
	}
	public void setCrowdProduct(CrowdProduct crowdProduct) {
		this.crowdProduct = crowdProduct;
	}
	public List<CrowdGoods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<CrowdGoods> goodsList) {
		this.goodsList = goodsList;
	}
	public List<CrowdOption> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<CrowdOption> optionList) {
		this.optionList = optionList;
	}
	public List<CrowdProductPhoto> getCrowdPhoto() {
		return crowdPhoto;
	}
	public void setCrowdPhoto(List<CrowdProductPhoto> crowdPhoto) {
		this.crowdPhoto = crowdPhoto;
	}
	
	@Override
	public String toString() {
		return "CrowdWriteCommand [crowdBoard=" + crowdBoard + ", crowdProduct=" + crowdProduct + ", goodsList="
				+ goodsList + ", optionList=" + optionList + ", crowdPhoto=" + crowdPhoto + "]";
	}
	
	
	
	
	
	
}

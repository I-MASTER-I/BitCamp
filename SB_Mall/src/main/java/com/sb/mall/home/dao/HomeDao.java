package com.sb.mall.home.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface HomeDao {
	
	public List<Map<String, Object>> selectDailyDeal() throws SQLException;
	public List<Map<String, Object>> selectNewProduct() throws SQLException;
	public List<Map<String, Object>> getHomeCrowdFunding();
	public int visitToday() throws SQLException;
	public int visitCount() throws SQLException;
	
	
}

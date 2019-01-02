package com.sb.mall.member.service;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.home.model.PageListView;
import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.order.dao.OrderDetailDao;
import com.sb.mall.store.dao.StoreDao;
import com.sb.mall.store.model.StoreListView;

@Repository
public class MemberPagingService {

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	// getList()의 매개변수 pageNumber는 표시할 페이지, countPerPage는 표시할 페이지 갯수, daoName은 적용할 Dao 변수이름을 적고 변수이름을 똑같이 생성해주면 된다 
	private MemberDao memberDao;

	private OrderDetailDao orderDetailDao;
	
	private StoreDao storeDao;

	@Transactional
	public PageListView getList(int pageNumber, int countPerPage, String daoName) {

		// 전체 메시지 구하기
		// 메세지 갯수
		int objTotalCount = 0;

		// 표시할 페이지
		int currentPageNumber = pageNumber;

		// 메세지가 담길 리스트
		List<Object> objList = null;
		int firstRow = 0;
		int endRow = 0;

		if (daoName.equals("memberDao")) {
			memberDao = sessionTemplate.getMapper(MemberDao.class);
			objTotalCount = memberDao.selectCount();
		} else if (daoName.equals("orderDetailDao")) {
			orderDetailDao = sessionTemplate.getMapper(OrderDetailDao.class);
			objTotalCount = orderDetailDao.selectCount();
		}

		// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
		// 마지막 행에는 표시할 페이지 갯수를 적는다.
		if (objTotalCount > 0) {
			firstRow = (pageNumber - 1) * countPerPage;
			endRow = countPerPage;
			// 현재 페이지에 표시할 메세지를 가져온다.
			if (daoName.equals("memberDao")) {
				objList = memberDao.selectList(firstRow, endRow);
			} else if (daoName.equals("orderDetailDao")) {
				objList = orderDetailDao.selectList(firstRow, endRow);
			}
		} else {
			currentPageNumber = 0;
			objList = Collections.emptyList();
		}

		return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
	}
	
	@Transactional
	public StoreListView getStoreList(int pageNumber, int countPerPage, 
			String daoName, String tag, String sortType) throws SQLException {

		// 전체 메시지 구하기
		// 메세지 갯수
		int objTotalCount = 0;

		// 표시할 페이지
		int currentPageNumber = pageNumber;

		// 메세지가 담길 리스트
		List<Map<String,Object>> storeList = null;
		int firstRow = 0;
		int endRow = 0;

		if (daoName.equals("StoreListView")) {
			storeDao = sessionTemplate.getMapper(StoreDao.class);
			objTotalCount = storeDao.countProAndSalList(tag);
		}

		// 메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1 * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
		// 마지막 행에는 표시할 페이지 갯수를 적는다.
		if (objTotalCount > 0) {
			firstRow = (pageNumber - 1) * countPerPage;
			endRow = countPerPage;
			// 현재 페이지에 표시할 메세지를 가져온다.
			if (daoName.equals("StoreListView")) {
				storeList = storeDao.selectProAndSalList(tag,sortType, firstRow, endRow);
			}
		} else {
			currentPageNumber = 0;
			storeList = Collections.emptyList();
		}

		return new StoreListView(storeList, objTotalCount, currentPageNumber, countPerPage, firstRow, endRow);
	}
}

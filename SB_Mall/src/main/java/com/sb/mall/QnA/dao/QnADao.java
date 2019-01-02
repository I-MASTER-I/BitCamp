package com.sb.mall.QnA.dao;

import java.util.List;

import com.sb.mall.QnA.model.QnABoard;

public interface QnADao {

	public void create(QnABoard qna) throws Exception;
    
    public List<QnABoard> listAll() throws Exception;
    
    public QnABoard read(Integer qnaSeq) throws Exception;
    
    public void delete(Integer qnaSeq) throws Exception;
    
    public void update(QnABoard qna) throws Exception;
    
    public void reply(QnABoard qna) throws Exception;
    
    
	
/*	public int insertQnABoard(QnABoard qnaBoard);
	public void insertMemberInfo(MemberInfo memberInfo);
	public List<Map<String,Object>> selectQnAList();
	public List<Map<String,Object>> selectQnA(int qnaSeq);
	public List<QnABoard> selectQnABoard();
	public List<MemberInfo> selectMemberInfo();
	public void updateQnABoardCnt(int qnaSeq);*/
	
}

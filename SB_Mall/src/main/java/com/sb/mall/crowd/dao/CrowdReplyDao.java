package com.sb.mall.crowd.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.crowd.model.CrowdReply;

public interface CrowdReplyDao {
	public List<Map<String, Object>> getReply(int salesSeq, int firstRow);
//	public List<Map<String, Object>> getReplyByreqSeq(int replySeq);
	public int getReplyCount(int salesSeq);
	public int writeReply(CrowdReply reply);
	public int deleteReply(int replySeq);
	public int setReplyUpdate(CrowdReply reply);
	public int getTotalRating(int crowdBoardSeq);// rating 총 점수
}

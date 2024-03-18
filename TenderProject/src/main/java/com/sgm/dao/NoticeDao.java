package com.sgm.dao;

import java.util.List;

import com.sgm.beans.NoticeBean;

public interface NoticeDao {
		
	public String removeNotice(int noticeId);
	
	public String addNotice(String noticeTitle, String noticeDesc );
	
	public List<NoticeBean> viewAllNotice();
	
	public String updateNotice(NoticeBean notice);
	
	public NoticeBean getNoticeById(int noticeId);
}

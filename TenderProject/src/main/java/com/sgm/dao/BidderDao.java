package com.sgm.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sgm.beans.BidderBean;

public interface BidderDao {

    public String acceptBid(String applicationId,String tenderId,String vendorId);
	
	public String rejectBid(String applicationId);
	
	public String bidTender(String tenderId, String vendorId,String bidAmount,String deadline);
	
	public List<BidderBean> getAllBidsOfaTender(String tenderId);
	
	public List<BidderBean> getAllBidsOfaVendor(String vendorId);
	

	// Add the getCurrentVendorEmail method
	//public String getCurrentVendorEmail(HttpServletRequest request, String vendorId) throws SQLException;



	
}

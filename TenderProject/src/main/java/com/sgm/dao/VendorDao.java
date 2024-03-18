package com.sgm.dao;

import java.util.List;

import com.sgm.beans.VendorBean;

public interface VendorDao {
	
	public String registerVendor(VendorBean vendor);
	
	public List<VendorBean> getAllVendors();
	
	public boolean validatePassword(String vendorId,String password);
	
	public String updateProfile(VendorBean vendor);
	
	public String changePassword(String vendorId,String oldPassword,String newPassword);
	
	public VendorBean getVendorDataById(String vendorId);
}

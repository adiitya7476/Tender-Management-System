package com.sgm.srv;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sgm.beans.VendorBean;
import com.sgm.dao.VendorDao;
import com.sgm.dao.VendorDaoImpl;
import com.sgm.utility.DBUtil;
import com.sgm.utility.IDUtil;

/**
 * Servlet implementation class RegisterSrv
 */
@WebServlet("/RegisterSrv")
public class RegisterSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterSrv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String vname = request.getParameter("vname").trim();
		String vemail = request.getParameter("vemail").trim().toLowerCase();
		String vmob = request.getParameter("vmob").trim();
		//int vmob = Integer.parseInt(mob);
		String vaddr = request.getParameter("vaddr").trim();
		String cname = request.getParameter("cname").trim();
		String vpass = request.getParameter("vpass").trim();
		
		String vid = IDUtil.generateVendorId();
		
		VendorBean vendor = new VendorBean(vid, vname, vmob, vemail, vaddr, cname, vpass);
		
		VendorDao dao = new VendorDaoImpl();
		
		String status = dao.registerVendor(vendor);
	
		PrintWriter pw = response.getWriter();
		
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		
		rd.include(request, response);
		
		pw.print("<script>document.getElementById('show').innerHTML = '"+status+"'</script>");
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}

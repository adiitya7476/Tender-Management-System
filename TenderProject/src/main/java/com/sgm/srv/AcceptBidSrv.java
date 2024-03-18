package com.sgm.srv;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sgm.beans.VendorBean;
import com.sgm.dao.BidderDao;
import com.sgm.dao.BidderDaoImpl;
import com.sgm.notification.EmailNotificationUtil;
import com.sgm.dao.TenderDao;
import com.sgm.dao.TenderDaoImpl;

/**
 * Servlet implementation class AcceptBidSrv
 */
@WebServlet("/AcceptBidSrv")
public class AcceptBidSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public boolean bidAcceptedSuccessfully = false;
    public AcceptBidSrv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Existing code...

        String bidderId = request.getParameter("bid");
        String tenderId = request.getParameter("tid");
        String vendorId = request.getParameter("vid");

        BidderDao dao = new BidderDaoImpl();

        String status = dao.acceptBid(bidderId, tenderId, vendorId);

        PrintWriter pw = response.getWriter();

        RequestDispatcher rd = request.getRequestDispatcher("viewTenderBidsForm.jsp");

        rd.include(request, response);

        pw.print("<script>document.getElementById('show').innerHTML='" + status + "'</script>");
        
        	
        pw.close();
     
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}

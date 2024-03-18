<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, com.sgm.utility.DBUtil"%>

<%
    // Retrieve the selected status from the request
    String selectedStatus = request.getParameter("status");
   
    Connection con = DBUtil.provideConnection();
    
    // Construct the SQL query based on the selected status
    String sql = "SELECT bid, vid, tid, bidamount, deadline, status FROM bidder";
    
    // Append a WHERE clause to the SQL query if a status filter is selected
    if (selectedStatus != null && !selectedStatus.isEmpty()) {
    	sql += " WHERE status = '" + selectedStatus + "'";
    }
    
    // Prepare the SQL statement
    PreparedStatement pstmt = con.prepareStatement(sql);
    
    // Execute the SQL query
    ResultSet rs = pstmt.executeQuery();
%>

<table class="table table-hover" style="margin: 10px; padding: 0;">
    <thead>
        <tr>
            <th scope="col">Sr</th>
            <th scope="col">Appplication Id</th>
            <th scope="col">Vendor Id</th>
            <th scope="col">Tender Id</th>
            <th scope="col">Bid-amount</th>
            <th scope="col">Deadline</th>
            <th scope="col">Status</th>
        </tr>
    </thead>
    <tbody>
        <% 
            int sr = 1;
            while(rs.next()){
                String bid = rs.getString(1);
                String vid = rs.getString(2);
                String tid = rs.getString(3);
                String bidamount = rs.getString(4);
                String deadline = rs.getString(5);
                String status = rs.getString(6);
        %> 
        <tr>
            <th scope="row"><%= sr++ %></th>
            <td><%= bid %></td>
            <td><%= vid %></td>
            <td><%= tid %></td>
            <td><%= bidamount %></td>
            <td><%= deadline %></td>
            <td><%= status %></td>
        </tr>
        <% } %>
    </tbody>
</table>

<%
    // Close resources
    rs.close();
    pstmt.close();
    con.close();
%>

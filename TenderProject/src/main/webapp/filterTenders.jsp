<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,com.sgm.utility.DBUtil"%>

<%
    String selectedType = request.getParameter("type");
    Connection con = DBUtil.provideConnection();
    String sql = "SELECT tid, tname, ttype, tprice, tdesc, tdeadline, tloc FROM tender";
    if (selectedType != null && !selectedType.isEmpty()) {
        sql += " WHERE ttype = '" + selectedType + "'";
    }
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(sql);
%>

<table class="table table-hover" style="margin: 10px; padding: 0;">
    <thead>
        <tr>
            <th scope="col">Sr</th>
            <th scope="col">Tender Id</th>
            <th scope="col">Tender Name</th>
            <th scope="col">Type</th>
            <th scope="col">Base Price</th>
            <th scope="col">Description</th>
            <th scope="col">Deadline</th>
            <th scope="col">Location</th>
        </tr>
    </thead>
    <tbody>
        <% 
            int sr = 1;
            while(rs.next()){
                String tid = rs.getString(1);
                String tname = rs.getString(2);
                String type = rs.getString(3);
                String price = rs.getString(4);
                String desc = rs.getString(5);
                String deadline = rs.getString(6);
                String location = rs.getString(7);
        %> 
        <tr>
            <th scope="row"><%= sr++ %></th>
            <td><%= tid %></td>
            <td><%= tname %></td>
            <td><%= type %></td>
            <td><%= price %></td>
            <td><%= desc %></td>
            <td><%= deadline %></td>
            <td><%= location %></td>
        </tr>
        <% } %>
    </tbody>
</table>

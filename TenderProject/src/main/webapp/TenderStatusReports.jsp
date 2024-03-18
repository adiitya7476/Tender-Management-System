<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,com.sgm.utility.DBUtil, javax.servlet.annotation.WebServlet" errorPage="errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <link rel="shortcut icon" type="image/png" href="images/Banner_Hit.png">
    <!--link rel="shortcut icon" type="image/ico" href="images/hit_fevicon.ico"-->
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tender Management System</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/annimate.css">
    <link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="css/SpryTabbedPanels.css" type="text/css" rel="stylesheet">
    <!--link rel="stylesheet" href="css/styles.css"-->
    <link href="https://fonts.googleapis.com/css?family=Black+Ops+One" rel="stylesheet">
    <link href="css/bootstrap-dropdownhover.min.css">
    <link rel="stylesheet" href="css/style2.css">
    
  </head>
<body>


	<%
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
	
	%>


	<!-- Including the header of the page  -->
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<jsp:include page="adminMenu.jsp"></jsp:include>
	
	<div class="clearfix hidden-sm hidden-xs" style="color:white;background-color: green; margin-top:-15px; margin-bottom: 12px"><marquee>Welcome to Tender Management Site</marquee>
 </div> <!--A green color line between header and body part-->
 
     <div class="container-fluid">
     
     
       
     		<% Connection con = DBUtil.provideConnection(); %>   
      
      <!-- Next part of same container-fluid in which galary or other information will be shown-->
      
      <%-- <jsp:include page="login.jsp"></jsp:include> --%>
      
   <div class="col-md-8">
 <table style="width: 100%; margin-left:250px">
    <tr>
        <td style="text-align: center;">
            <div id="show" style="display: inline-block; color: blue; margin: auto;">
                Tender bid status
            </div>
        </td>
    </tr>
</table>
<!-- Add the dropdown menu for filtering bid status -->
<select id="bidStatusFilter">
    <option value="">All Status</option>
    <option value="Pending">Pending</option>
    <option value="Accepted">Accepted</option>
    <option value="Rejected">Rejected</option>
</select>

	  </div>
	  <div id="filteredBids"></div>

	  
	   </div> <!-- End of container-fluid-->
<script>
// Function to fetch and display bidder data based on selected status
function filterBids(selectedStatus) {
    // Send an AJAX request to the server to fetch filtered data
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById('filteredBids').innerHTML = this.responseText;
        }
    };
    xhr.open('GET', 'filterBids.jsp?status=' + selectedStatus, true);
    xhr.send();
}

// JavaScript code to handle the change event of the select input
document.getElementById('bidStatusFilter').addEventListener('change', function() {
    var selectedStatus = this.value;
    filterBids(selectedStatus); // Call the function to fetch and display bidder data
});

// Fetch and display bidder data initially with "All Status" selected
window.onload = function() {
    var selectedStatus = document.getElementById('bidStatusFilter').value;
    filterBids(selectedStatus); // Call the function to fetch and display bidder data
};
</script>



 

<!-- Now from here the footer section starts-->
                      
<!-- Including the footer of the page -->
    
<jsp:include page="footer.jsp"></jsp:include>

</body>
<style>
.filter-container {
        margin-bottom: 10px; /* Adjust the margin bottom as needed */
        text-align: center; /* Center the select element */
        padding-bottom:10px;
    }
    #bidStatusFilter {
        width: 200px; /* Adjust the width as needed */
        padding: 5px; /* Add padding to make it visually appealing */
        border-radius: 5px; /* Add some border-radius for rounded corners */
        border: 1px solid #ccc; /* Add a border for better visibility */
        background-color: #fff; /* Set background color */
        color: #333; /* Set text color */
        font-size: 16px; /* Set font size */
         margin-bottom: 10px;
    }
    input,textarea,select{
    	min-width:450px;
    	font-size:16px;
    	background-color:#f8f8f8;
    }
    input:hover,textarea:hover,select:hover{
    	min-width:450px;
    	background-color:white;
    }
	table, th, td { 
				margin-bottom:10px;
				margin-left:20%;
				font-size:20px;
                border: 2px solid green; 
                text-align:center; 
                background-color:white;
                color:#003399;
            } 
             td { 
                padding: 20px; 
                background-color:none; 
            } 
            th{
            	padding:20px;
            	background-color:#660033;
            	color:white;
            	font-weight:bold;
            }

</style>
</html>

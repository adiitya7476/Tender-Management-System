<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*,com.sgm.utility.DBUtil, javax.servlet.annotation.WebServlet" errorPage="errorpage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <link rel="shortcut icon" type="image/png" href="images/Logo2.png">
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

    <style>
        #faqs label {
            display: block;
            margin-bottom: 10px;
            cursor: pointer;
        }

        #faqs h4 {
            color: #0066cc;
            margin-bottom: 5px;
        }

        #faqs p {
            color: #555;
            margin-bottom: 10px;
            display: none;
        }

        #faqs input[type="checkbox"] {
            display: none;
        }

        #faqs input[type="checkbox"]:checked + label p {
            display: block;
        }
        #faqs .scroll-icon {
   	 display: inline-block;
    margin-left: 5px;
    font-size: 18px; 
    transition: transform 0.3s ease-in-out;
    }
    
#faqs input[type="checkbox"]:checked + label h4 .scroll-icon {
    transform: rotate(180deg);
}
    </style>
</head>
  
<body>
	<!-- Including the header of the page  -->
	
	<jsp:include page="loginHeader.jsp"></jsp:include>
	
	<jsp:include page="menu.jsp"></jsp:include>
	
	<div class="clearfix hidden-sm hidden-xs" style="color:white;background-color: green; margin-top:-15px; margin-bottom: 12px"><marquee>Welcome to Tender Management Site</marquee>
 </div> <!--A green color line between header and body part-->
 
     <div class="container-fluid">
     
     	<div class="notice">
        <div class="col-md-3"style="margin-left:2%">
     		<% Connection con = DBUtil.provideConnection(); %>
     		
     		<jsp:include page="notice.jsp"></jsp:include><br>
     		
          <!-- Next marquee starting-->
          <jsp:include page="approved.jsp"></jsp:include><br>
          
        </div>  <!-- End of col-md-3-->
      </div> <!-- End of notice class-->
      
      <!-- Next part of same container-fluid in which galary or other information will be shown-->
      
      <jsp:include page="galary.jsp"></jsp:include>
      
    </div> <!-- End of container-fluid-->
	
	
 
	
	<!-- Inside the blank space of your web application -->
<div id="faqs" class="faqs-container">
	 <h4 style="background-color:black; margin-top:-1.8px; margin-bottom:1px;padding: 5px; text-align: center;color:white;font-weight:bold">
        &nbsp; <span id="questions">FAQs</span></h4>
    <input type="checkbox" id="faq1">
    <label for="faq1"> 
        <h4><i>What is Tender ?</i>
         <span class="scroll-icon">&#x25BC;</span>
         </h4>
        
        <p>A tender is a formal written offer or proposal made by a person or
         company for the supply of goods, services, or work.</p>
    </label>

    <input type="checkbox" id="faq2">
    <label for="faq2">
        <h4><i>What services do you provide ? </i>
        <span class="scroll-icon">&#x25BC;</span></h4>
        
        <p>We offer a range of services including bidding for a tender, viewing past bids and monitoring status of the bid.</p>
    </label>
    
    <input type="checkbox" id="faq3">
      <label for="faq3">
        <h4><i>How can I contact customer support ? </i>
        <span class="scroll-icon">&#x25BC;</span></h4>
        
        <p>You can connect us on adiitya7476007@gmail.com</p>
    </label>
    
    <input type="checkbox" id="faq4">
      <label for="faq4">
        <h4><i>How do I reset my password ? </i>
        <span class="scroll-icon">&#x25BC;</span></h4>
        
        <p>Follow these steps: Login -> Account -> Change Password</p>
    </label>

    <!-- Add more FAQ items as needed -->
</div>

	
	



<!-- Now from here the footer section starts-->
                      
<!-- Including the footer of the page -->
    
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

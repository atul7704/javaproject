<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
  <link  href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_wzntns6GaJqVwyv-LLKlYvlB05D2LWY0Jg&s" rel="icon">
  <link href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_wzntns6GaJqVwyv-LLKlYvlB05D2LWY0Jg&s" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Amatic+SC:wght@400;700&display=swap" rel="stylesheet">


  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
  <style> 
  body{
 
   background-image: url("https://st2.depositphotos.com/1265075/7581/i/450/depositphotos_75818865-stock-photo-web-contact-us-concept.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  margin: 0;
  padding: 0;
  min-height: 100vh;
  }
  h1{
  font-weight: 900;
  color: black;

  margin-top:5%;
  margin-left:30%;
  position:fixed;
  }

  }
   </style>
</head>
<body>
 <header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container position-relative d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center me-auto me-xl-0">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1 class="sitename">TastyBites <span>.</span></h1>
       
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="http://localhost:8080/JAVA_WEB_DEVELOPMENT/index.html#hero" class="active">Home<br></a></li>
          <li><a href="http://localhost:8080/JAVA_WEB_DEVELOPMENT/index.html#about">About</a></li>
          <li><a href="http://localhost:8080/JAVA_WEB_DEVELOPMENT/index.html#menu">Menu</a></li>
          <li><a href="http://localhost:8080/JAVA_WEB_DEVELOPMENT/index.html#events">Events</a></li>
          <li><a href="http://localhost:8080/JAVA_WEB_DEVELOPMENT/index.html#chefs">Chefs</a></li>
          <li><a href="http://localhost:8080/JAVA_WEB_DEVELOPMENT/index.html#gallery">Gallery</a></li>
          <li><a href="http://localhost:8080/JAVA_WEB_DEVELOPMENT/index.html#contact">Contact</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

      <a class="btn-getstarted" href="index.html#book-a-table">Book a Table</a>
       <a class="btn-getstarted" href="index.html#book-a-table">Login</a>

    </div>
  </header>

<%  

String nm=request.getParameter("name");
String eml=request.getParameter("email");
String sub=request.getParameter("subject");
String mess=request.getParameter("message");


Connection con;
PreparedStatement pstmt;
try {
	Class.forName("org.postgresql.Driver");//it force java to load postgresql driver class in memory
    String url = "jdbc:postgresql://localhost:5432/DigiMenu";
    String user = "postgres";
    String pwd = "Chhotu@2002";
    con = DriverManager.getConnection(url, user, pwd);
    System.out.println("Connection OK");

  

    // Query
    String Q = "INSERT INTO ContactUs(name, email, subject, message) VALUES (?, ?, ?, ?)";
    pstmt = con.prepareStatement(Q);
    pstmt.setString(1, nm);
    pstmt.setString(2, eml);
    pstmt.setString(3, sub);
    pstmt.setString(4, mess);

    int r = pstmt.executeUpdate();

    if (r > 0) {
       out.println("<center>    <h1>Your Message has been sent thank you for Contacting US</h1> <center>");
    } else {
        out.println("Insert failed");
    }

} catch (Exception e) {
   out.println(e);
}

%>
</body>
</html>
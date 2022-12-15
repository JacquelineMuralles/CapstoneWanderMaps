<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="include/header.jsp"/>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<!---------------------------------------------------- NAVBAR ---------------->
<nav class="navbar navbar-expand-lg d-flex justify-content-between" style="background-color:#F1EBE7">
  <div class="d-flex justify-content-start">
    <a class="nav-link ms-5" href="/index"><img src="../../pub/images/WMLogoDark.png" alt=""></a>
  </div>
  <div class="d-flex justify-content-center">
    <a class="nav-link active ms-5" aria-current="page" href="/index"><h2>Home</h2></a>
    <a class="nav-link ms-5" href="/trip/tripdetails"><h2>Start An Adventure</h2></a>
    <a class="nav-link ms-5" href="/trip/trips"><h2>View Your Adventures</h2></a>
  </div>
  <div class="d-flex mx-5">
    <sec:authorize access="!isAuthenticated()"> 
      <a class="nav-link ms-5" href="/user/login"><h2>Login</h2></a>
      <a class="nav-link ms-5" href="/user/createuser"><h2>Sign-Up</h2></a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
      <a class="nav-link ms-5" href="/user/logout"><h2>Logout</h2></a>
    </sec:authorize>
  </div>
</nav>

<!---------------------------------------------------- landing section -------->
<div class="landing-section d-flex justify-content-space-between" style="background-color: #F1EBE7;">
  <div class="px-5 text-center d-flex align-content-around justify-content-center flex-wrap py-5">
    <img src="../../pub/images/wanderMapsLogoDark.png" alt="Wander Maps">
    <h2 class="px-5">Creating adventure maps so you never have to worry about the details.</h2>
    <a href="/trip/tripdetails"><img src="../../pub/images/createAdventureButton.png" alt="Create An Adventure"></a>
  </div>

  <div>
    <img src="../../pub/images/indexLandingImage.png" alt="Landing Page Image">
  </div>
</div>

<!---------------------------------------------------- welcome section -------->
<div style="background-color:#F1EBE7" class="welcome py-5">
  <h1 class="headerFont text-center" style="color: #745E58">Welcome</h1>
  <div class="container my-5">
    <div class="text-container">
      <p>WanderMaps was created to help you organize your trips. We know the struggle! You invest so much time, energy, and money to create experiences that will give you memories you can cherish for life but then you get to where you're going and you end up in world of chaos. You have to keep track of everywhere you want to see, everywhere you want to eat, and if it's a mult-trip vacation you also have to worry about arrival and departure dates.That's where WanderMaps comes in!</p>
    </div>
    <div class="text-container">
      <p>We help you organize all of your information in one place so you can schedule beforehand and then have all of your information in one place. With this much organization you can focus on the most important piece of your trip, getting lost in creating memories. So, relax, sit back, and let us keep you sane. Soon to come: an alert system to help remind you of important times and days in your trip that are fast approaching! Also we plan to allow you to connect with other users and create trips together!</p>
    </div>
  </div>
</div>
  
<!-- services section -->
<div style="background-color:#745E58" class="services">
  <div>
  <h1 class="text-center" style="color:#DDB5A9">All You Have To Do Is:</h1>
  <div class="d-flex justify-content-center">
    <img src="../../pub/images/servicesTagline.png" alt="" id="servicesTagline">
  </div>
  </div>
  <div class="container">
    <ul class="list-container">
      <li><h2>Name your trip.</h2></li>
      <li><h2>Put in where you'd like to go.</h2></li>
      <li><h2>Put in when you'd like to go.</h2></li>
      <li><h2>Decide how long you'd like to visit.</h2></li>
    </ul>
    <ul class="list-container">
      <li><h2>Put in how you're going to get there.</h2></li>
      <li><h2>Put in where you'll stay once you get there.</h2></li>
      <li><h2>Add events you'd like to do while you're there.</h2></li>
      <li><h2>Add more locations to your trip if you'd like.</h2></li>
    </ul>
  </div>
</div>
</div>

<jsp:include page="include/footer.jsp"/>
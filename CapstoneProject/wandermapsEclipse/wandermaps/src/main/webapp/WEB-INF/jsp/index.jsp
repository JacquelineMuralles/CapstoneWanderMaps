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
    <a class="nav-link ms-5" href="/trips"><h2>View Your Adventures</h2></a>
    <a class="nav-link ms-5" href="/contact"><h2>Contact</h2></a>
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
    <a href="/tripdetails/addtrip"><img src="../../pub/images/createAdventureButton.png" alt="Create An Adventure"></a>
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
      <p>Lorem ipsum dolor sit amet. Ex expedita doloremque est animi tempore aut mollitia excepturi ut dolor voluptatem. Et eaque corrupti est nemo perspiciatis id reprehenderit amet et maxime enim ut rerum repellendus! Id alias porro et fuga reprehenderit qui quibusdam optio ab aliquam corporis et necessitatibus accusamus. Et quia cupiditate ea inventore voluptas ut voluptates natus qui dolores placeat ut rerum beatae et voluptatum nihil. Lorem ipsum dolor sit amet, consectet adip.</p>
    </div>
    <div class="text-container">
      <p>Lorem ipsum dolor sit amet. Et vero veritatis hic aliquam nemo 33 vero repellendus. Eos officia accusamus qui delectus fugiat rem totam pariatur et cumque dignissimos. Et voluptas aperiam est inventore facilis est nihil sapiente 33 dolore dolor ea optio corporis aut enim nulla sed internos temporibus. Eum consectetur dolorem qui debitis vitae ad reiciendis impedit ea nisi doloribus nam soluta pariatur et delectus natus. beatae et voluptatum nihil. Lorem ipsum dolor sit amet, consectet adip.</p>
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
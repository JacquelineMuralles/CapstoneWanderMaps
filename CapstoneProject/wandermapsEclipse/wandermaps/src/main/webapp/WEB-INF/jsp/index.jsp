<jsp:include page="include/header.jsp"/>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<!---------------------------------------------------- NAVBAR ---------------->
<nav class="navbar navbar-expand-lg d-flex justify-content-evenly" style="background-color:#745E58">
  <sec:authorize access="!isAuthenticated()"></sec:authorize>
    <div class="navbar-logo d-flex justify-content-start">
      <a class="nav-link ms-5" href="/index"><img src="" alt=""></a>
    </div>

    <div class="navbar-nav">
      <div clas="regular-nav d-flex justify-content-center">
      <a class="nav-link active ms-5" aria-current="page" href="#"><h2>Home</h2></a>
      <a class="nav-link ms-5" href="/tripdetails/addtrip"><h2>Start An Adventure</h2></a>
      <a class="nav-link ms-5" href="/contact"><h2>Contact</h2></a>
      </div>

      <div class="user-nav d-flex justify-content-end">
        <img src="" alt="">
        <a class="nav-link ms-5" href="/user/login"><h2>Login</h2></a>
        <a class="nav-link ms-5" href="/user/createuser"><h2>Sign-Up</h2></a>
      </div>
    </div>
  </sec:authorize>

  <sec:authorize access="isAuthenticated()"></sec:authorize>
    <div class="navbar-logo">
      <a class="nav-link ms-5" href="/index"><img src="" alt=""></a>
    </div>

    <div class="navbar-nav">
      <div clas="regular-nav">
      <a class="nav-link active ms-5" aria-current="page" href="#"><h2>Home</h2></a>
      <a class="nav-link ms-5" href="/tripdetails/addtrip"><h2>Start An Adventure</h2></a>
      <a class="nav-link ms-5" href="/trips"><h2>View Your Adventures</h2></a>
      <a class="nav-link ms-5" href="/contact"><h2>Contact</h2></a>
      </div>

      <div class="user-nav">
        <img src="" alt="">
        <a class="nav-link ms-5" href="/user/logout"><h2>Logout</h2></a>
      </div>
    </div>
  </sec:authorize>
</nav>

<!---------------------------------------------------- landing section -------->
<div class="landing-section" style="background-color: #DDB5A9">
  <h1 class="headerFont text-center" style="color: #745E58">Wander Maps</h1>
  <h2>Welecome </h2>
  <img src="/images/tagline.png" alt="" id="tagline">
</div>

<!---------------------------------------------------- welcome section -------->
<div style="background-color:#DDB5A9" class="welcome">
  <h1 class="headerFont text-center" style="color: #745E58">Welcome</h1>
  <div class="container">
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
  <h1 class="text-center" style="color:#DDB5A9">We Make Travel Easy</h1>
  <img src="/images/servicesTagline.png" alt="" id="servicesTagline">
  <div class="container">
    <ul class="list-container">
      <li><h2>Lorem ipsum dolor sit amet.</h2></li>
      <li><h2>Lorem ipsum dolor sit amet.</h2></li>
      <li><h2>Lorem ipsum dolor sit amet.</h2></li>
      <li><h2>Lorem ipsum dolor sit amet.</h2></li>
    </ul>
    <ul class="list-container">
      <li><h2>Lorem ipsum dolor sit amet.</h2></li>
      <li><h2>Lorem ipsum dolor sit amet.</h2></li>
      <li><h2>Lorem ipsum dolor sit amet.</h2></li>
      <li><h2>Lorem ipsum dolor sit amet.</h2></li>
    </ul>
  </div>
</div>

<jsp:include page="include/footer.jsp"/>
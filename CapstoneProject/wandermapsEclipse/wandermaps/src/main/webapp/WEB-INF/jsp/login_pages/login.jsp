<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="../../../pub/css/login.css">
<jsp:include page="../include/header.jsp"/>
</head>
<body style="background-color: #F1EBE7">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<!------------------------------------------- NAVBAR ---------------->

<nav class="navbar navbar-expand-lg d-flex justify-content-between" style="background-color:#F1EBE7">
  <div class="d-flex justify-content-start">
    <a class="nav-link ms-5" href="/index"><img src="../../pub/images/WMLogoDark.png" alt=""></a>
  </div>
  <div class="d-flex justify-content-center">
    <a class="nav-link active ms-5" href="/index"><h2>Home</h2></a>
    <a class="nav-link ms-5" href="/trip/tripdetails"><h2>Start An Adventure</h2></a>
    <a class="nav-link ms-5" href="/trips"><h2>View Your Adventures</h2></a>
    <a class="nav-link ms-5" href="/contact"><h2>Contact</h2></a>
  </div>
  <div class="d-flex mx-5">
    <sec:authorize access="!isAuthenticated()"> 
      <a class="nav-link ms-5" aria-current="page" href="/user/login"><h2>Login</h2></a>
      <a class="nav-link ms-5" href="/user/createuser"><h2>Sign-Up</h2></a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
      <a class="nav-link ms-5" href="/user/logout"><h2>Logout</h2></a>
    </sec:authorize>
  </div>
</nav>

<div class="headerContainer">
<img src="../../../pub/images/wanderMapsLogoDark.png" alt="">
</div>

<!-------------------------------------------- LOGIN FORM --------------------->
<div class="container">

  <div>
    <img style="border-radius: 2%" src="../../../pub/images/loginImage.png" alt="Paris Adventure">
  </div>
  
  <form style="background-color: #E3B9A4" class="p-3" action="/user/loginpost" method="POST">
      <div class="row">
        <div class="mt-2 mb-3 col-12">
          <label for="username" class="form-label">Username</label>
          <input style="background-color: #f1ebe7" type="username" name="username" class="form-control" id="username"
                        aria-describedby="usernameHelp">
          <div id="usernameHelp" class="form-text">Enter your username</div>
        </div>
      </div>
      <div class="row">
        <div class="mt-2 mb-3 col-12">
          <label for="password" class="form-label">Password</label>
          <input style="background-color: #f1ebe7" type="password" name="password" class="form-control" id="password"
                        aria-describedby="passwordHelp">
          <div id="passwordHelp" class="form-text">Enter your password</div>
        </div>
      </div>
      <div class="row">
        <div class="mt-2 mb-3 col-4">
          <button style="background-color: #f1ebe7" type="submit" class="btn">Submit</button>
        </div>
      </div>
  </form>
</div>



<jsp:include page="../include/footer.jsp"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
      <a class="nav-link active ms-5" href="/index"><h2>Home</h2></a>
      <a class="nav-link ms-5" href="/tripdetails/addtrip"><h2>Start An Adventure</h2></a>
      <a class="nav-link ms-5" href="/contact"><h2>Contact</h2></a>
      </div>

      <div class="user-nav d-flex justify-content-end">
        <img src="" alt="">
        <a class="nav-link ms-5" aria-current="page" href="/user/login"><h2>Login</h2></a>
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

<!-------------------------------------------- LOGIN FORM --------------------->
        <div class="container">
          <div class="row mt-3 mb-1 justify-content-center">
              <div class="col-4">
                <h2>Login</h2>
              </div>
          </div>
  
          <form action="/user/loginpost" method="POST">
              <div class="row justify-content-center">
                <div class="mt-2 mb-3 col-4">
                    <label for="username" class="form-label">Username</label>
                    <input type="username" name="username" class="form-control" id="username"
                        aria-describedby="usernameHelp">
                    <div id="usernameHelp" class="form-text">Enter your username</div>
                </div>
              </div>
              <div class="row justify-content-center">
                <div class="mt-2 mb-3 col-4">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="password"
                        aria-describedby="passwordHelp">
                    <div id="passwordHelp" class="form-text">Enter your password</div>
                </div>
            </div>
  
              <div class="row justify-content-center">
                <div class="mt-2 mb-3 col-4">
                  <button type="submit" class="btn btn-primary">Submit</button>
                 </div>
            </div>
          </form>
      </div>

            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        </div>

<jsp:include page="include/footer.jsp"/>
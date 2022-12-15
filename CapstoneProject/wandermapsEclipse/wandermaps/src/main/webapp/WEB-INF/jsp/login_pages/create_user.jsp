<link rel="stylesheet" href="../../../pub/css/createUser.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../include/header.jsp"/>

  </head>
  <body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<!------------------------------------------- NAVBAR ---------------->

<nav class="navbar navbar-expand-lg d-flex justify-content-between" style="background-color:#F1EBE7">
  <div class="d-flex justify-content-start">
    <a class="nav-link ms-5" href="/index"><img src="../../pub/images/WMLogoDark.png" alt=""></a>
  </div>
  <div class="d-flex justify-content-center">
    <a class="nav-link active ms-5" aria-current="page" href="/index"><h2>Home</h2></a>
    <a class="nav-link ms-5" href="/trip/tripdetails"><h2>Start An Adventure</h2></a>
    <a class="nav-link ms-5" href="/trip/trips"><h2>View Your Adventures</h2></a>
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




  <!-- <div class="container"> -->
    <div class="headingContainer">
      <img  id="heading" src="../../../pub/images/wanderMapsLogoDark.png" alt="">
    </div>

            
          

<!----------------------------------------- ERROR CONFIGURATION --------------->
    <c:if test="${bindingResult.hasErrors()}">
      <c:forEach items="${bindingResult.getAllErrors()}" var="error">
        <p class="mb-0" style="color:red">${error.getDefaultMessage()}</p>
      </c:forEach>
    </c:if>

<!----------------------------------------- CREATE USER FORM ------------------>

    <div class="userFormContainer">
      <form action="/user/createuser" method="POST"> 
        <input type="hidden" name="userId" value="10">
<!---------------------------- FIRST ROW -->
        <div class="row">
          <div class="mb-3 col-6">
            <label for="firstName" class="form-label">First Name</label>
            <input style="background-color: #F1EBE7" type="text" value="${form.firstName}" name="firstName" class="form-control" id="firstName" aria-describedby="firstNameHelp">
            <div id="fristNameHelp" class="form-text">Please give us your first name</div>
          </div>
      
          <div class="mb-3 col-6">
            <label for="lastName" class="form-label">Last Name</label>
            <input style="background-color: #F1EBE7" type="text" value="${form.lastName}" name="lastName" class="form-control" id="lastName" aria-describedby="lastNameHelp">
            <div id="lastNameHelp" class="form-text">Please give us your last name</div>
          </div>
        </div>
<!---------------------------- Second ROW -->
        <div class="row">
                
          <div class="mb-3 col-6">
            <label for="exampleInputEmail1" class="form-label">Email address</label>
            <input style="background-color: #F1EBE7" type="email" value="${form.email}" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
             <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
          </div>
          <div class="mb-3 col-6">
            <label for="username" class="form-label">Username</label>
            <input style="background-color: #F1EBE7" type="text" value="${form.username}" name="username" class="form-control" id="exampleUsername" aria-describedby="usernameHelp">
            <div id="usernameHelp" class="form-text">Enter a username as unique as you are.</div>
          </div>
        </div>
<!---------------------------- THIRD ROW -->
        <div class="row">
          <div class="mb-3 col-6">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input style="background-color: #F1EBE7" type="password" value="${form.password}"  name="password" class="form-control" id="exampleInputPassword1">
          </div>
        
          <div class="mb-3 col-6">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input style="background-color: #F1EBE7" type="password" value="${form.confirmPassword}"  name="confirmPassword" class="form-control" id="confirmPassword">
          </div>
        </div>
<!---------------------------- FOURTH ROW -->
        
        <div class="row">
          <div class="mb-3 col-6">
            <label for="country" class="form-label">Country</label>
            <input style="background-color: #F1EBE7" type="text" value="${form.country}" name="country" class="form-control" id="country" aria-describedby="countryHelp">
            <div id="countryHelp" class="form-text"></div>
          </div>

          <div class="mb-3 col-6">
            <label for="state" class="form-label">State</label>
            <input style="background-color: #F1EBE7" type="text" value="${form.state}" name="state" class="form-control" id="state" aria-describedby="stateHelp">
            <div id="stateHelp" class="form-text"></div>
          </div>
        </div>

        <div class="row">
          <div class="mb-3 col-6">
            <label for="city" class="form-label">City</label>
            <input style="background-color: #F1EBE7" type="text" value="${form.city}" name="city" class="form-control" id="city" aria-describedby="cityHelp">
            <div id="cityHelp" class="form-text"></div>
          </div>
  
          <div class="mb-3 col-6">
            <label for="timezone" class="form-label">Timezone</label>
            <input style="background-color: #F1EBE7" type="text" value="${form.timezone}" name="timezone" class="form-control" id="timezone" aria-describedby="timezoneHelp">
            <div id="timezoneHelp" class="form-text"></div>
          </div>
        </div>

                
        <div class="row">
          <div class="mb-3 col-12">
            <label for="message" class="form-label">Personal Message</label>
            <input style="background-color: #F1EBE7" type="text" value="${form.message}" name="message" class="form-control" id="message" aria-describedby="messageHelp">
            <div id="messageHelp" class="form-text">Set a small personal mesage about adventure.</div>
          </div>
        </div>
        
        <button type="submit" class="btn" style="background-color: #F1EBE7">Submit</button>
      </form>
    </div>
  <!-- </div> -->




<jsp:include page="../include/footer.jsp"/>
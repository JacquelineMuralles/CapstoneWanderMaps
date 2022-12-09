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
                <a class="nav-link ms-5" href="/user/login"><h2>Login</h2></a>
                <a class="nav-link ms-5" aria-current="page" href="/user/createuser"><h2>Sign-Up</h2></a>
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


        <div class="container">
          <div class="row mt-3 mb-1">
            <h2>Create User</h2>
          </div>
        
            <c:if test="${bindingResult.hasErrors()}">
                <c:forEach items="${bindingResult.getAllErrors()}" var="error">
                    <p class="mb-0" style="color:red">${error.getDefaultMessage()}</p>
                </c:forEach>
            </c:if>

<!----------------------------------------- CREATE USER FORM ------------------>
        
            <form action="/user/createuser" method="POST"> 
                <input type="hidden" name="drinkid" value="10">

                <div class="row">
                  <div class="mb-3 col-6">
                      <label for="firstName" class="form-label">First Name</label>
                      <input type="text" value="${form.firstName}" name="firstName" class="form-control" id="firstName" aria-describedby="firstNameHelp">
                      <div id="fristNameHelp" class="form-text">Please give us your first name</div>
                  </div>
      
                  <div class="mb-3 col-6">
                      <label for="lastName" class="form-label">Last Name</label>
                      <input type="text" value="${form.lastName}" name="lastName" class="form-control" id="lastName" aria-describedby="lastNameHelp">
                      <div id="lastNameHelp" class="form-text">Please give us your last name</div>
                  </div>
              </div>

              <div class="mb-3 col-6">
                <label for="age" class="form-label">Age</label>
                <input type="text" value="${form.age}" name="age" class="form-control" id="age" aria-describedby="lastNameHelp">
                <div id="ageHelp" class="form-text">Please give us your last age</div>
            </div>
        </div>
                
                <div class="mt-2 mb-3">
                  <label for="exampleInputEmail1" class="form-label">Email address</label>
                  <input type="email" value="${form.email}" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                  <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
              </div>
                

                String encodedPassword = passwordEn
                
                <div class="row">
                    <div class="mb-3 col-6">
                        <label for="exampleInputPassword1" class="form-label">Password</label>
                        <input type="password" value="${form.password}"  name="password" class="form-control" id="exampleInputPassword1">
                    </div>
        
                    <div class="mb-3 col-6">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" value="${form.confirmPassword}"  name="confirmPassword" class="form-control" id="confirmPassword">
                    </div>
                </div>
        

        
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" value="${form.address}" name="address" class="form-control" id="address" aria-describedby="addressHelp">
                    <div id="addressHelp" class="form-text">We want to send you physical advertisements every day</div>
                </div>
        
                <div class="row">
                    <div class="mb-3 col-4">
                        <label for="city" class="form-label">City</label>
                        <input type="text" value="${form.city}" name="city" class="form-control" id="city" aria-describedby="cityHelp">
                        <div id="cityHelp" class="form-text"></div>
                    </div>
        
                    <div class="mb-3 col-4">
                        <label for="state" class="form-label">State</label>
                        <input type="text" value="${form.state}" name="state" class="form-control" id="state" aria-describedby="stateHelp">
                        <div id="stateHelp" class="form-text"></div>
                    </div>
        
                    <div class="mb-3 col-4">
                        <label for="zip" class="form-label">Zip</label>
                        <input type="text" value="${form.zip}" name="zip" class="form-control" id="zip" aria-describedby="zipHelp">
                        <div id="zipHelp" class="form-text"></div>
                    </div>
                </div>
        
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="text" value="${form.phone}" name="phone" class="form-control" id="phone" aria-describedby="phoneHelp">
                    <div id="phoneHelp" class="form-text">We will send you text messages even if you unsubscribe</div>
                </div>
        
                <div class="mb-3">
                    <label for="avatar" class="form-label">Avatar</label>
                    <input type="text" value="${form.avatar}" name="avatar" class="form-control" id="avatar" aria-describedby="phoneHelp">
                    <div id="avatarHelp" class="form-text">Enter the full URL that you want for your avatar image</div>
                </div>
        
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>


<jsp:include page="include/footer.jsp"/>
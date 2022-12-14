<link rel="stylesheet" href="../../../pub/css/tripDetails.css">
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
    <a class="nav-link active ms-5" href="/index"><h2>Home</h2></a>
    <a class="nav-link ms-5" aria-current="page" href="/trip/tripdetails"><h2>Start An Adventure</h2></a>
    <a class="nav-link ms-5" href="/trip/viewtrips"><h2>View Your Adventures</h2></a>
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

<div class="tripDetailLanding">
  <div class="logoContainer">
    <img class="logo" src="../../../pub/images/wanderMapsLogoDark.png" alt="">
  </div>
  <div class="subHeadContainer">
    <h2>Welcome ${name}, let's create a trip. Name your trip below then add in all of the details. Hurry, adventure awaits!</h2>
  </div>
</div>

<!----------------------------------------- ERROR CONFIGURATION --------------->


<f:if test="${bindingResult.hasErrors()}">
<c:forEach items="${bindingResult.getAllErrors()}" var="error">
  <p class="mb-0" style="color:red">${error.getDefaultMessage()}</p>
</c:forEach>
</f:if>
<f:if test="${!bindingResult.hasErrors()}">
<p>Signup Success! <a href="/trip/addTripEvent?id=${trip.getId()}">Let's add some adventures to your trip!</a></p>
</f:if>



<div class="tripDetailsFormContainer">
  
  <form action="/trip/tripdetails" method="POST" id="tripDetailsForm"> 
    <div class="row">
      <h2 class="mb-3 col-12 text-center">Now, on to the details:</h2>
    </div>
    <input type="hidden" name="tripDetailsId" value="10">
    
    <div class="row">
      <div class="mb-3 col-12">
        <label for="name" class="form-label">Name Your Trip</label>
        <input style="background-color: #F1EBE7" type="text" value="${form.name}" name="name" class="form-control" id="name" aria-describedby="nameHelp">
        <div id="typeHelp" class="form-text">Please type a descriptive name for your trip.</div>
      </div>
    </div>

    <div class="row">
      <div class="mb-3 col-6">
        <label for="arrivalDate" class="form-label">Arrival Date</label>
        <input style="background-color: #F1EBE7" type="text" value="${form.arrivalDate}" name="arrivalDate" class="form-control" id="arrivalDate" aria-describedby="arrivalDateHelp">
        <div id="arrivalDateHelp" class="form-text">Enter the day you arrive to your destination in YYYY-MM-DD format</div>
      </div>
  
      <div class="mb-3 col-6">
        <label for="departureDate" class="form-label">Departure Date</label>
        <input style="background-color: #F1EBE7" type="text" value="${form.departureDate}" name="departureDate" class="form-control" id="departureDate" aria-describedby="departureDateHelp">
        <div id="dateHelp" class="form-text">Enter the day you depart your destination in YYYY-MM-DD format</div>
      </div>
    </div>


    <div class="row">
            
      <div class="mb-3 col-6">
        <label for="country" class="form-label">Country</label>
        <input style="background-color: #F1EBE7" type="country" value="${form.country}" name="country" class="form-control" id="country" aria-describedby="countryHelp">
         <div id="countryHelp" class="form-text">What country are you visiting?</div>
      </div>

      <div class="mb-3 col-6">
        <label for="state" class="form-label">State</label>
        <input style="background-color: #F1EBE7" type="text" value="${form.state}" name="state" class="form-control" id="state" aria-describedby="stateHelp">
        <div id="stateHelp" class="form-text">If state is unknown, input the city you are visiting.</div>
      </div>
    </div>
    
    <div class="row">
            
      <div class="mb-3 col-6">
        <label for="city" class="form-label">City</label>
        <input style="background-color: #F1EBE7" type="city" value="${form.city}" name="city" class="form-control" id="city" aria-describedby="cityHelp">
         <div id="cityHelp" class="form-text">Input the city you are visiting, even if listed above.</div>
      </div>

      <div class="mb-3 col-6">
        <label for="timezone" class="form-label">Timezone</label>
        <input style="background-color: #F1EBE7" type="text" value="${form.timezone}" name="timezone" class="form-control" id="timezone" aria-describedby="timezoneHelp">
        <div id="timezoneHelp" class="form-text">Please indicate the abbreviation of the timezone of the destination.</div>
      </div>
    </div>

    <div class="row">
      <div class="mb-3 col-12">
        <label for="transType" class="form-label">Transportation Type</label>
        <select style="background-color: #F1EBE7" value="${form.transType}" name="transType" class="form-control" id="transType" aria-describedby="transTypeHelp">
          <option value="plane">Plane</option>
          <option value="train">Train</option>
          <option value="bus">Bus</option>
          <option value="car">Car</option>
          <option value="boat">Boat</option>
          <option value="onFoot">On Foot</option>
        </select>
        <div id="transTypeHelp" class="form-text">Please select from the drop down menu.</div>
      </div>
    </div>

    <div class="row">
            
      <div class="mb-3 col-6">
        <label for="lodgingType" class="form-label">Lodging Type</label>
        <select style="background-color: #F1EBE7" value="${form.lodgingType}" name="lodgingType" class="form-control" id="lodgingType" aria-describedby="lodgingTypeHelp">
          <option value="airBnB">AirBnB</option>
          <option value="hotel">Hotel</option>
          <option value="hostel">Hostel</option>
          <option value="vacationHome">Vacation Home</option>
          <option value="knownHome">Friend/Family Home</option>
          <option value="camping">Camping</option>
          <option value="rv">RV</option>
        </select>
        <div id="lodgingTypeHelp" class="form-text">Please select from the drop down menu.</div>
      </div>

      <div class="mb-3 col-6">
        <label for="lodgingAddress" class="form-label">Address</label>
        <input style="background-color: #F1EBE7" type="text" value="${form.lodgingAddress}" name="lodgingAddress" class="form-control" id="timezone" aria-describedby="lodgingAddressHelp">
        <div id="lodgingAddressHelp" class="form-text">Please indicate the abbreviation of the timezone of the destination.</div>
      </div>
    </div>


    
    <button onClick="SubmitForm()" type="submit" class="btn" style="background-color: #F1EBE7">  Submit</button>

    <button type="navigation" onClick="" class="btn addLocation" style="background-color: #F1EBE7">Add Another Location to your trip.</button>
  </form>
</div>



<jsp:include page="../include/footer.jsp"/>
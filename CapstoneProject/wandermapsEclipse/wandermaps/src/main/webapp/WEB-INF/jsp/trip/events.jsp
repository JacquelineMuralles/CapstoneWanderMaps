<link rel="stylesheet" href="../../../pub/css/events.css">
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


<div class="headingContainer">
  <img src="../../../pub/images/wanderMapsLogoLight.png" alt="">
</div>

<!----------------------------------------- ERROR CONFIGURATION --------------->
<f:if test="${bindingResult.hasErrors()}">
<c:forEach items="${bindingResult.getAllErrors()}" var="error">
  <p class="mb-0" style="color:red">${error.getDefaultMessage()}</p>
</c:forEach>
</f:if>

<!----------------------------------------- CREATE USER FORM ------------------>

<div class="eventFormContainer">
  <form action="/trip/events" method="POST"> 
    <input type="hidden" name="tripDetailsId" value="${tripDetailsId}">
<!---------------------------- FIRST ROW -->
    <div class="row">
      <div class="mb-3 col-6">
        <label for="type" class="form-label">Adventure Type</label>
        <input style="background-color: #F1EBE7" type="text" value="${form.type}" name="type" class="form-control" id="type" aria-describedby="typeHelp">
        <div id="typeHelp" class="form-text">What type of event is this? Outdoor, indoor, physical activity, sightseeing, etc.</div>
      </div>
  
      <div class="mb-3 col-6">
        <label for="date" class="form-label">Date of Event</label>
        <input style="background-color: #F1EBE7" type="text" value="${form.date}" name="date" class="form-control" id="date" aria-describedby="dateHelp">
        <div id="dateHelp" class="form-text">Please enter using the YYYY/MM/DD format</div>
      </div>
    </div>
<!---------------------------- Second ROW -->
    <div class="row">
            
      <div class="mb-3 col-12">
        <label for="address" class="form-label">Event Address</label>
        <input style="background-color: #F1EBE7" type="address" value="${form.address}" name="address" class="form-control" id="eventAddress" aria-describedby="addressHelp">
         <div id="addressHelp" class="form-text">Exact address not necessary, feel free to put cross streets or landmarks.</div>
      </div>
    </div>
            
    <div class="row">
      <div class="mb-3 col-12">
        <label for="description" class="form-label">Description of Event</label>
        <input style="background-color: #F1EBE7" type="text" value="${form.description}" name="description" class="form-control" id="eventDescription" aria-describedby="descriptionHelp">
        <div id="descriptionHelp" class="form-text">Small description of what you will be doing goes here.</div>
      </div>
    </div>
    
    <button type="submit" class="btn" style="background-color: #F1EBE7">Submit</button>

  </form>
</div>

<script>
  function SubmitForm(){
    alert("Your event has been added. Add another event or go back to continue adjusting your trip!");
  }
</script>





<jsp:include page="../include/footer.jsp"/>
<link rel="stylesheet" href="../../../pub/css/itinerary.css">
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


<!------------------------------------------- ITINERAY -->
<div class="table-holder">
<c:forEach items="${itineraryLocationInfo}" var="location">
  <div class="my-4 d-flex justify-content-center">
    <h1>${firstName}'s ${location.tripName}</h1>
  </div>
  <div class="text-center">
    <table class="table text-center text-left mt-5">
      <tbody>
        <tr>
          <th>${location.tripCountry} - ${location.tripState}</th>
          <th></th>
          <th></th>
          <th>${location.arrivalDate} - ${location.departureDate}</th>
        </tr>
        <tr>
          <td>${location.arrivalDate}</td>
          <td>Arive in ${location.tripCity} by ${location.transType}</td>
          <td>Drop luggage at: ${location.lodgingType}</td>
          <td>Address: ${location.lodgingAddress}</td>
        </tr>
      <!-- </tbody>
    </table> -->
    </c:forEach>
    
    <c:forEach items="${itineraryEventInfo}" var="event">
    <!-- <table class="table text-center">
      <tbody> -->
        <tr>
          <td>${event.eventDate}</td>
          <td>${event.eventType}</td>
          <td>${event.eventAddress}</td>
          <td>${event.eventDescription}</td>
          <td></td>
        </tr>
    </tbody>
  </c:forEach>
    </table>
</div>
</div>

<div class="d-flex justify-content-center">
  <a href="/trip/addTripEvent?id=${tripId}" + trip.getId()" + location.getTrip().getId()"><img src="../../../pub/images/addMoreEvents.png" alt=""></a>
</div>







<jsp:include page="../include/footer.jsp"/>
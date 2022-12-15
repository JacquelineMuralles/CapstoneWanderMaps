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

<div class="text-center mt-3 mb-5">
  <h1 style="color: #745d59">Congratulations!</h1>
  <h1 style="color: #745d59">Your trip has been created!</h1>
  <h2 style="color: #e3b8a4">Now time to schedule some fun!</h2>
</div>

<c:forEach items="${currentTrips}" var="trip">
<table class="table text-center">
  <thead>
    <tr>
      <th scope="col">Arrive: ${trip.arrival_date}</th>
      <th scope="col"></th>
      <th scrope="col"></th>
      <th scope="col"></th>
      <th scope="col">Depart: ${trip.departure_date}</th>
    </tr>
  </thead>
  <thead class="table-active">
    <tr>
      <th scope="col">Country</th>
      <th scope="col"></th>
      <th scope="col">State</th>
      <th scope="col"></th>
      <th scope="col">City</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>${trip.country}</td>
      <td></td>
      <td>${trip.state}</td>
      <td></td>
      <td>${trip.city}</td>
    </tr>
  </tbody>
  <thead class="table-active">
    <tr>
      <th scope="col">Transportaion</th>
      <th scope="col"></th>
      <th scope="col">Lodging</th>
      <th scope="col"></th>
      <th scope="col">Address</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>${trip.trans_type}</td>
      <td></td>
      <td>${trip.lodging_type}</td>
      <td></td>
      <td>${trip.lodging_address}</td>
    </tr>
  </tbody>
  <thead class="table-active">
    <tr>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col">Create Events</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td></td>
      <td></td>
      <td><a href="/trip/events?id=${trip.id}">Create Something Fun</a></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>
</c:forEach>

<div class="mt-5 mb-5 d-flex flex-column align-items-center">
<h2>Finished Adding Adventures?</h2>
<a href="/trip/itinerary?id=${tripId}"><img src="../../../pub/images/generateItinerary.png" alt="Generate Your Itierary!"></a>

</div>

<jsp:include page="../include/footer.jsp"/>
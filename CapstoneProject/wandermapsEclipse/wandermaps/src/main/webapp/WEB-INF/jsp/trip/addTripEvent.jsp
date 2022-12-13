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

<img src="../../../pub/images/wanderMapsLogoDark.png" alt="">
<div>
  <table>
    <c:forEach items="${currentTrips}" var="trip">
      <tr>
        <th>
          Arrive: ${currentTrips.getArrivalDate()}
          Depart: ${currentTrips.getDepartureDate()}
        </th>
      </tr>
      <tr>
        <td>Country: ${currentTrips.getCountry()}</td>
        <td>State: ${currentTrips.getState()}</td>
        <td>City: ${currentTrips.getCity()}</td>
      </tr>
      <tr>
        <td>Transportaion: ${currentTrips.getTransType()}</td>
        <td>${currentTrips.getLodgingType}</td>
        <td>Address: ${currentTrips.getLodgingAddress}</td>
      </tr>
      <!-- <tr><a href="/trip/events?id=${tripDetails.getId()}">Add An Something Fun For This Location</a></tr> -->
    </c:forEach>
    
  </table>
</div>
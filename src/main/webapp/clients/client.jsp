        <%@ page import="services.HotelService" %>
<%@ page import="daos.ClientDAO" %>
<%@ page import="entities.Client" %>
<%@ page import="entities.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page import="daos.ReservationDAO" %>
        <%@ page import="java.util.stream.Collectors" %><%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 18/07/2022
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    HotelService service = HotelService.getInstance();
    ClientDAO clientDAO = new ClientDAO(service.getManager());
    String clientId = request.getParameter("client_id"); // these variables change everytime we load this page
    if (clientId == null) {
        response.setStatus(404);
        return;
    }
    Client client = clientDAO.get(Integer.parseInt(clientId));

%>

<html>
<head>
    <title>Client details</title>
</head>
<body>
<h1>Client details</h1>
<ul>
    <li>
        <div>
            <p><span>Client number:</span> <%=client.getClientId()%></p>
            <p><span>First name:</span> <%=client.getFirstName()%></p>
            <p><span>Last name:</span> <%=client.getLastName()%></p>
            <p><span>Date of birth:</span> <%=client.getBirthDate()%></p>
            <p><span>Email address:</span> <%=client.getMail()%></p>
            <p><span>Phone number:</span> $<%=client.getTelephone()%></p>
        </div>

    </li>
</ul>
<div>
    <a href="../reservations/add?client_id=<%=client.getClientId()%>">Make a new reservation</a>
</div>
<div>
    <a href="../Hotel">Return to home page</a>
</div>

</body>
</html>

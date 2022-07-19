<%@ page import="services.HotelService" %>
<%@ page import="daos.ClientDAO" %>
<%@ page import="entities.Client" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    ClientDAO clientDAO = new ClientDAO(service.getManager());
    List<Client> clientList = clientDAO.getAll();
%>
<%@ include file="../header.jsp" %>
<form action="../reservations" method="get">
    <label for="email">Enter your email address:</label>
    <input name="client_email" id="email">
    <button type="submit">Get reservations</button>
</form>
<form action="all" method="get">
    <label for="client">Choose a client:</label>
    <select name="client_id" id="client">
        <% for (Client client : clientList) { %>
        <option value="<%= client.getClientId() %>"><%= client.getFirstName() %> <%= client.getLastName() %></option>
        <% } %>
    </select>
    <button type="submit">Get reservations</button>
</form>
<%@ include file="../footer.jsp" %>
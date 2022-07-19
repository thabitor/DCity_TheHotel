<%@ page import="services.HotelService" %>
<%@ page import="daos.ClientDAO" %>
<%@ page import="entities.Client" %>
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
<%@ include file="../header.jsp" %>
<div>
    <h1>Client details</h1>
    <ul>
        <li>
            <div>
                <p><span>Client number:</span> <%=client.getClientId()%>
                </p>
                <p><span>First name:</span> <%=client.getFirstName()%>
                </p>
                <p><span>Last name:</span> <%=client.getLastName()%>
                </p>
                <p><span>Date of birth:</span> <%=client.getBirthDate()%>
                </p>
                <p><span>Email address:</span> <%=client.getMail()%>
                </p>
                <p><span>Phone number:</span> $<%=client.getTelephone()%>
                </p>
            </div>

        </li>
    </ul>
    <div>
        <a href="../reservations?client_id=<%=client.getClientId()%>">See my reservations</a>
    </div>
</div>
<%@ include file="../footer.jsp" %>
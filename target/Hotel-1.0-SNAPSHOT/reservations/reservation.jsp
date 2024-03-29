<%@ page import="services.HotelService" %>
<%@ page import="daos.ReservationDAO" %>
<%@ page import="entities.Reservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());
    String id = request.getParameter("reservation_id"); // these variables change everytime we load this page
    if(id == null) {
        response.setStatus(404);
        return;
    }
    Reservation reservation = reservationDAO.get(Integer.parseInt(id));
%>
<%@ include file="../header.jsp" %>
    <h1>Reservation details</h1>
    <ul>
        <li>
            <div>
                <p><span>reservation_id:</span> <%= reservation.getReservationId() %></p>
                <p><span>client_id:</span> <%= reservation.getClient().getClientId() %></p>
                <p><span>Capacity:</span> <%= reservation.getCapacity() %></p>
                <p><span>Room:</span> <%= reservation.getRoom().getRoomId() %></p>
                <p><span>Description:</span> <%= reservation.getRoom().getDescription() %></p>
                <p><span>date_start:</span> <%= reservation.getDateStart() %></p>
                <p><span>date_end:</span> <%= reservation.getDateEnd() %></p>
                <p><span>price:</span> <%= reservation.getPrice() %></p>
            </div>
        </li>
    </ul>
    <div>
        <a href="../rooms">rooms list</a>
    </div>
<%@ include file="../footer.jsp" %>

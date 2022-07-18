package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletReservation", value = "/reservations")
public class ServletReservation extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clientId = request.getParameter("client_id");
        String clientEmail = request.getParameter("client_email");
        String reservationId = request.getParameter("reservation_id");
        if(clientId != null){
            response.sendRedirect(request.getContextPath() + "/reservations/all.jsp?client_id=" + clientId); // redirects to the client's reservation list
        }
        else if (clientEmail != null) {
            response.sendRedirect(request.getContextPath() + "/reservations/all.jsp?client_email=" + clientEmail); // redirects to the client's reservation list
        }
        else if (reservationId != null){
            response.sendRedirect(request.getContextPath() + "/reservations/reservation.jsp?reservation_id=" + reservationId); // redirects to the reservation details page
        }
        else {
            response.sendRedirect(request.getContextPath() + "/reservations/all.jsp"); // redirects to the reservations list page
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

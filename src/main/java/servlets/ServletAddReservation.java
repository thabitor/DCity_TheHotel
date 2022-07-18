package servlets;

import daos.ClientDAO;
import daos.ReservationDAO;
import daos.RoomDAO;
import entities.Client;
import entities.Reservation;
import entities.Room;
import services.HotelService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "ServletAddReservation", value = "/reservations/add")
public class ServletAddReservation extends HttpServlet {
    private final HotelService service = HotelService.getInstance();
    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());
    ClientDAO clientDAO = new ClientDAO(service.getManager());
    RoomDAO roomDAO = new RoomDAO(service.getManager());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        response.sendRedirect(request.getContextPath() + "/reservations/add.jsp?id=" + id);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // gets parameters from the form in reservations/add.jsp
        Client client =  clientDAO.get(Integer.parseInt(request.getParameter("client_id")));
        Room room = roomDAO.get(Integer.parseInt(request.getParameter("room_id")));
        System.out.println(request.getParameter("date_start"));
        LocalDate date_start = LocalDate.parse(request.getParameter("date_start"));
        LocalDate date_end = LocalDate.parse(request.getParameter("date_end"));
        double price = Double.parseDouble(request.getParameter("price"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        int id = (reservationDAO.insert(new Reservation(date_start, date_end, (date_end.getDayOfYear()-date_start.getDayOfYear())*price, capacity, client, room))).getReservationId(); // adds the new product to the list and gets its id automatically


         response.sendRedirect(request.getContextPath() + "/reservations/reservation.jsp?id=" + id); // redirects to the new product page
    }
}

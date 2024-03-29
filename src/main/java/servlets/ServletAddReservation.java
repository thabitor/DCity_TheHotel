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

@WebServlet(name = "ServletAddReservation", value = "/reservations/add")
public class ServletAddReservation extends HttpServlet {
    private final HotelService service = HotelService.getInstance();
    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());
    ClientDAO clientDAO = new ClientDAO(service.getManager());
    RoomDAO roomDAO = new RoomDAO(service.getManager());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("room_id"));
        String date = request.getParameter("date_search");
        System.out.println(date);
        if(date != null) {
            request.getRequestDispatcher("/reservations/add.jsp?room_id=" + id + "&date_search=" + date).forward(request, response);
        }
        else {
            response.sendRedirect(request.getContextPath() + "/reservations/add.jsp?room_id=" + id);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // gets parameters from the form in reservations/signup.jsp

        Room room = roomDAO.get(Integer.parseInt(request.getParameter("room_id")));
        System.out.println(request.getParameter("date_start"));
        LocalDate date_start = LocalDate.parse(request.getParameter("date_start"));
        LocalDate date_end = LocalDate.parse(request.getParameter("date_end"));
        Client client =  clientDAO.get(Integer.parseInt(request.getParameter("client_id")));
        double price = Double.parseDouble(request.getParameter("price"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        int checkedReservationResponse=reservationDAO.checkAvaible(date_start,date_end,room.getRoomId());
        switch (checkedReservationResponse){
            case 1 :
                request.setAttribute("message", "Your date start is unavailable");
                request.getRequestDispatcher("/reservations/add.jsp?room_id=" + room.getRoomId()).forward(request, response);
                break;
            case 2 :
                request.setAttribute("message", "Your end date is unavailable");
                request.getRequestDispatcher("/reservations/add.jsp?room_id=" + room.getRoomId()).forward(request, response);
                break;
            case 3 :
                request.setAttribute("message", "Both dates are in a reserved period ");
                request.getRequestDispatcher("/reservations/add.jsp?room_id=" + room.getRoomId()).forward(request, response);
                break;
            case 4 :
                request.setAttribute("message", "There are already a reserved date in your period ");
                request.getRequestDispatcher("/reservations/add.jsp?room_id=" + room.getRoomId()).forward(request, response);
                break;
            case 0 :
                int id = (reservationDAO.insert(new Reservation(date_start, date_end, (date_end.getDayOfYear()-date_start.getDayOfYear())*price, capacity, client, room))).getReservationId(); // adds the new product to the list and gets its id automatically
                response.sendRedirect(request.getContextPath() + "/reservations/reservation.jsp?reservation_id=" + id);
                break;
        }




    }
}

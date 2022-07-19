package servlets;

import daos.ReservationDAO;
import services.HotelService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name="ServletFindRoomDate",value = "/findRoomDate")
public class ServletFindRoomDate extends HttpServlet {

    private final HotelService service = HotelService.getInstance();
    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getParameter("date_search");
        request.getRequestDispatcher("/rooms/findRoomDate.jsp").forward(request, response);

    }
}
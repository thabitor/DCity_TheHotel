package servlets;

import entities.Client;
import entities.Reservation;
import entities.Client;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "ServletClient", value = "/clients")
    public class ServletClient extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("client_id");
            if(id == null){
                response.sendRedirect(request.getContextPath() + "/clients/all.jsp"); // redirects to the client list page
            }
            else {
                response.sendRedirect(request.getContextPath() + "/clients/client.jsp?client_id=" + id); // redirects to the client page
            }
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            Client client = clientDAO.get(Integer.parseInt(request.getParameter("client_id")));
            System.out.println(request.getParameter("date_start"));
            LocalDate date_start = LocalDate.parse(request.getParameter("date_start"));
            LocalDate date_end = LocalDate.parse(request.getParameter("date_end"));
            Client client =  clientDAO.get(Integer.parseInt(request.getParameter("client_id")));
            double price = Double.parseDouble(request.getParameter("price"));
            int capacity = Integer.parseInt(request.getParameter("capacity"));

            if (reservationDAO.checkAvaible(date_start,date_end,client.getClientId())){
                int id = (reservationDAO.insert(new Reservation(date_start, date_end, (date_end.getDayOfYear()-date_start.getDayOfYear())*price, capacity, client, client))).getReservationId(); // adds the new product to the list and gets its id automatically
                response.sendRedirect(request.getContextPath() + "/reservations/reservation.jsp?reservation_id=" + id); // redirects to the new product page
            }
            else response.sendRedirect(request.getContextPath() + "/clients/all.jsp");
        }

}


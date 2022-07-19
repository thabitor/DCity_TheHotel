package servlets;

import Exceptions.ClientExistsException;
import daos.ClientDAO;
import daos.ReservationDAO;
import entities.Client;
import entities.Reservation;
import entities.Client;
import services.HotelService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "ServletClient", value = "/clients")
    public class ServletClient extends HttpServlet {

    private final HotelService service = HotelService.getInstance();
    ReservationDAO reservationDAO = new ReservationDAO(service.getManager());
    ClientDAO clientDAO = new ClientDAO(service.getManager());

    private boolean clientExists;

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("client_id");
            if(id == null){
                response.sendRedirect(request.getContextPath() + "/clients/signup.jsp"); // redirects to the client list page
            }
            else {
                response.sendRedirect(request.getContextPath() + "/clients/client.jsp?client_id=" + id); // redirects to the client page
            }
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            LocalDate birthDate = LocalDate.parse(request.getParameter("birth_date"));
            String clientEmail = request.getParameter("mail");
            String clientPhone = request.getParameter("telephone");

            List<Client> clientsList = clientDAO.getAll();

            Client newClient = new Client(firstName, lastName, clientEmail, clientPhone, birthDate);
            int clientId = 0;
            if (!checkDuplicate(newClient)) {
                clientId = clientDAO.insert(newClient).getClientId();
            } else {
                for (Client client :clientsList) {
                    if (newClient.getMail().equals(client.getMail()))
                        clientId = client.getClientId();
                }
            } response.sendRedirect(request.getContextPath() + "/clients/client.jsp?client_id=" + clientId);
        }


        public boolean checkDuplicate(Client client) {

           List<Client> clientList = clientDAO.getAll();
            return clientList.stream()
                    .anyMatch(e ->
                            (e.getMail().equals(client.getMail())));
        }

}



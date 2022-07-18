package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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

        }

}

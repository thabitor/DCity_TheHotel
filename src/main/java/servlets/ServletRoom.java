package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletRoom", value = "/rooms")
public class ServletRoom extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id == null){
            response.sendRedirect(request.getContextPath() + "/rooms/all.jsp"); // redirects to the room list page
        }
        else {
            response.sendRedirect(request.getContextPath() + "/rooms/room.jsp?id=" + id); // redirects to the room page
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

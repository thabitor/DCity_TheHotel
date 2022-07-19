<%@ page import="daos.RoomDAO" %>
<%@ page import="entities.Room" %>
<%@ page import="services.HotelService" %>
<%@ page import="entities.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HotelService service = HotelService.getInstance();
    RoomDAO roomDAO = new RoomDAO(service.getManager());
    String id = request.getParameter("room_id"); // these variables change everytime we load this page
    if (id == null) {
        response.setStatus(404);
        return;
    }
    Room room = roomDAO.get(Integer.parseInt(id));
%>
<%@ include file="../header.jsp" %>
<div class="container">
    <h1 class="title"><%= room.getBeds() %>-bed Suite | Capacity: <%= room.getCapacity() %> people</h1>
    <!-- RoomDetails -->
    <div id="RoomDetails" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="item active"><img src="${pageContext.request.contextPath}/images/photos/<%= room.getRoomId() %>.jpg" class="img-responsive" alt="slide"></div>
            <div class="item  height-full"><img src="${pageContext.request.contextPath}/images/photos/<%= room.getRoomId()+1 %>.jpg" class="img-responsive" alt="slide"></div>
            <div class="item  height-full"><img src="${pageContext.request.contextPath}/images/photos/<%= room.getRoomId()+2 %>.jpg" class="img-responsive" alt="slide"></div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#RoomDetails" role="button" data-slide="prev"><i
                class="fa fa-angle-left"></i></a>
        <a class="right carousel-control" href="#RoomDetails" role="button" data-slide="next"><i
                class="fa fa-angle-right"></i></a>
    </div>
    <!-- RoomCarousel-->
    <div class="room-features spacer">
        <div class="row">
            <div class="col-sm-12 col-md-5">
                <p><%= room.getDescription() %></p>
<%--                <p>Space in your house How to sell faster than your neighbors How to make a strategic use. To discourage--%>
<%--                    you by telling. To discourage you by telling. I m going to outline 14 different ways that I ve found--%>
<%--                    you. The real goal of any talk or speech. The real goal of any talk or speech. I m going to outline--%>
<%--                    14 different ways that I ve found you. The real goal of any talk or speech. I m going to outline 14--%>
<%--                    different ways that I ve found you. The real goal of any talk or speech. To discourage you by--%>
<%--                    telling. To discourage you by telling. Space in your house How to sell faster than your neighbors--%>
<%--                    How to make a strategic use. The real goal of any talk or speech.</p>--%>
<%--                <p>By Learning Ways To Become Peaceful. One of the greatest barriers to making the sale is your--%>
<%--                    prospect's natural. Don't stubbornly. Don't stubbornly. Don't stubbornly. -And Gain Power By--%>
<%--                    Learning Ways To Become Peaceful. </p>--%>
            </div>
            <div class="col-sm-6 col-md-3 amenitites">
                <h3>Amenitites</h3>
                <ul>
                    <li>One of the greatest barriers to making the sale is your prospect.</li>
                    <li>Principle to work to make more money while having more fun.</li>
                    <li>Unlucky people. Don't stubbornly.</li>
                    <li>Principle to work to make more money while having more fun.</li>
                    <li>Space in your house How to sell faster than your neighbors</li>
                </ul>
            </div>
            <div class="col-sm-3 col-md-2">
                <div class="size-price">Capacity<span><%= room.getCapacity() %></span></div>
            </div>
            <div class="col-sm-3 col-md-2">
                <div class="size-price">Price<span>$<%= room.getPrice() %></span></div>
            </div>
        </div>
        <div class="col">
            <a href="../reservations/add?room_id=<%= room.getRoomId() %>" class="btn btn-default">Book this room</a>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
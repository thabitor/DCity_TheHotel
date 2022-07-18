<%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 15-07-22
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="WEB-INF/head.jsp" %>
<%@ include file="WEB-INF/header.jsp" %>
<body>
    <section class="title">
        <h1>The Hotel</h1>
        <p>Where your dreams come true... for sure</p>
    </section>
    <%@ include file="WEB-INF/about.jsp" %>

    <a href="rooms">rooms list</a>
    <a href="reservations">Make a new reservation</a>
    <a href="reservations/requestReservation.jsp">See my reservations</a>

</body>
<%@ include file="WEB-INF/footer.jsp" %>
</html>

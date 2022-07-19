<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<div class="container">
    <form action="../reservations" method="get">
        <label for="email">Enter your email address:</label>
        <input name="client_email" id="email">
        <button type="submit">Get reservations</button>
    </form>
</div>
<%@ include file="../footer.jsp" %>

<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<div class="container">
<h1>Create a new account</h1>
<form action="../clients" method="post">
    <input type="hidden" name="client_id" value="1">
    <div>
        <label for="first_name">First name</label>
        <input type="text" id="first_name" name="first_name">
    </div>
    <div>
        <label for="last_name">Last name</label>
        <input type="text" id="last_name" name="last_name">
    </div>
    <div>
        <label for="birth_date">Date of birth</label>
        <input type="date" id="birth_date" name="birth_date" value="<%= LocalDate.now().minusYears(20) %>">
    </div>
    <div>
        <label for="mail">Email address</label>
        <input type="text" id="mail" name="mail">
    </div>
    <div>
        <label for="telephone">Phone number</label>
        <input type="text" id="telephone" name="telephone">
    </div>
    <button type="submit">Sign up</button>
</form>
</div>
<%@ include file="../footer.jsp" %>
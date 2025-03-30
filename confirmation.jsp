<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!--EL (${}) is easier to read than <%= request.getAttribute() %> -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="confirmation-container">
       <!-- <h2>Order Confirmation</h2>
        <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
        <p><strong>Phone:</strong> <%= request.getParameter("phone") %></p>
        <p><strong>Address:</strong> <%= request.getParameter("address") %></p>
        <p><strong>Ordered Item:</strong> <%= request.getParameter("item") %></p> Nếu đề không kêu dùng EL, JSTL để thay thế thì vẫn để đoạn này-->

        <h2>Order Confirmation</h2>
        <p><strong>Name:</strong> ${name}</p>
        <p><strong>Phone:</strong> ${phone}</p>
        <p><strong>Address:</strong> ${address}</p>

        <h3>Items Ordered:</h3>
        <ul>
            <c:forEach var="item" items="${itemList}">
                <li>${item}</li>
            </c:forEach>
        </ul>
        
        <a href="index.html">Return to Home</a>
    </div>
</body>
</html>

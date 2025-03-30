<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %> 
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userEmail") == null) {
        response.sendRedirect("index.html"); // Redirect if no session
        return;
    }
%>  <!-- Ghi 2 ngoặc nhọn trên nếu đề kêu làm HttpSession rồi bỏ dòng trên cùng !-->
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <p style="color: red;"><%= error %></p>
<% } %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Page</title>
    <link rel="stylesheet" href="css/style.css">
    <script>
        function validateForm() {
            let name = document.forms["orderForm"]["name"].value;
            let phone = document.forms["orderForm"]["phone"].value;
            let address = document.forms["orderForm"]["address"].value;
            let items = document.querySelectorAll('input[name="item"]:checked'); 

            if (name.trim() === "") {
                alert("Name is required");
                return false;
            }
            if (!/^\d{10}$/.test(phone)) {
                alert("Phone must be 10 digits");
                return false;
            }
            if (address.trim() === "") {
                alert("Address is required");
                return false;
            }
            if (items.length === 0) {
                alert("Please select at least one item");
                return false;
            }
            return true;
        } 
    </script> <!--Validation nếu đề yc-->
</head>
<body>
    <div class="order-container">
       <!-- <h2>Place Your Order</h2>
        <form action="OrderServlet" method="POST">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="address">Address:</label>
            <textarea id="address" name="address" required></textarea>

            <label for="item">Select Item:</label>
            <select id="item" name="item">
                <option value="Laptop">Laptop</option>
                <option value="Phone">Phone</option>
                <option value="Tablet">Tablet</option>
            </select>
            
            <button type="submit">Submit Order</button>  !--> <!-- Bình thường thi ghi code này, đề kêu làm httpSession thì đổi code thành dưới luôn 
            </form>

            
            <h2>Welcome, <%= sessionObj.getAttribute("userEmail") %></h2>
            <p>Place your order below:</p>
            
            <form action="OrderServlet" method="POST">
                <button type="submit">Submit Order</button>
            </form>
    
            <form action="LogoutServlet" method="POST">
                <button type="submit">Logout</button>  
            </form>
         -->
         <h2>Place Your Order</h2>
         <form name="orderForm" action="OrderServlet" method="POST" onsubmit="return validateForm()">
             <label>Name:</label>
             <input type="text" name="name" required><br>
 
             <label>Phone:</label>
             <input type="text" name="phone" required><br>
 
             <label>Address:</label>
             <input type="text" name="address" required><br>
 
             <label>Items:</label><br>
             <input type="checkbox" name="item" value="Laptop"> Laptop<br>
             <input type="checkbox" name="item" value="Phone"> Phone<br>
             <input type="checkbox" name="item" value="Tablet"> Tablet<br>
 
             <button type="submit">Submit Order</button>
         </form>
    </div>
</body>
</html>

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        //String item = request.getParameter("item"); // đê không kêu JSTL vẫn để dòng này, kêu thì để 2 dòng dưới

        String[] items = request.getParameterValues("item"); 
        List<String> itemList = (items != null) ? Arrays.asList(items) : List.of(); //Show a List of Items Using JSTL

        // Validate input
        if (name == null || name.trim().isEmpty() ||
            phone == null || !phone.matches("\\d{10}") ||
            address == null || address.trim().isEmpty() ||
            itemList.isEmpty()) {

            request.setAttribute("error", "Invalid input! Please fill out all fields correctly.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // đề kêu forward order details đến confirmation.jsp dùng đoạn này
        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("item", item);
        RequestDispatcher dispatcher = request.getRequestDispatcher("confirmation.jsp");
        dispatcher.forward(request, response);

        // không nói gì chỉ dùng cái này
        // response.sendRedirect("confirmation.jsp?name=" + name + "&phone=" + phone + "&address=" + address + "&item=" + item);
    }
}

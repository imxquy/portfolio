import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Simple authentication (Replace with real authentication logic)
        if ("user@example.com".equals(email) && "1234".equals(password)) {
             // Đề kêu store thông tin người dùng using HttpSession
             HttpSession session = request.getSession();
             session.setAttribute("userEmail", email);

            response.sendRedirect("order.jsp"); // Redirect to order page
        } else {
            response.getWriter().println("<h2>Login Failed! Please try again.</h2>"); //Nếu đề kh kêu làm HttpSession
            response.sendRedirect("index.html?error=Invalid Credentials"); //Nếu đề kêu làm HttpSession thì bỏ dòng trên ghi dòng này
        }
    }
}

package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.LoginCheck;
import model.User;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String pass = request.getParameter("pass");

        ServletContext application = this.getServletContext();
        List<User> users = (List<User>) application.getAttribute("users");
        if (users == null) {
            users = new ArrayList<>();
        }

        LoginCheck logic = new LoginCheck();
        User loginUser = null;
        if (logic.execute(name, pass, users)) {
            for (User u : users) {
                if (u.getName().equals(name)) {
                    loginUser = u;
                    break;
                }
            }
        }

        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("me", loginUser);
            response.sendRedirect("main.jsp");
        } else {
            request.setAttribute("isSuccess", false);
            request.getRequestDispatcher("/loginResult.jsp").forward(request, response);
        }
    }
}
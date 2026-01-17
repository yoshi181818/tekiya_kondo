package servlet; // ここを変更

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.RegistCheck; // ここを変更
import model.User;        // ここを変更

@WebServlet("/Regist")
public class RegistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");

        ServletContext application = this.getServletContext();
        List<User> users = (List<User>) application.getAttribute("users");
        if (users == null) {
            users = new ArrayList<>();
            application.setAttribute("users", users);
        }

        RegistCheck logic = new RegistCheck();
        boolean result = logic.execute(name, pass, users);

        request.setAttribute("isSuccess", result);
        request.getRequestDispatcher("/registResult.jsp").forward(request, response);
    }
}
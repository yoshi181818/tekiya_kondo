package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.GameLogic;
import model.User;

@WebServlet("/Game")
public class GameServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User me = (User) session.getAttribute("me");

        if (me == null) { response.sendRedirect("login.jsp"); return; }
        if (me.isPlayed()) { response.sendRedirect("main.jsp"); return; }

        if (session.getAttribute("currentTurn") == null) {
            session.setAttribute("currentTurn", 1);
            session.setAttribute("currentScore", 0);
        }
        request.getRequestDispatcher("/game.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        
        GameLogic logic = new GameLogic();
        int point = logic.draw();

        int currentScore = (int) session.getAttribute("currentScore");
        int currentTurn = (int) session.getAttribute("currentTurn");
        
        currentScore += point;
        
        if (currentTurn >= 3) {
            User me = (User) session.getAttribute("me");
            me.setScore(currentScore);
            me.setPlayed(true);
            
            session.removeAttribute("currentTurn");
            session.removeAttribute("currentScore");
            
            response.sendRedirect("result.jsp");
        } else {
            session.setAttribute("currentScore", currentScore);
            session.setAttribute("currentTurn", currentTurn + 1);
            
            request.setAttribute("msg", point + "点ゲット！");
            request.getRequestDispatcher("/game.jsp").forward(request, response);
        }
    }
}
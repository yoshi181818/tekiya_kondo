package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.OrderList;

@WebServlet("/Order")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/orderForm.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        request.setCharacterEncoding("UTF-8");


        ServletContext application = this.getServletContext();
        OrderList orderList = (OrderList) application.getAttribute("orderList");


        if (orderList == null) {
            orderList = new OrderList();
            application.setAttribute("orderList", orderList);
        }


        String menu = request.getParameter("menu");


        if (menu != null && !menu.isEmpty()) {
            orderList.setOrder(menu);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/orderResult.jsp");
        dispatcher.forward(request, response);
    }
}
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

@WebServlet("/Kitchen")
public class KitchenServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext application = this.getServletContext();
        OrderList orderList = (OrderList) application.getAttribute("orderList");

        if (orderList == null) {
            orderList = new OrderList();
            application.setAttribute("orderList", orderList);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/kitchen.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext application = this.getServletContext();
        OrderList orderList = (OrderList) application.getAttribute("orderList");

        if (orderList != null) {
            orderList.removeOrder();
        }


        doGet(request, response);
    }
}
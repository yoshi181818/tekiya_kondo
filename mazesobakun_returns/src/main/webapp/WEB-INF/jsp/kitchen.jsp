<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.OrderList" %>
<%
    OrderList orderList = (OrderList) application.getAttribute("orderList");
    String nextMenu = orderList.getNextOrder();
    int waitingNum = orderList.getOrderNum();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>厨房</title>
</head>
<body>
    <h1>Kitchen Monitor</h1>
    
    <div style="border: 2px solid black; padding: 20px; width: 300px;">
        <h2>オーダー情報</h2>
        
        <p>
            <span style="font-size: 24px; color: blue;">
                <%= nextMenu %>
            </span> 
            を作ってください。
        </p>

        <p>
            あと <strong><%= waitingNum %></strong> 人待ってます！急げ！
        </p>

        <form action="Kitchen" method="post">
            <input type="submit" value="できた！" style="width: 100%; height: 50px; font-size: 20px;">
        </form>
        
        <br>
        <a href="Kitchen">画面更新</a>
    </div>

</body>
</html>
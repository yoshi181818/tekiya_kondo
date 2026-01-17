<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.OrderList" %>
<%
    // アプリケーションスコープから取得
    OrderList orderList = (OrderList) application.getAttribute("orderList");
    // 直前の注文内容（リクエストパラメータ）を取得
    String orderedMenu = request.getParameter("menu");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文完了</title>
</head>
<body>
    <h1>ご注文ありがとうございます！</h1>
    <p>
        <strong><%= orderedMenu %></strong> を注文しました。
    </p>
    <p>
        現在、<strong><%= orderList.getOrderNum() %></strong> 人待ちです。
    </p>
    
    <a href="Order">戻る</a>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %> <%-- ここを変更 --%>
<%
    User me = (User) session.getAttribute("me");
    if (me == null) { response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>結果発表</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="center-wrapper">
        <img src="logo.png" alt="ロゴ" class="logo" style="width: 200px;">
        
        <div class="form-container">
            <h2 style="margin-bottom: 10px;">あなたの結果は...</h2>
            
            <h1 style="font-size: 60px; color: #f8d216; margin: 20px 0;">
                <%= me.getScore() %>点!
            </h1>

            <button class="primary" onclick="location.href='main.jsp'">TOPへ戻る</button>
        </div>
    </div>
    <img src="image.png" alt="近藤さん" class="hero-image">
</body>
</html>
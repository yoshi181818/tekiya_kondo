<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.User" %> <%-- ここを変更 --%>
<%
    User me = (User) session.getAttribute("me");
    if (me == null) { response.sendRedirect("login.jsp"); return; }
    
    List<User> userList = (List<User>) application.getAttribute("users");
    if (userList == null) userList = new ArrayList<>();
    
    List<User> ranking = new ArrayList<>(userList);
    ranking.sort((u1, u2) -> Integer.compare(u2.getScore(), u1.getScore()));
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>マイページ</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="center-wrapper">
        <img src="logo.png" class="logo" style="width: 200px;">
        <h2>ようこそ、<%= me.getName() %> さん</h2>
        <p>状態：<%= me.isPlayed() ? "挑戦済み" : "未挑戦" %></p>

        <div class="button-container" style="margin: 20px 0;">
            <% if (!me.isPlayed()) { %>
                <button class="primary" onclick="location.href='Game'">バトル開始</button>
            <% } else { %>
                <button class="primary" disabled style="background-color: #555; cursor: not-allowed;">挑戦終了</button>
            <% } %>
            <button class="secondary" onclick="location.href='index.jsp'">ログアウト</button>
        </div>

        <div class="form-container" style="max-width: 400px; width: 90%;">
            <h3 style="border-bottom: 1px solid #fff; padding-bottom: 10px;">現在のランキング</h3>
            <table style="width: 100%; text-align: left; margin-top: 10px;">
                <% int rank = 1; for(User u : ranking) { %>
                <tr>
                    <td style="padding: 5px; color: #f8d216; font-weight: bold;"><%= rank %>位</td>
                    <td style="padding: 5px;"><%= u.getName() %></td>
                    <td style="padding: 5px; text-align: right;"><%= u.getScore() %> pt</td>
                </tr>
                <% rank++; } %>
            </table>
        </div>
    </div>
    <img src="image.png" class="hero-image">
</body>
</html>
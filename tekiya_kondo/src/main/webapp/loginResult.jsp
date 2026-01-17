<%@ page contentType="text/html; charset=UTF-8" %>
<%
    boolean isSuccess = (Boolean) request.getAttribute("isSuccess");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ログイン結果</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="center-wrapper">
        <img src="logo.png" alt="ロゴ" class="logo">
        <div class="form-container">
            <% if (isSuccess) { %>
                <h1 style="font-size: 20px; margin-bottom: 20px;">ログイン成功！</h1>
                <p>ようこそ、テキーヤ近藤の世界へ</p>
                <% } else { %>
                <h1 style="font-size: 20px; margin-bottom: 20px;">失敗しました</h1>
                <p>ユーザー名かパスワードが違います</p>
                <button class="primary" onclick="history.back()">戻る</button>
            <% } %>
        </div>
    </div>
    <img src="image.png" alt="メインビジュアル" class="hero-image">
</body>
</html>
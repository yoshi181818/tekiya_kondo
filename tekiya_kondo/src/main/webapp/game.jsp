<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // セッションから現在のターン数を取得（GameServletでセットされている想定）
    Integer turn = (Integer) session.getAttribute("currentTurn");
    // ゲット時のメッセージがあれば取得
    String msg = (String) request.getAttribute("msg");
    
    // もしセッション切れなどでnullなら1ターン目扱い（エラー回避）
    if (turn == null) turn = 1;
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>テキーヤ近藤 - 射撃</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* このページだけの追加スタイル */
        .target-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 10px;
            margin: 20px auto;
            max-width: 600px;
        }
        .target-btn {
            background: none;
            border: none;
            cursor: pointer;
            transition: transform 0.1s;
        }
        .target-btn:hover {
            transform: scale(1.1);
        }
        .target-btn img {
            width: 100%;
            height: auto;
            /* 的を見やすくするために少しドロップシャドウ */
            filter: drop-shadow(0 0 5px rgba(255,0,0,0.5));
        }
    </style>
</head>
<body>
    <div class="center-wrapper">
        <h2 style="color: #f8d216;">TURN <%= turn %> / 3</h2>
        <h1 style="font-size: 24px;">的を狙え...</h1>
        

        <form action="Game" method="post">
            <div class="target-grid">
                <%-- 10個の的を表示 --%>
                <% for(int i=0; i<10; i++) { %>
                    <button type="submit" class="target-btn">
                        <%-- target.png は webapp 直下に置いてね --%>
                        <img src="target.png" alt="的">
                    </button>
                <% } %>
            </div>
        </form>
    </div>
    
    <%-- ゲーム中は近藤さんの画像を表示しない（集中するため） --%>
</body>
</html>
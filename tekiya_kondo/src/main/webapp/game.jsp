<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Set, java.util.HashSet" %>

<%
    Integer turn = (Integer) session.getAttribute("currentTurn");
    if (turn == null) turn = 1;

    Set<Integer> hitTargets = (Set<Integer>) session.getAttribute("hitTargets");
    if (hitTargets == null) hitTargets = new HashSet<>();
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>テキーヤ近藤 - 射撃</title>
    <link rel="stylesheet" href="style.css">
    <style>
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
                <% for(int i=0; i<10; i++) { %>
                    <% if (hitTargets.contains(i)) { %>
                        <div style="width: 100%; aspect-ratio: 1/1;"></div>
                    <% } else { %>
                        <button type="submit" class="target-btn" name="targetId" value="<%= i %>">
                            <img src="target.png" alt="的">
                        </button>
                    <% } %>
                <% } %>
            </div>
        </form>
    </div>
</body>
</html>
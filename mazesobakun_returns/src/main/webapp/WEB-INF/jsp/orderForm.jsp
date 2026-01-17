<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文画面</title>
</head>
<body>
    <h1>ご注文をどうぞ</h1>
    <form action="Order" method="post">
        メニュー：
        <select name="menu">
            <option value="まぜそば">まぜそば</option>
            <option value="肉まぜそば">肉まぜそば</option>
            <option value="赤まぜそば">赤まぜそば</option>
            <option value="まぜないそば">まぜないそば</option>
        </select>
        <br><br>
        <input type="submit" value="注文">
    </form>
</body>
</html>
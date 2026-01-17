<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SupeSupe - ログイン</title>
    <%-- CSS読み込みを絶対パス化してエラー回避 --%>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <div class="center-wrapper">
        <img src="logo.png" alt="ロゴ" class="logo">

        <div class="form-container">
            <%-- actionはサーブレットのURLパターンに合わせる --%>
            <form action="Login" method="post">
                <label>ユーザー名</label>
                <input type="text" name="name" required>

                <label>パスワード</label>
                <input type="password" name="pass" required>

                <br>
                <button class="primary" type="submit">ログイン</button>
            </form>
        </div>
    </div>

    <img src="image.png" alt="メインビジュアル" class="hero-image">

</body>
</html>
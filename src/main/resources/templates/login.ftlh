<!DOCTYPE html>
<html>
<head>
    <title>FINAUTO</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff5f5;
            color: #333;
            margin: 0;
            padding: 0;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 400px;
            width: 100%;
            margin: 0 auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(165, 42, 42, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        h1.bg_color {
            text-align: center;
            background-color: #ffebee;
            padding: 15px;
            border-bottom: 3px solid #b71c1c;
            margin-bottom: 20px;
            color: #b71c1c !important;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        h3 {
            color: #b71c1c;
            border-bottom: 2px solid #ff5252;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ff5252;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #ff1744;
            color: white;
            border: none;
            padding: 10px 15px;
            margin: 10px 0;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #b71c1c;
        }

        .btn_registration {
            display: inline-block;
            margin-top: 15px;
            color: #d32f2f;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .btn_registration:hover {
            text-decoration: underline;
            color: #b71c1c;
        }

        @media screen and (max-width: 480px) {
            .container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="bg_color" style="color: darkred">finauto.ru</h1>
    <h3>Авторизация</h3>
    <form action="/login" method="post">
        Эл. почта: <input  class="" type="email" name="username"><br><br>
        Пароль: <input class="" type="password" name="password"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Вход"/>
    </form>
    <a class="btn_registration" href="/registration">Зарегистрироваться</a>
</div>
</body>
</html>
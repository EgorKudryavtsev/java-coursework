<!DOCTYPE html>
<html>
<head>
    <title>finauto</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff5f5;
            color: #333;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(165, 42, 42, 0.1);
            border-radius: 8px;
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

        h4 {
            color: #b71c1c;
            text-align: center;
            margin-bottom: 15px;
        }

        hr.no_hr {
            border: none;
            border-top: 2px solid #ff5252;
            margin: 10px 0;
        }

        .big_block {
            display: block;
            text-align: center;
            background-color: #ffebee;
            color: #b71c1c;
            text-decoration: none;
            padding: 10px 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .big_block:hover {
            background-color: #ffcdd2;
        }

        h2.big_block {
            background-color: #ffebee;
            color: #b71c1c;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        b {
            color: #d32f2f;
        }

        .btn_registration {
            display: block;
            width: 100%;
            background-color: #ff1744;
            color: white;
            border: none;
            padding: 10px 15px;
            margin-top: 15px;
            border-radius: 5px;
            cursor: pointer;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }

        .btn_registration:hover {
            background-color: #b71c1c;
        }

        @media screen and (max-width: 600px) {
            .container {
                width: 95%;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="bg_color" style="color: darkred">finauto.ru</h1>
    <h4>Личный кабинет</h4>
    <hr class="no_hr">
    <br>
    <div>
        <h2 class="big_block">${user.name}</h2>
        <br>
        Электронная почта: <b>${user.email}</b>
        <br>
        Номер телефона: <b>${user.phoneNumber}</b>
        <br>
        <br>
        <#if user.isAdmin()>
            <a class="big_block" href="/admin">
                Панель администратора
            </a><br>
        </#if>
        <a class="big_block" href="/my/cars/${user.id}">
            Мои объявления
        </a>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn_registration" type="submit">
                Выйти из аккаунта
            </button>
        </form>
    </div>
</div>
</body>
</html>
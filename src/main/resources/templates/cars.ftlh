<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FINAUTO</title>
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
            max-width: 800px;
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

        hr {
            border: none;
            border-top: 2px solid #ff5252;
            margin: 20px 0;
        }

        .ui-button {
            background-color: #ff1744;
            color: white;
            border: none;
            padding: 10px 15px;
            margin: 10px 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .ui-button:hover {
            background-color: #b71c1c;
        }

        form {
            margin: 10px 0;
            display: inline-block;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ff5252;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #ff5252;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #b71c1c;
        }

        .detail {
            color: #d32f2f;
            text-decoration: none;
            font-weight: bold;
        }

        .detail:hover {
            text-decoration: underline;
        }

        h3, h4 {
            color: #b71c1c;
            border-bottom: 2px solid #ff5252;
            padding-bottom: 10px;
        }

        div > p {
            background-color: #ffebee;
            padding: 10px;
            border-radius: 5px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="bg_color" style="color: darkred">finauto.ru</h1>
    <hr>
    <#if user.email??>
        <h3>Здравствуйте, ${user.name}!</h3>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input class="ui-button" type="submit" value="Выйти"/>
        </form>
        <form action="/profile" method="get">
            <input class="ui-button" type="submit" value="Профиль">
        </form>
        <#if user.isAdmin()>
            <form action="/admin" method="get">
                <input class="ui-button" type="submit" value="Панель администратора"/>
            </form>
        </#if>
    <#else>
        <form action="/login" method="post">
            <input class="ui-button" type="submit" value="Войти"/>
        </form>
    </#if>
    <h4>Объявления</h4>
    <form action="/" method="get">
        Поиск марке автомобиля: <input type="text" name="brand"/><br>
        <input type="submit" value="Найти"/>
    </form>
    <#list cars as car>
        <div>
            <p><b>${car.title}</b> ${car.price} ₽ | <a class="detail" href="/car/${car.id}">Информация</a></p>
        </div>
        <#if user.isAdmin()>
            <form action="/car/delete/${car.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input class="ui-button" type="submit" value="Удалить"/>
            </form>
        </#if>
    <#else>
        <h3>Записей нет</h3>
    </#list>
    <#if user.email??>
        <form action="/car/create/" method="get">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="ui-button" type="submit" value="Создать объявление"/>
        </form>
    </#if>
</div>
</body>
</html>
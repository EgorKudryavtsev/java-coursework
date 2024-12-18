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
            max-width: 1200px;
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

        hr.no_hr {
            margin: 10px 0;
        }

        .panel_title {
            color: #b71c1c;
            text-align: center;
            border-bottom: 2px solid #ff5252;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .ui-button, .Ban {
            background-color: #ff1744;
            color: white;
            border: none;
            padding: 10px 15px;
            margin: 10px 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .ui-button:hover, .Ban:hover {
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

        .detail, .moreinfo {
            color: #d32f2f;
            text-decoration: none;
            font-weight: bold;
        }

        .detail:hover, .moreinfo:hover {
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

        /* Новые стили для таблицы администратора */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            border: 1px solid #ff5252;
            padding: 10px;
            text-align: left;
        }

        table th.smooth {
            background-color: #ffebee;
            color: #b71c1c;
            font-weight: bold;
            text-align: center;
        }

        table tr:nth-child(even) {
            background-color: #fff5f5;
        }

        .color_phone {
            color: #d32f2f;
        }

        @media screen and (max-width: 768px) {
            table {
                font-size: 12px;
            }

            table th, table td {
                padding: 5px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="bg_color" style="color: darkred">finauto.ru</h1>
    <hr class="no_hr">
    <h4 class="panel_title">Панель администратора</h4>
    <table border="1">
        <tr>
            <th class="smooth">Email</th>
            <th class="smooth">Номер телефона</th>
            <th class="smooth">Активность</th>
            <th class="smooth">Роли</th>
            <th class="smooth">Бан</th>
            <th class="smooth">Редактирование</th>
            <th class="smooth">Подробная информация</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.email}</th>
                <th class="color_phone">${user.phoneNumber}</th>
                <th><#if user.active>true<#else>false</#if></th>
                <th><#list user.roles as role>${role}</#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input class="Ban" type="submit" value="Бан">
                    </form>
                </th>
                <th><a class="moreinfo" href="/admin/user/edit/${user.id}">Редактирование</a></th>
                <th><a class="moreinfo" href="/user/${user.id}">Подробная информация</a></th>
            </tr>
        <#else>
            <hr>
            <h3>Пользователей нет</h3>
        </#list>
    </table>
</div>
</body>
</html>
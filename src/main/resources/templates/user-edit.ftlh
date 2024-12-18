<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>finauto</title>
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

        /* Стили для чекбоксов */
        input[type="checkbox"] {
            margin-right: 10px;
        }

        label {
            display: flex;
            align-items: center;
            background-color: #ffebee;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
            color: #b71c1c;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        label:hover {
            background-color: #ffcdd2;
        }

        input[type="checkbox"]:checked + span {
            font-weight: bold;
        }

        .btn_registration {
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

        .btn_registration:hover {
            background-color: #b71c1c;
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

    <h3>Редактирование пользователя ${user.name}</h3>
    <form action="/admin/user/edit" method="post">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn_registration" type="submit">Сохранить</button>
    </form>
</div>

</body>
</html>
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

        hr.no_hr {
            margin: 10px 0;
        }

        .big_block {
            color: #b71c1c;
            text-align: center;
            border-bottom: 2px solid #ff5252;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        /* Стили для списка объявлений */
        a {
            text-decoration: none;
            color: inherit;
        }

        a > div {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffebee;
            margin-bottom: 15px;
            padding: 15px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        a > div:hover {
            background-color: #ffcdd2;
        }

        a > div > div h3 {
            color: #b71c1c;
            margin: 0 0 10px 0;
        }

        a > div > div p {
            color: #d32f2f;
            margin: 0;
        }

        .ui-button {
            background-color: #ff1744;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .ui-button:hover {
            background-color: #b71c1c;
        }

        /* Стили для формы создания объявления */
        form {
            margin: 10px 0;
        }

        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ff5252;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="file"] {
            opacity: 0;
            position: absolute;
            z-index: -1;
        }

        .custom-file {
            position: relative;
            margin-bottom: 15px;
        }

        .custom-file-label {
            position: absolute;
            top: 0;
            right: 0;
            left: 0;
            z-index: 1;
            height: 40px;
            padding: 10px;
            background-color: #ffebee;
            border: 1px solid #ff5252;
            border-radius: 4px;
            color: #b71c1c;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .input_car {
            background-color: #ff1744;
            color: white;
            border: none;
            padding: 10px 15px;
            margin: 10px 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
            text-transform: uppercase;
        }

        .input_car:hover {
            background-color: #b71c1c;
        }

        @media screen and (max-width: 600px) {
            .container {
                padding: 10px;
                width: 95%;
            }

            a > div {
                flex-direction: column;
                text-align: center;
            }

            .ui-button {
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="bg_color" style="color: darkred">finauto.ru</h1>
    <hr>
    <h4 class="big_block">Мои объявления</h4>
    <hr class="no_hr">
    <div>
        <#list cars as car>
            <a href="/car/${car.id}">
                <div>
                    <div>
                        <h3>Название: ${car.title}</h3>
                        <p>Цена: ${car.price}</p>
                    </div>
                    <form action="/car/delete/${car.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input class="ui-button" type="submit" value="Удалить"/>
                    </form>
                </div>
            </a>
        <#else>

            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
    <hr class="big_block">
    <h3>Создание записи</h3>
    <form action="/car/create" method="post" enctype="multipart/form-data">
        Название объявления: <input type="text" name="title"/><br><br>
        Марка автомобиля: <input type="text" name="brand"/><br><br>
        Модель: <input type="text" name="model"/><br><br>
        Цена: <input type="text" name="price"/><br><br>
        Пробег: <input type="text" name="mileage"/><br><br>
        Год выпуска: <input type="text" name="releaseYear" step="60"/><br><br>
        Мощность двигателя: <input type="text" name="horsePower" step="60"/><br><br>
        Коробка передач: <input type="text" name="gearbox" step="60"/><br><br>
        Цвет: <input type="text" name="color" step="60"/><br><br>
        Описание: <input type="text" name="description" step="60"/><br><br>
        <div class="form-group">
            <div class="custom-file">
                <input required type="file" name="file1" id="file1">
                <label class="custom-file-label" for="file1">Первая фотография к товару</label>
            </div>
        </div>
        <br><br>
        <div class="form-group">
            <div class="custom-file">
                <input type="file" name="file2" id="file2">
                <label class="custom-file-label" for="file2">Вторая фотография к товару</label>
            </div>
        </div>
        <br><br>
        <div class="form-group">
            <div class="custom-file">
                <input type="file" name="file3" id="file3">
                <label class="custom-file-label" for="file3">Третья фотография к товару</label>
            </div>
        </div>
        <br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="input_car" type="submit" value="Создать">
    </form>
</div>
</body>
</html>
<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
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

        h3 {
            color: #b71c1c;
            border-bottom: 2px solid #ff5252;
            padding-bottom: 10px;
            margin-bottom: 20px;
            text-align: center;
        }

        .car-images {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }

        .carousel-caption {
            max-width: 200px;
            text-align: center;
        }

        .product {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .product:hover {
            transform: scale(1.05);
        }

        b {
            color: #b71c1c;
            margin-right: 5px;
        }

        a {
            color: #d32f2f;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        a:hover {
            text-decoration: underline;
            color: #b71c1c;
        }

        @media screen and (max-width: 600px) {
            .container {
                padding: 10px;
                width: 95%;
            }

            .car-images {
                flex-direction: column;
            }

            .carousel-caption {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <hr>
    <h1 class="bg_color" style="color: darkred">finauto.ru</h1>
    <h3>Подробная информация о машине</h3>
    <div class="car-images">
        <#list images as image>
            <div class="carousel-caption">
                <a href="/images/${image.id}">
                    <img class="product" style="height: 100px" src="/images/${image.id}">
                </a>
            </div>
        </#list>
    </div>
    <b>Название объявления: </b>${car.title}<br>
    <b>Марка автомобиля: </b>${car.brand}<br>
    <b>Модель: </b>${car.model}<br>
    <b>Цена: </b>${car.price}<br>
    <b>Пробег: </b>${car.mileage}<br>
    <b>Год выпуска: </b>${car.releaseYear}<br>
    <b>Мощность двигателя: </b>${car.horsePower}<br>
    <b>Описание: </b>${car.description}<br>
    <b>Владелец: </b><a href="/user/${car.user.id}">${car.user.name}</a><br>
</div>
</body>
</html>
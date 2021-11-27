<html>
    <body>
        <h1>Задание 1</h1>
            <?php
            require_once 'Basket.php';
            require_once 'BasketPosition.php';
            require_once 'Order.php';
            require_once 'Product.php';
            $basket = new Basket();
            $products = [
                new Product("Ручка шариковая", 13.45),
                new Product("Тетрадь", 86.21),
                new Product("Ластик", 5)
            ];
            foreach ($products as $i=>$value)
            {
                $basket->addProduct($products[$i], mt_rand(1, 10));
            }
            $order = new Order($basket);

            echo "<p>Заказ на сумму: " . $order->getPrice() . "</p>";
            echo "<p>(стоимость доставки): " . $order->getPrice() - $basket->getPrice();
            echo "<p>Состав заказа: " . $basket->describe() . "</p>";
            ?>
    </body>
</html>
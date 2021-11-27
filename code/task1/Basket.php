<?php


class Basket
{
    private array $positions;

    function __construct()
    {
        $this->positions = array();
    }

    public function addProduct(Product $product, int $quantity)
    {
        $basketPosition = new BasketPosition($product, $quantity);
        $this->positions[] = $basketPosition;
    }
    public function getPrice()
    {
        $totalPrice = 0;
        foreach ($this->positions as $i => $value){
            $totalPrice += $this->positions[$i]->getPrice();
        }
        return $totalPrice;
    }
    public function describe()
    {
        $descriptionFormat = "%1s - %2.2f - %3d" . PHP_EOL;                       //<Наименование товара> - <Цена одной позиции> - <Количество>
        $description = "";
        foreach ($this->positions as $i => $value){
            $product = $this->positions[$i]->getProduct();
            $description .= sprintf($descriptionFormat,
                                    $product->getName(),
                                    $product->getPrice(),
                                    $this->positions[$i]->getQuantity());
        }
        return $description;
    }
}
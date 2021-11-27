<?php


class BasketPosition
{
    private Product $product;
    private int $quantity;

    function __construct(Product $product, int $quantity)
    {
        $this->product = $product;
        $this->quantity = $quantity;
    }

    public function getProduct()
    {
        return $this->product;
    }
    public function getQuantity(){
        return $this->quantity;
    }
    public function getPrice()
    {
        $price = $this->product->getPrice() * $this->quantity;
        return round($price, 2);
    }
}
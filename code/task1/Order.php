<?php


class Order
{
    private Basket $basket;
    private float $deliveryPrice;

    function __construct(Basket $basket, float $deliveryPrice=100)
    {
        $this->basket = $basket;
        $this->deliveryPrice = $deliveryPrice;
    }

    public function getBasket()
    {
        return $this->basket;
    }
    public function getPrice()
    {
        return $this->deliveryPrice + $this->basket->getPrice();
    }
}
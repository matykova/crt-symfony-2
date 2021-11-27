<?php


class Product
{
    private string $name;
    private float $price;

    function __construct(string $name, float $price)
    {
        $this->name = $name;
        $this->price = $price;
    }

    public function getName()
    {
        return $this->name;
    }
    public function getPrice()
    {
        return round($this->price, 2);
    }
}
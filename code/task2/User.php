<?php


class User
{
    public function load(int $id)
    {
        if ($id > 10){
            throw new Exception("Некорректный ID пользователя (должен быть меньше 10)");
        }
    }
    public function save(array $data)
    {
        return (bool)random_int(0, 1);
    }
}
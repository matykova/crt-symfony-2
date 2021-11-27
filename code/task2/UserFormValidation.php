<?php


class UserFormValidation
{
    public function validate(array $data)
    {
        //Проверка имени на пустоту
        if (empty($data['name']))
        {
            throw new Exception("Имя пользователя не может быть пустым");
        }
        //Проверка возраста (должен быть >= 18)
        if ($data['age'] < 18)
        {
            throw new Exception("Возраст пользователя должен быть не менее 18 лет");
        }
        //Проверка Email на пустоту
        if (empty($data['email']))
        {
            throw new Exception("Не заполнен Email");
        }
        //Проверка формата Email
        $regemail = "/^[a-zA-Z0-9_\-.]+@[a-zA-Z0-9\-.]+$/";
        if (!preg_match($regemail, $data['email']))
        {
            throw new Exception("Введенный Email не соответствует формату");
        }
    }
}
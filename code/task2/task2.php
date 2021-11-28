<?php
    if (isset($_POST['id'])){
        session_start();
        require_once "User.php";
        require_once "UserFormValidation.php";
        $user = new User();
        $userValidation = new UserFormValidation();
        $_SESSION['id'] = $_POST['id'];
        $_SESSION['name'] = $_POST['name'];
        $_SESSION['age'] = $_POST['age'];
        $_SESSION['email'] = $_POST['email'];
        try{
            $user->load($_POST['id']);
            try{
                $userValidation->validate($_POST);
                if ($user->save($_POST))
                {
                    echo "Данные пользователя сохранены";
                    session_unset();
                    session_abort();
                }
                else{
                    echo "Ошибка при сохранении";
                }
            }catch(Exception $e){
                echo $e->getMessage();
            }
        }catch(Exception $e){
            echo $e->getMessage();
        }
    }
?>
<html>
    <body>
        <form method="post">
            <p>ID: <input type="number" name="id" value="<?=isset($_SESSION['id'])?$_SESSION['id']:""?>"/></p>
            <p>Имя: <input type="text" name="name" value="<?=isset($_SESSION['name'])?$_SESSION['name']:""?>"/></p>
            <p>Возраст: <input type="number" name="age" value="<?=isset($_SESSION['age'])?$_SESSION['age']:""?>"/></p>
            <p>Email: <input type="text" name="email" value="<?=isset($_SESSION['email'])?$_SESSION['email']:""?>"/></p>
            <p><input type="submit"/></p>
        </form>
    </body>
</html>

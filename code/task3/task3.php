<html>
<body>
<?php
    function get_data($table_name){
        $query = "
            SELECT *
            FROM " . $table_name;
        $result = pg_query($query) or die("Ошибка запроса: " . pg_last_error());
        return $result;
    }
    function printTable($data){
        echo "<table>\n";
        while ($line = pg_fetch_array($data, null, PGSQL_ASSOC)) {
            echo "\t<tr>\n";
            foreach ($line as $col_value) {
                echo "\t\t<td>$col_value</td>\n";
            }
            echo "\t</tr>\n";
        }
        echo "</table>\n";
    }
    $dbconn = pg_connect("host=crt-symfony-2-database-1 dbname=test user=pguser password=pguser")
        or die('Не удалось установить соединение с базой данных: ' . pg_last_error());

    $cities = get_data("cities");
    echo "<h1>Города</h1>\n";
    printTable($cities);

    $countries = get_data("countries");
    echo "<h1>Страны</h1>";
    printTable($countries);

    $animal_classes = get_data("animal_classes");
    echo "<h1>Классы животных</h1>";
    printTable($animal_classes);

    $animals = get_data("animals");
    echo "<h1>Животные</h1>";
    printTable($animals);

    pg_close($dbconn)?>
</body>
</html>

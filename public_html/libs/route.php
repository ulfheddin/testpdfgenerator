<?php
//Функция my_rout принимает $_GET['_route_'] переменную, которая была получена
//из URL строки с помощью .htaccess
//разбив на массив эту строку по /, функция прогоняет по базе данных (таблица url_alias) ища соответсвия
//и возвращает наш controller и дополнительные get параметры со своими ЧПУ
function my_rout($route){
    $route_mass = explode('/', $route);
    global $db; //это что бы получить доступ к глобальному ресурсу, полученному в конфигах
    $url = '';
    $control_true = 0;
    foreach ($route_mass as $rm) {
        $query ="SELECT url FROM url_alias WHERE alias = '$rm'";
        if($query){
            $result = mysqli_query($db, $query) or die("ERROR " . mysqli_error($db)); 
            if($result->num_rows)
            {
                $row = mysqli_fetch_assoc($result);
                foreach ($row as $value) {
                    $url .= '/'.$value;
                    //проверим что бы в пути был тоько один контроллер
                    $text="controller";
                    if(strstr($value, $text)) $control_true++;
                    
                }
            }
            else{
                //так мы отрезаем не существующие параметры URL
                return 404;
            }
        }
    }
    if($control_true>1) return 404;
    //убрал первый слеш
    return substr($url, 1);
}

function my_rout_admin($route){
    $route_mass = explode('/', $route);
    global $db; //это что бы получить доступ к глобальному ресурсу, полученному в конфигах
    $url = '';
    $control_true = 0;
    foreach ($route_mass as $rm) {
        $query ="SELECT url FROM url_alias_admin WHERE alias = '$rm'";
        if($query){
            $result = mysqli_query($db, $query) or die("ERROR " . mysqli_error($db)); 
            if($result->num_rows)
            {
                $row = mysqli_fetch_assoc($result);
                foreach ($row as $value) {
                    $url .= '/'.$value;
                    //проверим что бы в пути был тоько один контроллер
                    $text="controller";
                    if(strstr($value, $text)) $control_true++;
                    
                }
            }
            else{
                //так мы отрезаем не существующие параметры URL
                return 404;
            }
        }
    }
    if($control_true>1) return 404;
    //убрал первый слеш
    return substr($url, 1);
}
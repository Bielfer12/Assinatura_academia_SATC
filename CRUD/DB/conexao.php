<?php

$serverName = "localhost"; 

$connectionInfo = array(
    "Database" => "academia" 
);

$conn = sqlsrv_connect($serverName, $connectionInfo);

if ($conn === false) {
    die("Falha na conexão com o banco de dados. Erro: " . print_r(sqlsrv_errors(), true));
}

?>
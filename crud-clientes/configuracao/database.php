<?php
// config/database.php

$serverName = "seu_servidor.database.windows.net";  // altere aqui
$connectionOptions = [
    "Database" => "nome_do_banco",                  // altere aqui
    "Uid" => "usuario",                              // altere aqui
    "PWD" => "senha",                                // altere aqui
    "Encrypt" => true,
    "TrustServerCertificate" => false,
    "LoginTimeout" => 100,
];

$conn = sqlsrv_connect($serverName, $connectionOptions);

if ($conn === false) {
    die(print_r(sqlsrv_errors(), true));
}
?>

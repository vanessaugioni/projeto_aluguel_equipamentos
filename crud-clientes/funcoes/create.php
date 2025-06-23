<?php
require_once __DIR__ . '/..configuracao/database.php';

function criarCliente($nome, $cnpj, $email, $telefone) {
    global $conn;
    $sql = "INSERT INTO cliente (nome_cliente, cnpj, email, telefone, criado_em) VALUES (?, ?, ?, ?, GETDATE())";
    $params = [$nome, $cnpj, $email, $telefone];

    $stmt = sqlsrv_query($conn, $sql, $params);
    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }
    return true;
}
?>

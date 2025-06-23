<?php
require_once __DIR__ . '/../configuracao/database.php';

function listarClientes() {
    global $conn;
    $sql = "SELECT id_cliente, nome_cliente, cnpj, email, telefone FROM cliente ORDER BY id_cliente";
    $stmt = sqlsrv_query($conn, $sql);

    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    $clientes = [];
    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
        $clientes[] = $row;
    }
    return $clientes;
}

function buscarClientePorId($id) {
    global $conn;
    $sql = "SELECT id_cliente, nome_cliente, cnpj, email, telefone FROM cliente WHERE id_cliente = ?";
    $params = [$id];
    $stmt = sqlsrv_query($conn, $sql, $params);

    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    return sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);
}
?>

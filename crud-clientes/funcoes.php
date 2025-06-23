<?php
require_once 'conexao.php';

function listarClientes() {
    global $conn;
    $sql = "SELECT * FROM cliente ORDER BY id_cliente DESC";
    return sqlsrv_query($conn, $sql);
}

function buscarCliente($id) {
    global $conn;
    $sql = "SELECT * FROM cliente WHERE id_cliente = ?";
    $params = [$id];
    $stmt = sqlsrv_query($conn, $sql, $params);
    if ($stmt === false) return false;
    return sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);
}

function inserirCliente($nome, $cnpj, $email, $telefone) {
    global $conn;
    $sql = "INSERT INTO cliente (nome_cliente, cnpj, email, telefone, criado_em) VALUES (?, ?, ?, ?, GETDATE())";
    $params = [$nome, $cnpj, $email, $telefone];
    return sqlsrv_query($conn, $sql, $params);
}

function atualizarCliente($id, $nome, $cnpj, $email, $telefone) {
    global $conn;
    $sql = "UPDATE cliente SET nome_cliente = ?, cnpj = ?, email = ?, telefone = ? WHERE id_cliente = ?";
    $params = [$nome, $cnpj, $email, $telefone, $id];
    return sqlsrv_query($conn, $sql, $params);
}

function excluirCliente($id) {
    global $conn;
    $sql = "DELETE FROM cliente WHERE id_cliente = ?";
    $params = [$id];
    return sqlsrv_query($conn, $sql, $params);
}
?>

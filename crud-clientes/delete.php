<?php
include 'funcoes.php';

$id = $_GET['id'] ?? null;

if ($id) {
    excluirCliente($id);
}

// Redireciona para a lista após excluir
header("Location: index.php");
exit;

<?php
include 'funcoes.php';

$id = $_GET['id'] ?? null;
$cliente = null;
$erro = "";

if ($id) {
    $cliente = buscarCliente($id);
    if (!$cliente) {
        die("Cliente não encontrado.");
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome_cliente'] ?? "";
    $cnpj = $_POST['cnpj'] ?? "";
    $email = $_POST['email'] ?? "";
    $telefone = $_POST['telefone'] ?? "";

    // Validação básica
    if (!$nome || !$cnpj || !$email) {
        $erro = "Nome, CNPJ e Email são obrigatórios.";
    } else {
        if ($id) {
            $sucesso = atualizarCliente($id, $nome, $cnpj, $email, $telefone);
        } else {
            $sucesso = inserirCliente($nome, $cnpj, $email, $telefone);
        }
        if ($sucesso) {
            header("Location: index.php");
            exit;
        } else {
            $erro = "Erro ao salvar cliente.";
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?= $id ? "Editar" : "Novo" ?> Cliente</title>
    <link rel="stylesheet" href="form-styles.css" />
</head>
<body>
    <h1><?= $id ? "Editar" : "Novo" ?> Cliente</h1>

    <?php if ($erro): ?>
        <p style="color:red;"><?= htmlspecialchars($erro) ?></p>
    <?php endif; ?>

    <form method="post" action="">
        <label>Nome:
            <input type="text" name="nome_cliente" required value="<?= htmlspecialchars($cliente['nome_cliente'] ?? '') ?>">
        </label><br>

        <label>CNPJ:
            <input type="text" name="cnpj" required maxlength="14" minlength="14" value="<?= htmlspecialchars($cliente['cnpj'] ?? '') ?>">
        </label><br>

        <label>Email:
            <input type="email" name="email" required value="<?= htmlspecialchars($cliente['email'] ?? '') ?>">
        </label><br>

        <label>Telefone:
            <input type="text" name="telefone" required maxlength="11" minlength="10" value="<?= htmlspecialchars($cliente['telefone'] ?? '') ?>">
        </label><br>

        <button type="submit"><?= $id ? "Atualizar" : "Cadastrar" ?></button>
    </form>

    <p><a href="index.php">Voltar para a lista</a></p>
</body>
</html>

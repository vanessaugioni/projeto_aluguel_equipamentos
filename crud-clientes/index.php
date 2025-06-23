<?php include 'funcoes.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Clientes</h1>
    <a href="form.php" class="btn-novo">Novo Cliente</a>
<br></br>
    <table border="1" cellpadding="6">
        <tr>
            <th>ID</th><th>Nome</th><th>CNPJ</th><th>Email</th><th>Telefone</th><th>Criado em</th><th>Ações</th>
        </tr>
        <?php
        $clientes = listarClientes();
        while ($c = sqlsrv_fetch_array($clientes, SQLSRV_FETCH_ASSOC)) {
      echo "<tr>
        <td data-label='ID'>{$c['id_cliente']}</td>
        <td data-label='Nome'>{$c['nome_cliente']}</td>
        <td data-label='CNPJ'>{$c['cnpj']}</td>
        <td data-label='Email'>{$c['email']}</td>
        <td data-label='Telefone'>{$c['telefone']}</td>
        <td data-label='Criado em'>" . ($c['criado_em'] ? $c['criado_em']->format('d/m/Y H:i') : '') . "</td>
        <td data-label='Ações'>
          <div class='btn-group'>
            <a href='form.php?id={$c['id_cliente']}' class='btn-novo'>Editar</a>
            <a href='delete.php?id={$c['id_cliente']}' class='btn-novo' onclick=\"return confirm('Deseja excluir?')\">Excluir</a>
          </div>
        </td>
      </tr>";
        }
        ?>
    </table>
</body>
</html>

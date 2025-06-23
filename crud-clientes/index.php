<?php include 'funcoes.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
</head>
<body>
    <h1>Clientes</h1>
    <a href="form.php">Novo Cliente</a><br><br>

    <table border="1" cellpadding="6">
        <tr>
            <th>ID</th><th>Nome</th><th>CNPJ</th><th>Email</th><th>Telefone</th><th>Criado em</th><th>Ações</th>
        </tr>
        <?php
        $clientes = listarClientes();
        while ($c = sqlsrv_fetch_array($clientes, SQLSRV_FETCH_ASSOC)) {
            echo "<tr>
                    <td>{$c['id_cliente']}</td>
                    <td>{$c['nome_cliente']}</td>
                    <td>{$c['cnpj']}</td>
                    <td>{$c['email']}</td>
                    <td>{$c['telefone']}</td>
                    <td>" . ($c['criado_em'] ? $c['criado_em']->format('d/m/Y H:i') : '') . "</td>
                    <td>
                        <a href='form.php?id={$c['id_cliente']}'>Editar</a> |
                        <a href='delete.php?id={$c['id_cliente']}' onclick=\"return confirm('Deseja excluir?')\">Excluir</a>
                    </td>
                  </tr>";
        }
        ?>
    </table>
</body>
</html>

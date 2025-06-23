<?php
$serverName = "satc-sql-server.database.windows.net"; // Nome do seu servidor Azure
$connectionOptions = [
    "Database" => "banco-dados",       // Nome exato do seu banco
    "Uid" => "admin_user",             // Usuário administrador
    "PWD" => "satc@123",               // Senha do usuário
    "Encrypt" => true,                 
    "TrustServerCertificate" => false  
];

$conn = sqlsrv_connect($serverName, $connectionOptions);

if (!$conn) {
    echo "<pre>";
    print_r(sqlsrv_errors()); // mostra erro detalhado
    echo "</pre>";
    die("❌ Erro na conexão com o banco.");
} else {
    echo "✅ Conexão bem-sucedida!";
}
?>


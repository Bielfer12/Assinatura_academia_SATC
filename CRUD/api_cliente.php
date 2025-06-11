<?php
header('Content-Type: application/json'); // Define que a resposta será em formato JSON
include 'DB/conexao.php';

// Verifica qual ação foi solicitada via POST
$acao = isset($_POST['acao']) ? $_POST['acao'] : '';

$response = ['status' => 'error', 'message' => 'Ação não especificada.'];

switch ($acao) {
    // --- AÇÃO DE INSERIR UM NOVO CLIENTE ---
    case 'inserir':
        // Prepara a query SQL para evitar SQL Injection
        $sql = "INSERT INTO Clientes (nm_cliente, cpf, email, telefone, dt_nascimento, endereco, dt_cadastro) VALUES (?, ?, ?, ?, ?, ?, GETDATE())";
        
        $params = [
            $_POST['nm_cliente'],
            $_POST['cpf'],
            $_POST['email'],
            $_POST['telefone'],
            $_POST['dt_nascimento'],
            $_POST['endereco']
        ];

        $stmt = sqlsrv_query($conn, $sql, $params);

        if ($stmt) {
            $response = ['status' => 'success', 'message' => 'Cliente adicionado com sucesso!'];
        } else {
            $response['message'] = 'Erro ao adicionar cliente: ' . print_r(sqlsrv_errors(), true);
        }
        break;

    // --- AÇÃO DE ATUALIZAR UM CLIENTE EXISTENTE ---
    case 'atualizar':
        $sql = "UPDATE Clientes SET nm_cliente = ?, cpf = ?, email = ?, telefone = ?, dt_nascimento = ?, endereco = ? WHERE cd_cliente = ?";

        $params = [
            $_POST['nm_cliente'],
            $_POST['cpf'],
            $_POST['email'],
            $_POST['telefone'],
            $_POST['dt_nascimento'],
            $_POST['endereco'],
            $_POST['cd_cliente'] // O ID do cliente a ser atualizado
        ];

        $stmt = sqlsrv_query($conn, $sql, $params);
        
        if ($stmt) {
            $response = ['status' => 'success', 'message' => 'Cliente atualizado com sucesso!'];
        } else {
            $response['message'] = 'Erro ao atualizar cliente: ' . print_r(sqlsrv_errors(), true);
        }
        break;

    // --- AÇÃO DE EXCLUIR UM CLIENTE ---
    case 'excluir':
        $sql = "DELETE FROM Clientes WHERE cd_cliente = ?";
        $params = [$_POST['cd_cliente']];
        $stmt = sqlsrv_query($conn, $sql, $params);

        if ($stmt) {
            $response = ['status' => 'success', 'message' => 'Cliente excluído com sucesso!'];
        } else {
            // Verifica se o erro é de chave estrangeira (cliente em uso)
            $errors = sqlsrv_errors();
            if (isset($errors[0]['SQLSTATE']) && $errors[0]['SQLSTATE'] == "23000") {
                 $response['message'] = 'Erro: Este cliente não pode ser excluído pois está associado a contratos ou agendamentos.';
            } else {
                 $response['message'] = 'Erro ao excluir cliente: ' . print_r($errors, true);
            }
        }
        break;
}

// Fecha a conexão com o banco
sqlsrv_close($conn);

// Retorna a resposta em JSON para o JavaScript
echo json_encode($response);
?>
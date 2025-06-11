<?php
// Inclui o arquivo de conexão para poder buscar os dados
// CÓDIGO NOVO E CORRIGIDO
include '../../DB/conexao.php';
// Query para selecionar todos os clientes, ordenados por nome
$sql = "SELECT cd_cliente, nm_cliente, cpf, email, telefone, dt_nascimento, endereco FROM Clientes ORDER BY nm_cliente ASC";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt === false) {
    die("Erro ao executar a consulta: " . print_r(sqlsrv_errors(), true));
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestão de Clientes - Academia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="bi bi-people-fill"></i> Gestão de Clientes</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#clienteModal" id="btnAdicionarCliente">
            <i class="bi bi-plus-circle"></i> Adicionar Novo Cliente
        </button>
    </div>

    <div id="alertPlaceholder"></div>

    <div class="table-responsive">
        <table class="table table-hover table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th class="text-center">Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Loop para exibir cada cliente do banco na tabela
                while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                    // Formata a data para o padrão brasileiro para exibição, se necessário
                    $dt_nascimento_formatada = $row['dt_nascimento'] ? $row['dt_nascimento']->format('Y-m-d') : '';
                ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['nm_cliente']); ?></td>
                    <td><?php echo htmlspecialchars($row['cpf']); ?></td>
                    <td><?php echo htmlspecialchars($row['email']); ?></td>
                    <td><?php echo htmlspecialchars($row['telefone']); ?></td>
                    <td class="text-center">
                        <button class="btn btn-warning btn-sm btnEditar"
                                data-bs-toggle="modal"
                                data-bs-target="#clienteModal"
                                data-id="<?php echo $row['cd_cliente']; ?>"
                                data-nome="<?php echo htmlspecialchars($row['nm_cliente']); ?>"
                                data-cpf="<?php echo htmlspecialchars($row['cpf']); ?>"
                                data-email="<?php echo htmlspecialchars($row['email']); ?>"
                                data-telefone="<?php echo htmlspecialchars($row['telefone']); ?>"
                                data-nascimento="<?php echo $dt_nascimento_formatada; ?>"
                                data-endereco="<?php echo htmlspecialchars($row['endereco']); ?>">
                            <i class="bi bi-pencil-square"></i> Editar
                        </button>
                        <button class="btn btn-danger btn-sm btnExcluir" data-id="<?php echo $row['cd_cliente']; ?>" data-nome="<?php echo htmlspecialchars($row['nm_cliente']); ?>">
                            <i class="bi bi-trash-fill"></i> Excluir
                        </button>
                    </td>
                </tr>
                <?php
                }
                // Libera os recursos do statement
                sqlsrv_free_stmt($stmt);
                ?>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="clienteModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitle">Adicionar Novo Cliente</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="clienteForm">
            <input type="hidden" id="cd_cliente" name="cd_cliente">

            <div class="row">
                <div class="col-md-8 mb-3">
                    <label for="nm_cliente" class="form-label">Nome Completo</label>
                    <input type="text" class="form-control" id="nm_cliente" name="nm_cliente" required>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="cpf" class="form-label">CPF</label>
                    <input type="text" class="form-control" id="cpf" name="cpf" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                 <div class="col-md-4 mb-3">
                    <label for="telefone" class="form-label">Telefone</label>
                    <input type="tel" class="form-control" id="telefone" name="telefone">
                </div>
            </div>
             <div class="row">
                <div class="col-md-12 mb-3">
                    <label for="endereco" class="form-label">Endereço</label>
                    <input type="text" class="form-control" id="endereco" name="endereco">
                </div>
            </div>
            <div class="row">
                 <div class="col-md-6 mb-3">
                    <label for="dt_nascimento" class="form-label">Data de Nascimento</label>
                    <input type="date" class="form-control" id="dt_nascimento" name="dt_nascimento">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', () => {

    const clienteModalEl = document.getElementById('clienteModal');
    const clienteModal = new bootstrap.Modal(clienteModalEl);
    const modalTitle = document.getElementById('modalTitle');
    const clienteForm = document.getElementById('clienteForm');
    const btnAdicionarCliente = document.getElementById('btnAdicionarCliente');

    // Função para exibir alertas
    const showAlert = (message, type = 'success') => {
        const alertPlaceholder = document.getElementById('alertPlaceholder');
        const wrapper = document.createElement('div');
        wrapper.innerHTML = [
            `<div class="alert alert-${type} alert-dismissible" role="alert">`,
            `   <div>${message}</div>`,
            '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
            '</div>'
        ].join('');
        alertPlaceholder.append(wrapper);
        // Auto-fecha o alerta após 5 segundos
        setTimeout(() => {
            wrapper.remove();
        }, 5000);
    };

    // --- LÓGICA PARA ABRIR MODAL (ADICIONAR) ---
    btnAdicionarCliente.addEventListener('click', () => {
        modalTitle.textContent = 'Adicionar Novo Cliente';
        clienteForm.reset();
        document.getElementById('cd_cliente').value = '';
    });

    // --- LÓGICA PARA ABRIR MODAL (EDITAR) ---
    document.querySelectorAll('.btnEditar').forEach(button => {
        button.addEventListener('click', () => {
            modalTitle.textContent = 'Editar Cliente';
            
            // Preenche o formulário com os dados do cliente
            document.getElementById('cd_cliente').value = button.dataset.id;
            document.getElementById('nm_cliente').value = button.dataset.nome;
            document.getElementById('cpf').value = button.dataset.cpf;
            document.getElementById('email').value = button.dataset.email;
            document.getElementById('telefone').value = button.dataset.telefone;
            document.getElementById('dt_nascimento').value = button.dataset.nascimento;
            document.getElementById('endereco').value = button.dataset.endereco;
        });
    });

    // --- LÓGICA PARA SUBMETER O FORMULÁRIO (INSERIR/ATUALIZAR) ---
    clienteForm.addEventListener('submit', (e) => {
        e.preventDefault(); // Impede o recarregamento da página

        const formData = new FormData(clienteForm);
        const clientId = document.getElementById('cd_cliente').value;
        
        // Define a ação (inserir ou atualizar)
        const acao = clientId ? 'atualizar' : 'inserir';
        formData.append('acao', acao);

        fetch('../../api_clientes.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                clienteModal.hide(); // Esconde o modal
                showAlert(data.message, 'success');
                // Recarrega a página para mostrar as alterações após 1 segundo
                setTimeout(() => location.reload(), 1000);
            } else {
                showAlert(data.message, 'danger');
            }
        })
        .catch(error => {
            console.error('Erro:', error);
            showAlert('Ocorreu um erro na comunicação com o servidor.', 'danger');
        });
    });

    // --- LÓGICA PARA EXCLUIR ---
    document.querySelectorAll('.btnExcluir').forEach(button => {
        button.addEventListener('click', () => {
            const id = button.dataset.id;
            const nome = button.dataset.nome;

            if (confirm(`Tem certeza que deseja excluir o cliente "${nome}"?`)) {
                const formData = new FormData();
                formData.append('acao', 'excluir');
                formData.append('cd_cliente', id);

                fetch('../../api_clientes.php', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.status === 'success') {
                        showAlert(data.message, 'success');
                        setTimeout(() => location.reload(), 1000);
                    } else {
                        showAlert(data.message, 'danger');
                    }
                })
                .catch(error => {
                    console.error('Erro:', error);
                    showAlert('Ocorreu um erro na comunicação com o servidor.', 'danger');
                });
            }
        });
    });

});
</script>

</body>
</html>
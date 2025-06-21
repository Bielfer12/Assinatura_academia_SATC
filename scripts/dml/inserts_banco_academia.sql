-- Tabela Clientes 
INSERT INTO Clientes (nm_cliente, cpf, email, telefone, dt_nascimento, endereco, dt_cadastro)
VALUES
('Gabriel Fillipe Casagrande Fernandes', '11122233344', 'gabriel.fernandes@email.com', '48912345678', '20030510', 'Rua das Flores, 123, Criciúma/SC', '20240701'),
('Guilherme Rabello Carrer', '22233344455', 'guilherme.carrer@email.com', '48923456789', '20040820', 'Av. Centenário, 456, Criciúma/SC', '20240705'),
('Nathan Rocha Gomes', '33344455566', 'nathan.gomes@email.com', '48934567890', '20031201', 'Rua São Paulo, 789, Criciúma/SC', '20240710'),
('Miguel Nilo Rosa', '44455566677', 'miguel.rosa@email.com', '48945678901', '20040715', 'Av. Santos Dumont, 101, Criciúma/SC', '20240715'),
('Henrique da Silva Ronzani', '55566677788', 'henrique.ronzani@email.com', '48956789012', '20030322', 'Rua Cel. Pedro Ferreira, 202, Criciúma/SC', '20240720'),
('Luis Filipe Damiani Colombo', '66677788899', 'luis.colombo@email.com', '48967890123', '20041111', 'Rua Benjamin Constant, 303, Criciúma/SC', '20240801'),
('Fernando Fernandes de Farias', '77788899900', 'fernando.farias@email.com', '48978901234', '20030930', 'Rua José Bonifácio, 404, Criciúma/SC', '20240805'),
('Thiago de Moliner Colombo', '88899900011', 'thiago.colombo@email.com', '48989012345', '20040425', 'Av. Getúlio Vargas, 505, Criciúma/SC', '20240810'),
('Kauan Custodio Propodoski', '99900011122', 'kauan.propodoski@email.com', '48990123456', '20030610', 'Rua Coronel Pedro Benedet, 606, Criciúma/SC', '20240815'),
('Leonardo da Silva Joaquim', '00011122233', 'leonardo.joaquim@email.com', '48901234567', '20040105', 'Rua Felipe Schmidt, 707, Criciúma/SC', '20240820');

-- Tabela Funcionarios
INSERT INTO Funcionarios (nm_funcionario, cpf, email, telefone, cd_cargo, nm_cargo, dt_admissao)
VALUES
('Marcos Aurélio Santana', '12345678901', 'marcos.santana@academia.com', '48991234567', 1, 'Gerente', '2022-01-15'),
('Patrícia Oliveira Machado', '23456789012', 'patricia.machado@academia.com', '48992345678', 2, 'Instrutor Chefe', '2022-03-10'),
('Rafael Torres de Souza', '34567890123', 'rafael.souza@academia.com', '48993456789', 3, 'Instrutor', '2022-05-20'),
('Juliana Costa e Silva', '45678901234', 'juliana.silva@academia.com', '48994567890', 3, 'Instrutor', '2022-07-05'),
('Luciano Pires Montenegro', '56789012345', 'luciano.montenegro@academia.com', '48995678901', 4, 'Recepcionista', '2022-09-12'),
('Camila Duarte Alencar', '67890123456', 'camila.alencar@academia.com', '48996789012', 4, 'Recepcionista', '2022-11-18'),
('Vitor Hugo Barreto', '78901234567', 'vitor.barreto@academia.com', '48997890123', 5, 'Nutricionista', '2023-01-22'),
('Isabela Fontoura Lima', '89012345678', 'isabela.lima@academia.com', '48998901234', 5, 'Fisioterapeuta', '2023-03-30'),
('Gustavo Henrique Peixoto', '90123456789', 'gustavo.peixoto@academia.com', '48999012345', 6, 'Personal Trainer', '2023-05-15'),
('Ana Carolina Ribeiro', '01234567890', 'ana.ribeiro@academia.com', '48990123456', 6, 'Personal Trainer', '2023-07-20');

-- Tabela Planos
INSERT INTO Planos (nm_plano, descricao, vl_preco, tp_plano)
VALUES
('Plano Básico', 'Acesso à academia em horário comercial', 99.90, 'STANDARD'),
('Plano Plus', 'Acesso ilimitado + 2 aulas semanais', 149.90, 'STANDARD'),
('Plano Gold', 'Acesso ilimitado + 5 aulas semanais + avaliação física', 199.90, 'GOLD'),
('Plano Black', 'Acesso 24h + aulas ilimitadas + personal trainer', 299.90, 'BLACK'),
('Plano Estudante', 'Acesso em horário comercial com desconto', 79.90, 'STANDARD'),
('Plano Casal', 'Dois planos básicos com desconto', 169.90, 'STANDARD'),
('Plano Família', 'Três planos básicos com desconto', 239.90, 'STANDARD'),
('Plano Sênior', 'Para maiores de 60 anos', 89.90, 'STANDARD'),
('Plano Corporativo', 'Para empresas com 5+ funcionários', 89.90, 'STANDARD'),
('Plano VIP', 'Todos os benefícios + estacionamento', 349.90, 'BLACK');

-- Tabela Aulas 
INSERT INTO Aulas (nm_aula, descricao, dt_inicio, dt_fim, cd_instrutor, capacidade)
VALUES
('Musculação', 'Treino de força e resistência muscular', '20240801 07:00:00', '20241231 22:00:00', 2, 20),
('CrossFit', 'Treino funcional de alta intensidade', '20240801 08:00:00', '20241231 20:00:00', 3, 15),
('Zumba', 'Aula de dança e exercícios aeróbicos', '20240801 09:00:00', '20241231 19:00:00', 4, 25),
('Pilates', 'Exercícios de alongamento e fortalecimento', '20240801 10:00:00', '20241231 18:00:00', 4, 10),
('Spinning', 'Aula de ciclismo indoor', '20240801 17:00:00', '20241231 21:00:00', 3, 15),
('Boxe', 'Treino de boxe e condicionamento físico', '20240801 18:00:00', '20241231 21:00:00', 2, 12),
('Yoga', 'Prática de posturas e meditação', '20240801 07:00:00', '20241231 09:00:00', 4, 15),
('Funcional', 'Exercícios que simulam movimentos do dia a dia', '20240801 12:00:00', '20241231 13:00:00', 3, 20),
('HIIT', 'Treino intervalado de alta intensidade', '20240801 19:00:00', '20241231 20:00:00', 2, 15),
('Alongamento', 'Exercícios para flexibilidade e relaxamento', '20240801 20:00:00', '20241231 21:00:00', 4, 20);

-- Tabela Contratos
INSERT INTO Contratos (cd_funcionario, cd_cliente, cd_plano, dt_inicio, dt_fim, status)
VALUES
(5, 1, 3, '2024-08-01', '2025-08-01', 'ATIVO'),
(6, 2, 1, '2024-08-05', '2024-11-05', 'ATIVO'),
(5, 3, 4, '2024-08-10', '2025-02-10', 'ATIVO'),
(6, 4, 2, '2024-08-15', '2024-11-15', 'ATIVO'),
(5, 5, 3, '2024-07-20', '2024-08-20', 'INATIVO'),
(6, 6, 5, '2024-08-01', '2024-09-01', 'INATIVO'),
(5, 7, 6, '2024-09-05', '2025-03-05', 'PENDENTE'),
(6, 8, 7, '2024-09-10', '2025-03-10', 'PENDENTE'),
(5, 9, 8, '2024-09-15', '2024-12-15', 'PENDENTE'),
(6, 10, 9, '2024-09-20', '2025-03-20', 'PENDENTE');

-- Tabela Agendas
INSERT INTO Agendas (cd_aula, nm_aula, cd_aluno,  dias_semana)
VALUES
(2, 'CrossFit', 1, 'SEGUNDA'),
(2, 'CrossFit', 1, 'QUARTA'),
(3, 'Zumba', 2, 'TERÇA'),
(3, 'Zumba', 2,  'QUINTA'),
(4, 'Pilates', 3, 'SEGUNDA'),
(4, 'Pilates', 3, 'QUARTA'),
(5, 'Spinning', 4,  'SEXTA'),
(6, 'Boxe', 1,  'TERÇA'),
(6, 'Boxe', 3, 'QUINTA'),
(7, 'Yoga', 4,  'SABADO');

-- Tabela Pagamentos
INSERT INTO Pagamentos (cd_contrato, valor_pago, metodo_pag, dt_pagamento)
VALUES
(1, 199.90, 'CREDITO', '20240802 08:00:00'),
(2, 99.90, 'DEBITO', '20240805 09:15:00'),
(3, 299.90, 'PIX', '20250107 18:23:00'),
(4, 149.90, 'CREDITO', '20250129 10:57:00'),
(5, 199.90, 'DEBITO', '20250506 11:17:00'),
(6, 79.90, 'PIX', '20250915 15:12:00'),
(7, 79.90, 'PIX', '20251113 13:01:00'),
(8, 99.90, 'PIX', '20251219 09:15:00'),
(9, 199.90, 'DEBITO', '20250201 19:15:00'),
(10, 99.90, 'CREDITO', '20250901 08:37:00');

-- Tabela Controle_Acessos 
INSERT INTO Controle_Acessos (cd_cliente, dt_entrada, dt_saida)
VALUES
(1, '20240802 08:15:00', '20240802 10:30:00'),
(1, '20240807 09:00:00', '20240807 11:15:00'),
(2, '20240806 07:30:00', '20240806 09:45:00'),
(2, '20240813 17:00:00', '20240813 19:30:00'),
(3, '20240811 18:15:00', '20240811 20:45:00'),
(3, '20240818 08:45:00', '20240818 11:00:00'),
(4, '20240816 12:00:00', '20240816 14:30:00'),
(4, '20240823 19:00:00', '20240823 21:15:00'),
(5, '20240801 07:00:00', '20240801 09:30:00'),
(6, '20240815 16:30:00', '20240815 18:45:00');

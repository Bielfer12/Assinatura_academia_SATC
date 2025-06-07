-- Tabela Clientes 
INSERT INTO Clientes (nm_cliente, cpf, email, telefone, dt_nascimento, endereco, dt_cadastro)
VALUES
('Gabriel Fillipe Casagrande Fernandes', '11122233344', 'gabriel.fernandes@email.com', '48912345678', '20030510', 'Rua das Flores, 123, Criciúma/SC', '20230701'),
('Guilherme Rabello Carrer', '22233344455', 'guilherme.carrer@email.com', '48923456789', '20040820', 'Av. Centenário, 456, Criciúma/SC', '20230705'),
('Nathan Rocha Gomes', '33344455566', 'nathan.gomes@email.com', '48934567890', '20031201', 'Rua São Paulo, 789, Criciúma/SC', '20230710'),
('Miguel Nilo Rosa', '44455566677', 'miguel.rosa@email.com', '48945678901', '20040715', 'Av. Santos Dumont, 101, Criciúma/SC', '20230715'),
('Henrique da Silva Ronzani', '55566677788', 'henrique.ronzani@email.com', '48956789012', '20030322', 'Rua Cel. Pedro Ferreira, 202, Criciúma/SC', '20230720'),
('Luis Filipe Damiani Colombo', '66677788899', 'luis.colombo@email.com', '48967890123', '20041111', 'Rua Benjamin Constant, 303, Criciúma/SC', '20230801'),
('Fernando Fernandes de Farias', '77788899900', 'fernando.farias@email.com', '48978901234', '20030930', 'Rua José Bonifácio, 404, Criciúma/SC', '20230805'),
('Thiago de Moliner Colombo', '88899900011', 'thiago.colombo@email.com', '48989012345', '20040425', 'Av. Getúlio Vargas, 505, Criciúma/SC', '20230810'),
('Kauan Custodio Propodoski', '99900011122', 'kauan.propodoski@email.com', '48990123456', '20030610', 'Rua Coronel Pedro Benedet, 606, Criciúma/SC', '20230815'),
('Leonardo da Silva Joaquim', '00011122233', 'leonardo.joaquim@email.com', '48901234567', '20040105', 'Rua Felipe Schmidt, 707, Criciúma/SC', '20230820');


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

# Projeto Sistema de Assinatura de Academia - GRUPO C

Este projeto consiste na criação e implementação de um sistema de gestão de academia, abrangendo desde o modelo físico do banco de dados até uma aplicação web funcional. Nosso foco foi desenvolver uma solução completa para gerenciamento de clientes, contratos, planos, aulas, funcionários e controle de acessos, utilizando uma abordagem de **metodologias ativas de aprendizagem**.

O projeto integra um **banco de dados SQL Server** robusto com uma aplicação web interativa desenvolvida em **PHP, HTML e Bootstrap**. Esta aplicação fornece um **CRUD** (Create, Read, Update, Delete) intuitivo para as principais entidades do sistema, permitindo uma gestão eficiente dos dados. Além das operações básicas, exploramos e implementamos recursos avançados do SQL, como **funções, triggers, stored procedures e índices**, para otimizar o desempenho e automatizar a lógica de negócio. A eficácia desses recursos foi demonstrada na resolução de **6 perguntas de negócio** estratégicas.

### Integrantes
Fernando Fernandes Farias - <a href="https://github.com/FernandoFernandesFarias">FernandoFernandesFarias</a><br>
Gabriel Fillipe Casagrande Fernandes - <a href="https://github.com/Bielfer12">Bielfer12</a><br>
Guilherme Rabello Carrer - <a href="https://github.com/GuilhermeCarrer">GuilhermeCarrer</a><br>
Luis Filipe Damiani Colombo - <a href="https://github.com/luisfilipedm">luisfilipedm</a><br>
Thiago de Moliner Colombo - <a href="https://github.com/Thiago-moliner">Thiago-moliner</a><br>

### Modelo Físico
Utilizamos a ferramenta de modelagem de dados [dbdiagram.io](https://dbdiagram.io/) para a criação do modelo físico do banco de dados. Este processo envolveu a otimização da quantidade de colunas e dos tipos de dados, além da aplicação de princípios de normalização para garantir a integridade e eficiência do banco. O modelo serviu como base para a geração dos scripts DDL.

* Arquivo fonte: [Modelo Físico](https://github.com/Bielfer12/Assinatura_academia_SATC/blob/main/modelo_fisico/modelo.pdf)

![image](https://github.com/user-attachments/assets/125fa11c-799a-4b80-8f36-a29eb5c92ce7)

### Dicionário de Dados
As informações detalhadas sobre cada tabela, suas colunas, tipos de dados, restrições e outros metadados foram cuidadosamente documentadas na planilha [dicionario_dados_academia.xlsx](https://github.com/Bielfer12/Assinatura_academia_SATC/blob/main/Dicionario%20de%20dados/dicionario_dados_academia.xlsx). Este dicionário é uma ferramenta essencial para a compreensão e manutenção da estrutura do banco de dados.

### Scripts SQL
Para este projeto, foi utilizado o sistema de gerenciamento de banco de dados **SQL Server**. Abaixo, seguem os scripts SQL organizados por tipo, que permitem a criação completa do ambiente de banco de dados, incluindo sua estrutura e dados de exemplo.

* [Script de Criação do Banco de Dados](https://github.com/Bielfer12/Assinatura_academia_SATC/blob/main/scripts/ddl/script.sql) (Se houver um script separado para o `CREATE DATABASE` e `USE [ABP]`)
* [Tabelas](https://github.com/Bielfer12/Assinatura_academia_SATC/tree/main/scripts/ddl/tables)
* [Índices](scripts/ddl/indices) - Desenvolvidos para otimizar o desempenho das consultas, com foco em índices não agrupados como `IDX_ControleAcessos_Cliente_DataEntrada` e `IDX_Contratos_Cliente_Status_Periodo`. A escolha e a eficácia desses índices foram validadas através da análise do plano de acesso, operadores e chaves das consultas.
* [Gatilhos (Triggers)](https://github.com/Bielfer12/Assinatura_academia_SATC/blob/main/scripts/ddl/gatilhos/trigger.sql) - Implementado, por exemplo, um gatilho para registrar a `dt_ultima_inativacao` na tabela `Contratos` automaticamente quando o status de um contrato é alterado para 'INATIVO', garantindo a consistência do histórico de dados.
* [Procedimentos Armazenados (Stored Procedures)](scripts/ddl/procedimentos-armazenados) - Utilizados para encapsular lógicas de negócio complexas, realizar operações transacionais ou automatizar tarefas repetitivas, como a inserção de dados em massa ou a atualização de status. Contribuem para a segurança e a performance do sistema.
* [Funções](https://github.com/Bielfer12/Assinatura_academia_SATC/blob/main/scripts/ddl/funcoes/funcao.sql) - Inclui a função escalar `dbo.fn_ObterNivelAtividadeCliente`, que calcula o nível de atividade de um cliente (Muito Ativo, Ativo, Moderado, Pouco Ativo, Inativo) com base na quantidade de acessos em um dado período e o status do contrato. Esta função demonstra a capacidade de encapsular lógica de negócio reutilizável diretamente no banco de dados.
* [DML (População de Dados)](https://github.com/Bielfer12/Assinatura_academia_SATC/blob/main/scripts/dml/inserts_banco_academia.sql) - Scripts para popular as tabelas com dados de exemplo (mínimo de 10 itens principais por tabela relevante), facilitando o teste e a demonstração do sistema.

### Perguntas de Negócio
Para evidenciar a capacidade analítica do sistema, foram formuladas e respondidas 6 perguntas de negócio estratégicas. A resolução dessas perguntas utilizou os objetos SQL (funções, índices, etc.) para extrair informações relevantes de forma otimizada. As consultas e os resultados são essenciais para a tomada de decisões gerenciais.

### Código Fonte do CRUD (Aplicação Web)
A aplicação web foi desenvolvida para oferecer uma interface amigável para a interação com o banco de dados.

* **Linguagem de Programação:** PHP
* **Tecnologias Frontend:** HTML e Bootstrap (para design responsivo e componentes visuais)
* **Funcionalidades:** Permite realizar operações CRUD (Cadastro, Listagem, Edição e Exclusão) para entidades como Clientes e Contratos, demonstrando a conexão e manipulação de dados em tempo real.

[Código Fonte da Aplicação Web](crud/)

### Passos para Execução do CRUD

Para configurar e executar o projeto em seu ambiente:

1.  **Configurar o Banco de Dados SQL Server:**
    * Certifique-se de ter uma instância do SQL Server instalada e em execução (pode ser local, via Docker ou em um serviço de nuvem).
    * Crie o banco de dados `ABP` e execute sequencialmente todos os scripts DDL (tabelas, índices, gatilhos, procedimentos, funções) localizados na pasta `scripts/ddl/`.
    * Popule as tabelas com dados de exemplo executando os scripts DML da pasta `scripts/dml/`.

2.  **Configurar o Ambiente PHP (Servidor Web):**
    * Instale um servidor web como Apache e o interpretador PHP em sua máquina.
    * Posicione a pasta `crud/` (contendo o código da aplicação web) no diretório de publicação do seu servidor web (ex: `htdocs` para Apache, `www`.
    * Revise e configure as credenciais de conexão ao banco de dados no arquivo PHP responsável pela conexão 

3.  **Acessar a Aplicação Web:**
    * Abra seu navegador e acesse o endereço da aplicação (ex: `http://localhost/crud/index.php` ou o caminho configurado no seu servidor web).

### Relatório Final
O relatório final do projeto, contendo uma documentação mais aprofundada sobre cada etapa do desenvolvimento, análises e conclusões, está disponível no arquivo [relatorio/template1.docx](relatorio/template1.docx).

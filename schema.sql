-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: schema.sql
-- ============================================================
-- 1. CRIAR A TABELA DE UTILIZADORES
CREATE TABLE Utilizadores (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
data_registo TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- 2. CRIAR A TABELA DE PRODUTOS
CREATE TABLE Produtos (
id SERIAL PRIMARY KEY,
titulo VARCHAR(200) NOT NULL,
preco DECIMAL(10, 2) NOT NULL,
stock INT NOT NULL
);
-- 3. CRIAR A TABELA DE VENDAS (LIGADA ÀS DUAS ANTERIORES)
CREATE TABLE Vendas (
id SERIAL PRIMARY KEY,
utilizador_id INT REFERENCES Utilizadores(id),
produto_id INT REFERENCES Produtos(id),
quantidade INT NOT NULL,
data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ============================================================
-- INSERÇÃO DE DADOS DE TESTE (ORDEM OBRIGATÓRIA)
-- ============================================================
-- Passo A: Registar Utilizadores (Criados com ID 1, ID 2 e ID 3)
INSERT INTO Utilizadores (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Ana Martins', 'ana.martins@email.com'),
('Carlos Sousa', 'carlos.sousa@email.com');
-- Passo B: Registar Produtos (Criados com ID 1, ID 2 e ID 3)
INSERT INTO Produtos (titulo, preco, stock) VALUES
('Livro de SQL para Análise de Dados', 25.50, 50),
('Curso Completo de Power BI', 89.90, 100),
('Manual de Modelação Relacional', 15.00, 30);
-- Passo C: Registar Vendas (Agora já existem Utilizadores e Produtos!)
INSERT INTO Vendas (utilizador_id, produto_id, quantidade) VALUES
(1, 1, 2), -- O João Silva (ID 1) comprou 2 Livros de SQL (ID 1)
(2, 2, 1), -- A Ana Martins (ID 2) comprou 1 Curso de Power BI (ID 2)
(1, 3, 1); -- O João Silva (ID 1) comprou 1 Manual de Modelação (ID 3)
-- ============================================================
-- CONSULTA DE VALIDAÇÃO (Mostrar os resultados)
-- ============================================================
SELECT * FROM Vendas;

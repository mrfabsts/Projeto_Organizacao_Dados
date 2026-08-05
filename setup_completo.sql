-- 1. Limpeza total (Cuidado: isto apaga tudo!)
DROP TABLE IF EXISTS Vendas;
DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Utilizadores;
-- 2. Criação da estrutura
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

-- Restrição para o email
ALTER TABLE Utilizadores
ADD CONSTRAINT email_valido CHECK (email LIKE '%@%.%'); 

ALTER TABLE Produtos
ADD CONSTRAINT preco_positivo CHECK (preco >= 0);

ALTER TABLE Vendas
ADD CONSTRAINT qtd_positiva CHECK (quantidade >= 0);
-- 3. Aceleração
CREATE INDEX idx_utilizador_nome ON Utilizadores(nome);
-- 4. Segurança
CREATE ROLE estagiario_leitor;
GRANT SELECT ON Utilizadores TO estagiario_leitor; 

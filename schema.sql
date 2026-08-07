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

-- Restrição para o email
ALTER TABLE Utilizadores
ADD CONSTRAINT email_valido CHECK (email LIKE '%@%.%'); 

ALTER TABLE Produtos
ADD CONSTRAINT preco_positivo CHECK (preco >= 0);

ALTER TABLE Vendas
ADD CONSTRAINT qtd_positiva CHECK (quantidade >= 0);

-- 3. Aceleração
CREATE INDEX idx_utilizador_nome ON Utilizadores(nome);
CREATE INDEX idx_produto_titulo ON produtos(titulo);
CREATE INDEX idx_produtos_mais_vendidos
ON Vendas (quantidade)
WHERE quantidade >= 10; 
-- 4. Segurança
CREATE ROLE estagiario_leitor;
GRANT SELECT ON Utilizadores TO estagiario_leitor;
-- 5. Auditoria
CREATE TABLE Auditoria_Precos (
 produto_id INT,
 preco_antigo DECIMAL,
 preco_novo DECIMAL,
 data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- O Porteiro (Trigger)
CREATE OR REPLACE FUNCTION registar_alteracao()
RETURNS TRIGGER AS $$
BEGIN
 INSERT INTO Auditoria_Precos (produto_id, preco_antigo, preco_novo)
 VALUES (
OLD.id
, OLD.preco, NEW.preco);
 RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER porteiro_precos
AFTER UPDATE ON Produtos
FOR EACH ROW EXECUTE FUNCTION registar_alteracao(); 

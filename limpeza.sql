DELETE FROM Vendas
WHERE quantidade <= 0;

DELETE FROM Produtos
WHERE preco <= 0;

UPDATE Utilizadores
SET email = 'novo.joao@email.com'
WHERE nome = 'João Silva';

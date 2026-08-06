SELECT
p.titulo AS nome_produto,
SUM(v.quantidade) AS total_vendido
FROM Vendas v
JOIN Produtos p ON v.produto_id = p.id
GROUP BY p.titulo
HAVING SUM(v.quantidade) > 10;

SELECT
 produto_id,
 SUM(quantidade) AS total_unidades,
 COUNT(id) AS numero_encomendas
FROM Vendas
GROUP BY produto_id
HAVING SUM(quantidade) > 5
ORDER BY total_unidades DESC; 

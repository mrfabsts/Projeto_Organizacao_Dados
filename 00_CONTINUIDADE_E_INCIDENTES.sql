-- Criar a estrutura para o registo centralizado de incidentes
CREATE TABLE IF NOT EXISTS tb_log_incidentes (
 id_incidente SERIAL PRIMARY KEY,
 data_ocorrencia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 descricao_erro TEXT NOT NULL,
 causa_raiz TEXT,
 solucao_aplicada TEXT NOT NULL,
 responsavel VARCHAR(100) NOT NULL
);
-- Exemplo de inserção de registo de resolução
INSERT INTO tb_log_incidentes (descricao_erro, causa_raiz,
solucao_aplicada, responsavel)
VALUES ('Erro de ligação à View v_vendas_ativas', 'Credenciais expiradas',
'Renovação de permissões da Role leitor_relatorios', 'Administrador'); 

SELECT pid, usename, state, query, age(clock_timestamp(), query_start)
FROM pg_stat_activity
WHERE state != 'idle'; 
VACUUM ANALYZE; 

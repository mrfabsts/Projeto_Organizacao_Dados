-- PASSO 1: Eliminar tabelas temporárias e de testes que já não são necessárias
DROP TABLE IF EXISTS tmp_importacao_excel;
DROP TABLE IF EXISTS teste_vendas_antigo;
-- PASSO 2: Purga de logs de auditoria com mais de 90 dias
-- (Mantém apenas o histórico recente para poupar espaço)
DELETE FROM auditoria_logs
WHERE data_operacao < NOW() - INTERVAL '90 days';
-- PASSO 3: Recomprimir espaço e reindexar a base de dados
-- O VACUUM limpa o espaço "morto" deixado pelos registos apagados
VACUUM ANALYZE;
-- PASSO 4: Confirmação de execução
SELECT 'LIMPEZA E OTIMIZAÇÃO CONCLUÍDAS COM SUCESSO' AS
resultado_manutencao,
 NOW() AS data_execucao; 


1. Segurança de Dados: "A nossa base de dados está alojada na nuvem com
cópias de segurança automáticas e capacidade de recuperação
instantânea."
2. Monitorização:"O painel mostra visualmente o estado de saúde do sistema.
Se o indicador estiver verde/Active, as operações estão a decorrer a 100%."
3. Autonomia: "Toda a estrutura está documentada no SQL Editor. Qualquer
colaborador autorizado pode consultar a documentação e operar o sistema
sem dependências." 


Hora 30:
-- Consulta do catálogo do sistema para auditoria de tabelas e views
SELECT 
    table_schema, 
    table_name, 
    table_type 
FROM information_schema.tables 
WHERE table_schema = 'public' 
ORDER BY table_type, table_name; 

1. Mitigação de Risco: "A nossa base de dados está alojada na nuvem com cópias de segurança automáticas e capacidade de recuperação instantânea."
2. Ganho de Tempo: "O painel mostra visualmente o estado de saúde do sistema. Se o indicador estiver verde/Active, as operações estão a decorrer a 100%."
3. Autonomia e Legado: "Toda a estrutura está documentada no SQL Editor. Qualquer colaborador autorizado pode consultar a documentação e operar o sistema sem dependências." 

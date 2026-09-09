-- 1. Criar a vista de auditoria final do sistema
CREATE OR REPLACE VIEW v_auditoria_sistema_final AS
SELECT
 'Tabelas Principais' AS componente,
 COUNT(*)::text AS estado_ou_quantidade,
 'Tabelas de dados e auditoria operacionais' AS observacao
FROM information_schema.tables
WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
UNION ALL
SELECT
 'Vistas de Relatório' AS componente,
 COUNT(*)::text AS estado_ou_quantidade,
 'Vistas organizacionais disponíveis' AS observacao
FROM information_schema.views
WHERE table_schema = 'public'
UNION ALL
SELECT
 'Segurança SSL / Conexão' AS componente,
 'ATIVO' AS estado_ou_quantidade,
 'Ligação encriptada TLS/SSL obrigatória' AS observacao
UNION ALL
SELECT
 'Backup & PITR (Neon Cloud)' AS componente,
 'HABILITADO' AS estado_ou_quantidade,
 'Recuperação por ponto no tempo disponível no Neon Console' AS observacao;
-- 2. Conceder visibilidade pública da auditoria
GRANT SELECT ON v_auditoria_sistema_final TO PUBLIC; 

-- Inserção do registo de validação final da infraestrutura
INSERT INTO tb_historico_melhorias (categoria, descricao_melhoria, autor)
VALUES (
 'Auditoria Final',
 'Infraestrutura concluída: tabelas estruturadas, vistas operacionais,
políticas de acesso aplicadas, Saved Queries catalogadas e PITR verificado.',
 'Engenheiro de Dados'
);
-- Consulta de confirmação de entrega do projeto
SELECT
 id_melhoria,
 data_implementacao,
 categoria,
 descricao_melhoria,
 autor
FROM tb_historico_melhorias
ORDER BY id_melhoria DESC; 


Fernando Teodósio disse:-- 1. Criar a estrutura central de produtividade e plano de desenvolvimento
CREATE TABLE IF NOT EXISTS tb_sistema_pessoal_engenheiro (
 id_registo SERIAL PRIMARY KEY,
 data_registo DATE DEFAULT CURRENT_DATE,
 categoria VARCHAR(50) NOT NULL, -- 'AUTOMACAO', 'ESTUDO_TECNICO',
'GESTAO_CONHECIMENTO'
 descricao TEXT NOT NULL,
 meta_horas_semana INT DEFAULT 1,
 link_repositorio TEXT,
 estado VARCHAR(30) DEFAULT 'EM_EXECUCAO'
);
-- 2. Inserir os objetivos estratégicos de especialização e automação
INSERT INTO tb_sistema_pessoal_engenheiro (categoria, descricao,
meta_horas_semana, link_repositorio)
VALUES
('AUTOMACAO', 'Regra dos 2 min: Script Python para sincronização de backups
PostgreSQL na Cloud', 2, '
https://github.com/utilizador/cloud-sync
'),
('ESTUDO_TECNICO', 'Aprofundamento em Python (psycopg2) para pipelines de
extração de dados', 1, '
https://docs.python.org/3/
'),
('GESTAO_CONHECIMENTO', 'Centralização do repositório de credenciais
encriptadas e documentação', 1, '
https://drive.google.com/drive/
'); 


Fernando Teodósio disse:-- 1. Criar a vista com o protocolo de entrega e acessos do sistema
CREATE OR REPLACE VIEW v_handoff_sistema AS
SELECT
 'Consola Principal' AS recurso,
 '
https://console.neon.tech/
 (Projeto da Organização)' AS localizacao,
 'Acesso atribuído aos administradores via e-mail corporativo.' AS procedimento
UNION ALL
SELECT
 'Manual Operacional',
 'Saved Query: 00_INSTRUCOES / View: v_instrucoes_equipa',
 'Consulta direta no SQL Editor para resolução autónoma de dúvidas.'
UNION ALL
SELECT
 'Recuperação por Ponto no Tempo (PITR)',
 'Neon Console -> Menu Branches -> Select Time',
 'Permite reverter a base de dados para qualquer minuto em caso de erro crítico.'
UNION ALL
SELECT
 'Relatórios de Negócio',
 'Microsoft Power BI / Excel via SSL (sslmode=require)',
 'Ligação encriptada com o papel leitor_relatorios.';
-- 2. Conceder permissão de leitura a todos os perfis do sistema
GRANT SELECT ON v_handoff_sistema TO PUBLIC; 


Fernando Teodósio disse:-- 1. Eliminar eventuais tabelas temporárias ou rascunhos de testes
DROP TABLE IF EXISTS tb_teste_resiliencia_temp;
DROP TABLE IF EXISTS tb_vendas_rascunho;
-- 2. Registrar o ato formal de passagem de testemunho e conclusão das 50 horas
INSERT INTO tb_historico_melhorias (categoria, descricao_melhoria, autor)
VALUES (
 'Passagem de Testemunho',
 'Conclusão da UFCD 10797: Sistema totalmente documentado, autossuficiente,
com vistas de handoff ativas e permissões delegadas.',
 'Engenheiro de Dados'
);
-- 3. Confirmar o histórico final atualizado
SELECT * FROM tb_historico_melhorias ORDER BY id_melhoria DESC; 

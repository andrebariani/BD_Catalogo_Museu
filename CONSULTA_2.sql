--Consultas--

--Consulta 2--
SELECT nome_mus AS Nome_do_museu, tipo_ativ AS Tipo_atividade, preco_ativ AS Preço_atividade, nome_ativ AS Nome_atividade, cidade AS Cidade
FROM museu AS m, atividade AS a
WHERE m.cod_mus = a.cod_mus AND preco_ativ <= 10
ORDER BY preco_ativ;

SET enable_seqscan = on;

SET max_parallel_workers_per_gather = 0;

--Índice utilizado na consulta 2-- 
CREATE INDEX IX_preco_ativ ON atividade(preco_ativ ASC);

CREATE INDEX IX_cod_mus_cod_ativ ON atividade(cod_mus, cod_ativ);

CREATE INDEX IX_cod_mus_preco_ativ ON atividade(cod_mus, preco_ativ ASC);

CLUSTER ATIVIDADE USING IX_preco_ativ;

DROP INDEX IX_preco_ativ;

DROP INDEX IX_cod_mus_preco_ativ;

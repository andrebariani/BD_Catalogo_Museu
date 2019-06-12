--Consulta 2--
SELECT m.cod_mus AS Codigo_do_museu, nome_mus AS Nome_do_museu, horario_ativ AS Horario_da_atividade, nome_ativ AS Nome_atividade, preco_ativ AS Preço_atividade
FROM museu AS m, atividade AS a
WHERE m.cod_mus = a.cod_mus AND preco_ativ <= $1
ORDER BY preco_ativ;

SET enable_seqscan = on;

SET max_parallel_workers_per_gather = 0;

--Índice utilizado na consulta 2-- 
CREATE INDEX IX_preco_ativ ON atividade(preco_ativ ASC);
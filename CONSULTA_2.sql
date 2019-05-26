--Consultas--

--Consulta 2--
SELECT nome_mus AS Nome_do_museu, tipo_ativ AS Tipo_atividade, preco_ativ AS Preço_atividade, nome_ativ AS Nome_atividade, cidade AS Cidade
FROM museu AS m, atividade AS a
WHERE m.cod_mus = a.cod_mus AND preco_ativ <= 10
ORDER BY preco_ativ;

--Índice utilizado na consulta 2-- 
CREATE INDEX IX_preco_ativ ON atividade(preco_ativ ASC);

DROP INDEX IX_preco_ativ;

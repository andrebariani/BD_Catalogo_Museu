--Consultas--

--Consulta 1--

-- (SLOW)

SELECT nome_mus AS Nome_do_museu, nome_col AS Nome_coleção, tipo_col AS Tipo_coleção, idioma AS Idioma, preco_ent AS Preço_entrada
FROM museu AS m, colecao AS c 
WHERE tipo_col ILIKE 'b%' AND m.cod_mus = c.cod_mus;

-- (FAST)
SELECT nome_mus AS Nome_do_museu, nome_col AS Nome_coleção, tipo_col AS Tipo_coleção, idioma AS Idioma, preco_ent AS Preço_entrada
FROM colecao as c LEFT OUTER JOIN museu as m ON (lower(tipo_col) LIKE 'b%')
WHERE m.cod_mus = c.cod_mus;

--Índice utilizado na consulta 1-- 
CREATE INDEX IX_cod_mus_cod_col
ON COLECAO(cod_mus, cod_col);

-- Desligar busca sequencial é necessário para otimização

SET enable_seqscan = on;

SET enable_indexscan to OFF;
SET enable_bitmapscan to OFF;

SET enable_indexscan to ON;
SET enable_bitmapscan to ON;
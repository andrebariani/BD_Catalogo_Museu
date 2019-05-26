SELECT nome_mus AS Nome_do_museu, nome_col AS Nome_coleção, tipo_col AS Tipo_coleção, idioma AS Idioma, preco_ent AS Preço_entrada
FROM colecao AS c NATURAL JOIN museu AS m ON (tipo_col LIKE 'b%'); 
WHERE tipo_col ILIKE 'b%' AND m.cod_mus = c.cod_mus;

--Consultas--

--Consulta 1--
SELECT nome_mus AS Nome_do_museu, nome_col AS Nome_coleção, tipo_col AS Tipo_coleção, idioma AS Idioma, preco_ent AS Preço_entrada
FROM museu AS m, colecao AS c 
WHERE tipo_col ILIKE 'História' AND m.cod_mus = c.cod_mus;
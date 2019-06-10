--Criação das stored procedures

--Criação da stored procedure da Consulta 1
CREATE FUNCTION recuperarTipoCol (CHARACTER VARYING(50))
RETURNS TABLE (Nome_do_museu CHARACTER VARYING(50), Nome_coleção CHARACTER VARYING(50), Tipo_coleção CHARACTER VARYING(50), 
	       Idioma CHARACTER VARYING(50), Preço_entrada numeric(5,2)) AS '
	SELECT nome_mus AS Nome_do_museu, nome_col AS Nome_coleção, tipo_col AS Tipo_coleção, idioma AS Idioma, preco_ent AS Preço_entrada
	FROM colecao as c LEFT OUTER JOIN museu as m ON (lower(tipo_col) LIKE $1)
	WHERE m.cod_mus = c.cod_mus;
' LANGUAGE 'sql';

DROP FUNCTION recuperarTipoCol;

--Comando para execução da stored procedure
SELECT * FROM recuperarTipoCol('b%');


--Criação da stored procedure da Consulta 2
CREATE FUNCTION recuperarPrecoAtiv (numeric(5,2))
RETURNS TABLE (Nome_do_museu CHARACTER VARYING(50), Tipo_atividade CHARACTER VARYING(50), Preço_Atividade numeric(5,2), 
	       Nome_atividade CHARACTER VARYING(50), Cidade CHARACTER VARYING(50)) AS '
	SELECT nome_mus AS Nome_do_museu, tipo_ativ AS Tipo_atividade, preco_ativ AS Preço_atividade, nome_ativ AS Nome_atividade, cidade AS Cidade
	FROM museu AS m, atividade AS a
	WHERE m.cod_mus = a.cod_mus AND preco_ativ <= $1
	ORDER BY preco_ativ;
' LANGUAGE 'sql';

DROP FUNCTION recuperarPrecoAtiv;

--Comanda para execução da stored procedure
SELECT * FROM recuperarPrecoAtiv(1);
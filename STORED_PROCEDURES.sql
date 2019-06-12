--Criação das stored procedures

--Criação da stored procedure da Consulta 1
CREATE FUNCTION recuperarTipoCol (CHARACTER VARYING(50))
RETURNS TABLE (Codigo_do_museu INTEGER, Nome_do_museu CHARACTER VARYING(50), Nome_coleção CHARACTER VARYING(50), 
			   Tipo_coleção CHARACTER VARYING(50), Horario_colecao CHARACTER VARYING(50)) AS '
	SELECT m.cod_mus AS Codigo_do_museu, nome_mus AS Nome_do_museu, nome_col AS Nome_coleção, tipo_col AS Tipo_coleção, horario_exib AS Horario_colecao
	FROM colecao as c LEFT OUTER JOIN museu as m ON (tipo_col LIKE $1)
	WHERE m.cod_mus = c.cod_mus;
' LANGUAGE 'sql';

DROP FUNCTION recuperarTipoCol(CHARACTER VARYING(50), INTEGER);

--Comando para execução da stored procedure
SELECT * FROM recuperartipocol('B%');


--Criação da stored procedure da Consulta 2

CREATE FUNCTION recuperarPrecoAtiv (REAl)
RETURNS TABLE (Codigo_do_museu INTEGER, Nome_do_museu CHARACTER VARYING(50), Horario_da_atividade CHARACTER VARYING(50), Nome_atividade CHARACTER VARYING(50), Preço_atividade NUMERIC(5,2)) AS '
	SELECT m.cod_mus AS Codigo_do_museu, nome_mus AS Nome_do_museu, horario_ativ AS Horario_da_atividade, nome_ativ AS Nome_atividade, preco_ativ AS Preço_atividade
	FROM museu AS m, atividade AS a
	WHERE m.cod_mus = a.cod_mus AND preco_ativ <= $1
	ORDER BY preco_ativ;
' LANGUAGE 'sql';

DROP FUNCTION recuperarprecoativ(REAL, INTEGER);

--Comando para execução da stored procedure
SELECT * FROM recuperarprecoativ(12);
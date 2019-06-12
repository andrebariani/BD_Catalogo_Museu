--Criação do usuário cliente
CREATE ROLE Cliente NOINHERIT LOGIN PASSWORD '123';

--Dando a permição para o usuário ler todas as tabelas
GRANT SELECT ON museu TO Cliente;

GRANT SELECT ON atividade TO Cliente;

GRANT SELECT ON colecao TO Cliente;

SET ROLE postgres;

SET ROLE Cliente;

--Mostra o usuário atual
SELECT current_user;
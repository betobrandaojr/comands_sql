-----------------Tabela Verticall

WITH linhas /*Nome da tabela temporaria*/ AS(
----------SELECT onde será consultada as informações.
SELECT
        dtmovimento
        ,valorsaldo
        ,valordebito
        ,valorcredito
        ,saldoanterior
FROM Contacorrente_saldo
WHERE grupo = 1
    AND empresa = 1
    AND banco = 320
    AND agencia = '0015'
    AND conta = '141006426'
    AND dtmovimento = '2011-03-09'
)
-----------------
, DataRegistro /*Nome da tabela temporaria*/ AS (
    SELECT
        'Data'::TEXT AS descricao
        ,CURRENT_DATE::TEXT AS valor
    FROM linhas
)
,ValorSaldo /*Nome da tabela temporaria*/ AS(
    SELECT
        'Saldo':: TEXT AS descricao
        ,valorsaldo::TEXT AS Valor
    FROM linhas
)
,ValorCredito/*Nome da tabela temporaria*/ AS (
    SELECT
        'Saldo de Crédito'::TEXT AS Descricao
        ,valorcredito::TEXT AS Valor
    FROM linhas
)

-- Consultando tabela temporaria

SELECT
    descricao
    ,valor
FROM DataRegistro

-- Separação de uma consulta da outra

UNION ALL
--

SELECT
    descricao
    ,valor
FROM ValorSaldo

-- Separação de uma consulta da outra

UNION ALL

--

SELECT
    descricao
    ,valor
FROM ValorCredito
--
-- Maior gasto nos ultimos trimestres 
SELECT 
    reg_ans, 
    SUM(vl_saldo_final) AS total_despesas
FROM demonstracoes_contabeis 
WHERE TRIM(REPLACE(descricao, '  ', ' ')) = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
GROUP BY reg_ans
ORDER BY total_despesas DESC
LIMIT 10;

-- Maior gasto no ano completo 

SELECT 
    reg_ans, 
    YEAR(data) AS ano,
    SUM(vl_saldo_final) AS total_despesas
FROM demonstracoes_contabeis 
WHERE TRIM(REPLACE(descricao, '  ', ' ')) = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
GROUP BY reg_ans, ano
ORDER BY ano DESC, total_despesas DESC;

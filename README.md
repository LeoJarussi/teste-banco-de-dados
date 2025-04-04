<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Desafio 3 - Banco de Dados</title>
  <style>
    body { font-family: Arial, sans-serif; line-height: 1.6; padding: 20px; background-color: #f5f5f5; }
    h1, h2 { color: #2c3e50; }
    code { background: #ecf0f1; padding: 2px 4px; border-radius: 4px; }
    pre { background: #ecf0f1; padding: 10px; border-radius: 4px; overflow-x: auto; }
  </style>
</head>
<body>
  <h1>Desafio 3 - Banco de Dados (MySQL)</h1>

  <h2>✅ Objetivo</h2>
  <p>Trabalhar com arquivos CSV públicos da ANS, criar uma estrutura de banco de dados relacional, importar os dados e realizar consultas analíticas.</p>

  <h2>📁 Estrutura de Pastas</h2>
  <pre>
  teste-banco-de-dados/
  ├── arquivos/
  │   ├── 2023/
  │   └── 2024/
  ├── criar_tabela.sql
  ├── importar_arquivos.sql
  ├── queries_analiticas.sql
  ├── README.html
  </pre>

  <h2>📌 Tabelas criadas</h2>
  <p>Foi criada a tabela <code>demonstracoes_contabeis</code> com as seguintes colunas:</p>
  <ul>
    <li><code>data</code> (DATE)</li>
    <li><code>reg_ans</code> (VARCHAR)</li>
    <li><code>cd_conta_contabil</code> (VARCHAR)</li>
    <li><code>descricao</code> (VARCHAR)</li>
    <li><code>vl_saldo_inicial</code> (DECIMAL)</li>
    <li><code>vl_saldo_final</code> (DECIMAL)</li>
  </ul>

  <h2>📥 Importação de Dados</h2>
  <p>Os arquivos CSV foram importados utilizando <code>LOAD DATA LOCAL INFILE</code> com encoding correto e delimitadores adequados.</p>

  <h2>📊 Consultas Analíticas</h2>
  <p><strong>Top 10 operadoras com maiores despesas no último ano:</strong></p>
  <pre>
    SELECT 
    reg_ans, 
    YEAR(data) AS ano,
    SUM(vl_saldo_final) AS total_despesas
    FROM demonstracoes_contabeis 
    WHERE TRIM(REPLACE(descricao, '  ', ' ')) = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
    GROUP BY reg_ans, ano
    ORDER BY ano DESC, total_despesas DESC;
  </pre>

  <p><strong>Top 10 operadoras no último trimestre:</strong></p>
  <pre>
    SELECT 
    reg_ans, 
    SUM(vl_saldo_final) AS total_despesas
    FROM demonstracoes_contabeis 
    WHERE TRIM(REPLACE(descricao, '  ', ' ')) = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
    GROUP BY reg_ans
    ORDER BY total_despesas DESC
    LIMIT 10;
  </pre>

  <h2>🛠️ Banco de Dados Utilizado</h2>
  <ul>
    <li><strong>MySQL 8</strong></li>
    <li>Workbench para gerenciamento visual</li>
  </ul>

  <h2>🚀 Como Executar</h2>
  <ol>
    <li>Abra o MySQL Workbench</li>
    <li>Execute <code>criar_tabela.sql</code> para estruturar a tabela</li>
    <li>Execute <code>importar_arquivos.sql</code> para importar os dados dos CSV</li>
    <li>Execute <code>queries_analiticas.sql</code> para obter os resultados solicitados</li>
  </ol>

  <p><em>Desafio concluído com sucesso! 🚀</em></p>
</body>
</html>

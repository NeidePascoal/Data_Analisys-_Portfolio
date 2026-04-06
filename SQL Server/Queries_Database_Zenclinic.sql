/******************************************************************************************************************************/
/******************************************************************************************************************************/
/**********************************             Criar tableas base de dados            ****************************************/
/******************************************************************************************************************************/
/******************************************************************************************************************************/
/******************************************************************************************************************************/

CREATE TABLE `consulta` (
  `id_consulta` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `data_consulta` datetime NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `especialidade` (
  `id_especialidade` int(8) NOT NULL,
  `nome_especialidade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `descricao` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `medico` (
  `id_medico` int(8) NOT NULL,
  `nome_medico` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `data_contratacao` date NOT NULL DEFAULT current_timestamp(),
  `id_especialidade` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nome_paciente` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `nif` int(9) NOT NULL,
  `telefone` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `medico` (`id_medico`),
  ADD KEY `paciente` (`id_paciente`),
  ADD KEY `estado` (`id_estado`);

ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id_especialidade`);

ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`);

ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`);

ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `especialidade`
  MODIFY `id_especialidade` int(8) NOT NULL AUTO_INCREMENT;

ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `medico`
  MODIFY `id_medico` int(8) NOT NULL AUTO_INCREMENT;

ALTER TABLE `consulta`
  ADD CONSTRAINT `estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);
COMMIT;

/******************************************************************************************************************************/
/******************************************************************************************************************************/
/****************************************             Preencher base de dados            **************************************/
/******************************************************************************************************************************/
/******************************************************************************************************************************/
/******************************************************************************************************************************/

INSERT INTO `estado` (`descricao`) VALUES ('Cancelada');
INSERT INTO `estado` (`descricao`) VALUES ('Agendada');
INSERT INTO `estado` (`descricao`) VALUES ('Realizada');


-- popular tabela de paciente, fiz um Union entre 5 nomes possíveis, e ordenei o resultado desse union de forma aleatória (order by rand limit 1) solução vista em aula anterior
-- a novidade aqui é o uso do FROM dual, que no fundo é fazer uma consulta não a uma tabela real mas a uma tabela conceptual, só funciona quando queremos testar funções mysql ou strings, 
-- como é o caso
INSERT INTO `paciente` (nome_paciente,data_nascimento,nif,telefone) VALUES
(
	(
        SELECT nome 
          FROM (
              SELECT "Andreia" as "nome" FROM dual 
              UNION 
              SELECT "Ricardo" FROM dual  
              UNION 
              SELECT  "José" FROM dual  
              UNION 
              SELECT  "Francisco" FROM dual  
              UNION 
              SELECT  "Emanuel" FROM dual  ) a ORDER BY rand() LIMIT 1
    ),
    "1988-08-03",
    "123456789",
    "910000000"
);
--- ter datas diversas...
--- concat junta str_to_date, convert texto numa data, 
--- no caso o formato em string é Ano,mes e dia (%Y-%m-%d)
--- o floor arredonda os numeros para baixo  
--- o lpad acrescenta (quando necessário) um caracter à esquerda... ou seja, se tivermos lpad(a, b, c) em que a=4,b=2,c=0 entao o valor retornado é 04 
--- 			porque "a" é o texto a editar,"b" o numero de caracteres da string e "c" o caracter que vai ser inserido à esquerda 
--- 

UPDATE paciente
SET data_nascimento = STR_TO_DATE(
    CONCAT(
        FLOOR(RAND() * (1999 - 1949 + 1)) + 1949, '-',        -- ano
        LPAD(FLOOR(1 + RAND() * 12), 2, '0'), '-',            -- mês
        LPAD(FLOOR(1 + RAND() * 28), 2, '0')                  -- dia (até 28 para evitar dias inválidos)
    ), 
    '%Y-%m-%d'
);


INSERT INTO `medico` (nome_medico,email,password,data_contratacao,id_especialidade) VALUES
(
	(
        SELECT nome 
          FROM (
              SELECT "Beatriz" as "nome" FROM dual 
              UNION 
              SELECT "Carlos" FROM dual  
              UNION 
              SELECT  "Doutor1" FROM dual  
              UNION 
              SELECT  "Doutor2" FROM dual  
              UNION 
              SELECT  "Doutor3" FROM dual  ) a ORDER BY rand() LIMIT 1
    ),
    "teste@gmail.com",
    md5("1234"),
    "2025-06-01",
    (SELECT id_especialidade FROM especialidade ORDER BY RAND() LIMIT 1)
);

INSERT INTO consulta (id_medico, id_paciente, data_consulta, id_estado)
SELECT 
    (SELECT id_medico FROM medico ORDER BY RAND() LIMIT 1),
    (SELECT id_paciente FROM paciente ORDER BY RAND() LIMIT 1),
    NOW(),
    (SELECT id_estado FROM estado ORDER BY RAND() LIMIT 1);


/******************************************************************************************************************************/
/******************************************************************************************************************************/
/********************************************             Questões 1 a 12            ******************************************/
/******************************************************************************************************************************/
/******************************************************************************************************************************/
/******************************************************************************************************************************/

---1 Mostrar todas as consultas agendadas para um determinado dia
SELECT c.id_consulta,e.descricao as "estado_consulta", c.id_medico,m.nome_medico, c.id_paciente, p.nome_paciente,c.id_estado,c.data_consulta
FROM `consulta` c
Left join medico m on m.id_medico=c.id_medico
left join paciente p On c.id_paciente=p.id_paciente
left join estado e On e.id_estado=c.id_estado

---2 Listar os nomes dos pacientes que já tiveram consultas com mais do que um médico.
--- A propriedade distinct evita termos registos duplicados /// outra solucao é fazer group by pelo id_paciente
SELECT DISTINCT c1.id_paciente,p.nome_paciente 
FROM `consulta` c1
INNER JOIN `consulta` c2 ON c1.id_paciente = c2.id_paciente
INNER JOIN paciente p ON p.id_paciente=c1.id_paciente
WHERE c2.id_medico<>c1.id_medico
ORDER BY c1.id_paciente ASC

SELECT c1.id_paciente,p.nome_paciente 
FROM `consulta` c1
INNER JOIN `consulta` c2 ON c1.id_paciente = c2.id_paciente
INNER JOIN paciente p ON p.id_paciente=c1.id_paciente
WHERE c2.id_medico<>c1.id_medico
GROUP BY c1.id_paciente
ORDER BY c1.id_paciente ASC;


---3 Indicar quantas consultas foram realizadas por cada médico.
SELECT c.id_medico,m.nome_medico, count(1) consultas
FROM `consulta` c
INNER JOIN medico m On m.id_medico=c.id_medico
GROUP BY c.id_medico


---4 Listar os médicos e as suas especialidades
SELECT m.id_medico,m.nome_medico,e.nome_especialidade
FROM medico m
INNER JOIN especialidade e ON m.id_especialidade=e.id_especialidade

---5 Apresentar os pacientes que nunca tiveram consultas
SELECT p.id_paciente,p.nome_paciente
FROM paciente p
where p.id_paciente not in (SELECT c.id_paciente FROM consulta c)


---6 Criar uma view chamada agenda_diaria com o nome do médico, paciente, data e hora da consulta
CREATE VIEW agenda_diaria AS
SELECT 
    m.nome_medico AS medico,
    p.nome_paciente AS paciente,
    DATE(c.data_consulta) AS data,
    TIME(c.data_consulta) AS hora
FROM 
    consulta c
JOIN medico m ON c.id_medico = m.id_medico
JOIN paciente p ON c.id_paciente = p.id_paciente;


---7 Contar o número de consultas canceladas por mês

SELECT 
    MONTH(c.data_consulta) AS mes,
    YEAR(c.data_consulta) AS ano,
    COUNT(*) AS total_canceladas
FROM 
    consulta c
JOIN estado e ON c.id_estado = e.id_estado
WHERE 
    e.descricao = 'cancelada'
GROUP BY 
    ano, mes
ORDER BY 
    ano, mes
	
	
---8 Mostrar os pacientes ordenados pela sua idade (mais velho para mais novo)
SELECT 
    nome_paciente,
    data_nascimento,
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM 
    paciente
ORDER BY 
    idade DESC;


--- 9 Atualizar o estado de uma consulta (de 'agendada' para 'realizada')
UPDATE consulta
SET id_estado = (
    SELECT id_estado FROM estado WHERE descricao = 'realizada'
)
WHERE id_consulta = 5
  AND id_estado = (
    SELECT id_estado FROM estado WHERE descricao = 'agendada'
);

---10 Eliminar todas as consultas já realizadas há mais de 6 meses
DELETE FROM consulta
WHERE 
    id_estado = (
        SELECT id_estado FROM estado WHERE descricao = 'realizada'
    )
    AND data_consulta < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
	
	
---11 Faça as alterações necessárias à estrutura dada para que crie uma view com os pacientes que devem repetir consulta ao final de X meses. O valor de X é definido pela especialidade.

ALTER TABLE especialidade
ADD COLUMN consulta_acompanhamento INT NOT NULL DEFAULT 6;

CREATE VIEW pacientes_consulta_acompanhamento AS
SELECT 
    p.nome_paciente,
    esp.nome_especialidade,
    MAX(c.data_consulta) AS ultima_consulta,
    DATE_ADD(MAX(c.data_consulta), INTERVAL esp.consulta_acompanhamento MONTH) AS proxima_consulta
FROM 
    consulta c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN medico m ON c.id_medico = m.id_medico
JOIN especialidade esp ON m.id_especialidade = esp.id_especialidade
JOIN estado e ON c.id_estado = e.id_estado
WHERE 
    e.descricao = 'realizada'
GROUP BY 
    p.id_paciente, esp.id_especialidade;

--- 12 Indique as alterações que considera pertinentes para que seja possível um médico possa ter mais que uma especialidade. 

CREATE TABLE medico_especialidade (
  id_medico INT NOT NULL,
  id_especialidade INT NOT NULL,
  PRIMARY KEY (id_medico, id_especialidade),
  FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
  FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);

INSERT INTO medico_especialidade (id_medico, id_especialidade)
SELECT id_medico, id_especialidade
FROM medico;

ALTER TABLE medico
DROP COLUMN id_especialidade;
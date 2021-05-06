-- 1-Mostre todos os cursos cadastrados
select * from curso;

-- 2-Mostre o nome de todos os coordenadores dos cursos cadastrados
select nome, id from professor 
INNER JOIN coordenacao 
ON professor.id = coordenacao.id_professor;

-- 3-Mostre todas as turmas do curso 5 ("Desenvolvimento de Sistemas")
select * from turma WHERE curso_id = 5;

-- 4-Mostre todos os professores da turma 17 ("2DES") em ordem alfabética
select professor_turma.id_turma, professor.nome  from professor_turma
INNER JOIN professor 
ON professor.id = professor_turma.id_professor
WHERE id_turma = 17
ORDER BY professor.nome ASC;

-- 5-Mostre todos os projetos inscritos
select * from projeto; 

-- 6-Mostre todos os projetos inscritos que tenham o status como "projeto aprovado"
select * from projeto WHERE status = "projeto aprovado";

 
-- 7-Mostre o nome de todos os integrantes do projeto entitulado "Os 4 Elementos"
-- Skipado

-- 8-Mostre todos os projetos que tenham como orientador (professor_id) o professor "Claudio"
SELECT * FROM projeto
INNER JOIN professor
ON professor.id = projeto.professor_id
WHERE professor.nome = "Claudio";

-- 9-Mostre o número total de projetos inscritos
SELECT COUNT(id) as Total FROM projeto;

-- 10-Mostre o número total de projetos com status "inscrito - orientado"
select count(id) as total from projeto WHERE status = "inscrito - orientado";

-- 11-Mostre o número total de projetos que apresentam algum tipo de risco
SELECT COUNT(projeto_id) as Total FROM projeto_risco;

-- 12-Mostre os projetos que já tenham sido avaliados
select * from projeto WHERE status = "projeto aprovado";

-- 13-Mostre todos os projetos avaliados pelo professor "Claudio"
SELECT projeto.id, projeto.titulo, projeto.descricao, projeto.professor_id, projeto.status, projeto.obs FROM avaliacao
INNER JOIN projeto
ON projeto.id = avaliacao.projeto_id
INNER JOIN professor
ON professor.id = avaliacao.professor_id
WHERE professor.nome = "Claudio";

-- 14-Mostre todos os projetos localizados entre os stands 20 e 35
SELECT * FROM stand_projeto
WHERE
stand >= 20 AND
stand <= 35
ORDER BY (stand);

-- 15-Mostre todos os stands que tenham projetos 
select * from stand
INNER JOIN stand_projeto
ON stand.id = stand_projeto.stand;

-- 16-Mostre todos os stands que não tenham projetos 
select * from stand
LEFT JOIN stand_projeto
ON stand.id = stand_projeto.stand
WHERE stand_projeto.projeto IS NULL;


-- 17-Mostre todos os projetos que estejam ocupados no periodo 1
SELECT * FROM stand_projeto WHERE periodo = 1;

-- 18-Mostre todos os stands que estejam ocupados nos 2 periodos (0 e 1)
SELECT * FROM stand_projeto WHERE periodo = 0 AND periodo = 1;





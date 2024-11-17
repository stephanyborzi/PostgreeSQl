CREATE TABLE curso(
	id INTEGER,
	nome VARCHAR(255)
);

INSERT INTO curso (id, nome) VALUES (NULL, NULL);

SELECT * FROM curso;

DROP TABLE curso;

CREATE TABLE curso(
	id INTEGER NOT NULL,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (NULL, NULL);
INSERT INTO curso (id, nome) VALUES (1, NULL);
INSERT INTO curso (id, nome) VALUES (NULL, 'HTML');

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (1, 'Javascript');

SELECT * FROM curso;

DROP TABLE curso;

CREATE TABLE curso(
	id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

DROP TABLE curso;

CREATE TABLE curso(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

SELECT * FROM curso;

SELECT * FROM curso;

CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT  INTO aluno (nome) VALUES ('Diogo');
INSERT  INTO aluno (nome) VALUES ('Vinícius');

SELECT * FROM aluno;

SELECT * FROM curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id)
);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);

SELECT * FROM aluno WHERE id = 1;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno WHERE id = 2;
SELECT * FROM curso WHERE id = 1;

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (3,1);


SELECT * FROM aluno WHERE id = 3;
SELECT * FROM curso WHERE id = 1;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),
	
	FOREIGN KEY (aluno_id)
   REFERENCES aluno (id),
	
	FOREIGN KEY (curso_id)
   REFERENCES curso (id)
);


 /*  
   FOREIGN KEY (CAMPO_NA_TABELA_ORIGEM)
   REFERENCES TABELA_DESTINO (CAMPO_TABELA_DESTINO)
   		ON UPDATE OPÇÃO
		ON DELETE OPÇÃO
 */
 --  OPÇÃO (RESTRICT, CASCADE)

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (3,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,3);

SELECT * FROM aluno;

SELECT * FROM curso;


SELECT * 
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id;
  
SELECT * 
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;
  
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,2);

SELECT aluno.nome,
	   curso.nome
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;
  
SELECT aluno.nome as aluno,
	   curso.nome as curso
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;
  
SELECT aluno.nome as aluno_nome,
	   curso.nome as curso_nome
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

INSERT INTO aluno (nome) VALUES ('Nico');

SELECT * FROM aluno;

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;
  
INSERT INTO curso (id,nome) VALUES (3,'CSS');

SELECT * FROM curso;

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
     FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
     FROM aluno
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
     FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
     FROM aluno
CROSS JOIN curso;

INSERT INTO aluno (nome) VALUES ('João');

DROP TABLE aluno_curso;
/*Método DELETE CASCADE*/
CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),

	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id)
	ON DELETE CASCADE,
	FOREIGN KEY (curso_id)
	REFERENCES curso (ID)
);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (3,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,3);

SELECT * FROM aluno_curso;
SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
     FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

DELETE FROM ALUNO WHERE ID = 1;

/*Método UPDATE*/
UPDATE aluno SET id = 10 WHERE ID = 2;

DROP TABLE aluno_curso;
CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),

	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (curso_id)
	REFERENCES curso (ID)
);

INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (3,1);

SELECT * FROM aluno_curso;
SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
     FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

UPDATE aluno 
	SET ID = 10
	WHERE ID = 2;

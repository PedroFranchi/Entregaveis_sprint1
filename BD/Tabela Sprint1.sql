
create database sprint1;
use sprint1;
-- -----------------------------------------------------
-- Tabela Tanque
-- -----------------------------------------------------
CREATE TABLE tanque (
  id_tanque INT auto_increment NOT NULL,
  descricao VARCHAR(45) NULL,
  PRIMARY KEY (id_tanque)
  )auto_increment = 1;
  
-- -----------------------------------------------------
-- Tabela sensor
-- -----------------------------------------------------

CREATE TABLE sensor(
  id_sensor INT auto_increment NOT NULL,
  serial_sensor VARCHAR(45) NULL,
  tipo VARCHAR(45) NULL,
  fktanque INT NOT NULL,
  PRIMARY KEY (id_sensor),
  CONSTRAINT fk_sensor_sala1 FOREIGN KEY (fktanque) REFERENCES tanque (id_tanque)
  )AUTO_INCREMENT=1;

-- -----------------------------------------------------
-- Tabela leituras
-- -----------------------------------------------------
CREATE TABLE leituras (
  fksensor INT NOT NULL,
  sequencia INT NOT NULL,
  data_medicao datetime NULL,
  medicao DECIMAL(5,2) NULL,
  PRIMARY KEY (fksensor, sequencia),
  CONSTRAINT fk_leituras_sensor FOREIGN KEY (fksensor) REFERENCES sensor(id_sensor));
  
  
insert into Tanque(descricao)
values ('18.000L'),
       ('22.000L'),
       ('20.000L'),
       ('25.000L');

select * from tanque;

insert into sensor(serial_sensor, tipo, fktanque)
values ('x01', 'T', '1'),
       ('x02', 'U', '2'),
       ('X03', 'T', '2'),
       ('x04', 'T', '4'),
       ('x05', 'U', '3');

select * from sensor;

insert into leituras(fksensor, sequencia, data_medicao, medicao)
values (1, 1, '2024-01-19 12:30:00', 60.1),
       (2, 1, '2024-01-19 12:31:00', 50.1), 
       (1, 2, '2024-01-19 12:32:00', 40), 
       (1, 3, '2024-01-19 12:30:00', 50.1), 
       (1, 4, '2024-01-19 12:31:00', 40.90),
       (1, 5, '2024-01-19 12:35:00', 50.1),
       (3, 1, '2024-01-19 12:30:00', 50.1),
       (4, 1, '2024-01-19 12:30:00', 50.1), 
       (2, 2, '2024-01-19 12:30:00', 50.1),
       (3, 2, '2024-01-19 12:32:00', 50.1), 
       (1, 6, '2024-01-19 12:33:00', 50.1);
       
select * from leituras;

SELECT * FROM tanque AS ta
INNER JOIN sensor as se on se.fktanque = ta.id_tanque
INNER JOIN leituras AS le ON le.fksensor = se.id_sensor;

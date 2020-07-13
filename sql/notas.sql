CREATE TABLE NOTAS
(
ci varchar(15) NOT NULL ,
sigla_materia varchar(10),
nota1 float,
nota2 float,
nota3 float,
PRIMARY KEY(ci,sigla_materia),
INDEX (ci),
FOREIGN KEY (ci) REFERENCES IDENTIFICADOR(ci)
)

-- Insertando elementos
insert into NOTAS values('12394085','inf-111',70,80,90);
insert into NOTAS values('98765432','inf-111',90,90,90);
insert into NOTAS values('55533322','inf-111',50,49.5,10)
insert into NOTAS values('12394085','inf-112',70,80,90);
insert into NOTAS values('98765432','inf-112',80,60,30);
insert into NOTAS values('55533322','inf-112',100,100,100)

-- cantidad de aprobados por departamento
select sum(case when id.codResd='01' and n.notaF>50 then 1 else 0 end) as 'La Paz',
            sum(case when id.codResd='02' and n.notaF>50 then 1 else 0 end)  as Cochabamba,
            sum(case when id.codResd='03' and n.notaF>50 then 1 else 0 end)  as Oruro,
            sum(case when id.codResd='04' and n.notaF>50 then 1 else 0 end)  as Chuquisaca,
            sum(case when id.codResd='05' and n.notaF>50 then 1 else 0 end)  as Potosi,
            sum(case when id.codResd='06' and n.notaF>50 then 1 else 0 end)  as 'Santa Cruz',
            sum(case when id.codResd='07' and n.notaF>50 then 1 else 0 end)  as Beni,
            sum(case when id.codResd='08' and n.notaF>50 then 1 else 0 end)  as Pando,
            sum(case when id.codResd='09' and n.notaF>50 then 1 else 0 end)  as Tarija
from IDENTIFICADOR id,(select ((n.nota1+n.nota2+n.nota3)/3) as notaF, n.ci
from notas n) as n
where n.ci like id.ci

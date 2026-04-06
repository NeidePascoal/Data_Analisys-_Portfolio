create table cliente (

cod\_cliente int primary key identity(1,1),

nome varchar (50)  not null,

data\_nascimento date not null constraint ck\_cliente\_id check (year (data\_nascimento) < 2027),

nif varchar (50) not null,

constraint ck\_cliente\_nif check (nif >100000000 and nif <=999999999))



create table pedido (

cod\_pedido int primary key identity(1,1),

cod\_cliente int not null,

data\_pedido datetime not null, 

n\_fatura int not null, 

valor\_total decimal (6,2) not null, 

constraint fk\_pedido\_idcliente foreign key (cod\_cliente) references cliente(cod\_cliente))





create table item\_produto (

cod\_pedido int  primary key identity (1,1),

numero\_item int not null unique,

valor\_unitario  decimal (6,2) not null,

quantidade int not null,

cod\_produto int not null,

constraint fk\_item\_prod\_codprod foreign key (cod\_produto) references produto (cod\_produto))



create table produto(

cod\_produto int primary key identity(1,1),

descricao varchar (50) not null,

quantidade varchar (50) not null)



create table log\_ (

cod\_log int primary key identity(1,1),

data\_log datetime default getdate());





create table requisição\_compra (

cod\_requisicao\_compra  int primary key identity (1,1),

cod\_produto int not null,

data\_compra\_requisão datetime default getdate(), 

quantidade int not null

constraint fk\_req\_compra\_cod\_prod foreign key (cod\_produto) references produto (cod\_produto))





\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_



-- Inserir clientes (15 registros)

INSERT INTO cliente (nome, data\_nascimento, nif)

VALUES

('João Silva', '1985-04-15', '123456789'),

('Maria Oliveira', '1990-07-22', '987654321'),

('Carlos Santos', '1978-01-30', '234567891'),

('Ana Costa', '2000-11-12', '345678912'),

('Pedro Lima', '1995-06-05', '456789123'),

('Luciana Gomes', '1988-03-18', '567891234'),

('Rafael Sousa', '2002-08-25', '678912345'),

('Fernanda Ribeiro', '1993-12-10', '789123456'),

('Bruno Almeida', '1980-05-01', '891234567'),

('Paula Marques', '1999-09-08', '912345678'),

('André Dias', '1986-02-14', '112233445'),

('Cristina Melo', '1992-07-19', '223344556'),

('Diego Fernandes', '1975-10-28', '334455667'),

('Sofia Cardoso', '1989-04-07', '445566778'),

('Tiago Barros', '1997-12-23', '556677889');



-- Inserir produtos (10 registros)

INSERT INTO produto (descricao, quantidade)

VALUES

('Teclado Mecânico', '50'),

('Mouse Óptico', '100'),

('Monitor LED 24"', '30'),

('Impressora Laser', '15'),

('Fone de Ouvido Bluetooth', '200'),

('Cadeira Gamer', '10'),

('Webcam HD', '25'),

('SSD 1TB', '40'),

('Processador Intel i7', '20'),

('Placa de Vídeo RTX 3060', '12');



-- Inserir pedidos (12 registros) -- clientes e datas variadas

INSERT INTO pedido (cod\_cliente, data\_pedido, n\_fatura, valor\_total)

VALUES

(1, '2025-09-01 10:00:00', 1001, 450.00),

(3, '2025-09-02 14:15:00', 1002, 1250.00),

(5, '2025-09-05 09:30:00', 1003, 200.00),

(2, '2025-09-07 11:00:00', 1004, 340.00),

(6, '2025-09-10 16:45:00', 1005, 780.00),

(1, '2025-09-12 13:20:00', 1006, 1390.00),

(4, '2025-09-15 15:10:00', 1007, 560.00),

(7, '2025-09-17 17:50:00', 1008, 410.00),

(8, '2025-09-19 12:25:00', 1009, 670.00),

(9, '2025-09-21 14:30:00', 1010, 920.00),

(10, '2025-09-22 10:10:00', 1011, 1150.00),

(11, '2025-09-23 09:00:00', 1012, 300.00);



-- Inserir item\_produto (12 registros correspondentes aos pedidos)

INSERT INTO item\_produto (numero\_item, valor\_unitario, quantidade, cod\_produto)

VALUES

(1, 120.00, 2, 1),

(2, 400.00, 1, 3),

(3, 100.00, 2, 2),

(4, 170.00, 2, 5),

(5, 780.00, 1, 6),

(6, 120.00, 3, 1),

(7, 280.00, 2, 4),

(8, 410.00, 1, 7),

(9, 335.00, 2, 8),

(10, 460.00, 2, 9),

(11, 1150.00, 1, 10),

(12, 300.00, 1, 5);



-- Inserir requisição\_compra (10 registros)

INSERT INTO requisição\_compra (cod\_produto, quantidade)

VALUES

(1, 20),

(2, 50),

(3, 15),

(4, 5),

(5, 30),

(6, 8),

(7, 10),

(8, 12),

(9, 7),

(10, 6);



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





**--a. Crie um TRIGGER para baixar o stock de um PRODUTO quando ele for vendido;** 

select \*from produto

select \*from item\_produto

select \*from requisição\_compra



create trigger t\_atualiza\_stock

on  item\_produto

after insert 



AS

BEGIN

&nbsp;	declare @quantidade\_t int,

&nbsp;			@cod\_produto\_t int 



&nbsp;	select @quantidade\_t = quantidade,

&nbsp;		   @cod\_produto\_t = cod\_produto

&nbsp;	from   inserted



&nbsp;	update produto

&nbsp;	set quantidade = quantidade -@quantidade\_t

&nbsp;	where cod\_produto = cod\_produto



end



insert into item\_produto (numero\_item, valor\_unitario,quantidade,cod\_produto)

values( 13,460, 2,9)



insert into item\_produto (numero\_item, valor\_unitario,quantidade,cod\_produto)

values( 14,120, 3,1)



**--b. Crie um TRIGGER para criar um log dos CLIENTES modificados;** 

create trigger t\_update\_log\_cliente

on cliente 

after update



AS

BEGIN

&nbsp;insert into log\_ (data\_log) values (getdate())

&nbsp; END



&nbsp; select \* from cliente



&nbsp;update cliente

&nbsp;set nome = 'João Pedro Barbosa'

&nbsp;where cod\_cliente = 2



&nbsp;select \*from log\_





**--c. Crie um TRIGGER para criar um log dos PRODUTOS atualizados;** 

create trigger t\_update\_log\_produto

on produto 

after update 



AS

BEGIN



insert into log\_ (data\_log) values(GETDATE())



END



update produto

set descricao = 'consola 4D'

Where cod\_produto = 3



select \* from log\_



**--d. Crie um TRIGGER para criar um log quando não existir a quantidade do ITEMPEDIDO em stock;** 



alter table log\_

add descricao varchar(50)null



CREATE TRIGGER t\_log\_stock\_off

ON item\_produto

AFTER INSERT

AS

BEGIN

&nbsp;   INSERT INTO log\_(data\_log)

&nbsp;   SELECT GETDATE()

&nbsp;   FROM inserted i

&nbsp;   JOIN produto p ON i.cod\_produto = p.cod\_produto

&nbsp;   WHERE i.quantidade > p.quantidade;

END;



select \*from log\_





**-- e. Crie um TRIGGER para criar uma requisição de REQUISICAO\_COMPRA quando o stock atingir 50% da venda mensal;** 



create trigger t\_req\_compra

on produto

after update



AS

BEGIN

&nbsp;	INSERT INTO requisição\_compra (cod\_produto,data\_compra\_requisão, quantidade)

&nbsp;	select cod\_produto, getdate(),50

&nbsp;	from inserted

&nbsp;	where quantidade <=50



End;





**-- f. Crie um TRIGGER para criar um log quando um ITEMPEDIDO for removido;** 

create trigger t\_delete\_item\_pedido

on item\_produto

after delete



AS 

BEGIN	

&nbsp;	insert into log\_(data\_log, descricao)  values (getdate(), 'Item Removido')



END

&nbsp;	

	

**-- g. Crie um TRIGGER para criar um LOG quando o valor total do pedido for maior que 100euros.** 





create trigger log\_pedido\_100

on pedido

after insert, update



AS

BEGIN

&nbsp;   insert into log\_(data\_log)

&nbsp;   select getdate()

&nbsp;   from inserted

&nbsp;   where valor\_total > 100;

END;





**--h. Crie um TRIGGER para NÃO deixar valores negativos serem INSERIDOS em ITEMPEDIDO, o valor mínimo é "0";** 

CREATE TRIGGER t\_no\_negative\_numero\_item

ON item\_produto

AFTER INSERT

AS

BEGIN

&nbsp;   IF EXISTS (

&nbsp;       SELECT 1

&nbsp;       FROM inserted

&nbsp;       WHERE numero\_item < 0

&nbsp;   )

&nbsp;   BEGIN

&nbsp;       RAISERROR('Erro: valor negativo não permitido em numero\_item.', 16, 1);

&nbsp;       ROLLBACK TRANSACTION;

&nbsp;   END

END;





**--i.Crie um TRIGGER que NÃO permita que uma PESSOA com data de nascimento anterior a data de hoje seja inserida ou atualizada.** 



CREATE TRIGGER t\_no\_past\_birthdate

ON cliente

AFTER INSERT, UPDATE

AS

BEGIN

&nbsp;   IF EXISTS (

&nbsp;       SELECT 1

&nbsp;       FROM inserted

&nbsp;       WHERE data\_nascimento < CAST(GETDATE() AS DATE) )

&nbsp;   BEGIN

&nbsp;       RAISERROR('Erro: data de nascimento anterior a hoje não permitida.', 16, 1);

&nbsp;       ROLLBACK TRANSACTION;

&nbsp;   END

END;



**--j. Crie um TRIGGER para automaticamente numerar o ITEMPEDIDO.numeroitem de acordo com valores anteriores do mesmo PEDIDO.** 





CREATE TRIGGER t\_inumerar\_item

ON item\_produto

INSTEAD OF INSERT

AS

BEGIN

&nbsp;   INSERT INTO item\_produto (cod\_pedido, numero\_item, valor\_unitario, quantidade, cod\_produto)

&nbsp;   SELECT 

&nbsp;       i.cod\_pedido,

&nbsp;       ISNULL((SELECT MAX(numero\_item) FROM item\_produto WHERE cod\_pedido = i.cod\_pedido), 0) + 1,

&nbsp;       i.valor\_unitario,

&nbsp;       i.quantidade,

&nbsp;       i.cod\_produto

&nbsp;   FROM inserted i;

END;

**--k. Crie um TRIGGER para não permitir quantidade negativa no ITEMPEDIDO.** 

CREATE TRIGGER t\_itempedido\_neg

ON item\_produto

AFTER INSERT, UPDATE

AS

BEGIN

&nbsp;   IF EXISTS (

&nbsp;       SELECT 1

&nbsp;       FROM inserted

&nbsp;       WHERE quantidade < 0

&nbsp;   )

&nbsp;   BEGIN

&nbsp;       RAISERROR('Erro: quantidade negativa não permitida no item do pedido.', 16, 1);

&nbsp;       ROLLBACK TRANSACTION;

&nbsp;   END

END;



**--i Crie um TRIGGER para acrescentar a palavra "Sr(a)" ao nome das PESSOAS que tem nasceram à mais de 30 anos.** 

create trigger trg\_acrescenta\_sr\_simples

on cliente

after insert, UPDATE

AS

BEGIN

&nbsp;   UPDATE c

&nbsp;   set nome = 'Sr(a) ' + c.nome

&nbsp;   from cliente c

&nbsp;   JOIN inserted i on c.cod\_cliente = i.cod\_cliente

&nbsp;   wherE DATEDIFF(YEAR, i.data\_nascimento, GETDATE()) > 30;

END;



**--m. Crie um TRIGGER para retornar a quantidade em stock de um ITEMPEDIDO que foi removido.** 

create trigger t\_log\_remocao\_itempedido

on item\_produto

after delete

AS

BEGIN

&nbsp;   select p.quantidade as quantidade\_em\_stock, d.cod\_produto

&nbsp;   from deleted d

&nbsp;   JOIN produto p on d.cod\_produto = p.cod\_produto;

END;



**--n. Crie um TRIGGER para remover as REQUISICOESCOMPRA de um produto que é removido.** 



create trigger t\_remove\_requisicoes

on produto

after delete

AS

BEGIN

&nbsp;   delete from requisicao\_compra

&nbsp;   where cod\_produto IN (select cod\_produto from deleted);

END;





**--o. Crie um TRIGGER que ajuste os pedidos de compra para que não existam itens repetidos, ou seja, quando o mesmo ITEMPEDIDO for inserido deve-se disparar uma mensagem.** 



CREATE TRIGGER t\_item\_duplicado

ON item\_produto

INSTEAD OF INSERT

AS

BEGIN

&nbsp;   IF EXISTS (SELECT 1 FROM inserted i JOIN item\_produto p ON i.cod\_pedido = p.cod\_pedido  AND i.numero\_item = p.numero\_item )

&nbsp; 

&nbsp;   BEGIN

&nbsp;       RAISERROR('erro: item repetido no pedido de compra.', 16, 1);

&nbsp;       RETURN;

&nbsp;   END



&nbsp;   INSERT INTO item\_produto (cod\_pedido, numero\_item, valor\_unitario, quantidade, cod\_produto)

&nbsp;   SELECT cod\_pedido, numero\_item, valor\_unitario, quantidade, cod\_produto

&nbsp;   FROM inserted;

END;

**--p. Crie um TRIGGER que, quando o utilizador quiser inserir o nome Manuel, o insert é feito com o nome Joaquim.**  

create trigger t\_substitui\_nome

on cliente

instead of insert

AS

BEGIN

&nbsp;   insert into cliente (cod\_cliente, nome, data\_nascimento, nif)

&nbsp;   select 

&nbsp;       cod\_cliente,

&nbsp;       case when nome = 'Manuel' then 'Joaquim' else nome end,

&nbsp;       data\_nascimento,

&nbsp;       nif

&nbsp;   from inserted;

END;




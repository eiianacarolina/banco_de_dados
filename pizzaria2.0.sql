drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

select * from itens_pedido;

-- asc ou desc (crescente e decrescente)
select * from clientes order by nome, bairro desc;

-- Alterar a sequencia das colunas
select id, nome, telefone, logradouro from clientes;

-- alterar o nome da coluna com a cláusula as
select id as codigo, nome, valor as 'Valor R$' from pizzas;

-- operações aritméticas
select 10 + 3, 10 - 3, 10/3, 10*3;
select 10 + 3 as Soma, 10 - 3 as Subtracao, 10/3 as 'Divisão', 10 * 3 as Multiplicacao;

select id, nome, valor, valor as '+10%' from pizzas;
select *, ((valor*10)/100) + valor as '10%' from pizzas;
select *, (valor* 0.10) + valor as '10%' from pizzas;
select *, valor * 1.1 as '10%' from pizzas;
select * from pizzas;
alter table pizzas add column custo decimal(15,2);
update pizzas set custo = valor * 0.60;


-- Selecionar todas as pizzas com valor superiror a R$ 17.00
select * from pizzas where valor > 17;

-- Selecionar todas as pizzas com valor igual ou superior a R$ 17.00
select * from pizzas where valor >= 17;

-- Selecionar todas as pizzas com valor inferior a R$ 17.00
select * from pizzas where valor < 17;

-- Selecionar todas as pizzas com valor igual a R$ 17.00
select * from pizzas where valor = 17;

-- Selecionar todas as pizzas com valor diferente de R$ 17.00
select * from pizzas where valor != 17;
select * from pizzas where valor <> 17;

-- Selecionar todas as pizzas com a coluna valor nula
select * from pizzas where valor <=> null;
select * from pizzas where valor is null;

-- Selecionar todas as pizzas com o valor maior que 15 e menor que 20
select * from pizzas where valor > 15 and valor <20;
select * from pizzas where valor between 16 and 19;

-- Selecionar todas as pizzas com o valores menores ou maiores que R$ 17.00
select * from pizzas where valor < 17 or valor > 17;

-- Selecionar todas as pizzas com o valores não menores ou maiores que R$ 17.00
select * from pizzas where not (valor < 17 or valor > 17);

-- Selecionar todas as pizzas com valores na faixa de R$ 17.00 a R$20.00
select * from pizzas where valor >= 17 or valor <= 20;
select * from pizzas where valor between 17 and 20;

-- Selecionar todas as pizzas com valores fora da faixa de R$ 17.00 a R$20.00
select * from pizzas where valor < 17 or valor > 20;
select * from pizzas where valor not between 17 and 20;
select * from pizzas where not (valor >=17 and valor <=20);

-- Selecionar todas as pizzas com valores iguais a R$ 15.00 e R$ 20.00
select * from pizzas where valor = 15 or valor = 20 ;
select * from pizzas where valor in (15,20,99);

-- Selecionar todas as pizzas com valores diferentes de R$ 15.00 e R$ 20.00
select * from pizzas where valor != 15 and valor != 20 ;
select * from pizzas where not (valor = 15 or valor = 20) ;
select * from pizzas where valor not in (15,20);

-- Selecionar todas as pizzas com valores não nulos
select * from pizzas where valor is not null;

-- Selecionar todas as pizzas com nomes que comecem com a letra E
select * from pizzas where nome like 'e%';

-- Selecionar todas as pizzas com nomes que terminam com a letra A
select * from pizzas where nome like '%a';

-- Selecionar todas as pizzas com nomes que tenham as letras "ESA"
select * from pizzas where nome like '%esa%';

-- Listar todas as colunas da tabela Pizza em ordem alfabética
select * from pizzas order by nome asc;

-- restringir o número de linhas retornadas pelo comando select
select * from pizzas order by valor desc limit 2;

-- Listar o nome e o valor da pizza em oredem decrescente de valor e crescente de nome
select * from pizzas order by valor desc, nome asc;

-- mostrar os valores sem repetição
select distinct valor from pizzas order by valor;

/* Funções de agregação
Conhecidas como funções estatísticas, essas funções obtêm informação sobre comjunto de linhas especificados
*AVG(coluna) Média dos valores da coluna
*COUNT número de linhas
*MAX(coluna) Maior valor da coluna
*MIN(coluna) Menor valor da coluna
*SUM(coluna) Soma dos valores da coluna
*/

-- Contar a qauntidade de pizzas cadastradas
select count(*) from pizzas; 
select count(nome) from pizzas;

-- Fazer a média dos valores das pizzas cadastradas (as - apelido da coluna)
select avg(valor) as media from pizzas;
select avg(valor) as media from pizzas where nome like '%esa';

-- Qual é o valor da pizza mais cara do cardápio da pizzaria?
select max(valor) as 'maior valor' from pizzas;

-- Qual é o valor da pizza mais barata do cardápio da pizzaria?
select min(valor) as 'menor valor' from pizzas;

-- Qual é o valor total do pedido número 7?
select sum(valor) as 'valor total' from itens_pedido where pedido_id= 7;

-- group by: agrupa os pedidos (exp: têm 2 pedidos com o mesmo ID, ai ele junta)
select pedido_id as pedido, sum(valor) as 'valor pedido' from itens_pedido group by pedido_id;

-- valor mediodos produtos selecionados
select pedido_id as pedido, sum(valor) as 'valor pedido', sum(quantidade) as 'quantidadede pizzas', avg(valor) as media, sum(valor)/sum(quantidade)
as 'valor médio' from itens_pedido group by pedido_id;

-- INNER JOIN: Retorna registros quando há pelo menos uam correspondência emambas as tabelas
select c.id, c.nome, p.id as pedidos from clientes as c inner join pedidos as p on p.cliente_id = c.id;
select * from clientes inner join pedidos on pedidos.cliente_id = clientes.id;
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes inner join pedidos on pedidos.cliente_id = clientes.id;

-- Left Join: retorna todos os registros da tabela da esquerda
-- (primeira tabela mencionada) e os registros correspondentes da tabela da direita
-- (segunda tabela mencionada)
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes left join pedidos on pedidos.cliente_id = clientes.id;
select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes right join pedidos on pedidos.cliente_id = clientes.id;

insert into pedidos(id, data, valor) values (9, '2024-10-02', 0);

-- Quantidade de pedido(s) realizado(s) por cliente, exibir o nome do cliente e quantidade
select nome, count(pedidos.id) as 'pedidos' from clientes left join pedidos on clientes.id = pedidos.cliente_id group by nome;

select nome, count(valor.cliente_id) from clientes left join pedidos on clientes.nome  ;
select * from pedidos;
select * from clientes;

-- Quantos pedidos foram feitos no total?
select count(*) as 'quantidade' from pedidos;

-- Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"?
select count(pedidos.id) as 'pedidos' from pedidos where cliente_id =  1;

-- Qual o valor de todos os pedidos feitos?
select sum(valor) as 'valor total' from pedidos;


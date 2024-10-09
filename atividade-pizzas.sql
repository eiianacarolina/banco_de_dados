-- Exercício 1:
select nome, pedidos.id as 'pedidos' from clientes inner join pedidos on pedidos.cliente_id = clientes.id;

-- Exercício 2:
select count(*) as 'quantidade de pedidos' from pedidos;

-- Exercício 3:
select nome, pedidos.id, data from pedidos inner join clientes on  clientes.id=pedidos.cliente_id  where data > '2016-12-15 23:59:59';

-- Exercício 4:
select nome, count(pedidos.id) as 'quant_pedidos' from pedidos left join clientes on  clientes.id=pedidos.cliente_id  where nome = 'Alexandre Santos';

-- Exercício 5:
select  pedidos.id, nome from pedidos inner join clientes on clientes.id=pedidos.cliente_id;

-- Exercício 6:
select sum(valor) as 'valor total' from pedidos;

-- Exercício 7:
select nome, sum(valor) 'total gasto' from pedidos inner join clientes on clientes.id = pedidos.cliente_id group by nome; 

-- Exercício 8:
select nome, data, pedidos.id as 'pedidos' from pedidos right join clientes on clientes.id = pedidos.cliente_id where data between '2016-12-01' and '2016-12-31' ;

-- Exercício 9:
select avg(valor) as 'valor medio' from pedidos;

-- Exercício 10:
select nome, sum(valor)as 'valor total' from pedidos left join clientes on clientes.id = pedidos.cliente_id group by nome;

-- Exercício 11:
select max(valor) from pedidos;

-- Exercício 12:
select min(valor) from pedidos where valor > 0;

-- Exercício 13:
select count(pedidos.id) as 'pedidos', nome from pedidos right join clientes on clientes.id = pedidos.cliente_id group by nome;

-- Exercício 14:
select nome, pedidos.valor from pedidos inner join clientes on clientes.id = pedidos.cliente_id order by valor desc limit 1;

-- Exercício 15:
select count(distinct pedido_id) as total_pedidos, avg(quantidade) as media_pizzas from itens_pedido;

-- Exercício 16:
select sum(quantidade) as total_pizzas, count(pedidos.id) as 'quantidade de pedidos' from itens_pedido
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on clientes.id = pedidos.cliente_id where clientes.nome = 'Bruna Dantas';

-- Exercício 17:
select nome, max(valor) as pedido_caro, min(valor) as pedido_barato from pedidos inner join clientes on clientes.id = pedidos.cliente_id where nome = 'Laura Madureira';

-- Exercício 18:
select nome, sum(quantidade) as quantidade_pedidos from itens_pedido
inner join pedidos on itens_pedido.pedido_id = pedidos.id
inner join clientes on clientes.id = pedidos.cliente_id group by nome;

-- Exercício 19:
select nome, pedidos.valor from pedidos inner join clientes on clientes.id = pedidos.cliente_id order by valor asc limit 1;

-- Exercício 20:
select nome, pedidos.id from pedidos right join clientes on clientes.id = pedidos.cliente_id;

-- Exercício 21:
select nome, sum(pedidos.valor) from pedidos right join clientes on clientes.id = pedidos.cliente_id group by nome;

-- Exercício 22:
select nome, sum(pedidos.valor) as 'valor_total' from pedidos inner join clientes on clientes.id = pedidos.cliente_id  group by nome order by valor_total desc limit 3;
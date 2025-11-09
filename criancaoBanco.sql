create table tipo_despesa(
	id_despesa number(3) primary key,
    despesa varchar2(30) not null
);

create table fornecedor(
    id_fornecedor number(3) primary key,
	fornecedor varchar2(50) not null,
    endereco_fornecedor varchar2(50) not null
);

create table estoque (
    id_prod_estoque number(4) primary key,
    id_produto number(4), 
    quantidade number(4)not null,
    descricao varchar2(50)
);

create table produto (
    id_produto number(5) primary key,
    descricao varchar2(45) not null, 
    preco_produto number (4,2) not null,
    tipo_preco varchar2(1) not null
);

create table tipo_pagamento(
    id_tipo_pagamento number(3) primary key,
    descricao varchar2 (30) not null
);

create table pedido(
	id_pedido number(10),
	id_item number(4),
    id_prod_estoque number(4),
    id_retira number(10),
    quantidade number(4),
    data_pedido date,
    cnpj number(14),
    valor_venda number(5,2),
    id_fornecedor number(3),
    id_tipo_pagamento number(14)
);

create table empresa(
    cnpj number(14) primary key,
    razao_social varchar2(45)
);

create table retira(
    id_retira number(10) primary key,
    validacao varchar2(10)
);

create table marketplace (
    id_marketplace number(4) primary key,
    id_retira number(10),
    plataforma varchar2(40),
    taxa_plataforma number(3,2)
);

create table gastos (
    id_gastos number(3) primary key, 
    id_despesa number(3),
    descricao_despesa varchar2(50),
    forma_de_pagamento number(3),
    valor number(5,2),
    data_gasto date
);

alter table gastos add constraint fk_despesa foreign key (id_despesa) references tipo_despesa (id_despesa);

alter table estoque add constraint fk_id_produto  foreign key (id_produto) references produto (id_produto);

alter table pedido add constraint CPK_pedido_item primary key (id_pedido, id_item);

alter table pedido add constraint fk_prod_estoque foreign key (id_prod_estoque) references estoque(id_prod_estoque);

alter table pedido add constraint fk_id_retira foreign key (id_retira) references retira(id_retira);

alter table pedido add constraint fk_cnpj foreign key (cnpj) references empresa(cnpj);

alter table pedido add constraint fk_id_fornecedor foreign key (id_fornecedor) references fornecedor(id_fornecedor);

alter table pedido add constraint fk_id_tipo_pagamento foreign key (id_tipo_pagamento) references tipo_pagamento (id_tipo_pagamento);

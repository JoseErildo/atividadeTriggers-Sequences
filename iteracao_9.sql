create sequence s1 start with 1 increment by 1;

create table cliente (
	codigo integer default nextval('s1'),
	nome varchar(30),
	endereco varchar(150),
	constraint pk_cliente primary key (codigo)
);

create table piloto(
	codigo integer default nextval('s1'),
	nome varchar(30),
	num_voos integer default 0,
	constraint pk_piloto primary key (codigo)
);

create table voo(
	codigo integer default nextval('s1'),
	tipo varchar(20),
	piloto integer,
	num_passageiros integer default 0,
	distancia numeric(10,3),
	constraint pk_voo primary key (codigo),
	constraint fk_piolo foreign key (piloto) references piloto(codigo)
);

create table milhas(
	cliente integer default nextval('s1'),
	quantidade integer default 0,
	constraint pk_milhas primary key (cliente)
);

create table cliente_voo(
	cliente integer,
	voo integer,
	classe varchar(20),
	constraint fk_cliente_cliente foreign key (cliente) references cliente(codigo),
	constraint fk_cliente_voo foreign key (voo) references voo(codigo)
);

create or replace function t_milha_function()
	
	returns trigger
	language plpgsql
	as $$
	begin 
		insert into milhas(cliente, quantidade) values (new.codigo, 0);
		return new;
	end;
	$$

create trigger t_milha 
	after insert on cliente
	for each row execute procedure t_milha_function();
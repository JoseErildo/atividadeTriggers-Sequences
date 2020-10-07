create or replace function add_cartao_milhas()
	returns trigger
	language plpgsql
	as $$
	begin
	
		insert into milhas(cliente) values (nextval('s1'));
		return new;
	end;
	$$
		
create trigger add_cartao_milhas
	after update on milhas
	for each row execute procedure add_cartao_milhas();
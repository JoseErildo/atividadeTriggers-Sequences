create or replace function delete_voo()
	returns trigger
	language plpgsql
	as $$
	begin
	
		delete from cliente where codigo in (select cliente_voo.cliente from cliente_voo 
		where cliente_voo.voo = old.codigo);
		delete from piloto where codigo = old.piloto;
		
		return new;
	end;
	$$
	
create trigger delete_voo
	after delete on voo
	for each row execute procedure delete_voo();


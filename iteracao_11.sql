create or replace function soma_milhas_cartao()
	returns trigger
	language plpgsql
	as $$
	begin
		update milhas set quantidade = quantidade + (select distancia 
									   from voo, cliente_voo where new.voo = 
									   voo.codigo)/10
									   where cliente = new.cliente;
		return new;
	end;
	$$
		
		
		
create trigger soma_milhas_cartao
	after insert on cliente_voo
	for each row execute procedure soma_milhas_cartao();
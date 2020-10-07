create or replace function add_passageiro()
	returns trigger
	language plpgsql
	as $$
	begin
		update voo set num_passageiros = num_passageiros + 1 
									   where new.voo = voo.codigo;
		return new;
	end;
	$$
		
		
		
create trigger add_passageiro
	after insert on cliente_voo
	for each row execute procedure add_passageiro();
	
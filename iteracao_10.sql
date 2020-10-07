create or replace function add_voo()
	returns trigger 
	language plpgsql
	as $$
	begin 
		update piloto set num_voos = num_voos +1 where new.piloto = piloto.codigo;
		return new;
	end;
	$$



create trigger add_voo after insert on voo
	for each row execute procedure add_voo();
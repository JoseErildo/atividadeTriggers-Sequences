create sequence s1;

create table t1(
	a integer default nextval('s1') primary key,
	b integer
);
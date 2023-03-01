-- sprawdzenie czasu uruchomienia serwera
SELECT date_trunc('second', current_timestamp - pg_postmaster_start_time()) as uptime;

-- sprawdzenie wielkosci aktualnej bazy
SELECT pg_database_size(current_database())

-- ile zajmują miejsca wszystkie bazy danych
SELECT sum(pg_database_size(datname))from pg_database

-- zliczanie ilosci rekordów  wmojej tabeli
select count(*)from moja_tabela;

-- sprawdzanie czasu wykonania kwerendy
EXPLAIN select count(*)from moja_tabela; 

--sprawdzenie rozszenien
select * from pg_extension

--tworzenie tabeli z kluczem autoinkrementacyjnym
create table zamowienia (
	id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_osoby bigint
)

--kasowanie tabeli
drop table zamowienia


--formula pobierania usera
select u.id_user, u.user_name, r.role_name from public.user u, public.user_has_role ur , public.role r
where ur.id_user= u.id_user and ur.id_role=r.id_role


-- z uprawnieniami
select u.id_user, u.user_name, r.role_name, p.permission_name
from public.user u, public.user_has_role ur , public.role r,
	public.role_has_permission rp, public.permission p
where 
ur.id_user= u.id_user and ur.id_role=r.id_role and
r.id_role=rp.id_role and rp.id_permission=p.id_permission

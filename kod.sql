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


-- Transakcje

Begin;
update ciasto set cena=cena-10
where id_ciasta=1
ROLLBACK;

LOCK TABLE ciasto IN ACCESS EXCLUSIVE MODE;
COMMIT;

--Zakresy

SELECT 15 <@ '[10, 20)'::int4range;
 SELECT '2025-10-03'::date <@ daterange('2025-10-04', '2027-05-01');
select int4range(1,6)='[1,4]'::int4range
select '[2011-01-01,2011-03-03)'::tsrange @> '[2011-01-02,2011-01-05)'::tsrange

--Grupowanie i sredia
select cu.nazwa, avg(ci.cena)::numeric(6,2) "nazwa cukierni"
from public.cukiernia cu
inner join public.ciasto ci
On cu.id_cukierni= ci.id_cukierni
Group by cu.nazwa



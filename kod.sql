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

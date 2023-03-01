-- sprawdzenie czasu uruchomienia serwera
SELECT date_trunc('second', current_timestamp - pg_postmaster_start_time()) as uptime;

-- sprawdzenie wielkosci aktualnej bazy
SELECT pg_database_size(current_database())

-- ile zajmują miejsca wszystkie bazy danych
SELECT sum(pg_database_size(datname))from pg_database

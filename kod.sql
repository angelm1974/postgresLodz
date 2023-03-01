-- sprawdzenie czasu uruchomienia serwera
SELECT date_trunc('second', current_timestamp - pg_postmaster_start_time()) as uptime;

-- sprawdzenie wielkosci aktualnej bazy
SELECT pg_database_size(current_database())

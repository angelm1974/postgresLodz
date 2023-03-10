PGDMP          9                {            lodz    15.1    15.1      4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    41059    lodz    DATABASE     w   CREATE DATABASE lodz WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';
    DROP DATABASE lodz;
                postgres    false            ?            1259    41060    ciastko    TABLE     p  CREATE TABLE public.ciastko (
    id_ciastko integer NOT NULL,
    id_cukierni integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    smak character varying(40),
    cena numeric(7,2),
    typ character varying(40),
    waga numeric(3,1),
    skladniki character varying(30)[],
    alergeny character varying(30)[],
    gluten boolean,
    informacja text
);
    DROP TABLE public.ciastko;
       public         heap    postgres    false            ?            1259    41065    ciastko_id_ciastko_seq    SEQUENCE     ?   ALTER TABLE public.ciastko ALTER COLUMN id_ciastko ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ciastko_id_ciastko_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            ?            1259    41066    ciasto    TABLE     G  CREATE TABLE public.ciasto (
    id_ciasta integer NOT NULL,
    id_cukierni integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    smak character varying(40),
    cena numeric(7,2),
    typ character varying(40),
    waga numeric(3,1),
    alergeny character varying(30)[],
    gluten boolean,
    informacja text
);
    DROP TABLE public.ciasto;
       public         heap    postgres    false            ?            1259    41071    ciasto_id_ciasto_seq    SEQUENCE     ?   ALTER TABLE public.ciasto ALTER COLUMN id_ciasta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ciasto_id_ciasto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            ?            1259    41072 	   cukiernia    TABLE       CREATE TABLE public.cukiernia (
    id_cukierni integer NOT NULL,
    nazwa character varying(50),
    miejscowosc character varying(50),
    ulica character varying(50),
    nr_budynku character(5),
    nr_lokalu character(5),
    kod_pocztowy character(6),
    informacja text
);
    DROP TABLE public.cukiernia;
       public         heap    postgres    false            ?            1259    41077    cukiernia_id_cukierni_seq    SEQUENCE     ?   ALTER TABLE public.cukiernia ALTER COLUMN id_cukierni ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cukiernia_id_cukierni_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            ?            1259    41078    group    TABLE     ?   CREATE TABLE public."group" (
    id_group integer NOT NULL,
    group_name character varying(50) NOT NULL,
    id_role integer NOT NULL
);
    DROP TABLE public."group";
       public         heap    postgres    false            ?            1259    41081    group_has_user    TABLE     d   CREATE TABLE public.group_has_user (
    id_group integer NOT NULL,
    id_user integer NOT NULL
);
 "   DROP TABLE public.group_has_user;
       public         heap    postgres    false            ?            1259    41084    group_id_group_seq    SEQUENCE     ?   ALTER TABLE public."group" ALTER COLUMN id_group ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.group_id_group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            ?            1259    41085    role    TABLE     i   CREATE TABLE public.role (
    id_role integer NOT NULL,
    role_name character varying(50) NOT NULL
);
    DROP TABLE public.role;
       public         heap    postgres    false            ?            1259    41088    role_has_permission    TABLE     n   CREATE TABLE public.role_has_permission (
    id_permission integer NOT NULL,
    id_role integer NOT NULL
);
 '   DROP TABLE public.role_has_permission;
       public         heap    postgres    false            ?            1259    41091    role_id_role_seq    SEQUENCE     ?   ALTER TABLE public.role ALTER COLUMN id_role ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.role_id_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            ?            1259    41092    tort    TABLE     D  CREATE TABLE public.tort (
    id_tortu integer NOT NULL,
    id_cukierni integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    smak character varying(40),
    cena numeric(7,2),
    typ character varying(40),
    waga numeric(3,1),
    alergeny character varying(30)[],
    gluten boolean,
    informacja text
);
    DROP TABLE public.tort;
       public         heap    postgres    false            ?            1259    41097    torty_id_tortu_seq    SEQUENCE     ?   ALTER TABLE public.tort ALTER COLUMN id_tortu ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.torty_id_tortu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            ?            1259    41098    user    TABLE     k   CREATE TABLE public."user" (
    id_user integer NOT NULL,
    user_name character varying(50) NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            ?            1259    41101    user_has_role    TABLE     b   CREATE TABLE public.user_has_role (
    id_user integer NOT NULL,
    id_role integer NOT NULL
);
 !   DROP TABLE public.user_has_role;
       public         heap    postgres    false            ?            1259    41104    user_id_user_seq    SEQUENCE     ?   ALTER TABLE public."user" ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            ?           2606    41106    ciastko ciastko_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ciastko
    ADD CONSTRAINT ciastko_pkey PRIMARY KEY (id_ciastko);
 >   ALTER TABLE ONLY public.ciastko DROP CONSTRAINT ciastko_pkey;
       public            postgres    false    214            ?           2606    41108    ciasto ciasto_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.ciasto
    ADD CONSTRAINT ciasto_pkey PRIMARY KEY (id_ciasta);
 <   ALTER TABLE ONLY public.ciasto DROP CONSTRAINT ciasto_pkey;
       public            postgres    false    216            ?           2606    41110    cukiernia cukiernia_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.cukiernia
    ADD CONSTRAINT cukiernia_pkey PRIMARY KEY (id_cukierni);
 B   ALTER TABLE ONLY public.cukiernia DROP CONSTRAINT cukiernia_pkey;
       public            postgres    false    218            ?           2606    41112 "   group_has_user group_has_user_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.group_has_user
    ADD CONSTRAINT group_has_user_pkey PRIMARY KEY (id_group, id_user);
 L   ALTER TABLE ONLY public.group_has_user DROP CONSTRAINT group_has_user_pkey;
       public            postgres    false    221    221            ?           2606    41114    group group_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id_group);
 <   ALTER TABLE ONLY public."group" DROP CONSTRAINT group_pkey;
       public            postgres    false    220            ?           2606    41116 ,   role_has_permission role_has_permission_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.role_has_permission
    ADD CONSTRAINT role_has_permission_pkey PRIMARY KEY (id_permission, id_role);
 V   ALTER TABLE ONLY public.role_has_permission DROP CONSTRAINT role_has_permission_pkey;
       public            postgres    false    224    224            ?           2606    41118    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    223            ?           2606    41120    tort torty_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.tort
    ADD CONSTRAINT torty_pkey PRIMARY KEY (id_tortu);
 9   ALTER TABLE ONLY public.tort DROP CONSTRAINT torty_pkey;
       public            postgres    false    226            ?           2606    41122     user_has_role user_has_role_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.user_has_role
    ADD CONSTRAINT user_has_role_pkey PRIMARY KEY (id_user, id_role);
 J   ALTER TABLE ONLY public.user_has_role DROP CONSTRAINT user_has_role_pkey;
       public            postgres    false    229    229            ?           2606    41124    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    228            ?           2606    41125    tort fk_cukiernia_torty    FK CONSTRAINT     ?   ALTER TABLE ONLY public.tort
    ADD CONSTRAINT fk_cukiernia_torty FOREIGN KEY (id_cukierni) REFERENCES public.cukiernia(id_cukierni) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.tort DROP CONSTRAINT fk_cukiernia_torty;
       public          postgres    false    3220    218    226           
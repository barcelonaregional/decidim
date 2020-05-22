PGDMP                          x           bcnregional    10.6    12.2 (Ubuntu 12.2-4) h   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16395    bcnregional    DATABASE     }   CREATE DATABASE bcnregional WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE bcnregional;
                bcnregional    false                        3079    17868    ltree 	   EXTENSION     9   CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;
    DROP EXTENSION ltree;
                   false            �           0    0    EXTENSION ltree    COMMENT     Q   COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';
                        false    3                        3079    18419    pg_trgm 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;
    DROP EXTENSION pg_trgm;
                   false            �           0    0    EXTENSION pg_trgm    COMMENT     e   COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';
                        false    2            �            1259    16414    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public            bcnregional    false            m           1259    18760    decidim_accountability_results    TABLE     =  CREATE TABLE public.decidim_accountability_results (
    id integer NOT NULL,
    title jsonb,
    description jsonb,
    reference character varying,
    start_date date,
    end_date date,
    progress numeric(5,2),
    parent_id integer,
    decidim_accountability_status_id integer,
    decidim_component_id integer,
    decidim_scope_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    children_count integer DEFAULT 0,
    weight double precision DEFAULT 1.0,
    external_id character varying
);
 2   DROP TABLE public.decidim_accountability_results;
       public            bcnregional    false            l           1259    18758 %   decidim_accountability_results_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_accountability_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.decidim_accountability_results_id_seq;
       public          bcnregional    false    365            �           0    0 %   decidim_accountability_results_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.decidim_accountability_results_id_seq OWNED BY public.decidim_accountability_results.id;
          public          bcnregional    false    364            k           1259    18748    decidim_accountability_statuses    TABLE     5  CREATE TABLE public.decidim_accountability_statuses (
    id integer NOT NULL,
    key character varying,
    name jsonb,
    decidim_component_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description jsonb,
    progress integer
);
 3   DROP TABLE public.decidim_accountability_statuses;
       public            bcnregional    false            j           1259    18746 &   decidim_accountability_statuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_accountability_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.decidim_accountability_statuses_id_seq;
       public          bcnregional    false    363            �           0    0 &   decidim_accountability_statuses_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.decidim_accountability_statuses_id_seq OWNED BY public.decidim_accountability_statuses.id;
          public          bcnregional    false    362            o           1259    18776 '   decidim_accountability_timeline_entries    TABLE       CREATE TABLE public.decidim_accountability_timeline_entries (
    id integer NOT NULL,
    entry_date date,
    description jsonb,
    decidim_accountability_result_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 ;   DROP TABLE public.decidim_accountability_timeline_entries;
       public            bcnregional    false            n           1259    18774 .   decidim_accountability_timeline_entries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_accountability_timeline_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.decidim_accountability_timeline_entries_id_seq;
       public          bcnregional    false    367            �           0    0 .   decidim_accountability_timeline_entries_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.decidim_accountability_timeline_entries_id_seq OWNED BY public.decidim_accountability_timeline_entries.id;
          public          bcnregional    false    366            �            1259    17031    decidim_action_logs    TABLE     �  CREATE TABLE public.decidim_action_logs (
    id bigint NOT NULL,
    decidim_organization_id bigint NOT NULL,
    decidim_user_id bigint NOT NULL,
    decidim_component_id bigint,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    participatory_space_type character varying,
    participatory_space_id bigint,
    action character varying NOT NULL,
    extra jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    version_id integer,
    visibility character varying DEFAULT 'admin-only'::character varying,
    decidim_scope_id integer,
    decidim_area_id integer
);
 '   DROP TABLE public.decidim_action_logs;
       public            bcnregional    false            �            1259    17029    decidim_action_logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_action_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.decidim_action_logs_id_seq;
       public          bcnregional    false    249            �           0    0    decidim_action_logs_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.decidim_action_logs_id_seq OWNED BY public.decidim_action_logs.id;
          public          bcnregional    false    248                       1259    17259    decidim_amendments    TABLE     �  CREATE TABLE public.decidim_amendments (
    id bigint NOT NULL,
    decidim_user_id bigint NOT NULL,
    decidim_amendable_type character varying,
    decidim_amendable_id bigint,
    decidim_emendation_type character varying,
    decidim_emendation_id bigint,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 &   DROP TABLE public.decidim_amendments;
       public            bcnregional    false                       1259    17257    decidim_amendments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_amendments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.decidim_amendments_id_seq;
       public          bcnregional    false    273            �           0    0    decidim_amendments_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.decidim_amendments_id_seq OWNED BY public.decidim_amendments.id;
          public          bcnregional    false    272            �            1259    17076    decidim_area_types    TABLE     �   CREATE TABLE public.decidim_area_types (
    id bigint NOT NULL,
    decidim_organization_id bigint,
    name jsonb NOT NULL,
    plural jsonb NOT NULL
);
 &   DROP TABLE public.decidim_area_types;
       public            bcnregional    false            �            1259    17074    decidim_area_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_area_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.decidim_area_types_id_seq;
       public          bcnregional    false    255            �           0    0    decidim_area_types_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.decidim_area_types_id_seq OWNED BY public.decidim_area_types.id;
          public          bcnregional    false    254                       1259    17093    decidim_areas    TABLE     �   CREATE TABLE public.decidim_areas (
    id bigint NOT NULL,
    name jsonb,
    area_type_id bigint,
    decidim_organization_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 !   DROP TABLE public.decidim_areas;
       public            bcnregional    false                        1259    17091    decidim_areas_id_seq    SEQUENCE     }   CREATE SEQUENCE public.decidim_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.decidim_areas_id_seq;
       public          bcnregional    false    257            �           0    0    decidim_areas_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.decidim_areas_id_seq OWNED BY public.decidim_areas.id;
          public          bcnregional    false    256            5           1259    17822    decidim_assemblies    TABLE     [  CREATE TABLE public.decidim_assemblies (
    id integer NOT NULL,
    slug character varying NOT NULL,
    hashtag character varying,
    decidim_organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title jsonb NOT NULL,
    subtitle jsonb NOT NULL,
    short_description jsonb NOT NULL,
    description jsonb NOT NULL,
    hero_image character varying,
    banner_image character varying,
    promoted boolean DEFAULT false,
    published_at timestamp without time zone,
    developer_group jsonb,
    meta_scope jsonb,
    local_area jsonb,
    target jsonb,
    participatory_scope jsonb,
    participatory_structure jsonb,
    show_statistics boolean DEFAULT false,
    decidim_scope_id integer,
    scopes_enabled boolean DEFAULT true NOT NULL,
    private_space boolean DEFAULT false,
    reference character varying,
    decidim_area_id bigint,
    parent_id bigint,
    parents_path public.ltree,
    children_count integer DEFAULT 0,
    purpose_of_action jsonb,
    composition jsonb,
    assembly_type character varying,
    assembly_type_other jsonb,
    creation_date date,
    created_by character varying,
    created_by_other jsonb,
    duration date,
    included_at date,
    closing_date date,
    closing_date_reason jsonb,
    internal_organisation jsonb,
    is_transparent boolean DEFAULT true,
    special_features jsonb,
    twitter_handler character varying,
    instagram_handler character varying,
    facebook_handler character varying,
    youtube_handler character varying,
    github_handler character varying
);
 &   DROP TABLE public.decidim_assemblies;
       public            bcnregional    false    3    3    3            4           1259    17820    decidim_assemblies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_assemblies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.decidim_assemblies_id_seq;
       public          bcnregional    false    309            �           0    0    decidim_assemblies_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.decidim_assemblies_id_seq OWNED BY public.decidim_assemblies.id;
          public          bcnregional    false    308            9           1259    18070    decidim_assembly_members    TABLE     +  CREATE TABLE public.decidim_assembly_members (
    id bigint NOT NULL,
    decidim_assembly_id bigint,
    weight integer DEFAULT 0 NOT NULL,
    full_name character varying,
    gender character varying,
    birthday date,
    birthplace character varying,
    designation_date date,
    designation_mode character varying,
    "position" character varying,
    position_other character varying,
    ceased_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    decidim_user_id bigint
);
 ,   DROP TABLE public.decidim_assembly_members;
       public            bcnregional    false            8           1259    18068    decidim_assembly_members_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_assembly_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.decidim_assembly_members_id_seq;
       public          bcnregional    false    313            �           0    0    decidim_assembly_members_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.decidim_assembly_members_id_seq OWNED BY public.decidim_assembly_members.id;
          public          bcnregional    false    312            7           1259    17847    decidim_assembly_user_roles    TABLE       CREATE TABLE public.decidim_assembly_user_roles (
    id bigint NOT NULL,
    decidim_user_id integer,
    decidim_assembly_id integer,
    role character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 /   DROP TABLE public.decidim_assembly_user_roles;
       public            bcnregional    false            6           1259    17845 "   decidim_assembly_user_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_assembly_user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.decidim_assembly_user_roles_id_seq;
       public          bcnregional    false    311            �           0    0 "   decidim_assembly_user_roles_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.decidim_assembly_user_roles_id_seq OWNED BY public.decidim_assembly_user_roles.id;
          public          bcnregional    false    310            �            1259    16997    decidim_attachment_collections    TABLE     
  CREATE TABLE public.decidim_attachment_collections (
    id bigint NOT NULL,
    name jsonb NOT NULL,
    description jsonb NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    collection_for_type character varying NOT NULL,
    collection_for_id bigint NOT NULL
);
 2   DROP TABLE public.decidim_attachment_collections;
       public            bcnregional    false            �            1259    16995 %   decidim_attachment_collections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_attachment_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.decidim_attachment_collections_id_seq;
       public          bcnregional    false    247            �           0    0 %   decidim_attachment_collections_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.decidim_attachment_collections_id_seq OWNED BY public.decidim_attachment_collections.id;
          public          bcnregional    false    246            1           1259    17712    decidim_attachments    TABLE     �  CREATE TABLE public.decidim_attachments (
    id integer NOT NULL,
    title jsonb NOT NULL,
    description jsonb,
    file character varying NOT NULL,
    content_type character varying NOT NULL,
    file_size character varying NOT NULL,
    attached_to_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    attached_to_type character varying NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    attachment_collection_id integer
);
 '   DROP TABLE public.decidim_attachments;
       public            bcnregional    false            0           1259    17710    decidim_attachments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.decidim_attachments_id_seq;
       public          bcnregional    false    305            �           0    0    decidim_attachments_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.decidim_attachments_id_seq OWNED BY public.decidim_attachments.id;
          public          bcnregional    false    304            �            1259    16488    decidim_authorizations    TABLE     �  CREATE TABLE public.decidim_authorizations (
    id integer NOT NULL,
    name character varying NOT NULL,
    metadata jsonb,
    decidim_user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    unique_id character varying,
    granted_at timestamp without time zone,
    verification_metadata jsonb DEFAULT '{}'::jsonb,
    verification_attachment character varying
);
 *   DROP TABLE public.decidim_authorizations;
       public            bcnregional    false            �            1259    16486    decidim_authorizations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_authorizations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.decidim_authorizations_id_seq;
       public          bcnregional    false    205            �           0    0    decidim_authorizations_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.decidim_authorizations_id_seq OWNED BY public.decidim_authorizations.id;
          public          bcnregional    false    204            u           1259    18848    decidim_blogs_posts    TABLE     N  CREATE TABLE public.decidim_blogs_posts (
    id integer NOT NULL,
    title jsonb,
    body jsonb,
    decidim_component_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    decidim_author_id integer NOT NULL,
    decidim_author_type character varying NOT NULL
);
 '   DROP TABLE public.decidim_blogs_posts;
       public            bcnregional    false            t           1259    18846    decidim_blogs_posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_blogs_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.decidim_blogs_posts_id_seq;
       public          bcnregional    false    373            �           0    0    decidim_blogs_posts_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.decidim_blogs_posts_id_seq OWNED BY public.decidim_blogs_posts.id;
          public          bcnregional    false    372            _           1259    18644    decidim_budgets_line_items    TABLE     �   CREATE TABLE public.decidim_budgets_line_items (
    id integer NOT NULL,
    decidim_order_id integer,
    decidim_project_id integer
);
 .   DROP TABLE public.decidim_budgets_line_items;
       public            bcnregional    false            ^           1259    18642 !   decidim_budgets_line_items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_budgets_line_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.decidim_budgets_line_items_id_seq;
       public          bcnregional    false    351            �           0    0 !   decidim_budgets_line_items_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.decidim_budgets_line_items_id_seq OWNED BY public.decidim_budgets_line_items.id;
          public          bcnregional    false    350            ]           1259    18633    decidim_budgets_orders    TABLE     !  CREATE TABLE public.decidim_budgets_orders (
    id integer NOT NULL,
    decidim_user_id integer,
    decidim_component_id integer,
    checked_out_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 *   DROP TABLE public.decidim_budgets_orders;
       public            bcnregional    false            \           1259    18631    decidim_budgets_orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_budgets_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.decidim_budgets_orders_id_seq;
       public          bcnregional    false    349            �           0    0    decidim_budgets_orders_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.decidim_budgets_orders_id_seq OWNED BY public.decidim_budgets_orders.id;
          public          bcnregional    false    348            [           1259    18619    decidim_budgets_projects    TABLE     Y  CREATE TABLE public.decidim_budgets_projects (
    id integer NOT NULL,
    title jsonb,
    description jsonb,
    budget bigint NOT NULL,
    decidim_component_id integer,
    decidim_scope_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reference character varying
);
 ,   DROP TABLE public.decidim_budgets_projects;
       public            bcnregional    false            Z           1259    18617    decidim_budgets_projects_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_budgets_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.decidim_budgets_projects_id_seq;
       public          bcnregional    false    347            �           0    0    decidim_budgets_projects_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.decidim_budgets_projects_id_seq OWNED BY public.decidim_budgets_projects.id;
          public          bcnregional    false    346            �            1259    16535    decidim_categories    TABLE     �   CREATE TABLE public.decidim_categories (
    id integer NOT NULL,
    name jsonb NOT NULL,
    description jsonb NOT NULL,
    parent_id integer,
    decidim_participatory_space_id integer,
    decidim_participatory_space_type character varying
);
 &   DROP TABLE public.decidim_categories;
       public            bcnregional    false            �            1259    16533    decidim_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.decidim_categories_id_seq;
       public          bcnregional    false    211            �           0    0    decidim_categories_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.decidim_categories_id_seq OWNED BY public.decidim_categories.id;
          public          bcnregional    false    210            �            1259    16817    decidim_categorizations    TABLE     4  CREATE TABLE public.decidim_categorizations (
    id bigint NOT NULL,
    decidim_category_id bigint NOT NULL,
    categorizable_type character varying NOT NULL,
    categorizable_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 +   DROP TABLE public.decidim_categorizations;
       public            bcnregional    false            �            1259    16815    decidim_categorizations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_categorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.decidim_categorizations_id_seq;
       public          bcnregional    false    229            �           0    0    decidim_categorizations_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.decidim_categorizations_id_seq OWNED BY public.decidim_categorizations.id;
          public          bcnregional    false    228                       1259    17199    decidim_coauthorships    TABLE     r  CREATE TABLE public.decidim_coauthorships (
    id bigint NOT NULL,
    decidim_author_id bigint NOT NULL,
    decidim_user_group_id bigint,
    coauthorable_type character varying,
    coauthorable_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    decidim_author_type character varying NOT NULL
);
 )   DROP TABLE public.decidim_coauthorships;
       public            bcnregional    false            
           1259    17197    decidim_coauthorships_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_coauthorships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.decidim_coauthorships_id_seq;
       public          bcnregional    false    267            �           0    0    decidim_coauthorships_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.decidim_coauthorships_id_seq OWNED BY public.decidim_coauthorships.id;
          public          bcnregional    false    266            ?           1259    18143    decidim_comments_comment_votes    TABLE     \  CREATE TABLE public.decidim_comments_comment_votes (
    id integer NOT NULL,
    weight integer NOT NULL,
    decidim_comment_id integer NOT NULL,
    decidim_author_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    decidim_author_type character varying NOT NULL
);
 2   DROP TABLE public.decidim_comments_comment_votes;
       public            bcnregional    false            >           1259    18141 %   decidim_comments_comment_votes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_comments_comment_votes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.decidim_comments_comment_votes_id_seq;
       public          bcnregional    false    319            �           0    0 %   decidim_comments_comment_votes_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.decidim_comments_comment_votes_id_seq OWNED BY public.decidim_comments_comment_votes.id;
          public          bcnregional    false    318            =           1259    18107    decidim_comments_comments    TABLE     r  CREATE TABLE public.decidim_comments_comments (
    id integer NOT NULL,
    body text NOT NULL,
    decidim_commentable_type character varying NOT NULL,
    decidim_commentable_id integer NOT NULL,
    decidim_author_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    depth integer DEFAULT 0 NOT NULL,
    alignment integer DEFAULT 0 NOT NULL,
    decidim_user_group_id integer,
    decidim_root_commentable_type character varying NOT NULL,
    decidim_root_commentable_id integer NOT NULL,
    decidim_author_type character varying NOT NULL
);
 -   DROP TABLE public.decidim_comments_comments;
       public            bcnregional    false            <           1259    18105     decidim_comments_comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_comments_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.decidim_comments_comments_id_seq;
       public          bcnregional    false    317            �           0    0     decidim_comments_comments_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.decidim_comments_comments_id_seq OWNED BY public.decidim_comments_comments.id;
          public          bcnregional    false    316            �            1259    16523    decidim_components    TABLE     �  CREATE TABLE public.decidim_components (
    id integer NOT NULL,
    manifest_name character varying,
    name jsonb,
    participatory_space_id integer NOT NULL,
    settings jsonb DEFAULT '{}'::jsonb,
    weight integer DEFAULT 0,
    permissions jsonb,
    published_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    participatory_space_type character varying NOT NULL
);
 &   DROP TABLE public.decidim_components;
       public            bcnregional    false            �            1259    16521    decidim_components_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.decidim_components_id_seq;
       public          bcnregional    false    209            �           0    0    decidim_components_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.decidim_components_id_seq OWNED BY public.decidim_components.id;
          public          bcnregional    false    208                       1259    17274    decidim_content_blocks    TABLE     E  CREATE TABLE public.decidim_content_blocks (
    id bigint NOT NULL,
    decidim_organization_id integer NOT NULL,
    manifest_name character varying NOT NULL,
    scope character varying NOT NULL,
    settings jsonb,
    published_at timestamp without time zone,
    weight integer,
    images jsonb DEFAULT '{}'::jsonb
);
 *   DROP TABLE public.decidim_content_blocks;
       public            bcnregional    false                       1259    17272    decidim_content_blocks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_content_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.decidim_content_blocks_id_seq;
       public          bcnregional    false    275                        0    0    decidim_content_blocks_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.decidim_content_blocks_id_seq OWNED BY public.decidim_content_blocks.id;
          public          bcnregional    false    274                       1259    17443     decidim_contextual_help_sections    TABLE     �   CREATE TABLE public.decidim_contextual_help_sections (
    id bigint NOT NULL,
    section_id character varying NOT NULL,
    organization_id bigint NOT NULL,
    content jsonb NOT NULL
);
 4   DROP TABLE public.decidim_contextual_help_sections;
       public            bcnregional    false                       1259    17441 '   decidim_contextual_help_sections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_contextual_help_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.decidim_contextual_help_sections_id_seq;
       public          bcnregional    false    285                       0    0 '   decidim_contextual_help_sections_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.decidim_contextual_help_sections_id_seq OWNED BY public.decidim_contextual_help_sections.id;
          public          bcnregional    false    284                       1259    17371 !   decidim_continuity_badge_statuses    TABLE       CREATE TABLE public.decidim_continuity_badge_statuses (
    id bigint NOT NULL,
    current_streak integer DEFAULT 0 NOT NULL,
    "integer" integer DEFAULT 0 NOT NULL,
    last_session_at date NOT NULL,
    subject_type character varying NOT NULL,
    subject_id bigint NOT NULL
);
 5   DROP TABLE public.decidim_continuity_badge_statuses;
       public            bcnregional    false                       1259    17369 (   decidim_continuity_badge_statuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_continuity_badge_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.decidim_continuity_badge_statuses_id_seq;
       public          bcnregional    false    281                       0    0 (   decidim_continuity_badge_statuses_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.decidim_continuity_badge_statuses_id_seq OWNED BY public.decidim_continuity_badge_statuses.id;
          public          bcnregional    false    280            q           1259    18813    decidim_debates_debates    TABLE     G  CREATE TABLE public.decidim_debates_debates (
    id integer NOT NULL,
    title jsonb,
    description jsonb,
    instructions jsonb,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    image character varying,
    decidim_component_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    information_updates jsonb,
    decidim_author_id integer NOT NULL,
    reference character varying,
    decidim_user_group_id integer,
    decidim_author_type character varying NOT NULL
);
 +   DROP TABLE public.decidim_debates_debates;
       public            bcnregional    false            p           1259    18811    decidim_debates_debates_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_debates_debates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.decidim_debates_debates_id_seq;
       public          bcnregional    false    369                       0    0    decidim_debates_debates_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.decidim_debates_debates_id_seq OWNED BY public.decidim_debates_debates.id;
          public          bcnregional    false    368            �            1259    16893    decidim_follows    TABLE        CREATE TABLE public.decidim_follows (
    id bigint NOT NULL,
    decidim_user_id bigint NOT NULL,
    decidim_followable_type character varying,
    decidim_followable_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 #   DROP TABLE public.decidim_follows;
       public            bcnregional    false            �            1259    16891    decidim_follows_id_seq    SEQUENCE        CREATE SEQUENCE public.decidim_follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.decidim_follows_id_seq;
       public          bcnregional    false    233                       0    0    decidim_follows_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.decidim_follows_id_seq OWNED BY public.decidim_follows.id;
          public          bcnregional    false    232            +           1259    17641    decidim_forms_answer_choices    TABLE     �   CREATE TABLE public.decidim_forms_answer_choices (
    id bigint NOT NULL,
    decidim_answer_id bigint,
    decidim_answer_option_id bigint,
    "position" integer,
    body jsonb,
    custom_body text
);
 0   DROP TABLE public.decidim_forms_answer_choices;
       public            bcnregional    false            *           1259    17639 #   decidim_forms_answer_choices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_forms_answer_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.decidim_forms_answer_choices_id_seq;
       public          bcnregional    false    299                       0    0 #   decidim_forms_answer_choices_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.decidim_forms_answer_choices_id_seq OWNED BY public.decidim_forms_answer_choices.id;
          public          bcnregional    false    298            )           1259    17629    decidim_forms_answer_options    TABLE     �   CREATE TABLE public.decidim_forms_answer_options (
    id bigint NOT NULL,
    decidim_question_id bigint,
    body jsonb,
    free_text boolean
);
 0   DROP TABLE public.decidim_forms_answer_options;
       public            bcnregional    false            (           1259    17627 #   decidim_forms_answer_options_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_forms_answer_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.decidim_forms_answer_options_id_seq;
       public          bcnregional    false    297                       0    0 #   decidim_forms_answer_options_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.decidim_forms_answer_options_id_seq OWNED BY public.decidim_forms_answer_options.id;
          public          bcnregional    false    296            '           1259    17615    decidim_forms_answers    TABLE     $  CREATE TABLE public.decidim_forms_answers (
    id integer NOT NULL,
    body text,
    decidim_user_id integer,
    decidim_questionnaire_id integer,
    decidim_question_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 )   DROP TABLE public.decidim_forms_answers;
       public            bcnregional    false            &           1259    17613    decidim_forms_answers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_forms_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.decidim_forms_answers_id_seq;
       public          bcnregional    false    295                       0    0    decidim_forms_answers_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.decidim_forms_answers_id_seq OWNED BY public.decidim_forms_answers.id;
          public          bcnregional    false    294            #           1259    17590    decidim_forms_questionnaires    TABLE     m  CREATE TABLE public.decidim_forms_questionnaires (
    id integer NOT NULL,
    title jsonb,
    description jsonb,
    tos jsonb,
    questionnaire_for_type character varying,
    questionnaire_for_id integer,
    published_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 0   DROP TABLE public.decidim_forms_questionnaires;
       public            bcnregional    false            "           1259    17588 #   decidim_forms_questionnaires_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_forms_questionnaires_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.decidim_forms_questionnaires_id_seq;
       public          bcnregional    false    291                       0    0 #   decidim_forms_questionnaires_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.decidim_forms_questionnaires_id_seq OWNED BY public.decidim_forms_questionnaires.id;
          public          bcnregional    false    290            %           1259    17602    decidim_forms_questions    TABLE     m  CREATE TABLE public.decidim_forms_questions (
    id integer NOT NULL,
    decidim_questionnaire_id integer,
    "position" integer,
    question_type character varying,
    mandatory boolean,
    body jsonb,
    description jsonb,
    max_choices integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 +   DROP TABLE public.decidim_forms_questions;
       public            bcnregional    false            $           1259    17600    decidim_forms_questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_forms_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.decidim_forms_questions_id_seq;
       public          bcnregional    false    293            	           0    0    decidim_forms_questions_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.decidim_forms_questions_id_seq OWNED BY public.decidim_forms_questions.id;
          public          bcnregional    false    292                       1259    17303 !   decidim_gamification_badge_scores    TABLE     �   CREATE TABLE public.decidim_gamification_badge_scores (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    badge_name character varying NOT NULL,
    value integer DEFAULT 0 NOT NULL
);
 5   DROP TABLE public.decidim_gamification_badge_scores;
       public            bcnregional    false                       1259    17301 (   decidim_gamification_badge_scores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_gamification_badge_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.decidim_gamification_badge_scores_id_seq;
       public          bcnregional    false    279            
           0    0 (   decidim_gamification_badge_scores_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.decidim_gamification_badge_scores_id_seq OWNED BY public.decidim_gamification_badge_scores.id;
          public          bcnregional    false    278                       1259    17290    decidim_hashtags    TABLE     �   CREATE TABLE public.decidim_hashtags (
    id bigint NOT NULL,
    decidim_organization_id bigint,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 $   DROP TABLE public.decidim_hashtags;
       public            bcnregional    false                       1259    17288    decidim_hashtags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_hashtags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.decidim_hashtags_id_seq;
       public          bcnregional    false    277                       0    0    decidim_hashtags_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.decidim_hashtags_id_seq OWNED BY public.decidim_hashtags.id;
          public          bcnregional    false    276            �            1259    16589    decidim_identities    TABLE     F  CREATE TABLE public.decidim_identities (
    id integer NOT NULL,
    provider character varying NOT NULL,
    uid character varying NOT NULL,
    decidim_user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    decidim_organization_id integer
);
 &   DROP TABLE public.decidim_identities;
       public            bcnregional    false            �            1259    16587    decidim_identities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_identities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.decidim_identities_id_seq;
       public          bcnregional    false    217                       0    0    decidim_identities_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.decidim_identities_id_seq OWNED BY public.decidim_identities.id;
          public          bcnregional    false    216            �            1259    16867    decidim_impersonation_logs    TABLE     �  CREATE TABLE public.decidim_impersonation_logs (
    id bigint NOT NULL,
    decidim_admin_id bigint,
    decidim_user_id bigint,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    expired_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reason text
);
 .   DROP TABLE public.decidim_impersonation_logs;
       public            bcnregional    false            �            1259    16865 !   decidim_impersonation_logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_impersonation_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.decidim_impersonation_logs_id_seq;
       public          bcnregional    false    231                       0    0 !   decidim_impersonation_logs_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.decidim_impersonation_logs_id_seq OWNED BY public.decidim_impersonation_logs.id;
          public          bcnregional    false    230            I           1259    18278    decidim_meetings_agenda_items    TABLE     B  CREATE TABLE public.decidim_meetings_agenda_items (
    id bigint NOT NULL,
    decidim_agenda_id bigint,
    "position" integer,
    parent_id bigint,
    duration integer,
    title jsonb,
    description jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 1   DROP TABLE public.decidim_meetings_agenda_items;
       public            bcnregional    false            H           1259    18276 $   decidim_meetings_agenda_items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_meetings_agenda_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.decidim_meetings_agenda_items_id_seq;
       public          bcnregional    false    329                       0    0 $   decidim_meetings_agenda_items_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.decidim_meetings_agenda_items_id_seq OWNED BY public.decidim_meetings_agenda_items.id;
          public          bcnregional    false    328            G           1259    18266    decidim_meetings_agendas    TABLE       CREATE TABLE public.decidim_meetings_agendas (
    id bigint NOT NULL,
    title jsonb,
    decidim_meeting_id bigint NOT NULL,
    visible boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 ,   DROP TABLE public.decidim_meetings_agendas;
       public            bcnregional    false            F           1259    18264    decidim_meetings_agendas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_meetings_agendas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.decidim_meetings_agendas_id_seq;
       public          bcnregional    false    327                       0    0    decidim_meetings_agendas_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.decidim_meetings_agendas_id_seq OWNED BY public.decidim_meetings_agendas.id;
          public          bcnregional    false    326            K           1259    18291    decidim_meetings_invites    TABLE     �  CREATE TABLE public.decidim_meetings_invites (
    id bigint NOT NULL,
    decidim_user_id bigint NOT NULL,
    decidim_meeting_id bigint NOT NULL,
    sent_at timestamp without time zone,
    accepted_at timestamp without time zone,
    rejected_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 ,   DROP TABLE public.decidim_meetings_invites;
       public            bcnregional    false            J           1259    18289    decidim_meetings_invites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_meetings_invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.decidim_meetings_invites_id_seq;
       public          bcnregional    false    331                       0    0    decidim_meetings_invites_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.decidim_meetings_invites_id_seq OWNED BY public.decidim_meetings_invites.id;
          public          bcnregional    false    330            A           1259    18160    decidim_meetings_meetings    TABLE     P  CREATE TABLE public.decidim_meetings_meetings (
    id integer NOT NULL,
    title jsonb,
    description jsonb,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    address text,
    location jsonb,
    location_hints jsonb,
    decidim_component_id integer,
    decidim_author_id integer,
    decidim_scope_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    closing_report jsonb,
    attendees_count integer,
    contributions_count integer,
    attending_organizations text,
    closed_at time without time zone,
    latitude double precision,
    longitude double precision,
    reference character varying,
    registrations_enabled boolean DEFAULT false NOT NULL,
    available_slots integer DEFAULT 0 NOT NULL,
    registration_terms jsonb,
    reserved_slots integer DEFAULT 0 NOT NULL,
    private_meeting boolean DEFAULT false,
    transparent boolean DEFAULT true,
    organizer_id bigint,
    services jsonb DEFAULT '[]'::jsonb,
    registration_form_enabled boolean DEFAULT false
);
 -   DROP TABLE public.decidim_meetings_meetings;
       public            bcnregional    false            @           1259    18158     decidim_meetings_meetings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_meetings_meetings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.decidim_meetings_meetings_id_seq;
       public          bcnregional    false    321                       0    0     decidim_meetings_meetings_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.decidim_meetings_meetings_id_seq OWNED BY public.decidim_meetings_meetings.id;
          public          bcnregional    false    320            E           1259    18242    decidim_meetings_minutes    TABLE     @  CREATE TABLE public.decidim_meetings_minutes (
    id bigint NOT NULL,
    decidim_meeting_id bigint,
    description jsonb,
    video_url character varying,
    audio_url character varying,
    visible boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 ,   DROP TABLE public.decidim_meetings_minutes;
       public            bcnregional    false            D           1259    18240    decidim_meetings_minutes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_meetings_minutes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.decidim_meetings_minutes_id_seq;
       public          bcnregional    false    325                       0    0    decidim_meetings_minutes_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.decidim_meetings_minutes_id_seq OWNED BY public.decidim_meetings_minutes.id;
          public          bcnregional    false    324            C           1259    18197    decidim_meetings_registrations    TABLE     P  CREATE TABLE public.decidim_meetings_registrations (
    id bigint NOT NULL,
    decidim_user_id bigint NOT NULL,
    decidim_meeting_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying,
    validated_at timestamp without time zone
);
 2   DROP TABLE public.decidim_meetings_registrations;
       public            bcnregional    false            B           1259    18195 %   decidim_meetings_registrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_meetings_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.decidim_meetings_registrations_id_seq;
       public          bcnregional    false    323                       0    0 %   decidim_meetings_registrations_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.decidim_meetings_registrations_id_seq OWNED BY public.decidim_meetings_registrations.id;
          public          bcnregional    false    322            �            1259    16944    decidim_messaging_conversations    TABLE     �   CREATE TABLE public.decidim_messaging_conversations (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 3   DROP TABLE public.decidim_messaging_conversations;
       public            bcnregional    false            �            1259    16942 &   decidim_messaging_conversations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_messaging_conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.decidim_messaging_conversations_id_seq;
       public          bcnregional    false    237                       0    0 &   decidim_messaging_conversations_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.decidim_messaging_conversations_id_seq OWNED BY public.decidim_messaging_conversations.id;
          public          bcnregional    false    236            �            1259    16962    decidim_messaging_messages    TABLE     !  CREATE TABLE public.decidim_messaging_messages (
    id bigint NOT NULL,
    decidim_conversation_id bigint NOT NULL,
    decidim_sender_id bigint NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 .   DROP TABLE public.decidim_messaging_messages;
       public            bcnregional    false            �            1259    16960 !   decidim_messaging_messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_messaging_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.decidim_messaging_messages_id_seq;
       public          bcnregional    false    241                       0    0 !   decidim_messaging_messages_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.decidim_messaging_messages_id_seq OWNED BY public.decidim_messaging_messages.id;
          public          bcnregional    false    240            �            1259    16952     decidim_messaging_participations    TABLE       CREATE TABLE public.decidim_messaging_participations (
    id bigint NOT NULL,
    decidim_conversation_id bigint NOT NULL,
    decidim_participant_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 4   DROP TABLE public.decidim_messaging_participations;
       public            bcnregional    false            �            1259    16950 '   decidim_messaging_participations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_messaging_participations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.decidim_messaging_participations_id_seq;
       public          bcnregional    false    239                       0    0 '   decidim_messaging_participations_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.decidim_messaging_participations_id_seq OWNED BY public.decidim_messaging_participations.id;
          public          bcnregional    false    238            �            1259    16987    decidim_messaging_receipts    TABLE     0  CREATE TABLE public.decidim_messaging_receipts (
    id bigint NOT NULL,
    decidim_message_id bigint NOT NULL,
    decidim_recipient_id bigint NOT NULL,
    read_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 .   DROP TABLE public.decidim_messaging_receipts;
       public            bcnregional    false            �            1259    16985 !   decidim_messaging_receipts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_messaging_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.decidim_messaging_receipts_id_seq;
       public          bcnregional    false    245                       0    0 !   decidim_messaging_receipts_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.decidim_messaging_receipts_id_seq OWNED BY public.decidim_messaging_receipts.id;
          public          bcnregional    false    244                       1259    17242    decidim_metrics    TABLE     �  CREATE TABLE public.decidim_metrics (
    id bigint NOT NULL,
    day date NOT NULL,
    metric_type character varying NOT NULL,
    cumulative integer NOT NULL,
    quantity integer NOT NULL,
    decidim_organization_id bigint NOT NULL,
    participatory_space_type character varying,
    participatory_space_id bigint,
    related_object_type character varying,
    related_object_id bigint,
    decidim_category_id bigint
);
 #   DROP TABLE public.decidim_metrics;
       public            bcnregional    false                       1259    17240    decidim_metrics_id_seq    SEQUENCE        CREATE SEQUENCE public.decidim_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.decidim_metrics_id_seq;
       public          bcnregional    false    271                       0    0    decidim_metrics_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.decidim_metrics_id_seq OWNED BY public.decidim_metrics.id;
          public          bcnregional    false    270            �            1259    16738    decidim_moderations    TABLE     �  CREATE TABLE public.decidim_moderations (
    id integer NOT NULL,
    decidim_participatory_space_id integer NOT NULL,
    decidim_reportable_type character varying NOT NULL,
    decidim_reportable_id integer NOT NULL,
    report_count integer DEFAULT 0 NOT NULL,
    hidden_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    decidim_participatory_space_type character varying NOT NULL
);
 '   DROP TABLE public.decidim_moderations;
       public            bcnregional    false            �            1259    16736    decidim_moderations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_moderations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.decidim_moderations_id_seq;
       public          bcnregional    false    225                       0    0    decidim_moderations_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.decidim_moderations_id_seq OWNED BY public.decidim_moderations.id;
          public          bcnregional    false    224            �            1259    16696    decidim_newsletters    TABLE     k  CREATE TABLE public.decidim_newsletters (
    id integer NOT NULL,
    subject jsonb,
    body jsonb,
    organization_id integer,
    author_id integer,
    total_recipients integer,
    total_deliveries integer,
    sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 '   DROP TABLE public.decidim_newsletters;
       public            bcnregional    false            �            1259    16694    decidim_newsletters_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_newsletters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.decidim_newsletters_id_seq;
       public          bcnregional    false    221                       0    0    decidim_newsletters_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.decidim_newsletters_id_seq OWNED BY public.decidim_newsletters.id;
          public          bcnregional    false    220            �            1259    16907    decidim_notifications    TABLE     �  CREATE TABLE public.decidim_notifications (
    id bigint NOT NULL,
    decidim_user_id bigint NOT NULL,
    decidim_resource_type character varying NOT NULL,
    decidim_resource_id bigint NOT NULL,
    event_name character varying NOT NULL,
    event_class character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    extra jsonb
);
 )   DROP TABLE public.decidim_notifications;
       public            bcnregional    false            �            1259    16905    decidim_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.decidim_notifications_id_seq;
       public          bcnregional    false    235                       0    0    decidim_notifications_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.decidim_notifications_id_seq OWNED BY public.decidim_notifications.id;
          public          bcnregional    false    234            �            1259    16440    decidim_organizations    TABLE     �  CREATE TABLE public.decidim_organizations (
    id integer NOT NULL,
    name character varying NOT NULL,
    host character varying NOT NULL,
    default_locale character varying NOT NULL,
    available_locales character varying[] DEFAULT '{}'::character varying[],
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description jsonb,
    logo character varying,
    twitter_handler character varying,
    show_statistics boolean DEFAULT true,
    favicon character varying,
    instagram_handler character varying,
    facebook_handler character varying,
    youtube_handler character varying,
    github_handler character varying,
    official_img_header character varying,
    official_img_footer character varying,
    official_url character varying,
    reference_prefix character varying NOT NULL,
    secondary_hosts character varying[] DEFAULT '{}'::character varying[],
    available_authorizations character varying[] DEFAULT '{}'::character varying[],
    header_snippets text,
    cta_button_text jsonb,
    cta_button_path character varying,
    enable_omnipresent_banner boolean DEFAULT false NOT NULL,
    omnipresent_banner_title jsonb,
    omnipresent_banner_short_description jsonb,
    omnipresent_banner_url character varying,
    highlighted_content_banner_enabled boolean DEFAULT false NOT NULL,
    highlighted_content_banner_title jsonb,
    highlighted_content_banner_short_description jsonb,
    highlighted_content_banner_action_title jsonb,
    highlighted_content_banner_action_subtitle jsonb,
    highlighted_content_banner_action_url character varying,
    highlighted_content_banner_image character varying,
    tos_version timestamp without time zone,
    badges_enabled boolean DEFAULT false NOT NULL,
    send_welcome_notification boolean DEFAULT false NOT NULL,
    welcome_notification_subject jsonb,
    welcome_notification_body jsonb,
    users_registration_mode integer DEFAULT 0 NOT NULL,
    id_documents_methods character varying[] DEFAULT '{online}'::character varying[],
    id_documents_explanation_text jsonb DEFAULT '{}'::jsonb,
    user_groups_enabled boolean DEFAULT false NOT NULL,
    colors jsonb DEFAULT '{}'::jsonb
);
 )   DROP TABLE public.decidim_organizations;
       public            bcnregional    false            �            1259    16438    decidim_organizations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_organizations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.decidim_organizations_id_seq;
       public          bcnregional    false    203                       0    0    decidim_organizations_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.decidim_organizations_id_seq OWNED BY public.decidim_organizations.id;
          public          bcnregional    false    202            ;           1259    18086    decidim_pages_pages    TABLE     �   CREATE TABLE public.decidim_pages_pages (
    id integer NOT NULL,
    body jsonb,
    decidim_component_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 '   DROP TABLE public.decidim_pages_pages;
       public            bcnregional    false            :           1259    18084    decidim_pages_pages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_pages_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.decidim_pages_pages_id_seq;
       public          bcnregional    false    315                       0    0    decidim_pages_pages_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.decidim_pages_pages_id_seq OWNED BY public.decidim_pages_pages.id;
          public          bcnregional    false    314            3           1259    17731 $   decidim_participatory_process_groups    TABLE     @  CREATE TABLE public.decidim_participatory_process_groups (
    id integer NOT NULL,
    name jsonb NOT NULL,
    description jsonb NOT NULL,
    hero_image character varying,
    decidim_organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 8   DROP TABLE public.decidim_participatory_process_groups;
       public            bcnregional    false            2           1259    17729 +   decidim_participatory_process_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_participatory_process_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.decidim_participatory_process_groups_id_seq;
       public          bcnregional    false    307                       0    0 +   decidim_participatory_process_groups_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.decidim_participatory_process_groups_id_seq OWNED BY public.decidim_participatory_process_groups.id;
          public          bcnregional    false    306            /           1259    17680 #   decidim_participatory_process_steps    TABLE     �  CREATE TABLE public.decidim_participatory_process_steps (
    id integer NOT NULL,
    title jsonb NOT NULL,
    description jsonb,
    start_date date,
    end_date date,
    decidim_participatory_process_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active boolean DEFAULT false,
    "position" integer,
    cta_text jsonb DEFAULT '{}'::jsonb,
    cta_path character varying
);
 7   DROP TABLE public.decidim_participatory_process_steps;
       public            bcnregional    false            .           1259    17678 *   decidim_participatory_process_steps_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_participatory_process_steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.decidim_participatory_process_steps_id_seq;
       public          bcnregional    false    303                       0    0 *   decidim_participatory_process_steps_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.decidim_participatory_process_steps_id_seq OWNED BY public.decidim_participatory_process_steps.id;
          public          bcnregional    false    302            !           1259    17574 (   decidim_participatory_process_user_roles    TABLE     +  CREATE TABLE public.decidim_participatory_process_user_roles (
    id integer NOT NULL,
    decidim_user_id integer,
    decidim_participatory_process_id integer,
    role character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 <   DROP TABLE public.decidim_participatory_process_user_roles;
       public            bcnregional    false                        1259    17572 /   decidim_participatory_process_user_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_participatory_process_user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.decidim_participatory_process_user_roles_id_seq;
       public          bcnregional    false    289                        0    0 /   decidim_participatory_process_user_roles_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.decidim_participatory_process_user_roles_id_seq OWNED BY public.decidim_participatory_process_user_roles.id;
          public          bcnregional    false    288            -           1259    17654    decidim_participatory_processes    TABLE       CREATE TABLE public.decidim_participatory_processes (
    id integer NOT NULL,
    slug character varying NOT NULL,
    hashtag character varying,
    decidim_organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title jsonb NOT NULL,
    subtitle jsonb NOT NULL,
    short_description jsonb NOT NULL,
    description jsonb NOT NULL,
    hero_image character varying,
    banner_image character varying,
    promoted boolean DEFAULT false,
    published_at timestamp without time zone,
    developer_group jsonb,
    end_date date,
    meta_scope jsonb,
    local_area jsonb,
    target jsonb,
    participatory_scope jsonb,
    participatory_structure jsonb,
    decidim_scope_id integer,
    decidim_participatory_process_group_id integer,
    show_statistics boolean DEFAULT true,
    announcement jsonb,
    scopes_enabled boolean DEFAULT true NOT NULL,
    start_date date,
    private_space boolean DEFAULT false,
    reference character varying
);
 3   DROP TABLE public.decidim_participatory_processes;
       public            bcnregional    false            ,           1259    17652 &   decidim_participatory_processes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_participatory_processes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.decidim_participatory_processes_id_seq;
       public          bcnregional    false    301            !           0    0 &   decidim_participatory_processes_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.decidim_participatory_processes_id_seq OWNED BY public.decidim_participatory_processes.id;
          public          bcnregional    false    300                       1259    17117 !   decidim_participatory_space_links    TABLE       CREATE TABLE public.decidim_participatory_space_links (
    id integer NOT NULL,
    from_type character varying NOT NULL,
    from_id integer NOT NULL,
    to_type character varying NOT NULL,
    to_id integer NOT NULL,
    name character varying NOT NULL,
    data jsonb
);
 5   DROP TABLE public.decidim_participatory_space_links;
       public            bcnregional    false                       1259    17115 (   decidim_participatory_space_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_participatory_space_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.decidim_participatory_space_links_id_seq;
       public          bcnregional    false    259            "           0    0 (   decidim_participatory_space_links_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.decidim_participatory_space_links_id_seq OWNED BY public.decidim_participatory_space_links.id;
          public          bcnregional    false    258            �            1259    17048 )   decidim_participatory_space_private_users    TABLE     (  CREATE TABLE public.decidim_participatory_space_private_users (
    id bigint NOT NULL,
    decidim_user_id bigint,
    privatable_to_id integer,
    privatable_to_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 =   DROP TABLE public.decidim_participatory_space_private_users;
       public            bcnregional    false            �            1259    17046 0   decidim_participatory_space_private_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_participatory_space_private_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.decidim_participatory_space_private_users_id_seq;
       public          bcnregional    false    251            #           0    0 0   decidim_participatory_space_private_users_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.decidim_participatory_space_private_users_id_seq OWNED BY public.decidim_participatory_space_private_users.id;
          public          bcnregional    false    250            W           1259    18555 ;   decidim_proposals_collaborative_draft_collaborator_requests    TABLE     9  CREATE TABLE public.decidim_proposals_collaborative_draft_collaborator_requests (
    id bigint NOT NULL,
    decidim_proposals_collaborative_draft_id bigint NOT NULL,
    decidim_user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 O   DROP TABLE public.decidim_proposals_collaborative_draft_collaborator_requests;
       public            bcnregional    false            V           1259    18553 ?   decidim_proposals_collaborative_draft_collaborator_reque_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_proposals_collaborative_draft_collaborator_reque_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.decidim_proposals_collaborative_draft_collaborator_reque_id_seq;
       public          bcnregional    false    343            $           0    0 ?   decidim_proposals_collaborative_draft_collaborator_reque_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.decidim_proposals_collaborative_draft_collaborator_reque_id_seq OWNED BY public.decidim_proposals_collaborative_draft_collaborator_requests.id;
          public          bcnregional    false    342            U           1259    18517 &   decidim_proposals_collaborative_drafts    TABLE     �  CREATE TABLE public.decidim_proposals_collaborative_drafts (
    id bigint NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    decidim_component_id integer NOT NULL,
    decidim_scope_id integer,
    state character varying,
    reference character varying,
    address text,
    latitude double precision,
    longitude double precision,
    published_at timestamp without time zone,
    authors_count integer DEFAULT 0 NOT NULL,
    versions_count integer DEFAULT 0 NOT NULL,
    contributions_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    coauthorships_count integer DEFAULT 0 NOT NULL
);
 :   DROP TABLE public.decidim_proposals_collaborative_drafts;
       public            bcnregional    false            T           1259    18515 -   decidim_proposals_collaborative_drafts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_proposals_collaborative_drafts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.decidim_proposals_collaborative_drafts_id_seq;
       public          bcnregional    false    341            %           0    0 -   decidim_proposals_collaborative_drafts_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.decidim_proposals_collaborative_drafts_id_seq OWNED BY public.decidim_proposals_collaborative_drafts.id;
          public          bcnregional    false    340            Y           1259    18579 %   decidim_proposals_participatory_texts    TABLE       CREATE TABLE public.decidim_proposals_participatory_texts (
    id bigint NOT NULL,
    title jsonb,
    description jsonb,
    decidim_component_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 9   DROP TABLE public.decidim_proposals_participatory_texts;
       public            bcnregional    false            X           1259    18577 ,   decidim_proposals_participatory_texts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_proposals_participatory_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.decidim_proposals_participatory_texts_id_seq;
       public          bcnregional    false    345            &           0    0 ,   decidim_proposals_participatory_texts_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.decidim_proposals_participatory_texts_id_seq OWNED BY public.decidim_proposals_participatory_texts.id;
          public          bcnregional    false    344            Q           1259    18392 '   decidim_proposals_proposal_endorsements    TABLE     h  CREATE TABLE public.decidim_proposals_proposal_endorsements (
    id bigint NOT NULL,
    decidim_proposal_id bigint NOT NULL,
    decidim_author_id bigint NOT NULL,
    decidim_user_group_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    decidim_author_type character varying NOT NULL
);
 ;   DROP TABLE public.decidim_proposals_proposal_endorsements;
       public            bcnregional    false            P           1259    18390 .   decidim_proposals_proposal_endorsements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_proposals_proposal_endorsements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.decidim_proposals_proposal_endorsements_id_seq;
       public          bcnregional    false    337            '           0    0 .   decidim_proposals_proposal_endorsements_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.decidim_proposals_proposal_endorsements_id_seq OWNED BY public.decidim_proposals_proposal_endorsements.id;
          public          bcnregional    false    336            S           1259    18486     decidim_proposals_proposal_notes    TABLE     #  CREATE TABLE public.decidim_proposals_proposal_notes (
    id bigint NOT NULL,
    decidim_proposal_id bigint NOT NULL,
    decidim_author_id bigint NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 4   DROP TABLE public.decidim_proposals_proposal_notes;
       public            bcnregional    false            R           1259    18484 '   decidim_proposals_proposal_notes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_proposals_proposal_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.decidim_proposals_proposal_notes_id_seq;
       public          bcnregional    false    339            (           0    0 '   decidim_proposals_proposal_notes_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.decidim_proposals_proposal_notes_id_seq OWNED BY public.decidim_proposals_proposal_notes.id;
          public          bcnregional    false    338            O           1259    18331     decidim_proposals_proposal_votes    TABLE     <  CREATE TABLE public.decidim_proposals_proposal_votes (
    id integer NOT NULL,
    decidim_proposal_id integer NOT NULL,
    decidim_author_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    temporary boolean DEFAULT false NOT NULL
);
 4   DROP TABLE public.decidim_proposals_proposal_votes;
       public            bcnregional    false            N           1259    18329 '   decidim_proposals_proposal_votes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_proposals_proposal_votes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.decidim_proposals_proposal_votes_id_seq;
       public          bcnregional    false    335            )           0    0 '   decidim_proposals_proposal_votes_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.decidim_proposals_proposal_votes_id_seq OWNED BY public.decidim_proposals_proposal_votes.id;
          public          bcnregional    false    334            M           1259    18316    decidim_proposals_proposals    TABLE     }  CREATE TABLE public.decidim_proposals_proposals (
    id integer NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    decidim_component_id integer NOT NULL,
    decidim_scope_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    proposal_votes_count integer DEFAULT 0 NOT NULL,
    state character varying,
    answered_at timestamp without time zone,
    answer jsonb,
    reference character varying,
    address text,
    latitude double precision,
    longitude double precision,
    proposal_endorsements_count integer DEFAULT 0 NOT NULL,
    published_at timestamp without time zone,
    proposal_notes_count integer DEFAULT 0 NOT NULL,
    coauthorships_count integer DEFAULT 0 NOT NULL,
    "position" integer,
    participatory_text_level character varying,
    created_in_meeting boolean DEFAULT false
);
 /   DROP TABLE public.decidim_proposals_proposals;
       public            bcnregional    false            L           1259    18314 "   decidim_proposals_proposals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_proposals_proposals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.decidim_proposals_proposals_id_seq;
       public          bcnregional    false    333            *           0    0 "   decidim_proposals_proposals_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.decidim_proposals_proposals_id_seq OWNED BY public.decidim_proposals_proposals.id;
          public          bcnregional    false    332            �            1259    16724    decidim_reports    TABLE     6  CREATE TABLE public.decidim_reports (
    id integer NOT NULL,
    decidim_moderation_id integer NOT NULL,
    decidim_user_id integer NOT NULL,
    reason character varying NOT NULL,
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 #   DROP TABLE public.decidim_reports;
       public            bcnregional    false            �            1259    16722    decidim_reports_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.decidim_reports_id_seq;
       public          bcnregional    false    223            +           0    0    decidim_reports_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.decidim_reports_id_seq OWNED BY public.decidim_reports.id;
          public          bcnregional    false    222            �            1259    16575    decidim_resource_links    TABLE     	  CREATE TABLE public.decidim_resource_links (
    id integer NOT NULL,
    from_type character varying NOT NULL,
    from_id integer NOT NULL,
    to_type character varying NOT NULL,
    to_id integer NOT NULL,
    name character varying NOT NULL,
    data jsonb
);
 *   DROP TABLE public.decidim_resource_links;
       public            bcnregional    false            �            1259    16573    decidim_resource_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_resource_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.decidim_resource_links_id_seq;
       public          bcnregional    false    215            ,           0    0    decidim_resource_links_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.decidim_resource_links_id_seq OWNED BY public.decidim_resource_links.id;
          public          bcnregional    false    214                       1259    17229    decidim_resource_permissions    TABLE       CREATE TABLE public.decidim_resource_permissions (
    id bigint NOT NULL,
    resource_type character varying,
    resource_id bigint,
    permissions jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 0   DROP TABLE public.decidim_resource_permissions;
       public            bcnregional    false                       1259    17227 #   decidim_resource_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_resource_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.decidim_resource_permissions_id_seq;
       public          bcnregional    false    269            -           0    0 #   decidim_resource_permissions_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.decidim_resource_permissions_id_seq OWNED BY public.decidim_resource_permissions.id;
          public          bcnregional    false    268            �            1259    16772    decidim_scope_types    TABLE     �   CREATE TABLE public.decidim_scope_types (
    id integer NOT NULL,
    decidim_organization_id integer,
    name jsonb NOT NULL,
    plural jsonb NOT NULL
);
 '   DROP TABLE public.decidim_scope_types;
       public            bcnregional    false            �            1259    16770    decidim_scope_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_scope_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.decidim_scope_types_id_seq;
       public          bcnregional    false    227            .           0    0    decidim_scope_types_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.decidim_scope_types_id_seq OWNED BY public.decidim_scope_types.id;
          public          bcnregional    false    226            �            1259    16548    decidim_scopes    TABLE     w  CREATE TABLE public.decidim_scopes (
    id integer NOT NULL,
    decidim_organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name jsonb NOT NULL,
    scope_type_id integer,
    parent_id integer,
    code character varying NOT NULL,
    part_of integer[] DEFAULT '{}'::integer[] NOT NULL
);
 "   DROP TABLE public.decidim_scopes;
       public            bcnregional    false            �            1259    16546    decidim_scopes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_scopes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.decidim_scopes_id_seq;
       public          bcnregional    false    213            /           0    0    decidim_scopes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.decidim_scopes_id_seq OWNED BY public.decidim_scopes.id;
          public          bcnregional    false    212            �            1259    17061    decidim_searchable_resources    TABLE     9  CREATE TABLE public.decidim_searchable_resources (
    id bigint NOT NULL,
    content_a text,
    content_b text,
    content_c text,
    content_d text,
    locale character varying NOT NULL,
    datetime timestamp without time zone,
    decidim_scope_id bigint,
    decidim_participatory_space_type character varying,
    decidim_participatory_space_id bigint,
    decidim_organization_id bigint,
    resource_type character varying,
    resource_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 0   DROP TABLE public.decidim_searchable_resources;
       public            bcnregional    false            �            1259    17059 #   decidim_searchable_resources_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_searchable_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.decidim_searchable_resources_id_seq;
       public          bcnregional    false    253            0           0    0 #   decidim_searchable_resources_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.decidim_searchable_resources_id_seq OWNED BY public.decidim_searchable_resources.id;
          public          bcnregional    false    252            s           1259    18827    decidim_sortitions_sortitions    TABLE     �  CREATE TABLE public.decidim_sortitions_sortitions (
    id bigint NOT NULL,
    decidim_component_id bigint,
    decidim_proposals_component_id integer,
    dice integer NOT NULL,
    target_items integer NOT NULL,
    request_timestamp timestamp without time zone NOT NULL,
    selected_proposals jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    witnesses jsonb,
    additional_info jsonb,
    decidim_author_id bigint NOT NULL,
    reference character varying,
    title jsonb,
    cancel_reason jsonb,
    cancelled_on timestamp without time zone,
    cancelled_by_user_id integer,
    candidate_proposals jsonb,
    decidim_author_type character varying NOT NULL
);
 1   DROP TABLE public.decidim_sortitions_sortitions;
       public            bcnregional    false            r           1259    18825 $   decidim_sortitions_sortitions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_sortitions_sortitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.decidim_sortitions_sortitions_id_seq;
       public          bcnregional    false    371            1           0    0 $   decidim_sortitions_sortitions_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.decidim_sortitions_sortitions_id_seq OWNED BY public.decidim_sortitions_sortitions.id;
          public          bcnregional    false    370                       1259    17410    decidim_static_page_topics    TABLE     �   CREATE TABLE public.decidim_static_page_topics (
    id bigint NOT NULL,
    title jsonb NOT NULL,
    description jsonb NOT NULL,
    organization_id bigint NOT NULL,
    weight integer,
    show_in_footer boolean DEFAULT false NOT NULL
);
 .   DROP TABLE public.decidim_static_page_topics;
       public            bcnregional    false                       1259    17408 !   decidim_static_page_topics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_static_page_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.decidim_static_page_topics_id_seq;
       public          bcnregional    false    283            2           0    0 !   decidim_static_page_topics_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.decidim_static_page_topics_id_seq OWNED BY public.decidim_static_page_topics.id;
          public          bcnregional    false    282            �            1259    16506    decidim_static_pages    TABLE     �  CREATE TABLE public.decidim_static_pages (
    id integer NOT NULL,
    title jsonb NOT NULL,
    slug character varying NOT NULL,
    content jsonb NOT NULL,
    decidim_organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    weight integer,
    show_in_footer boolean DEFAULT false NOT NULL,
    topic_id bigint
);
 (   DROP TABLE public.decidim_static_pages;
       public            bcnregional    false            �            1259    16504    decidim_static_pages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_static_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.decidim_static_pages_id_seq;
       public          bcnregional    false    207            3           0    0    decidim_static_pages_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.decidim_static_pages_id_seq OWNED BY public.decidim_static_pages.id;
          public          bcnregional    false    206            i           1259    18735 %   decidim_surveys_survey_answer_choices    TABLE     �   CREATE TABLE public.decidim_surveys_survey_answer_choices (
    id bigint NOT NULL,
    decidim_survey_answer_id bigint,
    decidim_survey_answer_option_id bigint,
    body jsonb,
    custom_body text,
    "position" integer
);
 9   DROP TABLE public.decidim_surveys_survey_answer_choices;
       public            bcnregional    false            h           1259    18733 ,   decidim_surveys_survey_answer_choices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_surveys_survey_answer_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.decidim_surveys_survey_answer_choices_id_seq;
       public          bcnregional    false    361            4           0    0 ,   decidim_surveys_survey_answer_choices_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.decidim_surveys_survey_answer_choices_id_seq OWNED BY public.decidim_surveys_survey_answer_choices.id;
          public          bcnregional    false    360            g           1259    18723 %   decidim_surveys_survey_answer_options    TABLE     �   CREATE TABLE public.decidim_surveys_survey_answer_options (
    id bigint NOT NULL,
    decidim_survey_question_id bigint,
    body jsonb,
    free_text boolean
);
 9   DROP TABLE public.decidim_surveys_survey_answer_options;
       public            bcnregional    false            f           1259    18721 ,   decidim_surveys_survey_answer_options_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_surveys_survey_answer_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.decidim_surveys_survey_answer_options_id_seq;
       public          bcnregional    false    359            5           0    0 ,   decidim_surveys_survey_answer_options_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.decidim_surveys_survey_answer_options_id_seq OWNED BY public.decidim_surveys_survey_answer_options.id;
          public          bcnregional    false    358            e           1259    18688    decidim_surveys_survey_answers    TABLE     -  CREATE TABLE public.decidim_surveys_survey_answers (
    id integer NOT NULL,
    decidim_user_id integer,
    decidim_survey_id integer,
    decidim_survey_question_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    body text
);
 2   DROP TABLE public.decidim_surveys_survey_answers;
       public            bcnregional    false            d           1259    18686 %   decidim_surveys_survey_answers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_surveys_survey_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.decidim_surveys_survey_answers_id_seq;
       public          bcnregional    false    357            6           0    0 %   decidim_surveys_survey_answers_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.decidim_surveys_survey_answers_id_seq OWNED BY public.decidim_surveys_survey_answers.id;
          public          bcnregional    false    356            c           1259    18676     decidim_surveys_survey_questions    TABLE     o  CREATE TABLE public.decidim_surveys_survey_questions (
    id integer NOT NULL,
    body jsonb,
    decidim_survey_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer,
    mandatory boolean,
    question_type character varying,
    max_choices integer,
    description jsonb
);
 4   DROP TABLE public.decidim_surveys_survey_questions;
       public            bcnregional    false            b           1259    18674 '   decidim_surveys_survey_questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_surveys_survey_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.decidim_surveys_survey_questions_id_seq;
       public          bcnregional    false    355            7           0    0 '   decidim_surveys_survey_questions_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.decidim_surveys_survey_questions_id_seq OWNED BY public.decidim_surveys_survey_questions.id;
          public          bcnregional    false    354            a           1259    18664    decidim_surveys_surveys    TABLE     :  CREATE TABLE public.decidim_surveys_surveys (
    id integer NOT NULL,
    title jsonb,
    description jsonb,
    tos jsonb,
    decidim_component_id integer,
    published_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 +   DROP TABLE public.decidim_surveys_surveys;
       public            bcnregional    false            `           1259    18662    decidim_surveys_surveys_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_surveys_surveys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.decidim_surveys_surveys_id_seq;
       public          bcnregional    false    353            8           0    0    decidim_surveys_surveys_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.decidim_surveys_surveys_id_seq OWNED BY public.decidim_surveys_surveys.id;
          public          bcnregional    false    352                       1259    17558    decidim_system_admins    TABLE     ^  CREATE TABLE public.decidim_system_admins (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 )   DROP TABLE public.decidim_system_admins;
       public            bcnregional    false                       1259    17556    decidim_system_admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_system_admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.decidim_system_admins_id_seq;
       public          bcnregional    false    287            9           0    0    decidim_system_admins_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.decidim_system_admins_id_seq OWNED BY public.decidim_system_admins.id;
          public          bcnregional    false    286            �            1259    16613    decidim_user_group_memberships    TABLE     X  CREATE TABLE public.decidim_user_group_memberships (
    id integer NOT NULL,
    decidim_user_id integer NOT NULL,
    decidim_user_group_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role character varying DEFAULT 'requested'::character varying NOT NULL
);
 2   DROP TABLE public.decidim_user_group_memberships;
       public            bcnregional    false            �            1259    16611 %   decidim_user_group_memberships_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_user_group_memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.decidim_user_group_memberships_id_seq;
       public          bcnregional    false    219            :           0    0 %   decidim_user_group_memberships_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.decidim_user_group_memberships_id_seq OWNED BY public.decidim_user_group_memberships.id;
          public          bcnregional    false    218            �            1259    16424    decidim_users    TABLE     �  CREATE TABLE public.decidim_users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    invitation_token character varying,
    invitation_created_at timestamp without time zone,
    invitation_sent_at timestamp without time zone,
    invitation_accepted_at timestamp without time zone,
    invitation_limit integer,
    invited_by_type character varying,
    invited_by_id integer,
    invitations_count integer DEFAULT 0,
    decidim_organization_id integer,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    name character varying NOT NULL,
    locale character varying,
    avatar character varying,
    delete_reason text,
    deleted_at timestamp without time zone,
    admin boolean DEFAULT false NOT NULL,
    managed boolean DEFAULT false NOT NULL,
    roles character varying[] DEFAULT '{}'::character varying[],
    email_on_notification boolean DEFAULT false NOT NULL,
    nickname character varying(20) DEFAULT ''::character varying NOT NULL,
    personal_url character varying,
    about text,
    accepted_tos_version timestamp without time zone,
    newsletter_token character varying DEFAULT ''::character varying,
    newsletter_notifications_at timestamp without time zone,
    type character varying NOT NULL,
    extended_data jsonb DEFAULT '{}'::jsonb,
    following_count integer DEFAULT 0 NOT NULL,
    followers_count integer DEFAULT 0 NOT NULL,
    notification_types character varying DEFAULT 'all'::character varying NOT NULL,
    officialized_at timestamp without time zone,
    officialized_as jsonb
);
 !   DROP TABLE public.decidim_users;
       public            bcnregional    false            �            1259    16422    decidim_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.decidim_users_id_seq;
       public          bcnregional    false    201            ;           0    0    decidim_users_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.decidim_users_id_seq OWNED BY public.decidim_users.id;
          public          bcnregional    false    200            w           1259    19217    decidim_verifications_csv_data    TABLE     �   CREATE TABLE public.decidim_verifications_csv_data (
    id bigint NOT NULL,
    email character varying,
    decidim_organization_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 2   DROP TABLE public.decidim_verifications_csv_data;
       public            bcnregional    false            v           1259    19215 %   decidim_verifications_csv_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.decidim_verifications_csv_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.decidim_verifications_csv_data_id_seq;
       public          bcnregional    false    375            <           0    0 %   decidim_verifications_csv_data_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.decidim_verifications_csv_data_id_seq OWNED BY public.decidim_verifications_csv_data.id;
          public          bcnregional    false    374                       1259    17150    oauth_access_grants    TABLE     v  CREATE TABLE public.oauth_access_grants (
    id bigint NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id bigint NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying
);
 '   DROP TABLE public.oauth_access_grants;
       public            bcnregional    false                       1259    17148    oauth_access_grants_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.oauth_access_grants_id_seq;
       public          bcnregional    false    263            =           0    0    oauth_access_grants_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;
          public          bcnregional    false    262            	           1259    17168    oauth_access_tokens    TABLE     �  CREATE TABLE public.oauth_access_tokens (
    id bigint NOT NULL,
    resource_owner_id integer,
    application_id bigint,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying,
    previous_refresh_token character varying DEFAULT ''::character varying NOT NULL
);
 '   DROP TABLE public.oauth_access_tokens;
       public            bcnregional    false                       1259    17166    oauth_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.oauth_access_tokens_id_seq;
       public          bcnregional    false    265            >           0    0    oauth_access_tokens_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;
          public          bcnregional    false    264                       1259    17131    oauth_applications    TABLE     W  CREATE TABLE public.oauth_applications (
    id bigint NOT NULL,
    name character varying NOT NULL,
    organization_name character varying NOT NULL,
    organization_url character varying NOT NULL,
    organization_logo character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    decidim_organization_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying
);
 &   DROP TABLE public.oauth_applications;
       public            bcnregional    false                       1259    17129    oauth_applications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.oauth_applications_id_seq;
       public          bcnregional    false    261            ?           0    0    oauth_applications_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;
          public          bcnregional    false    260            �            1259    16406    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public            bcnregional    false            �            1259    16975    versions    TABLE       CREATE TABLE public.versions (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id integer NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object jsonb,
    created_at timestamp without time zone,
    object_changes text
);
    DROP TABLE public.versions;
       public            bcnregional    false            �            1259    16973    versions_id_seq    SEQUENCE     x   CREATE SEQUENCE public.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.versions_id_seq;
       public          bcnregional    false    243            @           0    0    versions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;
          public          bcnregional    false    242                       2604    18763 !   decidim_accountability_results id    DEFAULT     �   ALTER TABLE ONLY public.decidim_accountability_results ALTER COLUMN id SET DEFAULT nextval('public.decidim_accountability_results_id_seq'::regclass);
 P   ALTER TABLE public.decidim_accountability_results ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    365    364    365                       2604    18751 "   decidim_accountability_statuses id    DEFAULT     �   ALTER TABLE ONLY public.decidim_accountability_statuses ALTER COLUMN id SET DEFAULT nextval('public.decidim_accountability_statuses_id_seq'::regclass);
 Q   ALTER TABLE public.decidim_accountability_statuses ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    362    363    363                       2604    18779 *   decidim_accountability_timeline_entries id    DEFAULT     �   ALTER TABLE ONLY public.decidim_accountability_timeline_entries ALTER COLUMN id SET DEFAULT nextval('public.decidim_accountability_timeline_entries_id_seq'::regclass);
 Y   ALTER TABLE public.decidim_accountability_timeline_entries ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    366    367    367            �           2604    17034    decidim_action_logs id    DEFAULT     �   ALTER TABLE ONLY public.decidim_action_logs ALTER COLUMN id SET DEFAULT nextval('public.decidim_action_logs_id_seq'::regclass);
 E   ALTER TABLE public.decidim_action_logs ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    248    249    249            �           2604    17262    decidim_amendments id    DEFAULT     ~   ALTER TABLE ONLY public.decidim_amendments ALTER COLUMN id SET DEFAULT nextval('public.decidim_amendments_id_seq'::regclass);
 D   ALTER TABLE public.decidim_amendments ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    273    272    273            �           2604    17079    decidim_area_types id    DEFAULT     ~   ALTER TABLE ONLY public.decidim_area_types ALTER COLUMN id SET DEFAULT nextval('public.decidim_area_types_id_seq'::regclass);
 D   ALTER TABLE public.decidim_area_types ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    254    255    255            �           2604    17096    decidim_areas id    DEFAULT     t   ALTER TABLE ONLY public.decidim_areas ALTER COLUMN id SET DEFAULT nextval('public.decidim_areas_id_seq'::regclass);
 ?   ALTER TABLE public.decidim_areas ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    257    256    257            �           2604    17825    decidim_assemblies id    DEFAULT     ~   ALTER TABLE ONLY public.decidim_assemblies ALTER COLUMN id SET DEFAULT nextval('public.decidim_assemblies_id_seq'::regclass);
 D   ALTER TABLE public.decidim_assemblies ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    308    309    309            �           2604    18073    decidim_assembly_members id    DEFAULT     �   ALTER TABLE ONLY public.decidim_assembly_members ALTER COLUMN id SET DEFAULT nextval('public.decidim_assembly_members_id_seq'::regclass);
 J   ALTER TABLE public.decidim_assembly_members ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    313    312    313            �           2604    17850    decidim_assembly_user_roles id    DEFAULT     �   ALTER TABLE ONLY public.decidim_assembly_user_roles ALTER COLUMN id SET DEFAULT nextval('public.decidim_assembly_user_roles_id_seq'::regclass);
 M   ALTER TABLE public.decidim_assembly_user_roles ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    310    311    311            �           2604    17000 !   decidim_attachment_collections id    DEFAULT     �   ALTER TABLE ONLY public.decidim_attachment_collections ALTER COLUMN id SET DEFAULT nextval('public.decidim_attachment_collections_id_seq'::regclass);
 P   ALTER TABLE public.decidim_attachment_collections ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    247    246    247            �           2604    17715    decidim_attachments id    DEFAULT     �   ALTER TABLE ONLY public.decidim_attachments ALTER COLUMN id SET DEFAULT nextval('public.decidim_attachments_id_seq'::regclass);
 E   ALTER TABLE public.decidim_attachments ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    304    305    305            �           2604    16491    decidim_authorizations id    DEFAULT     �   ALTER TABLE ONLY public.decidim_authorizations ALTER COLUMN id SET DEFAULT nextval('public.decidim_authorizations_id_seq'::regclass);
 H   ALTER TABLE public.decidim_authorizations ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    205    204    205                       2604    18851    decidim_blogs_posts id    DEFAULT     �   ALTER TABLE ONLY public.decidim_blogs_posts ALTER COLUMN id SET DEFAULT nextval('public.decidim_blogs_posts_id_seq'::regclass);
 E   ALTER TABLE public.decidim_blogs_posts ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    372    373    373                       2604    18647    decidim_budgets_line_items id    DEFAULT     �   ALTER TABLE ONLY public.decidim_budgets_line_items ALTER COLUMN id SET DEFAULT nextval('public.decidim_budgets_line_items_id_seq'::regclass);
 L   ALTER TABLE public.decidim_budgets_line_items ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    350    351    351                        2604    18636    decidim_budgets_orders id    DEFAULT     �   ALTER TABLE ONLY public.decidim_budgets_orders ALTER COLUMN id SET DEFAULT nextval('public.decidim_budgets_orders_id_seq'::regclass);
 H   ALTER TABLE public.decidim_budgets_orders ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    349    348    349            �           2604    18622    decidim_budgets_projects id    DEFAULT     �   ALTER TABLE ONLY public.decidim_budgets_projects ALTER COLUMN id SET DEFAULT nextval('public.decidim_budgets_projects_id_seq'::regclass);
 J   ALTER TABLE public.decidim_budgets_projects ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    346    347    347            �           2604    16538    decidim_categories id    DEFAULT     ~   ALTER TABLE ONLY public.decidim_categories ALTER COLUMN id SET DEFAULT nextval('public.decidim_categories_id_seq'::regclass);
 D   ALTER TABLE public.decidim_categories ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    210    211    211            �           2604    16820    decidim_categorizations id    DEFAULT     �   ALTER TABLE ONLY public.decidim_categorizations ALTER COLUMN id SET DEFAULT nextval('public.decidim_categorizations_id_seq'::regclass);
 I   ALTER TABLE public.decidim_categorizations ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    228    229    229            �           2604    17202    decidim_coauthorships id    DEFAULT     �   ALTER TABLE ONLY public.decidim_coauthorships ALTER COLUMN id SET DEFAULT nextval('public.decidim_coauthorships_id_seq'::regclass);
 G   ALTER TABLE public.decidim_coauthorships ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    266    267    267            �           2604    18146 !   decidim_comments_comment_votes id    DEFAULT     �   ALTER TABLE ONLY public.decidim_comments_comment_votes ALTER COLUMN id SET DEFAULT nextval('public.decidim_comments_comment_votes_id_seq'::regclass);
 P   ALTER TABLE public.decidim_comments_comment_votes ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    318    319    319            �           2604    18110    decidim_comments_comments id    DEFAULT     �   ALTER TABLE ONLY public.decidim_comments_comments ALTER COLUMN id SET DEFAULT nextval('public.decidim_comments_comments_id_seq'::regclass);
 K   ALTER TABLE public.decidim_comments_comments ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    317    316    317            �           2604    16526    decidim_components id    DEFAULT     ~   ALTER TABLE ONLY public.decidim_components ALTER COLUMN id SET DEFAULT nextval('public.decidim_components_id_seq'::regclass);
 D   ALTER TABLE public.decidim_components ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    209    208    209            �           2604    17277    decidim_content_blocks id    DEFAULT     �   ALTER TABLE ONLY public.decidim_content_blocks ALTER COLUMN id SET DEFAULT nextval('public.decidim_content_blocks_id_seq'::regclass);
 H   ALTER TABLE public.decidim_content_blocks ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    274    275    275            �           2604    17446 #   decidim_contextual_help_sections id    DEFAULT     �   ALTER TABLE ONLY public.decidim_contextual_help_sections ALTER COLUMN id SET DEFAULT nextval('public.decidim_contextual_help_sections_id_seq'::regclass);
 R   ALTER TABLE public.decidim_contextual_help_sections ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    284    285    285            �           2604    17374 $   decidim_continuity_badge_statuses id    DEFAULT     �   ALTER TABLE ONLY public.decidim_continuity_badge_statuses ALTER COLUMN id SET DEFAULT nextval('public.decidim_continuity_badge_statuses_id_seq'::regclass);
 S   ALTER TABLE public.decidim_continuity_badge_statuses ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    280    281    281                       2604    18816    decidim_debates_debates id    DEFAULT     �   ALTER TABLE ONLY public.decidim_debates_debates ALTER COLUMN id SET DEFAULT nextval('public.decidim_debates_debates_id_seq'::regclass);
 I   ALTER TABLE public.decidim_debates_debates ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    368    369    369            �           2604    16896    decidim_follows id    DEFAULT     x   ALTER TABLE ONLY public.decidim_follows ALTER COLUMN id SET DEFAULT nextval('public.decidim_follows_id_seq'::regclass);
 A   ALTER TABLE public.decidim_follows ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    232    233    233            �           2604    17644    decidim_forms_answer_choices id    DEFAULT     �   ALTER TABLE ONLY public.decidim_forms_answer_choices ALTER COLUMN id SET DEFAULT nextval('public.decidim_forms_answer_choices_id_seq'::regclass);
 N   ALTER TABLE public.decidim_forms_answer_choices ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    298    299    299            �           2604    17632    decidim_forms_answer_options id    DEFAULT     �   ALTER TABLE ONLY public.decidim_forms_answer_options ALTER COLUMN id SET DEFAULT nextval('public.decidim_forms_answer_options_id_seq'::regclass);
 N   ALTER TABLE public.decidim_forms_answer_options ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    297    296    297            �           2604    17618    decidim_forms_answers id    DEFAULT     �   ALTER TABLE ONLY public.decidim_forms_answers ALTER COLUMN id SET DEFAULT nextval('public.decidim_forms_answers_id_seq'::regclass);
 G   ALTER TABLE public.decidim_forms_answers ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    295    294    295            �           2604    17593    decidim_forms_questionnaires id    DEFAULT     �   ALTER TABLE ONLY public.decidim_forms_questionnaires ALTER COLUMN id SET DEFAULT nextval('public.decidim_forms_questionnaires_id_seq'::regclass);
 N   ALTER TABLE public.decidim_forms_questionnaires ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    291    290    291            �           2604    17605    decidim_forms_questions id    DEFAULT     �   ALTER TABLE ONLY public.decidim_forms_questions ALTER COLUMN id SET DEFAULT nextval('public.decidim_forms_questions_id_seq'::regclass);
 I   ALTER TABLE public.decidim_forms_questions ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    293    292    293            �           2604    17306 $   decidim_gamification_badge_scores id    DEFAULT     �   ALTER TABLE ONLY public.decidim_gamification_badge_scores ALTER COLUMN id SET DEFAULT nextval('public.decidim_gamification_badge_scores_id_seq'::regclass);
 S   ALTER TABLE public.decidim_gamification_badge_scores ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    279    278    279            �           2604    17293    decidim_hashtags id    DEFAULT     z   ALTER TABLE ONLY public.decidim_hashtags ALTER COLUMN id SET DEFAULT nextval('public.decidim_hashtags_id_seq'::regclass);
 B   ALTER TABLE public.decidim_hashtags ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    277    276    277            �           2604    16592    decidim_identities id    DEFAULT     ~   ALTER TABLE ONLY public.decidim_identities ALTER COLUMN id SET DEFAULT nextval('public.decidim_identities_id_seq'::regclass);
 D   ALTER TABLE public.decidim_identities ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    217    216    217            �           2604    16870    decidim_impersonation_logs id    DEFAULT     �   ALTER TABLE ONLY public.decidim_impersonation_logs ALTER COLUMN id SET DEFAULT nextval('public.decidim_impersonation_logs_id_seq'::regclass);
 L   ALTER TABLE public.decidim_impersonation_logs ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    230    231    231            �           2604    18281     decidim_meetings_agenda_items id    DEFAULT     �   ALTER TABLE ONLY public.decidim_meetings_agenda_items ALTER COLUMN id SET DEFAULT nextval('public.decidim_meetings_agenda_items_id_seq'::regclass);
 O   ALTER TABLE public.decidim_meetings_agenda_items ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    328    329    329            �           2604    18269    decidim_meetings_agendas id    DEFAULT     �   ALTER TABLE ONLY public.decidim_meetings_agendas ALTER COLUMN id SET DEFAULT nextval('public.decidim_meetings_agendas_id_seq'::regclass);
 J   ALTER TABLE public.decidim_meetings_agendas ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    327    326    327            �           2604    18294    decidim_meetings_invites id    DEFAULT     �   ALTER TABLE ONLY public.decidim_meetings_invites ALTER COLUMN id SET DEFAULT nextval('public.decidim_meetings_invites_id_seq'::regclass);
 J   ALTER TABLE public.decidim_meetings_invites ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    330    331    331            �           2604    18163    decidim_meetings_meetings id    DEFAULT     �   ALTER TABLE ONLY public.decidim_meetings_meetings ALTER COLUMN id SET DEFAULT nextval('public.decidim_meetings_meetings_id_seq'::regclass);
 K   ALTER TABLE public.decidim_meetings_meetings ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    320    321    321            �           2604    18245    decidim_meetings_minutes id    DEFAULT     �   ALTER TABLE ONLY public.decidim_meetings_minutes ALTER COLUMN id SET DEFAULT nextval('public.decidim_meetings_minutes_id_seq'::regclass);
 J   ALTER TABLE public.decidim_meetings_minutes ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    324    325    325            �           2604    18200 !   decidim_meetings_registrations id    DEFAULT     �   ALTER TABLE ONLY public.decidim_meetings_registrations ALTER COLUMN id SET DEFAULT nextval('public.decidim_meetings_registrations_id_seq'::regclass);
 P   ALTER TABLE public.decidim_meetings_registrations ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    322    323    323            �           2604    16947 "   decidim_messaging_conversations id    DEFAULT     �   ALTER TABLE ONLY public.decidim_messaging_conversations ALTER COLUMN id SET DEFAULT nextval('public.decidim_messaging_conversations_id_seq'::regclass);
 Q   ALTER TABLE public.decidim_messaging_conversations ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    236    237    237            �           2604    16965    decidim_messaging_messages id    DEFAULT     �   ALTER TABLE ONLY public.decidim_messaging_messages ALTER COLUMN id SET DEFAULT nextval('public.decidim_messaging_messages_id_seq'::regclass);
 L   ALTER TABLE public.decidim_messaging_messages ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    240    241    241            �           2604    16955 #   decidim_messaging_participations id    DEFAULT     �   ALTER TABLE ONLY public.decidim_messaging_participations ALTER COLUMN id SET DEFAULT nextval('public.decidim_messaging_participations_id_seq'::regclass);
 R   ALTER TABLE public.decidim_messaging_participations ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    239    238    239            �           2604    16990    decidim_messaging_receipts id    DEFAULT     �   ALTER TABLE ONLY public.decidim_messaging_receipts ALTER COLUMN id SET DEFAULT nextval('public.decidim_messaging_receipts_id_seq'::regclass);
 L   ALTER TABLE public.decidim_messaging_receipts ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    244    245    245            �           2604    17245    decidim_metrics id    DEFAULT     x   ALTER TABLE ONLY public.decidim_metrics ALTER COLUMN id SET DEFAULT nextval('public.decidim_metrics_id_seq'::regclass);
 A   ALTER TABLE public.decidim_metrics ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    270    271    271            �           2604    16741    decidim_moderations id    DEFAULT     �   ALTER TABLE ONLY public.decidim_moderations ALTER COLUMN id SET DEFAULT nextval('public.decidim_moderations_id_seq'::regclass);
 E   ALTER TABLE public.decidim_moderations ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    225    224    225            �           2604    16699    decidim_newsletters id    DEFAULT     �   ALTER TABLE ONLY public.decidim_newsletters ALTER COLUMN id SET DEFAULT nextval('public.decidim_newsletters_id_seq'::regclass);
 E   ALTER TABLE public.decidim_newsletters ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    221    220    221            �           2604    16910    decidim_notifications id    DEFAULT     �   ALTER TABLE ONLY public.decidim_notifications ALTER COLUMN id SET DEFAULT nextval('public.decidim_notifications_id_seq'::regclass);
 G   ALTER TABLE public.decidim_notifications ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    235    234    235            u           2604    16443    decidim_organizations id    DEFAULT     �   ALTER TABLE ONLY public.decidim_organizations ALTER COLUMN id SET DEFAULT nextval('public.decidim_organizations_id_seq'::regclass);
 G   ALTER TABLE public.decidim_organizations ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    203    202    203            �           2604    18089    decidim_pages_pages id    DEFAULT     �   ALTER TABLE ONLY public.decidim_pages_pages ALTER COLUMN id SET DEFAULT nextval('public.decidim_pages_pages_id_seq'::regclass);
 E   ALTER TABLE public.decidim_pages_pages ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    315    314    315            �           2604    17734 '   decidim_participatory_process_groups id    DEFAULT     �   ALTER TABLE ONLY public.decidim_participatory_process_groups ALTER COLUMN id SET DEFAULT nextval('public.decidim_participatory_process_groups_id_seq'::regclass);
 V   ALTER TABLE public.decidim_participatory_process_groups ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    306    307    307            �           2604    17683 &   decidim_participatory_process_steps id    DEFAULT     �   ALTER TABLE ONLY public.decidim_participatory_process_steps ALTER COLUMN id SET DEFAULT nextval('public.decidim_participatory_process_steps_id_seq'::regclass);
 U   ALTER TABLE public.decidim_participatory_process_steps ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    302    303    303            �           2604    17577 +   decidim_participatory_process_user_roles id    DEFAULT     �   ALTER TABLE ONLY public.decidim_participatory_process_user_roles ALTER COLUMN id SET DEFAULT nextval('public.decidim_participatory_process_user_roles_id_seq'::regclass);
 Z   ALTER TABLE public.decidim_participatory_process_user_roles ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    289    288    289            �           2604    17657 "   decidim_participatory_processes id    DEFAULT     �   ALTER TABLE ONLY public.decidim_participatory_processes ALTER COLUMN id SET DEFAULT nextval('public.decidim_participatory_processes_id_seq'::regclass);
 Q   ALTER TABLE public.decidim_participatory_processes ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    301    300    301            �           2604    17120 $   decidim_participatory_space_links id    DEFAULT     �   ALTER TABLE ONLY public.decidim_participatory_space_links ALTER COLUMN id SET DEFAULT nextval('public.decidim_participatory_space_links_id_seq'::regclass);
 S   ALTER TABLE public.decidim_participatory_space_links ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    258    259    259            �           2604    17051 ,   decidim_participatory_space_private_users id    DEFAULT     �   ALTER TABLE ONLY public.decidim_participatory_space_private_users ALTER COLUMN id SET DEFAULT nextval('public.decidim_participatory_space_private_users_id_seq'::regclass);
 [   ALTER TABLE public.decidim_participatory_space_private_users ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    250    251    251            �           2604    18558 >   decidim_proposals_collaborative_draft_collaborator_requests id    DEFAULT     �   ALTER TABLE ONLY public.decidim_proposals_collaborative_draft_collaborator_requests ALTER COLUMN id SET DEFAULT nextval('public.decidim_proposals_collaborative_draft_collaborator_reque_id_seq'::regclass);
 m   ALTER TABLE public.decidim_proposals_collaborative_draft_collaborator_requests ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    342    343    343            �           2604    18520 )   decidim_proposals_collaborative_drafts id    DEFAULT     �   ALTER TABLE ONLY public.decidim_proposals_collaborative_drafts ALTER COLUMN id SET DEFAULT nextval('public.decidim_proposals_collaborative_drafts_id_seq'::regclass);
 X   ALTER TABLE public.decidim_proposals_collaborative_drafts ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    340    341    341            �           2604    18582 (   decidim_proposals_participatory_texts id    DEFAULT     �   ALTER TABLE ONLY public.decidim_proposals_participatory_texts ALTER COLUMN id SET DEFAULT nextval('public.decidim_proposals_participatory_texts_id_seq'::regclass);
 W   ALTER TABLE public.decidim_proposals_participatory_texts ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    344    345    345            �           2604    18395 *   decidim_proposals_proposal_endorsements id    DEFAULT     �   ALTER TABLE ONLY public.decidim_proposals_proposal_endorsements ALTER COLUMN id SET DEFAULT nextval('public.decidim_proposals_proposal_endorsements_id_seq'::regclass);
 Y   ALTER TABLE public.decidim_proposals_proposal_endorsements ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    336    337    337            �           2604    18489 #   decidim_proposals_proposal_notes id    DEFAULT     �   ALTER TABLE ONLY public.decidim_proposals_proposal_notes ALTER COLUMN id SET DEFAULT nextval('public.decidim_proposals_proposal_notes_id_seq'::regclass);
 R   ALTER TABLE public.decidim_proposals_proposal_notes ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    339    338    339            �           2604    18334 #   decidim_proposals_proposal_votes id    DEFAULT     �   ALTER TABLE ONLY public.decidim_proposals_proposal_votes ALTER COLUMN id SET DEFAULT nextval('public.decidim_proposals_proposal_votes_id_seq'::regclass);
 R   ALTER TABLE public.decidim_proposals_proposal_votes ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    335    334    335            �           2604    18319    decidim_proposals_proposals id    DEFAULT     �   ALTER TABLE ONLY public.decidim_proposals_proposals ALTER COLUMN id SET DEFAULT nextval('public.decidim_proposals_proposals_id_seq'::regclass);
 M   ALTER TABLE public.decidim_proposals_proposals ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    333    332    333            �           2604    16727    decidim_reports id    DEFAULT     x   ALTER TABLE ONLY public.decidim_reports ALTER COLUMN id SET DEFAULT nextval('public.decidim_reports_id_seq'::regclass);
 A   ALTER TABLE public.decidim_reports ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    222    223    223            �           2604    16578    decidim_resource_links id    DEFAULT     �   ALTER TABLE ONLY public.decidim_resource_links ALTER COLUMN id SET DEFAULT nextval('public.decidim_resource_links_id_seq'::regclass);
 H   ALTER TABLE public.decidim_resource_links ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    215    214    215            �           2604    17232    decidim_resource_permissions id    DEFAULT     �   ALTER TABLE ONLY public.decidim_resource_permissions ALTER COLUMN id SET DEFAULT nextval('public.decidim_resource_permissions_id_seq'::regclass);
 N   ALTER TABLE public.decidim_resource_permissions ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    268    269    269            �           2604    16775    decidim_scope_types id    DEFAULT     �   ALTER TABLE ONLY public.decidim_scope_types ALTER COLUMN id SET DEFAULT nextval('public.decidim_scope_types_id_seq'::regclass);
 E   ALTER TABLE public.decidim_scope_types ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    226    227    227            �           2604    16551    decidim_scopes id    DEFAULT     v   ALTER TABLE ONLY public.decidim_scopes ALTER COLUMN id SET DEFAULT nextval('public.decidim_scopes_id_seq'::regclass);
 @   ALTER TABLE public.decidim_scopes ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    213    212    213            �           2604    17064    decidim_searchable_resources id    DEFAULT     �   ALTER TABLE ONLY public.decidim_searchable_resources ALTER COLUMN id SET DEFAULT nextval('public.decidim_searchable_resources_id_seq'::regclass);
 N   ALTER TABLE public.decidim_searchable_resources ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    253    252    253                       2604    18830     decidim_sortitions_sortitions id    DEFAULT     �   ALTER TABLE ONLY public.decidim_sortitions_sortitions ALTER COLUMN id SET DEFAULT nextval('public.decidim_sortitions_sortitions_id_seq'::regclass);
 O   ALTER TABLE public.decidim_sortitions_sortitions ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    370    371    371            �           2604    17413    decidim_static_page_topics id    DEFAULT     �   ALTER TABLE ONLY public.decidim_static_page_topics ALTER COLUMN id SET DEFAULT nextval('public.decidim_static_page_topics_id_seq'::regclass);
 L   ALTER TABLE public.decidim_static_page_topics ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    282    283    283            �           2604    16509    decidim_static_pages id    DEFAULT     �   ALTER TABLE ONLY public.decidim_static_pages ALTER COLUMN id SET DEFAULT nextval('public.decidim_static_pages_id_seq'::regclass);
 F   ALTER TABLE public.decidim_static_pages ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    207    206    207                       2604    18738 (   decidim_surveys_survey_answer_choices id    DEFAULT     �   ALTER TABLE ONLY public.decidim_surveys_survey_answer_choices ALTER COLUMN id SET DEFAULT nextval('public.decidim_surveys_survey_answer_choices_id_seq'::regclass);
 W   ALTER TABLE public.decidim_surveys_survey_answer_choices ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    360    361    361                       2604    18726 (   decidim_surveys_survey_answer_options id    DEFAULT     �   ALTER TABLE ONLY public.decidim_surveys_survey_answer_options ALTER COLUMN id SET DEFAULT nextval('public.decidim_surveys_survey_answer_options_id_seq'::regclass);
 W   ALTER TABLE public.decidim_surveys_survey_answer_options ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    358    359    359                       2604    18691 !   decidim_surveys_survey_answers id    DEFAULT     �   ALTER TABLE ONLY public.decidim_surveys_survey_answers ALTER COLUMN id SET DEFAULT nextval('public.decidim_surveys_survey_answers_id_seq'::regclass);
 P   ALTER TABLE public.decidim_surveys_survey_answers ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    357    356    357                       2604    18679 #   decidim_surveys_survey_questions id    DEFAULT     �   ALTER TABLE ONLY public.decidim_surveys_survey_questions ALTER COLUMN id SET DEFAULT nextval('public.decidim_surveys_survey_questions_id_seq'::regclass);
 R   ALTER TABLE public.decidim_surveys_survey_questions ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    354    355    355                       2604    18667    decidim_surveys_surveys id    DEFAULT     �   ALTER TABLE ONLY public.decidim_surveys_surveys ALTER COLUMN id SET DEFAULT nextval('public.decidim_surveys_surveys_id_seq'::regclass);
 I   ALTER TABLE public.decidim_surveys_surveys ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    352    353    353            �           2604    17561    decidim_system_admins id    DEFAULT     �   ALTER TABLE ONLY public.decidim_system_admins ALTER COLUMN id SET DEFAULT nextval('public.decidim_system_admins_id_seq'::regclass);
 G   ALTER TABLE public.decidim_system_admins ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    286    287    287            �           2604    16616 !   decidim_user_group_memberships id    DEFAULT     �   ALTER TABLE ONLY public.decidim_user_group_memberships ALTER COLUMN id SET DEFAULT nextval('public.decidim_user_group_memberships_id_seq'::regclass);
 P   ALTER TABLE public.decidim_user_group_memberships ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    218    219    219            f           2604    16427    decidim_users id    DEFAULT     t   ALTER TABLE ONLY public.decidim_users ALTER COLUMN id SET DEFAULT nextval('public.decidim_users_id_seq'::regclass);
 ?   ALTER TABLE public.decidim_users ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    200    201    201                       2604    19220 !   decidim_verifications_csv_data id    DEFAULT     �   ALTER TABLE ONLY public.decidim_verifications_csv_data ALTER COLUMN id SET DEFAULT nextval('public.decidim_verifications_csv_data_id_seq'::regclass);
 P   ALTER TABLE public.decidim_verifications_csv_data ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    374    375    375            �           2604    17153    oauth_access_grants id    DEFAULT     �   ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);
 E   ALTER TABLE public.oauth_access_grants ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    262    263    263            �           2604    17171    oauth_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);
 E   ALTER TABLE public.oauth_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    264    265    265            �           2604    17134    oauth_applications id    DEFAULT     ~   ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);
 D   ALTER TABLE public.oauth_applications ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    260    261    261            �           2604    16978    versions id    DEFAULT     j   ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);
 :   ALTER TABLE public.versions ALTER COLUMN id DROP DEFAULT;
       public          bcnregional    false    243    242    243            0          0    16414    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public          bcnregional    false    199   �      �          0    18760    decidim_accountability_results 
   TABLE DATA             COPY public.decidim_accountability_results (id, title, description, reference, start_date, end_date, progress, parent_id, decidim_accountability_status_id, decidim_component_id, decidim_scope_id, created_at, updated_at, children_count, weight, external_id) FROM stdin;
    public          bcnregional    false    365   �      �          0    18748    decidim_accountability_statuses 
   TABLE DATA           �   COPY public.decidim_accountability_statuses (id, key, name, decidim_component_id, created_at, updated_at, description, progress) FROM stdin;
    public          bcnregional    false    363         �          0    18776 '   decidim_accountability_timeline_entries 
   TABLE DATA           �   COPY public.decidim_accountability_timeline_entries (id, entry_date, description, decidim_accountability_result_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    367   .      b          0    17031    decidim_action_logs 
   TABLE DATA           !  COPY public.decidim_action_logs (id, decidim_organization_id, decidim_user_id, decidim_component_id, resource_type, resource_id, participatory_space_type, participatory_space_id, action, extra, created_at, updated_at, version_id, visibility, decidim_scope_id, decidim_area_id) FROM stdin;
    public          bcnregional    false    249   K      z          0    17259    decidim_amendments 
   TABLE DATA           �   COPY public.decidim_amendments (id, decidim_user_id, decidim_amendable_type, decidim_amendable_id, decidim_emendation_type, decidim_emendation_id, state, created_at, updated_at) FROM stdin;
    public          bcnregional    false    273   W|      h          0    17076    decidim_area_types 
   TABLE DATA           W   COPY public.decidim_area_types (id, decidim_organization_id, name, plural) FROM stdin;
    public          bcnregional    false    255   �|      j          0    17093    decidim_areas 
   TABLE DATA           p   COPY public.decidim_areas (id, name, area_type_id, decidim_organization_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    257   �|      �          0    17822    decidim_assemblies 
   TABLE DATA           �  COPY public.decidim_assemblies (id, slug, hashtag, decidim_organization_id, created_at, updated_at, title, subtitle, short_description, description, hero_image, banner_image, promoted, published_at, developer_group, meta_scope, local_area, target, participatory_scope, participatory_structure, show_statistics, decidim_scope_id, scopes_enabled, private_space, reference, decidim_area_id, parent_id, parents_path, children_count, purpose_of_action, composition, assembly_type, assembly_type_other, creation_date, created_by, created_by_other, duration, included_at, closing_date, closing_date_reason, internal_organisation, is_transparent, special_features, twitter_handler, instagram_handler, facebook_handler, youtube_handler, github_handler) FROM stdin;
    public          bcnregional    false    309   �|      �          0    18070    decidim_assembly_members 
   TABLE DATA           �   COPY public.decidim_assembly_members (id, decidim_assembly_id, weight, full_name, gender, birthday, birthplace, designation_date, designation_mode, "position", position_other, ceased_date, created_at, updated_at, decidim_user_id) FROM stdin;
    public          bcnregional    false    313   }      �          0    17847    decidim_assembly_user_roles 
   TABLE DATA           }   COPY public.decidim_assembly_user_roles (id, decidim_user_id, decidim_assembly_id, role, created_at, updated_at) FROM stdin;
    public          bcnregional    false    311   5}      `          0    16997    decidim_attachment_collections 
   TABLE DATA              COPY public.decidim_attachment_collections (id, name, description, weight, collection_for_type, collection_for_id) FROM stdin;
    public          bcnregional    false    247   R}      �          0    17712    decidim_attachments 
   TABLE DATA           �   COPY public.decidim_attachments (id, title, description, file, content_type, file_size, attached_to_id, created_at, updated_at, attached_to_type, weight, attachment_collection_id) FROM stdin;
    public          bcnregional    false    305   �}      6          0    16488    decidim_authorizations 
   TABLE DATA           �   COPY public.decidim_authorizations (id, name, metadata, decidim_user_id, created_at, updated_at, unique_id, granted_at, verification_metadata, verification_attachment) FROM stdin;
    public          bcnregional    false    205   ��      �          0    18848    decidim_blogs_posts 
   TABLE DATA           �   COPY public.decidim_blogs_posts (id, title, body, decidim_component_id, created_at, updated_at, decidim_author_id, decidim_author_type) FROM stdin;
    public          bcnregional    false    373   ̃      �          0    18644    decidim_budgets_line_items 
   TABLE DATA           ^   COPY public.decidim_budgets_line_items (id, decidim_order_id, decidim_project_id) FROM stdin;
    public          bcnregional    false    351   �      �          0    18633    decidim_budgets_orders 
   TABLE DATA           �   COPY public.decidim_budgets_orders (id, decidim_user_id, decidim_component_id, checked_out_at, created_at, updated_at) FROM stdin;
    public          bcnregional    false    349   �      �          0    18619    decidim_budgets_projects 
   TABLE DATA           �   COPY public.decidim_budgets_projects (id, title, description, budget, decidim_component_id, decidim_scope_id, created_at, updated_at, reference) FROM stdin;
    public          bcnregional    false    347   #�      <          0    16535    decidim_categories 
   TABLE DATA           �   COPY public.decidim_categories (id, name, description, parent_id, decidim_participatory_space_id, decidim_participatory_space_type) FROM stdin;
    public          bcnregional    false    211   @�      N          0    16817    decidim_categorizations 
   TABLE DATA           �   COPY public.decidim_categorizations (id, decidim_category_id, categorizable_type, categorizable_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    229   ��      t          0    17199    decidim_coauthorships 
   TABLE DATA           �   COPY public.decidim_coauthorships (id, decidim_author_id, decidim_user_group_id, coauthorable_type, coauthorable_id, created_at, updated_at, decidim_author_type) FROM stdin;
    public          bcnregional    false    267   �      �          0    18143    decidim_comments_comment_votes 
   TABLE DATA           �   COPY public.decidim_comments_comment_votes (id, weight, decidim_comment_id, decidim_author_id, created_at, updated_at, decidim_author_type) FROM stdin;
    public          bcnregional    false    319   ;�      �          0    18107    decidim_comments_comments 
   TABLE DATA             COPY public.decidim_comments_comments (id, body, decidim_commentable_type, decidim_commentable_id, decidim_author_id, created_at, updated_at, depth, alignment, decidim_user_group_id, decidim_root_commentable_type, decidim_root_commentable_id, decidim_author_type) FROM stdin;
    public          bcnregional    false    317   ��      :          0    16523    decidim_components 
   TABLE DATA           �   COPY public.decidim_components (id, manifest_name, name, participatory_space_id, settings, weight, permissions, published_at, created_at, updated_at, participatory_space_type) FROM stdin;
    public          bcnregional    false    209   D�      |          0    17274    decidim_content_blocks 
   TABLE DATA           �   COPY public.decidim_content_blocks (id, decidim_organization_id, manifest_name, scope, settings, published_at, weight, images) FROM stdin;
    public          bcnregional    false    275   ݨ      �          0    17443     decidim_contextual_help_sections 
   TABLE DATA           d   COPY public.decidim_contextual_help_sections (id, section_id, organization_id, content) FROM stdin;
    public          bcnregional    false    285   W�      �          0    17371 !   decidim_continuity_badge_statuses 
   TABLE DATA           �   COPY public.decidim_continuity_badge_statuses (id, current_streak, "integer", last_session_at, subject_type, subject_id) FROM stdin;
    public          bcnregional    false    281   J�      �          0    18813    decidim_debates_debates 
   TABLE DATA             COPY public.decidim_debates_debates (id, title, description, instructions, start_time, end_time, image, decidim_component_id, created_at, updated_at, information_updates, decidim_author_id, reference, decidim_user_group_id, decidim_author_type) FROM stdin;
    public          bcnregional    false    369   ��      R          0    16893    decidim_follows 
   TABLE DATA           �   COPY public.decidim_follows (id, decidim_user_id, decidim_followable_type, decidim_followable_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    233   ô      �          0    17641    decidim_forms_answer_choices 
   TABLE DATA           �   COPY public.decidim_forms_answer_choices (id, decidim_answer_id, decidim_answer_option_id, "position", body, custom_body) FROM stdin;
    public          bcnregional    false    299   ��      �          0    17629    decidim_forms_answer_options 
   TABLE DATA           `   COPY public.decidim_forms_answer_options (id, decidim_question_id, body, free_text) FROM stdin;
    public          bcnregional    false    297   ��      �          0    17615    decidim_forms_answers 
   TABLE DATA           �   COPY public.decidim_forms_answers (id, body, decidim_user_id, decidim_questionnaire_id, decidim_question_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    295   ɸ      �          0    17590    decidim_forms_questionnaires 
   TABLE DATA           �   COPY public.decidim_forms_questionnaires (id, title, description, tos, questionnaire_for_type, questionnaire_for_id, published_at, created_at, updated_at) FROM stdin;
    public          bcnregional    false    291   �      �          0    17602    decidim_forms_questions 
   TABLE DATA           �   COPY public.decidim_forms_questions (id, decidim_questionnaire_id, "position", question_type, mandatory, body, description, max_choices, created_at, updated_at) FROM stdin;
    public          bcnregional    false    293   ̹      �          0    17303 !   decidim_gamification_badge_scores 
   TABLE DATA           [   COPY public.decidim_gamification_badge_scores (id, user_id, badge_name, value) FROM stdin;
    public          bcnregional    false    279   �      ~          0    17290    decidim_hashtags 
   TABLE DATA           e   COPY public.decidim_hashtags (id, decidim_organization_id, name, created_at, updated_at) FROM stdin;
    public          bcnregional    false    277   �      B          0    16589    decidim_identities 
   TABLE DATA           �   COPY public.decidim_identities (id, provider, uid, decidim_user_id, created_at, updated_at, decidim_organization_id) FROM stdin;
    public          bcnregional    false    217   ��      P          0    16867    decidim_impersonation_logs 
   TABLE DATA           �   COPY public.decidim_impersonation_logs (id, decidim_admin_id, decidim_user_id, started_at, ended_at, expired_at, created_at, updated_at, reason) FROM stdin;
    public          bcnregional    false    231   ��      �          0    18278    decidim_meetings_agenda_items 
   TABLE DATA           �   COPY public.decidim_meetings_agenda_items (id, decidim_agenda_id, "position", parent_id, duration, title, description, created_at, updated_at) FROM stdin;
    public          bcnregional    false    329   ��      �          0    18266    decidim_meetings_agendas 
   TABLE DATA           r   COPY public.decidim_meetings_agendas (id, title, decidim_meeting_id, visible, created_at, updated_at) FROM stdin;
    public          bcnregional    false    327   ػ      �          0    18291    decidim_meetings_invites 
   TABLE DATA           �   COPY public.decidim_meetings_invites (id, decidim_user_id, decidim_meeting_id, sent_at, accepted_at, rejected_at, created_at, updated_at) FROM stdin;
    public          bcnregional    false    331   ��      �          0    18160    decidim_meetings_meetings 
   TABLE DATA           �  COPY public.decidim_meetings_meetings (id, title, description, start_time, end_time, address, location, location_hints, decidim_component_id, decidim_author_id, decidim_scope_id, created_at, updated_at, closing_report, attendees_count, contributions_count, attending_organizations, closed_at, latitude, longitude, reference, registrations_enabled, available_slots, registration_terms, reserved_slots, private_meeting, transparent, organizer_id, services, registration_form_enabled) FROM stdin;
    public          bcnregional    false    321   �      �          0    18242    decidim_meetings_minutes 
   TABLE DATA           �   COPY public.decidim_meetings_minutes (id, decidim_meeting_id, description, video_url, audio_url, visible, created_at, updated_at) FROM stdin;
    public          bcnregional    false    325   L�      �          0    18197    decidim_meetings_registrations 
   TABLE DATA           �   COPY public.decidim_meetings_registrations (id, decidim_user_id, decidim_meeting_id, created_at, updated_at, code, validated_at) FROM stdin;
    public          bcnregional    false    323   i�      V          0    16944    decidim_messaging_conversations 
   TABLE DATA           U   COPY public.decidim_messaging_conversations (id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    237   ��      Z          0    16962    decidim_messaging_messages 
   TABLE DATA           �   COPY public.decidim_messaging_messages (id, decidim_conversation_id, decidim_sender_id, body, created_at, updated_at) FROM stdin;
    public          bcnregional    false    241   ��      X          0    16952     decidim_messaging_participations 
   TABLE DATA           �   COPY public.decidim_messaging_participations (id, decidim_conversation_id, decidim_participant_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    239   ��      ^          0    16987    decidim_messaging_receipts 
   TABLE DATA           �   COPY public.decidim_messaging_receipts (id, decidim_message_id, decidim_recipient_id, read_at, created_at, updated_at) FROM stdin;
    public          bcnregional    false    245   ��      x          0    17242    decidim_metrics 
   TABLE DATA           �   COPY public.decidim_metrics (id, day, metric_type, cumulative, quantity, decidim_organization_id, participatory_space_type, participatory_space_id, related_object_type, related_object_id, decidim_category_id) FROM stdin;
    public          bcnregional    false    271   ��      J          0    16738    decidim_moderations 
   TABLE DATA           �   COPY public.decidim_moderations (id, decidim_participatory_space_id, decidim_reportable_type, decidim_reportable_id, report_count, hidden_at, created_at, updated_at, decidim_participatory_space_type) FROM stdin;
    public          bcnregional    false    225   �U      F          0    16696    decidim_newsletters 
   TABLE DATA           �   COPY public.decidim_newsletters (id, subject, body, organization_id, author_id, total_recipients, total_deliveries, sent_at, created_at, updated_at) FROM stdin;
    public          bcnregional    false    221   
V      T          0    16907    decidim_notifications 
   TABLE DATA           �   COPY public.decidim_notifications (id, decidim_user_id, decidim_resource_type, decidim_resource_id, event_name, event_class, created_at, updated_at, extra) FROM stdin;
    public          bcnregional    false    235   'V      4          0    16440    decidim_organizations 
   TABLE DATA             COPY public.decidim_organizations (id, name, host, default_locale, available_locales, created_at, updated_at, description, logo, twitter_handler, show_statistics, favicon, instagram_handler, facebook_handler, youtube_handler, github_handler, official_img_header, official_img_footer, official_url, reference_prefix, secondary_hosts, available_authorizations, header_snippets, cta_button_text, cta_button_path, enable_omnipresent_banner, omnipresent_banner_title, omnipresent_banner_short_description, omnipresent_banner_url, highlighted_content_banner_enabled, highlighted_content_banner_title, highlighted_content_banner_short_description, highlighted_content_banner_action_title, highlighted_content_banner_action_subtitle, highlighted_content_banner_action_url, highlighted_content_banner_image, tos_version, badges_enabled, send_welcome_notification, welcome_notification_subject, welcome_notification_body, users_registration_mode, id_documents_methods, id_documents_explanation_text, user_groups_enabled, colors) FROM stdin;
    public          bcnregional    false    203   Sq      �          0    18086    decidim_pages_pages 
   TABLE DATA           e   COPY public.decidim_pages_pages (id, body, decidim_component_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    315   �s      �          0    17731 $   decidim_participatory_process_groups 
   TABLE DATA           �   COPY public.decidim_participatory_process_groups (id, name, description, hero_image, decidim_organization_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    307   �      �          0    17680 #   decidim_participatory_process_steps 
   TABLE DATA           �   COPY public.decidim_participatory_process_steps (id, title, description, start_date, end_date, decidim_participatory_process_id, created_at, updated_at, active, "position", cta_text, cta_path) FROM stdin;
    public          bcnregional    false    303   <�      �          0    17574 (   decidim_participatory_process_user_roles 
   TABLE DATA           �   COPY public.decidim_participatory_process_user_roles (id, decidim_user_id, decidim_participatory_process_id, role, created_at, updated_at) FROM stdin;
    public          bcnregional    false    289   ��      �          0    17654    decidim_participatory_processes 
   TABLE DATA           �  COPY public.decidim_participatory_processes (id, slug, hashtag, decidim_organization_id, created_at, updated_at, title, subtitle, short_description, description, hero_image, banner_image, promoted, published_at, developer_group, end_date, meta_scope, local_area, target, participatory_scope, participatory_structure, decidim_scope_id, decidim_participatory_process_group_id, show_statistics, announcement, scopes_enabled, start_date, private_space, reference) FROM stdin;
    public          bcnregional    false    301   Ƒ      l          0    17117 !   decidim_participatory_space_links 
   TABLE DATA           o   COPY public.decidim_participatory_space_links (id, from_type, from_id, to_type, to_id, name, data) FROM stdin;
    public          bcnregional    false    259   И      d          0    17048 )   decidim_participatory_space_private_users 
   TABLE DATA           �   COPY public.decidim_participatory_space_private_users (id, decidim_user_id, privatable_to_id, privatable_to_type, created_at, updated_at) FROM stdin;
    public          bcnregional    false    251   �      �          0    18555 ;   decidim_proposals_collaborative_draft_collaborator_requests 
   TABLE DATA           �   COPY public.decidim_proposals_collaborative_draft_collaborator_requests (id, decidim_proposals_collaborative_draft_id, decidim_user_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    343   
�      �          0    18517 &   decidim_proposals_collaborative_drafts 
   TABLE DATA             COPY public.decidim_proposals_collaborative_drafts (id, title, body, decidim_component_id, decidim_scope_id, state, reference, address, latitude, longitude, published_at, authors_count, versions_count, contributions_count, created_at, updated_at, coauthorships_count) FROM stdin;
    public          bcnregional    false    341   '�      �          0    18579 %   decidim_proposals_participatory_texts 
   TABLE DATA           �   COPY public.decidim_proposals_participatory_texts (id, title, description, decidim_component_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    345   D�      �          0    18392 '   decidim_proposals_proposal_endorsements 
   TABLE DATA           �   COPY public.decidim_proposals_proposal_endorsements (id, decidim_proposal_id, decidim_author_id, decidim_user_group_id, created_at, updated_at, decidim_author_type) FROM stdin;
    public          bcnregional    false    337   a�      �          0    18486     decidim_proposals_proposal_notes 
   TABLE DATA           �   COPY public.decidim_proposals_proposal_notes (id, decidim_proposal_id, decidim_author_id, body, created_at, updated_at) FROM stdin;
    public          bcnregional    false    339   ��      �          0    18331     decidim_proposals_proposal_votes 
   TABLE DATA           �   COPY public.decidim_proposals_proposal_votes (id, decidim_proposal_id, decidim_author_id, created_at, updated_at, temporary) FROM stdin;
    public          bcnregional    false    335   ՙ      �          0    18316    decidim_proposals_proposals 
   TABLE DATA           q  COPY public.decidim_proposals_proposals (id, title, body, decidim_component_id, decidim_scope_id, created_at, updated_at, proposal_votes_count, state, answered_at, answer, reference, address, latitude, longitude, proposal_endorsements_count, published_at, proposal_notes_count, coauthorships_count, "position", participatory_text_level, created_in_meeting) FROM stdin;
    public          bcnregional    false    333   �      H          0    16724    decidim_reports 
   TABLE DATA           ~   COPY public.decidim_reports (id, decidim_moderation_id, decidim_user_id, reason, details, created_at, updated_at) FROM stdin;
    public          bcnregional    false    223   �      @          0    16575    decidim_resource_links 
   TABLE DATA           d   COPY public.decidim_resource_links (id, from_type, from_id, to_type, to_id, name, data) FROM stdin;
    public          bcnregional    false    215   :�      v          0    17229    decidim_resource_permissions 
   TABLE DATA           {   COPY public.decidim_resource_permissions (id, resource_type, resource_id, permissions, created_at, updated_at) FROM stdin;
    public          bcnregional    false    269   W�      L          0    16772    decidim_scope_types 
   TABLE DATA           X   COPY public.decidim_scope_types (id, decidim_organization_id, name, plural) FROM stdin;
    public          bcnregional    false    227   t�      >          0    16548    decidim_scopes 
   TABLE DATA           �   COPY public.decidim_scopes (id, decidim_organization_id, created_at, updated_at, name, scope_type_id, parent_id, code, part_of) FROM stdin;
    public          bcnregional    false    213   ��      f          0    17061    decidim_searchable_resources 
   TABLE DATA             COPY public.decidim_searchable_resources (id, content_a, content_b, content_c, content_d, locale, datetime, decidim_scope_id, decidim_participatory_space_type, decidim_participatory_space_id, decidim_organization_id, resource_type, resource_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    253   _�      �          0    18827    decidim_sortitions_sortitions 
   TABLE DATA           b  COPY public.decidim_sortitions_sortitions (id, decidim_component_id, decidim_proposals_component_id, dice, target_items, request_timestamp, selected_proposals, created_at, updated_at, witnesses, additional_info, decidim_author_id, reference, title, cancel_reason, cancelled_on, cancelled_by_user_id, candidate_proposals, decidim_author_type) FROM stdin;
    public          bcnregional    false    371   l[      �          0    17410    decidim_static_page_topics 
   TABLE DATA           u   COPY public.decidim_static_page_topics (id, title, description, organization_id, weight, show_in_footer) FROM stdin;
    public          bcnregional    false    283   �[      8          0    16506    decidim_static_pages 
   TABLE DATA           �   COPY public.decidim_static_pages (id, title, slug, content, decidim_organization_id, created_at, updated_at, weight, show_in_footer, topic_id) FROM stdin;
    public          bcnregional    false    207   y\      �          0    18735 %   decidim_surveys_survey_answer_choices 
   TABLE DATA           �   COPY public.decidim_surveys_survey_answer_choices (id, decidim_survey_answer_id, decidim_survey_answer_option_id, body, custom_body, "position") FROM stdin;
    public          bcnregional    false    361   ,�      �          0    18723 %   decidim_surveys_survey_answer_options 
   TABLE DATA           p   COPY public.decidim_surveys_survey_answer_options (id, decidim_survey_question_id, body, free_text) FROM stdin;
    public          bcnregional    false    359   I�      �          0    18688    decidim_surveys_survey_answers 
   TABLE DATA           �   COPY public.decidim_surveys_survey_answers (id, decidim_user_id, decidim_survey_id, decidim_survey_question_id, created_at, updated_at, body) FROM stdin;
    public          bcnregional    false    357   f�      �          0    18676     decidim_surveys_survey_questions 
   TABLE DATA           �   COPY public.decidim_surveys_survey_questions (id, body, decidim_survey_id, created_at, updated_at, "position", mandatory, question_type, max_choices, description) FROM stdin;
    public          bcnregional    false    355   ��      �          0    18664    decidim_surveys_surveys 
   TABLE DATA           �   COPY public.decidim_surveys_surveys (id, title, description, tos, decidim_component_id, published_at, created_at, updated_at) FROM stdin;
    public          bcnregional    false    353   ��      �          0    17558    decidim_system_admins 
   TABLE DATA           �   COPY public.decidim_system_admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, failed_attempts, unlock_token, locked_at, created_at, updated_at) FROM stdin;
    public          bcnregional    false    287   ��      D          0    16613    decidim_user_group_memberships 
   TABLE DATA           �   COPY public.decidim_user_group_memberships (id, decidim_user_id, decidim_user_group_id, created_at, updated_at, role) FROM stdin;
    public          bcnregional    false    219   c�      2          0    16424    decidim_users 
   TABLE DATA           (  COPY public.decidim_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, invitation_token, invitation_created_at, invitation_sent_at, invitation_accepted_at, invitation_limit, invited_by_type, invited_by_id, invitations_count, decidim_organization_id, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, name, locale, avatar, delete_reason, deleted_at, admin, managed, roles, email_on_notification, nickname, personal_url, about, accepted_tos_version, newsletter_token, newsletter_notifications_at, type, extended_data, following_count, followers_count, notification_types, officialized_at, officialized_as) FROM stdin;
    public          bcnregional    false    201   ��      �          0    19217    decidim_verifications_csv_data 
   TABLE DATA           t   COPY public.decidim_verifications_csv_data (id, email, decidim_organization_id, created_at, updated_at) FROM stdin;
    public          bcnregional    false    375   Z�      p          0    17150    oauth_access_grants 
   TABLE DATA           �   COPY public.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, created_at, revoked_at, scopes) FROM stdin;
    public          bcnregional    false    263   w�      r          0    17168    oauth_access_tokens 
   TABLE DATA           �   COPY public.oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes, previous_refresh_token) FROM stdin;
    public          bcnregional    false    265   ��      n          0    17131    oauth_applications 
   TABLE DATA           �   COPY public.oauth_applications (id, name, organization_name, organization_url, organization_logo, uid, secret, redirect_uri, scopes, decidim_organization_id, created_at, updated_at, type) FROM stdin;
    public          bcnregional    false    261   ��      /          0    16406    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public          bcnregional    false    198   λ      \          0    16975    versions 
   TABLE DATA           p   COPY public.versions (id, item_type, item_id, event, whodunnit, object, created_at, object_changes) FROM stdin;
    public          bcnregional    false    243   ��      A           0    0 %   decidim_accountability_results_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.decidim_accountability_results_id_seq', 1, false);
          public          bcnregional    false    364            B           0    0 &   decidim_accountability_statuses_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.decidim_accountability_statuses_id_seq', 1, false);
          public          bcnregional    false    362            C           0    0 .   decidim_accountability_timeline_entries_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.decidim_accountability_timeline_entries_id_seq', 1, false);
          public          bcnregional    false    366            D           0    0    decidim_action_logs_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.decidim_action_logs_id_seq', 673, true);
          public          bcnregional    false    248            E           0    0    decidim_amendments_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.decidim_amendments_id_seq', 1, true);
          public          bcnregional    false    272            F           0    0    decidim_area_types_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.decidim_area_types_id_seq', 1, false);
          public          bcnregional    false    254            G           0    0    decidim_areas_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.decidim_areas_id_seq', 1, false);
          public          bcnregional    false    256            H           0    0    decidim_assemblies_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.decidim_assemblies_id_seq', 1, false);
          public          bcnregional    false    308            I           0    0    decidim_assembly_members_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.decidim_assembly_members_id_seq', 1, false);
          public          bcnregional    false    312            J           0    0 "   decidim_assembly_user_roles_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.decidim_assembly_user_roles_id_seq', 1, false);
          public          bcnregional    false    310            K           0    0 %   decidim_attachment_collections_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.decidim_attachment_collections_id_seq', 3, true);
          public          bcnregional    false    246            L           0    0    decidim_attachments_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.decidim_attachments_id_seq', 24, true);
          public          bcnregional    false    304            M           0    0    decidim_authorizations_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.decidim_authorizations_id_seq', 1, false);
          public          bcnregional    false    204            N           0    0    decidim_blogs_posts_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.decidim_blogs_posts_id_seq', 1, false);
          public          bcnregional    false    372            O           0    0 !   decidim_budgets_line_items_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.decidim_budgets_line_items_id_seq', 1, false);
          public          bcnregional    false    350            P           0    0    decidim_budgets_orders_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.decidim_budgets_orders_id_seq', 1, false);
          public          bcnregional    false    348            Q           0    0    decidim_budgets_projects_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.decidim_budgets_projects_id_seq', 1, false);
          public          bcnregional    false    346            R           0    0    decidim_categories_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.decidim_categories_id_seq', 72, true);
          public          bcnregional    false    210            S           0    0    decidim_categorizations_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.decidim_categorizations_id_seq', 131, true);
          public          bcnregional    false    228            T           0    0    decidim_coauthorships_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.decidim_coauthorships_id_seq', 218, true);
          public          bcnregional    false    266            U           0    0 %   decidim_comments_comment_votes_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.decidim_comments_comment_votes_id_seq', 2, true);
          public          bcnregional    false    318            V           0    0     decidim_comments_comments_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.decidim_comments_comments_id_seq', 2, true);
          public          bcnregional    false    316            W           0    0    decidim_components_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.decidim_components_id_seq', 12, true);
          public          bcnregional    false    208            X           0    0    decidim_content_blocks_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.decidim_content_blocks_id_seq', 20, true);
          public          bcnregional    false    274            Y           0    0 '   decidim_contextual_help_sections_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.decidim_contextual_help_sections_id_seq', 4, true);
          public          bcnregional    false    284            Z           0    0 (   decidim_continuity_badge_statuses_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.decidim_continuity_badge_statuses_id_seq', 39, true);
          public          bcnregional    false    280            [           0    0    decidim_debates_debates_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.decidim_debates_debates_id_seq', 1, false);
          public          bcnregional    false    368            \           0    0    decidim_follows_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.decidim_follows_id_seq', 55, true);
          public          bcnregional    false    232            ]           0    0 #   decidim_forms_answer_choices_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.decidim_forms_answer_choices_id_seq', 1, false);
          public          bcnregional    false    298            ^           0    0 #   decidim_forms_answer_options_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.decidim_forms_answer_options_id_seq', 1, false);
          public          bcnregional    false    296            _           0    0    decidim_forms_answers_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.decidim_forms_answers_id_seq', 1, false);
          public          bcnregional    false    294            `           0    0 #   decidim_forms_questionnaires_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.decidim_forms_questionnaires_id_seq', 11, true);
          public          bcnregional    false    290            a           0    0    decidim_forms_questions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.decidim_forms_questions_id_seq', 1, false);
          public          bcnregional    false    292            b           0    0 (   decidim_gamification_badge_scores_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.decidim_gamification_badge_scores_id_seq', 35, true);
          public          bcnregional    false    278            c           0    0    decidim_hashtags_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.decidim_hashtags_id_seq', 1, false);
          public          bcnregional    false    276            d           0    0    decidim_identities_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.decidim_identities_id_seq', 5, true);
          public          bcnregional    false    216            e           0    0 !   decidim_impersonation_logs_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.decidim_impersonation_logs_id_seq', 1, false);
          public          bcnregional    false    230            f           0    0 $   decidim_meetings_agenda_items_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.decidim_meetings_agenda_items_id_seq', 1, false);
          public          bcnregional    false    328            g           0    0    decidim_meetings_agendas_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.decidim_meetings_agendas_id_seq', 1, false);
          public          bcnregional    false    326            h           0    0    decidim_meetings_invites_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.decidim_meetings_invites_id_seq', 1, false);
          public          bcnregional    false    330            i           0    0     decidim_meetings_meetings_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.decidim_meetings_meetings_id_seq', 12, true);
          public          bcnregional    false    320            j           0    0    decidim_meetings_minutes_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.decidim_meetings_minutes_id_seq', 1, false);
          public          bcnregional    false    324            k           0    0 %   decidim_meetings_registrations_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.decidim_meetings_registrations_id_seq', 1, false);
          public          bcnregional    false    322            l           0    0 &   decidim_messaging_conversations_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.decidim_messaging_conversations_id_seq', 1, false);
          public          bcnregional    false    236            m           0    0 !   decidim_messaging_messages_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.decidim_messaging_messages_id_seq', 1, false);
          public          bcnregional    false    240            n           0    0 '   decidim_messaging_participations_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.decidim_messaging_participations_id_seq', 1, false);
          public          bcnregional    false    238            o           0    0 !   decidim_messaging_receipts_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.decidim_messaging_receipts_id_seq', 1, false);
          public          bcnregional    false    244            p           0    0    decidim_metrics_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.decidim_metrics_id_seq', 5413, true);
          public          bcnregional    false    270            q           0    0    decidim_moderations_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.decidim_moderations_id_seq', 1, false);
          public          bcnregional    false    224            r           0    0    decidim_newsletters_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.decidim_newsletters_id_seq', 1, false);
          public          bcnregional    false    220            s           0    0    decidim_notifications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.decidim_notifications_id_seq', 396, true);
          public          bcnregional    false    234            t           0    0    decidim_organizations_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.decidim_organizations_id_seq', 2, true);
          public          bcnregional    false    202            u           0    0    decidim_pages_pages_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.decidim_pages_pages_id_seq', 7, true);
          public          bcnregional    false    314            v           0    0 +   decidim_participatory_process_groups_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.decidim_participatory_process_groups_id_seq', 1, false);
          public          bcnregional    false    306            w           0    0 *   decidim_participatory_process_steps_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.decidim_participatory_process_steps_id_seq', 9, true);
          public          bcnregional    false    302            x           0    0 /   decidim_participatory_process_user_roles_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.decidim_participatory_process_user_roles_id_seq', 1, false);
          public          bcnregional    false    288            y           0    0 &   decidim_participatory_processes_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.decidim_participatory_processes_id_seq', 2, true);
          public          bcnregional    false    300            z           0    0 (   decidim_participatory_space_links_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.decidim_participatory_space_links_id_seq', 1, false);
          public          bcnregional    false    258            {           0    0 0   decidim_participatory_space_private_users_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.decidim_participatory_space_private_users_id_seq', 1, false);
          public          bcnregional    false    250            |           0    0 ?   decidim_proposals_collaborative_draft_collaborator_reque_id_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.decidim_proposals_collaborative_draft_collaborator_reque_id_seq', 1, false);
          public          bcnregional    false    342            }           0    0 -   decidim_proposals_collaborative_drafts_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.decidim_proposals_collaborative_drafts_id_seq', 1, false);
          public          bcnregional    false    340            ~           0    0 ,   decidim_proposals_participatory_texts_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.decidim_proposals_participatory_texts_id_seq', 1, false);
          public          bcnregional    false    344                       0    0 .   decidim_proposals_proposal_endorsements_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.decidim_proposals_proposal_endorsements_id_seq', 2, true);
          public          bcnregional    false    336            �           0    0 '   decidim_proposals_proposal_notes_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.decidim_proposals_proposal_notes_id_seq', 1, false);
          public          bcnregional    false    338            �           0    0 '   decidim_proposals_proposal_votes_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.decidim_proposals_proposal_votes_id_seq', 37, true);
          public          bcnregional    false    334            �           0    0 "   decidim_proposals_proposals_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.decidim_proposals_proposals_id_seq', 135, true);
          public          bcnregional    false    332            �           0    0    decidim_reports_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.decidim_reports_id_seq', 1, false);
          public          bcnregional    false    222            �           0    0    decidim_resource_links_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.decidim_resource_links_id_seq', 1, false);
          public          bcnregional    false    214            �           0    0 #   decidim_resource_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.decidim_resource_permissions_id_seq', 1, false);
          public          bcnregional    false    268            �           0    0    decidim_scope_types_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.decidim_scope_types_id_seq', 1, false);
          public          bcnregional    false    226            �           0    0    decidim_scopes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.decidim_scopes_id_seq', 5, true);
          public          bcnregional    false    212            �           0    0 #   decidim_searchable_resources_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.decidim_searchable_resources_id_seq', 356, true);
          public          bcnregional    false    252            �           0    0 $   decidim_sortitions_sortitions_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.decidim_sortitions_sortitions_id_seq', 1, false);
          public          bcnregional    false    370            �           0    0 !   decidim_static_page_topics_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.decidim_static_page_topics_id_seq', 6, true);
          public          bcnregional    false    282            �           0    0    decidim_static_pages_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.decidim_static_pages_id_seq', 20, true);
          public          bcnregional    false    206            �           0    0 ,   decidim_surveys_survey_answer_choices_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.decidim_surveys_survey_answer_choices_id_seq', 1, false);
          public          bcnregional    false    360            �           0    0 ,   decidim_surveys_survey_answer_options_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.decidim_surveys_survey_answer_options_id_seq', 1, false);
          public          bcnregional    false    358            �           0    0 %   decidim_surveys_survey_answers_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.decidim_surveys_survey_answers_id_seq', 1, false);
          public          bcnregional    false    356            �           0    0 '   decidim_surveys_survey_questions_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.decidim_surveys_survey_questions_id_seq', 1, false);
          public          bcnregional    false    354            �           0    0    decidim_surveys_surveys_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.decidim_surveys_surveys_id_seq', 1, false);
          public          bcnregional    false    352            �           0    0    decidim_system_admins_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.decidim_system_admins_id_seq', 1, true);
          public          bcnregional    false    286            �           0    0 %   decidim_user_group_memberships_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.decidim_user_group_memberships_id_seq', 1, true);
          public          bcnregional    false    218            �           0    0    decidim_users_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.decidim_users_id_seq', 43, true);
          public          bcnregional    false    200            �           0    0 %   decidim_verifications_csv_data_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.decidim_verifications_csv_data_id_seq', 1, false);
          public          bcnregional    false    374            �           0    0    oauth_access_grants_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.oauth_access_grants_id_seq', 1, false);
          public          bcnregional    false    262            �           0    0    oauth_access_tokens_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.oauth_access_tokens_id_seq', 1, false);
          public          bcnregional    false    264            �           0    0    oauth_applications_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.oauth_applications_id_seq', 1, true);
          public          bcnregional    false    260            �           0    0    versions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.versions_id_seq', 1117, true);
          public          bcnregional    false    242                       2606    16421 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public            bcnregional    false    199            �           2606    18768 B   decidim_accountability_results decidim_accountability_results_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_accountability_results
    ADD CONSTRAINT decidim_accountability_results_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.decidim_accountability_results DROP CONSTRAINT decidim_accountability_results_pkey;
       public            bcnregional    false    365            �           2606    18756 D   decidim_accountability_statuses decidim_accountability_statuses_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_accountability_statuses
    ADD CONSTRAINT decidim_accountability_statuses_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.decidim_accountability_statuses DROP CONSTRAINT decidim_accountability_statuses_pkey;
       public            bcnregional    false    363            �           2606    18784 T   decidim_accountability_timeline_entries decidim_accountability_timeline_entries_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_accountability_timeline_entries
    ADD CONSTRAINT decidim_accountability_timeline_entries_pkey PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public.decidim_accountability_timeline_entries DROP CONSTRAINT decidim_accountability_timeline_entries_pkey;
       public            bcnregional    false    367                       2606    17039 ,   decidim_action_logs decidim_action_logs_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.decidim_action_logs
    ADD CONSTRAINT decidim_action_logs_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.decidim_action_logs DROP CONSTRAINT decidim_action_logs_pkey;
       public            bcnregional    false    249            �           2606    17267 *   decidim_amendments decidim_amendments_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.decidim_amendments
    ADD CONSTRAINT decidim_amendments_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.decidim_amendments DROP CONSTRAINT decidim_amendments_pkey;
       public            bcnregional    false    273            �           2606    17084 *   decidim_area_types decidim_area_types_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.decidim_area_types
    ADD CONSTRAINT decidim_area_types_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.decidim_area_types DROP CONSTRAINT decidim_area_types_pkey;
       public            bcnregional    false    255            �           2606    17101     decidim_areas decidim_areas_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.decidim_areas
    ADD CONSTRAINT decidim_areas_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.decidim_areas DROP CONSTRAINT decidim_areas_pkey;
       public            bcnregional    false    257                       2606    17832 *   decidim_assemblies decidim_assemblies_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.decidim_assemblies
    ADD CONSTRAINT decidim_assemblies_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.decidim_assemblies DROP CONSTRAINT decidim_assemblies_pkey;
       public            bcnregional    false    309                       2606    18079 6   decidim_assembly_members decidim_assembly_members_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.decidim_assembly_members
    ADD CONSTRAINT decidim_assembly_members_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.decidim_assembly_members DROP CONSTRAINT decidim_assembly_members_pkey;
       public            bcnregional    false    313            	           2606    17855 <   decidim_assembly_user_roles decidim_assembly_user_roles_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.decidim_assembly_user_roles
    ADD CONSTRAINT decidim_assembly_user_roles_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.decidim_assembly_user_roles DROP CONSTRAINT decidim_assembly_user_roles_pkey;
       public            bcnregional    false    311            }           2606    17006 B   decidim_attachment_collections decidim_attachment_collections_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_attachment_collections
    ADD CONSTRAINT decidim_attachment_collections_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.decidim_attachment_collections DROP CONSTRAINT decidim_attachment_collections_pkey;
       public            bcnregional    false    247            �           2606    17720 ,   decidim_attachments decidim_attachments_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.decidim_attachments
    ADD CONSTRAINT decidim_attachments_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.decidim_attachments DROP CONSTRAINT decidim_attachments_pkey;
       public            bcnregional    false    305            $           2606    16496 2   decidim_authorizations decidim_authorizations_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.decidim_authorizations
    ADD CONSTRAINT decidim_authorizations_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.decidim_authorizations DROP CONSTRAINT decidim_authorizations_pkey;
       public            bcnregional    false    205            �           2606    18856 ,   decidim_blogs_posts decidim_blogs_posts_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.decidim_blogs_posts
    ADD CONSTRAINT decidim_blogs_posts_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.decidim_blogs_posts DROP CONSTRAINT decidim_blogs_posts_pkey;
       public            bcnregional    false    373            m           2606    18649 :   decidim_budgets_line_items decidim_budgets_line_items_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.decidim_budgets_line_items
    ADD CONSTRAINT decidim_budgets_line_items_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.decidim_budgets_line_items DROP CONSTRAINT decidim_budgets_line_items_pkey;
       public            bcnregional    false    351            h           2606    18638 2   decidim_budgets_orders decidim_budgets_orders_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.decidim_budgets_orders
    ADD CONSTRAINT decidim_budgets_orders_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.decidim_budgets_orders DROP CONSTRAINT decidim_budgets_orders_pkey;
       public            bcnregional    false    349            c           2606    18627 6   decidim_budgets_projects decidim_budgets_projects_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.decidim_budgets_projects
    ADD CONSTRAINT decidim_budgets_projects_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.decidim_budgets_projects DROP CONSTRAINT decidim_budgets_projects_pkey;
       public            bcnregional    false    347            /           2606    16543 *   decidim_categories decidim_categories_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.decidim_categories
    ADD CONSTRAINT decidim_categories_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.decidim_categories DROP CONSTRAINT decidim_categories_pkey;
       public            bcnregional    false    211            ]           2606    16825 4   decidim_categorizations decidim_categorizations_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.decidim_categorizations
    ADD CONSTRAINT decidim_categorizations_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.decidim_categorizations DROP CONSTRAINT decidim_categorizations_pkey;
       public            bcnregional    false    229            �           2606    17207 0   decidim_coauthorships decidim_coauthorships_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.decidim_coauthorships
    ADD CONSTRAINT decidim_coauthorships_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.decidim_coauthorships DROP CONSTRAINT decidim_coauthorships_pkey;
       public            bcnregional    false    267                       2606    18148 B   decidim_comments_comment_votes decidim_comments_comment_votes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_comments_comment_votes
    ADD CONSTRAINT decidim_comments_comment_votes_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.decidim_comments_comment_votes DROP CONSTRAINT decidim_comments_comment_votes_pkey;
       public            bcnregional    false    319                       2606    18115 8   decidim_comments_comments decidim_comments_comments_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.decidim_comments_comments
    ADD CONSTRAINT decidim_comments_comments_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.decidim_comments_comments DROP CONSTRAINT decidim_comments_comments_pkey;
       public            bcnregional    false    317            ,           2606    16531 *   decidim_components decidim_components_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.decidim_components
    ADD CONSTRAINT decidim_components_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.decidim_components DROP CONSTRAINT decidim_components_pkey;
       public            bcnregional    false    209            �           2606    17282 2   decidim_content_blocks decidim_content_blocks_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.decidim_content_blocks
    ADD CONSTRAINT decidim_content_blocks_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.decidim_content_blocks DROP CONSTRAINT decidim_content_blocks_pkey;
       public            bcnregional    false    275            �           2606    17451 F   decidim_contextual_help_sections decidim_contextual_help_sections_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_contextual_help_sections
    ADD CONSTRAINT decidim_contextual_help_sections_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.decidim_contextual_help_sections DROP CONSTRAINT decidim_contextual_help_sections_pkey;
       public            bcnregional    false    285            �           2606    17381 H   decidim_continuity_badge_statuses decidim_continuity_badge_statuses_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_continuity_badge_statuses
    ADD CONSTRAINT decidim_continuity_badge_statuses_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.decidim_continuity_badge_statuses DROP CONSTRAINT decidim_continuity_badge_statuses_pkey;
       public            bcnregional    false    281            �           2606    18821 4   decidim_debates_debates decidim_debates_debates_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.decidim_debates_debates
    ADD CONSTRAINT decidim_debates_debates_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.decidim_debates_debates DROP CONSTRAINT decidim_debates_debates_pkey;
       public            bcnregional    false    369            d           2606    16901 $   decidim_follows decidim_follows_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.decidim_follows
    ADD CONSTRAINT decidim_follows_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.decidim_follows DROP CONSTRAINT decidim_follows_pkey;
       public            bcnregional    false    233            �           2606    17649 >   decidim_forms_answer_choices decidim_forms_answer_choices_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.decidim_forms_answer_choices
    ADD CONSTRAINT decidim_forms_answer_choices_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.decidim_forms_answer_choices DROP CONSTRAINT decidim_forms_answer_choices_pkey;
       public            bcnregional    false    299            �           2606    17637 >   decidim_forms_answer_options decidim_forms_answer_options_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.decidim_forms_answer_options
    ADD CONSTRAINT decidim_forms_answer_options_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.decidim_forms_answer_options DROP CONSTRAINT decidim_forms_answer_options_pkey;
       public            bcnregional    false    297            �           2606    17623 0   decidim_forms_answers decidim_forms_answers_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.decidim_forms_answers
    ADD CONSTRAINT decidim_forms_answers_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.decidim_forms_answers DROP CONSTRAINT decidim_forms_answers_pkey;
       public            bcnregional    false    295            �           2606    17598 >   decidim_forms_questionnaires decidim_forms_questionnaires_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.decidim_forms_questionnaires
    ADD CONSTRAINT decidim_forms_questionnaires_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.decidim_forms_questionnaires DROP CONSTRAINT decidim_forms_questionnaires_pkey;
       public            bcnregional    false    291            �           2606    17610 4   decidim_forms_questions decidim_forms_questions_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.decidim_forms_questions
    ADD CONSTRAINT decidim_forms_questions_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.decidim_forms_questions DROP CONSTRAINT decidim_forms_questions_pkey;
       public            bcnregional    false    293            �           2606    17312 H   decidim_gamification_badge_scores decidim_gamification_badge_scores_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_gamification_badge_scores
    ADD CONSTRAINT decidim_gamification_badge_scores_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.decidim_gamification_badge_scores DROP CONSTRAINT decidim_gamification_badge_scores_pkey;
       public            bcnregional    false    279            �           2606    17298 &   decidim_hashtags decidim_hashtags_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.decidim_hashtags
    ADD CONSTRAINT decidim_hashtags_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.decidim_hashtags DROP CONSTRAINT decidim_hashtags_pkey;
       public            bcnregional    false    277            ?           2606    16597 *   decidim_identities decidim_identities_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.decidim_identities
    ADD CONSTRAINT decidim_identities_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.decidim_identities DROP CONSTRAINT decidim_identities_pkey;
       public            bcnregional    false    217            `           2606    16872 :   decidim_impersonation_logs decidim_impersonation_logs_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.decidim_impersonation_logs
    ADD CONSTRAINT decidim_impersonation_logs_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.decidim_impersonation_logs DROP CONSTRAINT decidim_impersonation_logs_pkey;
       public            bcnregional    false    231            2           2606    18286 @   decidim_meetings_agenda_items decidim_meetings_agenda_items_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.decidim_meetings_agenda_items
    ADD CONSTRAINT decidim_meetings_agenda_items_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.decidim_meetings_agenda_items DROP CONSTRAINT decidim_meetings_agenda_items_pkey;
       public            bcnregional    false    329            /           2606    18274 6   decidim_meetings_agendas decidim_meetings_agendas_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.decidim_meetings_agendas
    ADD CONSTRAINT decidim_meetings_agendas_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.decidim_meetings_agendas DROP CONSTRAINT decidim_meetings_agendas_pkey;
       public            bcnregional    false    327            6           2606    18296 6   decidim_meetings_invites decidim_meetings_invites_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.decidim_meetings_invites
    ADD CONSTRAINT decidim_meetings_invites_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.decidim_meetings_invites DROP CONSTRAINT decidim_meetings_invites_pkey;
       public            bcnregional    false    331            !           2606    18168 8   decidim_meetings_meetings decidim_meetings_meetings_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.decidim_meetings_meetings
    ADD CONSTRAINT decidim_meetings_meetings_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.decidim_meetings_meetings DROP CONSTRAINT decidim_meetings_meetings_pkey;
       public            bcnregional    false    321            ,           2606    18250 6   decidim_meetings_minutes decidim_meetings_minutes_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.decidim_meetings_minutes
    ADD CONSTRAINT decidim_meetings_minutes_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.decidim_meetings_minutes DROP CONSTRAINT decidim_meetings_minutes_pkey;
       public            bcnregional    false    325            '           2606    18202 B   decidim_meetings_registrations decidim_meetings_registrations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_meetings_registrations
    ADD CONSTRAINT decidim_meetings_registrations_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.decidim_meetings_registrations DROP CONSTRAINT decidim_meetings_registrations_pkey;
       public            bcnregional    false    323            k           2606    16949 D   decidim_messaging_conversations decidim_messaging_conversations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_messaging_conversations
    ADD CONSTRAINT decidim_messaging_conversations_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.decidim_messaging_conversations DROP CONSTRAINT decidim_messaging_conversations_pkey;
       public            bcnregional    false    237            q           2606    16970 :   decidim_messaging_messages decidim_messaging_messages_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.decidim_messaging_messages
    ADD CONSTRAINT decidim_messaging_messages_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.decidim_messaging_messages DROP CONSTRAINT decidim_messaging_messages_pkey;
       public            bcnregional    false    241            m           2606    16957 F   decidim_messaging_participations decidim_messaging_participations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_messaging_participations
    ADD CONSTRAINT decidim_messaging_participations_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.decidim_messaging_participations DROP CONSTRAINT decidim_messaging_participations_pkey;
       public            bcnregional    false    239            x           2606    16992 :   decidim_messaging_receipts decidim_messaging_receipts_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.decidim_messaging_receipts
    ADD CONSTRAINT decidim_messaging_receipts_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.decidim_messaging_receipts DROP CONSTRAINT decidim_messaging_receipts_pkey;
       public            bcnregional    false    245            �           2606    17250 $   decidim_metrics decidim_metrics_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.decidim_metrics
    ADD CONSTRAINT decidim_metrics_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.decidim_metrics DROP CONSTRAINT decidim_metrics_pkey;
       public            bcnregional    false    271            U           2606    16747 ,   decidim_moderations decidim_moderations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.decidim_moderations
    ADD CONSTRAINT decidim_moderations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.decidim_moderations DROP CONSTRAINT decidim_moderations_pkey;
       public            bcnregional    false    225            J           2606    16704 ,   decidim_newsletters decidim_newsletters_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.decidim_newsletters
    ADD CONSTRAINT decidim_newsletters_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.decidim_newsletters DROP CONSTRAINT decidim_newsletters_pkey;
       public            bcnregional    false    221            h           2606    16915 0   decidim_notifications decidim_notifications_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.decidim_notifications
    ADD CONSTRAINT decidim_notifications_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.decidim_notifications DROP CONSTRAINT decidim_notifications_pkey;
       public            bcnregional    false    235                        2606    16449 0   decidim_organizations decidim_organizations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.decidim_organizations
    ADD CONSTRAINT decidim_organizations_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.decidim_organizations DROP CONSTRAINT decidim_organizations_pkey;
       public            bcnregional    false    203                       2606    18094 ,   decidim_pages_pages decidim_pages_pages_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.decidim_pages_pages
    ADD CONSTRAINT decidim_pages_pages_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.decidim_pages_pages DROP CONSTRAINT decidim_pages_pages_pkey;
       public            bcnregional    false    315                       2606    17739 N   decidim_participatory_process_groups decidim_participatory_process_groups_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_participatory_process_groups
    ADD CONSTRAINT decidim_participatory_process_groups_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.decidim_participatory_process_groups DROP CONSTRAINT decidim_participatory_process_groups_pkey;
       public            bcnregional    false    307            �           2606    17688 L   decidim_participatory_process_steps decidim_participatory_process_steps_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_participatory_process_steps
    ADD CONSTRAINT decidim_participatory_process_steps_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.decidim_participatory_process_steps DROP CONSTRAINT decidim_participatory_process_steps_pkey;
       public            bcnregional    false    303            �           2606    17582 V   decidim_participatory_process_user_roles decidim_participatory_process_user_roles_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_participatory_process_user_roles
    ADD CONSTRAINT decidim_participatory_process_user_roles_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.decidim_participatory_process_user_roles DROP CONSTRAINT decidim_participatory_process_user_roles_pkey;
       public            bcnregional    false    289            �           2606    17662 D   decidim_participatory_processes decidim_participatory_processes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_participatory_processes
    ADD CONSTRAINT decidim_participatory_processes_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.decidim_participatory_processes DROP CONSTRAINT decidim_participatory_processes_pkey;
       public            bcnregional    false    301            �           2606    17125 H   decidim_participatory_space_links decidim_participatory_space_links_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_participatory_space_links
    ADD CONSTRAINT decidim_participatory_space_links_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.decidim_participatory_space_links DROP CONSTRAINT decidim_participatory_space_links_pkey;
       public            bcnregional    false    259            �           2606    17056 X   decidim_participatory_space_private_users decidim_participatory_space_private_users_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_participatory_space_private_users
    ADD CONSTRAINT decidim_participatory_space_private_users_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.decidim_participatory_space_private_users DROP CONSTRAINT decidim_participatory_space_private_users_pkey;
       public            bcnregional    false    251            \           2606    18560 {   decidim_proposals_collaborative_draft_collaborator_requests decidim_proposals_collaborative_draft_collaborator_request_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_proposals_collaborative_draft_collaborator_requests
    ADD CONSTRAINT decidim_proposals_collaborative_draft_collaborator_request_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.decidim_proposals_collaborative_draft_collaborator_requests DROP CONSTRAINT decidim_proposals_collaborative_draft_collaborator_request_pkey;
       public            bcnregional    false    343            Y           2606    18528 R   decidim_proposals_collaborative_drafts decidim_proposals_collaborative_drafts_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_proposals_collaborative_drafts
    ADD CONSTRAINT decidim_proposals_collaborative_drafts_pkey PRIMARY KEY (id);
 |   ALTER TABLE ONLY public.decidim_proposals_collaborative_drafts DROP CONSTRAINT decidim_proposals_collaborative_drafts_pkey;
       public            bcnregional    false    341            `           2606    18587 P   decidim_proposals_participatory_texts decidim_proposals_participatory_texts_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_proposals_participatory_texts
    ADD CONSTRAINT decidim_proposals_participatory_texts_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.decidim_proposals_participatory_texts DROP CONSTRAINT decidim_proposals_participatory_texts_pkey;
       public            bcnregional    false    345            K           2606    18397 T   decidim_proposals_proposal_endorsements decidim_proposals_proposal_endorsements_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_proposals_proposal_endorsements
    ADD CONSTRAINT decidim_proposals_proposal_endorsements_pkey PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public.decidim_proposals_proposal_endorsements DROP CONSTRAINT decidim_proposals_proposal_endorsements_pkey;
       public            bcnregional    false    337            Q           2606    18494 F   decidim_proposals_proposal_notes decidim_proposals_proposal_notes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_proposals_proposal_notes
    ADD CONSTRAINT decidim_proposals_proposal_notes_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.decidim_proposals_proposal_notes DROP CONSTRAINT decidim_proposals_proposal_notes_pkey;
       public            bcnregional    false    339            G           2606    18336 F   decidim_proposals_proposal_votes decidim_proposals_proposal_votes_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_proposals_proposal_votes
    ADD CONSTRAINT decidim_proposals_proposal_votes_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.decidim_proposals_proposal_votes DROP CONSTRAINT decidim_proposals_proposal_votes_pkey;
       public            bcnregional    false    335            <           2606    18324 <   decidim_proposals_proposals decidim_proposals_proposals_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.decidim_proposals_proposals
    ADD CONSTRAINT decidim_proposals_proposals_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.decidim_proposals_proposals DROP CONSTRAINT decidim_proposals_proposals_pkey;
       public            bcnregional    false    333            P           2606    16732 $   decidim_reports decidim_reports_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.decidim_reports
    ADD CONSTRAINT decidim_reports_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.decidim_reports DROP CONSTRAINT decidim_reports_pkey;
       public            bcnregional    false    223            :           2606    16583 2   decidim_resource_links decidim_resource_links_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.decidim_resource_links
    ADD CONSTRAINT decidim_resource_links_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.decidim_resource_links DROP CONSTRAINT decidim_resource_links_pkey;
       public            bcnregional    false    215            �           2606    17238 >   decidim_resource_permissions decidim_resource_permissions_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.decidim_resource_permissions
    ADD CONSTRAINT decidim_resource_permissions_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.decidim_resource_permissions DROP CONSTRAINT decidim_resource_permissions_pkey;
       public            bcnregional    false    269            Y           2606    16780 ,   decidim_scope_types decidim_scope_types_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.decidim_scope_types
    ADD CONSTRAINT decidim_scope_types_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.decidim_scope_types DROP CONSTRAINT decidim_scope_types_pkey;
       public            bcnregional    false    227            3           2606    16556 "   decidim_scopes decidim_scopes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.decidim_scopes
    ADD CONSTRAINT decidim_scopes_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.decidim_scopes DROP CONSTRAINT decidim_scopes_pkey;
       public            bcnregional    false    213            �           2606    17069 >   decidim_searchable_resources decidim_searchable_resources_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.decidim_searchable_resources
    ADD CONSTRAINT decidim_searchable_resources_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.decidim_searchable_resources DROP CONSTRAINT decidim_searchable_resources_pkey;
       public            bcnregional    false    253            �           2606    18835 @   decidim_sortitions_sortitions decidim_sortitions_sortitions_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.decidim_sortitions_sortitions
    ADD CONSTRAINT decidim_sortitions_sortitions_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.decidim_sortitions_sortitions DROP CONSTRAINT decidim_sortitions_sortitions_pkey;
       public            bcnregional    false    371            �           2606    17418 :   decidim_static_page_topics decidim_static_page_topics_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.decidim_static_page_topics
    ADD CONSTRAINT decidim_static_page_topics_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.decidim_static_page_topics DROP CONSTRAINT decidim_static_page_topics_pkey;
       public            bcnregional    false    283            (           2606    16514 .   decidim_static_pages decidim_static_pages_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.decidim_static_pages
    ADD CONSTRAINT decidim_static_pages_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.decidim_static_pages DROP CONSTRAINT decidim_static_pages_pkey;
       public            bcnregional    false    207                       2606    18743 P   decidim_surveys_survey_answer_choices decidim_surveys_survey_answer_choices_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_surveys_survey_answer_choices
    ADD CONSTRAINT decidim_surveys_survey_answer_choices_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.decidim_surveys_survey_answer_choices DROP CONSTRAINT decidim_surveys_survey_answer_choices_pkey;
       public            bcnregional    false    361            |           2606    18731 P   decidim_surveys_survey_answer_options decidim_surveys_survey_answer_options_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_surveys_survey_answer_options
    ADD CONSTRAINT decidim_surveys_survey_answer_options_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.decidim_surveys_survey_answer_options DROP CONSTRAINT decidim_surveys_survey_answer_options_pkey;
       public            bcnregional    false    359            w           2606    18697 B   decidim_surveys_survey_answers decidim_surveys_survey_answers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_surveys_survey_answers
    ADD CONSTRAINT decidim_surveys_survey_answers_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.decidim_surveys_survey_answers DROP CONSTRAINT decidim_surveys_survey_answers_pkey;
       public            bcnregional    false    357            t           2606    18684 F   decidim_surveys_survey_questions decidim_surveys_survey_questions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_surveys_survey_questions
    ADD CONSTRAINT decidim_surveys_survey_questions_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.decidim_surveys_survey_questions DROP CONSTRAINT decidim_surveys_survey_questions_pkey;
       public            bcnregional    false    355            q           2606    18672 4   decidim_surveys_surveys decidim_surveys_surveys_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.decidim_surveys_surveys
    ADD CONSTRAINT decidim_surveys_surveys_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.decidim_surveys_surveys DROP CONSTRAINT decidim_surveys_surveys_pkey;
       public            bcnregional    false    353            �           2606    17569 0   decidim_system_admins decidim_system_admins_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.decidim_system_admins
    ADD CONSTRAINT decidim_system_admins_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.decidim_system_admins DROP CONSTRAINT decidim_system_admins_pkey;
       public            bcnregional    false    287            E           2606    16618 B   decidim_user_group_memberships decidim_user_group_memberships_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_user_group_memberships
    ADD CONSTRAINT decidim_user_group_memberships_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.decidim_user_group_memberships DROP CONSTRAINT decidim_user_group_memberships_pkey;
       public            bcnregional    false    219                       2606    16435     decidim_users decidim_users_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.decidim_users
    ADD CONSTRAINT decidim_users_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.decidim_users DROP CONSTRAINT decidim_users_pkey;
       public            bcnregional    false    201            �           2606    19225 B   decidim_verifications_csv_data decidim_verifications_csv_data_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.decidim_verifications_csv_data
    ADD CONSTRAINT decidim_verifications_csv_data_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.decidim_verifications_csv_data DROP CONSTRAINT decidim_verifications_csv_data_pkey;
       public            bcnregional    false    375            �           2606    17158 ,   oauth_access_grants oauth_access_grants_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.oauth_access_grants DROP CONSTRAINT oauth_access_grants_pkey;
       public            bcnregional    false    263            �           2606    17177 ,   oauth_access_tokens oauth_access_tokens_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.oauth_access_tokens DROP CONSTRAINT oauth_access_tokens_pkey;
       public            bcnregional    false    265            �           2606    17140 *   oauth_applications oauth_applications_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.oauth_applications DROP CONSTRAINT oauth_applications_pkey;
       public            bcnregional    false    261                       2606    16413 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            bcnregional    false    198            v           2606    16983    versions versions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.versions DROP CONSTRAINT versions_pkey;
       public            bcnregional    false    243            �           1259    18769 +   decidim_accountability_results_on_parent_id    INDEX     {   CREATE INDEX decidim_accountability_results_on_parent_id ON public.decidim_accountability_results USING btree (parent_id);
 ?   DROP INDEX public.decidim_accountability_results_on_parent_id;
       public            bcnregional    false    365            �           1259    18770 +   decidim_accountability_results_on_status_id    INDEX     �   CREATE INDEX decidim_accountability_results_on_status_id ON public.decidim_accountability_results USING btree (decidim_accountability_status_id);
 ?   DROP INDEX public.decidim_accountability_results_on_status_id;
       public            bcnregional    false    365                       1259    18043 *   decidim_assemblies_assemblies_on_parent_id    INDEX     n   CREATE INDEX decidim_assemblies_assemblies_on_parent_id ON public.decidim_assemblies USING btree (parent_id);
 >   DROP INDEX public.decidim_assemblies_assemblies_on_parent_id;
       public            bcnregional    false    309            {           1259    17007 9   decidim_attachment_collections_collection_for_id_and_type    INDEX     �   CREATE INDEX decidim_attachment_collections_collection_for_id_and_type ON public.decidim_attachment_collections USING btree (collection_for_type, collection_for_id);
 M   DROP INDEX public.decidim_attachment_collections_collection_for_id_and_type;
       public            bcnregional    false    247    247            k           1259    18652 /   decidim_budgets_line_items_order_project_unique    INDEX     �   CREATE UNIQUE INDEX decidim_budgets_line_items_order_project_unique ON public.decidim_budgets_line_items USING btree (decidim_order_id, decidim_project_id);
 C   DROP INDEX public.decidim_budgets_line_items_order_project_unique;
       public            bcnregional    false    351    351            f           1259    18641 +   decidim_budgets_order_user_component_unique    INDEX     �   CREATE UNIQUE INDEX decidim_budgets_order_user_component_unique ON public.decidim_budgets_orders USING btree (decidim_user_id, decidim_component_id);
 ?   DROP INDEX public.decidim_budgets_order_user_component_unique;
       public            bcnregional    false    349    349            [           1259    16832 1   decidim_categorizations_categorizable_id_and_type    INDEX     �   CREATE INDEX decidim_categorizations_categorizable_id_and_type ON public.decidim_categorizations USING btree (categorizable_type, categorizable_id);
 E   DROP INDEX public.decidim_categorizations_categorizable_id_and_type;
       public            bcnregional    false    229    229                       1259    18117    decidim_comments_comment_author    INDEX     r   CREATE INDEX decidim_comments_comment_author ON public.decidim_comments_comments USING btree (decidim_author_id);
 3   DROP INDEX public.decidim_comments_comment_author;
       public            bcnregional    false    317                       1259    18116 $   decidim_comments_comment_commentable    INDEX     �   CREATE INDEX decidim_comments_comment_commentable ON public.decidim_comments_comments USING btree (decidim_commentable_type, decidim_commentable_id);
 8   DROP INDEX public.decidim_comments_comment_commentable;
       public            bcnregional    false    317    317                       1259    18152 )   decidim_comments_comment_root_commentable    INDEX     �   CREATE INDEX decidim_comments_comment_root_commentable ON public.decidim_comments_comments USING btree (decidim_root_commentable_type, decidim_root_commentable_id);
 =   DROP INDEX public.decidim_comments_comment_root_commentable;
       public            bcnregional    false    317    317                       1259    18150 $   decidim_comments_comment_vote_author    INDEX     |   CREATE INDEX decidim_comments_comment_vote_author ON public.decidim_comments_comment_votes USING btree (decidim_author_id);
 8   DROP INDEX public.decidim_comments_comment_vote_author;
       public            bcnregional    false    319                       1259    18149 %   decidim_comments_comment_vote_comment    INDEX     ~   CREATE INDEX decidim_comments_comment_vote_comment ON public.decidim_comments_comment_votes USING btree (decidim_comment_id);
 9   DROP INDEX public.decidim_comments_comment_vote_comment;
       public            bcnregional    false    319                       1259    18151 3   decidim_comments_comment_vote_comment_author_unique    INDEX     �   CREATE UNIQUE INDEX decidim_comments_comment_vote_comment_author_unique ON public.decidim_comments_comment_votes USING btree (decidim_comment_id, decidim_author_id);
 G   DROP INDEX public.decidim_comments_comment_vote_comment_author_unique;
       public            bcnregional    false    319    319            �           1259    17382 #   decidim_continuity_statuses_subject    INDEX     �   CREATE INDEX decidim_continuity_statuses_subject ON public.decidim_continuity_badge_statuses USING btree (subject_type, subject_id);
 7   DROP INDEX public.decidim_continuity_statuses_subject;
       public            bcnregional    false    281    281            C           1259    17397 .   decidim_group_membership_one_creator_per_group    INDEX     �   CREATE UNIQUE INDEX decidim_group_membership_one_creator_per_group ON public.decidim_user_group_memberships USING btree (role, decidim_user_group_id) WHERE ((role)::text = 'creator'::text);
 B   DROP INDEX public.decidim_group_membership_one_creator_per_group;
       public            bcnregional    false    219    219    219            @           1259    16769 3   decidim_identities_provider_uid_organization_unique    INDEX     �   CREATE UNIQUE INDEX decidim_identities_provider_uid_organization_unique ON public.decidim_identities USING btree (provider, uid, decidim_organization_id);
 G   DROP INDEX public.decidim_identities_provider_uid_organization_unique;
       public            bcnregional    false    217    217    217            (           1259    18205 2   decidim_meetings_registrations_user_meeting_unique    INDEX     �   CREATE UNIQUE INDEX decidim_meetings_registrations_user_meeting_unique ON public.decidim_meetings_registrations USING btree (decidim_user_id, decidim_meeting_id);
 F   DROP INDEX public.decidim_meetings_registrations_user_meeting_unique;
       public            bcnregional    false    323    323            R           1259    16751    decidim_moderations_hidden_at    INDEX     b   CREATE INDEX decidim_moderations_hidden_at ON public.decidim_moderations USING btree (hidden_at);
 1   DROP INDEX public.decidim_moderations_hidden_at;
       public            bcnregional    false    225            S           1259    16848 '   decidim_moderations_participatory_space    INDEX     �   CREATE INDEX decidim_moderations_participatory_space ON public.decidim_moderations USING btree (decidim_participatory_space_id, decidim_participatory_space_type);
 ;   DROP INDEX public.decidim_moderations_participatory_space;
       public            bcnregional    false    225    225            V           1259    16750     decidim_moderations_report_count    INDEX     h   CREATE INDEX decidim_moderations_report_count ON public.decidim_moderations USING btree (report_count);
 4   DROP INDEX public.decidim_moderations_report_count;
       public            bcnregional    false    225            W           1259    16749    decidim_moderations_reportable    INDEX     �   CREATE UNIQUE INDEX decidim_moderations_reportable ON public.decidim_moderations USING btree (decidim_reportable_type, decidim_reportable_id);
 2   DROP INDEX public.decidim_moderations_reportable;
       public            bcnregional    false    225    225            �           1259    17740 0   decidim_participatory_process_group_organization    INDEX     �   CREATE INDEX decidim_participatory_process_group_organization ON public.decidim_participatory_process_groups USING btree (decidim_organization_id);
 D   DROP INDEX public.decidim_participatory_process_group_organization;
       public            bcnregional    false    307            S           1259    18529 1   decidim_proposals_collaborative_draft_body_search    INDEX     �   CREATE INDEX decidim_proposals_collaborative_draft_body_search ON public.decidim_proposals_collaborative_drafts USING btree (body);
 E   DROP INDEX public.decidim_proposals_collaborative_draft_body_search;
       public            bcnregional    false    341            T           1259    18531 >   decidim_proposals_collaborative_drafts_on_decidim_component_id    INDEX     �   CREATE INDEX decidim_proposals_collaborative_drafts_on_decidim_component_id ON public.decidim_proposals_collaborative_drafts USING btree (decidim_component_id);
 R   DROP INDEX public.decidim_proposals_collaborative_drafts_on_decidim_component_id;
       public            bcnregional    false    341            U           1259    18532 :   decidim_proposals_collaborative_drafts_on_decidim_scope_id    INDEX     �   CREATE INDEX decidim_proposals_collaborative_drafts_on_decidim_scope_id ON public.decidim_proposals_collaborative_drafts USING btree (decidim_scope_id);
 N   DROP INDEX public.decidim_proposals_collaborative_drafts_on_decidim_scope_id;
       public            bcnregional    false    341            V           1259    18533 /   decidim_proposals_collaborative_drafts_on_state    INDEX     �   CREATE INDEX decidim_proposals_collaborative_drafts_on_state ON public.decidim_proposals_collaborative_drafts USING btree (state);
 C   DROP INDEX public.decidim_proposals_collaborative_drafts_on_state;
       public            bcnregional    false    341            W           1259    18530 4   decidim_proposals_collaborative_drafts_on_updated_at    INDEX     �   CREATE INDEX decidim_proposals_collaborative_drafts_on_updated_at ON public.decidim_proposals_collaborative_drafts USING btree (updated_at);
 H   DROP INDEX public.decidim_proposals_collaborative_drafts_on_updated_at;
       public            bcnregional    false    341            Z           1259    18534 3   decidim_proposals_collaborative_drafts_title_search    INDEX     �   CREATE INDEX decidim_proposals_collaborative_drafts_title_search ON public.decidim_proposals_collaborative_drafts USING btree (title);
 G   DROP INDEX public.decidim_proposals_collaborative_drafts_title_search;
       public            bcnregional    false    341            9           1259    19233 &   decidim_proposals_proposal_body_search    INDEX     s   CREATE INDEX decidim_proposals_proposal_body_search ON public.decidim_proposals_proposals USING btree (md5(body));
 :   DROP INDEX public.decidim_proposals_proposal_body_search;
       public            bcnregional    false    333    333            H           1259    18398 /   decidim_proposals_proposal_endorsement_proposal    INDEX     �   CREATE INDEX decidim_proposals_proposal_endorsement_proposal ON public.decidim_proposals_proposal_endorsements USING btree (decidim_proposal_id);
 C   DROP INDEX public.decidim_proposals_proposal_endorsement_proposal;
       public            bcnregional    false    337            I           1259    18400 1   decidim_proposals_proposal_endorsement_user_group    INDEX     �   CREATE INDEX decidim_proposals_proposal_endorsement_user_group ON public.decidim_proposals_proposal_endorsements USING btree (decidim_user_group_id);
 E   DROP INDEX public.decidim_proposals_proposal_endorsement_user_group;
       public            bcnregional    false    337            L           1259    18401 =   decidim_proposals_proposal_endorsmt_proposal_auth_ugroup_uniq    INDEX     �   CREATE UNIQUE INDEX decidim_proposals_proposal_endorsmt_proposal_auth_ugroup_uniq ON public.decidim_proposals_proposal_endorsements USING btree (decidim_proposal_id, decidim_author_id, COALESCE(decidim_user_group_id, ('-1'::integer)::bigint));
 Q   DROP INDEX public.decidim_proposals_proposal_endorsmt_proposal_auth_ugroup_uniq;
       public            bcnregional    false    337    337    337            N           1259    18496 &   decidim_proposals_proposal_note_author    INDEX     �   CREATE INDEX decidim_proposals_proposal_note_author ON public.decidim_proposals_proposal_notes USING btree (decidim_author_id);
 :   DROP INDEX public.decidim_proposals_proposal_note_author;
       public            bcnregional    false    339            O           1259    18495 (   decidim_proposals_proposal_note_proposal    INDEX     �   CREATE INDEX decidim_proposals_proposal_note_proposal ON public.decidim_proposals_proposal_notes USING btree (decidim_proposal_id);
 <   DROP INDEX public.decidim_proposals_proposal_note_proposal;
       public            bcnregional    false    339            :           1259    19232 '   decidim_proposals_proposal_title_search    INDEX     u   CREATE INDEX decidim_proposals_proposal_title_search ON public.decidim_proposals_proposals USING btree (md5(title));
 ;   DROP INDEX public.decidim_proposals_proposal_title_search;
       public            bcnregional    false    333    333            C           1259    18338 &   decidim_proposals_proposal_vote_author    INDEX     �   CREATE INDEX decidim_proposals_proposal_vote_author ON public.decidim_proposals_proposal_votes USING btree (decidim_author_id);
 :   DROP INDEX public.decidim_proposals_proposal_vote_author;
       public            bcnregional    false    335            D           1259    18337 (   decidim_proposals_proposal_vote_proposal    INDEX     �   CREATE INDEX decidim_proposals_proposal_vote_proposal ON public.decidim_proposals_proposal_votes USING btree (decidim_proposal_id);
 <   DROP INDEX public.decidim_proposals_proposal_vote_proposal;
       public            bcnregional    false    335            E           1259    18339 6   decidim_proposals_proposal_vote_proposal_author_unique    INDEX     �   CREATE UNIQUE INDEX decidim_proposals_proposal_vote_proposal_author_unique ON public.decidim_proposals_proposal_votes USING btree (decidim_proposal_id, decidim_author_id);
 J   DROP INDEX public.decidim_proposals_proposal_vote_proposal_author_unique;
       public            bcnregional    false    335    335            M           1259    16733    decidim_reports_moderation    INDEX     g   CREATE INDEX decidim_reports_moderation ON public.decidim_reports USING btree (decidim_moderation_id);
 .   DROP INDEX public.decidim_reports_moderation;
       public            bcnregional    false    223            N           1259    16735 &   decidim_reports_moderation_user_unique    INDEX     �   CREATE UNIQUE INDEX decidim_reports_moderation_user_unique ON public.decidim_reports USING btree (decidim_moderation_id, decidim_user_id);
 :   DROP INDEX public.decidim_reports_moderation_user_unique;
       public            bcnregional    false    223    223            Q           1259    16734    decidim_reports_user    INDEX     [   CREATE INDEX decidim_reports_user ON public.decidim_reports USING btree (decidim_user_id);
 (   DROP INDEX public.decidim_reports_user;
       public            bcnregional    false    223            F           1259    16621 8   decidim_user_group_memberships_unique_user_and_group_ids    INDEX     �   CREATE UNIQUE INDEX decidim_user_group_memberships_unique_user_and_group_ids ON public.decidim_user_group_memberships USING btree (decidim_user_id, decidim_user_group_id);
 L   DROP INDEX public.decidim_user_group_memberships_unique_user_and_group_ids;
       public            bcnregional    false    219    219            �           1259    17287 7   idx_dcdm_content_blocks_uniq_org_id_scope_manifest_name    INDEX     �   CREATE UNIQUE INDEX idx_dcdm_content_blocks_uniq_org_id_scope_manifest_name ON public.decidim_content_blocks USING btree (decidim_organization_id, scope, manifest_name);
 K   DROP INDEX public.idx_dcdm_content_blocks_uniq_org_id_scope_manifest_name;
       public            bcnregional    false    275    275    275            =           1259    18418 =   idx_decidim_proposals_proposals_on_proposal_endorsemnts_count    INDEX     �   CREATE INDEX idx_decidim_proposals_proposals_on_proposal_endorsemnts_count ON public.decidim_proposals_proposals USING btree (proposal_endorsements_count);
 Q   DROP INDEX public.idx_decidim_proposals_proposals_on_proposal_endorsemnts_count;
       public            bcnregional    false    333            a           1259    18588 /   idx_participatory_texts_on_decidim_component_id    INDEX     �   CREATE INDEX idx_participatory_texts_on_decidim_component_id ON public.decidim_proposals_participatory_texts USING btree (decidim_component_id);
 C   DROP INDEX public.idx_participatory_texts_on_decidim_component_id;
       public            bcnregional    false    345            �           1259    17042 !   index_action_logs_on_component_id    INDEX     q   CREATE INDEX index_action_logs_on_component_id ON public.decidim_action_logs USING btree (decidim_component_id);
 5   DROP INDEX public.index_action_logs_on_component_id;
       public            bcnregional    false    249            �           1259    17040 $   index_action_logs_on_organization_id    INDEX     w   CREATE INDEX index_action_logs_on_organization_id ON public.decidim_action_logs USING btree (decidim_organization_id);
 8   DROP INDEX public.index_action_logs_on_organization_id;
       public            bcnregional    false    249            �           1259    17043 )   index_action_logs_on_resource_type_and_id    INDEX        CREATE INDEX index_action_logs_on_resource_type_and_id ON public.decidim_action_logs USING btree (resource_type, resource_id);
 =   DROP INDEX public.index_action_logs_on_resource_type_and_id;
       public            bcnregional    false    249    249            �           1259    17044 &   index_action_logs_on_space_type_and_id    INDEX     �   CREATE INDEX index_action_logs_on_space_type_and_id ON public.decidim_action_logs USING btree (participatory_space_type, participatory_space_id);
 :   DROP INDEX public.index_action_logs_on_space_type_and_id;
       public            bcnregional    false    249    249            �           1259    17041    index_action_logs_on_user_id    INDEX     g   CREATE INDEX index_action_logs_on_user_id ON public.decidim_action_logs USING btree (decidim_user_id);
 0   DROP INDEX public.index_action_logs_on_user_id;
       public            bcnregional    false    249            �           1259    17210 "   index_coauthorable_on_coauthorship    INDEX     �   CREATE INDEX index_coauthorable_on_coauthorship ON public.decidim_coauthorships USING btree (coauthorable_type, coauthorable_id);
 6   DROP INDEX public.index_coauthorable_on_coauthorship;
       public            bcnregional    false    267    267            ]           1259    18561 :   index_collab_requests_on_decidim_proposals_collab_draft_id    INDEX     �   CREATE INDEX index_collab_requests_on_decidim_proposals_collab_draft_id ON public.decidim_proposals_collaborative_draft_collaborator_requests USING btree (decidim_proposals_collaborative_draft_id);
 N   DROP INDEX public.index_collab_requests_on_decidim_proposals_collab_draft_id;
       public            bcnregional    false    343            ^           1259    18562 (   index_collab_requests_on_decidim_user_id    INDEX     �   CREATE INDEX index_collab_requests_on_decidim_user_id ON public.decidim_proposals_collaborative_draft_collaborator_requests USING btree (decidim_user_id);
 <   DROP INDEX public.index_collab_requests_on_decidim_user_id;
       public            bcnregional    false    343            n           1259    16958 4   index_conversation_participations_on_conversation_id    INDEX     �   CREATE INDEX index_conversation_participations_on_conversation_id ON public.decidim_messaging_participations USING btree (decidim_conversation_id);
 H   DROP INDEX public.index_conversation_participations_on_conversation_id;
       public            bcnregional    false    239            o           1259    16959 3   index_conversation_participations_on_participant_id    INDEX     �   CREATE INDEX index_conversation_participations_on_participant_id ON public.decidim_messaging_participations USING btree (decidim_participant_id);
 G   DROP INDEX public.index_conversation_participations_on_participant_id;
       public            bcnregional    false    239            �           1259    18771 <   index_decidim_accountability_results_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_accountability_results_on_decidim_component_id ON public.decidim_accountability_results USING btree (decidim_component_id);
 P   DROP INDEX public.index_decidim_accountability_results_on_decidim_component_id;
       public            bcnregional    false    365            �           1259    18772 8   index_decidim_accountability_results_on_decidim_scope_id    INDEX     �   CREATE INDEX index_decidim_accountability_results_on_decidim_scope_id ON public.decidim_accountability_results USING btree (decidim_scope_id);
 L   DROP INDEX public.index_decidim_accountability_results_on_decidim_scope_id;
       public            bcnregional    false    365            �           1259    18757 =   index_decidim_accountability_statuses_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_accountability_statuses_on_decidim_component_id ON public.decidim_accountability_statuses USING btree (decidim_component_id);
 Q   DROP INDEX public.index_decidim_accountability_statuses_on_decidim_component_id;
       public            bcnregional    false    363            �           1259    18785 ;   index_decidim_accountability_timeline_entries_on_entry_date    INDEX     �   CREATE INDEX index_decidim_accountability_timeline_entries_on_entry_date ON public.decidim_accountability_timeline_entries USING btree (entry_date);
 O   DROP INDEX public.index_decidim_accountability_timeline_entries_on_entry_date;
       public            bcnregional    false    367            �           1259    18786 ;   index_decidim_accountability_timeline_entries_on_results_id    INDEX     �   CREATE INDEX index_decidim_accountability_timeline_entries_on_results_id ON public.decidim_accountability_timeline_entries USING btree (decidim_accountability_result_id);
 O   DROP INDEX public.index_decidim_accountability_timeline_entries_on_results_id;
       public            bcnregional    false    367            �           1259    17045 '   index_decidim_action_logs_on_created_at    INDEX     m   CREATE INDEX index_decidim_action_logs_on_created_at ON public.decidim_action_logs USING btree (created_at);
 ;   DROP INDEX public.index_decidim_action_logs_on_created_at;
       public            bcnregional    false    249            �           1259    17341 '   index_decidim_action_logs_on_visibility    INDEX     m   CREATE INDEX index_decidim_action_logs_on_visibility ON public.decidim_action_logs USING btree (visibility);
 ;   DROP INDEX public.index_decidim_action_logs_on_visibility;
       public            bcnregional    false    249            �           1259    17268 +   index_decidim_amendments_on_decidim_user_id    INDEX     u   CREATE INDEX index_decidim_amendments_on_decidim_user_id ON public.decidim_amendments USING btree (decidim_user_id);
 ?   DROP INDEX public.index_decidim_amendments_on_decidim_user_id;
       public            bcnregional    false    273            �           1259    17269 !   index_decidim_amendments_on_state    INDEX     a   CREATE INDEX index_decidim_amendments_on_state ON public.decidim_amendments USING btree (state);
 5   DROP INDEX public.index_decidim_amendments_on_state;
       public            bcnregional    false    273            �           1259    17090 3   index_decidim_area_types_on_decidim_organization_id    INDEX     �   CREATE INDEX index_decidim_area_types_on_decidim_organization_id ON public.decidim_area_types USING btree (decidim_organization_id);
 G   DROP INDEX public.index_decidim_area_types_on_decidim_organization_id;
       public            bcnregional    false    255            �           1259    17112 #   index_decidim_areas_on_area_type_id    INDEX     e   CREATE INDEX index_decidim_areas_on_area_type_id ON public.decidim_areas USING btree (area_type_id);
 7   DROP INDEX public.index_decidim_areas_on_area_type_id;
       public            bcnregional    false    257            �           1259    17113 .   index_decidim_areas_on_decidim_organization_id    INDEX     {   CREATE INDEX index_decidim_areas_on_decidim_organization_id ON public.decidim_areas USING btree (decidim_organization_id);
 B   DROP INDEX public.index_decidim_areas_on_decidim_organization_id;
       public            bcnregional    false    257                       1259    17867 +   index_decidim_assemblies_on_decidim_area_id    INDEX     u   CREATE INDEX index_decidim_assemblies_on_decidim_area_id ON public.decidim_assemblies USING btree (decidim_area_id);
 ?   DROP INDEX public.index_decidim_assemblies_on_decidim_area_id;
       public            bcnregional    false    309                       1259    17833 3   index_decidim_assemblies_on_decidim_organization_id    INDEX     �   CREATE INDEX index_decidim_assemblies_on_decidim_organization_id ON public.decidim_assemblies USING btree (decidim_organization_id);
 G   DROP INDEX public.index_decidim_assemblies_on_decidim_organization_id;
       public            bcnregional    false    309                       1259    18080 5   index_decidim_assembly_members_on_decidim_assembly_id    INDEX     �   CREATE INDEX index_decidim_assembly_members_on_decidim_assembly_id ON public.decidim_assembly_members USING btree (decidim_assembly_id);
 I   DROP INDEX public.index_decidim_assembly_members_on_decidim_assembly_id;
       public            bcnregional    false    313                       1259    18082 1   index_decidim_assembly_members_on_decidim_user_id    INDEX     �   CREATE INDEX index_decidim_assembly_members_on_decidim_user_id ON public.decidim_assembly_members USING btree (decidim_user_id);
 E   DROP INDEX public.index_decidim_assembly_members_on_decidim_user_id;
       public            bcnregional    false    313                       1259    18083 7   index_decidim_assembly_members_on_weight_and_created_at    INDEX     �   CREATE INDEX index_decidim_assembly_members_on_weight_and_created_at ON public.decidim_assembly_members USING btree (weight, created_at);
 K   DROP INDEX public.index_decidim_assembly_members_on_weight_and_created_at;
       public            bcnregional    false    313    313            �           1259    17728 (   index_decidim_attachments_on_attached_to    INDEX     �   CREATE INDEX index_decidim_attachments_on_attached_to ON public.decidim_attachments USING btree (attached_to_id, attached_to_type);
 <   DROP INDEX public.index_decidim_attachments_on_attached_to;
       public            bcnregional    false    305    305            %           1259    16502 /   index_decidim_authorizations_on_decidim_user_id    INDEX     }   CREATE INDEX index_decidim_authorizations_on_decidim_user_id ON public.decidim_authorizations USING btree (decidim_user_id);
 C   DROP INDEX public.index_decidim_authorizations_on_decidim_user_id;
       public            bcnregional    false    205            &           1259    16503 8   index_decidim_authorizations_on_decidim_user_id_and_name    INDEX     �   CREATE UNIQUE INDEX index_decidim_authorizations_on_decidim_user_id_and_name ON public.decidim_authorizations USING btree (decidim_user_id, name);
 L   DROP INDEX public.index_decidim_authorizations_on_decidim_user_id_and_name;
       public            bcnregional    false    205    205            �           1259    18858 +   index_decidim_blogs_posts_on_decidim_author    INDEX     �   CREATE INDEX index_decidim_blogs_posts_on_decidim_author ON public.decidim_blogs_posts USING btree (decidim_author_id, decidim_author_type);
 ?   DROP INDEX public.index_decidim_blogs_posts_on_decidim_author;
       public            bcnregional    false    373    373            �           1259    18857 1   index_decidim_blogs_posts_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_blogs_posts_on_decidim_component_id ON public.decidim_blogs_posts USING btree (decidim_component_id);
 E   DROP INDEX public.index_decidim_blogs_posts_on_decidim_component_id;
       public            bcnregional    false    373            n           1259    18650 4   index_decidim_budgets_line_items_on_decidim_order_id    INDEX     �   CREATE INDEX index_decidim_budgets_line_items_on_decidim_order_id ON public.decidim_budgets_line_items USING btree (decidim_order_id);
 H   DROP INDEX public.index_decidim_budgets_line_items_on_decidim_order_id;
       public            bcnregional    false    351            o           1259    18651 6   index_decidim_budgets_line_items_on_decidim_project_id    INDEX     �   CREATE INDEX index_decidim_budgets_line_items_on_decidim_project_id ON public.decidim_budgets_line_items USING btree (decidim_project_id);
 J   DROP INDEX public.index_decidim_budgets_line_items_on_decidim_project_id;
       public            bcnregional    false    351            i           1259    18640 4   index_decidim_budgets_orders_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_budgets_orders_on_decidim_component_id ON public.decidim_budgets_orders USING btree (decidim_component_id);
 H   DROP INDEX public.index_decidim_budgets_orders_on_decidim_component_id;
       public            bcnregional    false    349            j           1259    18639 /   index_decidim_budgets_orders_on_decidim_user_id    INDEX     }   CREATE INDEX index_decidim_budgets_orders_on_decidim_user_id ON public.decidim_budgets_orders USING btree (decidim_user_id);
 C   DROP INDEX public.index_decidim_budgets_orders_on_decidim_user_id;
       public            bcnregional    false    349            d           1259    18628 6   index_decidim_budgets_projects_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_budgets_projects_on_decidim_component_id ON public.decidim_budgets_projects USING btree (decidim_component_id);
 J   DROP INDEX public.index_decidim_budgets_projects_on_decidim_component_id;
       public            bcnregional    false    347            e           1259    18629 2   index_decidim_budgets_projects_on_decidim_scope_id    INDEX     �   CREATE INDEX index_decidim_budgets_projects_on_decidim_scope_id ON public.decidim_budgets_projects USING btree (decidim_scope_id);
 F   DROP INDEX public.index_decidim_budgets_projects_on_decidim_scope_id;
       public            bcnregional    false    347            0           1259    16875 7   index_decidim_categories_on_decidim_participatory_space    INDEX     �   CREATE INDEX index_decidim_categories_on_decidim_participatory_space ON public.decidim_categories USING btree (decidim_participatory_space_id, decidim_participatory_space_type);
 K   DROP INDEX public.index_decidim_categories_on_decidim_participatory_space;
       public            bcnregional    false    211    211            1           1259    16544 %   index_decidim_categories_on_parent_id    INDEX     i   CREATE INDEX index_decidim_categories_on_parent_id ON public.decidim_categories USING btree (parent_id);
 9   DROP INDEX public.index_decidim_categories_on_parent_id;
       public            bcnregional    false    211            ^           1259    16831 4   index_decidim_categorizations_on_decidim_category_id    INDEX     �   CREATE INDEX index_decidim_categorizations_on_decidim_category_id ON public.decidim_categorizations USING btree (decidim_category_id);
 H   DROP INDEX public.index_decidim_categorizations_on_decidim_category_id;
       public            bcnregional    false    229            �           1259    17398 -   index_decidim_coauthorships_on_decidim_author    INDEX     �   CREATE INDEX index_decidim_coauthorships_on_decidim_author ON public.decidim_coauthorships USING btree (decidim_author_id, decidim_author_type);
 A   DROP INDEX public.index_decidim_coauthorships_on_decidim_author;
       public            bcnregional    false    267    267                       1259    18157 6   index_decidim_comments_comment_votes_on_decidim_author    INDEX     �   CREATE INDEX index_decidim_comments_comment_votes_on_decidim_author ON public.decidim_comments_comment_votes USING btree (decidim_author_id, decidim_author_type);
 J   DROP INDEX public.index_decidim_comments_comment_votes_on_decidim_author;
       public            bcnregional    false    319    319                       1259    18118 -   index_decidim_comments_comments_on_created_at    INDEX     y   CREATE INDEX index_decidim_comments_comments_on_created_at ON public.decidim_comments_comments USING btree (created_at);
 A   DROP INDEX public.index_decidim_comments_comments_on_created_at;
       public            bcnregional    false    317                       1259    18153 1   index_decidim_comments_comments_on_decidim_author    INDEX     �   CREATE INDEX index_decidim_comments_comments_on_decidim_author ON public.decidim_comments_comments USING btree (decidim_author_id, decidim_author_type);
 E   DROP INDEX public.index_decidim_comments_comments_on_decidim_author;
       public            bcnregional    false    317    317            -           1259    17763 7   index_decidim_components_on_decidim_participatory_space    INDEX     �   CREATE INDEX index_decidim_components_on_decidim_participatory_space ON public.decidim_components USING btree (participatory_space_id, participatory_space_type);
 K   DROP INDEX public.index_decidim_components_on_decidim_participatory_space;
       public            bcnregional    false    209    209            �           1259    17283 7   index_decidim_content_blocks_on_decidim_organization_id    INDEX     �   CREATE INDEX index_decidim_content_blocks_on_decidim_organization_id ON public.decidim_content_blocks USING btree (decidim_organization_id);
 K   DROP INDEX public.index_decidim_content_blocks_on_decidim_organization_id;
       public            bcnregional    false    275            �           1259    17284 -   index_decidim_content_blocks_on_manifest_name    INDEX     y   CREATE INDEX index_decidim_content_blocks_on_manifest_name ON public.decidim_content_blocks USING btree (manifest_name);
 A   DROP INDEX public.index_decidim_content_blocks_on_manifest_name;
       public            bcnregional    false    275            �           1259    17286 ,   index_decidim_content_blocks_on_published_at    INDEX     w   CREATE INDEX index_decidim_content_blocks_on_published_at ON public.decidim_content_blocks USING btree (published_at);
 @   DROP INDEX public.index_decidim_content_blocks_on_published_at;
       public            bcnregional    false    275            �           1259    17285 %   index_decidim_content_blocks_on_scope    INDEX     i   CREATE INDEX index_decidim_content_blocks_on_scope ON public.decidim_content_blocks USING btree (scope);
 9   DROP INDEX public.index_decidim_content_blocks_on_scope;
       public            bcnregional    false    275            �           1259    17452 9   index_decidim_contextual_help_sections_on_organization_id    INDEX     �   CREATE INDEX index_decidim_contextual_help_sections_on_organization_id ON public.decidim_contextual_help_sections USING btree (organization_id);
 M   DROP INDEX public.index_decidim_contextual_help_sections_on_organization_id;
       public            bcnregional    false    285            �           1259    18824 /   index_decidim_debates_debates_on_decidim_author    INDEX     �   CREATE INDEX index_decidim_debates_debates_on_decidim_author ON public.decidim_debates_debates USING btree (decidim_author_id, decidim_author_type);
 C   DROP INDEX public.index_decidim_debates_debates_on_decidim_author;
       public            bcnregional    false    369    369            �           1259    18822 5   index_decidim_debates_debates_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_debates_debates_on_decidim_component_id ON public.decidim_debates_debates USING btree (decidim_component_id);
 I   DROP INDEX public.index_decidim_debates_debates_on_decidim_component_id;
       public            bcnregional    false    369            e           1259    16902 (   index_decidim_follows_on_decidim_user_id    INDEX     o   CREATE INDEX index_decidim_follows_on_decidim_user_id ON public.decidim_follows USING btree (decidim_user_id);
 <   DROP INDEX public.index_decidim_follows_on_decidim_user_id;
       public            bcnregional    false    233            �           1259    17650 ,   index_decidim_forms_answer_choices_answer_id    INDEX     �   CREATE INDEX index_decidim_forms_answer_choices_answer_id ON public.decidim_forms_answer_choices USING btree (decidim_answer_id);
 @   DROP INDEX public.index_decidim_forms_answer_choices_answer_id;
       public            bcnregional    false    299            �           1259    17651 3   index_decidim_forms_answer_choices_answer_option_id    INDEX     �   CREATE INDEX index_decidim_forms_answer_choices_answer_option_id ON public.decidim_forms_answer_choices USING btree (decidim_answer_option_id);
 G   DROP INDEX public.index_decidim_forms_answer_choices_answer_option_id;
       public            bcnregional    false    299            �           1259    17638 .   index_decidim_forms_answer_options_question_id    INDEX     �   CREATE INDEX index_decidim_forms_answer_options_question_id ON public.decidim_forms_answer_options USING btree (decidim_question_id);
 B   DROP INDEX public.index_decidim_forms_answer_options_question_id;
       public            bcnregional    false    297            �           1259    17625 7   index_decidim_forms_answers_on_decidim_questionnaire_id    INDEX     �   CREATE INDEX index_decidim_forms_answers_on_decidim_questionnaire_id ON public.decidim_forms_answers USING btree (decidim_questionnaire_id);
 K   DROP INDEX public.index_decidim_forms_answers_on_decidim_questionnaire_id;
       public            bcnregional    false    295            �           1259    17624 .   index_decidim_forms_answers_on_decidim_user_id    INDEX     {   CREATE INDEX index_decidim_forms_answers_on_decidim_user_id ON public.decidim_forms_answers USING btree (decidim_user_id);
 B   DROP INDEX public.index_decidim_forms_answers_on_decidim_user_id;
       public            bcnregional    false    295            �           1259    17626 '   index_decidim_forms_answers_question_id    INDEX     x   CREATE INDEX index_decidim_forms_answers_question_id ON public.decidim_forms_answers USING btree (decidim_question_id);
 ;   DROP INDEX public.index_decidim_forms_answers_question_id;
       public            bcnregional    false    295            �           1259    17599 4   index_decidim_forms_questionnaires_questionnaire_for    INDEX     �   CREATE INDEX index_decidim_forms_questionnaires_questionnaire_for ON public.decidim_forms_questionnaires USING btree (questionnaire_for_type, questionnaire_for_id);
 H   DROP INDEX public.index_decidim_forms_questionnaires_questionnaire_for;
       public            bcnregional    false    291    291            �           1259    17611 9   index_decidim_forms_questions_on_decidim_questionnaire_id    INDEX     �   CREATE INDEX index_decidim_forms_questions_on_decidim_questionnaire_id ON public.decidim_forms_questions USING btree (decidim_questionnaire_id);
 M   DROP INDEX public.index_decidim_forms_questions_on_decidim_questionnaire_id;
       public            bcnregional    false    293            �           1259    17612 )   index_decidim_forms_questions_on_position    INDEX     s   CREATE INDEX index_decidim_forms_questions_on_position ON public.decidim_forms_questions USING btree ("position");
 =   DROP INDEX public.index_decidim_forms_questions_on_position;
       public            bcnregional    false    293            �           1259    17313 2   index_decidim_gamification_badge_scores_on_user_id    INDEX     �   CREATE INDEX index_decidim_gamification_badge_scores_on_user_id ON public.decidim_gamification_badge_scores USING btree (user_id);
 F   DROP INDEX public.index_decidim_gamification_badge_scores_on_user_id;
       public            bcnregional    false    279            �           1259    17299 1   index_decidim_hashtags_on_decidim_organization_id    INDEX     �   CREATE INDEX index_decidim_hashtags_on_decidim_organization_id ON public.decidim_hashtags USING btree (decidim_organization_id);
 E   DROP INDEX public.index_decidim_hashtags_on_decidim_organization_id;
       public            bcnregional    false    277            �           1259    17300    index_decidim_hashtags_on_name    INDEX     [   CREATE INDEX index_decidim_hashtags_on_name ON public.decidim_hashtags USING btree (name);
 2   DROP INDEX public.index_decidim_hashtags_on_name;
       public            bcnregional    false    277            A           1259    16763 3   index_decidim_identities_on_decidim_organization_id    INDEX     �   CREATE INDEX index_decidim_identities_on_decidim_organization_id ON public.decidim_identities USING btree (decidim_organization_id);
 G   DROP INDEX public.index_decidim_identities_on_decidim_organization_id;
       public            bcnregional    false    217            B           1259    16598 +   index_decidim_identities_on_decidim_user_id    INDEX     u   CREATE INDEX index_decidim_identities_on_decidim_user_id ON public.decidim_identities USING btree (decidim_user_id);
 ?   DROP INDEX public.index_decidim_identities_on_decidim_user_id;
       public            bcnregional    false    217            a           1259    16873 4   index_decidim_impersonation_logs_on_decidim_admin_id    INDEX     �   CREATE INDEX index_decidim_impersonation_logs_on_decidim_admin_id ON public.decidim_impersonation_logs USING btree (decidim_admin_id);
 H   DROP INDEX public.index_decidim_impersonation_logs_on_decidim_admin_id;
       public            bcnregional    false    231            b           1259    16874 3   index_decidim_impersonation_logs_on_decidim_user_id    INDEX     �   CREATE INDEX index_decidim_impersonation_logs_on_decidim_user_id ON public.decidim_impersonation_logs USING btree (decidim_user_id);
 G   DROP INDEX public.index_decidim_impersonation_logs_on_decidim_user_id;
       public            bcnregional    false    231            3           1259    18287 8   index_decidim_meetings_agenda_items_on_decidim_agenda_id    INDEX     �   CREATE INDEX index_decidim_meetings_agenda_items_on_decidim_agenda_id ON public.decidim_meetings_agenda_items USING btree (decidim_agenda_id);
 L   DROP INDEX public.index_decidim_meetings_agenda_items_on_decidim_agenda_id;
       public            bcnregional    false    329            4           1259    18288 0   index_decidim_meetings_agenda_items_on_parent_id    INDEX        CREATE INDEX index_decidim_meetings_agenda_items_on_parent_id ON public.decidim_meetings_agenda_items USING btree (parent_id);
 D   DROP INDEX public.index_decidim_meetings_agenda_items_on_parent_id;
       public            bcnregional    false    329            0           1259    18275 4   index_decidim_meetings_agendas_on_decidim_meeting_id    INDEX     �   CREATE INDEX index_decidim_meetings_agendas_on_decidim_meeting_id ON public.decidim_meetings_agendas USING btree (decidim_meeting_id);
 H   DROP INDEX public.index_decidim_meetings_agendas_on_decidim_meeting_id;
       public            bcnregional    false    327            7           1259    18298 4   index_decidim_meetings_invites_on_decidim_meeting_id    INDEX     �   CREATE INDEX index_decidim_meetings_invites_on_decidim_meeting_id ON public.decidim_meetings_invites USING btree (decidim_meeting_id);
 H   DROP INDEX public.index_decidim_meetings_invites_on_decidim_meeting_id;
       public            bcnregional    false    331            8           1259    18297 1   index_decidim_meetings_invites_on_decidim_user_id    INDEX     �   CREATE INDEX index_decidim_meetings_invites_on_decidim_user_id ON public.decidim_meetings_invites USING btree (decidim_user_id);
 E   DROP INDEX public.index_decidim_meetings_invites_on_decidim_user_id;
       public            bcnregional    false    331            "           1259    18170 4   index_decidim_meetings_meetings_on_decidim_author_id    INDEX     �   CREATE INDEX index_decidim_meetings_meetings_on_decidim_author_id ON public.decidim_meetings_meetings USING btree (decidim_author_id);
 H   DROP INDEX public.index_decidim_meetings_meetings_on_decidim_author_id;
       public            bcnregional    false    321            #           1259    18169 7   index_decidim_meetings_meetings_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_meetings_meetings_on_decidim_component_id ON public.decidim_meetings_meetings USING btree (decidim_component_id);
 K   DROP INDEX public.index_decidim_meetings_meetings_on_decidim_component_id;
       public            bcnregional    false    321            $           1259    18171 3   index_decidim_meetings_meetings_on_decidim_scope_id    INDEX     �   CREATE INDEX index_decidim_meetings_meetings_on_decidim_scope_id ON public.decidim_meetings_meetings USING btree (decidim_scope_id);
 G   DROP INDEX public.index_decidim_meetings_meetings_on_decidim_scope_id;
       public            bcnregional    false    321            %           1259    18239 /   index_decidim_meetings_meetings_on_organizer_id    INDEX     }   CREATE INDEX index_decidim_meetings_meetings_on_organizer_id ON public.decidim_meetings_meetings USING btree (organizer_id);
 C   DROP INDEX public.index_decidim_meetings_meetings_on_organizer_id;
       public            bcnregional    false    321            -           1259    18251 4   index_decidim_meetings_minutes_on_decidim_meeting_id    INDEX     �   CREATE INDEX index_decidim_meetings_minutes_on_decidim_meeting_id ON public.decidim_meetings_minutes USING btree (decidim_meeting_id);
 H   DROP INDEX public.index_decidim_meetings_minutes_on_decidim_meeting_id;
       public            bcnregional    false    325            )           1259    18204 :   index_decidim_meetings_registrations_on_decidim_meeting_id    INDEX     �   CREATE INDEX index_decidim_meetings_registrations_on_decidim_meeting_id ON public.decidim_meetings_registrations USING btree (decidim_meeting_id);
 N   DROP INDEX public.index_decidim_meetings_registrations_on_decidim_meeting_id;
       public            bcnregional    false    323            *           1259    18203 7   index_decidim_meetings_registrations_on_decidim_user_id    INDEX     �   CREATE INDEX index_decidim_meetings_registrations_on_decidim_user_id ON public.decidim_meetings_registrations USING btree (decidim_user_id);
 K   DROP INDEX public.index_decidim_meetings_registrations_on_decidim_user_id;
       public            bcnregional    false    323            r           1259    16971 ;   index_decidim_messaging_messages_on_decidim_conversation_id    INDEX     �   CREATE INDEX index_decidim_messaging_messages_on_decidim_conversation_id ON public.decidim_messaging_messages USING btree (decidim_conversation_id);
 O   DROP INDEX public.index_decidim_messaging_messages_on_decidim_conversation_id;
       public            bcnregional    false    241            s           1259    16972 5   index_decidim_messaging_messages_on_decidim_sender_id    INDEX     �   CREATE INDEX index_decidim_messaging_messages_on_decidim_sender_id ON public.decidim_messaging_messages USING btree (decidim_sender_id);
 I   DROP INDEX public.index_decidim_messaging_messages_on_decidim_sender_id;
       public            bcnregional    false    241            y           1259    16993 6   index_decidim_messaging_receipts_on_decidim_message_id    INDEX     �   CREATE INDEX index_decidim_messaging_receipts_on_decidim_message_id ON public.decidim_messaging_receipts USING btree (decidim_message_id);
 J   DROP INDEX public.index_decidim_messaging_receipts_on_decidim_message_id;
       public            bcnregional    false    245            z           1259    16994 8   index_decidim_messaging_receipts_on_decidim_recipient_id    INDEX     �   CREATE INDEX index_decidim_messaging_receipts_on_decidim_recipient_id ON public.decidim_messaging_receipts USING btree (decidim_recipient_id);
 L   DROP INDEX public.index_decidim_messaging_receipts_on_decidim_recipient_id;
       public            bcnregional    false    245            �           1259    17251    index_decidim_metrics_on_day    INDEX     W   CREATE INDEX index_decidim_metrics_on_day ON public.decidim_metrics USING btree (day);
 0   DROP INDEX public.index_decidim_metrics_on_day;
       public            bcnregional    false    271            �           1259    17256 ,   index_decidim_metrics_on_decidim_category_id    INDEX     w   CREATE INDEX index_decidim_metrics_on_decidim_category_id ON public.decidim_metrics USING btree (decidim_category_id);
 @   DROP INDEX public.index_decidim_metrics_on_decidim_category_id;
       public            bcnregional    false    271            �           1259    17253 0   index_decidim_metrics_on_decidim_organization_id    INDEX        CREATE INDEX index_decidim_metrics_on_decidim_organization_id ON public.decidim_metrics USING btree (decidim_organization_id);
 D   DROP INDEX public.index_decidim_metrics_on_decidim_organization_id;
       public            bcnregional    false    271            �           1259    17252 $   index_decidim_metrics_on_metric_type    INDEX     g   CREATE INDEX index_decidim_metrics_on_metric_type ON public.decidim_metrics USING btree (metric_type);
 8   DROP INDEX public.index_decidim_metrics_on_metric_type;
       public            bcnregional    false    271            K           1259    16711 &   index_decidim_newsletters_on_author_id    INDEX     k   CREATE INDEX index_decidim_newsletters_on_author_id ON public.decidim_newsletters USING btree (author_id);
 :   DROP INDEX public.index_decidim_newsletters_on_author_id;
       public            bcnregional    false    221            L           1259    16710 ,   index_decidim_newsletters_on_organization_id    INDEX     w   CREATE INDEX index_decidim_newsletters_on_organization_id ON public.decidim_newsletters USING btree (organization_id);
 @   DROP INDEX public.index_decidim_newsletters_on_organization_id;
       public            bcnregional    false    221            i           1259    16916 .   index_decidim_notifications_on_decidim_user_id    INDEX     {   CREATE INDEX index_decidim_notifications_on_decidim_user_id ON public.decidim_notifications USING btree (decidim_user_id);
 B   DROP INDEX public.index_decidim_notifications_on_decidim_user_id;
       public            bcnregional    false    235            !           1259    16451 #   index_decidim_organizations_on_host    INDEX     l   CREATE UNIQUE INDEX index_decidim_organizations_on_host ON public.decidim_organizations USING btree (host);
 7   DROP INDEX public.index_decidim_organizations_on_host;
       public            bcnregional    false    203            "           1259    16450 #   index_decidim_organizations_on_name    INDEX     l   CREATE UNIQUE INDEX index_decidim_organizations_on_name ON public.decidim_organizations USING btree (name);
 7   DROP INDEX public.index_decidim_organizations_on_name;
       public            bcnregional    false    203                       1259    18095 1   index_decidim_pages_pages_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_pages_pages_on_decidim_component_id ON public.decidim_pages_pages USING btree (decidim_component_id);
 E   DROP INDEX public.index_decidim_pages_pages_on_decidim_component_id;
       public            bcnregional    false    315            �           1259    17668 2   index_decidim_processes_on_decidim_organization_id    INDEX     �   CREATE INDEX index_decidim_processes_on_decidim_organization_id ON public.decidim_participatory_processes USING btree (decidim_organization_id);
 F   DROP INDEX public.index_decidim_processes_on_decidim_organization_id;
       public            bcnregional    false    301            �           1259    17694 4   index_decidim_processes_steps__on_decidim_process_id    INDEX     �   CREATE INDEX index_decidim_processes_steps__on_decidim_process_id ON public.decidim_participatory_process_steps USING btree (decidim_participatory_process_id);
 H   DROP INDEX public.index_decidim_processes_steps__on_decidim_process_id;
       public            bcnregional    false    303            M           1259    18600 ?   index_decidim_proposals_proposal_endorsements_on_decidim_author    INDEX     �   CREATE INDEX index_decidim_proposals_proposal_endorsements_on_decidim_author ON public.decidim_proposals_proposal_endorsements USING btree (decidim_author_id, decidim_author_type);
 S   DROP INDEX public.index_decidim_proposals_proposal_endorsements_on_decidim_author;
       public            bcnregional    false    337    337            R           1259    18514 4   index_decidim_proposals_proposal_notes_on_created_at    INDEX     �   CREATE INDEX index_decidim_proposals_proposal_notes_on_created_at ON public.decidim_proposals_proposal_notes USING btree (created_at);
 H   DROP INDEX public.index_decidim_proposals_proposal_notes_on_created_at;
       public            bcnregional    false    339            >           1259    18357 /   index_decidim_proposals_proposals_on_created_at    INDEX     }   CREATE INDEX index_decidim_proposals_proposals_on_created_at ON public.decidim_proposals_proposals USING btree (created_at);
 C   DROP INDEX public.index_decidim_proposals_proposals_on_created_at;
       public            bcnregional    false    333            ?           1259    18325 9   index_decidim_proposals_proposals_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_proposals_proposals_on_decidim_component_id ON public.decidim_proposals_proposals USING btree (decidim_component_id);
 M   DROP INDEX public.index_decidim_proposals_proposals_on_decidim_component_id;
       public            bcnregional    false    333            @           1259    18328 5   index_decidim_proposals_proposals_on_decidim_scope_id    INDEX     �   CREATE INDEX index_decidim_proposals_proposals_on_decidim_scope_id ON public.decidim_proposals_proposals USING btree (decidim_scope_id);
 I   DROP INDEX public.index_decidim_proposals_proposals_on_decidim_scope_id;
       public            bcnregional    false    333            A           1259    18356 9   index_decidim_proposals_proposals_on_proposal_votes_count    INDEX     �   CREATE INDEX index_decidim_proposals_proposals_on_proposal_votes_count ON public.decidim_proposals_proposals USING btree (proposal_votes_count);
 M   DROP INDEX public.index_decidim_proposals_proposals_on_proposal_votes_count;
       public            bcnregional    false    333            B           1259    18358 *   index_decidim_proposals_proposals_on_state    INDEX     s   CREATE INDEX index_decidim_proposals_proposals_on_state ON public.decidim_proposals_proposals USING btree (state);
 >   DROP INDEX public.index_decidim_proposals_proposals_on_state;
       public            bcnregional    false    333            ;           1259    16584 5   index_decidim_resource_links_on_from_type_and_from_id    INDEX     �   CREATE INDEX index_decidim_resource_links_on_from_type_and_from_id ON public.decidim_resource_links USING btree (from_type, from_id);
 I   DROP INDEX public.index_decidim_resource_links_on_from_type_and_from_id;
       public            bcnregional    false    215    215            <           1259    16586 $   index_decidim_resource_links_on_name    INDEX     g   CREATE INDEX index_decidim_resource_links_on_name ON public.decidim_resource_links USING btree (name);
 8   DROP INDEX public.index_decidim_resource_links_on_name;
       public            bcnregional    false    215            =           1259    16585 1   index_decidim_resource_links_on_to_type_and_to_id    INDEX     ~   CREATE INDEX index_decidim_resource_links_on_to_type_and_to_id ON public.decidim_resource_links USING btree (to_type, to_id);
 E   DROP INDEX public.index_decidim_resource_links_on_to_type_and_to_id;
       public            bcnregional    false    215    215            �           1259    17239 5   index_decidim_resource_permissions_on_r_type_and_r_id    INDEX     �   CREATE UNIQUE INDEX index_decidim_resource_permissions_on_r_type_and_r_id ON public.decidim_resource_permissions USING btree (resource_type, resource_id);
 I   DROP INDEX public.index_decidim_resource_permissions_on_r_type_and_r_id;
       public            bcnregional    false    269    269            Z           1259    16786 4   index_decidim_scope_types_on_decidim_organization_id    INDEX     �   CREATE INDEX index_decidim_scope_types_on_decidim_organization_id ON public.decidim_scope_types USING btree (decidim_organization_id);
 H   DROP INDEX public.index_decidim_scope_types_on_decidim_organization_id;
       public            bcnregional    false    227            4           1259    16563 /   index_decidim_scopes_on_decidim_organization_id    INDEX     }   CREATE INDEX index_decidim_scopes_on_decidim_organization_id ON public.decidim_scopes USING btree (decidim_organization_id);
 C   DROP INDEX public.index_decidim_scopes_on_decidim_organization_id;
       public            bcnregional    false    213            5           1259    16811 8   index_decidim_scopes_on_decidim_organization_id_and_code    INDEX     �   CREATE UNIQUE INDEX index_decidim_scopes_on_decidim_organization_id_and_code ON public.decidim_scopes USING btree (decidim_organization_id, code);
 L   DROP INDEX public.index_decidim_scopes_on_decidim_organization_id_and_code;
       public            bcnregional    false    213    213            6           1259    16793 !   index_decidim_scopes_on_parent_id    INDEX     a   CREATE INDEX index_decidim_scopes_on_parent_id ON public.decidim_scopes USING btree (parent_id);
 5   DROP INDEX public.index_decidim_scopes_on_parent_id;
       public            bcnregional    false    213            7           1259    16810    index_decidim_scopes_on_part_of    INDEX     [   CREATE INDEX index_decidim_scopes_on_part_of ON public.decidim_scopes USING gin (part_of);
 3   DROP INDEX public.index_decidim_scopes_on_part_of;
       public            bcnregional    false    213            8           1259    16787 %   index_decidim_scopes_on_scope_type_id    INDEX     i   CREATE INDEX index_decidim_scopes_on_scope_type_id ON public.decidim_scopes USING btree (scope_type_id);
 9   DROP INDEX public.index_decidim_scopes_on_scope_type_id;
       public            bcnregional    false    213            �           1259    17071 >   index_decidim_searchable_resource_on_pspace_type_and_pspace_id    INDEX     �   CREATE INDEX index_decidim_searchable_resource_on_pspace_type_and_pspace_id ON public.decidim_searchable_resources USING btree (decidim_participatory_space_type, decidim_participatory_space_id);
 R   DROP INDEX public.index_decidim_searchable_resource_on_pspace_type_and_pspace_id;
       public            bcnregional    false    253    253            �           1259    17072 =   index_decidim_searchable_resources_on_decidim_organization_id    INDEX     �   CREATE INDEX index_decidim_searchable_resources_on_decidim_organization_id ON public.decidim_searchable_resources USING btree (decidim_organization_id);
 Q   DROP INDEX public.index_decidim_searchable_resources_on_decidim_organization_id;
       public            bcnregional    false    253            �           1259    17070 6   index_decidim_searchable_resources_on_decidim_scope_id    INDEX     �   CREATE INDEX index_decidim_searchable_resources_on_decidim_scope_id ON public.decidim_searchable_resources USING btree (decidim_scope_id);
 J   DROP INDEX public.index_decidim_searchable_resources_on_decidim_scope_id;
       public            bcnregional    false    253            �           1259    17073 1   index_decidim_searchable_rsrcs_on_s_type_and_s_id    INDEX     �   CREATE INDEX index_decidim_searchable_rsrcs_on_s_type_and_s_id ON public.decidim_searchable_resources USING btree (resource_type, resource_id);
 E   DROP INDEX public.index_decidim_searchable_rsrcs_on_s_type_and_s_id;
       public            bcnregional    false    253    253            �           1259    18845 5   index_decidim_sortitions_sortitions_on_decidim_author    INDEX     �   CREATE INDEX index_decidim_sortitions_sortitions_on_decidim_author ON public.decidim_sortitions_sortitions USING btree (decidim_author_id, decidim_author_type);
 I   DROP INDEX public.index_decidim_sortitions_sortitions_on_decidim_author;
       public            bcnregional    false    371    371            �           1259    18844 8   index_decidim_sortitions_sortitions_on_decidim_author_id    INDEX     �   CREATE INDEX index_decidim_sortitions_sortitions_on_decidim_author_id ON public.decidim_sortitions_sortitions USING btree (decidim_author_id);
 L   DROP INDEX public.index_decidim_sortitions_sortitions_on_decidim_author_id;
       public            bcnregional    false    371            �           1259    17057 -   index_decidim_spaces_users_on_private_user_id    INDEX     �   CREATE INDEX index_decidim_spaces_users_on_private_user_id ON public.decidim_participatory_space_private_users USING btree (decidim_user_id);
 A   DROP INDEX public.index_decidim_spaces_users_on_private_user_id;
       public            bcnregional    false    251            �           1259    17419 3   index_decidim_static_page_topics_on_organization_id    INDEX     �   CREATE INDEX index_decidim_static_page_topics_on_organization_id ON public.decidim_static_page_topics USING btree (organization_id);
 G   DROP INDEX public.index_decidim_static_page_topics_on_organization_id;
       public            bcnregional    false    283            )           1259    16520 5   index_decidim_static_pages_on_decidim_organization_id    INDEX     �   CREATE INDEX index_decidim_static_pages_on_decidim_organization_id ON public.decidim_static_pages USING btree (decidim_organization_id);
 I   DROP INDEX public.index_decidim_static_pages_on_decidim_organization_id;
       public            bcnregional    false    207            *           1259    17420 &   index_decidim_static_pages_on_topic_id    INDEX     k   CREATE INDEX index_decidim_static_pages_on_topic_id ON public.decidim_static_pages USING btree (topic_id);
 :   DROP INDEX public.index_decidim_static_pages_on_topic_id;
       public            bcnregional    false    207            �           1259    18744 .   index_decidim_surveys_answer_choices_answer_id    INDEX     �   CREATE INDEX index_decidim_surveys_answer_choices_answer_id ON public.decidim_surveys_survey_answer_choices USING btree (decidim_survey_answer_id);
 B   DROP INDEX public.index_decidim_surveys_answer_choices_answer_id;
       public            bcnregional    false    361            �           1259    18745 5   index_decidim_surveys_answer_choices_answer_option_id    INDEX     �   CREATE INDEX index_decidim_surveys_answer_choices_answer_option_id ON public.decidim_surveys_survey_answer_choices USING btree (decidim_survey_answer_option_id);
 I   DROP INDEX public.index_decidim_surveys_answer_choices_answer_option_id;
       public            bcnregional    false    361            }           1259    18732 0   index_decidim_surveys_answer_options_question_id    INDEX     �   CREATE INDEX index_decidim_surveys_answer_options_question_id ON public.decidim_surveys_survey_answer_options USING btree (decidim_survey_question_id);
 D   DROP INDEX public.index_decidim_surveys_answer_options_question_id;
       public            bcnregional    false    359            x           1259    18700 )   index_decidim_surveys_answers_question_id    INDEX     �   CREATE INDEX index_decidim_surveys_answers_question_id ON public.decidim_surveys_survey_answers USING btree (decidim_survey_question_id);
 =   DROP INDEX public.index_decidim_surveys_answers_question_id;
       public            bcnregional    false    357            y           1259    18699 9   index_decidim_surveys_survey_answers_on_decidim_survey_id    INDEX     �   CREATE INDEX index_decidim_surveys_survey_answers_on_decidim_survey_id ON public.decidim_surveys_survey_answers USING btree (decidim_survey_id);
 M   DROP INDEX public.index_decidim_surveys_survey_answers_on_decidim_survey_id;
       public            bcnregional    false    357            z           1259    18698 7   index_decidim_surveys_survey_answers_on_decidim_user_id    INDEX     �   CREATE INDEX index_decidim_surveys_survey_answers_on_decidim_user_id ON public.decidim_surveys_survey_answers USING btree (decidim_user_id);
 K   DROP INDEX public.index_decidim_surveys_survey_answers_on_decidim_user_id;
       public            bcnregional    false    357            u           1259    18685 ;   index_decidim_surveys_survey_questions_on_decidim_survey_id    INDEX     �   CREATE INDEX index_decidim_surveys_survey_questions_on_decidim_survey_id ON public.decidim_surveys_survey_questions USING btree (decidim_survey_id);
 O   DROP INDEX public.index_decidim_surveys_survey_questions_on_decidim_survey_id;
       public            bcnregional    false    355            r           1259    18673 5   index_decidim_surveys_surveys_on_decidim_component_id    INDEX     �   CREATE INDEX index_decidim_surveys_surveys_on_decidim_component_id ON public.decidim_surveys_surveys USING btree (decidim_component_id);
 I   DROP INDEX public.index_decidim_surveys_surveys_on_decidim_component_id;
       public            bcnregional    false    353            �           1259    17570 $   index_decidim_system_admins_on_email    INDEX     n   CREATE UNIQUE INDEX index_decidim_system_admins_on_email ON public.decidim_system_admins USING btree (email);
 8   DROP INDEX public.index_decidim_system_admins_on_email;
       public            bcnregional    false    287            �           1259    17571 3   index_decidim_system_admins_on_reset_password_token    INDEX     �   CREATE UNIQUE INDEX index_decidim_system_admins_on_reset_password_token ON public.decidim_system_admins USING btree (reset_password_token);
 G   DROP INDEX public.index_decidim_system_admins_on_reset_password_token;
       public            bcnregional    false    287            G           1259    16620 =   index_decidim_user_group_memberships_on_decidim_user_group_id    INDEX     �   CREATE INDEX index_decidim_user_group_memberships_on_decidim_user_group_id ON public.decidim_user_group_memberships USING btree (decidim_user_group_id);
 Q   DROP INDEX public.index_decidim_user_group_memberships_on_decidim_user_group_id;
       public            bcnregional    false    219            H           1259    16619 7   index_decidim_user_group_memberships_on_decidim_user_id    INDEX     �   CREATE INDEX index_decidim_user_group_memberships_on_decidim_user_id ON public.decidim_user_group_memberships USING btree (decidim_user_id);
 K   DROP INDEX public.index_decidim_user_group_memberships_on_decidim_user_id;
       public            bcnregional    false    219                       1259    16485 )   index_decidim_users_on_confirmation_token    INDEX     x   CREATE UNIQUE INDEX index_decidim_users_on_confirmation_token ON public.decidim_users USING btree (confirmation_token);
 =   DROP INDEX public.index_decidim_users_on_confirmation_token;
       public            bcnregional    false    201                       1259    16465 .   index_decidim_users_on_decidim_organization_id    INDEX     {   CREATE INDEX index_decidim_users_on_decidim_organization_id ON public.decidim_users USING btree (decidim_organization_id);
 B   DROP INDEX public.index_decidim_users_on_decidim_organization_id;
       public            bcnregional    false    201                       1259    17358 8   index_decidim_users_on_email_and_decidim_organization_id    INDEX     �   CREATE UNIQUE INDEX index_decidim_users_on_email_and_decidim_organization_id ON public.decidim_users USING btree (email, decidim_organization_id) WHERE ((deleted_at IS NULL) AND (managed = false) AND ((type)::text = 'Decidim::User'::text));
 L   DROP INDEX public.index_decidim_users_on_email_and_decidim_organization_id;
       public            bcnregional    false    201    201    201    201    201                       1259    16463 '   index_decidim_users_on_invitation_token    INDEX     t   CREATE UNIQUE INDEX index_decidim_users_on_invitation_token ON public.decidim_users USING btree (invitation_token);
 ;   DROP INDEX public.index_decidim_users_on_invitation_token;
       public            bcnregional    false    201                       1259    16462 (   index_decidim_users_on_invitations_count    INDEX     o   CREATE INDEX index_decidim_users_on_invitations_count ON public.decidim_users USING btree (invitations_count);
 <   DROP INDEX public.index_decidim_users_on_invitations_count;
       public            bcnregional    false    201                       1259    16464 $   index_decidim_users_on_invited_by_id    INDEX     g   CREATE INDEX index_decidim_users_on_invited_by_id ON public.decidim_users USING btree (invited_by_id);
 8   DROP INDEX public.index_decidim_users_on_invited_by_id;
       public            bcnregional    false    201                       1259    17008 :   index_decidim_users_on_nickame_and_decidim_organization_id    INDEX     �   CREATE UNIQUE INDEX index_decidim_users_on_nickame_and_decidim_organization_id ON public.decidim_users USING btree (nickname, decidim_organization_id) WHERE ((deleted_at IS NULL) AND (managed = false));
 N   DROP INDEX public.index_decidim_users_on_nickame_and_decidim_organization_id;
       public            bcnregional    false    201    201    201    201                       1259    17584 &   index_decidim_users_on_officialized_at    INDEX     k   CREATE INDEX index_decidim_users_on_officialized_at ON public.decidim_users USING btree (officialized_at);
 :   DROP INDEX public.index_decidim_users_on_officialized_at;
       public            bcnregional    false    201                       1259    16437 +   index_decidim_users_on_reset_password_token    INDEX     |   CREATE UNIQUE INDEX index_decidim_users_on_reset_password_token ON public.decidim_users USING btree (reset_password_token);
 ?   DROP INDEX public.index_decidim_users_on_reset_password_token;
       public            bcnregional    false    201            �           1259    17254 /   index_metric_on_participatory_space_id_and_type    INDEX     �   CREATE INDEX index_metric_on_participatory_space_id_and_type ON public.decidim_metrics USING btree (participatory_space_type, participatory_space_id);
 C   DROP INDEX public.index_metric_on_participatory_space_id_and_type;
       public            bcnregional    false    271    271            �           1259    17255 *   index_metric_on_related_object_id_and_type    INDEX     �   CREATE INDEX index_metric_on_related_object_id_and_type ON public.decidim_metrics USING btree (related_object_type, related_object_id);
 >   DROP INDEX public.index_metric_on_related_object_id_and_type;
       public            bcnregional    false    271    271            �           1259    17159 +   index_oauth_access_grants_on_application_id    INDEX     u   CREATE INDEX index_oauth_access_grants_on_application_id ON public.oauth_access_grants USING btree (application_id);
 ?   DROP INDEX public.index_oauth_access_grants_on_application_id;
       public            bcnregional    false    263            �           1259    17160 "   index_oauth_access_grants_on_token    INDEX     j   CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);
 6   DROP INDEX public.index_oauth_access_grants_on_token;
       public            bcnregional    false    263            �           1259    17178 +   index_oauth_access_tokens_on_application_id    INDEX     u   CREATE INDEX index_oauth_access_tokens_on_application_id ON public.oauth_access_tokens USING btree (application_id);
 ?   DROP INDEX public.index_oauth_access_tokens_on_application_id;
       public            bcnregional    false    265            �           1259    17181 *   index_oauth_access_tokens_on_refresh_token    INDEX     z   CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);
 >   DROP INDEX public.index_oauth_access_tokens_on_refresh_token;
       public            bcnregional    false    265            �           1259    17180 .   index_oauth_access_tokens_on_resource_owner_id    INDEX     {   CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);
 B   DROP INDEX public.index_oauth_access_tokens_on_resource_owner_id;
       public            bcnregional    false    265            �           1259    17179 "   index_oauth_access_tokens_on_token    INDEX     j   CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);
 6   DROP INDEX public.index_oauth_access_tokens_on_token;
       public            bcnregional    false    265            �           1259    17146 3   index_oauth_applications_on_decidim_organization_id    INDEX     �   CREATE INDEX index_oauth_applications_on_decidim_organization_id ON public.oauth_applications USING btree (decidim_organization_id);
 G   DROP INDEX public.index_oauth_applications_on_decidim_organization_id;
       public            bcnregional    false    261            �           1259    17147    index_oauth_applications_on_uid    INDEX     d   CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);
 3   DROP INDEX public.index_oauth_applications_on_uid;
       public            bcnregional    false    261            �           1259    17271    index_on_amendable    INDEX     y   CREATE INDEX index_on_amendable ON public.decidim_amendments USING btree (decidim_amendable_id, decidim_amendable_type);
 &   DROP INDEX public.index_on_amendable;
       public            bcnregional    false    273    273            �           1259    17270    index_on_amender_and_amendable    INDEX     �   CREATE INDEX index_on_amender_and_amendable ON public.decidim_amendments USING btree (decidim_user_id, decidim_amendable_id, decidim_amendable_type);
 2   DROP INDEX public.index_on_amender_and_amendable;
       public            bcnregional    false    273    273    273            �           1259    17708 !   index_order_by_position_for_steps    INDEX     w   CREATE INDEX index_order_by_position_for_steps ON public.decidim_participatory_process_steps USING btree ("position");
 5   DROP INDEX public.index_order_by_position_for_steps;
       public            bcnregional    false    303            �           1259    17128 $   index_participatory_space_links_name    INDEX     r   CREATE INDEX index_participatory_space_links_name ON public.decidim_participatory_space_links USING btree (name);
 8   DROP INDEX public.index_participatory_space_links_name;
       public            bcnregional    false    259            �           1259    17126 '   index_participatory_space_links_on_from    INDEX     �   CREATE INDEX index_participatory_space_links_on_from ON public.decidim_participatory_space_links USING btree (from_type, from_id);
 ;   DROP INDEX public.index_participatory_space_links_on_from;
       public            bcnregional    false    259    259            �           1259    17127 %   index_participatory_space_links_on_to    INDEX     }   CREATE INDEX index_participatory_space_links_on_to ON public.decidim_participatory_space_links USING btree (to_type, to_id);
 9   DROP INDEX public.index_participatory_space_links_on_to;
       public            bcnregional    false    259    259            �           1259    18841    index_sortitions__on_feature    INDEX     v   CREATE INDEX index_sortitions__on_feature ON public.decidim_sortitions_sortitions USING btree (decidim_component_id);
 0   DROP INDEX public.index_sortitions__on_feature;
       public            bcnregional    false    371            �           1259    18843 &   index_sortitions__on_proposals_feature    INDEX     �   CREATE INDEX index_sortitions__on_proposals_feature ON public.decidim_sortitions_sortitions USING btree (decidim_proposals_component_id);
 :   DROP INDEX public.index_sortitions__on_proposals_feature;
       public            bcnregional    false    371            f           1259    16903 )   index_uniq_on_follows_user_and_followable    INDEX     �   CREATE UNIQUE INDEX index_uniq_on_follows_user_and_followable ON public.decidim_follows USING btree (decidim_user_id, decidim_followable_id, decidim_followable_type);
 =   DROP INDEX public.index_uniq_on_follows_user_and_followable;
       public            bcnregional    false    233    233    233                       1259    17834 +   index_unique_assembly_slug_and_organization    INDEX     �   CREATE UNIQUE INDEX index_unique_assembly_slug_and_organization ON public.decidim_assemblies USING btree (decidim_organization_id, slug);
 ?   DROP INDEX public.index_unique_assembly_slug_and_organization;
       public            bcnregional    false    309    309            �           1259    17707 !   index_unique_position_for_process    INDEX     �   CREATE UNIQUE INDEX index_unique_position_for_process ON public.decidim_participatory_process_steps USING btree (decidim_participatory_process_id, "position");
 5   DROP INDEX public.index_unique_position_for_process;
       public            bcnregional    false    303    303            �           1259    17709 *   index_unique_process_slug_and_organization    INDEX     �   CREATE UNIQUE INDEX index_unique_process_slug_and_organization ON public.decidim_participatory_processes USING btree (decidim_organization_id, slug);
 >   DROP INDEX public.index_unique_process_slug_and_organization;
       public            bcnregional    false    301    301            
           1259    17856 #   index_unique_user_and_assembly_role    INDEX     �   CREATE UNIQUE INDEX index_unique_user_and_assembly_role ON public.decidim_assembly_user_roles USING btree (decidim_assembly_id, decidim_user_id, role);
 7   DROP INDEX public.index_unique_user_and_assembly_role;
       public            bcnregional    false    311    311    311            �           1259    17583 "   index_unique_user_and_process_role    INDEX     �   CREATE UNIQUE INDEX index_unique_user_and_process_role ON public.decidim_participatory_process_user_roles USING btree (decidim_participatory_process_id, decidim_user_id, role);
 6   DROP INDEX public.index_unique_user_and_process_role;
       public            bcnregional    false    289    289    289            �           1259    17209     index_user_group_on_coauthorsihp    INDEX     s   CREATE INDEX index_user_group_on_coauthorsihp ON public.decidim_coauthorships USING btree (decidim_user_group_id);
 4   DROP INDEX public.index_user_group_on_coauthorsihp;
       public            bcnregional    false    267            �           1259    19231 .   index_verifications_csv_census_to_organization    INDEX     �   CREATE INDEX index_verifications_csv_census_to_organization ON public.decidim_verifications_csv_data USING btree (decidim_organization_id);
 B   DROP INDEX public.index_verifications_csv_census_to_organization;
       public            bcnregional    false    375            t           1259    16984 '   index_versions_on_item_type_and_item_id    INDEX     j   CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);
 ;   DROP INDEX public.index_versions_on_item_type_and_item_id;
       public            bcnregional    false    243    243            �           1259    17058 !   space_privatable_to_privatable_id    INDEX     �   CREATE INDEX space_privatable_to_privatable_id ON public.decidim_participatory_space_private_users USING btree (privatable_to_type, privatable_to_id);
 5   DROP INDEX public.space_privatable_to_privatable_id;
       public            bcnregional    false    251    251            �           1259    17704 ,   unique_index_to_avoid_duplicate_active_steps    INDEX     �   CREATE UNIQUE INDEX unique_index_to_avoid_duplicate_active_steps ON public.decidim_participatory_process_steps USING btree (decidim_participatory_process_id, active) WHERE (active = true);
 @   DROP INDEX public.unique_index_to_avoid_duplicate_active_steps;
       public            bcnregional    false    303    303    303            �           2606    17793 C   decidim_attachments fk_decidim_attachments_attachment_collection_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_attachments
    ADD CONSTRAINT fk_decidim_attachments_attachment_collection_id FOREIGN KEY (attachment_collection_id) REFERENCES public.decidim_attachment_collections(id) ON DELETE SET NULL;
 m   ALTER TABLE ONLY public.decidim_attachments DROP CONSTRAINT fk_decidim_attachments_attachment_collection_id;
       public          bcnregional    false    305    247    4733            �           2606    17141 &   oauth_applications fk_rails_0796ae37fc    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT fk_rails_0796ae37fc FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 P   ALTER TABLE ONLY public.oauth_applications DROP CONSTRAINT fk_rails_0796ae37fc;
       public          bcnregional    false    261    4640    203            �           2606    19226 2   decidim_verifications_csv_data fk_rails_0e0c3f088d    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_verifications_csv_data
    ADD CONSTRAINT fk_rails_0e0c3f088d FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 \   ALTER TABLE ONLY public.decidim_verifications_csv_data DROP CONSTRAINT fk_rails_0e0c3f088d;
       public          bcnregional    false    375    203    4640            �           2606    17663 3   decidim_participatory_processes fk_rails_29fec61528    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_participatory_processes
    ADD CONSTRAINT fk_rails_29fec61528 FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 ]   ALTER TABLE ONLY public.decidim_participatory_processes DROP CONSTRAINT fk_rails_29fec61528;
       public          bcnregional    false    203    4640    301            �           2606    17192 '   oauth_access_grants fk_rails_330c32d8d9    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_330c32d8d9 FOREIGN KEY (resource_owner_id) REFERENCES public.decidim_users(id);
 Q   ALTER TABLE ONLY public.oauth_access_grants DROP CONSTRAINT fk_rails_330c32d8d9;
       public          bcnregional    false    201    4629    263            �           2606    16515 (   decidim_static_pages fk_rails_3bf12569d2    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_static_pages
    ADD CONSTRAINT fk_rails_3bf12569d2 FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 R   ALTER TABLE ONLY public.decidim_static_pages DROP CONSTRAINT fk_rails_3bf12569d2;
       public          bcnregional    false    4640    207    203            �           2606    16466 !   decidim_users fk_rails_6189fc3943    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_users
    ADD CONSTRAINT fk_rails_6189fc3943 FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 K   ALTER TABLE ONLY public.decidim_users DROP CONSTRAINT fk_rails_6189fc3943;
       public          bcnregional    false    4640    201    203            �           2606    16781 '   decidim_scope_types fk_rails_652d83a2b0    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_scope_types
    ADD CONSTRAINT fk_rails_652d83a2b0 FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 Q   ALTER TABLE ONLY public.decidim_scope_types DROP CONSTRAINT fk_rails_652d83a2b0;
       public          bcnregional    false    203    4640    227            �           2606    17085 &   decidim_area_types fk_rails_6bebb0b147    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_area_types
    ADD CONSTRAINT fk_rails_6bebb0b147 FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 P   ALTER TABLE ONLY public.decidim_area_types DROP CONSTRAINT fk_rails_6bebb0b147;
       public          bcnregional    false    4640    203    255            �           2606    17182 '   oauth_access_tokens fk_rails_732cb83ab7    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_732cb83ab7 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);
 Q   ALTER TABLE ONLY public.oauth_access_tokens DROP CONSTRAINT fk_rails_732cb83ab7;
       public          bcnregional    false    261    265    4768            �           2606    16557 "   decidim_scopes fk_rails_7439b45e19    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_scopes
    ADD CONSTRAINT fk_rails_7439b45e19 FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 L   ALTER TABLE ONLY public.decidim_scopes DROP CONSTRAINT fk_rails_7439b45e19;
       public          bcnregional    false    213    203    4640            �           2606    17102 !   decidim_areas fk_rails_9bc8f43968    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_areas
    ADD CONSTRAINT fk_rails_9bc8f43968 FOREIGN KEY (area_type_id) REFERENCES public.decidim_area_types(id);
 K   ALTER TABLE ONLY public.decidim_areas DROP CONSTRAINT fk_rails_9bc8f43968;
       public          bcnregional    false    4754    255    257            �           2606    16794 "   decidim_scopes fk_rails_9c3ff1b1f2    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_scopes
    ADD CONSTRAINT fk_rails_9c3ff1b1f2 FOREIGN KEY (parent_id) REFERENCES public.decidim_scopes(id);
 L   ALTER TABLE ONLY public.decidim_scopes DROP CONSTRAINT fk_rails_9c3ff1b1f2;
       public          bcnregional    false    213    4659    213            �           2606    16788 "   decidim_scopes fk_rails_9f5e09f78a    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_scopes
    ADD CONSTRAINT fk_rails_9f5e09f78a FOREIGN KEY (scope_type_id) REFERENCES public.decidim_scope_types(id);
 L   ALTER TABLE ONLY public.decidim_scopes DROP CONSTRAINT fk_rails_9f5e09f78a;
       public          bcnregional    false    4697    227    213            �           2606    17161 '   oauth_access_grants fk_rails_b4b53e07b8    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_b4b53e07b8 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);
 Q   ALTER TABLE ONLY public.oauth_access_grants DROP CONSTRAINT fk_rails_b4b53e07b8;
       public          bcnregional    false    263    4768    261            �           2606    16497 *   decidim_authorizations fk_rails_b91fb4e4a2    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_authorizations
    ADD CONSTRAINT fk_rails_b91fb4e4a2 FOREIGN KEY (decidim_user_id) REFERENCES public.decidim_users(id);
 T   ALTER TABLE ONLY public.decidim_authorizations DROP CONSTRAINT fk_rails_b91fb4e4a2;
       public          bcnregional    false    201    205    4629            �           2606    16764 &   decidim_identities fk_rails_d098abe7b4    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_identities
    ADD CONSTRAINT fk_rails_d098abe7b4 FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 P   ALTER TABLE ONLY public.decidim_identities DROP CONSTRAINT fk_rails_d098abe7b4;
       public          bcnregional    false    217    4640    203            �           2606    17689 7   decidim_participatory_process_steps fk_rails_d3df776226    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_participatory_process_steps
    ADD CONSTRAINT fk_rails_d3df776226 FOREIGN KEY (decidim_participatory_process_id) REFERENCES public.decidim_participatory_processes(id);
 a   ALTER TABLE ONLY public.decidim_participatory_process_steps DROP CONSTRAINT fk_rails_d3df776226;
       public          bcnregional    false    4851    301    303            �           2606    17107 !   decidim_areas fk_rails_eb51a248f6    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_areas
    ADD CONSTRAINT fk_rails_eb51a248f6 FOREIGN KEY (decidim_organization_id) REFERENCES public.decidim_organizations(id);
 K   ALTER TABLE ONLY public.decidim_areas DROP CONSTRAINT fk_rails_eb51a248f6;
       public          bcnregional    false    203    4640    257            �           2606    17187 '   oauth_access_tokens fk_rails_ee63f25419    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_ee63f25419 FOREIGN KEY (resource_owner_id) REFERENCES public.decidim_users(id);
 Q   ALTER TABLE ONLY public.oauth_access_tokens DROP CONSTRAINT fk_rails_ee63f25419;
       public          bcnregional    false    265    4629    201            �           2606    16826 +   decidim_categorizations fk_rails_f4b8873d6e    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_categorizations
    ADD CONSTRAINT fk_rails_f4b8873d6e FOREIGN KEY (decidim_category_id) REFERENCES public.decidim_categories(id);
 U   ALTER TABLE ONLY public.decidim_categorizations DROP CONSTRAINT fk_rails_f4b8873d6e;
       public          bcnregional    false    229    211    4655            �           2606    16705 '   decidim_newsletters fk_rails_fad1d5e21d    FK CONSTRAINT     �   ALTER TABLE ONLY public.decidim_newsletters
    ADD CONSTRAINT fk_rails_fad1d5e21d FOREIGN KEY (author_id) REFERENCES public.decidim_users(id);
 Q   ALTER TABLE ONLY public.decidim_newsletters DROP CONSTRAINT fk_rails_fad1d5e21d;
       public          bcnregional    false    201    221    4629            0   A   x�K�+�,���M�+�,(�O)M.����420��50�54U04�22�25�34�42��#����� ��      �      x������ � �      �      x������ � �      �      x������ � �      b      x��K�W�.:��OT����ऑ��utP�U�ʃ��H2�U0��	����;>���G���8@��/�{��#;���d22H�U��1S̵V콞�a�����e8�F�d0��,�>#��/Jn�y�ٿ~�0�~>����hj~����*�p�K��s��$������ �����3�z4�������Ï�,ȿ��������k��W�4�_�&Q��Y8K�0��a�s�2ɢ�Ň�d�&a2�7�� �G�h�����ϦA����o����|���р�A���&���~�/�$�s.�����H�%Gz_9�[̂$�Iǋ0K,P�}B$v	t�J�e�(��@_�
c�]�d�$x�< �+�$�M�K��-O~,y�{h�D��>�2��X����&�%Pn�IJ�6I�S0��$���o1N�b�c��#@��J�͏��PCx�A.���}��!2Q"T�k�U�Q]&�&kdb���_M&&�kb��a|o1j��*��ͿM�˴��(��M�o}���p6ۘ�0�jb���"����v
�_?��?���s�C�%�(�tb� ozc��������9��y�|D(e�	¸.6�Jl���Լq�h���>L���y���a����	��1�hbΩ�p6�~�!��y�K!eV���.�L
͛ L�����Cv��э�嫋�~���W�+���o�|��������`ƿi�� ��z2'{kE��)��`���y���܋�i�Y4�)��0#�i:��w<�U��C�>5@�;4��k�uP��.�����.��^�x���W�p�%כ֞�"��CO�n7��_J��	�ȂbMm��tȍ���(DzT"��7p	��!7V�ۋ��h�=�Ap�����//�y�᫖�S>�+�a�P�B���8��p�HE�|����`���� �Y�kU������,���C�*����8�%����Ʋ�P� G��������`d���9�g/����ū����s% q��d���!�K�G���x��ʣ?^����K���IL��"\2ʐ˙���wy���z:ϙ4���9e�v!�
��G�[ut0L��W���8QP���T��#I�� ��ah>�x��]n��#I���*�%������IG��\P�Ҫ2K��g��o��&N�IAl�l%2o%���7��kq��¹�`��G��V���?Mux�I�ǿ��0�!�S��Cp[���y7�v������7�
*�Bɚ���E55%	v�쏯��_�F،�1I�e�d.��ă�Q����NZ2A%�VX�&�:2k�)	��wu��~E���>�\�jXR���3�ԋ�wQ��ŧ��i�^��� ���X�En� �mۥ�d{�Mør����Yh�z�N�J�r_ˡ+!��w�5�UC��xA��G���o;U�(�S�S�T�pT���z��
��<�yz7.�����,@[�G��>��3h�a�hĉC=M����9����#���TP�� ^:�%	Z6��ytsnC�]G�Z�>R��[A��Ń�sO��c�=(�C���ėRK�� �p�)�-�;<���C��17B�bwx4W���Gr
v�����V�#T���RuD����T/��7���k���\��)�D����rЮYSd2W�C�r�&;���&�U�P�	¥I��8�`v>��|5@��kL� !]��m��*����H�f#�������(��\�ND����<�L��3_���f�6u�n�NÝ�[��v&���F7�:Yı�g�	�����_��n8���Q�|��J�l��O�z3� ��2�h�m�.��ɕxo�,���<.ob��&я����I�����Z6Aґb�6}�1%�i�}B�	�Ѓ�S)fA;Z�}���	R��F�(æ���
��%�:�R�������q�!��裇�$Zjb�SED%�@�u��� rђ�I�EK�)Z�}%��	R�9,V��碥OX�t�����JKΛ ��f�:|.Z��E��)Z�}�@*&� �H�zM=-¢��-W>cJ�D����kU%�P��K�p�E��b��8�L�n�I8�гp8��F�4��d�q��O�a����"�f��#s��Z��'�XM��2|¹��^�s0z~T��T@����JB�9�s�-B��*��P�B����>2^`���9�Jn�N6��	��|n{����D}���D�-���v8�ޛ�-�X���y��Af*A2�����&�)T���TI�%欵��7����q��ѝ)�ޘ+4�~o�`�w��7��P�6A9"p�W�U1���w�\��杮����]4ཙ�~,��{bL"d��@�֤	r��M�;��K��f��f����E0s�e�$`l�"Ju�f�9,�v:��\�A��ݾo/__�'{	>���D��Z#�a��}�.�m���)ԣ���b�fs/4���9�`\� 1���pEt����U�� ��^G�k�E^4�.�Y0_�	��Q!*��da��]�.��7�0J�F��S\l|�#�I�����7�տ7��>CZZ{���|H\�97mw⮡	r�T��� gb��_�%�i6��צ��g�nE]$>L��H���+,q�����\�����+����Yo#�\��_!g���|%��I�Mv�V���(�s��ǣ�����R�ų{������9CI���N�X�r�ꎎ����Cx�澓Hi)� �t�*�w8:��Gl����<�t���+�o�k�]�.�X�P��m��ي����Qs2)��b$��S�ut's�������
�z��v1�
��[谳w`o�뵻@�O���h�7A�D=)�1�w��f_a@kM9�zn� LXQx�dY󉵣��IZ���f�Ho�0qZ�1㤺{VmĹ�dgU���^�W�~<Ps�JÜH�]|��f�������bA����ZCK>������	R�=�*�]��<LOg-���TL�aZ�l%�ճ�C;HL�P5}�?�Ӈ�џ�����̣���O�MX���zV�Q�(����쓫'b$k��\uV�7��m<������dd^o}N����k;�j��O�s�h�KL�҆���a�=��J�C�b@���"�I��یQFc�a�����ɣ���z�(N��Ho%�Oƀo�^e�x�1��h����=r�W�q���Z����8�1��Wݍ�Y�ݐ���N���l�if>�Q��ʃc�^y�9~�`���p0�|���O �a��s�t��"Fi���Y8\d�;/��_��4�̫�r���g�<Z��h"�-I��5�^g�Hޤju��]l�2���gWƎ�(�v5N͝4z�0M{�_g+s�
�8v�A&kn�[�R��5RA0+��J����r�&2�H��������"�l��y�W7�<���E�(.� 3wX�a�%^�4�}¡f�4	bo��yh>�s�#ϭ��|u�N��e>��b{��&J����>ג#��m!̋�I��3���B<��.��ʬ�����t�W~Lb���G��c1t.M�R�P4o6�7-f`Z�Q���v�J��M�-$Z����A��=�Lo�yhs��񏟿�b��%I��]8]�߄#�XJ��/��Q�vD�����U�#�v�ݽ���y��V^�g�IF�z���	��>�WrOw&�͂��;� �28Z��
�^s���<��LS��G#�Zc��Z��]0t��푬g
����]�l����h��IﭽE���9+�/`���u�� ,K6@[� � Nƞn��Qv��'���5:^�����8�~`&�pl���~�1��,�X�&���)�v�A7k5o���J�>32[�"��QxA�5?%�۟m�C�M�=QXT���#������B��$T�F��
�˄��{B���,\o]�-`�/�V7A�;�n�v�{X�����t��l"Y;��,*��WY:��8V���Gs��7�i	�#,�B��
�Ω�����1a4~��#�A�phӫ0��}��}L5���T     ,�U�b�f5/�E��X���q�0�h~�0��^&25o$sc�u:\�N����4Y���\V8���4�m��������Osh��A�K�'M����j��:H~cO�qL�!�|A����rO�� @Q�ⵚ[���\�})�x-$g���f�T--BV��F�ν$	5|w�0g�y��ئ&We�ٗp�C�
�O��hsG@�rfYd~�țZ��60�0��#
)BX
ݮ��t�Hvi�r�� �c���o�a0_���*
���鱸�	�ܡ�#��홣'���°ϱ��)�R��]W"9H~�@w�U��$��+�'q��|��֨�!�U[Lo�kJ�	J|R��QM��,��+����Q��tAF��q0�/�7�ZN���ϕ�6�J��xo!R�Oۙ�f�{���,b��[̣��ў@�	�1ς�<5�l��0��(I�+����(����� C��F�q���x�P���>Ŕr�-�T�
&Ю����sǁ�H���h��dN�a�.l�SXQb�����&Ie���/���ʝM�MÏ����g��1p��}�ʡ�%BS�q�JV��,��5jgG���.���J�V��|$are-h������<�i��m�m������2%A�	�6w��h(����}7.�p-%Z��*v��vM;��e��!e5S�h'�����86gMh�,f/�]��3�H�a�ªtܴ�bI7�J���8*Y~e=@J�4���y{dD�ƳXeM�Ls&d�����g���3��l!��!�nW�#ݜ�}M�qt�&��H��\N0�w2m��%s��!�BX�^ݮ�B�<�t�U�7	g���0_�=��rc�������4���n�f�<�˟�Q>�2ɋ�~�F�E�ڑQ�T)��ο���o73P�&��U��uy�M/�ǉ�[�+�Zz?)�&���蔠�2F�����~�K��S�6�Y��f��lf���0��0xn��������/	�ւ����Y�s*hG��U������F��tM���r�8��x�6l	K�>��|7��J˚�� �KV�nV�v�;l[����4�Vd���<�x�����2b�j�����0j�oeݜ^{W+�KX���'D�M3��EQ��R�hy��X=�f꽞1M�Q���o�7����N	k0=Ob�:y#fEU�<_�h)���
�͠��b����W���y_��O;��p����^�X)l��������6����vB٦ ��?�;$ @�S�e�B��RH�ە-X7��B�d)|fӊ60���mI�vY�ʣ�v޴�V@9�
Ⰲ�J�Ƹ]�&�h�f�ϋ�PM+ZN�bs[)��a�=�kD�f��/c��*����j���ArBw��1�
vⴤ�v�欛mw;N�g�M/��N�Eli�F��<$6a��R��K�Xq�k.b	�n]�.�Ⱥ�B|ey_�������t���qa�<����(��P�� mZ�M<�D��2CJM/%q��A�eF��ѵ�u9��� S�ƚ(�ҷ�(%q�D"�f"q������qi���N��S߉��\���:-g�"n�A��� ���'�K��|&1G� ��Rސ���n�Wk���'�)�Eh�p���R�K�.'�U�͗����T�OoO!k@�ےH$k�e��@dUi�Ϸ��|���y�&Y�x�d���:�ƉQLU�!��M�ZB5�5ȹ,**|��$�	�ܱB�ݵ:��k}U�^��_F0Ē3�G�y02z�y�L�%�y�m���N0i�]��̮^��r�wa�M��p���*�`ŪcL#���O�~[�m<^^m�)C��U��ZkD7[k^�(����oW+,`f-[���y���`J�q��A�NSs�s]���-�;�5;�V�u32z�o�-E�fW�Q����Y��$�wFɪ-k�NE'�z�2!�0V�F�%����K��n�^K��'O��?�U[�����D�r�k �Q!]˭!�J	U�n���2[�W&���l�5�q�[�(�.�E����*3�$�~���˷�m��&7�,����b#o��d��uu_�~.�U�Dy)]G�-�n-�}��(o�c���޽x{���g�}�H�%)A�T&��6x���^��i���t�l}8r l�]M�֢�n�8Z~��ղ���D�Z��R%��s_E7�W�Ra���C�"�^'l�IJ}c��Gpۘo1Z�����yf|�4[�<�(�6M�m�æi���i�tɥ���E��\\@](e5�w�f�s��o߾��(�B�Hܓ�x5�f�����7��r8��\Ղ�"Dq9�ҮWIt�W��I�?v����|ӗo/_��d��K�{22��Q2ʷ�y�8��ac#�0��
'CHjbd`H��}U�(.�WT�;k�L$v��Zs(�[\��m����|�`gXM��	�afv+d�͇��iR�$,Aͧ]�-�o�]�y�7-��+,���֌�d�!���W�v3�ӖB
��I
�%�܄��R>���wc�8�T�6~� JJ�7k��G�a��WnlF"�O^�x����Ȼ���5�뷙�2~5E��P��R�hf���e7��/��ܡw���l��7x�`�cv��,��+�E^�J���{����>�W@(-M��v�	���	ޛt6�����8�t^&��X�6��}�bbʘ�5�!JK�]\.���Iw�F�|�y���m=�j����������ZKV* ���o֮J �Y%��pX���8y�gDT���R�0��?���"/���Vħ\��	����i��z4|���0:V;�ZN�_,����u0��s��e+���?�=7�	G������D�}�=�����R��tه�B����	�5�n6\$�Oq4���vD����1�{�5�V� UNH��E��Es��*���4v��-��"�����ux0�X8R�[x|���.�݌�JSX�w���ς��~��sJe�|����������v���f��� O~��1���o�֑;���[�� ��1]�z��f�~�Q�Y���p��K��ָ1��lSu��>'�<��R׶B� �KUxޮ���YK�YƊy>Rj�
�6���c�CH&T5�/AT�*���堻y9�7�*`({�jZ���_ͯƯ��[Q��)@0�0$����Jե�A��R�ݜR�:�t��e�y�&V���|43
�AN������yʫ5��P)�G�'�'���=w5�Dh��S��/g��eH�ƓH���M{��c@��LGX�Et�u��+�n�ޕ�m��f���:-�/)$� �K���è��0�����4�<�,�
�*x����}o�3V>QX�
�%������U�U�+���,�̇���w�-yD�7�Φ��m^#ܦ����f,�"�	BY�z(AT�<K�ΕНv%R |��'��`�l��|�|r���1�l"�|�G"R�J� �J�o���O'+i�֋3G��f�j4��V u(NkD�%�⊹�vs���s��"�Tb���oToՇ���1qI�i$� I�@$�֍V�(+�%y;�1�e�1�&��UF�a�/jv�e<�>��L�R�N�I4�`g�a�1�i�4���p��zA��ff\�}��"�h��T���X��(���0��̍�w��q�Y����X<�Z���ׄ�ƢrN��/�����w��\�Ϲ��-Y%��r��n�Luy��Ŋ'!�z�R�G^�'��9��$�c�߬�c�/��+���wd��(�=�`}���>H*8-xm�R	�����ۥ�U7�k��p�X�gòi������2�u E�k��v_K`��g��Y�t�	�͈��p�p�7U��hG���I�7��f��2�u��S�5�1[�{!�ն5�K���㬻�8_ؽ�6��V���4-�O 7�<̀�Tv��>u߭�r_s�ke�Duy�ݕ#�y帒/�t]���7����^+߄�� P�8����ۃ��=T7ow��������X�ce�F�����(_��z�.o����!@���.�3�mn�Y/�{���b�v�#� �?s+(�j�*ż�]    �Vw9O�2�M��I��XPq� ��%�U����htcμj8�{7!��?�\��vJC�^�v�i���i��K9XX�3��B��ׂ�(�c�8���N�L��!�nN�G�PK/��еR_b����V��.� [G#��.�٪i _/G��P�8[��`,}�sMP��(B���v�a��ea�#vIzS<7j[h!)��y�U
s�ZFj�FE��R��Э���&�����q������`�E|~Ф�����7_��q��Ϣ�W>Ҝ�Z�1\�$���Z��־2GG����Ĩ�3
r��������嗖�����C&���&6�r��6��9;$���ĤއT�)EƲݐ4Fݜ�>�ݼN��0��(o��c0�1K#�h�� 0RJ�J��:H/��n�Wk�jwA^�͛bA�q�{(gR�>�����i֠4��G�C��%ц/X�W���m.��М �:�lŞ0Y�v�nmF�\i`�k�)u`�v�u���s�����d9S[����~	�Z"�B5�!F�=Մ�.�"�ҋ���Zi�ҧ��8�����F����^>�x��/^-�WAg��C�n�J��P2@�WB�J[k�G�]GF�l){Z6�l�-��y���/޿�ʻ=�����g��7�E�!���]Ȅև,���|�j�5�.{/�`6�U׬�,��X��M�ϼ��6y����({u!d� ��#C����.�8$�qMg���o?�q�=@�|w	'�;�V�e�ݲ{_���/��
�|&�q�� &JT�e�mw5�T�{:&�3�'_Tab��O��5��ĠūJI�*�U2�q8��l��q�ؗ3x�����//�y���#xǯw+eU�l�� Q_(�%m��vl'�79��h�����_����_������%��}���Բ*��w]K��P>����%��&薇R6=����c>�wT���d���d����pT��vb��˶��>UZ)�n6/u����:B��TSYH��d%QQ�8vP���Y�GU��)&�B�_�x���`�@�;|jZ�z�1���]�8�َ{v�v��C�S���|k�U���̖�v7Ƅ�O�!FK���]Հ��u:B� ��C˷Z�TڬC�)�^���^���>GT�*�Z	b�F`�n��.�_�`��歱+C�
�as\��
�#nTM�P���o!FK]Ҳ�LF�ʻ�L�8~7`@o�i�T),rm��_��H�8��mCҪb�b1�����`Y�Ͻ7#fN!��A!�J�Ժ5#&��f4�H�@%`lY�g��(�}i��!��B����jW��-�a��!�m�~b��l\�+�˂9���ʼ%�$]�!*���}+E@�0#�:JZ�`�h��V�~�����E����-���k;��N�!�k�	m����Ӝ�a��#�j�P"�G�r�P-KS�8rV3 -��GM <�\�Q�-}�*^ᰄ��%vNI?����%��^�)B��Tt�[��u39���W�W���<٩D�T���e��S�h�^{5�O6����R��1V6��Cg��Cg��a�Mm n�1�.G��"�;�z��i���+a&�F��+͗��sB��sB/��X��`�g=L��/�n�oKj�uj��[����K�k�vb�4����`�ebsT�F7��[���-�A�H�ό�D}�?�>��k+VK�>�U��*��p�V�A썢��Y4_���m��,���9��U�%��R�F��I7}�K�W�y��c�^�
��іX����3e�> ��	F於�:�w�`u�D��ydn�tl>v��I��&!�A�"d��R6��boL��ٻ����[�l�6K?F�����9A��:�1U�K�-�M�M�]��s;�3���-`
�ʔr��H�,m�u����Y�0�6�M���t3eLzmm��
W��1U�cu˙�U����kG��z��L+]s�K��պt��r���}5=��a>06�l`��,(�����I=R�m p�����4�Y�U�>�E�cuae.8�1st9�J��O�0i	%�@���e�Y�Ī%��&�Ӻa���T�x���b������y��n��M��&ߙcXt��t�
����S�ڑ�b�mv�]��k��=�@f^NF����V���'ꌼ6�><Վ��.ӕ^�3��Jލ�M�&+��tCq�|I����-BL�Z�T�U������BqI��f��nÆ�;��pߍ:�	ìV)(BL��zUT~�!��z�O�=Ǹ��D	�|�L�&Ȅ��yD|�~Z��x��ρu�:�U�܃���Tj灹;)K(���-+�@���PVc��yu߳�X�Rb��o�8�	���Ƴ���#�|��"U���qi�;(dnц��c�i.��E	5�D��:�D	��9/N[tL�H���
ĉ�3;8RNGtt��92Ue�yᄸ��_r��}	�}�^�=IA^&�	�*�n�����^�W5%!��qh���d���y�=)5�tLB�*3F�%�vBJ^r���#�a��	�u�4�q�3c�,U�ջy`�f���_�I���l��qT�H�u��e��y
��M�\��0�"HF_�d���F��e�8-}���1��W>��!x�1�Ȅ���� �z<!��;3�yH��P���;U�8Q.-5��G���#n\[�I^�T ^a�Q0�\,�4��Y�{�n�a�+�^��T�iUA�~?Z���r��=:�T����DR�uĩ�a'<׾v+7}�ѕ��N_�]�S�k%Xe�r�ԕ�$��p�|�	��	�E�6�Av�2����a�W���I�N���# ���������ڶ`��l�w���xà(�.]�r@易U�;*�NJ���C�Q��ҞsR��5a+)*	*g�L(�'.>���}.����q�ʆRt��Sl'_�Ĩ�YW �\1*�'.>�,�Mg����S�>Ƅ��	�]���Y|��RS$eĹ�����G�O�J�HM|E�s���O]|��0��
p�̩8���De��(B��j\�e��g�1�J�r�oq��O���!;[׸~lWƀ7>�jF�L��� �]�#X�|��ug=�Yt����N��/y��)�	f\�&�sת#�YV�����?P�z�Y�0�o��I���C�u�ȬB��<mhJ��$1>�M�ʖ�y�f@��ۭd�ſl����y�߽p�^�}��I��A�h�f
g(���T!.\~��j���$���?��6'Wq��"��0K�	�-�l���W���.\>[��=fr����o�>�`������{�m�!=�r��/E�q���<��i�[�v--�*��C\8{mN8N<�Fa.m�C� 9�W�8����"�rt�J*� s1;���\������	+�|�!.\YD�_�y-�|�	L� .]IBx{-�iiEk�S��t�����\:w�gD�&�K����AW���� A{���zg� �"�N=N�t��̧�4�SC�t���lL @�Բz� .]�"�=��O��k�f:E�KW"��ӻ���.}�1���E�K���{�'s��JjR��J�.?Y��O��Ĝ���M[C�tyɢ�^2�M$��Tb�qĕ�K���� C��G&��U�)A\��d�k/و�A��f�q���jH���Ow��D0;�1i@�r9˂����G\d۬C\��f�k�*��YB���:ĕ�o����mZ">��&�- ���4�D��$�'������^�4抢��c�3�P�K�����%������Cl�I�=O��7�]�1�"+�K���Kt �Z��D�|��]�͉�uމ�~C����aI�uBL��Cێ��%�kWX!��uV֝�E�h#�h�	�)cI������Ԕ��X��v�[rU�Cx;{��{TJ�Q��)A���Odc�V���Cz�o�̳����sqy��K;�Am�V~�N s
`�q�
�d=8ۊ�}:���ѕ|��*�}�+\®�ao[d~h���[���m+�t1���~���Ꝅ�Eh��#�Լ��I8�7>P�0���"c5iY��s��|x|�u=@�WJ+]TJ׮    xZ6v��׈�X'��j>�q튣U#1U�f�K���kyR�#&���YE�kWĭ�e�;7s\ԏ�̽�7�9�9N�-ĝ�ת^1:g�jR&��3!y�Ǧ	�
�U��t�I�CJ�m8��v�h63�({ԩ#+E[��!�%U� �\�=�8Wsp.EXh��&H W����X�h�����$�+�UM��֍�qx�n��'�K"J5A�B_��=콃�*G4f1Qi��@�8�ccȶ��S�|.G&|�(C5{,B��3�����*�V¢����
�tshƎ��_���b��<s����]}�r6���a�����"k�CE���N0R�}�@��0�`YrEa�7��g�S4�	����l	�yK�|4L�c��}��dfnt�K�uH`WХ�L���+����?���5�ZVρ$�+��¦�`s�	�T���B��r	�A�t�Fz��Z!Q��JL:� z���^����n1Rc��ʚoP��s�vpAݹ��Hw��
V����1*��r�iO�;(�}�1��EH`WԪ�1u�َj[���Kc*� ��E�>���,�bg���������M�H��O�꜠��<X��ʸV��-�ܚc���4�x/����,�q����Z�����0;T�|�de���&B�)����B�x�����z=n��J�^���5>��ұ�9���F����g�M0�̧�Ӊ`$Ł�EJ*�/H��R��t����%�Cz�V��ݖ��J9�	��A�c�rߑO�=�U�x�ݪ%���B�.?�v�0�#B;��͐�Q�k�	�)r�(]~�o���p�����P��k"Ŏ]g��I(�K�(��TEHGy�"�R���o��q�2��&�-ilKK̜��
�_� �m������]�0�x�/	�j#����=L�*�qa�P�R��g^�r���Wσۘ%��8"�$6g���A2�	�J1`�N�Y��'-_��Q�w5��S%*~T��c�N�-v�M�/������]��)�Z���\@uØ��26Asw��j2]ĳ ���4��L�B��(�>qf���Q�x�QL���Åyo�/2\��
�ɾ�ܼ����H����w1_xm�&�f��t>Z��6׆���&4&�j���k��vI��CxK���%�6��M��,.�޼����_e�f�܆&sc/s�͓9���o߾6�s���ߧ'�}J��$�*�	�\"����2���M/�+���/s��K#��=8F�P�� ?��f��γ�n�xaN�$�1o5�n�:����q4
�,�W�M�8Nͧ�t���1^�:�qz�����`b��Q�ӧ2�X���W���}�
�4~7%|�J��Q�wa6^��F����3�S)󵉕k��%t�E�Q,�fE"}�i���
	�yu�Ϲ�T5A��"�jb�f�wu��_2��{��@��	F��*��_Ñ�Cr�x��$��v$�*6̘B	�d�i���cH�hi�\~�JVh*�p�Ԧ��|�쭒�ж(����!A]9�Z��ի��1)m
��f�E����nZ�E��ږ��j��ʗ�cU;D��p���w�Tw����Y��X�#��k�k�o��k#<%�`��*`0Qk��e�*$����Ð�@�+�Q�-A�8Z`N^���&��B��Z�s�NЦ��o&F�Ӓ�2b̕~�Ma�i����9-)U�L�]�n1�ƀie�����\����.�C`U��Ci�'u��Ap��B���S�sN�1(=�〓G�g�"�
$�+�I�"��Z�u��(=��.��(V3�"$�+�I#Q|�d�A�w��2�3�Q%�Q�s��hcd��r����,}� %�
�]n��B�;o�s$T��I&E�]�s;$�+V���~�����-��wޛ���_�x���wL�<Pt��"���X�wE�1�����+D�l�w�߬������g�)Q�BJ���5�0�����UϺ$�+�f��3GsZ��������[���;��V�j�H����.��5:�XM�/�}m����/���=�L�n�`#q$��af��:�����W�5Fg������7��y�ֻ8�8	��~i����QDw�Ѭ)�Pn8�+��v](�|jL�M��|�����w���1�?�7���oQ�Y.A���0�1�ǻ�|�梼��
	�
�Xc�������G��]o��pn���'ܳ� �qd�b	�	���>v-wX:�ɵ.������72���u��x�+��I(PaB-$��:$�+
㍬�;����N2������Lv��Re����g#���v9L�47�Ⱦ�!ڟ��k+1�!!\o��y�>�-�Dc;Ff�fՌ��d�� �t%U<�����P��p����9O�'�ƅT1�f	����"�	A����
���� ,n5��dM�-�s3�K�e�$�����[���0��	_H�n�n�X�9D��,� ģ\0�@��X]\e^��W�h������F��G��E<^$^�`�hq5�ԃ����ܟ0���5CL�&HWFP������&���T������h&�����(��UU���5T��א�t"�x�/q��_>;����"��E0k�����m�߼�|q�����
H�<������相��qxd7��%&("�W��$�+�)�Y�OU��\�F�Ԟ�"$�+�(x���ٹo��})z��V>Ё�}�%�Uw�	�<,���%7]\���'NT�K�8������SD�䟙�}#��F���z��B��95��	�
kD}܉ȍs�S KB� !�K}��ȍ*1�4i��t�&�^�;�q�s$Q-�P��t�!����PM�TrQ{N��P.�S�v.Ȼy8��w��ڼ���?Y��6�/
⭴_%s�n4����N����+'G	�U��cj�+P�5��d���r9ڒ����N+�G�m�V�,���tSv	�I��b�3qb9?���t$��A�˗�2sbi=� D"�+$��|�w���#$�k�,B���Tw��wXG��S>�8��S�i$��Yű��$�R�ٹUa�� �\��c���ȍ#_P�k^`	�����U��^��<JƳ���[:��x_ǋ��f[���cb�_s���|�3�M��_~2K0�aɛ0�{N6�����6����g�U0*��\&C���[rѓ������Ќht���tt�H���%�9��Z�vT���ʋ��W��h�垆�'0�����1�q��Y07�=P�����z�����<7�|l|ݼ�z%ƛ Nm��$̆���L��3�b�q��*Aҵ	������d��^��k�5��J��3ǋh��sD`������I��S�zGS�u�����옊�o�(IWwJ�4�gFK�`ŭ�]L�q��%��7�s�f�p�[�� Z���&H�vh0�
g����~�z��m���|���
�(��tQ��|G�N��NF��)����[$�,2����x����	V�i��l���1<�^�p��ǵ]�i���� Y{�4���~�45�q�3�I'��wH�d�aSZ�Q���>\�1W�	ʕ����y�r�D �F�X���,���B}�d��5��Ю$��k�Eқ�����GB�v��!�dU��L��,����Y����\�� Y/Z_��¬�q<a0&�Q\5A��i�n�evQY�0+�`�Z9�k1�h�K�d&R���!�\.�m��-�G,�S;L�)�zH���H	�����r?��#�J���F0�1�W��$��\Q���ͱr2zg�g��j�ZD$v�,k��������e�X���§�Z7G	��Y��cWBsX궅N����4�/�$�����`��ٕ���%!�P���C0Aᰳ:�҃ OKt��4�@�� I�肴�SN��$�P#-� M<��������ϒ���Q%D"�c�!IʹU�qk�6��)a7A�V�N���B����j�	��m*|���rH���ajN�`6��[Q��s�v�<��u�9�ۮ�/4��
�Ю!	E��c�NZ�Q�(!�]�ت%_���}+��\?V    Ap�k�x��+BB���]F�v���#xONw�XhD��ڕSwi�9O�Z�j��/8ǵRm	�e��NrZt�FLP\>�H�fPK��.��[��\뎌m%�5�E�M����w�f� �"f�Uz�qӉy�Q6\�A换,Gs:ϼ�<���p���z'�˟��#=��^ �6����S�7����X!ԻG�,������>����G���'�I�j�F��A\׃D�O�%��D}$	��J	���1$�������ӎ'��8$�5���F	��Yr�0��zt�r4@����M�[��\��tv?L�q8�n�l�0��Q��W��)�0!Z�m$&v1׶v�ߛ��='�\����R��U�ô��R'�E0�=�=�/ �|͔�8x;$�#�e���o'SJƗ�^����wS�3�tm���H�<�y�)�n��l1�{��N�h�O�ǁ���o_o��[F�"/X��_͸O����~�4NXu@�I�\���`d�Sb{�nE$s�����s�0�s��谜-����.I��!ბB�<|���t�):�_a�-���qG�]��Lx�E�3�kY��T�܄���9o�T�A�vW�0��	��=�vy#��A"���c0�[;TF\�i��o�k%��@�^��O^�x�qd������F�H��v�\�JHRYRQ�$w�'	;����`��AK�#Dj	�"$���h���ݼ6ކ�Ed��A^�_W��qup��P
�%����s�؁��Ԟ�"$������Ғ��@��b�t8����Q�4�zRN?Wƨ�>3pЁ�{�!�M����.Q����|��Z���1����<4
͇��9+L�V:Ȣ���Q:1?N���L�}��ܻ
2x���,&���[��.�d�JT��� )\̞�]�#�I��ؑz\3
m9�&08�W������94�}�Gq�M�VB�Ֆ�
�Si��<�ԃM��6u{�ȧ�Z��Iע\FۥN1��ew1
�p0E+^(p��61j���?��ZI��O-e C@�� IתyF�%W1�f�t	�(�����?�G{!���s_j�q��/Bҵ���v�:�t6��晃��-�_�Y~�&O�����\�Z�F	��M���K�c�MG�U2L����t1���y׋$w��+~�|l��%��ɀ�ȱ��KJ�t�Tg�]��n�W�U���\ϖ��ߌ�0!G�l1[����@a[��jPR��k�:��R�w���2ߗ�_	�e�'�N����g�!QMi� ����h۔F7��W� �0��i�갖�6���Fό��}b,e1�ٗ_���-8Jl9n�Q0��������K$��Nk�K�������:P7���i=�c�a� ުrS��r5�&��'�����qkF!��ދ��~�����?��[�֫)�(���J�te3�.��M[z�<�i���<���(Y~��e��O��*Ȃ�Q��7O�F+��&�E0N6^D����u�l`�6#���AS�i5*A
�B!�61�I;z�-?��k�6���W�<�����o���n�(?��)s��s��E���y؜:���/�y%�d'���,�<Z����}n��V_, 
�<'�ΰt7C��G�WX��ot�f��o^��jEz��@=6S�&|"q$� �dd?L�Ǥ�9SE6�l��A1��HR���V[��d�O�BĀ_`�m��s�^���m���hr��r�F���@7Aʹ���bè�.�w��^D2�g9E�*��8��W)F����N@�ٿ�"`q����[D�t��5��(Iw���+%ߐ���r�EH*gݧm/R'�����N��0���B=a�o��@���d��sP��r�VX۞�n�_���"��򶴫(]���eP���&�:�U��r]X�m���ֺ��p��0��9��0�Gt���N6pjl��i�r03=+^�,Aҵ��@�L���͇I�҉�Ͳ���N3�r2���~0�+N�62� �"�f�����f���<����9%~X~����N2[L�w��z"�?���hb�3��l�Y~���﷩ps� �*�j�o	R�i*4�}���~�?Ϲ�]f"��B�k��"����v!�����:�3��������-u��I4�T�v�,����a&���*��+�"��Y�6	�ݗ����P�]����Mt�ȁ$��q3�tO����Zb^	v+�r��I�[8b��l���>L��1!�$���ʽ�ۨ����Mf��iy��I{�s�sɹfM�����Vײ�k}�b��>+I���f]�t}D��[�SN4m��*�g�m�W7'ނ�vf�m�W߽���민۫h�w2�.�^�ؕ�@o����S���$��A�����hʠR	\Dә�2��ۏyY��ɛ�.7���,Z~���_���/}���aXd�ת�{,Bҵ ���s1�,d\�`5{�hj���mi�j8�m�e�u����c�PYc�,AҵH���Ev��6��}��H�s��ë�03?pq�!�_��lE@I&y���ݳ�&Xu�G�bM�8G�f�cVpR���v�� ��C-ǫH7K�����_��4�_����Dd�,��?F����f.�Z�?�kr�yu�!����j&�]:��\}�	���	rc�L�2��D�0�k\*k��"��3�ْn����E^6[X������g�4	�B�,�>����d&��7����hdW0� W��8&�>�8��I3�kg%Ha׹�[2�u���M:[%��U��
�˘+kV�� �U�c@���D���Hag-��m&;:��y����xL�w���!Fʒ�j5�"��s��S`��&���R!Ek�&E�$
)0��3Dp�:ŉNPUjf�Z���@�)��T�<^I�\��j�k��\U��*�����)L��?���hh��R7A��V��Vu�Nf1�}�7�W��}�[���nBۏ�, �@�|Xd�����M��I�b��MD,h��@�]aDtӧ����\���߿]qD�w]"��f� ��H�}| ��mLZ�&Ha'gF��ݤ6(5�=+�y�f�b�M�����#�wF64��*���l���m6��T�B�"���(i7g�:�~|�.��yS��jߏ,�N
Y�mZ:g��rI���M�[6��8���!d�s�[�{�_�\|����|�����R�	EG���eݝh<b��h��-�ܞ��Z�%�kG)Yeq�@��:z�܏ut�X�l՘���W�����U ��0(Ԟ��.Q��m�j@��#B��e+�rn���-Zv�f#'��@�g�O���%ȝ��N�N:����}a�9,���y��i��%K�iu{\RΕ)R瓁;{sv����{�e:��/>\�)���ٟ�����O��5���?��Ժ��"�Lda���r��&���Š���+����.X�'�5|�$������'kt����]j�	J�E�}F�	RN�gI[>7)6��	F���ß�����ad~	f�^?6��>WTW�
�8v=6����A����u�s�f�w�����z�w]�3�i.j�NE�<�N��
�rE��4;��n�d����J*V�d����9���=G�S�-D�-�q�����ܴ��\�^e�e�ZM,AJ:�	�jN��yq�8�|\ܣM� '�ն�����}`O�"9w�Q��W��%\�&H9�$��c�#���7�:w��c&[�J��`�	RN�H�'?�ܚ�����l�b�A���S�J�ϛ�5
i}*%� � U���$����9���|N�V�	r��5jc�دe���zgD|E� ���q�8H��~M��G��T� I	�P��(B�>Mژ�A��n*gFѲ5 ��̅�j�R��s��m� �x�5��ǳ*��'J3����{O����ۍN��h@�ϸ ��H9�u��3�쓱�}��e�J�r2��VM�O�Jr�h4��>�®d�RN�2�*��I����0!�6��.�"t���]l��М�]�=���7o߿z��ͅ���쩟M�z�sH�U5QXD���M�FA��H�l�^�tX�?D{�!P�V��l��ɐ#    �,C�Zk�!��v(8�,��@���b��9ݕ�	u��/A����ɛj`�{�QrP�ut�q�9���&���.!B8�@[$����0J,��&H��B4��viF�S_�6�,��2Ņ�*�iTd+��lR�Ώ�����0fDQ�Ė m������4��� ٧�AIK�%n�4r��ׯ�������xR�����U�T ܚ��N<PI�;�NWMz��W �Ĥ	���Զ�!A�O'��p6�6����������?�8t��/B�ta^�q{�P2��\�Q� ��8�];9[Ҟ��S˴m�a�{��I��w�t�k|�z*F����H�_-A�E�ˑlw6��3��hb_K����
^��!4��,��2qw��7���0x��	n.����Ům._���
1EҮ����וr*ւ!�"
�ʊ�
�]�kC0�J����|���y�&���9�(36���p�d���:��IGU[�n�3ւ�oGz�����e��Үe����t�)�T��(�i��V1��t`��G�b7F�.�r��ًo/�.��8��+	�6w��4���]����r�IFr��ϸDD6A��2<���VF&r���(�� ����&H���8vD���<���|�KŃYhY1�o��Y��ޱ
Lc�'TZ��dr��&�v|��^u�O�\H�$+VK�&� X����?*,1-�$�C�8�9�w��AF��A��0��aaT�٦�$�'�^������@�v�!M\		�Ώ��5�ܨI��~�:����C����R-5"׽�"��+f%�΍[��ݜqU�Y��=|��uX�@l�K��QuѮ&~N����J����E��:lf���3yl�e������i�JTG�É�p�T�#����5DSW
f�+��?�l�4��&:T�0�h��{ڿe�=�%�G#�V����4O��!E�]3���h�!H�\mDK�@�@HA"Z�m�&��![Y���`��=V����PX7��
i�� �bw�D�{��꾯6��6�I1x�9��L�	͛ M]y���EG���`��0�O9�D91w曅�NH��9E��]�!{#$�2�QV|�됦��u���ih`����e.=	��D&�$M���L%͂���4^�c�6�nL�a>�h�j2`̮J�	���S�	P�)Gic��!�\q3e�����"MFFiĮ��������%��c_0%���Q:���(ߧ�hؙ8���bx�0��߭D/�\|�a�$���'�2N� �{N��S�%72ʂM����%騢V%��Sr��w�	d�������H�y���2d��P�� ���S�G[��מ�"䖥��y�)a�DJ��S��Rd�2bg-r�(�����*�B,W�c�����t���Y�c����T��"j���4����i�J��ƀ&��u��k&J>�0M��{|���k)���E�m��MY����=yj8����y�_s8CP�l� r��:�1�=�EH3W���v��D(�o�Q����js%H�8ImI����%w1�2[�b�,\��}y�.C�|�0WUw�	��ѲqJW������kxk�b��M>¤���z�� ���\�������OJ�8n�4sUcXc�� ��&�.?>@�cE� �	���7�)]���=#'3�D	^ɅU �\���7�Oh��(��#/�K�&0�� i�*���L��;�h ��0�&�7A��O����;qpC��k����E�:���p�Yc�I+;<�h������
��W7A�;�7I�ݝ�h���e��þ�r	�M��*o9�g{_-y����&̍+�	��&s��\�}[�B�5�hd�o�4wy��)"��:z!0!�	���K7w��_zv��2Ƕh@4w9Ѣ��dgk�ʎ/�A;�Cz-G�zykH3h���7�.:,uH��'�2]t��M���3ʰQ��3)Lm��p���<`�Q��ΈbM��]J=uA�H"*� -\�fq�F!1�sJs< [H�,rqfI9�`	N��J�&HW�Q�dI9k�$�ג�b��i኉ř���ڧ�
\�����\܅���h��^	�|$0��	��'^���j.L�bΤl��)y�)[�5g=��≕-��#��gq��{����������(��V�� {@��&�.NI���6g��0,+ڑG��,�^��#TZblW�	�v�q�\�QcY���i+'
C�>�\���� -]!�l�����Z%8E�	��U�:q�I�М��hAq��+����������x_؄ �����-�Tgk9��)�P�9+AZ�Bt�k"ltm�w���d�N-c�|�(��Ǹi��()t7��U� ��ךc�����*EуFQ��s=�^��/�U�M,��h�A�
(r0�U����+�R�,@XU�k�Ʊ	��U�V���H��I5�T��rU�;�Fj��j�%H+W����� a�4�5AZ�B8U�?N��U���D��J�G����:)���##`ɢM�r�G�"7 ����&��;�vǰ�Gr�I��5AZ��m�D�#�6���Z��V��r��[ˌԺ]�L(Q��!�\����ֲ�(HZ"%d��+,�=�Z�5�!_0�T�������COd�1�Q�l�	^��s@&(rI����]<�t��!&c(P_A�:��Dk�ˮ�.��dtl�0i�퀆 
X*��.�\��I�)_ ��UȄ�.����~IGB���-j�)BZ��l����9��9k_�A�|��X;y�̳t��t�M3���͍���i�p�rq�;3��i����+�`��B��N뀴v�������!�V�D@i c�i���-�N��#��1�a�ο@;���O��-�;U�G�
�d��r��`S�F`� ��*�U�Y���l�!�k��Ay׶�R�bQ�Qn!c����x�'�����Ԧ�Zn��!#CG�&й[i+0F`�Ҏ]�&C��C��Tۧs�p99��(��q@��5O��� �5�TB�r�yt�c���BN��
6H.��>�%��ґ��qD�X v�IsW�[����J׼Dw����������t����Qt%�f_����%A��9.#WV_`��������v�?t�$p>��:1��ƞ	���,��M��Boy���s/�#�����S�9�����އ4K�Q`>��љ�`bN�d���*�UTt���"ǟ2�(�n
\���k��q����Ƶ���=�N�gÇ�v��yE�h���ߵ3�.�~d�~_�ڿ��"�t�@o��5L�G� �HMv�L��ez�jR�l�m��0ϵ�!����	_<XД��v&9o���o���HY>T�n����^��Ǎj�)OBV�9=1C�����%��77�F���М����w�8����­��̌�V�sU]�mb-���ֳ1g�g>�8&��:���G��'���7�	�շ�����w ���l����p�3��"��>�y_zV��Ȧ�>��,�
F�[�2.B(��2b:Y��X�D��� u�3�Y�����[��n�'���ٶzj[��'L2T��"�vF�B�w������լ�nr�.�79�A	-9 �Rz��;id��u�t�a6�T ��#F#��AmN��������GsT��x������gb�L�yO8c55�fW����/�S�2 .}�(Q�	��L;�L�z~z�!)�S"dM�%����)Ch=��9J6������F��`U~�.&�8��c�=Z�'>�P�D9W�5A��KX�`�	h�³UlUO����׽	2V�j���R��jZ��--�}.9Վ����1���燴�)�>R�OdR�{�*�z�Ο�Mp F��|��p���gW��z��s"�5ld��t�����M !�"�;lbaD���>{	}�
�:)�$5�(B�*\�<m���=��VqiԻ.��9�]��-�̈������� )���Bϱ2�w���U
w7s���M�I�F�(|� �  �y�@��T����Qϼk{t��������m	�}~;��-��C�mA�8�Hu#3J4H���'7w]p����ЊL���(%�a@�d������K�b֙İ�#�N������(�OIZL����2�V�8>�=���d������-�#Y�������	)96jIj����a��BJ�);<l}e_�fL2�b�	1*}���C��o"F�
��6��5! f��A,�E���o���[��z�@�/�	sV	��-k2�w�4�E�����f�(a��!��d��l[oJ��^9��C��M a#ZS�(��@px�M��&�^�{�U�Or{���U�h#)m	�	1���nGߤ_�Fyy�cw�:�+bG���q���	���eۑ�Y�1�)b4D>��c (���EE]�J�֎� �:�����k��7�M��:�	�0����&���l�-���>/���\����Np5���:|�Q+�Ap���e��b�����V��ZN��s4�]I�<��;|]���C^|)�t���	(���,E��%T
��z�B����-;e(;T�LjA��5�>)�|RX�T��IaO�³�+d?�����^Sx��I-��t^����>n^L��W_6;��<��� �(�5�<^3���/�,wt#���R�F}��Zv�Y���>�a��:`G�a�a�Q�3����p���Ȏs��������|햲S�� �Ax���8��a(�6���vxN!������Ow��`�7�-���M1G���<�n��H����@{\FUV͒I\-�T��-���x�=�k%�{t���Qr�}Ec�*�[|���E�r>O��W�d�>U�.�<���<��ɗb��y|��Q]�z>$�#�fP#%�5\k�@M�3!^K�39m̗m�������AG}�&�a�CWşu�1j�WG���^�	tt:�#*�c�j�@Gҧ#�g ��:��G�IG�hF�­�����V�k�EtUL0�*3��n����
�#���,]�ʹɦXYE�(%�ZΗU��׋s��L&W�'�/.j9=bcCW�^����g����G/�8�|Rm�|HE8N�Q!�Q�hh�<��{��k�ʠ������i#2��X���=db_)G��J���̄ `�k��)&��RO���|�W�(�(���Q�����t\߰��p�$A@��Q-G���EiR=����3�v|��?�3�&�B�CCfM뤤� ���b�3e��؅�S�����+kǉ�3��@tt�9:��h�21��b
��9���ގ�8�u�9|�2���(����e<�Wf+=�73��V9�M�}!��GG���QjGU�}�Z�������ĘwR�Rz�-��Mm]D� ^}�\Z���W�����E�B�Ęw�6����N�F�;�Bp델��|����ԆclN"L �ڮ1�-�U�a��]�w�������z��,��XW�gk'y���H����VP��`�a�v;�{cc |��;�"��sAp�;�>w�)�`
��7�0�v	r&��\|/3l���Lx<�-1�N�mXs1ϫ��򸮴�q u��m�xO�Ձ_�e�珃D�Y�e2;QIpZ�i��5��m�xb�#Al\E�Y��H(��.A��-�2�g}�������i߸�����̊re"U�'/���w ������K-��!���ֈ�rx��ڣf�m�G\��+W&�>��'���y����5      z   Z   x�3�4�tIM�L�̵�
(�/�/N�)F0	Iq&&'����pZ��(X�X����[�KYX�X�Zr��qqq �_$z      h      x������ � �      j      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      `   �   x�3�VJNT�R �E�%�
)�
E�e�J:
J�� �Z�����d��.�ə)��VV�E%�ə�%�E�E�ɩ�Ŝ�\�p��
�3oxxEY&v{	�4$d���8�����Լ�b�Q�y �9�@��<�^������"�=... ��{�      �   �  x��X;s�F��_�Q�&@�:�d2�#Q�<ssO�y@��ۙ�	��t��)҇,��hy������vo�;�_��"t.�Y�����l�3E��yl3ĕDko>}���<��.m��P��\"D:�C\D\8���yT �&Q��vjga8�yic;�e���Yl���Q��U�l����k퐋�ST�x���r|O�[��{N(;~� �~ȩ'��(
Bx����Qw	�8s��pL����3�i�ӏ���ZD_e�� )\���ݚ�`���}2S�!�d-+�c��A�,*�`�)��lm�S����|묃�7�n�*��˙~g��X��w=����:�e�|��M5�ת4qZ}"�Nb&2�:��%C�B�=�3��&Qd�{���H�uY�p��Hȥ�L��6k��ٞ���� I��O)䕭��U	տ�ݍW�����dp;��'	�r�8@��IAE��"鲍�#3[~έ����ئ��F��7�Hz�W���a/�?^�S��.<�`R"�a�Ѷ\� ?$�jR�ǈ��c<����+(vQ8֙'N��������<Wu��Ao2��UC5��T_E��]�.���Z$0=�*
���
�D�$jm�+78�+�mZ@Q��� diQ��]q�8���D��%@��G�%��!�p4�G$&7�Έ���=(���nK�c�2���㣍k��m er�� s��b��Ǒd�<	�A$k�!���`������?$�7Y�d���T���>�:JS�F1ťV�Gd
��6�G\p�ؐJ����Em-����t���sc�9d����-u�D3p]O�Q��o��"���TG09������)���O  �z�#%��B]��0���}WǴ�RH(Y�L2�dUy�U5�X�k���v����<+�0�B�Yۊ�G��|-�_�h����Iun���q�$���J�=�}�kݍ���`����M6ө��E�==`B[�u�����8����{��r�OqF�?�`W�Ew��S��*ݑ-_�h��R����}	�d���фΦ�����E~V>��푓���6������X��t��t���O&Ou:5�ڈ�Bp����*�c�vE��mg���~��M�h���!-�Ӂ�e�a�O����;5�|3"�pո�JAN��V �z�§M�Vb��R�j�/?Mm�&�Q'�Yt�2Qk��pA��3�R�,���Q��]���"�s|�{�V���k�,��3E���h�:}�AՓq�FO��`ek*�mn���>�%;�FV1�>&�.2vE��h?l\�c�EP�ݛu7r/9q�#Z�A;Ӥp0)��%��H�VT���K�vO�]�Ӥwg��M���ˏ�aEv�In�u�T}$]~H��]�$R��W��yP��X0I��#u�t0�!b��)M���}�u���xZ�      6      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      <   =  x��Y�n�6>�OA��$@�xw�u��84��6@�p���THi�(���ͷ��\�C��7�tH���E�^���Mr�����׳G?F��z;9|�J�v�s�p�\����z������䢱��w�&��HD�4>;��2�Mp*��k)"��APY��dCxD�В0c���8&<E�Q��%�y1�x�Ǚ��I��Nm�N�ZH�^E>��F_���\���|�2�H� 	<@N�7	 �ȋ6��2� 9m��XUP�w@&n��Q�,+�}P&m+��u�i�J�r�e�F�2�\�A	vQ��Ս��Oy�f��
�0�6��f��s҆X?�F��h��k�ϯ0�m�!���	憙�a�E�\��iH(`�`� ���A䠗�S���6���^"��	�0CDz�<&l�楗�c`�m�!"�D�P�D���5T:f����mN�p��6���~�����a���3m̴3Ĵ��i#`fm�A�3mLІ*�ao�Ӑ'���̨D�)$���L=CD%`3���+q��BK��?E~]�шa9����+�������uۺJ�_ϰ��d]c�Y~�`���V���/�f)�P�YY�s�r��No)cB�A\d6/��� ���DDFnD9�co������$�"����fe�@m�g{JF�r�.Jo�$+D��JIL�I@lrA97@M�1��HF��n�k1ؚ�m,�$�"*�� 
���8C��=4n',���F�AS]���1�xQ��!զ8�_c����`���
(�È�������m�@���7���W|��o��W��+���*f���ְ���g�̔^�~BdLR���xm��UVUmӂ2.ZI���^A	[U�LC��VS��b�$]t$��Ϛ���?���XF�($��f&�x�7BzK��)i������S=]lL�p��r���h q��I�<s�MF8�ǵČt#�7� X��]����^�h<���m�)�~n$cW
���\t���W]�
�CS��{��`wD	��x���&�Nᔯ�\7/�n���+�uHb(�8]�3��NX4z��3�x��p���iK>�yQ��5r�d���U�f�^!�d�+�$�i!l�$!� X����o�Y/�oo�W�,*��^�t 2\�J8�yf�N�0l�=V��X����i=g�����q��L?"����p�*�쟿.�u��Fn&`	���<�ef��������5�P^������ 2����K'�P�2^����8{�$���<����.;"g:�՗���8{��O݉��F\x�l0��s�/2���5����#�c��#Z����7��4p�5f^�W�C�QY"dj��Y�T�+b��Z�K3M�P�[��X7���켺K�P��u1b*Q�_��Pf���^.N��î�sVg�P��xTw��e_�P��2�1���Oz�VO��k��	Y���.^�����?cY+����su�"�V��%E�*�rCT�/h��e�0�ͻ�!���'7��O�ҹ�e�������3����M>�'�*.Y:4�U��������?�v�l      N   j  x��ZK������(R�8� Y@&Ab�� ���R��^Sn���LQ,���ů?|�돿���q���������^X2�G.l�8�'�:�=@�/����~��o?��_}�����Z��w����3���C䨚�ei�F��$�_O�lۡ�z�n�Fh��<��i棎#�$�Gi����nv>�H5�1�3Iy0s#m�<�%�^�l�sA�9��?Y	ʑ�QZ�V-����+d�R�hM�<@��U�����TG�&��v;�/�V�=A�ۭ���T��]D\cnwa�4��Jm� �r�!�²����#��{\ب<l�"���ԂS(�"��nwp�zj֡��
tY���.�d<���/�J������S�hx��@�A
,�� @+�܎��"1�#ЃQ��K^ *s;U�Lu�����Rcnw_z(�.�w�B�F!�Ӥ�
�t�D��Q�4�Fa�����2b��u�C]A?@T셂����͉'��(2��8�tT��*�9���C�Ź�2nO	1;Ev4&�+ڥ_#$�좷�֣��az�H��r����g�ǃw��DHjl�{�l�j����"t��N� �Ԗ���'Dc��n��-�¥�YDpH���kLѩ?B$s���	cJ�4B�Cf���3�ty��+D�1�]us.�T�t�`V��׆�wE�kg\�g{���|�v�ґ���{��i�I��e�5���֘�.�i�ƨ���B�b��59��$W�DkR7h�5s#�
�ƚԻ��C
�a���
�Z��e��a���'D��g��TY�:�a
vs�
�����:ߜ���\ �Pe	����ܯ�^]�B�[�����2;�R���W�0��vo~1CwG� �r;��V�d����V�� ��.��VZ�"�=\!B���ӥ"it��o/��L�`_R7�a e17�-U���K묇]��'��J"�4�J���rv�@IFv�]�K:D|�_ B��v���hq��5D+D0:�۩���:�{�5��7NE��M�-�V��ކ>q��sH�!�����b��<@PD���*.�Z��݅�sHWm>.a�}�Ty��*E�i�y�[����I�7v_�<��G��tyΤCZ�Ez��shww���IɊ�	�z��v�c&�	��}Z_ �[�����r1�8/a

��*ω׸�=A�{}�Ba*���D�H���su�����c��*�\T�2|��@�?�۩Ҧ�1Mw��^!B�k�~ԗD�M�P��͑.�F���Tis��\�[p��N�vhKS�/Dȿ!�ݸ��Z�� �;�
���'w]N���#W�W�Й�vo�� VZV���:��g�{����4��"�Ch��r�m�8)<�*���+DƳ�>s�����l]\[!b4t�qM_ѹ2�Ͳ��+D�ŷ����P7 .�ߥsj>����U+D�B<����
���.�@x&���|x.�aa:���ɮ$�Y������6+��s�ĠS����̭�W�<F���ߑr��^���۝���1\���q:�#�9!����W�п�Q�	c-��ׯY��7�Vͪ�]�_!ۄQ褍¸V�d�]�^�f�M����Y���L�J�սl\!�_y#�v!lh�̍��Fmp�g��l�
� ���a���>u��}��@`�o�;���Z�,��^!��7<���E`Uw�� ��\����6Xѣ=A��3���}�
Ȱ����B`��3n�1)��mn ��8���8��r�u��.o��\>�����F�����ާ�/�j��-[V���7ǟ�礲OnDs(�m��=iEs���{�v��1�U(5-��|����9�p�%�
�����3�f{��u�5�
�O"��:�W��ďav~�}c��_��>�%���'E�*'���a�����R�rvYl���o��!�^��i��^���{��o<��f%Վ�� 0�QS�&���UO]uM`w��w���t�|�1���/����UMwM��,?m�n�X�|���g�ׂr���`������9#A���A��}^˔���**�͗H8���v�<s�^/���4_g������?'"�?:�      t   $	  x��[ˎ�]wE�@�K�Z�m�Mv�1#h c�7��U3s[%�P�iQ�I�BkO���_����o�|��8�����~������|����k�W��C��=u�T�zX��}����o_�<�|H	��_ �L�Hz�A��`������A%qf�!����۟>}��ӗo?������ێ��H�m�x��!���/���!=e�����"�}�\����'����A�K��
��y3F�.����9acA�A��O�CJ��FSa�`��e�~��W
���+�pcn��J��;ȍ_MR�8���/ ��_j�Ep���ֶXMǒ4@�q2F�ŚE;W�r(#p1�*8�n�^v���9�I�a�/Ղ�6���?��%eB��3�pF���@�?��3�r8#�暚�u9�����=�=�R���Y"�}5�_M�4�Agpb^���D�B7�9�I$S�,F��lL&�f���
�| �^��I�r8#(���Y�j�q�9���D��Z�@��o\�9���D�	<�f���1��hҾ�ZT*&jg��d'��/��UP�Y��sr$SȄI=�U�9Cg��3Q[�	j�z��Cg$�l�h��
�M�r8#1D&���#k�M�̐��!21�F�p/�Ʒ3�p�����	�єI���_��*j(�^���pFN2�Y��0�ٌ�3J$;͖i���"}���pF��VjX��̍�*��ጜ)l���F$k�^ �3���f�~z@B��f;g��d'�٩c���r8#�"&S�-�V&�g��d�ä)��[35���,�\�+4����̈́�9���OL��9��fO��pF��&>��H��9Cg$?������MKq��ȉm_خEsFS�^ �3�	b4���Z�lx͐��ӻ�S�TltM��9��l��C�����r8#*T�
�aL�����9���&�%nZ~���!g�Q�b�D�)���|�9�*&N�p�V�n!�3�BŨ�����f[�̐�Q��a�T�nTh��qqd�m]'j19��*��9��5Ǖ&="�5����g_�����ذ�u��j(A�E�N:�r���B��Jh:]V��z��e@K:C��6�������B�;�#MM�e-A$a��� ob\F������WP���a>��-�]:���Q�r��m{:!^$E���.|dJ�Ud3�h`$O�9G�(+1��n��@�'̍�D����Z�NA�����=m��Wsz�q�Prnv�3t��I3����|8wS�͐�4m�G>NydƸ}�Ӌ]3����<�����`=N�$���;��4�곙c��*��L{|��T͑T�kM���c(<��;ȉ�H�6��}LK$7���y��W�y�P��E�^�ہ���D^f<^��+�;Wj�Ŕ���r�(����j('�R� �y2�H~3T��ĸw�<uȣ4�ؿ��+�a{�+�"UY�A��Fʳf4�k̤&%�I�9�qp�)pTc�̔f�ӆ��Y<�Sͮ��4<�2���t0�}Ш�ۥ�Fj�n�
Wej��Vf�<��qjC�~�B�bۜ�HCYj����![�j̐G9��`i,7{�ΐ'�\��Tu��Q��B�4@���i���M�Q�	q<{�b�Y��7���6�3�Fr�#<��$c���y��==r5=�����lf�a�z�
WK��G�J^|�<�е�u�4z�1�lҊ� �4t7x}�	c�@�!�̰�<ֈF .���նDK���R	���7���EI+��;�#��b-sK"����HC�k}�,�M�f0�-�F��.��1`fn�8a�<���7Y��SoP��H#�Df9u��Z�5H3䐆��*����nIX�Jg�#�J�h�Y � �4Ժ�����Z����y��Y�*�K`]N/mM�䑆�[�Չ��sB��f�3䱆$?�A:��s�"،�g�c=�������yn��ΐ�:h���*XR�qy���p�W���;m�˚��c�J�*����yת���䰆.� ͂�d.i�q7n�!�5V��A2�V�f�c��y�E�quY�
��ΐ�S	��:�x�4by�1�X�R��Sg�&s.��S�u�(�i��J��\ �5����O�h�w��R�����=��R'��i�K�G�PXU|%�@��fH#`�m�ӳ�b�y�1�Xw��-P��{�<�X�l܈�%η;�c�XWebm)I�լu�<֐2�"��8̴i���c5�a�c�ѩ嶊��8c��Z��S�"&�.�G��55dh^�.��	3tO�sz~~����A      �   Y   x�3�4C#CK]#]#C+#S+#=CsS#|R.�ə)��VV�ũEN�ũ�y%�%�\F��@#�k�gf`jli�O
��1z\\\ +W(�      �   �   x�3��UOL/JLIT�IT((�/�/.I�tIM�L�̵�
 �$�#���@hd`h�k`�kd�`h`edjeh�gdilaj�O� c���-N-rJ,Nu�+�,��2�tT��T��G�p���M�+)���;��sS##�R�9.F��� ؎^*      :   �  x���r���,Ŕ.JR�'	���27���V,9'W�����]��d�n�j�!�ܒ���Sn���'��t�$e�k/�.���������l���e<��O=z�ӻ4R���sr
����_O4 ��%���SM�K�(�#��,��@�~y|\�5X�X.�ð�8"� ��c>��h ���'�j~|���8�����":$�,�n)	���K�x�(��F4�A��\d�2��b3i��,�e҂씉8O=&	@�0�z�e��(�<��X�A-�J��;�ԓ��OtUs.T�Bs����嚺�:jW7+ �vUK14 �s���U �(�mi�v�y�����4�Oh��ߤ1�@<�N:f��{~׿�?�?����R<N�\�ш��z|�o�38�`�/�'���q�V+�u�<�������krMn^��yq{׿m�ٴj�����B�*�Z/�@�DF8IR�<�a~�$���'�9x��v66a��m�<�g=�뫻/�{�l[��UY��b�^�PY� e��U�Y��j��i�@Zd����ݮ�]Y�e)�c�r5i�^Q���?�������f��1�((���hV;F�w�ۺ���v{[;-mݶn�GU�y�[D����Z��Z�fZ�I`\���������U��ƨ��8]�Q]��r��?�]ݽ�]]O������C����Y���C�X�ѵ֬|�5:�ӱm�Z�,[q��9ݩH�ݫ��O���/���O�a@#�����i"��%��N��{������kr�/�6�#mm9�����j�$��XU�r���k靪�w]�T��9�ޠ���jί^�1��@/|?F{_��Y�2t�h&d讦)�f���R�0Q2���"�ǰ	��qMC�-�֚�&�0A4X
�fF�Р	�8�q^���1l<�p��tQ�)�+E�����2�`<V��Y�BPYm�C�gq@o0�b���|?��A�3�AX�ǩ`�����1�.f@#�<W'�b>��ey�Ô�=C�ј]"���YIo���=1��%{f��fW<&rg�#����w4�s�����d/�c�8���������,�b��f"X�oXG��z�H� ~�y��<��t���ǋ�����	�A��Uv#�?���>%4 (()�#J���βZ��l�21�_���يzp(��-�#� � �<v�S��.n9$�X��ҋ��c|��g?������<�(N� �,�$��y����Vo�4�e�7ж�*HBy���
�?1��(`��Q֔H�"�wF������U�=  ���I��������&��`�6+�a7ڈ�Ƭm��-�wۍ�h2v�*�JB#�b�]���4"Z��4P���<��)E�$q���}G�`n�O�|n-�9�I��@�ܱ6�)am3'z�+xSe�c؎U2S5�[���$����ՙ��1�,کq^|��������΋��W|���z�7�_�ҵ4ͨVvLWS.c�z���j�☆�i�;M�y�zZ��u�-��\V����j��t�UmŶ���W��}@��ت���h�G�QQۥw�y9�~<#�Ž5�%D}��g9	(_,���q��$�"L�D^�׬���<�)W��e����n)k�,Ō4#�G���4��C-��1��=��U���Wv~]��t���d���aҀ���mX����wg�q���zi��^4"8��D7]KW4��;�yC���^���u�:C���,�P���'�K��#h,�+�����T
�!ON���]�J��t<W�� ��C{q� �!a:�Q���KF<�Aţ�����$�}�Z�RF2�!�0B&`@�79#�m!�#]Q��ӟ����!��(����A_x�3�n��$*��8'���pYć�)�\R}�'�����s�kLρ ��b"�8穤p^j�4
�Hgp���\�<`�-'�8�s��3Xa*��gX���W)�����	`�yI�2y�@�9+�����V�Q`pF�NhFS2I����_�N�,�����	B���x4��I�(�.�טe��F���'�Y��
ؙ�����?<���Ǘ���e ��Kƈ�ن��x��d��7�����	���Z{5=*�Q9>K�����& ��ք��(

fJQ���M�%������w8Y�s
�@�p��� ��!|��Q�jz�8\��g/�^��0���W���x�-�@|G����_�Ҽ{.���0!���&��0���T+�9�@:<�S��aXUYy�0I%ͱ�L��d� � ܂�E[�|Ľ�bh|�X�a�wY��,���yF�Zp���1ca(�f�<��!G;�K�#�����jٿ�)���)��0f��Ɍ�?���3/�
������(�G)�"�_n�13��T]�MB�������Y���2$��>z?�akG��~���7t]�wRt�#�n<P��8į��=b)��$9��m
����)k�-l6��V%}���>F]<�A��\g�K9f��e�@��1 �%`��a$cK7V'���)��"��ZC"C�����+�e�B ��_Z��K�X����n���YVN���QpG�t�#���!H��]eW"��8O��o�8�$,��^̪�E�dͲ�jN���o8،|�[yD��$ŋ��&�p���Jx�D�c�]X��UV���.$�$��(	YU}�`9�ܚ׃����3�f��?�_4D� !M�Y��wı$t6o��n��>�7�('��h�m�E�#� ݃;���.�~TF�d�� �Ժ��p�F�w
��
��.$lmL�p�tiG�r�YF�|d&���24V����vg���0~x�Jg��8}VƩ�N�/�p����E�vZn�ϒǞ�ӏ�s��q�a��f)]˶�N�7WU�5�PU˘�tdW��O�M�M���V_+�=�?Dh�      |   j  x��U�n�8>�OA�\K$���Roa�����ɀ@˴��$jI:NQ�;���w{�#�M�$;�]7�:N��%���f�#9C�ZJ3����x�rnM.,�I�ôG1"~B�Ƕ���,��t�!!��Bh.S���.����oy-��"_�pi>K3Qk^�t���=��π" -�LTE�����3����T��aRY�0͟q&�y��O�/!O5��iƺ	�vߠ}3W���p�4v�o����C.Ų��E������G�w�;���*�7�;Q6����e%S��ɤ+�
���Kn�+&��M�֢J\���֓�DN&�>4岪*�{��.�s�u�5�>C���y�u��Y�Vv#y�5��i\�6^�d��ZT9R2;�uVMo[��lJ�f�1:�uJ������,�I�apA��y�|T��I@��lA��U�1زu�A�\������O�F���5�ѷ���jt�ntz~��4���|?�^?���0�}pq6\FC�n0�6O`�nF��1XG�������\φW��Ǩ�aS��l���}T�ɵS&��\Ȋe��+Rb*9�s����Q���'V�{}f5� i����h���
�\�[\�ٷ�/,��M�B3�D��@���5�DJ��/����͠�F�\���0��9�{g��av{� &���~��ȴ	�.�L?��H�p��nB�G$rM���+�ݎ�G�K</!���Mx�R`��-n��et�d۸�'��`W�n��jh�6�B/��?��SūiY���6�� �-��D@s���&��ZA���</Ʈ�S�stLm�٘Vd����c$0A�7Iw�C�����K��6��p���R3�!���P=��;����t�
�J      �   �  x��W�n�F���X����$�p�A�tI:�\r��*�.��,����*T�*��?ɗ��,yI�Q%M���Ǚ�s�̾�j($[؆�W�������˭_v
�96;���'g�Kw�8߶FZG&�E�G���L�KE��6Q�;�h��C>�V��`|�T6�zv-�D����v�8��1q��%��/*��Τ�������*o.mH-�<0֬���f��<l�� ���KS���9D�����be?WVT%6���D��!����p�ݮlq�8jN���#��^=�~NU4��sǲ��d���P2��\�Ǥ��6u̞w_�hh~�J[RjC���Nq��	L�#���h�@7��� ����+rӻ��%UL.��>ն =��7�H9��J�8����.���	 �"g�&)H�@�|��S�	\Rf��՟�W��A҉2Q��U>��C�E\�y �*O/dM��;L8�l{�e(_u��J*������O���S�s`v8��X �w�|�~��~q�B�B���>�d��9�'�h��ઊ")z�T-��#UI�W�_��P��D�8 �
�'J����{�`W�Ɲ�)R���R�2��=�A(�I��Q*�"?��<�.�3�Q)B-�Rq�C��V���������Ι�ȃfH4CS�]��ș7�s�X��'4�*������!7�!��z�W�ݠ9]>�|z�U=~��Q<=/3�A=7�#M���m��難����$�)������Yd"��ᯍ��n��"(������ߘ��b֡m�J����S�$�����U���-0�ѾA�c��>��95ZQ����.�۽��V\�{�{�䮒�����&���a`=���'���P�V��T�[��0�%�����L�����P�|3,� ��zs,�ۘ,��5�@U��K�5'�X�Zf4�CE&)}!s 7����H2�V���t$Ju�E�jm�O����*xl�w�fd1Ufo~CY����S˾��d��
�:�\j�.�R��^>�7ݭ�adfd�/
YE��L�y�
U�
-�d-�60��5�������lZ�m֥.AP�J��々�z�~]�GbP�$��N�ʕ�&�ݣHj1�*#�[�w�kZ.���]�8��֓�Z�5��/P��R�8��e+Q�y|}l�cQ*����9R.}���N�a��H��j�(��=���7>��@�{����׽Jdj��g78�]�1Z���5@��+���?�6�'��G��o����7��2v�ii!{�}`2�5�咧. ����_ �k�؁�,΋ )�`��lb �>R���!�@(��.Bw;s�R�>N
@O(%Az�:ݝ\��P�W�GLasUz��|-�HJ����(���r^Ҥ;���5x�_c���&� E[��M���`��m�QO�!�t�X{����1�<;���E�h�����#�`yc�QP�8��Z���;��[d�F�@V�~�׬��/���oc�9СiC���@Sǐ��d��<��}M��/�|���v?��Y��l��ة�/Z��fO�CJ櫯B��	(��1Zf��Uiw�rǤj�G��8��R��-�EEQ�]�9����t�,�&=~>���Vt��&QXs�U���~�'����]:1�U�G�X��Gt"�??[��e!F��~��O_/� �QM���r�����d����d�so�Do�+<�8�-ο���w�������&	�E      �   L  x����N1D�̿,���lB���h\q�5�=n1���F/���R���*s����������q�|9}=�^NO�������/l۸���g{Ȫb_Xn2Cv�]P��V��N���B�2Mr+��`�ԅMsEq����m��?v7�ءA��WLB�%���;������4��ͳqp���HZy���c���
Ű�F�Yc@w'=�	�+܈5�ٯ�q3Ě!��I�L�/Э�W���JpF��GƲm����a�n���a�n�J�lc,Ӱ��َV�	���3��U�z�:����>������pl�[ ���ПZ&F�r�:�t      �      x������ � �      R   �  x����n�6���S��!���Ͻ��K�� m�Hr�ۗ� {lK�r�A_hJ$����?^�_��3M?��?_�_?}����������c���s�3��)�	˘��d4�cf˪�@��>fv.��@y�\��t��^27�X���A.* [�����oO\�H%O�G��B�pw��4R��I&ΣhR/�'���>�4j�웿�@��g��B��)�M�K��,�j9OLG`斨� i�^�-xJ>�NI�Df�!�ޑ;p;&�2�cbM\�� u�^��qi �(�^�8pg2���<��L)� �(������ ��j�5��'������)]�/��&���4���:����"Nēpmn�]D��נh��0�q�OsR��@@|�<�<~�a5�)�����Z{�D��;�~k��pdv�۴,DT}�����NXڤ6�fn ������D^cƖ�8+�Ԡ�u�9�SLn�Ip�L4��N+��//�����1�6��_Θ�gM)J��50���M�U@�F4�$�*�ri ���]oTS�$����s�]x+@��X�6q/���iGP���
6���y+ ������{'���������{�[A�i���;�ALS��y��|B��M�cIBb�m�r�1DmG�A.��%�����u*R\TudT--q!�^��'�~��┵�@h%o���<><&q)��_�y�^.
6ath�w�5H�,=o�E��/?i�@�ei;�կ�t����6q{}r�f�M��_��~t�,Ō�������1ͫ@��hB����!����,��`�� �	�:�k���{3�u6ԧX4�<xU����@�ӿ?=��k���g�����j����[A\q.�X�>��@���{n���>�r��r���9᥏R�C\��P���#�������g5a�'�c?G �K ��      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x���;j�0��z���żǚ:��	�KLp�4��Ɋ�YE�B�c}B:]/��i}�^����~n�?���HuF��N�)�E�J�Nx�MD)�D�BX��@� 9��a	we�$�!@k���4�;	l�#`��������������\�N����Z�F��I@86��Aՙpj��ĥ 2�wܿ���_�q�H����.p- �˔�      �      x������ � �      �   �   x�m��j�0D��ǔH���_
e){�xi܅�}�{�J�B.~�F)��>�޶�gk�d�n��V���ǽ��A�FU��S���m�o�Ҷ��X�p%�gZ���&�rj�y!�O�v���	����̢$���H
K��h&|	B�T�Y�~=�L_lV��C�A#Rt��Q��K��	;T�Lܥ`�I�:�i8�.������c�9lb�9�P�iT*[�8����y6c�?��@      ~      x������ � �      B   �   x�}�1�0k�����]'g�[��oI$�q=���Y����|%��4a���}���T��S�y����U�/v��^M��S�ueH�?����j��(��4'��6[��<��ͻ8Ey��ц���VxLPa^�9lF��߲�I�      P      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x��ZˎǕ]��"�I +��zB�lR~�-�I�"*3�:�ȇ"3�S�����Z0f5�csnD䣪��MJÒ�6�"3oܸ��sODVx�?R�`����g<|��~����9�U��,+U�Y-�s�x,-�Z��hZ�x&+Y���2�d㳫k^�ښ}�����}��e��>;��kD^�B֪�l�	%�F�`F���o��~W�L�M�{�)5��hL,��Ң�t���k���Ϸmݔ�*R��J�3��T����\�쒷p��D��u�Ȧ�k�KV���65s;'=����L�x�o�5�u�=V�W��R&�5�G~�>��N%�q-)�)�X����1�5�|��`�5���Z$��EPd� ^�f�Z"<-�=�0�U�K�����U[�8l��,�R<5�����`N>��	�Ȯ����Y�+U�T��j5�r�2��f#SI^�BN)k�Vh��V�srM�X ����V��4"��y���!�]L��6�[<�kS5�ʦ1kn��`�봵)�J�ܦD�ZqD�a2C��!rQ�?��c��R�=km]��J[��jr�1���ˣ	y,�NͶ��d������h5��r��uY���W�^"^Z0,o������ܿ!dT�&';�pѕ�5��.�blY���zP��&T�C"�b�{9r�U�i�+�E=ƾ�(u�l�qw��B#�I�0��Y��i��5�����h��'�R�7�<xZ�XU��� HUY���F��Y�3���uA����F�`���W��� �E�F�jR��G����fWd9�"ŝ
�e�j�X�Qv�Ne	?���,���o�BAF�۵
�u�1Y��jP`�U�EY�ìY+Q�&�;�Z��Җ���Ͼ��7��T@1�j�N�`L�j�f"���h���?�@���	�6��,��"��n��I[�^����3��=<�R��
X���Π�J��r[�Xrp]��CR�(y���X.�v+�%CH5���:H�p�u� ����0��cC8��C���#�YIeN�p-�CF�jM�F�e
�Z�&��&���PF�o��]Q �.z=R<&���J����ጋ��ddR��p�1�6�u��gl]%�������<P,f�(����h5_��3p�ɴ��Ǹ�!���"\�^K�1� C996��#Ln\2`�t=@����O)�Q<}'��!{�^� �2k����.��a��sT�.�N5vD(R�`X��/w��
��2-�q�A�F��8�6�k���½kU�6�1��Iv��=�h� |��*�Hb�_&I�2�!��ں�@8ĥ��+7)�{k�����bQZ�tK<8��5�7��(���n�uZ�h:��ɖ�B���}�-ε!B�1p���AYuh깳1�7��юrJnM��j�3�7-жx�/�T_A�GA���$Y�� c���|�f�Ǣ�$�áL���[�E�$eј�5���gߖ��ך)��E��)z�P���E�F[|�Ͼ�����$\�0X���e����K���/	�8	c<��b/����ӗ����_Ozsg��`�J������:�|1�/�[Z[-P��Y��!-d���wCXv����r�o{����0?(���s|y��vS��b�@u�9jF�̷3;�B�ը2e$�@�S�)@���/��+�6lN��6�U�����\�)=���Ɣ�(�E����%c���h�Ė�����I�'g�(!]k�4i#�*�S��H� �J�����+�7��-��Y���癩Y[���qW]����!���>�_����JH��7�4d��8Ӣڿ�;���F70��ٿ�,��4�ZI�%dv�l�ou�Ը�ɑ�l{g��b�O�h6w�3��F��-*k�53�����,����^L��$HX8 ޏ-���/Zpv	�(�R�q�,{t�d�������=\�1�c�q_�?�铘yŕ�{�>DU�J4�`��*��9�x���-��]��a/Ǡ<�������b6�,���p���P��C�������D4�쐒����U��$Ѳݿ/� ���[Թl	��a�՞X�W�?t�l����5o��A�rm5��^8 ��
ꥤ���즩��^p����z�-1���aF�u�g�Gk"5jj�6��#BQ��ǉ~�2>	�'*y��Q�T���+Ҟ��_�f��%`F�J���F���c���`�^x �~lA��^�:�|��c���O@�g�?YAGU���U��,F��*X%?�-�Ir������dW��lxt�'�����Ȋ��%�[�}�K�2*ʐBް�R�D�ڕ�Ƞ�P�,�=�8m��B�hj�9C��No�mk�����#���?��������GI9p�������M�{A�x��� ��\7z����+�OE7*�ڈ�C^��;y�ٶ(��W�t
��6�p��I��x~�:��83N�"m�*�:���v�_p�$i�����4aCuw)ޜ�X=��&$��4T����ά��⧭�3�z�)�?�ܮ��-z>	�I8=b7�Ke�d����,��o2�t���r9�0�MIF��=����I$�/��]il���-�K��(,�7�kne��n:�{�T��nY���D�tVd_��$$�;3.��?8-m��>��ZdE�� �?�� ������ 9]�Н�IkQ;v-��T�J3���i��)C��?]�d~�ްv����$����������Df�ӛB�
t]׋�Зl��k�\r�S3�;h��hZ��9Oo>�� ��*��a|��\�N�$�X�S�,�?��B~��4l�%�A=K#����a�J큟�:�E��x�";��lSP;	�8����#&�t����c۹�,SҫW����������hz�2
�Q�a�m��+a	���Fظz����k�@\ud>$f��l��=�����.���4.�Z��˶0��'�x�tp�_ɩ���.+u<�b��4F���L0��7�.M�a�9sj��x��꧶��tҖΖ�R��/��طB�>{&-W*K��~�Ɔ��x*�ҭ�L�aN��t���0�������i��e&�E��*��hN�ɕ�yM����"�X�9G�# ����y,����Rѫb�p���5}�W�]�p}0�Y*ј�f�\�Qj�/�Q����s�n�A�����wt޻3:�T���L�?v2��=�A�y�6d�bݱ�������%��%�w�^�kV�'��]�WB�m\'tT������c�R6o9-4�e���A�c�˵��}<b�_���z��{��*A?7Ƕ��Tvlq���T��&q�=��<���Wa��&�,�h9v,Xb�t���Et��T�g���W������hpz�#�I�WH$w�c�,?�$���1K	`*��� Ei^��n4��!�'fyf�ʵA�=1�;�w��} ����c�7��&�p�j�h�q�ao������ƎſP͝,�y�q�fǚqZ��ga����&2�5������ ��Ff�i����޺;<����l�0�%f?E˲G�d~�����OKs��BQ3����ӡ_���J��S�{[�^v��k�K��ڳ���@,r���e�!��:.�̫%��م�b��"�O���Ϟ���>�� ǜ~t��p�=Z��Y=��DJ0���顔�j�����`OЁ-�\�\�n�+pǽ��+8~�q�q�xq��x�|��0&OI�n�B���c�a�Ž��ί�%�O�u�~n�G���D�I�
��r,���.��-N��y��S�w�D�`wb'��v(����4}���ոx�C�聵;���=p6�G����;'�M�Ϸm��?�G��eq� �yI��\n7+��@�ؔ:�t���*D
md~��˪����z�V��ݐ4��;��^��?��Oh������
]�C��at�����
�Ί]7M�z�D�\츿��Ny������ē���Q���3L'����x�a��cfЦ�@�B����wB��ߧ �2+͏��Q٤w��'�3@&"�:��"lK�aLP]�VAL�� � %   ��)�.���	��"�G��Z��_�����29W      �      x������ � �      �      x������ � �      V      x������ � �      Z      x������ � �      X      x������ � �      ^      x������ � �      x      x���ݪ�;�z�׻(B�����M{S���T�m���˜����o�!�`m(��#�Ґ1�G�;�q��?��?���?�H�?�����_,?����?��>�?�_��׿�Ͽ���/��_��Ͽ��_��_����������?���������o������^_��K�?�������������}C���������s��ώ�_~��p`/���B�W��T��6��1��o�����o����ۿ��NN�����������h�|� �p�����A�����f���yſ�g1JAW���d�R�j�M)I�/�����,?�Ν����G�a�V7);	s�b�_����n;M��Ä_<p�|Gq�n����iNJ���ɂ����,�˛�������_��}�g�g��#��{���aX�����}��k}�0�'���c	�|�Rsao�:�+����aunI��X~���꿏e��B�4�!Jx�
I���!��^>bC~��u:I�!����"�>L�y>��ތ���Pß��O���~�i�}ᲄY�u,��i�_%�⡚��9�}����M,?h{�����i
ӭ�pP�8'
�7��m���,?m�T䟮ҨJ�E���$L)�i����(��1'Y���Sڇ	���(G���W,��y������|@��̂��r��?��օ��Xet���7�A��_�f	�0�W�e�`*I�!x��+lϾR$���)W͏���wT��Z��U��O[��f�� ?x�e5ʯ�eYM{k���'�b-�'{zH�*?h*pn���.9�8����iG29��L��,p�������ی�$��.O��G�W��`]��롙W\��Y����9�G�^��ǜ.�W���9r��+|w}�q���D�JiNt�Q�O��$x�*?��.v�oϬ>�0�e�2Kc�������z<p�N����i����<%�R���������Ok̻�p����o��Y~ۨ������ ?�>�>�]޶>I�3G���c�l�e>w0'��xE��0��R��z(A��� ��X9LB�_j|���� �߻,�RP��4���yq7�w=�(��=6��:�<�!n:�Se'�������a}��qP���}���Ҽ2j��ʄ8�Cr��3�������i��-z��9���O�����l�M�a`4S콼8���@q�؝fq�@�	�S��@�u�2JP��%��'[��@�ϑ0��(���˟. ��)̆&�v ��!��1��I�
�!��قBmh�K2�v?�(ZP��QT���PY��wm}O�G�Sv^����\ $:�)�"&/�6c�:^���&?�5�aT�b�s �
(́
2�.Ǽr�>�BQ�@i�p�_#��#��9t�\#�s �@�W����w6�Lٍ��N
�Q���l�@�05P8)�FN
�Q���l�@�05P8)�F�
�Q���l�@�lphw��Bm�@�l@�n�x/&)�:W��s�	����;�]�R�r��:�R�q[�_�Ғ�p�^�T��� �E��fF��Z!�9hd!8��b��&F�i<��1�q@#�2�����ӯ����j�EH
�A�"$�Ϡm��gдI�3hY���4,BR��!)|͊�>�VEH
�A�"d�ϠM���L��B�E��nE����cp@��1�BhP�"����z!e>"Ӏv��D��2N��D����K;V�Ɲ&E\��� �0�A�ő�Q�[��Q�V��Z�kLs�r��2p@˱
�h�-�*,��������,�*C��`9V�-��X�e����p���j�cM
�A˱&�Ϡ�X��g�r�I�3h9֤��kV�Z�5+|-ǚ>��c�
�A˱f�Ϡ�X���,ǚB��c��n�c��v�d4���a �$n�8��,���B�8�ˬƽ�/e$0���O/��&b���Ee1��b:�2@��^&�4�+�d&y4����J�p>�a��E��{U>E^�{9�5��]<���3�@���W.�pcOվ��×�일��P�/I�K�p>����N ��o�x����=�n8��C�4a$���o�Gu��X��!=��ϥ�/�Mc��g�'�;����9��}I�_�Q܇(��:mՇt�y��W�q��dP�@���Է�NC q.�� 3g��5%2E%�&؝�G�� �/�� �6�@�["����r9�ů2Lò>؀x������B؀���z�Z(q������@h�Z��s^W	P��i=}-�Sv���y��.O_Ua6����l4}-T��h�Z�
����Pf��k�*�F��BU������1M_Y���߃Blt��XV�h��e��m�/3.6�Ƀ2
֋Ø�� !c0���:,�w��t�c���N�mY�ٳ�o�&d�ۖE��x}r^XDw��<��oe��~��0�����Nh�C�7���9������D!c�{�����b_~Y������m�R������p��7*�������K*�F8�I���k��c8��y��JN:���:p��ֶ�F0�B�d��
i0 ��Bȃ彬B���FT�9O�jiګ�¡e�).Z������,\8ׁĉ^G��¡u��	&��!�'��g.�����ʗ芄�;ǣ����L$��;�O�H�Ӆ��1�?�nzC~��)���[��|D��)�'��8�4p��"�T�'��pT���ӊ���=��{�Ig"�ۀx��V.��~���������ǡ5��l� T����@�(9ρ`Q^�O;�x�l�10�m�6@/�6z�zY�����'��	����B�CP�`���M]��VBy$E�+z�V�q�')}nܿI����W����P$�<����!soy�E�dA_=-<ʞ�Wh���F�"�|�J=Ty��II�������?_N����"[�m�>)>�;5����|j8
���q	
���q	
���q	
���q	
���q	
���q	
���q	
���q	
���q	���q	tj,*�e����A�n���6FTJh�
������X/n�<�Yś�`�8V��x׎������]�R ��]���	�a�&�~��o
s TTc��2P� FJX�F�c�#�O͋�E۲���AC�4଴-C�\�$��ɔ����\�>�ՐKhp�$�Cg�u��}�+�����Pǜ�w��<���mlH1;2e^6 ��̜��=Q�/�(j�|3Wf�;�h�
�n��/<���"Ol����P�~�D����ß����Ҳ'��'/�K�k,Lf���g��'�����r�W1�d���C0��d�+�e�٧#��,���D�yYI)�� �� @h��N�����#�1^v��t7������1,g|L�?�W���0���Qa6Z��l�2�'��he�O
����f��1>)�F+c|R��V���0���Ic6Z����3}R��f�d@���8[P��Q68����Bm���y�r^6	��V��?��?^�[�9E�o�i�|�f#H�JJ5j��{b ����́��\���i@����4�ksρ��\�L���_�/���v����pmn���+u��.��,-`Q�����]������l�P�~`ߦ��f��0��ޘ�(�������4�V�E٢;a3�nAG{B+m��Q0�6�(W�8�c�9x�GQJ�<�v�G��$m걄9x��֝N��]�D�E�3x�Ǣ��(cQ�:��*|��X>��d�
�Ao2V�Ϡ3��gЗ�U�3�Jƪ��$c58��#�BhЏ�Հнi�� �k8ts"�S��I��JY&p�U{&��8� �d:C�G�A�!5�vz��6�H�l���������]�p2�i^��ا�Bȉ�}"�f;o�܉�ʹ*�PJ*�5A���ā�X:�6^��wr���� �0�9_���(�݈�H,�{E�Es{�\4��N�2w�E1y٧���$B?_�/]oZ*gčv<�\��    2E��;�E��;�E�D�T"z�ȗ8�q��紏�&Z��/Yo�אp�_�,L�ҳ8���[�b'��X�iS����U�����>"H�
�ER5	�WT����������������j��/bJv#5#Hv#3#Jv#1#Jv#/#Jv#-���e�KhN�3*�9�Ϩ��>��S��JhN�3*�9�Ϩ�F
�Q	�>�i|F%428���F
�Q	��]����ЩmR����F)��c��e�$���6�$%�͢܆���ۏ�BS�nrdYh��M��49�,4u�&Gu��Y֙����9�49r�9hrdYg����p���j&G�
�A�#G�Ϡɑ��g���Q�3hr��49rR��9)|M��>�&GN
�A�#'�Ϡɑ���L��B�&GN�n&GN���cp@_�"�v�S�(�!�WU�.��g8A�H��LS�5w`1F�R���f�٬�f�8��
�+T��
.y��\��x�Y��FI�
�%hVp%�uo<�����Y�U�3hVpU��\>�fW�ϠY�U�3hVpU��\>�f�w
�A��;�ϠY��gЬ����nf�w
�A��;B7��;B��18��Y�BhP������$��R��}P��٧2�/f/̷���a8���ң��}���ً�ڷ�����s�����`�۹����j��
����g������g�b�E�3x1�����}Q�^̾(|F/������g�b.�ы���b.
�ы��_�Ղ�m~���/���CB��jd�C�DI�L��xD�-����T�#����zb����a�R�0J��<��ᅦ�yR��y���*Բ$}��wX��,}��Wxe+A���m׀�����H�<���8�A5 ��8����S�)���k@N�3���gT"�ϨD
�Q�>�)|F5 R���L
�AS�I�3hj2i|MM&�����
�AS�ـ���d� t�68���ɬ459�Z���
|�z�4V�����)AT��<��ݖ�u�y=û$��ȥ6�+�< K��jd?�7_���·E�
[��:��(�2�I8��K����Uq�[�?V�
���*t"�n�[e3��VU6�hUQe��N"'�Ӄ�9��=��p��G�{9��@h"'_��A䄿�����|�`��s
��D�)�F�˜S��V�9R��V�9R��vAt�0��Ha6�ё�l��#��hD�|iNJ���ӬVF�����4~�;����#�˒��>�NrQ�k��>����F�~�2��lą2�<�]g�jLC�[[&�b�C�Kg��j����a�9�@�iJ�/VgZd_���лB����S��K���u�R��w��ˎ�O�
������2>�a�+���9�Di���ݐ�P���zHG�l|l��G����4�S
�6'�ػ�|n7$K��řF�]%��_�ny��ny�:�6������@p3����ԛY���9��s�ݍ����(�uw#8�٨���l���1m�H�6�t=�Bm��z j��"���9R��V�R��6 <4s~�N����c����[�
��#�OS!��8|&�GWv$�i�:�"ρ�3)�9|&E��8|&E���י��Q�zG]�����92��II�6z&��۷�1�ELu�w�Jy�����ʇԪ<�`|�����^�M�;�1=�V����d�����ï ����$;�H���9�aI68YO�$�,?��Ǔ�8�d���u��S�W��)|]��
�A,��g�����+|M��
�AK'��g��	���s+|͜��A+'��݌��B�6N���yEނ�m~�����B��eh�u���Fp�m�����Ǝ[����oK��lMCCו�@Ǣe��3�)�I&9@2��k�ʠ�F��*c��6�lk��k�
K�7zmV���Y����6�|xz��fe2Xwj8����%XY�3h	VV�Z��>��`e�Ϡ%XY�3h	VV�Z��>��`�
�AK�z�Ϡ%X��g�����n�`�
�AK�zB�[�[�Ϗ�ݥ.����Jh
8�C���f���F�rb���uٸ�����I�X�휔x��9I�3�u;'�0�휔��sRJ��ivN�Zʺ��R��vNJ�`�%�WW�sRV��9)+|휔>�vN�
�A;'e�Ϡ����g��IY�3h礬��sRV��9�h|�T�f礢�sR1 t�+������Y��T��8Ȗ;�6�"�O��`��� ��t�f0��m�Z�ڄ3/�����m��!��.���b��f�%J�3��2��|R��O�_�x��Mk�,؍w�dΧ��P"��Z�wϳI��]V��G��M������6��{��;��}e�pY<�${G�.��g�ޑ�ɀ��C\����H[�)J�uv�T�@(�Cv�� ��l,e��?��ìL(>P(n�$ԐϷ"�:ñ����yhT��׵�����������\�1��jp�����t4�������ݕ��?~w���g^)�W*�d���*N�?�]R`�t���C���_�(�#l�eh�nC8Y��s�:�P��[���`!����׀����򩭍�z(́�򱭍{�������|nk����0�`f�,��l��ET�w��
��Qa6��"*̆;XD��h������j��.)�F�7\2�v/�pɂ�}�����c�.)�F�7H��}���Iyi�z�$���&��>��@|:��a�Y~#��H~���s Ԗ"a���'0P�������x���u[�DT�o<�ـ���(W���b}q�?��RTf���٨-EEa6jK�G����5G
�Q[J>ݷ���R���R�Nv��(_D[�/����ȽXo�|��Z��@��C���;Ht"8���~�d|̨$dɂ|Z�3�X� �Y����H4H�ʟ{(z�d��(�Y!|��VlyEz��NN�ńޑ��бr�1oh�'/�!y���oMGП&��/߿��=��d?ߍ4��@�dY��,����ڀ��,�f��Em@uK���l�D��USY�i�dYfÒeU�K�Ua6,YV�ٰdYfÒeU�K�Ua6jf�S��J��f��%9�٨dI����%9�ڨdI΀ڗ~�,�}͑���%Kr
�q�R�l��d�a]O;"�S4[H����;���"N�m�� �V�_�7��%����x���F~�^�O���zI>a�7��%�����$1���|��o��K�����Z7��f�&���a���e.�אd�(��zP��s_��#bF��7z�0?��s#$$�&J$��DK�����߿����哅�G����>N��E��_�"�����Z�౵*i�����/`��(怒r���7r�j�8�v4��;M腹��/K��ڱ۔��br��<�br��<�br��<�br��<{��B}y��Ʌ�������+&�˳�L.ԗgo�Mt_��Bmԗgo@���oA�k�����sP����\D�`>�lt�7�/�����2�6��s�e�s�q{��|�?� ���k����3�S�_�t�}�~{Y}�<ٵ)�F�`���3سBm���P=�=P����-�}͑Bm���P=�}�֕J/kآy1o%��ƭ�����j�+����2} �j�Hn��
�Hy�U�r��� ���x=��SFR�s`���>���(����Phn-7$n-{�AJN{y/ID�~�|M�+�)Z��Lr3O/O5A>;.2ʚqd7Y��}�,l\�7ڝPdVٲ����7B����/����JN��i�A�y��EJ��Ӿ����������|�R>��a)
�Aϰ�ϠcX��g�/,E�3�����
KQ�:��(|}�R>�.a��A��T��9��*���R�.�R-�����n�`�
�A_�z��3�#�k�ErII@�$4��k~���2���ِ��~�o0�����z�^Q���$    @qD�IHp`5(��� ���'�Sjy��$�jQFv͑A��X�228p�ķ�u�|�ѼgO��#�_�^�Q�D`�:h��A�Z��6��;Ά�ω���\Xn��C�0[W����T�w�.�H��'ϔ���4��"����XH)�L��h>\��	��|/�-b��}}����U�("紡�G8�a=��9m��Q��!�G_�8��E�|y<�4��*J��PE���;5����|j8
�A%�Ϡ���gPE�A�3��Ġ�TQbT��(1*|U�>�NJ�
�A%F�Ϡ����<�B�J���������;�I!4�$7fk�*I��h�d��z�$���f����/�ȷx7z2&��FK�$M�������x�K;��}iG�Żю1ɷx7�1&�����X�3�ҎW�����>�/�x���K;^�3�ҎW�����>�/�x���K;^�3�Ҏ���������N��/ ;!B��v��������B�vB��^>�$�'ձ�k��%���PQ�,�����b-U��7�X�&J��3�$e޻%�C�|g�?��VE+/
�q���E�2N�d��^S�(M�xˌ��`n8�W���a���Y�{v��+ɧ�8��!��o
e��QßK��>A��Yf@l��Js�'ȕ���|�, 6��ss�'�5�;5�����O���g�'�U�3�����r
��,����r
��,����r
��,����r��,gp@�,���r��XdA�6?dp@�,R����T�e���N��iߌ���4Bc���E���U��|!��%�C%%U^�;oϹ4�s3�y5<ù�� {�xZN�`qa�C%
�K�:��٫K���t,��'�?�򏟞	�68q�o��^��o��]��WўS
B�=���E{N)����AA�U�甂P�h�)��h�޻5�����7<���`qߴ5�M|�W�y����q(���:�q�/2�[�r�6!e8�d!�8���8���8��������/;��8(tw�j����Ͷ |t�
�A���g�G����9*|}t�
�A���g�G����9*|}t�
�A���g�G�dp@7���}���|1N���cp@7��Bh�G���,Y�V�2�澓�7{�3�f�{��b��|�X���BDC6�z����up��P9��X�$����|΃���Re�xsIG��X� ��?�"�9�LE�j�W�?D����m�U��`-��|�2m��)ϑ��M�f��l����E~�T��]�JqyD�%�9Z ��\�uH��
�H�.�)N�� ��x����7�2���i�����M �9OOs �9O!�,��z�S�R~{�Q�D��nO��:�hR�������f�F3c/Mw��yZ`-��s�〤���8 �=+T �=�9�h/S�7ާ���8 ���9(Qy����8��7�s�D��gP��^�3(Qy�����W�JT�+|%*>��
�A���ϠD��gP��A�3h�`p@7��Р	��{�m� t���ٿ>*���  �kD�$�n��}� �p��sѼ�~@�x�e��0~PD�BІ��e/�C=K�n�N�.�q��X����sce�冑��R���ƒźSùy|ɍ%�?hn,)�Ascɀ?�ϳ�Шɔ���CШɤ�4j2+<���
A�&3+�5�B�FMf�РQ�ـн�/[�ϏBhШɬ4jrr��jo��ͶU^}.]�Ͽ�����!�t#�S>H�os��T��}
������$�y�[�E����K�Qv��y�;�T������9�2�ۈ��i�e��RQ6���4ч9�2ͻ5��5�i(^s�x;��l�e�w{���2ͻ?��d��0m���l4��Bm4��Bm4���{�ݦj���)�Fcx�FU��cx�NU��^}Q6�_9�([xn<sJ�TЙ��w��Ѣ}���.���&��.��X�?���;"f�cm���S�}��ޭ����?�J�wu����GLԘx:%+�C1�����4��R�����ٜ6�4&ZQS�O6�ʏ�́�t���M��́�t����M���Gt9+�愇���@�������3>+g<LȬ0�z����l�}*
��-R�}�aŀ��^+
�a��(̆7mQ�{�Ea6����/�(̆���0�U��l�<�
�a��*̆�j����V����Vo�i�<�
��c$9e��ݟ��j�M�`��^KN�lt����n2���u�������9��U��D�fC�D�_:��5�-�D
�P9�]x�3��GHa$*���ܲ*$�s�9#�d�	m�P��Մ���·?6V/��#	R��x@�I�����T}��:�ذ����0����k�|8��X>�����8=eo���1"0p�����1��㎢2��\��{ �@� �6A���� I�A� �8�}d iyD��$�L]#�}��G"��<G��<�M��l��BP��U
��
Aa6�XAa6�YAa6�Z!*̆{+D��ps��0�f��dTi���e`i���edi���ei���e@i���e�i���eTi������3� S/ɕ��rA*�0�gC�^A5�� DOv�Y>f�S���1�E���r�؁�=f���@���~��d�T�@�1��)���YE˵������_:���1�ɂ��)�F��L
��c��������Yx���?F�޽�7��������x������&�L~��:��X1�;�>������%4!��)�N����t�3l� Z���	PE�ֳJ�$x�Si$���sN��6	�������E¼�y��9��0/v*�P��I�z#,ހ�����C¼ة�k@����j��C����)��j8Dʪ���j��Cº�)�k@�ԝbo@�~��BHԹ 68��sA�0u.�f����lԹ V��:�-�~�yjw炼��y�ڨsA^�6�\�tw��u�X����H���"��?;�c��i7��j�*P�-�-accm	#�hK��AF[V���2ڲ<�ԁ�w*�yr?��_��_�)����SVT
�fO�@��6{ʊ ���)+j�'��˫�h��SQ�7�fO�B�F��o�񝊢��6{*�����(�Fm�Tf�6{*�r�"Ea6��)��Fٔ�m��^�9�4Qz�Ƚ�]�2�9��k�Yx��v$*Ҁ_3��W�´������v����T�Q%��,�d�41V�r���Mq���οy�����g�З���p��Sp�e����t���jc��|d�ϔ� sf�6d2��G)Mg=�"E�w��l�2�d��W��6+�S�e���e���彬� +2v�å�a'� ��,�Cy��K��l��W��@[w�����7�B���76��2�coy�N��Z��*9 ߁h����x�����UY�+~��U�J�`�kJs Te��[�s�Q���,�$TL��P�*P��Օ-���j�bRe�ڨ�TYL�F��/h� ��NqP�&/q6vH
s |��8G�wHJʐ����!��];$U��"3xv��Z����XK��O�L��Z�����[+�/X�Oke	�����o�G��������#���G�#/���G�!pw�!P��Q�!n�LP2O��4�f�䮙�W�O
欄����Ф��}HJs �}H	i�v�(B�����7�(Q�l��F�.�|�^#R��hQ�2Gh#���9B�G���Q�BH�DI�d������G�l0ٽD��?]@q���(9Lv�@u���("�I;F|CR�?�?�e�����v�Q�2�h��Rj��#JU��QE���>�G�bM�y^gtZ�I���}�)��2k�(���k ˆvTf&��*3˰Ԇ��ee�uot���N�A\�<z���ϑ��ڍ��,h+�ϑ�O��@�&���~�bڼۘ��b)뽟Ew	K�W�6�����K�Bx�rK	Bn���m�\j�r�ZUbh�]�J( ͸+U	�w    �uG~ �w�)� 4�:%�f���M�.�F�D�P��:%ʅf�U�D�P�6�zw�>�A)[��K>Lq2�����F������"�,k�V������l��&|��7h�Ei=���	�m(t��-ҜR�z �ձ�d'��܀���H��F�
y��g��ُ�"�V/YOcN��%�΁�K��TÝKֳR߂^��y�����Q�d=�T� ���tё������i��+����{o0�=��{e��$)��F��|P&M���`�{���d�IR>(��&I�`1�=�7*������M6��2�h
���HO��`������%e�����FS@�l�� #b�ٻ�^w��X��An����Er����ۯ�R�QV��Ϯ�'��vY��RR����m���R�)�B	2x��(~?��ȕ��D��	��u@F+���.r)7�ȥ(��S�c�!�kWO�W������0�����7$�-���%�F�kuh���i#�цKD��+7�`�_د$��^&a��1����Պ�CN$a:7�6m�e�B�߇4��X�p,�{�y7�彪�fUi������[�[���"+����L6,�xe�a��+��-A�lXl	�d�bKP&[��d_bKP&[�2ٰ��ɆŖh0ٗ���Kl���%�$���IR&[�6ٰؒ�[�Ł�O�d&�l�Kl�ŷĖ�	[�j�cN��s ԝ1����<t�_w��j�2`Iɨx��O:�,�G�]����)�#�|���/��G�Y����e�OH6	C��=,Yl���������X�<{
�8塼�NS��ˏZ��A��R�j���*Bl�4 ?�{�Yao�*��V��٪�7[�f��^J��+ؖ��
m�Wߑ��|K�t���Z�'�Z���́��=�>f B+�佷<�^����J�V�������^Y54�1{e��ʽ�W�����W��l�r/��h�^�
!�ʽ��F+�rT&���Q!$Z���BH�r/'R&���B�X>�{�^N��G+�r2����Ya$Z����H���Ya$Z�W�� ��7��g8̛K4�r��:�N��9�7��i��P�9CqT�@hő�D��P�|�"��:��G�c(�y��P��֮]<�qټn45�h�#�@
���c��hű�l4��Xa6Cqހ�=���l4���l4���lT�p^a6*m8�0�6�ט�J�+�F��j�҆�Ծn�`A�>GA�6CqA�6CqUy�!�-�w������{dٕ�DQ�wCd�D�����z?��,/k�5�3ļ���ۡ�5����䕰%�y����8����ԏK����4��ゲj�����M�,&��z��Ɇ帨L6,�Ee�q9��-�qI�"���K�Kr�C��&�����8�=r�q�`�<�8�=����C�S��������$���ggd�gBr�W�9z��;� ����C�z�W
s �v�2@�:�~�WJs �v�R6��{�b����R6\�i�v��0��++�Fo��
��۽��l�v��0��++�Fo��
��۽��l�v��0��+k�Fo���~�W�P�ݫ7�v�ݫ���5G�v�ݫW��FnP2W9:�u"��p�+�V����MaX6a�̣��&��aY��D)ɍ���JY����J�~����9S�*�FI[����Ɏ�;�������2?OC�z_� �\�������ƣC�s 4dUǆ;Ѐ��GYձj3�xtȴ?�����G����.�?G=d���_рn�L�xt�
��xt�
��xt�
��xt(
��xt(
��xt(
!�xt(<���P��G�ѡ(��ƣC�&�G���6�U�m4��l_/�V�=����)��ƣ�S&�+��17i]���IhfC���g|�}�ޖ��Ym�������������/[G%���y�ZG�w>�P��0B������u�~
���J��@��9��Q�ՀG�;yR��ZG%)�F���+G@�uT��l�:*Ia6j��0��JR��ZG%)�F���f��QI
�Q�d�٨uT�Bm�:*Y�6j�l@�n�lA�k�jÅ�25�m�%�L�q�Wm�s 4.�d��[�j́иd����#�q�$����Uۀ��K����r��O�q�f�q�f�q�f�q�f�q�f�q�f�q�f�q�f�q�f�q�5f�q���LQ�6�Lр�=.)�Z�v��dph_7dR��fe�C����%�,_l���FY>���S��|q�������RorV�ޢU������|�#��tuq�?s→�ۨ/��z��e�*�q����G�9�A�߰�a����9�@/Ꝧ�!*�j�B�}��#��x�a�l�(c0��UQ�f��)]ƌ��I�^OlE�]�7l�����2O�o�0,�4��e»߰aXv{X�^�̜_Q�@~�{��A��;���G�wT��ܬp����M��;���u���;U����B�ŉ>�[�J�j_R~:��r�MT��%E�D&&!�{�F�z�d��D�ƈJ3w!�:������ �����=��+��p��7H��2��������`���i�=A[��[��AK��3���|gz������}ezj_s�P��
��L��=H4���i�,S��[66?�I��m��[�x,��'K�g.f�1�/�G� !Sˍ{�\��'����v~�L������2|v�gF����o�ﯔCk+���/Y�z�Q�)ce����G��� ��ɗ� 4�H�M@h��|c|yD=�H����#�4d��|fu�z�����w��
���#\_��G2�> ��G2���';(�F�dp}���	
���#\_��G2��>�����0U&ep}�lT�����ӿ+�2�����d�Ծd�hA�k�j�ʤ��/���,�$B#�v��� �G�W�Z%m�����V�T�W_�;s��23�3䌴��#�	�W�J�3?���-_V��A�w�"��$-wk��<�>r�Q�d�p#S��9j�Rqs ��-�Q7J��9j�RQ&^5��H�k@ʪ�F)�
���?��,?j��,��H�k@
�P��d��F�_� d�@q���05J�*�F�R�
�Q����l�(e�P5J�)�F�Rv��F);j_s�P5J�)�F�R�f�g)�A���Yʀ�������I��w6�
��g���#9ρ�)�2�h�+����ҩ��ZX�NC����%�(��>E�j �Y(�?M�! �Y����g�����,T�ɾ�,Te��>բaC��v�d�FSt�?bR&5��3��Ū�L��@���凍��f��I!j4E��jП�%��p��C��Y �ڰ�'�Ⱥ�kI����}]@K�.SJ��t���X/RM�r�� w�C�?�Ԇ��NNf���j�Ȩ�+�$��ພ�FS<����0��X�H�0���گ�����[�@�L��5`����6��|�3�&� �z�-��܍�QL{G&���o�s>�~Ýˑ/�*��4��Ḷ�a�5��:�
tŵ�3�j{\qm���k8դL6ז���{JP\����qm)����Uq�,L�^q�j�7N�6jg���V��l�����^�y�%΁М�\�/��@hx1ˢ	�漽+�7Fԕ�w�����J�@�*��QW��u.;<��Ua6���0U�rU��*e�*�F��\f�JY�
��[Na6�s�)̆{n9��p�-�0��4f�=��Bm��S���rԾzn9��p�-R����ֿwI����U�^a�O���X#ɧ�W���S"�D{�Puc��N���g��Ě�N�Pg��A�Y��(�9^�4���'��`�r<�S���T/�ւ�c�g��1��H����	��Ƥr���3ŭ���]�ar���B�w����e��O�eoq������7.)�����7.)V��,�k����7.)��餘W���<��t6��.;�B�v:+n���Js��l��^v:    P���ق�������
��9b�O֊zK?/�rE4?/�����eTB����Qc[#r)�[7EJu~��G�P�<�Tj<�
*)Z~�3�T������剝<�*�6�@��n8;���+̅eM�w�[���l
f�_$
A'Ĩ!΁� ƻ��x��� B�U��a���׈���z�ƛ1H�Q$�� (����Հ��//7�dHQ��n�%΁�n�%���_��WQ��_,���&Ve��n�����n�U��-_����I�t,]��Ua6�-�*̆��W��p���0�_f���dJ���$s:����M�t���@��ݲ���5G�v�햝Bm�[��"k��r�9��M�*�71s��g;�K�?q���~����d���V)X\-ρP���&��@���8��e���6ʺBB~ӭ�BSTJdQ��A�ww�(Z5��J�7�D"*��p��T�M$d���&ɠ���cR���&2�}��D2�kp5�H
��&Ia6�D"Y�5�&ۀ�W�dб�j"�f�M$��l��D����{?d��p��1�QV��F�(+�D�G�"��#*[z􈊲lh�M�v��.d�e)�x�٢N�����J�oX�4|v�e%9yi�e�0�n��4����|h61���dO~<��K{}e����˶0�+c�q�W��+㜕�3�-�9΁P[������9�4�Ala�e���:Bma���v^�0���(�Fma.
�Q[���l��b��x��Mk&��0���(�Fma.
�Q[���l��1n�Vj�ժBm��Z5���P�ZP��#��pC��Pͤ���̥�;�^2`'Y�W�z�{ɀ�d_�M�U�Ά����9z��z�����s�st�s<�/���po0w�S���S&�&(-��&e���?��d��?�2���H�l��l1ٽ�	+�������F����l��`�s�����v�����v�#��6�L ݋DI��m�[�}e*�_XR��@�cՑ��\i�	�yK��u�:Ѵ��V3́����y�����@h�[�a��U�nuD=���4B�ߪ�^>����T�@h"]�ՀG��Ƣ0M��Ea6�HW��l��Ԣ0~$�0�z$�(�F�jQ�?�ZfÏ����#�Ea6�Hj՘?�ZjÏ�V��h"]�Ծ2����9R�?�ZjÏ��!i�S��ǁ�;��E�U��
Cj9ً"Oq�`#�A�46�2�P�ї�%�6�R���
�|�#_��f��p���"N��bpF�bp��j��)
�)ٕ{GS�L6�� )�k�d��^�")�k��L6�)��d_�"+�k��L6�)�2ٰ��&����1ri�^�lXS��ݥ@�L6�)zM�������Oy��Y��(K�S�BD�\�irUT7T��UQ�P�&�2%���.�Y��:�.�w�""Mq<B��"�����:P��i][)Na6���0�V�]
w���V��j+�)�F��B
�Qm���lT[)�0�V�?�Pm���lT[)dphwm��BmT[)d@������5G�v�V
+�FS�kd���i���_*q�����(�s��@��c��"��m�O��?|NCJܺ���`��E�6p(��Q�Z���w>EY�7��(���ن�QB���0�w�S��d��N�k�n�F�k�̣i�Yd2x��3+��'ܩ�i�i��#�ŗ9��Evy�x��d1�Cxq��'����.���^�g�<�9z�Û�PՏ}����]��Ѿ��4CE�w.�N�*�@J?-T��Q駅�~�� T��Q駅�~5*��PѯF��*�����?]@
�Qѯ&��p{�2�r��ۑd��!��oG��n�����i�"��H��BՊ�}�>	A�A��"|��Q�]L6Bd(ρPy�e�`y2*�˓��w�G_�.��%׀�U��ɨ�,Oƛ�ɓIY5X�L���ɤL6,O&�ɾ�ɤL6,Ofe�ay2[LvW��E`yR&~�D�����'e��F�|R$X�,�l��dQf�'�2ٸ<9$��>�]��xGT�0k���r�)�9y��[.0�6O�s 4-��.pe��i@J84-ȥ4B[����Cӂ\*s 4-ȥ��t��/�/ʺ�ԀȀG��Ya6���0U\V��*.+�F���9�针(.+�F�f�
�+
�Ѵ Wf�iA�h�Fӂ\Q�����P-5tŀ���X,�}͑Bm�����h�<��׆M��}zw�
�ｈ48[�j�b�u��Ι��Sでe�C�Z�e�Ĵl�A��2(\+3}?�|�p-�}��q�ıN=�����U�=����enC^vv��l��#�N�M�����N��/y�ىEI�@k bQR"Pg'����ى��]Ǉl�:G�ى��g�G��Ua6��Ī0uvbU��:;�*�F��Xf��N�7�>����l�ىUa6��$�0uv�S��:;�i�F���j��Nr
�Qg'9j��19j_s�Puv�S��:;IZXO�ï"�\6��TA���Ag�qeQ��w�5Ȣ:�/����s�}�59��s ��ȁ�@�ɑ�Y��r�kD��&G>��u�#�]�&Ge��9(�DM�,R�ׁ�dG�٨ɑ��l���Qa6jr�059rT�������o�,�,�_&y���0�u��.t�á����f�ҽ��8�uh��z���Ҡ4k���d�Uݐ�\d�r�4$7J}P�@g�Q���ƣ�(́�>��w�ƣ��́�>�\�@p�|Y����i�9�'_���@�d[ʍ�SP0�Qo��f�}��l�O�W����
��>�ހ�W���0�f�}��l�O~P���
��>�Ac6�'?(Ԇ����p��`@���3XP��QT��ɏ
�Q=������v�D��36����z�5/,��k���c>�.(NACTq9l�-���L��zˉ$�U���ބ��O�3��2w��)ʝ�D��u�j�YA��Q�BG�_1��
��~�3F�v����uש����z�ߥ@��y~��~��<g����Ǣ����/�uy��e���tU�Q�o.4m����F2�9 ��2F9 ��2�8	3�H �PC��z�����(u e�Qs��,9g��k-~���J��(�w��8&�6n84�iU�j@<թ��@�:Հ�T�P������G�K�s P�j@e����?G�7 r<��0���l�jl@
�Au�)�թ�0T���lP�j@
�Au�)�թ�0T��c�٠�Ӏ4f��NCR��;H�6h�4 j��G؂��)�͝�P4w�`�b�] 	��f�;�$Ѝ�߾�ա�T�	S����}��.G��<�/�v�^�ف~��#�c��8x5V݀���~z���7�"��5��uʀ�����n�g�2���G!��Dj�
o�����<<H�~Df�� /+�9�eE�D��i{Y��@�����./+�U�����Z�Z5��WMa6�F����'����'���OK
�a';)�Ɓf��zR��)̆���02`��$�ٰ~�f��AV��Ya6�df_��f�BDV�����/E#+�Ɨ_a6,�d��0����W�}�(̆Śb�싐Ec6��s�bdQ��G��оY,̑~�j���Ծ|��Pfd�8�;��Fm��U�6����bdU��u�F��Yj�D2�v_r�NȀ�}�I!��]�$ẋ�4�A�l����Tn<р�Z�:IF*7ޜh@E݉�$c��^�%n\ʢ��Y��~L��o��?^ѕ���K�Dq�04�@�n5���UD�De���'������U�����JLG��)��~�!���q���r��q����r���qя\DW#��@�6��%��X�ɀG��
�Q=���lT� �0U�+�FE�
�Q_��������f��5y�٨?LAa6��RP��z�4f�N#�ڨ�GA�6�Q0��u�j_s�PvтBm�E
�aFF��0#�Bm�����N틑��Ծ�}12P�bdT�3R�0E󦟉2lY��R�<ԋ�}	�    /Y�CeȲ�ƅ�Q�b.i�P���(�t�g�1�?��Cr���:�]���@��Rh�,��@��R���.��($�]���.��?G��"C/O4 �ٰ�Rf�.KU��,Ua6�T�ٰ�Rf�.KU��,Ua6�T�ٰ�Xf�b՘�U�6j �S������Dv�vH�6j �S��I!�H7G$lH���y�׺�in6�"����zXj.��x�-��t���<n��XJηX���2�y�{ó�\�C^�,�d��bӬ�^ˠf=��YFB+�����d�dгn�,�u��,�u�d�S��bJ�I���]�@���@���@���@�i�z�̼?��2�9�2�}��G<�X�aN�+��[f��ˬ��o���;�+tGe�
�QG��Bw�Qf��u�������G�؏M�0���0�{��f�7{�٨��Ac6�qsP��\fÞ{�8���fÞ{P�{�!�o犃�wX
�Qa����-'�#��r9ґ/x��,b�$�{�� ����;Ѥ��QL�0�֋r��*+�tV�V�O��m��f��!/ZD�@���4_��O?&�d.��E�ai`����-� / ���`�=eu_C�v*�mt	�:&��ר��ݫr���{-@�V���u��;ޟ�nr{�@��흲j���Ū���@��흲����]�/?�T��	5�=)� j*{R��ʞ�;�e=)Ԇm�쎜�o�3ӑ/��?��4������eͬ,,kf�ԁeͬ�:����S�5�v꠲fVX�,ʡ�E9t`�\���Xf�6GQ��Ea6�������lX�+
�a��(̆e��0����lX��a��*Ԇ幪P��B$X�����6����.�\�l���"6�L4L3�" ���N3�"�I��yk_R����x��������*�y%�;:ϧ�h���.u_HC��Z�������	��s�	�f<�锬����-4.�ь��)*�x��b�=y���\4�Ñ/x�h�G��D\4��uѼ�s �E�^9�Q��:B]4��d��i���A9��U7'=�4���?(�F�Of�<

�Q7���8!f����
�aBF�٨c��2*��y�Hw�}T����>*���Q�^H���2�px!)����dw� )���6�px!+�����}���l_R��v����6��e�aW?*|E�>����\#��N��M����I�l��M�d�gm6����F�u�fe��6[L�uD*���E�l��-�l�gm10l����#�Y[��q�Z���Yk���Y+#|��ʘ �
��l<&ۀxźt*� |J�!^�Uel	H��@�IPF%�\˕)D�?���Z���?1����lp
�QY58���)48���B����B��������9imd���=a%�W�|�SV��'��rs T�Ds TW�\��ρP+P�Q����f(�]ی��u-�r�.Z �٨�Xa6�V���h�f�.Z`�٨�Xa6�V���h�f�.Z`�٨�Xa6�֘��h�+�F]��j�.Z�Ծ.6oA�k�j�.ZH�>��>�+� ��vz�E2��}� Û��m2��7�� c�����37A�5��R����
̾���-�`�߰�e���C��vɵ	s�.IH|�1��e��|�9<������G����~>Ϩrb�����<���@����b��XT6�%w{�@-�������:� o.�p:��m؛K
�ao.)䆽�����Bn؛K
�ao.�}�˛�
�ao.+̆���0���l؛�
�ao.k̆���P��Bm؛�Ծn�bA�>GE�6pE�6��,��c��0i@}=;f���L�FWGtQ�H�[_M�>ú�+���IN=<�*"�X�z�@Wko���ó�8|�G�
�aw�f�h�;^�|1�|�Zoy������'��xtt�'������<���n�{�݋.́Pw/:��Gݽ��u��S�~�݋�쏨�h�U�2B\�Hn��D�s�]�Hl�#�@
�Q-��l�E��0u�")�F]�H
�Q-��l�E��0u�"+�F]��
�Q-��l�E��1u�"+�F]��7�:�E6��u����9R���h�j�.Z�a�x�BD��e�3Z��QFD�!W#�hi\v����{*�g��8��w��C���{r�~f����@�u�!�9����:,���uL0���:Tˈ!���1DuS �^i��P!�Ι���o|���×3����u~J�8�1�#�o���I�z������,7j�[8*��
c82�n ]��������3s����|��s���G�tc����ә]�N��M���"رOgvQ7=�|����ҙ]T]���]�!	�ѷ|b:���N���p��P���|�Yq���|�b����g��yx�2:\��u�(8,�%�E��Kp��!n������#����Ɇ��N6(��e����,�����,?,��_���]G��V�	܊�HXp+e���XP��QU�nUa$,�U�=r�U�6luW�ڰa\jÖkU���Հٗ�Vf�7d5�!�38�����U�o��-�ސ�Yھ)�Fo��|�~C&�0�!�S��ސ�����LNa6zC&Ҙ�ސ��~C����R��[7d"j_sd`��2�Bm�L2��@?;��q��3%QN�Ѳ$c�i#�d���;��1+�J2,������8X�������PF���U���d���w��H+#<���x �}�.q��&�w��Z��%O*��0R�<�A�H�{��!��K!:I^!:�H>́P$�<B}����A�����&���r��.N
�Z����]4~	�5G��<b�)(� �|��] {PA���] {P� �����Z>�)*� vТ�.�����g�<E�.���������.�����l�G�>�3�3֞�!�#D�ҙ3�l�tf����#����S>3�W�5�t��x^S>����)�Y�g�5:����k*gN�g�5�x�H{^ST.|X3KN��`�,)W2��%op%w�/|��Uwif��N�4��L6���3vڗ͝��/30��g_FWV4A#ˤ���/ˤ��L�Iˤ���,�r�v��Lʙ���2�g�ƇeR݌/ˤ�_�I=Ý/ˤ��ΗeR�9Oˤ��^�I���yV,�ҭ��_�U���K7�|��ed�`L+��z^�dV��,��y#��eX=�C[� K����aN"�,#�@���ci�2��E�2���r� 4��J�'��p��W&�n!$��)�?�e��m��3��C�^���6��Lʆ��Q2�#�O%�;��Q2ә�y�(����G������G���_>J�x��dNgf��d>�g�>J�3{��Q2�ٱ/%�3{��df�>}����ڧ����]��Q�?�k_>J�qnɡ��+�%�X��b[��ٗ9�X�}���9���̇h�f>���@�����̇�MM�Aa6���Í��cf��.(�FSrP���&�0��Qa6�;���l4����l4����l4����l4P���l4P��Bm4P�� ��r4��u�Gj�9J
�Q�,'�ڰf&�,ʺ�%���\|��eG����rJőa�rB<��%�72��TR��&eG��в!�����5KrO���D�~��`�'��K�H�9η���������/5(�4_w=r=2�/Y���8aϦЙ�z�S�����\FBW	�q�~Y9�������ݾrf=����"ا,gvї�W�]����.����`����E_�bUv�p�3��!OVe��|=���:gU�,�3��%�g���D������
=$���>���lɇ\\4��@ʮA����5u�8eϠ�Qqu��&w��z�兔-��\���t)�չ
)
�sR��s��NvD��,��2p[�fV��fVX�Pͬ��nT3+����
+�F5�"������F{���Ԫ"�uY ,20]7$�"��uǐ    ���z��7�;�����cF��W�w�?��lfۋ��$7V���ٍ��u]Q��:�*��Z���8T�,Aa?*���󵴑(KP6*��Ό�u���Dų��a#�����Dųʑq>E��+�Jtg��!����#T>+��>z��%�\,�|V�}�MKT�*��xf]�i��.Bų�좧hZ���P���3��)��tc�!�YIgv�S4-�`]�Y:��.Ѵ$e�zW:��^�iI�>��tf�E�d��:C���uf:��ef�k��GٟY����þ9v�c92����Gz�o�b/�M���߲�gpͬ�9������̊�`ͬ(W
����fV����D ��)-K�ۗ�Ԁ�o@ˢ���e%�n@�"���/��W���Sq{<��MW����0*�կ/RX�n}�-�쥷R�t�����*� U���N�l�t�zT��7�U���w��9��T��@�@R]��
FuqD]b�.�{� �S�\�I����Q���SN]d�wG���l��ts�"�b%�٨7WIa6�lUR���B�f��D%�٨�_i`�}裒�x�ܯ�05�++�G����Qs�2�/pԦ��P�*+�G���
�Q���By�o����PY�6�7T�Sg%�Z��n��T�t�U��g�ۯ�5��\��GF��5U���͹�{��#��N��_��t��^�y�������|�g��誯gF�L��_��ph�>w5�ٹ�x[ӝk&�a�s�G�B�Ҷ����V��xh�:�t�[��j�lp�Y|F�j8�������_0��vѮ&[�`z� U��.�gl�����"����g6�+�T���(�q�s�E5�ٹ��N�gv�+,SE���5�g��᷏b�f��ǫ�s��>�e��H��w�\M�"�.���."��@e�*"��/���#�����f6�=τVj�-utP�KɍC5;u!�z�4Ł����i��DV����nTDD~J�?���4'��g��|�p@ �3�|�����	��;2�/���|�p8��q~�E�4p���#��R/��5cʡ}��A����hO9�������$8�T��/a��+VUya�XU����.�IE5��
��xfa^�SM�±����!^�b0�ki��Dι�q�ԁ�̥q�i�`'�إ3/�3�l�8�/QϹ3{��5�3�(u~�S��y(u��z})u�&Kk��5���LOW�����Ե/8s=������>���g���5�3;���5�C���5�	{���Ե�A�.�܏�\�`jF������\�`jF��705�!)�fT4 e����d0ۏ}fa�\�2�`FER&̨h@b��N�n��#�-�X�k�$�����/\������u
ߗg.���F��eu�%	d.��/�������{D�n_�c�O�$��/B���������′x�	�$�"tÊ�����@��݀��rs*�#�Do�u>NPn.*G��,��i>NPnn@|d�Y��+w (77�pd�Y��+;����c@5��#?���7��O�t�p=C���\r�#��'':2҇����	���?3��aM��?�������Lo��N��tf'}���������^�d�ಲ�`�9��I_�x6�I�:���d��$XZ�gv�C���>�u�|�FzJ���e�%�gŲ�U���^��T�BsXu*���:��R���l_�SUfV��2۰�T�]�N���_A�rƲm���+hSґ�ym�)7�+hS'�k�������+�0hS'�k���L�gЦN�c��yT�If��dV���RI��%�d
�*P�8A��	�$���L2D�I�$S	�a�d|�|�)��� 8l)!��/\��X����L�8��L�߆��Dq~ �b;Q�/��jK��ѻ�ʙq>T[�:'*�+��F�%��8Q�������+����#�|���q>NT�'>����Vbe'�z=��[��������줧�J^�Ih8��d'ى�䕝��ȟ�I/����^�� ���Cl%��$4@��Nz���vRP8���b+e'�� 
gv�%�RP�
�p�Fz���]��(��EOՖ��.� 

�Q����m��t�T霋�Z��4Em�QA��2ۨ M����4%����%����()��
Ҕ��Fi
���N��x����)��6��4�ɑl%HS<�!?i��� M���~	Ҕ�,�S��t�}
Ҕ-�C��tf�i��aG
���^y�i �e�?��2��UN���b�;� ��Q�e0?��e8?���)�&?���(��*��	���oSX�-a:+K
y��+�%�c����M)ƥ́`I�(��5���'���^�Úk�3�|j����	k�5��^��|^�kMG�����|�K"��>��Z���K"gwf=�mv7W
rı;���6;���cv��e�l�S���;��^�6;�NBcv��H/e�ݙ�����4tA����A����Di&d\�4S0e�GdtO1��GOe�I�E���dt#1+D�Ot68ʮ#������಺�,����^�i��O�7N0؁!�!�	���pT��B8l��xQh,���l4�I��h,����Nʲ��Ng�5G���B8+�Fc!�Vȵ��m6Vt<x���G���fÛ�+��7�7�u��,ֿo���?�ق���f�m���4t�i�jq�Vp�_$�WGه+����8����l	��'fqe{���xb�%�+���o��xbN�ŵ�'fa�N�#���!�|�_݃� Wh�^��(߫��G�ʅ�*��8�&u+�
�w�����Ï���~����c� ��B|x� �i@u��7V����CC� ��h
@�)�F��C�� ���^�lЮ��v(����d�:KR&���C�$d������d1��<
�d�z]|ڻ@�<
�d�nM|(6��-u"Ee���m2�vꌌ���G�!�lR;uF^���:#/p�H�������zņ�X?2�k��l<���@���ρP���0B����u���2��p&t���g�_q�8�����P�W0Jf��?�#X&�N�3a�ө��3a�әH�3a��$ l%�p>�^�%����j#�p>���XxLn�X8�!�S`�|��|
,�'玥��ֺ}�63Y�b���>=8H��<� �)�'��y=G5�,��<�Y����y���"?z&�<���o<u^�z=$�u!��h��_��h`ip^�w_|DX?��0W,rJg��yz�Gh��<�(#�rf��g|'���PV\T��YqaPI�gŅA%9���|V\T���`��$�2٨$狁��%9_��F%9_��F%9_-&�{�U�lT��U�lT��Us���ڮ%�v��^^ 	�^z��Q�\P�{eK5���S|D�V��*����0lk%9C���0lk%9C���0�#�$�Q [��9ן}��}�li.ѡ�2�� �z�T��`�,߿�! n豫 �!�N�r����C.�]���CO��`��{I�}&V��`>�w�fuŐ�.��|6�]���r�r�i������\��Ͱ������ߥ?�>��-�A��]���1����ɼM���Y�M��Y�f�lJ���_yQ�Bl��1���X�/}|�=��H[ō�@�*n��~~*8��H[�����0���Va��@�8����*�d��U���U�>�(dk�(��@�=�YXEQ���Z��?_@Ԇ�)	�H[�AI�H[�AI�H]�AI I[�AI���Z�O�@`[[�A ���� ���z�yhW�xUNrN�)oq�aA�
� *�"�N���T˚þ�mE��:܈78W߈��}m���q_����UY ǥ��^���jy8L^cL��>y�趄o]y��g��7��@.�N���{��vݒ�!�f�;]��sge��oRoF����z3���z3:��I��|�ۥ�L����L�e�J���g`v�7g��ӥޜ}��Rof�%��z3�,�]�ͼa�J���.�ԛ�gQ    �Rof'odH����:]�����Ro.N;V�zs�L-K������S����'S��v�)O\��7ǔ�&����1��.��1岱��c��ɴ�1��c��r�1nwL�n�k�r�1�혖�d�昖�c��c��c��1-�i�6ǴD�vǴča���f�pLK�Y��cZ�φ�ʏ��	5�� �W�cZ���{$ϟ��T�H���@��,�A�U�클�Y���,�lmp�@�68Q [������,D�lmp��܋>#���68) �d'ai�� �`@�YO �5mp���+�V�4mpP��68$HmpH`[��X�Ε-o��$i����6_ɠ�n��kJ�qS�ʋ���� P�iC�y^%����4 �Ѩ�g�Ǳkf��hc�uH�.h���4c�x��./���Z�GI �6g�	��3�����ᘥV��'�ݑ_@�.ve��i�@����8��S�R;�|�hM
�I�2"cA���� i��j�� Cp�	�L8���7���lLk&��>�m���cڦ��ӚE{x�6)�����&��>�m!��ǴM��V�� "xӎv-e9J=��Q8H���hpF���$�(j�)��Ԕ��&�Qj�iN*{%5�`~�Ԅ§��&�����@���&�H-5�0E�RS6�Q.�)�z���B�%5�0 �R�q��T��RS�&�Zj*VRS������[��0��RS�VKMU [-5͉C^R@���q�,	D����ʀ{ �瑁�@Z�#� �i=��q��<�ܩ�����K{ ��Q [�yd��z��>=�L���z��i=�L�մ�G�l t�-�_�yd�r��sx?��$�#�瑳`~�瑳�Bj=���ٯ�<r��<r������`��Y�����,�#Z�#���OσyɊz�`^u>���y�����H����-@���K�i�.����J������d�ۉI�!�L�`����rRK�W7����S���sC����QNO���(���Cp2�ݚ.8�A�颏qGk��1�ak��� fښ.:u������=�5]�M��t��m���ea���W�5���Ӛ}F�hM�>#���#�I�Ӛ�|��њ.;�nM�}��hM��v�ޚ�}�~��+�Ѵ5��油3��|��3��]�3����wgkt��� V��~8�X}��� V��3H!}��9���� �����P\�3H��o9��3Hq��Y9�}��R�����Yu�AJN�p)��ߝAJ�E���䴤g��gK�� ��q�+ʤF�6ՓU�I�k�� qmw�8��f2���菵�<��},�V�@k��偠5kß\��3��UК�����������Ȧ��@�6�Y�A��hA�U/���(���h��W!�A��d��y�/�bh�%�mm��$�lm���cf+k�ω�#E����)�2�d���~��8�������(F�5��2���O��1�]�T�>���S!nLkW<��i{�TH>3�O��c�^<��i{�TH>��O�1m/�
�3k{�T ��� >���S|Lۋ����Ex�6e��wZ��Fs<`c\��|:���:�0�nX?`\��iK��J>6����Z�u���w*G���?�U�F��bCJey�K���_�c��N2�c�EL\O��8��6�"�:si��eք��6M�,[�Ic7m��Tޒ�����$�6=�_R񡧅�Kr���B�e*�5=#�_벵=�ֵ.@���zr�u�P�w����W�.@q��]>��H�@��#����Vz 	w�(��c'���� �lez�$��L�?���z�d@6��OS�.��`d�%d+K �/�')����z��ʅH [)�@�2�'H��p�$���\9�}C;�#��q��`h�KR0XG�%|�L����P�>��0�E��<�K`��#����ݿ�^�a�I�R/���K��K0�t���Nކ^�1��`�%7��𺏴����M������(��@t�����綫�K�
�<`\�T</E*��s)R��T�ޗ"�We;\�T�=�R��{)�܊��R�� �xA�0Z]����|Ki��èd�?~(8�犋g��i�/_�WFk��@jq�������H-��r�7]��h��H-��jjq�d�ŕ"��W�@�Z\)�jq��}�+U [-�T��}�+U [-�T�l��������jĕ���J�2�Wb�֊+1
lkŕ��)��(��Wb4ڧ���:r�+1l����>��E���vLu�ק��4��=t���]0�"F��z2��G�8��ҡ���N��1ũ,���5��¬},��	|*�����̴�|
��`S�ey��i9�?Q�Sڒa�t�	�,���@�����y9���턼�,���r�K����;��v}�iY�u��a���csx�s�#�H�ZG[Z����O�ڬ��%m�6��{���-ȪD�Pڃ_%��r�y�^)�������h��g�D��=s���ۄ�a�J4Z�3{�q�Mؘ��~��c�q�M����~��c�q�M�1���&���q�M�1���&���q�M�1���&��v�o�|L;�I>��% >��)�U�Ͱ� l�k�rЮn����r�n}ux�H9 N�V)�>+��r ��b���r�^b���I��<NG��!<?D�W#ͽ��=��4��+���_|�[#6���7b��B!C�ވ�����e��~4b�\]����?��ff6bc'��Fl���h�V��h�67���Z�[�1nk�V|L;�ÎFlucX�Fl�ǰ?���vG�J���1�Y#��1m���G�\�#a.8�N�>�	s�g掄��$����3sb:s���-�r�+�k����������L���o� sd�� �Դ��;�<��w��ƶv0''����q���Ǹ�f���f�1�� 38��9�>��0��q���c��ft���f�1lw�7��s��f�p��|�q-�|�R����<��g����Fw��7�u�wbv~�o�O�8�폟�H���9	Зƫ�V)�=Й<tɖ��vcI�1΍y�}��?�Ԭ�%g���r\5��c���¸����P��|�{�˲1�]
E(�ڥP��c���nLk����vt��>3vt��>�].��i{
E>���P��cڞB�Ϭ�)1����P��cڞB��i{
E�>��)1����P�� ��7ƵL���i�)19��#�"�퇍0R(b�Y��������f�,���6:�RP����V۱�5��t��V�� m�q��� i+�[R���xe,�H[i���rT[i��@����@����@����@�����g�1�lm�1D��MW*�@��Ҹݔ�r�������J�{W��+�f�h☐#c$�-�[����|�Qp
y��'��H[nX�o@h����<�/#,%��oa�CT�a�ˏ��ID��K�D�=��-��{ �[����t"�=��-�$XM�D�ֺ���nA$�l�[�@��-�ـ��-�Y [��l0�O� f�l�[Y [݀�-�>�#�V7 a�lu��u�"��n@R��H��о��mu�b0��$�`��T�lm�甫DO8�h�$ᜢ�#���v�@*�9I`[;G �
�9 ���# ��9`p�Wm��+-�",'�����>Η��_o�	�㜗���m�2��P��9]x�i��@ZZxʇ~tu�\n&y�F0j�6)	�䉜�Xw:��Mҫ���̶������6��lr#"%��	}�[nD��Y�r#"mk���i{nD����F��cڞ�ό��1����FD�1�ȍ`�Y;r#�Ǵ#7�}f�ȍ`ӎ܈�cڑQ|L;r#��iGnD�1�ȍ(N�Q7�5͍�N��Q�v�;7����܈����FTvz@ˍ \��PR������U����\8׊���K��@iy�31Ϛs�=�R�?�� �  H�<#�R�3쁔��޿\�9�H)�!���VU!ƑR�:��{ :�pt��K#C�^]�HR;���A�H [�@�\F�@�Rx<����Ȃ�y�@�2�| Id+�p�A`[)�@�J�� 2`�u#��G�Js�V�f1ץ���oQ�&�|8{_k�]&x���'�š�qBU��%��n�6T�7}����W��u�
�����78�h^����A�ש7 �:}���?m�}��-��Y����I�y��X�}ڿ<��k/���t��N�����W��)lq��Gk��ʮ#�7[��9v��S[��\u��d�m>koĹ�O����e|ӎq9||[Ո�����%�-�r� On�R�o����v��Z�a����r7���1]��9���O7�rǒ_�\5뷂�H]E�-}����)T>�>c��i~u�(9}���])}ை��}�[���7f���SxcX�vR�}L�{�ޘ֮�Ja��vR�}fl�T��i{S�R|Lۛ��3k{�R|Lۻ%��3k{��R}Lۻ���c���T���������d,�Ǵ�G[N���T�Ƹ�Mkp�oG���v��4�A�1�h�Y�ﶭ5T�����J�N@���O��z���`�OH5-*׋������o�˂ۏmz�sf��P�@���b���$CP�`k_
h	�+Xp''�i �>9��7��_������_�L{�MN{<����U�kČ��i�R�m������U��D��C�ī���yi%�x�c���z�l�>5�VM�Śql�i����$�����}��&
�IY��@ڌ�
i��X� ʴ��
_"e�l�
������l��������ڤ���ڤ����$�Jd�a�J��<�J#��W��&�U2XF�d��-�>ף,���W��K�]�gR���hshj����T���+V6�g.^e�mm2Ne��}fuU6XG�d�Z��%����:�=?o��mO1鮞�o�<'��;Ť�����bR�>�
/�ƬvUx	6����K�c�^��`cZ�*�>��Ux	}fl��K�c�^���Ǵ�
/�Ϭ�Ux	}L۫����^���Ǵ�
/��i{^"!��$fu��V��r��oUx)'�ͰǬpJW�C{�]6��[���S�iO�8]S� iO=��.Z��	&�l�x� ��=>!d����@����`@�yG��jg�d��@�V�A��
L����<�٧$��=",#���dAv=����'�D�V��,���*0�#��ـ�Sa����ő�9�k4�ڟ�kާH��"-M���K��&�����輋nj|���.}j`]�!�J�BK���a!��h�5.56�\�M�>1����oYݔ��Z�W����Y}
ER\�~ϓi ��������8�X�@�ԓ��,�-�v�aX��7��eǳ��ǘ}�[;Fv��ɶ�|O�\�{;����H��$dĘH���i��6ƵK�G�1�j��d�V���c�^��cܞ��cܫ(
�i޶�D���ča�
s�f�-8�Ϣ�+ �6Ƶ��Cr��#��iIn�HN���H>���E�}fn�?��dޞ��}f�]B��_z���S��ct8��Rg��~��?8�J{�s�zZ�輅�H+��=�V�/T�@ZŰ���#�ʅa�UUK����K�֊�%dk#a�������Z幰٧ZX [�)l0�����FK��F0J� �*����J�֊�Jˈ6�P���6�P���6�[����W}���:G2�+G2�#W�d0�j�~�D���9�צno���=���=�v��{ ���1��'=n��H<)o�����8	dkWIN����I [��p2 ��m��.2�٧� ������~$�@�v�f4 �t$���?��2r:�d�H [{�a���z$L�Z���`9�-&�OG��bh�e�m�#�Y []"��7�MK�L[ݱ�M?+9�B��D�;I��E(+�|��*l�jĪ 4ڰ��V�1mUܘ�.Q�Ǵ=�Z�g�� bE��(S%��(S%�Yۅ�J>����J>���+����-��c�!��Ǵ=�T��i{��fӎa�iA�{��Ƹ�=��i��{��ӎ{�c�=���>��O���d��#,�u7����q���4�y̱4���/�iN�v��\Sc�.�������?��мW�4���{&i���߾m���q%�fj�.���?���{�      J      x������ � �      F      x������ � �      T      x��]]o��}V~���u�Ud�c�|s�}�E�E�/�<Iؒ ɹ��ߗ�ϐM��G��n��B��u�٬SŪ"���?�w����v����q��������/�|�n�������{|�w���{������z����������W�o��w����>� ��N����#r9����������ϟn_��޽�����ݫ��o��������U��*��w���?�:$D4j��������ɪ���Ͽ�?�o���Ͽ�?���v���������VN)��}��=�~��޿��������o���/������?�Ϟ���?~{9�����FW�}�g	rG~�A��(}�t��>K�N���� �U4|�w����o��%���\�� �@m5qP���ī��ǯO��d�/�#����ۯ_�_����ӯ��;�}������CiY��o�_�<�밞�\�r�YkYn�BK�Y�V4]c�;��p�_��$�A��;�֦�u�=B�鲼�ȫ���PZ/g�5]���&�����!�t*��mLG��� �t]�ۘ.���5�!�tS�a�.��Ěn�;L���M��X�]y�ӕM�Q��$j%��8�Q�7�6�K/��o=�Xӡ�9�1��̛�k:�_�&�[%]�b�5]�_�6��o�}=�X�Uy_od:�sĚN�Z������������<���C��J�_գ���DEɝT��N�p�'P�J o�_���n_�����t{"���o{�S�;��<�:C9\m	�v�IĻ6OR�m	�v�6~�V�I�	�z;Oo��4��~�7�"����i����졷�rΞ��	��:�Am�s�"V
����&�Pߨh�8�s�R�%bӕ%Ě^+mL'�rk:�c�&�#���Ě�ˑ\ӝ��bz����0o`��,k%q���5�9ޗ��ۿ�����)?Iw���݋��ۻ��?o_S����DO�4@��@�^�b��M���联
�/�Xz.�[�G0���]��i��Y��B��Xz�D"���C�@,=L��ѓ����z�%�.�"�R|��5�����>��1@��~�����P�E�ܨvRw�{�(�Q�X9~6��sP����I�о�?��~<~��ǋv���"(�>
����u��������]��{~����8qsV*N���Xً����2Ba�f��e���I����dq�E�H��^aXf���^��+�Y����`��2�9r'\��
�k�#TH��e���;��t�l�����Z�{���Ql��mD8y�CF���P8���Z�:#�V�gw�.�w���u�B���6�C�ҳc��h�H���n�4����SE�v'DȳZ)9��Qȍ��ec�h�a֣J�!%i|te��$GqHÆP0���1�����l��Ӆ�g&�#���A�ͬ="{�(��/�ص�6��\XaB�� � ���Qiъ�;e�S��0{�@��[y@�d�	c}Q�?�Q�ЌҡH�@3T	�> ��t4 SC	4���6�o٧"�P9��p7�Q��<�6��ٌ֟z�Mk,K�&���3x1�B�˷��~a}�������_�_���������G��������Q���th�!��8*#ڼc��HvV긑� ]��mFW(�S�#���V�?����n-�΂�b��Md( 4"v���A����h���;��#��>��h���R(� ���&�|dZ����W�݈��,�N��29���݈�8�L@v�Y$����I��]|�U5N�#�����au�I�,Y\j卫~�S�~�Н��$p���T�X�Y�P,eg�W}�A��SX��b��V"�a�����e�K��XF�bm77P��nc�pk���:�F�Ja-w7 V�ܐD(�G��� n슦k)��X�!�o��n�������n���#��.��^-��z)�Bʻ?n~�RF�c����Qrg��ً�@,�ąo�����%K���9n�h�$�M'���yi9��f�z{Ԭ�=��RK=�渹�9� ��\�7�͑�[�?uI$2sS�t'��]s��`���W�8��;%�R5��p��^��16{�1���������6��٩i�ފ�4P&/�'H�v�5	��$9�'����5	�<�O ���&�V$hB%�O�N�ҫ���{�'��'XH������[������}K�7Ow �
a���%S*�hSH���L��S�	4�)�de���:���T&Zue�F�,��@3������*����A�Ry�:S��Gz�f0M�Y�fjA��3��L�Q�__o���z0$;�>a�υ�V�)8X/͎ �$�s����ƶ�?5\~	�۞�lm�D4Ã��,'��m�0L0�oy2������5N ��dFDs�I��z�x�e�M���.j����h)�P�&o���mlW�	��m��zoc��Ls%o���2-lwR;Q�������v���]M �v[�g�o���ڭ��Oo��%�
�B�u^\Y�9�Il٠��@�d(%�I��J	�����8�����vPe��>V�A(��#�	m�|� i3������?�0�:C
8��7q��0_��2�]�B�Fd��(��E��"7��1-�������q�q�8���vg�#��m�Iz������C��.ɸ76�B:�.��[xD�Dom<Z��; �xH2n͍w&G�C��iR���R�Xf�o�L������+k��x�Ue��W�� tV+p�mO �v���MlGJ9�ۮk{M�Dwc �xS{]�h�Q&o|տ61�4�A���71^+�Cq�@�UqP�(��9�/7W�I���"�$��7����R\�N~ �l���IK����Pqw��p����p{r��C���"��k����������_N?�: �����?��Ko���c��0�Z�0�����Xڍ����W��Y����?Bt`|$l9h��O4Z�R^-���%��$͸1H/^Y=g{Ta:�K�Ys�;%���@x��t��r�Z���_?cG˩B��K�>�wWf']�藄h��޾D���#�Fm�"��p��\��(ݒ��N��W��U�Տ5�j�G�v��}J�@�y��^�"&�߄	$NY�"�ߟ�m�+��p��A��9bR��J�N�����FE�qpb�2m3o��>�	��¸�΂	�`4~nCjs=�q������i�|C�"�0L[u��ē�B�͂����xrnk��=jI0�f�A|�a�̤m����u2EhF���<�@�\�U���Cگ�V�A�8��r�!�����[��(��1���f�hsWӔ�	箆�f���ͤ��o�����M�5��I�2#|�	K�%S)���\1qV��U��N�"�v��5Ү�[*QO񁏾Q�RE��*�|��E��A��+�pUm���6f�4īg�T:z �M(+� �[{���:���>���"c�k +Em��+r��x�������Ԇ�X���G����z�;a�,T�9����P�Fw6)��3T�D�t�xb]��.�����z���Ӷ�$)m9��(��`���:�+i��R�el}��}��!~�V���������4�� �Z�RO�8=�"�{"��<�rE���"Ļ"���eR{�d��V�y�F!�}���\�%]�9i��a�� ���ew�#3�����rW��mX�xwe6u���`v C|�H�z���Eº,�!>^�x��Q
���/5V�d�;d|�_a�:!�1�]̀@�����<[%NS��/Z��{+��wCW-G�-�c�ks����8l���������Eh�>��qm1PaZ�E��WhfBQvK�
N->E����nn�u\��,5C���j��1�+������e�
�/����27k���q�e�{�p��ֵ��&�� ��g!�5�	U��WO,������%~�dN7v���|�U�@Z:fk��4�Y��sėrV���T�Y� �Y�ѩ�m���sKg��&   d�t�֎�����di�V*�U1��*U�6���� �⫎�L�͸��Rx�Ƕ�ֻZ�w륗a���	b�'1�噕�-�a��:�p!w\�V�xxß>4�@6�����Jb۵(y��34��R�8 Y<=4C�TC�B��m/[�.�&PJ
i9�U4�*76��(t��c�v[�����(b���k&[�;A�N'⍯]f{m��8D�@+� ^����^# �P#@��<l8:�r�<���
J��U���%�`s��%�Feǳ!;�86�x}^�º�>�F�w��Y�Ҝ."/B�>���Q���p"���Z��CU���)�d���m�Z� ^ݚ	m#-�H�(��#4Cަ�H{y�4��%�+_C�Hd��A�"˭�o{%��Ӊzb��ߣ�]r�h�E��z��V+����D�	B3�Ё�6�*@o�k���X]�N�L.��!>/l�v+v,.�!�8�Wn����ҝ���z����V���!�YD7|iA�a'C�&p�F*��p>'&/�h�P������J���xg'�4pFq�G+�jz�� �
Y�3�8Y;�j���օd�
NԂ�F���d�[����L�τ,'��o�])'�A�����+g/�l(&��6��4aV`C�~K:�{V��.��������a]$���^Y��QF#a��pċ2�H5e�"K&�apSe�H�eIP�4Rd$b�W�i|���t^Ȼr�����9-��ֺV��C3�e5�l�,�s�����A��<� �:`9�v��Mb���c���e}s�x}3���e���"4C��	���J�@���z;W#&��4�J6�_Z�f�9���C�f]^C�����A#=��D����BM���H«9��F�9����	ī��)m��CbI�)gX�*I�|�{�f�9�^��K6%�6��xM!'�B�8M6/B34�/�m�f�f�Y���g*���I�������uJ(a8�w�j$Zo�f�=��~��-��;�q��<��֎�����N� ]:�;A���	}u��TJFt
�?kW��>��r������H��]�h��q	ċ=�ط�i�ߤ8h��t�&��9�Ĭ�1�x�	���6������#ĻNq;m\�FU	Q{�w�b�ˮ���p8X �x��FJ���N�� � �u⍬_��߷��t���}\G
!:/)@�3s��W���v�m��^�L/-���ҎAf$x�F��3�+�g��'�
%�gh�oʊi}S+�E�8�����A�w|j��^��A��ʌ���$8❺��i�ԝpn8C>�xn$�l�Ե0��s������Ge��a&�R�^P�Y�4������HZѤS6>��!^�P�12��>��Vr��޶�w�M$���!�\V�zK�()m��G�����4�d��Ĭ��o{�ԛ�����ᒗ�ۻ��?S7P���4�v�-\��Q��q�W�x�4mx�	���!���:��g,�g/!��n�2�L��%W�E�\������e%�������W�����ej1��4��)V� �Fq/ya��w�KFjY�d��}�s�ZeK�
��Ց�35jB�I��T�xT�N���'��rUar5p�۹:�^�&1��+�
�槗��J�sk3��.`�Y>���(�FG�7ެ��y��0�#����"�5� ���҄��<3�.������{I����#ć6r�C쥃S�ypOP���$H��� >x�8|���\������m�I˧�;�A� ��7��7	���ҁ�	��7;�o�ii21ćo8^��2�!��*'�_��h�S��DhW3�PR%�L9v���
y�D�;�J8�C�����CʎT!|�x��z�=�O��L�}&N�]Q������&�Tm��s	`⥝\�`eAiG�e�HG/�/Vag�	�A�*�ccbۨ"��ds�b�WESF*6�E E�Bch�Xp���#�V��f���Ƣ�D� >�"od$a��EY��"ն���`v`�R�q�F���ښ�w���������1�.e�ߒ�� *�uA	Q���wI�5ϮȑB⽔���KI�e%v�!�KфQ&M��Ԯ��^j�X��ѻц8���B�?m�=��(*N��x'�����Ie,Q�/�]��LإI�p�%��)+�o�^�MY�,'Ə���ݐ��^�9�A3ܔ]�[���00� �O����	�����z
��J�C�	A���k=�����)u�u��.JNp�MkfB��A3��	�PMS�T�:B3�1�o����"�.� ����͋�L�=yA����k~9~� v��5�E��~��N;aY\�wa�p��*B<A\|�ۂ�Bńc��3�+}3�Pk�8P(e9h��&��(��p0�e �Í%g,��K�R��M��%E��KB�Ȁ�&��s�g Ǯ�mA��	�)��-��sr��P	ؼ�3V��)�G�	��>/(��{J"�;���+��9<xI�rU�Zi4�����r�Q�B�o~/B<9���� '-���܌n�M��ԑ:(@o>PM\6>> ��
G���cw|�FHUQ=ē�O��lBD���v<��R54ѹg��&��V���Tz�(�����m���}=T(O��W"G ��O�&5>���I�<��2mkL��뢱�A<9�|�Â�0ܸ�A�ڠ�η�q;����}q��� ;e N�K�o��X��O�C�A,7-�U��qq�霱�2r1Ē��o�������r ��h�a�J��S�E���_��?�?�Q      4   +  x�}S͎�0>��q��d�h��6J�'��	�ZJ�41�R��;�io=�����&�$uK�69��{>�����,�G�KWY�أ>IL�L�|�#y�i��4�����`��uc�P�:����&.�;U����D1ʯ�K���sj/�$����K��{������u�T��T���g!-�r�ih�Xck�("�`���4�B3>;��6L�k�=�m���v�t��m�l��Ɔ���	�z�4)��-�R7�(Q����?>ۃi9-���$X�7!"�����J��fRzz��1~%�*b%b�w�������D1�h�ФU��E>/9����̜���AB�t6���CK�Wk2�����r�'q�,w�JԱ\{�pa��F.e�T͸�Se��\�#�7<��7H�*��}����wԇJ`C�,L ��B�K���	0�?!�	�ߏ���r#�>�5�vE�P��ܲ����`-s�
mc�+�n�e������G%�\
i����f���LL���f�v���.��~ ���,�Z���3      �      x��[ˎGv]�_C@�����f�9�ȖD��Z-R�����꠲2��(�d`�wܙZ4�\[����܈�G=H�(��*3��{�7����v�o����G�Ol��o�.m����G�������h<�7����xt:9:=z0�NO�����f��|:�oM�C?�
�R6/땊�$+Ti+�W��(KKU���c��2��R��VCuq�K�$u��ԶtϾ�u�
[��P����TUf��ԖI3���$�^�4V9�1ie�7�����mTի���^�*0�M���T�_�vq���]�뺬2|k"�ʒ+3��i�Y���s]c�jm��.�c&va�L�&V��dn�ȁZ�ǳ�fx'5����J���2�ub��V"F-����WEd�Z���U��b�e�O�Ǖ^�.�|�r]`/F�&hlH��l��0OM��hf��b����p���K��J#���!�6��k�u��w��[��V����r<��~��2��Օ�,W�19]V��)d�u�j B��4a���ۋ��a�o�7�[T��w1�Z;.�.�^ڪ�=W��1�.�ڹ\'�sD�"Ѱ@�l�L�Q�/�#�g�^vOjgE�W���V��S�G����䍱��R-��10���Z����s�T�Y�w�`��*������]�bԫ!�z�	���5k0�	�&B��4K�,}��Ml�>X]�ɭ?���g5\�ͮ����j`�K��r�?���xj�p?��ɕeh��3tի�$����
��7����>�غ�Q�®2�����v?����n8�n�A��ye��	m	�`�B��ሽ�;���m9�`�D�V��œ	̬t^q�J�6�l��c�@د&�a�x�����ELd%P4��l��ܮ-0�MV�a�Y������]����!���a6T/��+�e&�i�'���nA ���j��`Ժr0 �[�nvΨt~��F���u����� ��#=�5/��u��r��	>興>g7A�_k�����ӧZi�����,,V/�v�"� W&�-P.����~qf&�`�B?/�I�֬8�G�Ⓦ��c\�fH,�u#b���"�18�,���rc4�%"�l��ވM���n�Q�ZC�X�7���3db2F�@uU�^j�׵�pktb��ny��!�c���B/$��"w�(�`M`�&[`�0WV,,IM��E���6�x�Բ$�
]�k��t��������.y�Bh۸f��P>��-\N-��j��^!����D@�{`]	-���}D��ưgv�F+x���qX25o��t�]@Q����N�ҕ�/K�$��ޕoW�D����e���R�v�,I�:���l�='�����y+�=7�i[H"L�Ү�g�k"O�4#��2XA����ܜ�����
fa��vo5�_Zk!�xTȰU]!�&�$�Exx��إ��Vy��NU�~�77C_Q�ǧ����d>=�our:�'���h~k���/>:�=1��c>�M�����֬W�$�o�bĒ
�kȘ�k������d����s ��g����;�h��?�kﱴ�υ(|��
�z�է_�?~���������ٳ����\�<z��GO̕Mm!3f�j��@��01���Z�N��4[k�̐�S�n��
��D��O�/26� ֔����>K��)`����j6�X�OG6Jt�\9����&3E|3����"�HD��W�b��c�.+��Vd9f�6o98��*MvqS��`3��}Zc�rߨ�_�={��?���y�q�e�`{Mٷ�jЯ+��h[f�����O����@�X�z�3F�����!���1P�@b�"L�D��2~c[Ӯ���`lܬI=fD1��\R�0D*>��x6���mA��8�U�H���UYEX�E���"�^#��'��Ҭ�E�!3y@�\KX[���_v���F/�`��E�o�+�\�%0[@&:5�˺�T<
CC�8���Y��]�4�L}�o��v��,��K�\����#���_T�g�4�
����� ���Ы<�YF���c?�G�Ղe:�t/��z/���;��1I��1Q�S�*¶7o+u�����������<p����:H�0���`s>;P�K@�{���
���
x?�8�o>g�gTO]�kX3� �(si����-#�l���\��_W6�殺։�P����;;oI��a����Ie��������ଵ=�`�_|�0{�m�G�� ��Z�8�^�2
0�V�wpE��F$�C�e�l�;��K �I�6vѲ�@Ȯb����ٲ�7Zm��rE.�5�n��!w��>�]�ڶ����߹޼]0n�Բ�e/�y�@�%� �Z�Qݲ�妊��<�kF����� G$b{B�{���)�W ���)�P��U�-��C 1� Y����6)e>��ɢ:w?C��$��uX�L���(/2N�_՜��k#`g\��p�wg�=�#	��le��]��3g��%i��b��y���ƕ>>c��
V�EA���ͻʭ����3@�i�+�ߧ�^�< ��
��e�V���0� ������{2���͚ݸ�毩�*r��?,�i��Nm�|m��ҋ� �+4�a��?�&�����~�*i�ŝ07��x�>i�<���AG��_�N�	�f<��+MY���D�9f�9�Z=	01!]L��Klj��>+�G�������%Ua�������8�n[�:}|Т�4Uw����?&�����t��)�2��
�7�}u�|��[�l��Qq^EJ����e&z��ǿ�ʿŻ+:ӓF�j?Ք����S7~��ʮ����y�IO~�s>��;��R*���ںD��ɘ6�I�)��l���MѰY�n�_�x4���&%�,'�Ȼ���v�g��� ��C�M��m>�d��u۔�_���Gm�c2V�����x4�Ύ�gmse2Q���t���h<��o��� ��ecCv�$f�٩Ro@�^9��`!����<~�r2���(؋��om�+>o�ۥa>c:���~ޚ_Ͻ#	�H�J$���T6h|�-]͐٪�� lF�f3m�4ɶ+eu7�����X1o��7F�]�6[�����8��|��ua��������*/O�߿ʊU9��]3C����߿tj��.�?����/������?|������L�/���w��ǯ�ŗO�?�{r�j\=8�����&_�]���?�zt��Ͼ����;�շ�O_�0���Zaй��T\ҟ�S�?<��7�`�Z�B[〠�{�#��FǧG����|<=n�����;͇�������V��"�nV�=��idD�x�?����� m�s-{EK�����*/��ن�1�l�n{!��_Z
~(�ٌ��$���� �ݽ;�7j<T�;�4�"\.Q-��v�0�I��
��`M��] �x�Юi�hl���-+**�t�T.Tx(�Ҧl�|.���A�QB�0
Z��yI����A�tKʽ2�f��L��g
+�'?����OWy����R�t׶G�x�_������d�y+��mgik�,��|�$����j̄1��r3�^��Z��)a��8��ݥ׌e&!����V(vu����.�_q���I����`�;u�xh��s}�+��
��~r���{�jmڌu^u%��.n����F'<v�S#7@���c#��mZ=6?�A N��ۦh�.�hq(o��Km��C�-�~wWW��Aw\H�ꪵ�.�dg5�r�����)r�=����:j�j�qm�������K���?�aB���]a��K,r���`�}*F��$�"�������P���w���y����'�K)_�S����R;S��	�w�M�ҡI���8{�u�j�y�����>˚Gؒ(�x���5<Az�5����ǥ���L�f.���ލ��&��-\˫5]�
H���G�Z��s��6�y�Z�2�X[��������V����|��w������v]��{`Q4gL�Ǿrm�����l8�M�ƽ�N� |  ��h4�OG��[G]�t�h ��8swXؔ����!8B��f�+X�����'�ңc��F�����%�%�!l+��7�Z���;*J|�EķE�+�+��NF1M�-j$ն����9/��</�8u����B��u�(뻿K�l��=Sܻ�Tɭ�˲��	Ѳ~q�.�㰅.+/�*���i'$|���]���<����إ%�M��qq#i�?b%� ���S�}�{�gj�j���M=�7�E{�l~]z�,҈T��,q�N��{&�Z�Wg(�낶��KW
6�"���_�U1������ߥ�2����_8�����2�?��;��-4��V;C|u U#�<|@>[%/!�p8[t��x~<<OfS|�6�y����h:���t���Ǯ�1oj�(��&�R���63hN=���м���4�Fi;�γ�Mz���R"�� �HHM���W�c�x2b��{"�$ۅ�䠟ωUxP��M>����.{�:��lw�ݢ;��?S�W�UZ��*w�|�� (�l[Β�u
����ڭNuh5��w
�4g��,ק�7r�3U1���1?��� ��N�Q��*=�7�_���e.\mVl����Lh�xai����%�2�׋D���f��%�))��^�ENn��ŞF3��d�w�u���E�]Q��u��}Po���I�p�_ZLM--&����bTj��g*W�5L���]*I����k1���`�Cu���N��G=p� n_�id�մ�Z��?�=���s��f1��9������n7P�/M�O|���S�˃����b�8˩ ���g�R$Ea��@��',��V`��D���2IH��������מv��C��B��1�6o#90N�t���i��*D�����,�����9{$��L^��e��^�;�N�$	�7֊x�ǎ^m~QN3uͰ�P�h�ً�/��=��(,���=��� k�)�k��NU'7W&3�ŏf��h4�)���j:r��<��~,�z��V���85l�� �"��.�95�����	k��w�L�(���&G�x��#�_}�ޗ4��`��`"�!�k����Q�k��5fO/]��o�5l�����f[5�iO�C�ے���>]�F��\����Ahx��	��U+�H�`y;���^��U:Q���ݞ�X��6��$�~���Cj�wh�� M<潍�X�{��A�Lt����<@���eiveb���<-x���w�:���zL�0C;�Q��E,���w`]��π[C�۾��\T����"1﹍����|\@��CM��Ǹ�Hb��Ӿ��4ɏ>Q����:�G#�R^<���mn>��B4��������h�[�fP��+���^����Zu�w<��J��;rb�o}7EM����JA�״>�V{�W�����N��H{����%�i�vn�1�]Н���3F\Ѕ��K���C�ȷ�b/v(&"[3G�D�]%�m�ʺ�. �=�X�K��ZC��]PH�Ӛ0a��܈�N��n,o*񺥣��}䤧�{�l�y/�9�'ss���}���h*��&g��攫uS�6�t��>�����F�U��k�{[$q۶��=�;�i�6w?����GZ�q��j��,V�T�M�\F���k���Ժ�|Z�m~�L�*�Nrl
�O A�ޒq]t��:b�`����é<P�rP��f,��\ɬ^��Á�6.�1�@�s�ú�J���)r!b@t���y[�`u�����$�e��fA���r�8���r)��J�_��	[�*9(o; �����EN�F}��Yɖ�ndJۗ�z���*t'��G�9�3�^�6G��f����@�[���Wމ8:�����s]b�p2��M���tzrr���[���)�      �      x������ � �      �   ]  x��W�n�6]'_Ad�p4z�2� ��[H&A��j6��8dICQ�<0@���u��]���~I�%%?�I�U7�$����sx�}8H���|�k�2�ҲЊךIV)Y*���T.~��J�UYkQ|\�;��T����3�Ї̮���&���Yu���%�np�G����׾��^�<w�è�n���n����^��W�]��ɘ�����/n.�NG뇪����\�>��t7�p����$����^�&�-�?je֤�fV'�N��RYn%�z�G��Iƍ�^⸡%�Ɛ?�a9n�� ɸ��|�_�����{yq}�N���������z3��WW��nT�2ɧEY˭�U�~���7�"'/N��A�����5���W"�RY�I�A�y�R�T�����]{����y�ěFV5Ӌ�)&�D���~�?G��Wl��D�S��y�^��ƂȌ��7~�d�����D��ML������y�n2I#3 ��S�2^�%�baN;M�q��\���i ��ЍV4���_�D ����;��w���PL�	C����7vُw��J��}+��a�i!vKK=#B��l.�'-gU.��'���ć�f79��oK5��U�?&�LyW-���2��9�;q��2��F����g[x�7皛��橤�]�ɽH�lh����	�X�o%��f%�)���xQ�1��U	������XEu�Ķ��(�Mg�+Ju��	/2�cw���F->!sīE]K�ĴP�YX-�kk����/#v|b<S�gXM4�X��(��y��I�8x�v�D��́M�	�ۦ�-����7��-H��q��Lh/�g .�`�k�q�+�g(&��O	²{�>F���.�����'�Ga��Ab,�!h%L�0c���ATD�"v�g�ۋM����<�Կ�ֹЄ'����R��(Z��%iQ�i����+��55;o
�a����������5�T�)�
Wj�y.�<[3G�LLPYQP5�4Ʋh���� a���s��ea�C6�q�4����mR��?ύ���hp�ȅ�?���"�!�x��M�[
w������gs�͉��'�rV��-�������@1.-6���2��},���k_;kq�٣0�B�!��(3e�\�5�:�W�rZ�u��e�S����U1��%p��1����$�`u��f�D�x���7;�e��[k��>�6�e��Z��ʢ�bFDX!Mf]/�\�yȠ^��N��|�\mJ!�c� F��^�X6��d�2,��zy!���cb>�)��/H�a�w�&����y
C�S�I�n�ڜbV)�sI hYd�U�<����mQ�0�X��.�g�������l�tt}��� ���% ��/�0`��ƃu�G3��C��OB7��q�P<١��z�Ĵ���tF)m/�i#�k4���躻�Ӷ5�t����{�Z���iY[,�E��?�W�K}���d�����,����:�M�[��B�
:��N�0�WZ:�T�5"#ˢ�l��I9���$L|D���߬�?F��O'(pM�=:+��R��ů3j)��(��˷� ]?73��C8>�C�o����}��b?LV?���~b$v�$���>B�������>�"�      �      x������ � �      �   �  x��WMo��=˿��C�$��$�#��q���8���2��"[r{�ݜ��M������m'��$� 9F�$�$���D����0�KTUuիW��q'�^j��ĝ$���(��SG��tO�Q4����OI̢�,�F�� N������p�/n���X�3δ��w,��~�e�����kkR�*��2�,KV�gB�\j���?)
�4��u��F<+�_
�ZYǹ��Iq�kl��9WO����E�h����7�޼�}y;�d�&�޷:{��� %�8�F����eo:MF������e�m&y�/b޿/�_&�����tS�[��:����J�-mY��xc�w���z�������x/�Ϲp+8���Z��p�?�rK��_歘s���h��<@��&��қ���ݠ￦?�1���נzQ�/nz�/n��6�s�t
�j}2�tvgg2�fѰ?G�i���LX<�œ� �'�(N&�4o.__�KFύ�����[S%��#̵+�ƒ�A8_ҍHK����dV:���T���z���q��/pb���ܜ^*V(������vB�'�������1���A�K����]�⌃�+P��%%BA]Ý ZVd<��G�/U2;jz{�e\>�f��I�RT�/7)4%ӡ��k�tbE���Ɔ�]f4CB\�p�	��w������8H��_J�P^�V< �(*G.��)ɸs�9��%�X�x����-u����sn�.2 ��Wt�eJ����b���ݯ�]ZI~<���L��W�|0���G���Q2�HN@b��1j���	�[.Ro�x>g7/��Q<"gmV��3�t�rO�@8@���eV�U58RR#����s+U�3�}N����J�� E�r�[}�D0�ʶ�_J���TYι�6��VBy偸�C��� ���0>u���������^\:Lࣔ9���J.���C�43A�*C�H�fʶ�Pj:��o%�k�� �z�/y=~��X8 2�]ќ
�{�V,��W�ҽ/�w�ZWdiC˵�\��3���ڸ+0M�m{���K��9#�`�0����Ŋ*ALb�؂��eg��S��Q'��ս�Mf�m�)��'�h��>�l�T�n���l��4�U�p� 5š[��[Y3����Us�����L��$�"�DO�%��6R�+޲T��/ �a�@��Th�N� ��킽��d�gW06���q�&d���"�PA%�}a��W��ԽO�AQ�	�� ��EBh}���vrvr��2/�L�;nU!� �L�A,pQ:�4�����5�/Ѡ ���Ŭ�g�<�\JjJ.�=�럈 @�.��F�!6�a����k���QoUYAAꀕ
���0�dB)�6TD����h���Ґ.u�C����Z��"��՝*a��B�6�͊:�s��������'1hV6���ͳ�=��̹���VK��p���"�i����,͆��p�a������Z}�+Ĝи��)��v���K��}����q����� 	���:H��&h�(�(}ikb.7ˍ"VT;M��i�Vt7+��]~Ϧ�h�{B�B�{<�i�H�KS��v��F�Y�ha��B��q����Iwe��	��t��Z>�=w (��$�҆�������ںa��;��m��U.��{��[����/Ѷ���&[�y�kҒ�����}� '"��ѡ��K���3��X�����;���	n�~�v�O��/�����n���[|8lwv�߾�M���d��*����h0۩      l      x������ � �      d      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   G   x�3�4�?N#CK]#]#C+#c+C#=SS#SS<2.�ə)��VV�ũEN�ũ�y%�%�\1z\\\ 3��      �      x������ � �      �   9  x�}��q$!F��$0�~"�;���Yo��P�o~�5 !Ɵ��-�b��S�Iz���U�D��E��xq��ӵ)s��U�t+��E�SyZ�1N�^X��?��E_��Ѵш����U{�E����8����%��Uqx����iq9������-���8��f���g��	]����b�������{�
D�����8��í�$�� O�����	�j'xn�aO>�{�]��h�v �e��1M���O�w���P`Ï�Qr'�)�"������,�;~��d�;�'tUAnϐӑ%�����\��S%w��;I�>�.���@����0�R���x ��.�J�1�`����j�Uw�TO]O�j����lGKG�~��?A���*�i�ܻ��Q�7����G#� �q����U�����
��JK< }���0nH��	A��o��T[���O)��!f�c�a��@�Y��7jfk
��Vvߏ�V1�9�c)F?���'J�c�������A� ����`���'�J/���|���qBW�j��?����      �      x���ˏ��'����FJ@T�� ���\*{4PI�*]wc�3���2����W������+�-\@n��W7�����y}/��t=������2��{��<�}�y������;�ͥl�c�y�ҫ�7߼y��;x�㯺���uu,����åz,��+��S�\h��;�����u�y�š�+���T������+����Ǜ�OC�_
�+��W���S���{��W��G�z>��7CSV`^<,~�c����&����M��3?|^��m��4K�y�xAt�Ƿq�K� �G>~����g��|�����>1����4��a���H��
7_�^Ӟ`�g��Sq������OCq�J�X����s?��c[ñ��Ϋ�lq�=,���WqsU� 'T]v��w��p�`��8��U����eS�w)Og�LS����-����S����v~�}������.m<��}/�j<���T�����y�۞������<x'<��+;�T34k��j�*����[�5�YWwe��i� �n����>���Ӕ�%�h�[�o�E�,߂m,O0̉��y�t��{,�
w���Hfg�~k<�/���h���������U�=��	�YVQ5�D�:Ý�v�ap�/i9�8�F�2����y(�~a`8ݝ�{ a�{l��r����~,��*����K������R>����]S i�pj��{�����I���^o�޸G$*kBt��ǂ���`O����Bk���)���G^���HԻ�؁�W�Z��H(�ǿpG�p$�/�E�W��Av��Ψ����9Җ���齇�x�����]D��(�p�^��mxvoa��n!,�\��}�!ON�?th���M�����c����̡i�%�������uAR6"�ҟ-�la��C۝ᬁ�mP@�0u: �çvދ�^s��|��nEm�i ?N=r	������or�����z����V�
�9�tn���տ����w�Ng��۷�^^* �º�to��wE�ㅄ�<Z�KG*�D�A��QEt�{/��5�W�/8��ץ�M?T-��,� Xp����͆��*�mt���U͡<_���U@%E���"�[�C�O��X=�]g�)�
�?^���5,���i���9�c�C$���ͣ-@0�].LHȆE����P���ܮ��+&���
��ͮ����fc�����5�W2+�C����X��w'h�N��I�.mqf�k�
vlx�
f0�਑4J%����=�� hm�o32�11�����WL�X1M�_�H�x2|}[�-��!a�KWP�G^�^�;�b
op:�#HxEp޲���l�
�SW�:RZ���0�Y~�5d]�xO�^7\:������ C�\�����6�ޮX�qX틡+�H�B'�{��
� �o�Qk����j��
�qCV¥��ZДH0؜O_}���M�HK��0��IV��v���K.���M�Œբy9ђ͍�"-_w�x��t�A)�N��aK����p�w:���)�do%��hUn��P��Kq����Q-#�n�p���Hc���߱B��N����L��R���#"��+d?��;���b�q�P����8��I� ���v���K���ʋ��Zs_�.��}7z�L��p�(�C�y�[�y酮?)Hѫ�R��ʚ50��-Ā��v�ı\|/�o��6��b?�l�e����k���v�5D��?$�%d�%��l��l��l��l��l��l��l��l��l��l��l��ly�l	r4,��6�vY�O�xlsd���K�8ه`q,�-֣`~�8�4ix��_ś��1U?�(��~ϲj�6�)��V�y�-��;Jbi��\`4u\u�ܢ��WԮ�b(������i	����H��"��˶�T������8Ux��GY>z�&�.ާA�j��K&�"�Co1�~�v@�0��O�
����=����#��jw��+B���PЅ@����,a�ܼ�{����/�=Ts/�H�fr��x'�������w5�b�jA ^��*~����N�~�o�C�����o���#�*��mw��*��I��72m�Y���En/�9��,"b��Uj&���0(�Z�yḻ��z����߆\m��A����hp�d�a��ěp-ƺb��ǹ�	��\�h�-.���߽�?�?���#�D4P����^>ۃ�|�|���=�3癉���߅y���ڣ����������n���?�w���p����R=��z��q{�N��m����@��m{���w��O� 8l]Ls���<Y�3soQ���}$���H�IG�"�� (�Vm���z���
��Aw�C"�32V
���0������>��)����!p |Vn�$k��zP�d��X^��~	�&x�s!,Q4 �������L�U���Z�?+`�Q�q�9繨��x5|K-�F}7 �a�}u��ʻ\�ɫo�;dLՀ�8����s�� �g�J)0�G٩�":�5�zf���װJ4N�GDS��]�,�(�e�����ӵGk��-!)�Q�GR�C�m� ��p/��T�1Y�'�,�3���<�|u��կ�F�ɀV#|�h�+��ݷ��J��$��
���D?l��7q�o�ߟ@���~,�ξ�d�,�iP7+y&P	x�sQ��y@��r���n��4�����.��l���0fn��9 �y}���K��"��[���]�0�?��ʖÝ9�︦FP���em�ٕå��ґ�0�55�7����Q`���ꅌ+���U���	$8KP�	�ħ	"�����pv���(�e� ��Gk�+�΃$i�G�m�-�8e|��Z���Rw~s�{_X��XC��"'�y��@mD��?U�_�/���с{�X�E�?�%��Y���*ιFC\�W����e	�T�����Gz�@"�t�K�o-v�.�4@W]��]ఴ8�6hW��;^9̃�Y��/X�dY�0����\�h�����@4戁���~�O�I�<,��7�_�����q�G��ag�5_��b�3tW����]TR����=��sY?f� %pB�A��N�mC������c�݂N�g�ڣUz��ΝA"?b>��G?��܃�LF� �ðk�F��T��܈�=��3o�aGJ�-H��pR�O�D����Iˁ�l!�7up�R�m�e@��6���s�>"��ϝ�?��,�ˢCj��o�e�Ʌ�j^���c��p�z�˕3��K �?��	�����h��q�(�:�L�ݏ7_�L�ks.p���х�>�F��E�ҢO�M��ù��_�J�����#~�\���z��>���.l�EG�]6_�A��j1�<ۻ�9
{��+O�IoP���p`���Jq8����p��r/$����8�WV	D&?VNY���5]v�0�����-$���yR�������h�%�p�[&=�i�i��~�j�!-,�� ��9P.�#7_����Cщz��y�� ��YV*� ���H����a^����#'GG�Qz�[�n����+�2��NЈ�	^��m:%��{V��P�)�p�Az�'`���~|�~��.��4_�<�yȁ3~�EJ�7�m���QT���Nw����=u���8���{����=����b@��ٷVup+�4\�ݗ��5��򚺼3n\&�؀s"NEb�|���<�1	#*7Ӻ 3��P�U��Hgj���:/:�z�Ё�~�[�/�6_��,�tPՎm����Lp��˶�
��yg��d�:����RX�Y�೛��JOy����r(Y���� ��PJVSt��yom�F��x5cu�2؇y�Y�Q���$���G��u�f��(�M�`Aji�d����S{ǎI3=F���H��(�h;��� ��4�	�<c0:�;����!S�����KH_����B]��Cs`ɩ,�    ����*�d2��G����=����ԩt+b��'�UО�?�������=8\4+������_Pn e> 1����?5�>�(��㐏���ɓ2Ҟ�>���Iq���^����g[jhxO�vyKiG�t!o�O��� m9�t'gJt�q���*����Ќ�-���J�ڥ}f)��LC����1)j��_������5�r���K�.NwY�y��h�ҥ���	�D\����rd �9[ӆms��>������$�~$�{�ڣ=�z���fo�8ge���� �(\{�f�E��,�A�}d쬓�K�,���Z�\=��Y���.������������}B�#q�����w��g��>fK{D�<O�h�s��e��%��x�D8{�y�9��y32��p$�+r^`hʘB�3�L�J\�������S0ڨU�H8�M�����A�3��\d0�nqY���B���]kP`�$�Om}a(�&ҧ$�������|��b��mA�B���z�v�� �Nk��ʝ��D�PRY	��[Kσcp}i��������2�ȓpD�UϮ#EGa²��p@t
qQ�������׿6���c�=9�Æa���(�h���(X1eh<Mh�����VHuj�vh'.�t�@m*�7���O��r��k�V=R+<Kɲ\�@xV�m^�s��G0ˡ&!��e\W�/8 T �SP7*���O���o�������J�CD�z��lbB@)��cQJy�,J?zf�]Gl��?����W�8 ���G��ȡ^�����<m�:Q?f�~^�Z��Y�W}ޮ��Ѳ�)�&q:Nťh�.�6]��g+�5~�
 ��F�"H ���2rn���U!ga+�����/b� ����G~�#+�p"��'�����{F��+c���|�\j��������_�@�~�aL|{���W�噄0Ta�y�cy=.��G���L�s�S׮<�v�! �r"Fx=���0��+�5y�e�SB�Q���+�n%��ƻ�턈T�s~$NLY���=��x2;�e�-��?G�9Z�y]��̌`t�Y�aL�1ƴ���~��n��)�@fġ���hy_�D+�l�"�С��C��ƈ;E»�p����f��2r"�f\�@��#�	ῶO���w*�^��	�Xw�ȟ$L�7(�<�9�3i5�as�w&�/�aj��}����5R�I��d�ЃA�q���.߇A�_{�z���<H����C&@�V8�f`��#�����b�qd�%�B8݀����Br�$"�1�C56��E6[�_�*N��I��f�I@��"���y�W����.G��"��ϯٽ��&7�^t��Vb�� k�=�ۨM�7-�G5��8��E�+�B *&+tU�_&w�DA�%ʊ�]���?1V�Gk�j�R�B���tI)�(ڼ� �t!;bʪQ�~��.\���	���`�_��'��ǮW��H��Qb�B�{�b��aҷ�"���Z�sX�p��$(�`��t/�)�K���ѥYvc������*�],ry=�7�=H0�6��	K:��?��6w�0���Qo��(���]���l�1�$VoB�8�Ҁ�d��X��pB�)<���#��{J$��sK�#���kg�Y�2[kJr���X�d<
5��r7Q��8;w��µn�H�Q&�=�-#Q_9!xK1�:P�.�P�1[I68�I���C���Ѣ�4� �_��;�6`���'��慎����`c8��*�JU�wz��E�3gq11�x�:�$Y.'������-�#T�+����6�=z(3*v����/:4�E3Ǹ�o�ȇj��6Ղh�n��Ώ?��f�Ѫh^	P�A���Y4K�*$����)N����CgU�vT�aSLe�Om�AI��gs�J�^�G*bi�X #��Ch����Aik��%n���å%�C]~��!�dt��9���iV�Ӝ.@�#�#OO���pj��ؤh-C}��rZ�j�0��t�'�����͈��]R�:MWhA�'-�������p���[|�E�\`v��
�P(-�N(Q~3P
�W��#7d�H8�|�>*�*ԁ�(�R��_sSy���C�ݠ��ާ%�"��4�����h�J��xx�$�:�D�A�����W����iC�2��$C?���Y�¹c|�q��H�SAh�pt̼DMs�G3�*@��2�7�Nة��P`���1CK?홱��X���c3�% &�;����UK^��m���0I�	N�~�z�kxP��G)��k���`5v
$ۃ.ܷ���&Q��s?k]̙%y���WY�	�D	k���`Bhk��88Ѻ r�%�}�B�jEڻ�E��A�\-:������Q���O8��n�^��),/��x�"e@�=1۪P�6D�.1mMb�(k�s�����_���UJ`��l��u�/^�^�5\L#0��W\K���� ��;��k�+�Q��PV<G��+�1�w{D:gk�V��ZH����$���Ӊ��a�]���0eK),�У!Fx�9� AUh�%{�����d���.̢<�`�G��V�A�,��j�������������/�����`����<�g~�ɭ��&)�b��W�,�2z�/�����%ʫ,gP�Ȭ�\��9�үlX�ȝ����Rv��em�A��b��������V���,|�\C<_����Մ�� A�]�X�����])���!��� ��0�Rx$��?tU�n _$����q�<��&@#Σ��30�]ز��U��c�o�몱ĳ����x��k�! r���Hd	�EK?��>�O���h͑�)]2H�'E����
��$��]�F�����`�P-&�(���'�o��%�,ˮ�|�@O��X=�P��t�S���?P�����<�x-�P�*���u�QB��N��-鈈�g	��s��� �R̊`���B�P�	I�'�T��`*�j�o\8��'���������Q���̎Z�Z�$[t(p�A®��Ȼ��ކ�.��,��K�h��f� ����}�-4�Mi��Y<4m_��
�_�P(��6��"g�1^Ѐ߭���WՇ�C6J�)����!fD)�z^���T��x�U�.{�{�J$�)�r�̧Ѕ����]��Q8	qۏVOhM#�A�},�H�ʒF"h��9{6�����"���.�ݩm���n��nL�1L�f��=���v���bx�Q��ƙxL=��a��p����\{p������VI��x�H�]�a���ê�G�緦� ����D1�x-P�N��y��O�������6`�7��L|��'���}��w_�+�Q� ���9XK�c��4
ñ<�����W}���C��b@��� ~��@�E�H�_��6���l��Y��_�YE9�H#E�^��z6Ma��"Lr'n�`���L|"����8�J����'���m3�کjT-����_�ܢA�l���|t}t��A(~}k_�o�,ĥ�iEU4 |
� �p�PyQDQ����]����6~�� �k�!h����� �=���%���0��_
'њ����<^&¤?�0u��ڀ�a���V%%U^���TRm$'56Ӏ�$�D2:q=}꒨�����WE��#��EW��&76�x![>j5O��ttg� m3�Ce�G��Ε�U�D���Ejk��ֲ�\J�)Ad\��UIg������$*������
����e�������䦊�3��&�n��m�#�Ǡ�z�~����#�b�E�T�Di�d5��K�/,`"�[-�x=������m�e����\��T�R	�L�aP��%2����0;�G�d��o� IK1�X�����pd!�@���UKU6Xm��4�o��9ۀ����~�۩����@F�}Њ��lv�'CQ9LO�X
�VP+���������rL99�S�hٴ��l׎w�{m�����    D>Jbm�F�ut�C	�_*���S� >��r!�·�s2$��� *$ŵ�5s�� A�־��"aU�e��Uy!��`�V����������ɥ�y�pe���X]ӵZ0���H�ܬ��#0^Ap�;��q4F�8�V��Z�#��i�sL%R��A��}�� �l����,�2rR**TnF[��CK���1�����$�3�Z>�G>��a��4����v/;el��� iƔR�>T���48R!y�艞��*�����2�S�6��\��C�����]>Go˹="DL��,=�z҆H͚�լ���X��l��(�U}�T3��"���t�eØ���4p�ŗ�SAC*�aa4��A2�j{���3,ł��6i�2>
�����tnJ�ey����������� $e��CC`}�(�I簑a�0��E��X\�㸔N�cN0ػI:�q�r��=��'�������>P�U�&���� %�z�{"b'���ѷ/��%GUK 5GX�P�x[M U0�I[U㫇e�F>̉�H�hÉB�����ʆ6��F���]1tR�G9�+��9�F�~�*�6�W�2�i�8*}�	����<��DU\D����ex+YĘxEgY��c�T��{!G"���k����^re���t�u����lH�#ǪY^�ҭ�`��!���('i~���듬��� I�gV��Ǜ�%�4Fvc��7����"@T�^!.=�1٘�)�	c֬��|�Rt�#l~`g�~Ȫ�1:�	����iƫ�$R!���e~~N��}���8�'���G���J8HFRI'�pP�II���Je�t�>�J�R��T&�Zb�[]gd���仦���"�5ʒxks�n�|P���X�P��z�T����(��n<���f�A�᭟�̏�{�<Zݭ�n�<H��Jh�[(OD#mHэ�x9'�y���=���8�SyS�ȍ��,_b/���ٚz9�TJ͕��ueՔ�EUӲf)���#�P,a\�
��"?q(L��_�A��A�\s���8�o��Kֳ;n��t��q�����T!B��R��RMI7��.��r��F� �p�&�����_�$ +��=��3$�"��W�����t�o讬i�ڟFiڡ��Q��*��*�R�PrxIE�(%A4�	.�+K�91�k�2GX�#����<Z�kV*di$�Y��$p�7�qYZ�b���M�dt�ފ�Z��jP�q��XQdoac�I�q�ΣՍYs�� ���m9QT�\��^�J\�v�]�J�$0�����;�-w���
��)glu��YSrNFG�v�+;��[���/���W�߰���ύ��)s��ʚ��o/�3#r�F��+O�N�� ���Á�(	0�Mo�7�5��ͪ���~_�<�F�w��;J_%�0UГND�6���X�U�q>F��OV)q%�G��+B���$�|i�%g�G!Y�Q��OJ��^�7����j����]�3���<�4q��,C�DL�\�蜠�f�0�u1�
[
s�~�L�c��T��=�HV7����}q�\|;���z�~���7�)���$֦�d�E��֟�b'��t�+ɊT�E"F�i�.X�{p�5��S V8B{(�;���?."Z��j��2Wb��1�~�02�V)}���A�4L�e���$���JR��6`q�J�zM��Zc�\8��������eoD�
�0w9�&O�3�jV���#�����s�S�DdE�r��t޼�"_w�L�?����.���޲*GQ:u1�"%#8�sW(=���k�~瓢9��UzY�Dh�,O】2��D�������q�A^�I��xˌ�:E��C$�ŏ���J�`Q-�j{�;���Js?)�x.�'y��O�20R��\�8�[�^X���� ����
F�5��vާ�q���g��G%˅�q�����ѷ�ҽ�埮����O�c�6"�)h�AE�!��T�z�NsI��FH�?w)���kgnc��qA\�qF������)���ɡ:��
��r��}g�f��.Oҽ?�:�Vo�
�P)� !0濫 �aRN�4"t�x�]r,]fJ���F��4����3+���aw&�* ��Yt�ĥi?R��y�V�uM_Z�ҙb[�('���G�g���AB��,]���Jp�z�/u��$c�2��~Ò$��]��:Z�.4&���防��/4Qs�:$	Uj��/��E�c9�K��<:Mj�?����W��j����ű4yƙd:^��jxн1.�o�b��^g�$�?�8����ܰ���~��A�T����R���x/=���B� �:\�`i��y�7_؋�x����u���E��{��{�Dς�~ap�����+�}��[>�D4ƃD��n�@�E'EI��f�)�	{sy���iN¦hg���䜚��������J��.u����A_�s�]o�]�>��3]��n���K�q<�����m9�1�u��p���iɯ7ٱ?q�ܗ��^yV�-�s���Ei���D�-G���=ᢐ���1�y�$^�{�u�v��`d��K�s#�ވe�5�j�P����%!�h���T2�U�:EUxN����<ɰn�?���O���U�����B�҈�%���w�l��-���������� �Ȓ��`'VH%~�K� �ݟJ~�{���+^������ؒI9�
c}$p8��h�M��J��A���}�	�3N�G�?�m�^LN+�jm(��f�[��N:��mmw�P�d�u�ł2�X������dZƃ��؎��9a�U�÷� #4<���|��λ�o=���.�sQ�}U[�.U/�%K��=�B7�p�U�r E��$��������.k��d�0�C��"d�U�^:A�Юߣ���K��7n}R�W7�!Zؼq� �Zl��v�-u>�u���q7Y[%I1	+�cM�HE''.^�K��>�m%���D����wH&�gGC��`;V+\)�N+�k�����A���Z�1�Wj0"�����Ü*�1m��=zd#6Fc윞;�	
�B�~*�0>Zͦ���{�X�)��w�Ǆ�<����-z�$MTF��l�ܩ/a��KE�T� ���Z��@ۑ"K�2��Xϟ��meQY{�UB�(����o?.<�X�}�r��]E��i?Z����<H��	���ř���ͣy��-z{cN�Cs��Q�$C �d��2�娄1�����Y*k����k�Әz0�9����=w�T洪x�6&��cs�a��|�^ Doڻ��:�\�bD�6^`qFbԞyf�8%ۗ�5�ߥQ�'V��h�6׊�� �"M� 7���A|�1�=2���S����[N��g�ψ�\�"�>�Hs�垠�:�3�˄.��X��U!V�%�v�w���j��5z�]1�2�ePފѫ���9�Ъ��S[�g鈱�b������hMQگ�Ex�8���_"a���������b����q�1����Y�=�iǸ"2����Qp��5�?�狊<�y:���F#��a l����7�;v)��k�0	�8
�Ѫ�d$)�Q,�5�SHLg饊�u�TPZb�5#�
��m� �~�[$�6�}�S��${0JW�|BĂMGLw�sg��\�Ywr�jgg�9U��P�C�_�h1PL�/��H��b�Akmf��I��I�-�Π�����Č>s�����G�
��kJT�ڻF�D�k�͞M�n�C�����c��Dv�����B�M�.ת��b��+���h(��`�6����F�'���~*-N���2�	�ZAo~��s��]hrDb+M��.�h%O�/�J����F�K	����k��yג��i?w�e�eM��-r:SX��|#��A�q��ɫM���֏5��m脗)�XbKl.Ĥ�8Kf��h�ͭ��d?mC�b��ͣ�8߷GC�����E2B�ɍt�,;�Q&��GY�ե��%+}.�Ҟ&���aOʢ"/��z��O�Jm�Kb2Q/n?>�p.LS
�^    Twb�"���v�>��IR��h���@M2H�Knt"���~��M6oT�d���8����n���VF�!��Bœ<�V����X�t6).ma���`�m?Z�µ-��PZ)J�T�WN��=J��/޼|�����_�C���^��l�dx,,tոM������B��u�)t:�8�X�;�wZ�[��C�_z9`�`>D�UvO�J�V5r{*���4�f?Z=��H���3ƭ�%�~�B?��9��5��e(q��o�|��nh�FŁ�I�Z��Ǧ:}��kC{Ēn�*���j�z4[�Gw��Ҭ�����/�R#z�qz��L��E�>�x��Gk'���<H��" �b�1*/�N2�NÔł��t��ڝ~��8$X��� ��D�]�S����5�ƹP
��v/'|��o�Δ��3����=�-��t�Q���$#P:6P�=*�h��'I�X��ǋ�W��ؒK6
�
[��Ʒq|��X�6��G�f���~�l��U{�h\-�����4�#	��n+���z86�U�%�,��~�x�ْ�6OA���	^2�u:&:��B��D���J��������$Ϣ��k?Z=�55E�1����d���L���3˓e!��ߔ�sV5]5GH�혂�0i���т��n�>]\]<���z�����~�%>�^y�ڤka`.��
�$M�RTHC�n]���@%�]qG�����+}��ſu`�:����n�;������42եC�1�vOBNXX(�
y��K8]SBd�Pr�SU~7
1�T<{��{�01J�(�<"C�Z�
�ef0�:�[ ZP3���[���n��]{)�M>Th��o���!d���?#l�:�Q�'x%�J�d��&jo�rG�H��Sl�y_6��GXC��h��H���8���
M�4#*L�n��:�ah�ϰ9C/������>����}�����I �b/R�@�i)�g�lZ��ޛ�������dр,�ψn
���{Ow�њQ�/a�V�Q\D��e]�����DiE�h⏟{�`ݷ~6I�x�(
wy�g�b����2��Qb�H[U�V4V�\��Q�F� ]���.{j�o6oo��Z5u3�3̂FW#����ЌLI�����ʒ�(!v��d�2%�$�YOV�皅*c|�ڕG�/<���-���ۄ@�~�s�K+&Q�Q���T]���?5ˬfF�уEhr��	��E ��E�l��J(��diێ���<ӄL��v�I���%ɴ�e�P(��\�p��������T�}^�Z�N����>�Ñ
�縩q�$O��k�C2>��̟T����ZrUF��Z!�7r���PJA�ӹlz���L����伖�o^�z�-,�m[!��#���������&�|�XUsy֗b?|M�/�~���c���翧�ݏ��SY��ʟ�p����i�|�����e#�Pu�^\ҳ�Hz+�W��RVS�$IsR��j�y��n�b�ӭ�к��])�f�1?�M�(0V��&����C����������1�9d��J���Q�5�����ӥB��,�Jb, ��Y��{��0����T�qV�O�S��r�p'*V�<dǭ��}��*��M�@�v�B쁷��T����4g�`��Q���2��nk�3r���}Xv����0�b����d�v�WO��g�˶^�jD7���u�K�1}��!������ʠv��Ю����]���gowo��P���hV�\v�o��.��v��JS'�0iG�U�2bn�����5�z��	���G��w������RqWf�ղ��:ۜ�PA�����J�����_��Lߤ�1���T�"T�'U�YWG���T���%�B������f�f��Ȁ�w��<
vԽ����6�@mk�{�G%���I�h���ɭ�h������{�Nݏ����u�}��v�m^X�=�$F�S�(��	�Rx��@����T�8������S7���-v��^LAS@�b���r�����^�;w�{p�"KL���tRD�{�ndM�� �@�X"cc�/�am�&����b�3C06�6��^*j��&���|?s�ͣU�XqߩA�P�6g�����Km,6,T2ޥ��\N��T�T��B�o;��W�Æw}��@���VZ�5�� ����믚j��'7`�zA�.�����tf�(��|��f�|�vazQ��D�芎z�{�4"�?@Tū����\�l��fݡ�)q�����(ύAG�gBvK%�� ��Di~�0�f\e�y�Ji+�$N�X�8���m�u��1�Y�P��d��ް̀�?�����ˠj�X�H�W�����2��z��B�٪�^Ѹu���t=��(݀�TD�t�}>���v1�]�~�񌠴*�	���k���ԩ'}c�+b��]3��ɐ;�j&7v��bt���X:�V�i��V����Z����"L�B��Z���7+���ŎB������:�w �nR�0��btigU
ǣe5�W�-������]��:� �\���E���4�����<Z3����$��KU�4�x3��]ܾ3�Ո���1�����ݠ�2��Tw�ڴ~��������J��^�d~�L�(��d���5Z���A�y������}�Ӭrܴ��E0�y��=��e���ï�`���<�ܘB�T���5�Q'/)�,u��z:dS!�a����Se;����Vg�[�'Ϙ��Nq>jS�yT�����Z��0���,	Ƙ#��-�k�Y5P�sm�3�q��b}ȗ�2�]�kx��p��0�Au"^X�$�U"Ũ (D�xgKo��;�j��Ɋ۱Rv�*,�������l�<܇x��h�X�X�&Rn%�Ǜ7�TC<rcͺ�N�I3��)�Z�xI>~�0t��,dfXK�C�eA¸��"]��.��xnͣ�\s[� �>
�C����|�o��|��"�9���!�����8��0�;����=g�q���~�X�ӾFH��J��ǩ���3ݪ"?�v<�btOS��+��L�Q�q��6�>a;?���xյC?��6{%mR�E+>�S��E��=@Mc��|���*�T*�5�Q�nu�!ufܑ�8*�$�������b{�J��P0n2	�Gq�愈��}O�l����Y�� �^���
ܐϢ�N�q�,��囗 �M��IgO���n
�W\�j�@E"����'lI�n��(2$��l�{��	O�8�Qw
>J\�W ��*}*��,��@zf�R�����'��)D��ݑ�\��rw������rz~a���H��_�'x�#�3�t�?qW���"��u��X�ӷޮ[1.Hgq�ÚZ+�N��3g\ؙ�cw��m��s;.�F���Ɛj����W�,=	�|���1���}���z�J��e��<$h&A�|	
�R�j�ZU�'��m�����8ܕ�F��-���S�x�+WO�Uw1��)_������S4��4y�Y�5���D�t��h󢕒�[��x����9�Z}����^1F��^�B��Fۢ+�8�+﷦��1�(��;�ʤJ�T�Y��*8��=-��`�k){���{D��៕�Q�-������ �&���o	�g���H����p��g��ۃ�C�������֛@v�e�̺8n�b>Q��咤<��*O�n���`+�I;�����O<�.H��_��&$��� a)�P�ꍈS�٬0�;����t8�6��T������i����-@�Ќ�0%�CH�#��w����ʅ���))	�Q�\��s*Y�g6`}E4�ѽ���1�%�����'�Xv=��ayb�q�݋6�NW����@�Ĵ}�Z^_Nۆ�����A����.�i
ux�TNӉ&�V'��g=t8��K�x��LM��a!z��#~�Z�2?HS���+2�[�a��=�e�"]�2�R����������>}1	{Wpo��?���1]A4ږ:�V*w�Tv׿ءX���_V�#�t�[`Gf��1P�n"��1'���E�^$�$$��jR�q�����,)�!��q���~���XSDdL    �f
Q�H���]~���x�= ��,�T]n��|��
�U�)��c.HgEd�H �� 5^HK3�������T�6�c.v�J2ƣr�:n�J����U۝�^���T�_��5dj�_p��Uf��O�%[-�w��-lAϙ��;��9�[Ox�AFM嚹�ެ_+Ϫ�&3s�ۦR��6p�.�k\��k�V�qn��u2�t�$#&���G�4��A5t�i�
��bV��L����+]�F���T�L!�q��qh!�?2�mK)�B���Iv��%q���ğ��G��G�A�}�pl7�4��͗Rz�""��T��������S�/)�n����������z����f�'zA䴃�#�����!d�ъ�~,9$��GA0.w����~��@ȸ�kg�/��|/g .�4ؼ*(�'��z�A�4N�mB��jTA�9�H�UN����&�h7�mn7Y}$��V��t�A��Ḹ��1-&�8Pe�U�;��[^喏,�jam����+޿���.�6�Ҵ���n��t�P����Vj� }$~e��W�͆I,&�� �����*�o���f�#]Kє�Ѹg���ˁͯ�#\�o�4� zW��Pe��,�*�L����E�
O��8��kl�LAy�w��QN��}���3��ab��y�"���8��#�~�ۜ����e"/��q&%�T2g�o��E"����d�ן�0�¹f��+K� ��5B���8!�S��*8(I
[�����i��7 �u7�����9�<f&~4�ݧ�-ΗRr�����~h���N��t�f��Ao?Z-}�V�X���
|]�>�<��(NUZG9���8�\o���BR���fI�U�V���w�Oܦ�5E���W�v>�
ԨTK2�N-Җ�wUo���~� �`��ߏ���s�>�� y����-/�R�C��:���MI����5z����<�t�e.C^yAy�V7�!��n��b�sD���-�+��Rk(ܮ8�����6Cr���Ł��+������ �(J����5�U^�3ŝT(hT_�4'�5��*i���+'�o��*�V�U��]J��� ����g2 �I��jҶ�a�/�wEs@���<U�t��b��<���!�}�?Qf/Xs���0��K���O`k��r���S�����Mi}K�0���������s1�ӵ�p��O�o-����0�fbRS�K�}�_W��M/n(� H�D��Wt�G:���(X�r��:�`�Vnޒ���2Wr2���*.���)�P���܏��{&Er+*�,iOp�	�g�W�Ďv�x�TCA��A*��K��}&`D8(+�������-V��?��r�q��|F$���>��O@U�d��S^����r��@C-�)�i
�O�[��?�(��Bަ�
U�+�Z�D��3X+���d������?pJ�]W�&Ϊ��XS�b�$����x��
zo�]�_,��0�E�?	7a�S�-{���v��C:��}K:^㭆/3,s�O�0+߱�d�$Kҧ�d�z���W�>U\4�ׅ�
N�P���������k�eY �������~>e����i����K�et��;Q�ֲ�4n��h��Bذ���4!��X�(�t�:&�.���%����u��C���փu�]�.#
B�����7/Ѝ�����0�bfW�4V������`vTjn��p[�E	����=�~�S=�7m�x�(�Ùf8�ʽ�����S���0���x��'��yk�~�~FkHH%	S��	2}�87�޾��񳋃�IZ��l�Y~D>,(���N
���|U=�B!��9��#����L&e�>�86%ٞ�ZY��m��x�0��U�\�.H�|V��|�$�T՜G��zjl�1 �.���@�<��*��4����b�Y��`�ᚗAƏ���r���Z�h٠�8F$�<ܶ#�̘�	�� ڋ+s���y�U5��$����Nߞ��p�h�C�.�Yr����_L�_vm���آ��R�kFa�iz�܌z��x�Pff�n&Jd�f��q"uR8��)X�@Ku F����*�с>Vy�]B1��K�<&��=K�(�x��G�"A���K��w��U�q#��������oĻ��<���D�j�.���$�� ����(��X�l]9Y���������o�ղ�z���8�����XG����bx�N�ph�����9>1Wz�}����"+H���8�%Q�g�h�����({�>��E�^�$JR��&���6N؏�������y�{���z���J��_�����$N�R��g�0�Q���.Y&�X��@e��:-K���q�G�&|1�G��'zk���Ɲ�i�b����.�I;ژ�b?�{�S-I���L�b�F�<5���$X�9�k�3X}��y��׸�5�0G�5��1�@�z��+�B�`\�*p�����`M��f��Z
�J�7��c!.ݮ�y/@	咂�� ���;�N��;&��3e��[��\|�䛔$��3N�A�q�����M�5�D�dc������7:<�׺���Q�_)�qN7�2/]t��F��즋�����}p���ʠ�v�s��v僎}�ptDUز�rzU`���b���hr7�p2y եp�0d��q��G9��E�N�V>͘�Q�,SQ�ۀ@��� X��V(�I]Jqu���{4qm�9n-
��K�x���k(v�^��yn�PߌG��&3���o��S@�x{*��[o�#%_� �mSg�����f=�*S���͓��n��o��b���=D}�F)�>�!؍%'���r��gI�����}2��� k.~%��<�\�A�y�EV:qa�����A�Ü"{�B�_6/4���GX�,�Ϻ���*�A@���4?=�Es
3��}0V.�+��A���<�/��� �3��r��Q���[6�J}ן0&��)	��r.�
up]9�[���v�\��ij2�p��h��Ϛ!��,��$혟`mD?K�'��'?�T�)V���EZ�f�jcn�AV`\*-r����τ�AFn�	��)Ĉl��u�-��M?�
"~$��F�0N'6�Oh�<L�uD^�V3W��c���s�{�\C�x���8�6��ϫ��uN7l�`�'�1���I�j��:K�eJŲ���et7v�jy��I��t�T�D�~I��Z��n^T���A�M^�(UN��G\�Xt��>5�*���?)�iq�M���!�A����^�}h�q�D���L���,��t-BL浶�;]:5���?�s=�+[=T�HKY�0���>�=z^#'nF���I�9�v&���c{P�~9C��𱓫,w�)�w�Jt,�`/?c��k
j�?ǳ�,�Y���w� ��u��B�w�P���l�ل�G��+nA�.��>���!9�
4��5�I=%\la�ྒί.�i�k����J�Y8N����TO�iZ\������}�-=�l���8@ُvA�O�}W"zj� �ޕ���e��4��iK/m=���t��P��?W[ZT6��'x����0��pJ�EB�q�tM�q�G�'$���"�rI� ��k�r\�fZ��@$�$٩t�TE�md�塡0�~�]�)`gy6��l1�:x�=�cZ!��5K5���j�i��0��igL�f#��T�٠�0V.�5�ʙ�|���u��"���>؏|~�X��.�3.-�Fx+�1yA%��$:�YL���t`��>�b"����}��8�d���������0�]^.�l"-,Ӥ��,�c�s�8�}��sr��XD(��o�\�����<�$�P���]�����K�GW���G�')j=`����BN]Uxs�n�NE>@_|��q01~|��}����Q<�RւM$q�(��,���<�0\���_�2t?ӵY�Vk'�GL9���`e@�-w����������x�,��Ռd���� ��O9a��^�<�~��w��������Ҭm�b�pQ�r|���q�&��Z)b���.�f �  ����	��}��g�me��Λ��еQ��M���N�����-���P�}�"%�Q�7���."w�3��W�ikϫl�,�z_�I� �z�)<g	>��偾��Xʛ�8�Av�\��J ��Z��u+̼�����w�c��?ǿhh���砺���I�Ќ�ѹ�Ɲ^v���8�&Q	
M��=QKR��� V�@5��T����jN�b=נzk9O�JSR��QZ���҅�ʧ��cy7�B�P�R��`CF���G��,�m����5��!�|ǜ��B��D7޵���)н���Rg�ں\5�N���\�1�u%'��=���_�x�;K#7�\���I��=B�[(8u���օ�K���/Tܓ��i.�p�_}UG�x��s�n��*� ��q�Ti��<<
� b+�o)��
��1�`���j�&�^f��x�0�ny�jW�ݯ~����m%      H      x������ � �      @      x������ � �      v      x������ � �      L      x������ � �      >   �   x�u�;n�0��Y:�����)m��^��N�@��wk���� a�@�u�Bi(�I��O�F��
/�8���?sK����?揔��9�#�����G�7���b`~Y��:9ζ?(t�=��Tc��O��ȁ؇8tQ<Hj�	i�'����VeD� �"�'��z_�>���k�1>ʏt0      f      x��m�۸�?���)X���L��!>�Mm��q��ıg�޺�o��M_�TH��ɧ�� A�=�V�me�����<�����h�����o����@�σ�=�Fѭ}�%A����?���rSm�����ew��$�щG�p>��8��a��G���U�U��̙�Av'~�Jf�go�~	�d�GqGb%Ǚm���2i�~��,�����M���>e�.� ��P�ƱQ�X�t�%����V�c	S���<'�қ��,k�]�t��p!
�r~��8������y��x�ʖ+X���V��q|��J����߇�v������i�(<>w�~+Mb!ݏr���J7���*<��~x�~�2L�O��
�<��a�o�Џ�$��*��m��-�0�s��Kӕo~h��ݕ��/�����齾jZ��Cq�Jo[�4�n�;o��m�^�+ko�6}�9����m���M�<ze]|����/�z�a�����^W�C�{/ʦ�{(w{�MS����V�e�P6[\[]6����X��0��ޡ��?�����U]޾+>l���^E���a�-<-7ޮ�kXY������Xk�U���`��S�����1��d�ח[�64�Z��G?o�U�4e�D��}���v[�@f�����0;Z.����m*��*�Fqh�c��q�{���]�t����*:��
����*�}`����;$�����OD���H=��K��}]l��k���y(������O�S�zOm=������_ڲ�+�M���H�[v(ˎ>v�@��w��r������ɐ��	��Z�.L�T�¥}(z⎾x���C�ma�����E]��Ģ�}] ^�n�Z ����c�V��v�LEů�����l*�Q��}$�b���cW<U[�������]+�Þz�����޽��[��C���x�{(������������uR,n��y�E���=���i{�־k��p��qAV7D}��m{_�۴���ۖu,K������+�{����4{8ʇ
�qԚ�F�������>警7
u��������Aߴ;��V�݄H���k����Fte����� �|�ա�)��M�֐�+�$|̓ſ���;�w��bT3�~�����v(�+ ��ja� eA�(�`��$6l�p�H���Gk���ٔ�0��
��(�~<�0�v���iן����,>eV��ƃ�{?��?���N5��~�k�XDO�#�p1h��d�QD�/�s���CS��Ү��V��k-!Xk[\���#aY��-ߠD��En"��9��5C\�H:}v�B��ƕ���*���X,`H,�V#k���������"�����$K�#fV��a�o[d{�>�-�-���!a���x��GY�'cJ�5��$�nx��ߊ��䬽
>yDm)}����EY���.[<�k�I����mPC�Z���Cb��f�"�8|�ˡ+��.e�8�~�� ��(Am.X,����+k$F�RRz�|� -hIt1ؒ���J'�-Z0�����[��]	j(�^�8�:`�|7��oV���(-i乙X���/���3h �:�z�[ 	�̒ɠd��.R6��mR2e�A�j��OC�Ł槥�ZF����=�P��!�����f}�
5���1)�����P�Q[GL��N1`���ގ6?V	nzJ�)�
&�{��W�z�LlT�O�����ʃ��Z�P�2�2�G�F-m��� �S���O���:��|(1D�^]=�
0j���Y� Zۗ���?1�r2�䭔~e�@��X%o@=�� ���p3����j���G�#���h{N���(���~����  *N�|��Ռ��1W3�j�\͘�s5c�f�Ռ��1W3�j�|ʌQ�Dt+_�I�g�c���Q�!�0Hs!N<Z��j�\혫s�c�v�Վ��1W;�j�\혫s�c�v��-vI;F����\>Z���{�T�ϵR���ߴ̃zr��u�X�"����w�%f���L��3���-j����2��3�/���ߣ�P�ΰӸR
Ihۂ�c��J2�T�{͙[عM��s?��0�o�/e��=z� ?�h%�+{��c&>.���ɉG+�r:���{lں�%��+1�s?D ���p��y+��S�V"s�aF�/\���YT{�h'
"��q�R7M�<�����ʢH���i�>�'
"�0��Y�|�A*�U(tj�m���א߆����]�ܯ��m�>��*�Xn�-"���
��*����+VV�Y��X�c&|-������hF��5β�4L��Va��@b�@��(����H@Q|�/�<�Z��N���
d�r3J|�"B8��d|�C�D��B� W�gWl��}��m��p��*_�{_��
wS���zj��|�A���|žk�5:��̲�H&��-��60��~�60������xY�����?5R��=�w�'�`�.o�vo{�v�#L��6BQ{-����CЄ��}�ྨi�«�����]�n��yh�>k�?��P��m��`������n/���𡰄�S*�p���V�q/X`����S����bw�d�����3���������e}�.ڌ庍3��q�ǟ�া2�o��luA&Kdl�>.�$^-��J��ԍ���	���$���?�>H:�=mEφ?�B��U�=�n6x�a
"�����gU���I�u�)�k����k�<�S�2����k@���5��?{L���bo&�#`� �vU�{�V����{0�ۃ�@rR�x��z|����c���䯧�,c�>�(�
�{�Z!@����4�ϰ�s�Xf�L�{J_A �J���o���2�ܞG��=�A&W�V��A�����V�}6 j��taܗ��0��]xh�?{��O� �v ����?.D<�4dW���>�,��X�-o	����P�&�kXrā�M��{f7�v�|���uK=+�r����y�����,N%�J_��m��&Y|��*
/0��.�Y�����n�}Ué������	X�48.�@��Po�W(#�p����k�ː�I�M䱄�{[Z��t:���+V�M��@*����O���m��2�cW �l�F��^i�8�d�^t(Y�Y�����{�Y`.���+�[@����>�.?�Ϭ@!\�VV+��0��<(b�ܷ�~��7�P�}T�[=kE��Ak�����aM=�~�(v���X��#�i0��)mKG?"�Z�=:L��p�i�X�Վ^��VE�a���3*6>y
r��y$b�x���>�k��C	OW2�a27��.�n�����0��\)���0�#�H>��.f>hq����̳K�g�Ay���~p����8��Ȓ��#QD��dd3sr�~�)z����E3�qbp%�3�a����ڭ���$�N�GB�k�
d����@�I�0MVa���3�����Y(��η]W,�6�H��?�����/F�Yl��/+O	T�E�2ꄕ�8�t��ufuY�E�B�egx[��m�^�S�㩾z���״���6T�-�#ַ����x E�F-O��k#�({Wh^}"�+��x8����|�P|�KxX�S�h��g����h6��G���������{λxU���A��:�M�
W���Ǽ16Є���j�a�Mt���<�KP�1�L�ۮW	ݱp1u ��&���b�^~"��-S�a~��@���67k�������T�����ޣ� ��F�a�~�fs0o���*�O�#2��{�?�w@�=�zk�=(��+�g�˞�{}����p(��]�3}@���^o�I!d�5�G��pܮ��!Ǐ�L�Ǥ;\�XP-u���ҬJ�v-|H��/)ӌ=;�j`�8������QH?���v�%�=��B4�S�;���)Y�S ^޷]�vT���G��1㎉ڑ3��>��0�����7�    �65��W��
�����V�t$s&�C��D
��@����蠆sZ3a��1����ف{�L�r��#�֌�D�y����*l���*l����#l]����4M�#�6$0���(�Z����adDk�����ׯ~�`�7��z�"zcɝ�`����ߒ�mqs�*�󚽚�k���F2�������f�����^��.���@\P���$�
�A�ݭ����jFk(3!�������;�8������Z���u�%�1�����<������=���y�l_�~E���x!q��Hp��h�R���[�bQ�����t���n1Kxv���ړ��⾫�r��̗�{>��4>W~y :]��OU[�����U�}�):$�k��1k/��Tt�����5y\؃s@���ۖ��f����ϽWu[��[�Oզ��m�܀��m���W:VH�I���pU���n���I�&�뫹?;����?U4����h�f�-�1g������?�i����$EC�'f�?S&�.K�U{�Q"��!�#��6�cI�'��A���2��(�CA\%�U"\%¿M"��2A�2J�H�<��U�� ��^z�"d��?�K�G�q�����$��4�H���2ﶠoqo��]�鱍Ǫ�#jt&p@ǭ����h�)���X��AX�C�����������s��	�9�j��11E� ]�o��/jq�㧱Ĵ�3h��=~���ԣU�\9�"��.�Y�ىG+�c�2ыE}�q��k��uLiұ�I6��en��1�O���=�]�)��]���h�F%�+0"��٠�aE0�!��� �k6�(c�P�ӆ[���� �������Ն�(��]�P�ޟ��%��\ �����l�����>'c�Yie��,0�]���h�%�u�g�{��ś5۳�ʾ�c }��X+/\��^��"�T�]�<�CRV�n��	���pDiC�XO�Hw$?ݛ�z��2��9X>r��0�O<ZEٕ�,����N)	�O�|��b=Zœ\.L�(��%U����i��nz���1�EG4��@L`Ɲ\��Q��J���x�F���쬷���$5��:�v̠�j:�)@��i:���)�'���o��L:	����zN%0�S�ӭ��s�C$ӓr��P�0�Рi���Ĳ�-�<�ɦ�+�{�Kc����Ea��:{g��NU*�ըR�8�V�b2;�O�p)Y��j|�.|����/*&B4
v��v7Q���F�e �|�4��)e~��8�"�O>Z���]OЯ���K���ɩG�XZ�;�&�����='{0V�RpM)�cZ"B���9�~�o�*i�۠�U�U����iw�Q����S�9�5�TEs }� .8��U������Z����8V�Jo��5�C�+�E�
8��7x��l[�b8�B�x�޷�|��}R���C��Q���8��Z�����D/��{��{O@`�� �l�^	�c���#z74LD�Z�!�1�8$5s��){[?�H�����d-*|�Q�r�����6��<���$�j�;��?ڪ�$:�M9���g�jeN)�=N<�댃RN�@s�TQ�gQ(�s���=~"�U�G�T޼-�tK=c��}[��u=oܱ�Ig�l���0{{�)p��t���� F�J�}m����߶�w��j��f�Y�.�G��@��BLY�VQ>����5&P[��ڒQx����C	�#Ы����R�]�3�Հt���:Di:����w��w���+��֡�u���;���p�Ѡ�����&�p���JN�׷����<.��C���#�&^P���r-�G����8u��ǣ��psI���dB�7]KW�4Z��<�?pj����64-lv$7H�Y�DPb���R0M�l�܍8ƥX�.mG����z���
��Wd�b�NL�!]Ho���S�}��ڭ"~*.��R��(I���(�V�-gH|$S��`��{�f�>=b/D�D���4Ɏ������RBlЏ�/avD�a�G��8����/�8	�8?2q�*���U���h4.��"M�e��`��F��̖JB���P̬n.~3e�t�l����[���TʫH����S��;*�:O$�3�=��'��ڱ$��#&'^�x+q�i�/8�L��tB��(oEx{�����D$��G�8�S��뗠z&&6�G�D�x�H��@M������J:F�땎G"���9�:�,%�[sQ��zC�+��.*����j�ӯ�m�o�f����!T��K����Z9ա��YZ����Y�|Ɣ�
a�q:R�,@�B�#�X�T�0�8�A���	ou��xm��X=V��bp�GPup�������c��b�b��|��w�y1[Ig�o��ޞ�����{/�Ne2��V�.R��D�f��5����=OC?�aS*��D+FW$	�,��!�$��ƒ�(9�]�����c0��z�J�����_��Z�X:X�HaG��*7/���`�\������A�7�w�0[&�ca�<s �;�3
tML����w�W���$U�d�~�yO-�Pn�(�Ce��a��f�� t�aآ����jtP|6'����d�E��ȟ��N���S<�Qa�e$�.]� 9�����ӫ6K��Xwe�m<�-���TP���,B�*�k��V�\㇭��kl��=aͬ�ùzXO�3r��y��U�SbiJk�]�#��,�*���'b�b����z`��x`�w̅L�-�T�G�<��S�E�DWx�?0��>K�i�$�{�Z09S�H� ��US���F�+hr�eP=�J�r	��V"�@d��(�%�D��z�ʓ_��x!:�P�ţU"��;XP=�^V|����?��I�*+AD�O�b$�t����z����gy�$5(e�U�TJӴE.�q,�E����5��T�Š}��XaU�X��]I���?���¿�$���N����*ڤm0���H|]7�O�}&��ed��m���ρ��9B)ႇx�0Gqj?��Q�O��"WIxe�_?{�,�K����a�Ld�J���/?��q�,^'��bg2�⁣q3�_K��6y�(�a��Ǔ����Y揰��="S���Z���Ɏ�PuIW?�XS��ӥ)Vv;�&aO@<V��4�s�cz�&뱴��3ȥ4��^'*�$3�l7��7�<P����������J�F7:�^�M��`��V<l�+���)0Ea�'N%�A-��&b� IL�/��d%X�m�EW���x��@BI��8/���6�D��qV	��D�e}�62��`�.�����OqVA�5��B.ӟe�r��C�o����d�;.0�O�'Y�'g�M\xTi�4H�x��[�Vqv=a��8a�;�2'Lq�0N�G�8�g���C�� ;*�N�6+�J;��?T��U
3�&�~�Y����mˇp������c���c�{�p7.v���5;+s\%�ۣ��\�B��YP`��
��D.�f��*	~s�v��Eh�F�"��z�J�s�@�j�a���F����`X#?���Vv�)G��c�ր�6NI5�UZƁ�b��U�����e���e`��:]#���*���!@"�ۤj�AA6�X;F�\��x���a�`�M�9����ᦪQ�i��)3
L�=uFe�gO��tA`��*��K߄R5����]	�o���]w�aV�AΟ��d�^^v������h��V�d�}��F쬰V��AA\K9�hq��c�g�\~h�>y��"')#��f�'Q£[!�<�³�cpy@q�4��El�z�J�둹�_�q�.qd� M7��h��s�2�?�>���]}���M��������38�v`�2 A!V{���L2�ʿ�OHY fKx���{y�*?`�v�!����[����P&���H���kT�'�D��ʆ�Ysh�f�Ac�S�$��# Ȇ�p�f �a�13������c��|ȞJηg"���ޜ�#� �^*��C����a�|��r�!�A��Ѽ?�

󁙼$��i$��J���    h%HR��*��&~�R�#�.r3h�DdA�P��G�$�����p��8�����|���@�������Cu�agP?�3,X��(�H�@�a�!�ag��3c��n歍l;���4���6��x�P�,����S��Jb�n���K*�~�@{�J���Hÿ��`�4Ռ":�>!US%��"��Ҳv�G����<
ҳh�	��K�%��4�rԯ��\��"�����3�Vi|�B�Ae�N��Ƅ�L)g�q?���Zn�=� 1���W@;����c2I:M[�n\�Vc���Xc�D����y�Q�����h�P+lq+�Q塘-�A�vW�V�#��2�0@W�6zq���Q,���z�J��F�s��'�2���8�֣U���]�H�~"�̣U.L"���:�xl��4`����Ӭ5���x�Ȍ��0#ģU���)�����F��>��Q�q�KD��j?`�݆nN�2u7K��Mk��\��([-��0J���E�&����2tb=Z��u��}r%4^b��0��H��h���>au�x��r^�ۗ������f}W��'ڐ�0w/ٍ�5��N���ЃDv
�ɠƗY��d��*�~!Z�Ѕ(��s�l?ZI�N �uA��Fj�4���g �{_���a_���SK���K�	��
6l~+��	E)��s���k}�r��B��N0��F0����4t>)�����?�,��p�����5�{8-���$�ɀԘ���"֡~���^O�+�Ο��� .��j��)zU�x0mr�N1�@'�>��Ok�S{;����ӈ�G@�w��8�� �4�oa����{�{�N)6�9���P�D�ZA(�,?��Q���g�6;?��G�����*Ko^�����1�4���D�%��ZL��U�k�QB��$
5WL��x���(��çf���!TA��+΁1�c��W&��T����>;�L^L�"�SuLìm�6zDg<~�j���ã�c��p�
�c+.�A�LZ���ڱ��A���=��"�]6���x��m�4��T�e7�܃�6�}��-t�x�p����Ȗ*��h�eWV�}��҄�+��2�i=Z�{��*�w�| U�T!a)����vm3�|c��(�o��x#��#m����}��#��/W��Y���V�,��?���=�?n̰�6��d��a������L���6�~ E���u�p�d�/g��躅���.g�E�0͒�!�����g��i���
S�R�ܝT��jI��*1(~�qSL�r�T�p� ���\$�.������I�ļ��~��t��	��\\��q�:<��*n^l�d�G-;���1��h� r�8��܌�տ��{�P<��p=$�.���2���k��O���>Ǿ%Ŧ�\\."?6�?���
�|���$��޼�	$��-���%���q~�\�u}ᄇUC��T����T+��z���$)��hBܩ����1��x����厤X�ǬP�[��#ې�Ƃ��Zѭb�R��[�����h���Q9m���ʮ�{�����Ak�\U��+
׻�5�iFit�<������$�30-6BX�<y���U��y�b1u��ޕpc?�\������c�b5��`��|}��o?|�k�h�?IT3}n�Q�>&�g�U�����@�x��7���6��0��{?�yY �����9Q0�d%WD�J�3��J���\�bp`Џ�q�	j�mI��)����������=�2lH'I(΁�(z$��EY g�L)?�P2�_!5���KP3K�y�iMM0��U�_�����[�:]>��\�2��L]�2��U���nNW��%n�8�C���3�h%C��x��O��8"���0��<���΄p���QZ~��>�3�����<JW��<�>E����ED���S�U&o��x(�䒰5��SQ���d\P��� M�&	X�Aay���Yr9bʹ[�߹@R+Sԭs�Ͱ*1��b�YWqғ�8��|k�g#,�
�`_���p,�����^�@�`	J2-�++'͈j=���(��{0���;&ca��}Q�H����#�{:%/
�N14�����WN�+E�2O�YRI�<~��|qD�G�,����]��%x1��R������a5��PvO&k�[����y���=S�v��I�	q��"?�H���0�c X�D n ֺ	^�2ӶV*?uA%O5���g�S/*F_��S8�&�������Fh�����F�6��G<�\\����{ާ�O�E���(�V(�r�^������j���_�a��O��Kz���p��P�d��1��hve?�~�:�9�*�|�u��6!f(�b�)X�o��z�ԣ��9Y����V���16��X�6�9ۼN L��l���E����	��ht��1��3Mg��<ԧ�jL�TsQm7���������S�~8�@��f���������2h��/�O�kT�Pc:��n�r����ߵ՞�ʦ�.���P�d�ޭ�1	�tjZ�_�7
x�2�>�� Z�~��ap�R�h!�h|!�t�e?�#]���H�
���̑
e�.���Gp�қw%�KQC�g�fq��;�vi"m�Kl��
�،3^М"�0h}��Q��Լ⤇{�	E�،4����4jDO��ض�9䠟��?�#'PD�~��,��y΀?	�|3�`3���f�N�E6#ʢ��f=��ȧ:2�
�4�xQ�ԃ�O�hͪ��ئ��B�9��f��l��4K�(<�� ��Ih��z�"�eSn�s�\-�L�G@9�e���^m�.�g[e��ec%�Ꙋ0�eh�Y���.cT��K8�κ�j���f;��qD�9���B8~:t��s�	HO���⼋/��6�"��*�o^���m	�#!U��ޣ`0R�����h���xL�+�xh+��=�̠�E��I��3�=K��E��b�������g��Q��{�}@]�о��q(���N��v�K�:���^ԑ؃���`[G��C�Hy����z?J#�i:�Ɛ�Tf���7*��8�_rz0�T(|U�)��W�E!�/[G��a�po�%4r(i0���vX"ʮK��p"H~��u�c�mF�m�\d+��8�T<���Ag������UTy)�f@8������Ho�A�������4Ue{wbi�u��ҍn15k�e�A�bMp�2�Ut�U�c���# ͱ�u��� G�t\��U�utZ�v�2�ı�^uLA+��������b�n{�M�]�!"]�8����v�WH��&�"��~]9�ʡn%��h�g��84���B�*7i,��A�vviMz��
*y�f��߿�;R��Y��Z�W#�e��/3����;��Q��y�P���n�[���{/@�(�R,��֣�9IDU0�Y!$KA�\���+�ݰ*���7��y�xaL@]���l���i�԰Ȝ��;;B�"|O�VU�٦0�xn�}��g��ʊ��oQU��gK7d�XseC'kǡ�:M��Zb6�@�_��Pݸ�"��22��O;��l6��~�W�)Gu�	5�0,8�qG���c֗N��l�q%]7��,O&�k������a�ˬu0dl��Gq��y���9^������H=X�0���a����r��J׽���qIo�)4��ͺ�+,h�!7G��qQ?���O�1�����5�j��v�}ap9�2�O	`l�SM�u��C�	��w꾮��sCoȭ�@�^���/R�}�G:@X��ZJ0�N�/�wp3?Μ���_���k}J� 	�U�ܔ�?���(���<��4V��hz���#���K%
}H��r-IG�\����C?��0>G�7^��x�,����#�����W�r_J�qx/Î�#�pU���Z�.��`��)��<���}�,�r�P��A���s�/��c@H{���'G=�Ͻ֭L�S�y��o�8�����6>]Ǆ���˵�����|.����1��f�R�2��<�y���Υ�Ҩ������%.yQ�<��9���Y?Y(�b    =Z	\���-K�rn	�,[���J��͋�QCÞJ@ڹcG���`S�B��>�k�����a�f�ό3�sn{1�lgXLUû�l�ڍ�2�yx�����E<|"�0���0�Z�!��ɕ��k�]ո���s6f�4(N�WXֺ!HC;�qSX�T�~�#�����z��� 0@�Q 8*K^a�(�HY��UmLX�v�FE0P���mH�JN�\��0�����'�v7�X�Iĩd(�n_a7g[�kZi����o���l}.^��.F����dPJ�>\l+B r��"�=��"5�G�u����
w�B#�w9�5ُ�^�o^���cv�#ҥ�)7t�?v����=̚H7z��/�l�GJ52U�ܝ�����[�ǫ�	�������i����<������k�ϰO��Q��[�`���>����\.�Oq����D$o�R�}K���}���,���l-t�-�)I0�D���V_]1+O�r;��ı��*���?��qƭ��`GT�{�4�m2\�)�� �s�Q��^��?�v(��ڡ�1���b��a=�=�'��l�M��.FQlg��Q�$l
�Ǖ�i'�h�2��H�8�y���Sq%ї�6݆�1G�+�����#��U5�t�T��dʣY��k�`���
8���1em	�Z��2ܮ#�*����j-xbv~23>& �$
�R��y�,��\��Qre�_9���(墰�~l������������D�z�lҽԦ��IN��]�A�����9tԏf�}z��H㞟��D<�bD����`S��n�m;�!�F�M��E�:��v>���MXjL\qix,)�
�`ﶮ����/ʣ�$k/@d������F2�`���F�q�]'�"�d�����Ť�̩N2{���1�d���&�u����e�Tm���&��x�8���W�k�Wo���G�գ�PE��S�m,*,���x��Wc?�mi��ö��
�8�x�~�썧�KD1�K�|�1���!�혃�5�ښ�����o���ny*�{��Mq���FF��.��j�?�w��Y�$p��[n18�� �$> ���d�#P٨��V���ap�����jR=�I;+f=�vV�B��T�w��q�>[�$�US��TUS:3���D�H��j��7���Vd�"�<AUQ�4�\�k��^��#��#Z���P8��L���n�%�͘i����)��t��8"4�g�].��:/�1�I�B��`6.��B,�^�hm�=�O��&
���bV�Rǖ��vKȬj\�6�jS�*�T�V���&��B i�|*,����vF�;"��횖c��<�J�D���e*�w��ot=���{=�'�+fr���0Xh�֣���ݹ�)7�̰�o|���7*�/���r�g�8�s�T.�S9�E8��%L@��Rdl�K����(���U���":W��!��zmOP(v�������8�INEuo��a~8[�to�����d��Ţbސ~�7ImA�,��	'Ǫ���(N�g�|_�
{(?p'?�c���񠌷�Q�N8fW;�l�55{�L&&8��P�,��'��m;�K�a	2�h�av����D��2�jSS�&w7�j��B>VA�;��~�3��K��G�G��<�c^���X�J��+"y�c�K'������u97p���s'�-B^��i�L��1��ӓQ�"�7yRS`�lb�)��l8{]��}��'��ž�)G?��Z���Y`i�w��vL)�,L#q��E��Ǐ� t�y;]w�Kv�uf/��y�	����5���.�j8 ��Wiܯ�¢�EF���J�����!��1�M��D�Y��T�Ow��K��ِ-`�(��ʲG$4�KԀ��Ƀ
[<7:�7F��-<5w�Y��,�����Y��ɀղ�E�G��Mg�B�~��4;�+{�����2�q+��%�2�/�Y\q��0K�o�+�Y/Юݶu��o߾z9��R��C3��{�u{_hlW�Y;�|A!"U�������b��#D�R1x5h�ٯ��.�a7��3�w��0tbu�%k2î��>ɝ�+�y'�9�����Ǒ���z�]7�37qy
/��i��
i=�M�9Egw�}'~Nm��D�J�#Xʏ�9d���@HlJl��.wrr����ό��A'�Stѕ%�i]T�B��&N=�w䄅~����96g����0��|�җB���c�W0l��7M �w`�Q���h���R��@g�*�
����.2���d�S�=������v����7�߼et3t��[̝"T!�8l����^�P��x�}�:e�r)��'8b]6c�;�Kfe7V��ڰЎ�n����HHX�K�*�4�VVz(��q�I��$�/7>���'&W���+�q	L�p9̣f��F��ܗ�
�����05�S����Ԟ��.��C��ٵc���a�u�S�ƽ�U���^�k{��F���VQ|>AL��W?1�з���G��@W>�C.���Τ��F�i���=�e����-O�¾Ի�kv��A�28O�Ţ~����q�#���ʝ�{�t�ٗ��H�m��3?��^�c�e���\�lc.�&�a��XJl��%���r�h?��vP�#�'��SG�l8��y,�ڛF.dFt-vf9"HB?���9���/�ܑ$���D\wj�S�Cu��B�gG�yf��y7�<�N�V\��������9k�Y2�:I��k5)4��ٺ�l��f�8�� ��Y*��/8~�FK<�3���ř� &���ʴ�p���QVW���y*zU��ES�jUJ�����#{h�j�+oAޔ=�j�x��A��*��b]���o45���6�-7�u����� Y�6�?�P�m,8��OZ����/}��a=�Ց#cd��c��*��N
�.��i=��EY^XOtO��?�6�=U�uP���c���-��5����G�%7�Z���+���NѬVDk&ҔY{�Ly�=�>XL�m-)��[���[��P¨���2��+�luE��f찢�9h���$�՛9��\穩v_h{��r�:F�Ze�R���\O�EN��q��� ��;:��8c�_O������V�~F�9|�B���c9�׹�v���#\���%"\��;L"\I� �����J��=}!	���1	��@B}��n���(��I���@z|���޾F:��Y��:�!ou�rW��z����1��W�Q?#���:NE�^ -�r��N|�Յ�V<OmG�X��i�Diw$?
0�2=�L������Un=Z��s|{�-�����Klq$�q˙G��&��@P��n�gP$ �0�[�0،_�`��.���C� Ѷ��;�5ؕ��S\�尐A�|YQ����KD�	"xy����SST˼��WI�Ho�ď�(>�xYD�'�S�`���v�}����B۝ȥ��z��@��I�����L�Vq2��H)A+���Pc�{
��ۼ kx�(�Bs�f��2k�sPhEl�%e��*֣T�B�7���uĲ�8��ly� ]��y�(O�D��0������/Cs}Yb=���MTͪj&���>g,d� ��{��K��� ���S��	U���f��w��eDO%9A�┅i��Ya����%:����G"�X
Z�9�g!kx�<H�E���}���
��\��uz.�=p����@�R ���+~yX.�&�|3V|"[5�~�P�.+�"P�Y6Ki���XD+̥{]Ӛf�K>e�n&3��W�g����5��jF���9�c�����MτK�Pq(����8yA�u`]+k`��efH�y���r_`�����zu<x�$g�g�lʄ�t���6�[+���+a�	Ϗ;#Y*�z46Ӛ�y�Ya���b���b,q��4�;��}��Q~��H3��A4������N�0A��$�r��+��Kpe��E_ŕ	@�������D��uM/��F�+l��coT3��Pjl*.$ �|S>U=W|    .����1�L_��f�%���J*we�b*��lD��hJ$1��S���HH��=�!S�M3Ƹ0��MT�:�#)~�"=G�>]�v����F�1B�1�A�xIv��s���t�]��q�i�ec�3�y����+;J̇(�3G��`��k!�ݗݍ]�_��H��̓S�R3��?��A����Q��m�߼l���g���r��^T�=������
À��U�7��g���v�ߎЮ@kQ:�W��k`�E��gE5��"L��o�*�� �P�Ch~IEm�ڈ��?~,U3���E8]+;�,�q]�����7�"��s���h@�ֶ��q��P���*�[�t�8:������G�?xT�F��͚���6ë������n��l��H�r%ۀ�3�S�1Ħyx���t�/�Tf'�����z.t����A��8�h�7�;nQhT�b���K�#�����R��ݷ߾�Z�Fj)�U�z]eo���TA���2��U#`�w���B��֚��bb�B�x�2�t��Y����2��t��X�fQn��D� �α��"�M�ǑX�7��J�[�����s�ϼ��ő\b�Y�`�����qܦ|4WQ� u5��.�$�F����C���?��= u\���f��XƉ��' ��_8��;�D�'w�(���sxa���)�ǟ y��y]�{	�fq N=ˉڌ-5��6+�}��u0[w����ZD:Cxf�b�7���a�v��P�Z�kIPuQcOuJY�w*�#�/��RW��N�Ґ�W�D�A�=�x.T	��ŷ�$ҁ9��F�QP�
��V=�3V��+���������p��h6%�иF��nS����ZZ����m-&{F����l)
c���.�9Ai�|�2:�ͳ���ذ~.(�G�hѕ�~C���h�b�4^t��D.W~��V���FZ��V��P+�P�*꾀��8){�߀�T�˦���F�|7�8#�㽣�6���{�"ȄCTm�\�����X�����%>&`{�>PZ:q���{j��B��'>����3ɼ	rDE�L���M�����y�Էa�b����h��J�?J�t�e?������w�R�a����ے!����X+E��J����@y�*�g;0��5�欟�>[l��@I����^+�)ۓ?�8��<f�6
A&R�#Ud���ϳxQ�d?Za��_!�yB����2����À:�a�	��\�1|[����S-�L� ݆f��S]�	,=Y�����T�cpw���x��g�G���J�ʨ>�=��#���1Y��˦���39Dx����M�jOe����8B
��Z��1g���s��o-a������·�ܛ��خu��)n���Bk]1��~�l�V7=b^��(	�¦)7c�{C5��3*(97�O��7n�G~�A|�l�|!Ey�X$�B�Z�V"��y!Lԟ�ѥ|P�z�L��;�7[�gԏ��l������F��I�����`�����A-~Y����GTF�gA�A�ݍ�(\T@�	�����2�s��u�cRˎ�D�1`�?��?��1s�y�<��=�:��H@s'CeE�M&æ�j[�?H?�Ff��]$�����vW��&��I�u_i�r���,\������d�	I��4�㩥eިd�s~t/YixVw�tV1�^1Vy9�m����G�XHc�Y�&�kn�{�?�	j#�.������֧�w$��Lƹ�α#�D?��,��Hz+R?��	3���鎸�zّ\��#�,���t.�C��eo�u��mP)��]��O@˼vV���S?�q�6J&�v��\>q;8C�2fmUX�-�L�	������g����?�s-�e
q�ku�B��c^ӉG���u��7v���ĎG��R5�`�S�yj��cic�a�Be��2i��7�f�i�����R�)"#P6�ؐl�HU���LEœ��#SOsbu�������ŝ�vlxq��)��e�鯚7���N��O���*haa�e�9�ֲ����a�@���e�m;�m��v�mK�E3.�l[~�cف��bҳ��D"*9s�H_����J�Y֘1������Q}a��.z&��BEg��e�_[F��jt�Į�&���l ,7_�,��bH�CWm~��(A��M����UWM�����Po!���$�%�9�
侽�5�YA3��βC�U����}�2����c��;�h%���P�B�rI��0T˹5`?�Jo�e`��t���0uYS`̳��=2=�9ˎ��� ��?o���w�9܎� �<O�Rf�-�H�`2-�"�G@��@_�����xQ�h?��7�R���B�֔xt��=���o��qW|��� 嘖r�6�7��֊�,A��h������_?{��i�N����m8͵�����""?
�,>����3���������G�0�;�sv�u&/��Y9d�y;)�����=C�̆�F�ΐv�1����L�W�=m�����leW�#��"�DHG(���?d�`��M3�{�"�{���*��&�K{�Y��%C����rڸ�t���<GL<_���ౌ�1�#�����	���,?�mU���!�kH���Z��қ���H܊�Vk_�5��#Z��>�U�[)}�~�4�g=V�M�TPj\6�r�fC�"g�r��ʱm�0B�r)s������p���)\�AbfTx�ɟ��Nm�;GQ�(�W;)��b. +]�B!ݰ��폩��~Sc� �TT>Ut���a�^���-Om
�oИGT����,���G�!�tA��Vfؠ/�1wřs�+#�S���'n%��]E�$M�tOܼ�b�z�5��Qg;��M��5Hnc駱Lx�G�h���,���(� Ka�kv��9��2r/C��t��a]P�r��}+�5�#������aԬ#3|0���� �Nc|c�Lu����a���@���R�`����ԉt݉���X���XXJ����yں�e�Okg����kA�~��8ǭ��������G�O�u��}r���HU�/�<Z�B�|k���ZvOp���=61dO;
��Q�h�N�t܎=׶�X,�Z�n�ţޝu��vs�*���3M�$jĳ�\����[�	R��RmK7�0�뀅��J�ar�ܮe
 �e���~]7���-O�e6��e͍�6.������QF4�ͨ�P�$G���h_�ho>�ؽ�V��F�8ǣ���C5H�-�#Ӕ��;�J�z�3-�T����0)"�Y��"Xx�x�8O©����$He���0��sɞ�'�o��R�S����/o^���_��Pȉ��^�+�X~'���=?r���d�LI&1Z=�d~C��̟�ؔ���OrP0Ep-"���"�~w�"�$�51����z�Z��p^�aҊ�R������Hg*�OA*D�lL�Z�K�ȩsq�t��j�¦��kd�m���l\^���,,����ǰ;[�y���pv(q�:���R�JS�#:F���z4�uVG��X3n�2D�<ȃ��O)���ɢ̀�x%���/�W\Z�%xe�k���$5�}5��H���Ɋ`!d�o�p6�E	�~�^�	П����C^�x�h�[��G���O��hHp�D!�Q�e�aٕ�^���#jo��G��r?_�<~&��G���g���%v!���1>�#���6�>��;V%�mph�7������o�}Y��R����9��k�C7A��E�cC�D�1�t2vF������Q�7�ex�o�Y$m"��e������V���5B#*KK�09���s�<�݆�M��6�\FF�BauB �uh�c0:��v	��W/^�Z+L���6!+20��!+7�Wx(��92��}$J�m5��XO�cU�=�yѱP�_ 	��Y	����W,�C�����tR��:�w�Q���v2-}0֒m�u��8�PI�s�~�'�R[lr[�; ��������N�p��pF���)�5���UB܄�?�2$.�l������Ҝc    �=��ݵf�j����_���I#��4Ŭs���6����#��)RX[=p��j'A�f�Tc* #`6�ǩM�auG�TT���#�|
e���\��w>��]=1;!E�T��a�.���:�c��K�D辉�,���B��'Ȃ4w�P�2�RJ���Ȫ9����}Վ1�W�*�Z�a�����{۵cv���b�Ǽ�����w*�L{����e������cK�pmY�jTG/:G���x� 
D2���2_�`�⩗���Rp;���漛,>˓s(�"X�y�$̄��m)!�$p�;��mx��H3;.<ً,�@����ٶq�1��m�&8f�!�����k�E(�2D�8��/ER�d�٣,�)2��S[a�/�:	�(r?�E�Y���L}W�kx
��}�{gO5�'�Z���'�j:!5S��&�Aw$�@Cv��n޵�y-����ަ���nӔ�Y���Z{���ގ�V�Ut�G-0��;�ǎ@尴߼�^��O�(<"��`"O�9ۏVa\���-����-�P����J/[�1FF6�8����>�cz�R�!%6 jA����c{D�x*y�NN�H��q%+j���s5������R��,Z�X�6O.l��/��o�}�"_�-��G@���%��u;�ũ��scE�[lqP��M1f0+X�q>DS#��������[�W��:c��xt�9�#K͑p�/�j3�as�Gy����X�]�	b�F�B��>e�}2��<O�اp��Z<e>bs���MbADn����ֿ�J뵹[��FR5D���g?:z8�3w��a"t�t���N�Cn�&���΢�/����I��3��o� A�fW���e�
U]�e����]�i�����h�4�KM8�G�fV:\M��f�v{��R!��a�Q�;��j�2���	�:�90Q�	Ȝk栂��s5 �6ۈ�6h�a��Gz��}*�ͷ'QB@�O�<�sy�[ipI)�da��d��� �2G#�n����B[$D.��q�Ei�U�)*uhFb��fL�[4���BP�+E%�UӨ���>�tVh���a�����XfM���{޷�u�X(�s;vGb�k(���6���+��H�9@a������ܕ��3�U�q��z��Q2�<V��t�	)�E��Ă�T��'o^P�[��	�t��r}�$�X�1��x0W��r*P�1�k)Z�3�ߢ� �5�ܨ���:�1���� ��l�����O/u��e՝�|�ww��W7w}����Xo2�.s9����L�v��x'J��� �A���s���x�	0Kf~� %B��Q��gt�_������I-�,�$�|�O�D���{ߖ?��#+�o�����7?�B���|A�e4��Tr���bŁ����Qc��HhlmZ��BAy+VZ���Jh��0����<�H���<A���\�T��<@폃_4�\<w�!�Ă�rY�SyP
�����}��y�Hi0I�Udz"�8_CPOs�#X�����p�9�����I�K������)qLiň���gg���[z�q�ጵ�J��+���k[�_��'	)�׵����u@u�\���N�z�2�=�J���	���Kl('�4dU��M�n�@yT�Q=�qRu���Tr�2Ò� ��R��^"�%���
�L� լ0�nS��&w����B���޲�G�1���^p�_W>�vz0��a�Ǵ�Bp���j�q,h��=�* �î��K��9�ǗQ����r���e�G�0I1�|��۪�fd�8U�:�cc_�Yc��G0]��^{�4���JNʅ�ّ�������r��9Ǻ�iv8����r<�fP痈�Ơ�rPM��|,L��4/��ӕ���a�?�a9}G�f�i�F5Y���j�s���kU:��<K��2����A����A�T�/� Jc`���|�q�[h&�a�(Ȣ$:�|Q�u�26FSe}����[�]�N�>�$�ÏnAg2>���R{��R�A:m&0��m�)���vmݍ�-�kQ
�4:�W}Q�`����O�lC܊�w�.�%�BR�� ����FD}���X̓��i2qm04&�<�p��*����J~��`ۨ�Y�g�����,��^�:��L�H� }΂?+�E)����'lʐR�����]�|	*�u7���'X�Qp��~�v��̿�ݕ$'��8�Fj~n����L�&�d:�3*RE2y�Hے��gZ +�GĪ+�=p	�ǔ�ʛ�*��-!��`�V��&q>6�@��H�1pe�G9(bgQ��i?�H���~�X�!����*(�d�Q0��M�P0B\-8/FSYt8�����a���[U�qˀ�������ݞ�8�3d�Y�[�( �	�<X�D� �D ��r��h!Sf�"��d
���1� ��O�`= �;M�2��ԥQ�U	����� �u�6jC3��`#XߨX }��*�6��'lv��-�+cx=Yd���f�3�ZuO�y�J�����\ԩOզ��ÅF�{^��Z��,P��Xk����ƀe�N���[�e��}��0\�"�� 晳N|�j�&�'��u~ɬ��.�:q�P�H��X'�,�0<Ә{�����ؿ�����3Z �],dOi\�l�ڴ��� ���߳���`~9���Z��`!�`[�U�/ؠ[3�6ڕ���i��[J�muW�&�q�nkB��� �B�R�PU�[�K*�V��B;��{U҅	��M�ՠ�z�小��B��������j�=�9su�Y�z�M��?�������ƅ�~�B}*;����w_��rV���H�O�<N��f��3�;-"�g� ��:I���z
.s
\񙋜�$K�:�!d�d$܅ӱ�w����J�����k|܏�0�&ݥ�g�<E$�#�ǘ�%cq���K���x��&Y���#�|��@}�Hf�ci�A95����L-�4����0��%�{���ÿ/:8l��@<॔l� ��$q�ɉe��װiI�����1,#r-��q�e���O2P�џ$>�
 ��۔��g����U�7Ɍ4�~��B��d?pt��lh�P��Qom|�� ?�I�����z����zʩ�0�ݳ�B)���v,\,ؕv�����ߺ�ƶ�3�(����LEW�ni���?��~k1G\h2�M��!2��4A,�xٛ�z�B(�+��2���6�ׄA��}`=Z�qz��N\��:qx~�����X�=��M?����ܯ��A"�p��'�z{�	�,��8�#��@Z�+���Ip	�J)�ԑ�+*�@��4j�������Bgh�# #7�{|��,�,K��a�ZL��-w�`솂Z�kY��eq�P�T����L�6O=0K`P��|���+�ҩ�~LP�Z���q;�w����z��=�{�iChaȱmU�"k����Ve�Q�`Φ���^�NL�������V"@|BS\���,yZ��5Օp30(_�i��y��	 H5|�0��M�-b��8��'��HT�A+�h�8�F�Gbw�}�T��Ǯ:D��7C�@1U��cB.�A�NDr���"]�'s!��0F!�D�(I �1���a�=F��x��(�X�>�9���s4]�	5�9��2Ky�i��_K��vZ؏� e����3L���m����
d�{W��.���u ��� �r?��C�Glv�~-"ڙ�#�`�AN�#q��xγ����:�'I�2r��*�~��Z{x�A��������H+�^Exn�'��Ѵ+A|��	�ŁFJ ��ŎY�Ӧq[w����@�a��� kʹu���A�^p9eF��B���WIυ��=�0��Sf�Սo~�{W39$���O�;����4����(��6�$�X�� �0=��8�"\�����㛦Ēj�	.I�so���\
P[/�f��h��b��x��
0nP��_8`t��5(CO!��R�Яi<�=6W�:��q.��� �  �w�����iY	j����Wj,��,������A<�s���� �؝���+7��\0�����uԚ� �W5��K0 �<C��jP��U�Ṯ�(�a��Ǌ�R.̰���@���gm���\r뷦eD5Z�v3B�lyicj�笭�J�4�p�a�sZ���Kg_3p��3^�⻬^�����+/n�u�~c�&�m��ֻ�qS��f��Ԕ���wՈ������!��ʎ\��J��,x�i��_�g��g��.�[�aV�k2`1�Ɍ�m&��K�^(.�*r�eM4��}�"gq��s[��x�N}~��A�����z0���w0����9�@d+�i���b���TQx�r�N)X�A��=VTt�c6��%�,М�Զ<5�A4�.nL���ʺ��%U���А�f{Ύ����o� �g����U�i��Kc��q�gIdb%r��k]��v`r�[d\SJ���f�|l���g�}�����QU��ɝ�f���s^n�$Kɷ�B��]�-�X;k`jt:�fdC*�~ PvX�=�BQ+0*<�{�"<>-է���[��v��]�@p�~���,9O�B������L�pgs�߼x��e�����u��䈏x@�O�KSeņZ~�)��UEu��
��מ:S;��3�!���y�����^u,s�c�DL��4J�М�uq5~�"���6�P�������6�h�s�mJ�c��EN�HAi3�j'uZ7�o�i�C�kX�@�e�c]֏�*���j�g@�{;ގ�.���&Y��F{0��,;�h4w=����|���H�� �S1��&ݒ�.D�8���	L:�4�+���W�����Ѹ�B&����(dqs�0q󪐝W![��.���2^6�d�,�XT�����Bo�|�'o�`�T��{���ƒ�AA�+�5�sGT+����J@h���7uӄ�v;�ɋnD�a&�yz;::�a�H��jN�0��2��Qۅ�rj� ��P;2�@��?w"��y�ѡ�j�O�6\k]�����,�IW�e�|d]T#���.��bcd.f�t��i�ɖ�z��&t��T��c���T��=ð�	tѨ�Sl�IbϘl��h�$�x�?bF�A�����yn+a5�'H��rq��rv��3��,R|�]�!�R'�䌮��]��]��2��� �#��F�2�ӕ�n`�'��d����ᗰ
�+jP�
]rQWJ�V���8�j�j�8�װ@�`{�ک&�鈴�N^-�	t�~�d�z�bĄc&�����ޫ�I�s�Q�F�''[3�QyP V ���l��{l f�6=��G�*8dR$�����A`+&6S�!�S�Q��:ݖ�0�@1"��2���G��҈���=�vg�����+�- !E��^��q�	 f���e��1`� DwƬ<�H�^A�H�l��i��+t��yN#�� bT?��[[��FD�����Ԯ@�Rx�ah���O�Z�[j@���Z8�� _q���5��[��&����YAa���t9_�:��!`���F�$��>�-��mk�=3���
�DF%aM� L,#����I8qL+憏���3�į���d*��6	h�F�}���4l=�P�e=T�@�`t�;U�����5�=�vUT[FC���.v�(�f�����ܬo1َ
��R�ֻ����r]�ݏ��1�˸� -�� O�q}�]�jx�C�88���2�2�+�&7�-�!��<�4J�RQ�����zt�� &B�B�x�����TP�0	��5���ON��tn_7�K��Ow@��ʂ�]��d&�ZJ�)�/�@�NM?��~lê ������]����Q�
5M�X���F����-��l���v�0tWvx.?��T�a���O�#<e�)�ј<��6x�,L�Y#�T�0���`�7/~x��O��Y��'PF�����D�{�_�D�'�Gi�dTeX�ۊ�9f�FT��젯%�,�y�yK�_Pn0�8���A��Ax(Q/�g�z+�[6�b�<_���Q�ӈ�����+D�,����BV<=�Z�c��&z:D<���������q(����UE0X����s��FhԘ��!B��Ƹ��p��]�d��s�],kEt�0ML�ͳ��*�*X�KtB��{o
�1�	���B�	��1�8�' ���,L����
N`=����Sx��D�IӞ�'��9o��tB�eBu(2|�Qz�h��̴_˓�6��G�Ȣ �م5��<��Y.r��0�n�0{t�n����>��Lb�)	s��'��m�=�5���8r?��q~9����/�8?���L��s=�o~�0��{M"b΁�P�,����=�GV�y-���#XE�X�u.ϱ�D�م�G����%(��SO$�h�?��t�����Z�GI�~��p`���mS�sǡ9�< ���Y�����jV�a�9y����e��A`�w	$m��cO?)�K��ۡ'U|�ٖGrr�b
Iw���G����K��q�p��Vp-��p������Ӫ{��%������Vn�-����r�U3"oC`�0�pm�[9X�㢀�L���n[Nf]�O>q(dcJ�:��j��)9Y�^�'�aF�Ozƶٳ�����V�$P^VL)HE|>�x(�:C�jH��l$2 �ȃ��Z�$��w��1�c&���y�S^�/<Y�g�C�)�1V�×�H˲*>��vS5eQ4��_�6Ey�P_���3�$�79'��l��ǝ&!�Q�?�0���s�k"1d�n��2R�^�^ؿJ s�O9�`&�&+�K�\_��6��QD6!bp̶R|�}��<�k�
.t��f:�#j$�x"�@c
1+�@��U���x���?�eǮ�֍� �ش�+g�Qr�j��������v�"�`'v�^$mB�|��vch��G��0ʡN����I[�� �#p'����4�!+]�y����,      �      x������ � �      �   �   x��P�JA�o�b��F���S�*�X�L��+{���=H�<��E*��n_�M�Y�2��0��z׆�����aj�!��5i��y=>o��3�vE]���\@�0��=����^�ڲGt3@
���M5�n����5���"=	�y��zd��G�s0؀z�d������U�I������.�"d��\���*���՜�S�8�"HǿP2uH������F)��6��      8      x��}[oG���+̐�E/�H{<˦h��Gc�;؅#�2XuVf)/��E~ݟ�� �˸�0����@�?�/�s�Kf%ϥw�EVeF�8���{��7���7�7߷U��k����+W�6[�:�6/3�~c�TWT��r���}�����3���k�ua�If��ҺW٢*[W.�6kܲt�naZ�e&+L�޼Y�3۴�7-�%�->6�]�dVgJ[Y�crx�k��,��iX�Ų�KCo����Eo���5���|�Ɩ�%�+z��4�wt8;�?<ڟ�f�����lz�`v2;��O_|z���y���T�4����a�k]U6�F��o���د�mf���}�<��GG�����Gw���3��m7w�k_�ۙ�_���������<�Oq<�ݹܟ�����I���S�o��wٺ[d�x�#�p�[e�5����3�1�_����÷� ߲����o�B�������b�_���Ë;>�������8�������u�T���9�jm	j��6p���� A��#j��5���f�� �������\U�gO�
	]��/�Ʈ��=.�xF��K��hm3��`�a�~� �0�ɺ�Z�M�y�DK���)ds"��UO��a�%��ȁ޺��Ug��ܶ��*��2����ع������n\���g��|6��+��ZSe�����D"Xl�����	�r�6`<\6m��/�pڰ���N���&��z�yY:0�;�����`zh��Ə�O�࡙��L84����c���(�5ݷM�:>;ތIN��ϯy5�����*x����k��an����?>9��pz�ދpzzx���,�����φ�۪$�OO�oQ���{��f*�
���=i@}5������?{[�.����_��������W�2L�ؗ��|�T@5��G�ִɧ��v�S;E2����պ b��m���qgѬk|l"�>���̋��Se��n����.�e^ ö�T���H���j��	� N�-|ڡfS��U��4`HDlP����l���{����^Y،%�Y�*KH�d���<>�|�v�����
��~�ZT+��A�V����l<�� ����j&�����J���^;C�3{��i �`��v��)㳀�ܚ��Q'��m~\����8�[��1n
l4�_��J7G�O"X�	�),�o��~1A��a*-����0�&��^�˫���|	��._�G��d]=߼��������`��� 7�!+�7��GU0��Ъ\~8*W�_Y�PBPa�|�W���DO��L$����-�
�B�����h
UV�EN\]V�[Ԕ�<�ׁKlP���=R�@Mr�"Qy-Z4�r��TAT^��T���\w�E}�,���J�j�P\�9^^�����F[O�ƪ�����)�X�)-|�[�-2�ч��%�������$=F��'�|;��GO�SE��G�O���� �b�!�y���c7�Tɇ�@2e՗�R>���haT��������S��2����D��!C�4�pS��`�EA�'_p};g����eݭ�k$�H��6YU/����:Aw	�T[���H zJ�sU�䅊�a�A��K���j�P�m� �D�Ct�5�s���'�ޙ�گ#	NK�$cA���%��M�u5�5:�Di�/��o�ۍ� v(wq�m޹��%Fq`W��7{S�~W��?���'7h~k�rp�j+Ӗ4��."�2��<�l�#�o`�ϳ�,�$	\���Xu�q�`-��p�ɥ�Ÿw��lǨɦMćoܫ����?�`���k$@���@�o�4��7y�j�q�5�%(g��%�9G�ǊsZI$�~5�`�
�1�0#�� ���4p��<�6������р��xw�+Yٰ8��.;Gg�v����.>��Ak B��5��KEB��I��;�e��O��^�^*6�6��p��t<l����f��7^a��z�bE��8���.�Zt1���R5�O�W���"�K��*�U��ͷ[t�kV�&�5\�<�M`ȼ�"0!b�_���7��_�Ÿ2�� -,��s	�@�a��V�����?��?�
��� (��@!l�O4B^������1ɐ��\����'<�jo�t�V0#J���e��Iy�`X/X��Ky(}f0�L65�x��D��8�T5��nx�Հ�������5���#.")p:*���&h+*��w���m$��Y�D9���`9^U8�=ă`��k�PP�A_TKK'}A~m_]���F�qT�A���#�cD���γ�����������-a=�I�������|�e�������``{oˆ�kdrUd�k��4�U��Q�j�3��F�+�oP�|b[Գ�B������'����ӏ\���9p]��4�f��g�^Λ�����r��j��������T�~v����0z�<v ��+;?�h0������S�.�8�Wt�=݇�>��(�?\Q\�.�$�X>)�ˎO���.e�l}k]#~V��A���|\��'�KPH���+F�z�c���g�_^�\�+��%�;���w���@s�+��g��jz'>?�V�k:S;���.�ɑ}`���^��_��m�����'��R>���^�?��|������̇�.��9��6x�^搄�&��-)j6�`S)�``S+�EP�Ȕ/�wU�@d���gt��a7`� �]:x���;��X�?��I��W�����4݊�k���aD��R�pA��:@XٯU��%� �J>M\@e�k��
a q�1�gў��mUd�J�X��+-	�K@��<I���G��g������C��ĕġE���S��nj�=��e���`�x�em�81BϺsR��E<�.��~�Q��u�����_ʹ�������<�W�JY��Q�Fi Q/��QfIC�ա �
/���;��H�	3)pHB�Kibt��o������S�P�@d�/���5|LW���z�r� ����ZNk��y��<b�9*�k�N-���)��ڿX�Q�oހ­�h'��%��<�M�y$�?1�m�ʏ�;�. 6��S�FI��4 `�E�ĉ޾�r|#�y�}���� �@B�%~Рr$��q�m~�%�	��L�Q6#^4L�g����n�`T0WC�@�Q�rx>VW-q�~m�sr����Z�-	x�mV�n$VrH<�W���!�-�?�u��� ���[ 0��#ؾ�ħph�� w��LHr���O��ʍ���X�c�(%Q~�\�^JP��3�F��$L1�,%��g��Y��jNr�Ng�y����
K���I?�f�E����w`_j�=����`Qh �jμ�N@�q��� �a�C��S�W�����$Q�qF�~**2�(% 2_�@=Uu����n�q:�u@�� *{aJ8sL��޳st��4���0
�W��V҉�g�p�JD�Ne�N���P�����'b�1���l���՚��-�C(���E=���,���l��5��01X 5��SI >���ݼ!%[,a��ǜ��M��j�TG7la�قK��,=&��� UU���o��~�I�ι'~���d �TVr�U�IP`T'��"�ȷx���[��������[�(/,dkX�G�JJ��+�����o0N� �K����R ��5��2�k�R�!�6�e�OǑb�ףa�?j?<Pm���<���	nm[��:A��W�U-%�ĸʺ�<�s��4uN��j�:�X��%�#J~'�r2�#:�S�n���?���*��+,~�1�#�4�1�2LB���������-hH�y��!��M�=��'v��j�wS"��s���s�!Ɏ�22��d�LQ�硑��������E�V�o=
�ʕ����ŬM>/�}`�ښE��7?�s9�U�3<���q�}Z�rVS�t�%���+"z�u29HT^t���    D�F����e/�O9G_/\�D�i";4�6�^C<X�x(+bX��^q3]Ό�R®I����D�����I�7���G��D���s��1!�ɠ���w����R-��j�Q��j$����&�v���i�ߠ\W�qo�����z�}F��Z��k�w�D�xJ�o�7�"B�[������+�Ǻ��M�����v��j+��F\O;E�6�t�� �Y��~�����@+�J�X��u'H-r����0��L
���8��뮤@��?�K�(��|n�D��&�qYv�F=/�y�f\#h0�;�vIg�����H��J4bB���֖ ݸt��#�� V7�3�V��L�:���y��5��O)���"�@*��\aX8"P�H�֛+aU*ޯ9U��G�) (��%$ ^�`��*�B{B	-,�~Z8eA�I���W7�`�Ц�l�n%���h�p�L�c*$���o(�����6�=�������i�]�1�2�<�b����� J�	E'�b2%�]���EWo��5%G5Z�����S�|w�X̿yBf{��j�҆��'6�=B�����Մk�rC�+�r�<ݢ�k"��/YT�x��(	f���<��?�;q�+�?(܇�[���O�	�P��{�V]��J�w�}��><	��!K �� �-���1�O��kX'����$>�j�*Uᰓ�4�~.��kp�nZ�r�LM��a8���?"�w�s�Z62
��D��]ؗ�]������m�@�k�A��,��
t��QHI�����C;�iLѵ�m��$����V�y�n�����ϻ�\B�
e9NA�5Y����s+ND}b�`�At&X��z�n���DΊ$

b�jY�R/(�鄡�읮�wHk�K¡��Я�"I��?�$�ƪv�.p���M�Q��c���5�C�]4!��dp�#r�  x����eyZ����οꝬ.�!��k�^W��S���9޹ĴO�h���ڤ/�T���ەmR��#���Y���Kd������!��].JRa�{�ݢd�%)|=�����3�5�3�(�H21$�yČ�hh��j��q	T�[J��w�{��r�gLFz[N��e�%J� ��a���f������s}0�8���EOV�k�.���vr�g_"��J�<Ԗt5�B0y�aAn��4*zy����,"�����I>-(p�*��#b��16r`>=�
���x����0O�.U�#J�N� �W*˺*
�߅}����1XU/���v8�NC>��ǔ��y�_,:���r�\�b�:��H��C��dVοx�㘷^p�nZ����`��������N��bE
X����i�!�P���c�u&�JI�g�-����g���1���fAL��D�}F(�p����kH��aR�u�D�N�Ռr�%M]UX��!G��/�Ä_H��~v���sp����X��4����w�&�v%�z�B�\շ� 1�W��Su�
�f�)�G��1��t�!txJBZh4�?��R���:�mB
��XF��A�L�@B}b�Z�XИ*�l��-<4?~���}�����w�{,9u�R����h��$�a!nK,	�,��W謴���BH��W̨ρe�O�܃2B��JM�D�ߚ��J���r��}ƕN|� ng�_�8n} W��$e>��c�Qy�*�rn����U�ԏD6�+L!���8QK�ZA��o��{2����J/W�K�Z:D҈f�1E87��0� U��h.Xd�S2UcPw
J4V�}ի��2��,���d�A�܇���-0d%�;~�x4�/(㗑Yz�85�<����ҥOs9y�|�\���}�k
���&$��ϕK�7�v5JB�}Y�d�����*�1$�\&Q�T�-��+���A[1:�F+ʚQے��U�w�y�u���8�pn��T��pu}�4f�P��f����Bw��+Bg�P�j^�Ih��exJR.R�W��؎��DF&�X����\R�H������/[�(f���r㔟故�d�GI����z{v�ON�)��	8�V7&�ʢp]m��Q_��h-ݧ�
Y��n�B���)ٝ(k�HM��c |Pj����r�]�oF#�'��\Wj�U�>�NY�BJ���.@����L�^�����.v�~��P��ͥ%;�`�{��;2�C ܅GXLFs�'Q8�9+% ��E�f1ą�2�DAY)�@�!�~ɑC���`�Bp`������oV�1���������
�W�0=�T�T���(y���BuZ�,e'3R<�
e+,�m%�ک$�:�#�h��r:����3��-���x�KDִ�%}b@��Qh�:@xv� ��V
�\�H���ݷ����t�oX=�ςWϰ#�����A�O����m�x|o�Ҥ� �R�m1�^`��'� �]ՙKα��:W�m��y�f(E��v��W��K���u�.'K�Y�h�x�+ex�#}W�*ȴ2d��1�❍A��9��� �V�L�U:�Z��:�,�K)�{$+���G���!����As��k�
l$1�	���D��K��)�>��7�_��7��G&"I�00�L��h
��`�
����o`��n��4	|�F�Ո��d;U�XU�l�e����/�����,%���E��@��CXH�z���w���4�-B��,lA�k�c�`�i@�$�A�f��8�m��KI��O�}2d�7B����9e	�!��Æ��dl�0!;��]����P؃�'D�:�4C�� b�q,u�sE MT��9&�%��DYq����[���B�K0B)>�)�x�����3O�&���Iͨ�gqN�(Qy:>UYՓ�Wg�B��Vzj���+����s⓽�Iijz�Y6�vLE���$�B���k�#�#Ը�Tl�C�\r��<�L+��Ht�͏&��	l˭�MH�Yx	�f��u�v5�W�H���}z#�*9����'�8�M��j��>Q<o���ܣ�]NvĮ�~�.5� ��JG��xi&O�� p?�����!��0��1AV+2�0����()G�fj�$��&J�����`�0��� n�P�)�����R�뿝�QQ�Oؤ�f}5�FΟ�C4�G�M5@h��I��;(����_ ���%�6ǔ�w��ΌM�?$-�IMT���-� �l���
X���IP��Po��G���(�%"�3��[��+�PB)s�"5p�<����ݦZ!ܕ�n������gPq��iU�<�Ƀ=m+4���g������/�[y�-������o�������Ue��0�8�H��$�7@�y�FKEj��y�4��8S����2.Ԅ���m���?�>F0	̱	E|��$vJ���`��Q�	~�0�4;Л��Z��i�v�2c)�������.'u��H�c��:\�R���i;�m�P��2hy�����쪲�tt�\�^���C#O���(C*�׻��n�c�|�DC�<|79	�+��HIQ�mLn)w�W�Ηd�o��mAA��L�Y��m�'���� q��rX�R��d���I爐Cy }�Kky#O1��$�����n�z-��\sK�G�q�e�+L�z�o��I���3iO-���Ȭ���2��9C]���s�/M|IE3�+&�G"ȇ��I�W��7���6毰��t>	N	t���Y��޹���MT��-V��n��| +��h�"���H�J�q��DnX5~H�]� �Yg��\F���QgD��)L�y&���lE�+�:���j����X�i�����Ԇ��bI�P̷�X�;�ɚ�<�lL�Ү(ѹ`�A.�Ph�Q��pյ�;��LO�5�����=H�<�9L=1��r�:����ݕ���8[��,eQ�z�"�Y��&��o�N�Hi������:��^7�xG�d�# ѹ��6R�i����
�E�-�� *`��O+
�ƴS�"��I�M�!R�    J�^Ya&��a��k��^o����z��-1	}�z
\�Ld��f��v��{\1�9(.@�IR��ʸ9�rI�":М�Q��$ua8]D�������x��53�������e�桮�I��
��6u�B���Bk�}^i��D������dѸ�����	FV`�@r8��m	y���'��[�.=��TIs,�ť�/�چ�]p{!�Y���;8��"�(ߚb��4r��L=�l��t��T�g��W�FU����]<B����C���坤�K �JOR�^-
��}d�9 v�i�G6:�4�M�hW?be0��d>N �4�3UI���c�#Lʭ�ř��ט|�x<��	�| �Q ��� �L(GWh�nً<Fi��p�_��J�n�r��5�3�yJ�@�_0,�Ha��D渎?�,ƚ��� (y�0���)#s�ƭ%ܘ�%u��+^�.W�1Q���X@��a�ԏvcͣ	<����ۯw���5�:�+[P鱢�x"��Ù}�� 2\KE��-M��(C��&����_xk	κ�����_YAP��Rc�I`R8��.�h�t�J�'��tR�����idjۡ������0���� ���|�2�e�m+�}D��Z�1 7H74(��&�hqo	Z�\��/%Qh%�%Lu�a12=$��~�wA������a�	���Pq�L������2��R��yz"���7��U\�pqf�A��{&�j�ˇr��l�%�܊^�W�`�p���Mh&��}�%L4D���arx.!��]�@2�O�A �k0\��WϮo^y��5,�=�����a;���G�o{��d��$;#�.d.��`��}X�Z��`>�Anϱ�R����k�xT!G����GU`�O-TV�F%K��ם��%%�7��;�ȏ�;:�f��G�Ϧ���A�����lvt~����d�������{���{G���_F�������/?��*�<�����(��t7�� 58)����\r�,���C��{����ط>M㈀2Y�XXj�*�7<�����wRgc�}O�]��h3��H����֬ͤ�6EE��Y�����\�C�pM��[��	$M�F��^m�߸��%�.�[�&єv�#e͘.~ ou-�a��DK�%I�=�@ OY5h��zaM��5��BL�Jl�1�8�x�[{�0�#AQP�#�G���Cjm�=2&����Υ}I%ЍĘpсw��*pj�:�&��g\���4�b��h���S������˕ �'i|5Xq[Ɉ4҉��w�~b,��[x�'�4���1��(	[Ķ��ߊ���v��>��W���$#A(����ll��"�x���j|0=<>>{��!����ӣ�����������f��-��Tr�%�ʉ5.5�m�0?ƭYqN�i�q��~{�ȼ�&�9�^���N��{(M���+rOQ>.�Sx�� �6M!�d��d����?#xӶEH��q���n���
���CJ����Y���i��~�<��0�[jO�j�2�B6�Hd��������8���Oh�6�5�y�mW>3y��v�\���V��P:Z��T\�d ��{h8�OnT,~��4�g�~��ϯ�2���?8�5=��k�>��z���>~�h��:6�(JUb��3G�yyG$'�EQ�y��,�s�aR�
S5�ۦ��
	aNs��˼ng��:tJR�A)���?�A����n(����e���%j�wH�A����p���J E�:�fo�{�V~��I�3��]�i�H��a��"��4H���7�Y���ᗔ�2:8�UHS�{҈��Xz��f�&"N�M�AA'�	���,��硸��F��?� |�����Y�0)7o
�8��
\2����f1��HI�� Cj�Q�A�����>4�_a��U1���6N�<�I[Γ7&*��
�d�څ(N��%B��=��BqI.��$��u^1�-(H0&qw����0��.����p��M4 f���=����Z����?9�U�����`ϓ^����F����'��lD?8��"쫵o���r*t�\/^��c0��5�́�>�B1�қ�|L:h��JG��¬����̸vaz{����sI:)!��'X��&2���Qۡ����-H��#��Ҷ��̓�,��� �+K"v��H��K'SW��T�"��"�hT��1�<e>@�(|0�%|>qK�3�]�[�֩T�$�*�yf3�巘j��(*ޤ�#hA�_��Q��ߢ�K�va�����E�� Jc=L.��@EH1�(��	��#�_��s~ r-��ʓ���K�G��;�������T�9����sKnh.a�0[Ig��Δdxiۨ�Y��:���x�~Oh�d�0��d_AD*C|�KS��jE�������Ֆv�̶���\��I�aE��٦2❍8j�%m�f���Q\0�S��{��k�����[�]��(���{���������8�K��F鎱��|v�|s^�&L_����k�өbM���	�c�Eվ���ĳ
]Kɠ䃱��,��N�xZ��w�!��W�WL��{���"�����7�f����X���!�f���҇���>Ǳ`�4m%��Mqz��7]�\ѕ�W��4���l��}yX����8�o���Z�m����X���T���؜HE�W�� ��sᆁx��E��hU
�?�����0%vcE������F����P}���Dq��^Gs&�(,�m���2tE,�Ŕ�����'qK��%s�վ��}��Z��%���Z㸩���M��4X���w�����>���-��V[�=;a��C��(xn(��
T�?���$�!ӦD����:�4-�8_I��8\ěG�N]B��P�IV�w܈� ݤ0I��qB{�lڈ<,�W+_3d"����ȴb&���sS2`�P�y�m!>��J�X*�� �Sx��YV~��ݦ(�۱C�@�}��>��'#����'�~�5s��P�rUT�ڒh���O�����}��+C���M�h|��.�k4��2�W/\�t]�'� F���ѓ�I�:���>��©����9���&��G�^L�t���!p��)�q��@J�Ud��څ9�kNl�uC#�*z0a*G�>�Lǳ�-��M�D�&QE��fJ�.���~��wg�����ǓDy�@i��gO�z�kN���]ף�D��&����d4�|�D�$i�#��ޕFC�&��Xu�^�\k2��=Q��-�I��o����;�>8���8K��R4E�Y]����W�.Z���y�$�&��2B���x�j-�,�]�$��P	�� ·����\�K��vk��j#4ؗ�)����P�).�E���L���v�")8b��^���d��Ɗ�I�SWK�:U�Hמ���?��
9Qo�d�v �`w)��(�/��ɶZo>�V����/�״������՜G-���jx�s�~� N����·��ou[��0�Q������������Χ�9P�op�۫�M�*��/��>��ᮏچ��u�캴ĵ��^����=[������s|�^�?�kܥסh ��I��fM������L��Utŀ�u�i߉$_$�����`f�V�A��\Po9�`��;����T�=�i�})�MЃ��d�p��HT�k���%��y�đcsƢ+��p�x�Q_��*�B�ɠ)4F�c�2V��*��z/�=ÛQv��N��0Z��:�$�'�g�)�|�S�g��00W�$Q�N��3�צy�.C�]��$���i2IDjcو������k��D�~O��
�|^�np�[�tb�����`�w����ٴ98
�/�����1)=��*%kl�!���y�&ѕx/#Y�� �}�X|�b��m�5-��j�GAz��_K�^�`_��؊HT$ⲋS!��U������%�X���yB�
��Pq�6f�V�}�0Mڇ��2�s�D4��<�    %�I�[&%֚��	���"K2��Ϧ�#�I�v����g�D�Ԗ�Z��KF!��o(�-z��W�t �v+�n�d=]��dՏ�H�;�Y���L ���˓0�Y��h��o����'u�⩌ѵ��3G�����P��ҴX�����c��Q�m�m�Ml3��@�
�;uJ4�W(���Ϩ���GNu�D�}��B��	|xx��d6=9}ptr�e?<?9�>8E�Խce��[���+���k`ix_|�]CԌpѧ�]-0,�4"��>����i_5X�v�q_�s8����}�tQ��ߨV�O�NU�27u�����l���U�^g�5�a�@7Wk?
��y����� ߷L��CU6:$�������ï�7���߰yhNG|R����>US�l�QM�Ե*��d��L���{�X	$W驕�u|l��|����_�����״�᫄����g"}�P8�(_��M�:BJy�k.:��Q'��OX��j@�ғ����e�s�jBS��m� P�������lDrON�����It���&ok��6/�މ�S�[���5��d�zP��nW�q���� ��N<4�{�y  �R��GG+ᵫ2s�	�^�h���`o
�_�K�W�(��T��i�j>�[�D�e���gD��W����A|��P�%����lWOc�SE�v��&s4�Z(���>e���b��<-l�}�!�_� �龂�Fq�b�Jm���j�������x����Co�T�fs�z)�h]�kY�����"�2�n�9_�;�I靻D�[�	�a��m�w|S'�����"�k���#�! V$(N�^6&=@ln:�٪��\��7�K`<��վnwy?v�_u��<.��z���/J��+��.yfnCb-��ғ�'ԍy�=I�*H�*b��.�'�D���.fg�Ӈg�'��f�q9=d���~�R�����yF��4�6���EU��;��WA�M�Yy�-	 Y`dpk�6u9n����C*C��*�f�������hzv|tv�t��������C��)�-�K�i���o\�[��)�8d���:AZ��rߣ;��u+�ĐP
�����zG#����v����i�1�E�m"��p	)�y�k�\�/c��tQoR|�����-��v�#Ve$��	�hN57��.4�z)�R�3z�3�i�X��ċ�t�A�h~V<�X	��!9
����<��6���p�������$���N�w���+O�]?�X�������} ,��[��[�1�2��ZZ�1�� ���7?����Ao��v�p��Z7b��~x���z���P����N*aI�Xz�Eu6�Fz�F?���^���Wx%�삲���͛&��V���i�����s`�����~U╚���zw�nhw(9�G$5x\�iz���pyJߟ��!��B�bzc��Tʚ�r()V�����D&ɪNg�v\�H�_��������X�<S�m�3�$���RSl�=F� �g��ƶNN2�N��1����P(Ч�wJQ��CӏT��,�m(��@�Vb�IE�Ϝg�G��!۳p�]Ĵ,�z��ş�n��R�/#��J�N����!>T����Ka2�`���%�<��ց�� _��tH$(���uBL�
�̛Az>�;v� |ͪy먵Kz�k}��w�{�G��)�l��q�
��Ϥ�����B0�}|/c7���:�eJ���T�$��,�i��e�Oq�~@>^���e�2k}�W9/�T��8Z���*�Z�q��ʁ�)M�'A�"�i�8�ԙڔmsS�=_��H��jr���:\����y�I	!QbG~?0m�.s���iů��qK��禧s��{�����tv8;9=�����g'ӣ���{���wN�Ԭ���?Ǟ��?�uq�Ɨ,��Q�\�� �t�	_�KD#Ō,i̒h���l<��V�"�As��6�ٱ��Y�S��|��7�Z��*b�B�;��1i�(v�1��,j�g��dc��%N��W��ֽ�a\4���;��_ttYT��¨�X�F-��ڼ�;nÃp�!^��	���x�9���r���<��o��!td#�Y���;Ɍ�U44�,�nqO������·����U�a�L1�G�+�ѰIDEC���awc�*.6�xŶ����鲚#��OE8 �|xx0;>|p|�q�̗�2�w�_<X<8Z�=|�?����'G��}c�ݿ~�8�o�ggg��[��0�"/�U	��bb��gM]=}����_���E`!�� �X�O����]�������/�ML����$)M�0m��%�Vj�$�rr���]�W��Sږ�p��t� �<�Z�X��n��+�)m>�y�Q�"�;�0��|��|�zLk�v#����6L�#�ทIajRȓi�k̆F��<Ё�1�����(&�["{Q]/B	ڕ�ehot4���x>v�HC�����u�ud�7������I?�s,�;�h��B!΍��MCEǏ'���F�
4Q��)�2�h槜� /�X�\X�$��F����v���\X����pJ�L��1r5_�r:�����iǆVtxdE㚙 p�Y������V|sy
�����g���zN���(ha��n�\"�"��y�Ք^[���>���v|u���d�\�h8�f��/�����eA�ˬ7�-���l�[�:k��LN?eu5��_��#�	�K�}J;t%E7N��܆��έ�d4�c�0B ��2�
����ԅ��~!H!#m����9���wOr�r:W��}���ND�2��Q&���*@�L.�
s~���L}�
UG1Yŗ�7��Y��I$#쟜(Й��m�MIz�d�`��e���OYl�܃Ý_��Ճ�Z����������/o��X�?7�����/�o1;��7�9T���Y(/�ɑ=6�W��*j�x;�"�}�S�5`��~����Kg6p�C�ך���eq�?���{'��������b��q�5X�yj��}e^O�O��$Wf��}e��K8cl�-���./���Ó�I��`��K	�e���4��Ln���L=���խ�	?�%h�U�n*�Sv%����0Npl�4����D����MI~����m����x�R��Mq9��6|�g0���G�����$tZr惇��_?�ރ�ܧ�<�6J�g{e~|��/;�`u��=�KZ��M���D�=�Jt���$=?7�������s�Kx�㓃��C��,��}��:�8)����v{�v�<{���joΡ�ƛ���[p���Ȳu�bP҉��j��BmL� ��	Nct�� r%� ��NQ)�R]:�KT�VU=χ��bh"DR�s�^����H.��'�L�	&M�k�r�⍱x}��z/X+��Gz��)�*�[�C�:ꢇ��H�7�"H���d6薌��h��%慍�0�3}'۵���>��5_��������Yۇ݋��įy�ǝo[�E]�rz�m�A9��b}0{prrt����f_G%��ؕ���>"[[�����[���oɮ��︺�kНfZ�Kl(�����c��{^�.�}�u�p
�ﵡ��>0Ƕ5}��իw[�Y��L�D "�=h�5H�As]������ Xi���g���0���_%|ͩ�$�"-�iwU�t����%�ҽkr�γ�$��%$�u�$?�j�(Q�89�#���b糟���n��rU���7Ne��R	n�fU�I�X}@�P�/C�{��[/�j�ԁ�Q���Z^�z��u$;�/@~Ff���W.Q�\,��~�#�� ���e�`"��A=�Rh!��2����K�SBQ�[
��?>?:�1�ON�����g燧ӓ��ó{_|ʣ��X��y�kN��n�:�7����1be���T����\ڥ�3����jTj�+��!He0�2�_����U{�u(�w��}�"�fme^p�If�L���p�[h^��W!����U#VhQ�J
��ֆ�%�T�`�|~̣��FJ��6�Y��Z(b�h0��Ǝ�p<�p�6D2��(�e�}F(tq���R��9F�`"=�Z��Tu �  <�����c�qJ7a�U�X}���������G���5֥ӱc4���<l�Q6G�}Qg�.�=a7�-����P-I���%�_��?3�I=��a#�ɖ(���hOK��� y��SP�S���o4�$
B(�Fc�#��>���tM���
�V?�]]"&.E3ۆb�iE�Z�C���A�J�T6 ¢���k���;A�̇��h����^�X"���(Ɖ���yoF7�wH����	�#�]w5�]G*�C���- lߪ�����U�L`�Q��ok�r<�h�$�Ky	=�Ovn,��}8���D��U�S��>�X���,���Xrn���iZ� +���M���#Ȗ�K���t�K
�y&4��x>4�)#PQ���,Nwv�[��o q���Ն ��&��><9|^�6@>�_C������E���6ɉjO���k�)�M��a�^Q�bޔ!e�K���䐊���Y.F����h�+\�?͎|`���F�>x�,VƲy��F��f��<��+�s_o[J��L��]���5aAV����F?�T:��&=�d'|���0��Z���q/�9-�@v��8G${��8�oF�stx~x�����ar�������hz��ٽ�|1}���;�4      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�-�O�0���vum�|m�T�$�
)/3&(�4GE��?<�����������f`�����B�]��~s(ռVn�궓Y�-����l��<��|t������A�M����2�
�	�(5�U�*����"�1fɅDR2B���+W      D   7   x�3�4�4�420��50�52P04�22�2��321462�'�\��X�_����� �^�      2      x��|Is�ʲ��+;��Y���h�ә�'b�@�D���;}�7��;��U	7$�:wo��ZIV�*+3���Z48��c+�����W0����͙1���?��O��n���b�ltg lF�Y ���9��Z%��n%���T�����W���H����)����;�)y� B �� 7 �BX����OVq�#���H����� �b�O<����D:�(D`=f�8��>>���6;7_9��zw�~N�Ʋ�O+T������*5L���?�z���'M���A�HȣZ*�$u1!=���9�G�7�~��ٴ�O��t׍|q���F�ۻ��ZR�ʅҶU�N��'w�wG�{� $�sCrH�J�Q��A�H�#��J�0*����!ʈ�7�NǄ stM�R-9��e�V~�[��쁋�A�Hs�w�� ����I�so��wI��$�窻�'�mn��墼�8N�Ɋ/�G��Ye�|kO���)Sʎ�#Fg�K��k� q��瓘|�������?М�2�x��H�G%$����h�}�N����`R*f��=W.g�� b�$��T�sz���������[f�S�|��Z�̕7w���^�N��T��ց�H�Kah�+h����z���ȓ��S~�UZk��斯�´�YLb���P�����ϼ�����ч��i,N���Y������k1���_�w	�(W6���������{�����J����L���������}ϸ�g,�R0F=�oy������|��m_��0Lm���S-Щ�p*X�ܜ{��ퟩ���V~�=͍�͡����HwZ���iVK����[�ܮr�n�4rC���.ccnʐڑ��JD���01�A�鯧�aQծ'��˱20� ��P�͈�Y��B���� �g�6�]{�p��j��O�A�����CE7g�T�F?za���͵��W�_#�t"N�g [�f\8̌���o�����5�����n[���_���=�lN�r�^�ѧ�%�h�Y#���S����>��Y�re�)d@�w�0�оW=+�!�P�������0(Ht'2:"��Ox��W(Tl3zq���������ɈDyjA8Ip�QU`�~�����?���`U�*���a�A��^톐�C�J����k�yVb5#�)�9Z7��Ë����R����)��H���t�Q��x�c�j�s�0�r("Y#�'�k����2����DbFT�X������j��
(��3xͯ�C�G��_#a>4�RӶ	�md
ۢ�Z}naAH�$�Sb�����\"( ��p0�H&�M	�F:N�G���9�t�2���ј,"�l�yl�����	�ߋDL�<��D�\����g�@o�5,�6��a�����J!���E���`ʨma��d̡^?J�r��`�����I���b�:�НB`i�@��]�y��N-+���M����)Q�8ǎD�}B�P@�K���d�����H��T0p�HF���MN#��q�$�H�v��F1��u�5��ܽ���*��l�CP 8?'��H,�㖔���l���R3�'^�k��7�M���8�X�.6!�nB�r��ڞ��:󑗔�t�5�m�� 词:]��m�[�\��f���rð��I���K�{�ilӆI!0���T��#�7	U�����T�؀\�I�*�'�L�)��T�J(N�!'�~��Z'���|ʻ�19T;�*��Md/�էj�.{�D��9j��Ο&�(����g[��u�V���&j�~U>O��M�:��
#K݇�X���/���{�X���\C
t�2|�tc�>aD2��IP'F�H]�H�׫^�	V;��V�q1N�3��Q1�"Ǻ�g�?�O44���:(U���\3�B[wJ�����.��[S�{%�)��^uv�_�?9���5^����I��ԇ³��#�aQI��gFA4D7�rf��b�1U!(��
�A� �xQi<a��v
��b ��:c,���Zw��"�4��� �[S�/�*������������c��e����]�g&���gۅW]�i�κ���r?�UX<T���}�&*=�Y�T �L@v�t��KJWI�J����� G��N6ۧuO��^a���zO;�|���J"|��[�wi��i���|�g��f�#�F(�q��Ĝ��|d���������2� ������6ޭ�x��J��9z&�ak�g=��=��l�m_4�Z��mG�p�眩�u�P�X�:!�T�
1KA�\/�PIY�<W����i�&V	Qj�g�q���ݷvn�V,����p��'Ig�Rp�s��� ^�+e�AD���(]�^�o,�%Gch���7s��q��4�e{��p>M��oֻ�`瞲z����C��^��,g޷+�˸'��� ���#g�kV�š�GRe�P�J��L�e��}, _c��S�B& �RHz)��#��*%b�'S�?g��Ga�.���x�[!��J�P~��/m�,���RŊ��7����``�'�m gW�ˆ�{>4���Ҙ	��	>����G5I0��5J\Q��9�SF�=}Dm"����fc�V��{���֭Z�w�:%�̠N�H ����������I�̵o�鯜�}H2ʁӛ�n�\j̟i�)p�Kk=�L��Y�[(�u:2t���~=��g�:��&4��&������>�T�����'raj�C2��(J��U�,��
Z�J��09���f����_}���xcT�p�����w�4ݾ10�2��k�\���������md�;n�eҳzdx��Tp� ����a�i�DMrQX����F�(�v�ְ�5*�2L�Q3��eP�\�
ei�De�(	?5���W������O$}�bq��/�k�v�>�����V�W=�~�����1_�CE�*��x�n,`t^qf�E��}C6@w���͟r�'/�yM�v�J�*���޸��� �o=jCD�X>�r>P��h ����GX�6@<�k� ��+�E���!;�<'嶭�_�ʥ��o�"I:ơ_?�#�}�{J�5��A�B�1G;8j�45_����;��$�R\6�f���\�3Y{�_m���ȿ���}}'t��u��������	��%��oT��H}�]������B�!�@��#�}+��)�L����	��O$���2AIc\�'#A�F�Ѱ����4������������ϪS�����?�������<�ͬQ%g��rS���#+#�=;{-W3��+t��_?��Z��>j����'QJ�*K}��e�b��?��灄r�R2�U�	T����#e�;�Ĵ+�X�: �U}_�(c�?�=0�Ս�-u�hJ�S���+���[������0&���x{q��3����W�'���rmjuM���M��;.���ɞ�l�\QP���n��+@%	D�]I�+[��T�OW���v��"8;*��7���[��N���4�ci�  ��b*<�S@�P����#�9�/ϝ;J��I"19-h�^�kOv^ǭ�y�a]H��2Wm��,_�x�8�i��z�M���NN��ND�!9�����I��TT�PI�J��=}������Hp� �	y%e���y�Η����U��sa�%S�� *Z�S-���ū�Zh�h~q�+?9aDRs�7���f���	�ko[R���v]	�~>W�3��7yc��/�O{���^�Uon{�ts
Op���hoH1׮(]�뤏�
�T�ϟ.ؐ�hL.ID*�TI�]���Ȉ��ϳ�g�J���X��s�l�h��vo����7�}ى��,q�D���风Xgzf�L=�y0���+�Rm�R!;[��#�:�w����3����Zob��Sph�r��P#�M:c\���؏���t�ܛ�F�� JA�☈>��@)(�	�)�u�h'?j�/�jK�@�c��t��e�ÏI�S�fw���{a�������pK	�RRP^ S">+��c���g�1��������"<b��;&���E`���E�A��D}�*G��"C �KL>T(�$���7 �
  ��JT�5E�V�_�'�c>����z@��}f��*&���ź^���&�!bK <����p��x@ �*��9��� H{HTgL�������@�,�7���~����q��"\��b��ssd��G�g_���co�eLֳ��@J��;��y{���Ϩ��1X�貽�T�������t6�@C_��};8���,l!V0+W�0�WIPY>��n�O3��q�J��|Le�P*m�"��w�9�נ����ff-\a�9	a��M�861�]}���Ǣ&8�3�-��T%����'{)�5u+T�kfn��y���s��=3�
�1Ǔ�â���5s�=��2x��	����l���6v�l&�R7����FO��JIA���F��S����!	!Tɴ�gW�"W�j���t��L��=9	Q�C�S*������M���ެʨ ,���GU���ޅ����������l�5Ş���ݮl��f>�i���,��y�UW��v�޽��Z�s�Ű�]ML�g$�U�2Ku���s����R��@(d��FǻC	� ��H�c��]�,�f��{w��T�Hh���Ù���������K�����UL_���������ƺ1X��dZ��u�]�?-����}���g�|(�� 
qQ!��t���M`�nϟbٰd����&$�bʾ�uR���^<q��a����OHE�D�\� �P;�d�%�QoLھ�p��G�����-���W_��x���Q��T��R��vk����>���I=�z�6��гFsDK��߽1z��1�%Bt��n�;��ɯ�¦.�qB�c	A\$�ɮ�������t�l�´���Y�{�/��[t����/^�i������8!@Ac�3�THR
n��k�_�|婐�OuWc-ܟ�e�Q/.�t&����ie��6E!]Xnq-�Y����Q�\��j���
 ����z��e���Oql�2�/Ha6���W0Ӧ�:4;�A�&O��7���,I<;i�j�z�f�x��Qo��	�1f����,�_�8��.N}��h{��ٝgŋ�]��nTʇ�&�;�`8}o��2hu`���QL����kW�t��L^#�J���΁��X6$�	�cBy�km��Ɛwe��a��G��Iq�'�$L�3*{��4OI7�� &9g?�9*h�\�o��u�՟IvA�60�ߍ��}{����ѓ���Y^��޲�B���}-=�:vA#}�O�(��
��O݆N�� ��|�o��3>E�-=���0ն*.���'���o]��H��9O<uD�}�4�r�A�}�������3��mT�3qN��cNe�6�j��+��pS�<}1�m��b�RDS�8[sn�^��i;t�Ğ�u3#�_zoy�z��fd_r>/k9.y��j�z����+��[#����S�!.'�0v��oGU��p��1��I�P�D>:sTb)ɕ��U�m�yZ	03��L!k��V�#��������e��[g_��{*�bݷ���U	���5���m�`e�b��|۞Wɹ;��ݾu��l�0N��|�]7*�*�ٯw�٫��4���ب�����˰�C �߯�$��P)S���)��GD���WR�ig�;dȾ���7�:i��*a �?KϏe��^�x����z�����y��U?|"I(x~�U	P���	��\٬m��Ә�s`��DnY���۔�mөgK��R������3u�?�����K������(H�������Ë+�k�)�M9k"FԷ����n��笘�Twnx�؞���s�kI�M�x"�*��LPjf�ֳ��k�^ߛ����OU�x�0=�^J�þ�2�4;��n3��r�r�F��e����Z��Cɉ�㢟�i�#�]�������M���)B\�na�A�Ϫhp�{�JOQҙ �Xc��4�_Ѷ����'�^f9`��R�� ��H��U��L�)A�ߔ�*'�c��AS����ï�y9���=�����Җ�٠�_�����o��I�S�4���`����OO�:�����q(`C>|D�
5]ӑ�E2}њ)8~�xd�aM*��k�P�c5?N� �J��E��m�~�>P��)����?C���)���?�q�K&^�߄u\�;)
��x�D&�D}�6�Fv��A���ƨ���z��ْ����dM�jPH��H�H�h��I���X��� �#���	��$�S"� 
��p�\7V)ܐ "����{y��C�
;����h�-��� ���H�(B��0VqgE��ӏ�^�`
*�Y��+���U��*���s�X�N7���[�+9�"".�-��@�^��Վ�yM�&;��ar�c֪Rt؝�
�cӟ9���2d�M��-��.l�՗Ak�h=�6븅Kw2����-����޶�l{z������*^XI$1��R�<�cdt>&��A$����~�m.�+Y�������+�0�	R�xv�Q��.󱤉�J}�K�g��*(Lh8�">��oZ�lv�õC��Nk3�.+Y�齒7�Nݛ��W�e��R��Ѧ�`xV��c67�̥����[/���e$����O�1)W �a�l��o>+�� Y�n!�/ݢ;9�Af�ǻM�@C�$^�2=bXjP��q5��Y�l�R"���
Daտ����Ez�      �      x������ � �      p      x������ � �      r      x������ � �      n      x������ � �      /   �  x�Uֻ�CA�v��|rQ�qH�	*��3�>���=��ߝ}?�s_��<�q�9�弝�Ӫ˪˪˪˪˪˪˪˪˪˪۪۪۪۪۪۪۪۪۪۪ǪǪǪǪǪǪǪǪǪǪתתתתתתתתת��|���y:�s��y;�U�U�U�U�U�U�U�U�U�U�U�U�U�U�U�U�U�U�U�U�U�*VŪX�bU��U�*VժZU�jU��U��V�*m��Gۣ���h{�=�m��Gۣ���h{�=�m��Gۣ���h{�=�m��Gۣ���h{�=�m��Gۣ���h{�=�m��Gۣ���h{�=�m��G۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{���^m��W۫���j{�}�>m��Oۧ���i��}�>m��Oۧ���i��}�>m��Oۧ���i��}�>m��Oۧ���i��}�>m��Oۧ���i��}�>m��Oۧ���i��}�>m��Oۧ���i��}�>m��Oۧ���i��}�>m��Oۧ���i��}�>m��O��c��=�o�}2?�q�̿�������P��      \      x��[�W� �,��@>����5���zW%�=Z�d�%{������p#踤�*��}��v�Ӹ��T=Ph`��R�d��9'nd�I�)��tY#�\���|��\x�����"Z����H�0�׿���H���������78폝��b4���������������s/^����:�Jf�V�;��B�a �/�f���*���E�_�����z�������"���.����q-<_�}��������ԑ���q�Mޓ;����w7כ���o_��-�ϰ�H^�H9[�_�7��_}�:��"\���.�Kʶ��M����\�K�d��a�^
?���$J%�����Y&ޥ� �ս��2�-�0]o�AN/m�B,e+8���:H�����?��������OI��˕��V^ \���,�ۓ��B��B��V�eD�|���lp�0��ʌ� a��c抽e��v:�񅳾��� JIn��� Ց�#a"����H����^�K�Icg틴�K������ibΔ�~�&�AM���\���l0���4�'�Xx7�����B�WgE��@ㄽ��|��W�w3/�]�!`��z���3hA=���_� �}�����=E��.�&rB�#E�~W!����@s��8%:<Ҹ�N��P%Q�ptK�5*6��'�{r��;�	
i���F-t/��2�����_���f-��\�k���C?Ρ���?��Os l{ӕ�"�ָ�|�$�g�2�?��@��gi��u����qMŋ� ��ߗ^r��gW@1����%b6O�H`-����|����pAQŁ�^�$��t(<����y���}$�ePT�{H�� ��b߆i��e���X�y������"��!R�Ch��G�`�+vJ�2��V��Rv�C�W��F��[�ܙ.��x���U�����I�
W �H�m���"`�i����|Oܽ
]�=_a�"�i"�q4[�,$��yx�Y�Ex���h�� ʷ\�t6ݷ�L������0� ;�dl�o*����H���ʇ�!�*����@t��f	���!RW`�(��J�C�m������_�� ������|_kQ�����3�(J�c��_�
��;�+�4ͭ�m*�q�}4�n����Q�>�c��BƱ7�|/y���&K��A�"*<>�)T 2W�ng��F�t:���sVKr�$7�Ϫ$7j"����~����Y�p{:3Bc����5��᳅�p��@��}T!�+鯛�����.���|�iE�v#� �<��y��ȉ�yD���O��D�Dd��7��n�%^U�_�M�s/������N�[yatἈB��0��c�i��=P�W�?���K�]��z/Nio�aQQ�kXW8i�À��Dt��\{���[al�B�n� 0QbX�	�k؁�����q��	a�EE0��;N� t8�ĝ�r�[Y㶁-h�^B��h�DD���d �NiC��mX�[5!�'���ׯMY% =�6�?L
����ϠG��&�.�Ϙ�4�A�&�#��D�K�2Gz��`�2�Q6�X�5����fl�
��T��Z��Md��8a3I$5�%�P� 3�u��pM�u�5%	�o���i��z�c ���Q]��Ë]{��p���N�����Cs`�-Js~t^+z�-D�h8������^ ��R%G3�ע�EQ��Ŀo�56�����rCУD�_�bA[��R�\�N����a��70%�`� ����&��|���.R�J�H����X�h, �H���\�s�k���^�Iً|��A�ε%)��㼥X>�	2x0�'$,A���Y��; ��T3,3q}H�1���:)<�jP����O`��[���o�j��ȕ�$�P
�߁�/L����/Z�Rg+�T�C���-y	���.x�2r,dA+NQ,��%i� eh�R�ض�g����`|�	I���^tqz!0�BdP@$�~-�0��1�p��x<�[z&d�)�����q�xHgX@@����P��	��y	�tФZ0yX��ÈSAa�V�a���h�X���P���'�����X�B7͇�q9���#x����ǿ����B	ĩ��}����͏�`��d+�,��zD�l�|��K��]PB��"y��T�2�c���	�P=8�'�����Cr�a3�y��2/7�P��n;۽A��ە�.e�^�2����-�����|�D@�H��s�aH*�z �@�y��߀��~�� �^*6SX�_�ˤⲿj.�9�0��F,�FS�eq�fʒ.����\����+g2����Y�� jo�;d�!���P�1��C%g�!+ÿ�#��l��h��.��B�F�ᅩʕ!�2��<���<0"�����e��`�L�~�?��w{��h8l� �� =�w'Č�s����E~*�)\
@q{�G�&{P~q�2���m���Σ�3�`�
��d�(,Ŏ��0�0�Y�p�U�U�uU�7n�q ��H]g-�kt�]����h4�Z�u����/�8��8�:_?}��/�>lKCS5C��i#2G��# � ��l��� s�����̥���{�(ێ?�G`�fo�sM_��gó��|�)�U�hG�"*�ɿ/���ȼ;�O{�)��m<e�r�u��7�� �@�ɤ��"F��#\o��/X��t�W T|�5�����ߦ��#/N��PR�u��x����c ���o}�<�j��S���E��0���9��e�{>�/~���Z���oR���T.�U���8q<H���ҕ�u~-RX0��o��8�����w�.hz�Ԏ���C��k�!�H+��A�ơKN���' ��?\.��|-<0$"44��#)kh��NWbx�v ��D�Bop;��hc�[
A���D��Q�u^�`�d�a����ը�t���<����:_��#�i����i�!� =�����o�1�HL�,8�u���^��B��g�F1.��u~A���X��+���$�gsb����6��ȅqD�H�1bE����}4A�]U����n�7����q�Utԛ*p]�eԃYջ���p��e$Й��%��#�;�P�DW!x�`o��/a�0<Z�9����@�/]�g&a�W�(�B"�7R��,0��g>����B7c�Tq9�7#�������@c�#��;R`��	�������Aa�5HЂ�PD�9`��e�"ׯM�P\��,	�J1��**5ũ0\�!�0 ��&$�, ʮ�$��D.��!(���N�F ���(�iM�+���u��
G�1j�$`�%�#�ߦ �A�@��?�Mɛ� M�sp��}����� �8c��a��5L�p��5x���A�Ɋ��|�u�h.%.�@�u�_{�Br��|	��<9�	�rD�2 �3E(R҈ �,����1�t�����*����@f���v�Ԉ�E��\u�V��e\fF�pEɃ����ψ������,�H� �^�V� �Q|�0H��(�`�(�p��$�L��֭�6�}"� �X ���h�L��|0x��*I�� U+Q�fU��6 ��" 4�1b��`�>�"���L����ycT_���'J��G%+���&U��3ZQ�`fDI!�Q-�P� �?J#1G}�,"_��&T��:"�X�dP�a4�Pb���IP)�L�Qv�%����f2�j�]�(1V!8�%9��Nae�������E1��G�y Q���(D)�.�ܒ,�g�>2"-��KBI	��]���B��dv�� h�[�4&��`�ȹN�u�`HW$�4&��0m�K��B��p(׫���Qs֗ �h`��l�CFY8DӊJ�̮�()����4��=zb��|X^!�
2*���$c
�  ��E�)�4�.D�}    r;L-0�K�*Iڂ���1�		���x#���d�����lCc*U!�T���ئ����5<��z�R�L��)y�Ѥ6�u�"�u6��g[�_1H5L��J/f�0�����]k�]꡷S�Kds�$�2Jסs�1G,�4�(��A�,����D��� R�Ȁ'n����f�q��R�:E���i$�i��?E�Y�a�C����!�g&�J�9�/1��H1��ϓ��#�����_z�(S��f��*$|�c����Յ*	 9�C� ����&�SJ@w���	N8��N*+��.%�}ǽ���}X�����EoM�"�]6���� �C|���I���ۅS��%Ȏ�q�D����d��B��PP�����HZ/*��P	a��J�������*�j�����?�!���#
������� �)#|,��ک���!��\J����S)�z�7X�
��DD���/T
<_���Ro2�l瓎J)R&$ֻ��
R�ấ�t}K�" �X.So�Q���y���hgQТU��A$��\�KI�'�N))�	P�!f��M+���l*��о��8-�	�b��.i�q3��)�'���e����P,���)�4�u,�DWHN��I����4�S>���	��%�e��M�I]�gθM~o�
��B�����I%����$�T"
_U?8�?���WV�B�cܤ�߅�_	0��F�K8�X<a���-MX��Ȉ���(�޹\JHAe�U������*AiT�毈��Xj�Kj���A	%�E,s�M;�Ҝ:o�kD��IC$ŜֹڥACD��J�c��?VeA�D2��ӲcI��HJ��+��K!�X�1s�,k0�Y�\�J(,o~0��Ҩ��lY+4Z9Q(2QT���*D�!�0Ƞ���DA&�@l-����5� ����DxAe{U��Ĳ�?T�r�FA���A^H�D{�r�9׽��'���&=���#?g�~�#?�3M��=dك@� �rh�����p�ퟟ��*�[����T���А:T��Tf��("��m�K�2��XmM^�`�j�S[VaY�eֱ����iw0�L�'����9�z�O��( ��58geQPxXa��Ӓx)<+��£&-ZQ��Z���O����k��P��wvџv{��d<�kWS���U0�r%�+ Nak��t+�Ca��[[���/;�7����p���y��P�Z��E��
��SRx8��lz�<t�����=�Wi�y$��\Ԟ�Q���0�50�Zk�ʨ/A'��>�q<(*ʑ����p}}Bc5t�O��"�Mb/`��s�7.�M�v�h�9��?��h�DDK�TF�M��(������f�s��ח3�\U�]��O!T��b͑��<:���,6�����y�U�=�r��Cn#F��tڪ�m�)f��y�B��P%��&���@�qd�!�J�o!6l�]+�/њ�a䔀�V-57vО�Zئ���.Co
~�m�/�`H>CNJ�q����u�=���rQroz1��L��]C��e�~�Y�~�D �Ó?|bR�ޢ6��L"n( 0�1��G�Q��pA�b<ƣ5��Nu��0��>���_�|�<u^|�ŋ/^�z�rWh���˯�D$��2 Z��pA��#.0�5�v9\�z0�?\�����p��b4��{���l8\P����ҟ�	���'�AUG�}��GM�^��l�T�c�l|>a�:�j;�fH�*F�)��F�o�C�2G�/J��Plf�Ó��?ɭ,|�&Y��4<2=�-\3B�;<}���W��O��ވ�JFaٛ�>cن�Wg�=%�:[���Ͳ&<���6F)����?��>X�@�)��fܮ.�N�_��_1������&LI�A�h���),��MϒBG�j�� �G����(7��h��)9����u�u*f�V3���o�"'���5�N����"��Ͼ��W��y�l���W_��=��G��p0�F����O��ƃ�y���=9�No�����Z������*��o�K쥛�U6�V�uk���&	l�9�^L�����v����T%��G��J�Y�/z���hx~ޯ��Ǒ��T[g����<����d��Ũ}z�}�<����̮F��|��[tWاC�ɬ���>^� �\>��ѓ�O��zY<D�/9��L��c\e�.�90�JB��w
��pv"������j��������L����?��m5nk�@����{�Խ>��B��27�4h��~����A7��2ܰ�*�]���{5�'�k�j��V}P����׈�ߪ�E�Տ��P8p�h�#�=�z�ӽ^���)}�{��cuR$yk�26����5��6��@L�t��#�z3瘎`�Ѡ_/�k}
U	�M��X�����Q��`�B	'���S�@���#�V��7�-3���
[����pˬ5rc#3oY��Í������nYͦ��+�Mw��d'B(}RT�5S׏K����� vچ��\�M���X�mtt
v�K&�IՊW�P���������^Tw����vְ���5�>P�n��(�)�hm&k3Y��k3�/���ᴯl&s��B��G�^�|T'����~��3�$�qC�E�30Ѐ��C��Խ���gmD}q����M>�����ڊ�#�UѸ���������ӟP�%��θN�ܦ�P5M:�L&��Ń}��@�������ᣧ7���z��nFKǷ��fo���f߰��f����Z�<M��66۾��s���yS,�h�UG�m��N0�9�g�c���LY�e�ʞ���S���$�v���ˍ�w��a��T�ƙ���4���>�~�^�ٴ��ܪ�������m.j/z���`|�?������ɾ~Q?Ǜ[�������P9.�C���2��k��ֱ݂�`KufZ�QAX�����g\�vr&f�Z���w�<וA�#6ۮ���^��5g"������▜?�؊`8Se��~�K�c
�X|R�v���:a�^��G]������>=�֜���$�%���_��%���#9��S��b�9I�"_��K��iąf�=���0]c�a��|�,�rHf2�-�����R��ЭCN���#|?�.��h��ӊ�:��]}$gn$.�*9��U���uni��Q�$�C����di�rh��s��2X��Wu(��P<ӝʾI]�=5�o�b� �:�P����jW|��B�{R�$vf��G7����'�pR�S��㞄{�m�.m[��m�v����/�=����0܏���iV�.�/^�� �� ;O�0�h/*x�ҕ������Tp�5����h.כ!�{����b;@lh!�#�Fb;A�v�!�39o���֞���=��z���1���?����`o ~ AZλ�q8���Q�·��������[CM����9��Ѱ6�4�Y���)�ֱ��Ԛ�8E� 〒%Q���1uY��+#��jg��X<^�m�i�k)�����ɴ�wڥ�,,��r{��²-,��l-,[����6���o.�R��\����g���TYgL����I�Gu�uy�eS��6�C7!��,���Ų3�5�]6L8�k���1�ҚZ*�Q)	����|J���Ĕ3&Whc�����d@QM���hc��c��*����mؖ��7O3j��J�v�M��&��TDm�e$��Q3Ӷ�O�4oe� �N�2�.b:�:�����_Z�����GWʛ"<Y`okiW��[�vi��˻�c�[���F��.��>���]b3J���N���#�kof��u��c�O�Hg(�OE�����|mBM��>U7�ݿ�;�CJ3�ז�qX����-�Z�(�?��(��=���K�ٓ}����'�O|֓�t���!�Nx'�E���?b���2A���:`�%-o����_����c/��������9t���i���`�����)������S�8���՛�F�|54 ,�D:���E�0u�0j2    �b5ǫ^�O?�p^��p��xr���~����V��Q��/=g8z0�w;��K]K/V�_�D�~ی�y����	ޟ��5����^�|���'���� �x��!����p$ĵ\������ɏ_'	{�;��8�wg`�.Χ��~�����J�u4����Z�1�����3���w�϶|����1�M��ZI'������G��j���t���"�/-��9�{� `x�/�`�ux�u����i�6O���'0GH3��8]�Ŝ	j�,q�T7�oӛ�\�j��R�����+]]|���Z/R_���jSD�:����u�;+��V� �xy7��S0���O�=���,!� �$�q�oGL�`蘔G&�$�;2鲐z�zj7�A,}�i/�T~ѕÎZEo��sY��t��Dj��/6�A�`��ʹH_ε tx��c���R=���p5��/��ի�l�:K��/u�{�n~`ƣ;ɉPӌ> �.�J��k�;�.��;[�N�|.<��p%�O�c����<Yj�{�����E�|�+G:B-] B<�?�9^�̇�n~�<���Q$^�nIn?$��� ����j�������	Kܶ�Et娱�܃��b�E��uYl1p��C���_��I�$��*MT�^ 4������<������Ԁ�k�� �����^;LWA����e��/��"6�
�
����P�\�;\�5 l�7�>��u�D0�F�a`u�B���ga��3��J&�u ��9�ᅻ�ZoĐM;�M� �^$,���a�Y�7?$(�i7�7���"R�՛:_٫���%�W?�B����p?+�ĻV��X.�.]���,��j��E�wt@{��z�y,9�ά)_+�� I1?�W�@a.�f7?�V����*f���{��E�r��D0�TL�����{Fr�Ce�:CV�K��y<�����Nr�g�%�/��$4���H*)�D�<��^
@A�l�%߈ 0��(���.h��=��E�����撢=�D,Jq��Z��V;P��
����<&�X�=Dh�/A2@�w\�|Gig�(�#Y������ʼ�n��墐(�	v<M�ǆ O�	�L��$c
�� P�r��2do~ 	[`]6,X[�o ���{��X�:�N�FIE��_D�(j:�=� 2��c��"�����W!�0:HJ��	������h� ��<�AY�4��E��p�!,6��Ûa;����Z��@Y1(�W�Dz���`�%N�v�qIGoX-�X�7�(�@#�ƚ%��.:h����3�x$�yzT*q���� �|������3e�_��G�(���d�Q��)�U�l��=@���I$�HmI�� V�lG2y��z�h����2�M���W0�|��PW�D�-��u��4���`�?2�X��H�t$�gf+�lc�[�%rb)��� �7����F;���%:�է���I�	��C���$��R7�o��%ј@�\髽���ŔMv*�jx�[D���ݛ���e9�Tx�1e@�:�C�+_M����}L��߀w�Nq�7)l�������˚_��"��1�tbCU���߉+��q�"z��hv�^R��&�j��/�Ԝ ^L7���f{s�|{�G�1�j�a�j�����}
"`]b�2�uy(���DY%eo������_�m�	��1l�̰��|I�L$:�\�s�e#ij+��F����gC�G�����
�'쨃&�d�34�J[	�6�y�)�6�qТ���:��j.�;��K��dvR�/��+��(]�OH��H2	���~��O���-�ӊa�l�5�~C(��
d�+<i����H���P��|`*wX�S�|��\F�3u�p�D���hO	�
m�k k��&c��/j�@�"3ɁBA~zhx;�To�\�vqJ�����5�Cn�o�"�&0p+ �;�5�T�"TN pl�G))��w�  ��A��3^��( ��,��&��4��K��dQ��$)-�>*1j�B]��5��}�8�R=_�9fV3�5�,_[�e��79�Mj �0P��F!G�� 
�2'�ňGE*�"�C��ՠ,��I���\=Cmp%����+�Pn~���D9z��
q�+O;�y�E�h*�iY�A4q����y|ɈH��� ��#�J�z#���kJQ�4##�]CjX,o�-�ZX����}F� h�����Z|��,�	��٬�Y.3�3k�_>} #�QHxS"G�|l�cQ|	V�i2%SG�dZ.�E��X ;#l+@ Wq��F���JD���e�x$���9��]$}
j�����C(�Z��jG!��ŕ!|��R\�1c��|��}�'H�FK�c�q�Ҩn^�����uQ��I�v1�t�N<��eZ�E&ʖM\V�����|�.H�n]G�;��;��B�<��� ڛ��P�"sF�!���I�� ����R�heQ6��"�:x(���
S²��B��EcU��7��H�� 9�1j	���2�/�ǹ���\c|�� |`(�k-�Y[����"Z�B=�|�ƨ\C>�I�y��S�ʲ`h%(2��3B�f%�&?�o�\yW�*61+��1P4�N�����ķJ�j�K-׸rʶJ�a�r2Q]$�̉���?F�8�B̔�<ɃZ#�Ø�G[2��F�C* Qg4I
��`�ƎH�ȷ� ��:.��7Y+�E����h4�P��K\^R2���+��T!VNdI&$�1ǀm��r�D�v^��=D����3ŻZ]�pWB���p����~+{��A00悦`��Z��m\L1���֝Y�u��C��e���oa�A�͊K�|L,��W@c��Ay30�k���nPY�4��Zr��,��~�Iap��y���)�H(��"�c�4Zpd~.��PSZ4	u4]d�!kU~���~s�P
O�����j
�d/P�vbA��8�X0TI���a���]$$��Y��y 5��%� �M�����E��̒a�S�՞�
_�㬮���x���
gW�py���ɯ��ì��օ�H��Me�[���k/@Hwr�п��\qN  �荗f��H��5=��C+����]�D0��2�
�.8����2��(S�̒���w�E�/�tU�҄Jש�gc���1����*��\#��c(�!��>�'�泣�.��h��@1����xzL���YJ�iu����<�0�(�x;
hB(�j�+Qid&�ܔN:S�.|M���B�"�l�b�d`e�1oϜ�Z�h������*_���k!��Q��Q�
�+%+1��JٰtJKyfEi��~��8G)h���t���D���!�����%� e1FT aaAA<5�r�@�enY��j����,��
2�J�:s7��6��* ���P����JR?F�(�Ǭ�tȕp\D������%bk¢��W9�S�Ed*��U���a��b����A�lC��܋�FGW�	��|R�@}�1�=M�EX�uVW��zUl�p�m]���xL`�\���`T
V��UM"�;(ff#L�u��d N0i���4��yN�����aZ߁c�n��(�oP�I] 6*�H�k5�Gf(35����h�~�߫,�/�V��%nۈ����D9i�y!��[o�1T����*O�uE�h1X���4��R(�����؞�!h@I�\��ڡ���)�L&'Va}�r�����.�ȃ�#e�Rg���V51�4��O�|Q��b���)
�f�y���Ttɮ�6Vx^!,TE�'H�e�ę��@/��3|�\�qp�*��Nm@5aFW��T�P�B����C�Ƅt0�%ARi��c�-�i\�Ej�*�Ȼf��]TY���O@y&�hr��4{��'���E�����aJ�U�	-B�gF��MJC�W ;˓G��j���Q�Xh'��6��B����	��    �e�� IEVub@��3��˯<�+%�tP |n/�s|��j}L�e�;����v���y����g�����+�VU�x%�����]�PÛA� )"H��BKt��� �A��њ���
X��9Q�;�T��;��`Vܞ�͛�_+h�����/u�K+��2K0�ʄc9Џ���t,&h���7/���Ti�D�� �iS�)�.�lm��VJ���URlA�k�� S1ʳ�yh�Ia�B����v�?b��WL�����ɦ����OH;�6\�@���eHmX�C��vM����y��ap��%�@��+p�
ìk$��9�Ŕ�B�Y����&�Xū�8��ފ��*g�`��D����.���9�WIU��<
5��mI��@7!���ڠd��xʦ���2j��
s���H����a�T����j�4��vO	�	�!o�I#`��}]�$T-��y�JL���H�+��$��{�C�z�OWF�p�->��t�P(�q���SɅ��w�}������J%��Y�w�s��-�0��Sʜd,���n"]7V\A���n�I� .��Lx��bdJTD%��U�Tyu�W,`6��U�D�؛$�jTƗΕ�	��o�J�\��]�s%�=�� ��I�l��C�rӈÆ��:�*f���K�3��I�Q�8Tp���dD`=+��[�yG���>8�͇Z8V�Q��:���
W�Hc֍�=�҄fDn�)kV��.%�8�KU��teJ�����ꚙ�
I��t�D7{Ƹ������dω�`�?On�yZB�|RIY�ɷ�����sm�+��|�:U�m(�U�T�4)[P�&������E�7b����̴%���)�T!��
�l8�5U�!d�@���r�<k(��ُ�}N��:�W*�$���5k�EF>��0"Z�n�o�/�.]�X�.�S]�PC*��b��)��w�5n��ڪ�%/,�o��D����sU��d��C`+��Η$�$�N>���#O�8�Ǐ����:}��r�QCk���l��R���3�߂���*2���x4� fls)�ʖK2y���|���t\
%�q���Μ ���bʭ�:���y%�:c@3ick-OGi�/��	���k��0nn�oL�*�f���Ue��X`�8t��)�97@��l��>�ל�^��,蹨�S��0�
�n��w��a6��%�T�sc��jlU5�!��Ӗ��lP>��Qqz�|V�n6Π5�SI�
�|�bI�rh�ID�������\�+��X�h�R��$���:�o~R�MYƌ}l$#�&&��z��z��N���g�R�a�����
̓�~~x��0uz��e�J���E��H�y�B��R��y�Nvb��� �i~U:�N">�'<ƴ��`c�
S�K/�tS�\eP4�s[�rٮ�qTuF�A�?5hyV����gPu ��|tKR�`k�d$�*�J��Ԋ"L;�xdn!r�@v�2s*�dxP��&���kEnK�(0{��6�%�n!����5EuJe�̔]a�XRgM�W�"k:LY�b
��~���X�B��H� :�F;\�I��N�$W,،��'��0�v��xh��.�l^0;/D��+�,9�l�[������p�7��3�a~R�(�1.T�����I��:i[S{���z罯�a(��>9tY�qNca�UT����P�
�Z�z���M�o��|��eaU �_���%&r�D^b�QK�2z7R���ex�]e����H"�?V��	�,.������q<N`��ρ[u��Fk�~�5�:��m��rL`]�Q%H�����F��WuU��E�f�Om�c/T-�1���ցϴ���I*GB�������
��	�Ud��`Y1C9��� r�x`[
� �>�����#�s�Ҕ����N�I�4��1V0H��X�T���#2b��B<�RU<
�x02��<���lP<�ڙ�6�qɲ�:|�Y���J��bU�J�R�P��=���6�ǹ �
м�3k4���1���a��*D���2Q >㜟�>����5�!>�EJTd���P�N�w(���Pײd���P'�n��8?�H�ͨ�a����v�^B��,�ő\�����1�8����������qQH�&5������B�	j�<��}^�:;��0&��#i`�� �N�㼼a�'賌^&�	>�+���ê(۔?�w�CC�5@��F���.�TgabIr;_���g2�u�ؠ80u�oD�F�����Uh_�SȮ3 �`��!88��u����Ӎ��A��8hin�X?��;Kh��Г��8f#K�q�W��~����%�T����k� ��$oL��S>,l�m��gƍз�2E��uf���&��=kQ�-��dF)� ێd��UU`��x
Jb�ڍڨƚ캠�����\_A���^��Q�u�RR�Wɕ"if�Bq5�v�Q���x�xѽJ	R]��*:�j��59�҂e=��u�L�R�T-�0�@��@(P=<��ԃ��%8��g03���q7�KX&����g�,�����憨��}p�FۯS�Z���m`�%�}�	��`��+�^�a@e���)�e����h	�޲6
�soU̹j
�<Vy�ifS|:�>� ��z)KRm�*�*��0�C���X��rT�Щka�4��,G���ݼ*��b��B[��n�{�_&خmx�|���7z�^��/F��Y���Sgz/�]��E'����F�ݎt`@�z���z�Qj�va޴Xh��}���]��_>��[�Q��
�nUR�d���em���I���۔Z���Ǜ�:��3IM����0n�8���+�3�N�߱�ܖ�u�9y{��m����my�I���?�{�u8��.uj�;��#⬶�S��2��B�,֩(����?�������n]�w��q���>F�;�#��S�JY�[ �G<���pأ���	��O#�uG�=�w��]0���m���h�#���q��b�}�.{8���G�G,O����]��t�Չ�����?B?>�{�hɇ#�v��CJ�t��GL<#����~�8����i�Н��ώ������� q������ YB�!��ız�٭-�6 �?�#�c��P�4�D�Q��8Z�@����>P�p}��8���u�-��sAaGj1XR�2H����`;�nj@����{����*����mz�f�8�1�jѱsK�-��ω��ЭP9�oXH���g�V�bS/�<�r�v�*�r���YKC�ly���,����a���>A��Go� q��7f��}�q��*��u���EE�(�H����^��N��}EY�ۚ~�8Gۖ�z�l��	�V��6�1���U�F�=t�F����]�c�q$Jڥ�c+T��ڬ8t�G�;|��b��m�ǶX<RHo>l#H�N� [F�#���C������;E��C7�dbn��
�}$q��ZI��-G��L��C5�l;�1zSj��8�)9�֢C�ʖ��+[�[lj�<���d��lmٴ�e�(/��kY�F0o����͍̆0w턩���C�]3����j�� }2��C��4
?�-ӈY�a&���g��ȡ�f2]�s&' vj����{����c��*�o�~ǿ}Ν��ʥ�Q'���ҫS�T�]�.<x�N 7��6���v��A[w�� 3|��*J���s�J��ؓ���=Um��{�%q��ZI��|�D-5ő�gE������p��Z���}𮡹B?p�P�J>|�P��}h��w�R��MDY��>��s8;�%p��(��%Z���e���[5�
L�z9NR.�<ZR�H�H�g��iZ�ڤT�r�>���y�U�Az�j�I�+=H�RU�`�,�CE6�5�JdZu6�G�>����5@�r��=P��;tT��ߪ�νP90�O;�6�Pq���D��ۜ[vEU��ƨ��긪��j-�\P�Q����:FkU^/tW����Rց�6�8IK��6dU��H=Y.;l[V�(<bgV    %؜u/�0'6��1���w�f��]]���j쪙�̿��v�\W����P�VՓl�[Oh[;�6��6�U�����P\v�rT��v_f�m05�u88٫��JU��,��z��Z|jS��z�����jAy�N�F��h�2���U�����e�mݕv��L�o��@�i��|��f��9b�[m���-��?�����v:`��Lܾ�m������r��h�q	��o������qI2�E��;G�K2�n!�����{誠ۡ��js���t�z�j��G41k�������Gi4��%OX+�ͭyw��˅hϻM8R/*��)nѺwC�^��<l�^�X|+�r+�3��>tG̀�jr{?�]Z����<���]<�U��}Z+ٹk�v^��v��(\�R�X�����V�,�����෬)q���������w�?�:�w�ǅr�Cu9�x��S���{�~�vǪ�j[��!��N�j�7C���N�`a�����X|�Ur���[2t�arll�������IRll��j�u1�?�Ӳ��ݪ�r���h���0�
/�=l+f��ݘ[����貆}�&�,����"v�o�\*9X�g]rv��Ϻ���=��^�$ts��Lݢ5�a�R�3���b�6f��Ÿ�]���Y��ֵ-�=�m�b۳x]ٞŶg��Yl{۞�Z�؞Ŷg��Yl{۞���,�=�m�b۳��,�=�m�b۳��,�=�m���۞Ŷg��Y\E��Y\�E۳8ۆ�Yl{۞Ŷgq`{۞Ŷg��Yl{۞�ۄ��Yl{۞Ŷg��Yl{۞Ŷg��Yl{۞Ŷg��Yl{۞Ŷg��Yl{�o�g��Yl{۞�8�=�m�b۳��,�=�m�b۳�$��Yl{۞Ŷg��Yl{۞Ŷg��Yl{۞Śl�b۳��,�=�m�b۳��,~=�ӵ��;�60������7r�Ë��Ũ�=����^������`r�wG�ި7=��+��sG؋̘�]}op�纷�܋� i����_�&zpv�'�{r�:�	JC�+�UvN^<{��>z���GOo������w����#�	
��������"B�7��Ơ4��lf�>�����_���,�p.��gv� �e������ �G���pH&��i��߻�]Ϻӳ�oO�͜�j�<����A��D+���j*���@����f�lN�b	<��k�����HЅ���&o�4BF�/̗^p~���{��s������) bسa���Qw<FSd�ׁ�P�9�R)4<�Ǔ3T*�z���Jz�n�1�a��-��g-�����nI�����wc�=_tdVR��
?��^��p���h˾�4��o'��D�U��2!Wɘ���)�fs?\�N���j�@�Ve0^�Iݘ'`�d�� �3�e
�6�����m0�amI���	Z�)�y��`��K���Z�0 �A�9%+IT��f�9�𐃍7��H���˨��e�4�eP�������=J�쥍b	�}`0;̰#����{�[p���ߝ�G����nu5���|[b�E�����Z���o��JC�����qo�����WrЍ&�A�t������Z��O��e��F,V^,���H�o�+�)��%� �:U��W8�Y�[{�6����D,}?U�x^�r��g6�Sd�����S}J�g��/A�.^�]��HX�y�U������
���7�ģ��
Ǉ�7�R�7W�=H��y:���1vq�[c�+���Z` ٹ���y��ԍC��#�M���qV�z�z�C�7p���?���+8kN������et�/���\�Ϗ`��S�8�~�x&�X����gJ��a7�
D���F@LXt��j/^@��`�v���%� q`��(�J�~:��
WN8`l�w��ڻ0�.���X'Ŭ� z����R�H9��D�EѮ�(���
(�S����H��X�:�� Eb3�E�ƨ�`�.1E�lN,��x�eӅqD�H�F�ŊH�ū[��!G�h2���������q�Utԛ*p�^ �($�]�Y�@8 ��YF{�uҿ@̑���=l}v@%���v�șG�v�y� �������	E�JA�2@��^���%�|�צ������3��[��rY���]-*����/�����`�l��uE@	)���FL^(�@��Q�(z�*�H羜��4a���@��!� U<� [�q*W�H$B(#�IiF)ʮ�$���d|��"T��)wC�(���r����Ք�H��&��w���G]�=��޷)b���sS�<��'� ����R�~�G1��[R�(q\<h����kL���c���"�u���K���*6<@�������V���cn��� �&LHй�@���:D��4�2%i(8����т�Ń�_֘ʁ�r�u	7�V�@��B
�Ix׬������̥�f��� =����/W@/]�a?�;$* �H,Rk9�(�?�SQ�<���uE��
��9���uk��}" �3?���\+���d��Dނj�Pģ���04Y�!u��X�LT���1w�����!�6�iX��.�c�����D)�2g�u~�miy�+�� �@ ��5K��Gi$樯�C�g�Ӛ��f�X�g���9��`)�Ә�vb��C��Hs�b1c����+�"�{Z��EA���6M(A�7��0��44X_��u�A�
ʬ�	�*+E�D���G�����\/����,�J��Ȇ�p�I�
�9Xb��:���4�%�Д#�o�8*%�Hp�pz�.���]18���Es�(�Rq��b8���8qEd��V��D��Um(_DixP�������渑.�1��.e�mBm]RKJ��q�YA,�h�9��`��IVf[�k��ɮ ��%����{K2r[P��9����� �M���%Xṵ̑,�����Np����u{�����o�bX��p]�Xe<R6�:�`|:8��R'Q��m�P�5H�Y�^�5ok�V.k|��γ�/@3�O���ʣ�\�����``�Cb;���)NG����\~�Q�;���Do�٠�L&��A5�T�}+�^�0�IQ��G�E�X��@~�;jCҕ���b@����_�ˠ��6z�l�9th$�'��F���2�D�3o���:�D?iQ�Lnl�Ƽ���m�{dq�[�=t���>���}#8�(#Z���"Ċ�]��/F�no�?[gO�G����|0ޚ=5�TC��\�h<��im����$
߶�d��${��w������4^p�7g�����8�+u��Qw�mx��u]i��\�����!��;�M�ȃ5��M��p1W�*�-/N��N�O���X6�Vx\2�(H�30t��.���.�-,��r�b��l����²,Kf�aFgK�9� �Oן=�z�O�?#�gs5}>�������4&��l -e���vpF��-�! I�⊟
��3����U��1)��0KAy���Y��+���zS��+��q��̂ک%D�z$��Ē+0��Bߥ���'��5R���c�C-��T�E��m��de�F���lB�z�l./�H� i���θ�qj����{�d����E�ӱ���	����O>�7eĔ�R���^��ͩ���3��mؖ�ܸ&�6/	O�r�Q�M�P��n��~3���0�Hj��f�m���i��.�A����ө^�,NטS�#߆�����[��GS�[��=��V%�g�@)or��Ë޴{6ow���i���v��� �c�Mޥ�|v1u{��p4����G�ڒ��m���/z��7���+�j���Ž/4������t�k�2�����k���ՏE���S6�>��u�r��:Υ*}��ٴt{�F�ש����Ŋ�sf�i4������5$7�|�FSIu�y�f�5�ճV�؛-C��MF�^I����T��d��m��q��Ƨ1V+ۧq��.��m��    Q���Z6lG�2j٘�7�u����B�u��u4��BlG�-�v���Bl'��>+cڟ��Q�ʌjƍw�Q�����=X��Fum��fn�gX���ϛ��)Ws��L���3����3�̸�J3mO����5'�KVa�������6����ٵ�=�^x�V];~��:���;8�&�K��7��t<lo�a�4M�g�2z�s�f�h4���u���KƉu@�rGai�X�: ��ȇ倐��w�����P���4����1�%����h۸�6}�)Ӵ��`[K�����E[�g�o�][��Y�U!����Xb��Z��!��@��5�i����YۣlC�Ն�v-*�6T�m)��^��*�M=Z�¶m��j�n_o�S�N�a;}�S�ֺ��uqZ.:v��4��67�=���ةwG1��^����~�	w�j"��C.&�%~��ϖ��5��#���=b�1����=L�x�T]:�)�oD��g�lf4j��?�ř���b8�����ʙ������v��_h!�������uƛj�?��mZ˭:��2&ӳ��h{�����+t���Ƒ��>��y��>:�}��R�~�rz۾�������m�����S����Ww����������zoݷ�д��8D��B�~��}��M�u;�[��7��S[�����6��+"nӷ��i?u������u��u��m�ÿ���.g=H�R�%��=�+�q����R^߶������W����Z������!{�S����z��5������Ol��?XoC���?�yҬn��?7jZ�ߦ�?�T����>����o��?�2����}���k[�߮Ͽ�\����V}��x���w������x����p��o+7�W���p���'��䬮�}<�ǣ�y��}�<p���������% �S�7������>�Gk\�{��t89��
7,�����������Į��\�%o�^�h)��F
}����L�Kl�|0����Ө����&G�ަ��e�>��ᐗ	�h^��H��8�|v���b< 쏆�j��A��B�ٍ�0������=�|��.�fH�WZt�yR�t{�{��o�P�p�D-E�bC�p����7�l��?�S(�U�^�n��C(w���=�b��C(��=��B����ʨ�u{��t:���Ts�D��=�bϠ�3(wb��=�bϠ�3(��]>��Vj�#(w�x�=�b���#(m�[[w�(
;u$?:���֜ZF������'���]�r����q�����ٛ�|���&���z����y~�翣��y�_d�_�ʺ4�~v���ߛ$�ziK��<�M��)~-3m���f����R�_�?���@`�	�[O�z�`��z���������'`=�	XO�О�����&��{]�F�3E���ז��R߻��]껵
��Lロ�ݡ��V�~U�J��"_[�[���e�Pj���y���Uc�>��¶^�B���z�����n�j��w�p6�m[�7[�?���bp��yϨ��������d��Ilz���)�*ꖹ�>?�L;�M�J�Y��y���N
�o�����*�{��u�mg�k;��-�������5��̴�A\L���s�LxE����c�|��x�������zw���h��f�NS9����ι���|at�ׯ��`*�
p�i�a�;���{�ro��B$����e�':t�B����K|�R\{�002I������b4����c�NiH�L^�'���;N�MWƋ�[��0�]�(��g�~[H撚�0|HS8P��iˀv�|{�U:��O�i��%b6O����+���T��p��o����2���W�݃(���#)o}��?�o��U��!�XB��$�yIS���6L�t.�?_������ʿG�RFH�y�����Zx>BM���
P�Uy,i�Uy��j9����|��!��e��ty���z&Q���U��z���Ik
W �Z�����h㛤��306m'ٱ
]½���m�������aj1j&>���F�~ug�I�,gA�x �H_m�����3վ��o�� ��䛵/~S��1�z�-�|��^U�M����X���f	ެ��k�
�%�Z��ah���P����KW ��Ӵ�bڶ�g�v��U7�
�J9u"�Ӂ?�-m�ޙ8����Oj�Nq�sn#��h��&�~���ch'EƇ�'����ᆜC_�s��q}1�1n�98���8���&�#]�s�;p�s��o�9��7Ǹ��З��ƛC_ws��n�y���o�9�7ǹ�����f��\ks�;m�x��qn�9�U6G���З���C__s��k�Iƹ�X�r�N���I�<� �!ԅ48��+����4�sv/V�[L�ϒ�S���7Ԙ�������cu��L9�\�e��~�w�_mU��]���m|�H�ת����
��Y(rX$��	nnJ��}c@�u�!���_��G��G�,�̗���~������(z׃�> `��������ˊ�E�eE��pa�qY>l�U7)����5N�샏{w� ���8?���g�=�Y�j��w�h'a�v�HǞ��g;� ,�<�Y��mzV��aN}f �;��=<޹O��wkmK��O��8Yg˙R�wu��2���J+Cm?V�������J��O��MU�y�g���5T���d�4��`k6U)��gS�C���TDm�e$��Q3׶�O�4oe�t����p>�#�ƞ&�s�q������6��=��������������=��i}O�{Z��=�=����pt�w���@�Ѫ������m�+������c۹�Uk)٪9V[�w�Z�����a���ٍ렧�[4��~~�֍��3��٫<�]�`pG:�������;�O�4r�9)���mKg��ݕ�t�[������/el�ތ��@?<1��81���8)��*zy�v��C�w<���jc�̅n�Ho�g�F��I?��h��}��;�ڂ�]���`�s:�ö�z��m0{����%d��=�'`Y�ݪU &]u���m��ޯ�=��͝��M�M��+�äϧMu�g�8{ݢ������`|1�v���dp��]��˞:g��B
:{�KljU�MC��W_����xq��I}�:�_�.����5���.4Q��[�i�7?m�ʹ�j�4n���;^asʹ4젋��Ӈ�����O������'/o�ڝ���Bs�4א��\�E6���D�8Ho/����b�����jٺ���W���4ni#^�×O��O�g���>z�ŗO�jk�.I��6j�H2��:������,��gtX�$���ܯJX*����^��^*W�a�U�a���!(:��<Թdk]o�S�������O7�R�A�Z�l��-�7-kc�?;���S�׻��M�Xm�)&*qP��n��vQ���wJm�
+��������[k�ԛ��5��juZUﰲ/[��?��ߝ����gm?k��/��x��׺�5�ihMCk���ϡ�ce���dc�'���x4����gC4_E�7>q���ƭ�Rh�xEw��D�2t�r!������!�BD]*��5R:�G��.7�T$0<��_y��ޖcF�������~�l��A{�m�({Ӌ���j.n1��1?XxavJP7�,Rњ����L'���p��M�gն�@H�F ����~1[�t�7皜���yj쬍5�R�v�D���˩Ƹ�Ƽѣ�^�����K�1w�F����J/�Q���E�b�e �<ݜ�φ�
�(z���n���Ϛ��9��|�t39D딢;p���ﮝJ��������e堀���� ����.2ho��b���X`߱N.E���ӥֿ�V/E��˦/�K��u�i-S+��/�+L��?L�y�)�ńG��b�w�=�\�Zk?K��r��5�'M��r�b�Ѿ�U�����i��� �a���.[��Z�Gx7�`����ȧ�|�pjO�|�r�M]Lnλ��Dó9n�y��    :�w��N��Ct੅�m�c��.���r�p�)�Gem����cݱc�w�h�;5�>�j}�����7��y���QÑFۘ�6&�ˮ�y��x����خD�+����Jd��\Z�v%��^���݅p�{�NڮD�+��JtW�mn+d�j��7r��:E1�����7�Æu�+Imu�-�/�mK�m)�-����ޖ��Rx[
��-��\��~|1w���T7|���۳�w�6�]��7��Â��{dmᶭ��u�����:x[o����:���p�(�;z[o��m����u��wᶭ��u��u������-���N���݅h�{�M�2x[o����2x�ƽ���c��u}�6m��7��i�?6���q����h�ퟟMt�ܸ�l8zЍ�/���1����0r�_�W�{���(�K{n��VF��`�o���x�L���xA�B�;���r���M�a��?����$�@�|�¿@���&�i4?���׿B���s��ܺ���L8�����GjlAߢ��U�*$�,��q$���Yec�92��~�lÕ1���2?�#�.�Y�8;ә��{8����WE�;�i"xt1;>�~�i��F˛���@�@x���"���a����a����|\��oP�xo���E��u�-bz�?����+� ����k؃�c�K�%At_�҅�>�aޥw�횬*A��O7]������`�޸ߟ��`ku�E���쬷�ʎ��[b?]b�

��J^�7t��ˎ�M�� \!���}���R�Ł�I���5F�t�N��鰯�V c�ʣ8����{�u侊�)b%z�A��"[<���"y)#	��;<}���W��,;�R���Q�JW��3o%�4س�g��w�;���?���/g�g��h8�zg������ӯ ���yo�M��=9�No�����Z���'N���w�Y/q�-�0`U ^"? c���4 �w���_�߀�D l�?~B�&�x�e�Q�e����ޜ��bp���b������.���Ai:i��������~K=�qt�i��"`9�I����@W^K?Ġ�2
�u�,�t�0�����U��B�1pD�W�i�F�s�.�
�mP2�d�!�T�V���!�,���A�K���x`�µ6L��g����N���Ð+0��p��-��!��[��ޝ_���ȡ�D��$c�AU����p�E6���(������5��֯f�|��Na�[����\��Ֆ�����_���}�e��vm(l�_Y��Eh�maU���,q��󕹊\��[�R�e��n���a����w���9P�r(��Q=�o����(�mEi����?���aJM�P��6'4��1m��-3�a��n(��^��oϯ������=������������=��%�=�n��������=�n��������:E�A_�0�0�]������gor{�\�������>om����������&���=�nO��������}�ཨ�;�����=�nO�p��߃����=�~w�i��������=��A�ow!𞺓���=�n�����׍��*�j��7�*�����U�F�.�e����-�7��-��e�ޖ��2x[o���e���+�������aw��M����*�� ���\�����u�w��������u�����:x[o��m��W_7�/����w���]kl+�m%������*�;�wQ+�R���h��.�]����-�����=+��ֹ7�����dȥ����Z��V�ƍ�]Ϻ�^�7�^�6(���<��;d�W����'������kI$���
7��<]���qC?�����'�8���"�I9���^� 4�I�y������b^���N��i�Evy()'��5�x�������.�pq�`��}�ʮ�4�E.�t�q�B��s��K$!�;�\-����o~�x�zs�ߤq�S�pVx�Y�H0	4�������k�q�k�o��8���e:�t�.hj��)~��7u�!��Xt�8t^��_� R���V�\F��"Zxε�<X�x7ۚ��/�ٕX� 
|
L�re"�:8j ��4�Y���@]m��*�Ү�2�a|.����/����p�)^�c����޵�����O���u�?a�s$9����D.%�w�F޹'V�@����.���EŸt@���3 ^#�kBd�0յ`�"���H&K/Ih�\GD���@�NO���}�H�*�B/�1���n�@���q�Utԛ�H��L���EF+�0�*v����\ ����s$`�k��]��Q�&��m�e�C���G�|	��E��~�(���0x� vB׵��I�
	��c.	Y� ����jf(��Gj{ٻ��^-�h� �o�_ G�&'�'<��Σ�fB�d��Z��9�1J&L��D���:2�)�"e�7���=��"�Ʃ0\n"���� �f����:O(J2�����H�Fǁag���զ��`�E�)Dx�����;bM�T�x�pᅰx� �`�e&l�»a� ҹ�.VD֡���u�x��������� Z�G:�:f��"Gv�� �K����"e�Կ���4m����D�4��r�0u �g>20�_��:�2%))p���|���%���_�Xˁ����s�#��,��D˫/3��230f�U($ b\_����KO�H")�Gb�Z��F��y
�4 幤b�(�`�$����1�0_��7B}"g ��������a�$�h^�@!��dȲ�C�	��A�� �����x�7$�hڨ�#.IA��1F�e��q�/<��Q��:�I��(������\r��D �&z�FbN:-E��H���#$��Rr>�:�dPsa4�P����M	�L��W��H���2c��$���+�+����#U�h��}���MѲ�!jȰ~<���'Ha2V�%��dQ�����A�_������X� ��Y"L��-� �@~k��!=�-@4\��:M��&P$�4 �X0��K��B$�p��V�zh��ފA� g�ЬKv��2I��I*F�H�CWD�k%�I��YyCl3�u`y�d)�D��p��iܢL����K�O��АNj�����WI����;��2a�SM%�Ȫ��%Y�m(f�DV�T����ɖ��[/��J�����g���?��`}��/��C��9��O0V�c��NB��S�� �=���6%�=}gBg�dOBۓ��$�=	mOBۓ���$�r��>���zO�>&s��0�0.������o�<_���t8�W���R����2�oTc��\���}�)�]�yq���0*=l�16y6�o�詢0Ln���wU?��W"�O0��)�l%ܪ�`|1  ��Ly�2�%<�Pe���j��]M��6�~�\�/���w��7W��u�q;9�$�2D4ʭg���^�q�����|�����.�8F�ǡ�<^�q����v���8U�)�8x=�q�9�Q�q�2�C�p���(��,�8x�Ʊ�6�S�q�r���j�P�(UG,�8N}���3�V�q貌��d� �P�@¹�8���Ю��I 2�_.H�؈���1��1������{�I�+Q�y�+M
�9q���M�%�&ŞnJ����ddD2.5�૟ϓ h=��@ʀ �?�/�Zk��qͨʬ�f͚�ԕ�������"O*	L!�'��F,|X���=z�싧���� z��s�Z��{0�O���HT�~tz�Y�>%P���e��X�F��q�b��ֵ�80/a���eE��PT�e�KC�R��[���U�>�"��D0���6�;* l��.�\��n;�)xCCN�DM�S�>�*���:w�3�P��c�Ѝ?�It�=x��(&{��h��{�#)&y+�R6:`�6:`�6:`�6:`�6:8dt���l��    ��|
�S�B�§>��)�O!|
��S�dp��&J��1�T�U�������%{�5H��
�����n�����u��+{_�-��F������C���y�s�A?����a��+_c%k�<ZU�e��+~���A�h@F�(R��aɆjR�%5����R�Њ����MV���ذ·�ۊQ�����@�ݲ��-۽p�;[�w�8W�v���:�Q�q�l7���{ϹCY��\v�{�\��m�w%:v�{ZG�M��qRԸ�k��kr� )�B�w��y�7p�.4��q��$�����5�>�6j�t�Zl�M�|v�΢�Y;���lv�>
��E��(v�΢�Y;�bgQ�,ꈍ̽r%/A��N��)ޢ�!�����g_����~�}���:N�ӑ��ݏC���vR}zh7y�����ן>���x�����&�_<����م8��X�&ϗ����p����2�R�a.��<.��+��%p��7Mx�"�g7�φ�?������c��~���>}<��ӯ�sƹ��6k���}`�3я�,�<h�l�8MY�s�yn��=2υ��.�8�v{�v�K;��E/��,ލ�|�Ia�K�!���$�¡���^+��*Xs�`Q^ך���i���=�Ҷ(D;�jrb��;��PZz3���*J�ZD�9<#���3��AZZ�='j�xV�U�$�A^E?��i����8u��&+(�IYcܩ[��W�7Lt��톉N_&�$�y�YI�(����6\/j� ��ˣ�5"�)a�^tsR)�!&~-�5z����Ad����d`�9綹����F&�d�;�;=�@�݅�;�c��,3<�>U���m� ��u������N���v8ɞr��ȕ�US�V������g(`�4�
����%L!�F=��9Mt��4їO�ӌ�~���th%�{�^%;Co�Q���<�^rz5�K���~K�p��F�C;T}r��,��e�mQ��Ʊ-�E5X���Y���=���Ga�r!+�r!+�r!+�r!+��a���[���ύ`����:'S�9�a�.v��ɔ��	�?\߃���Px��4E>h�;��\�}�7��C�I߾8EF���fɷЅQ�s�8�s�,qN9I:��<�O�ē��{�x;8���d��.~��$ukN���=�t�v��w�Þ�f8���4j���Cn���ɼ�.��3OB����p�	���x�\��S��<A͞�n��N�s��qrtO��NN�5���5�gӾ&ou�6�pswS�B}g�A����xM�P��|*ϭ�ϯS7̼�7�,7���0�{��N�i�8O'���]x�q�μ��������,�/��?h��p����(�)����l���^���z�v�����Q��o�q��;0=�#o�ț}ys@G���0>������ܲ5��M6on�ys��c-,�4Y<l��[�"p��v��wn�Ƕo��Q'0��q�V�s�_0���F�7�=����M,	on0xsۢ[��;�i��-�Nn(wK�p�㌠g'&�u�x8��ݘu�l���L;_���r�g����.�l6�fc7�6���%����XG�l6�fcl6�fcl6�fcl6�fcwa6f�熾0���5u��Kz��#���l��1;�x+θ��>7�eڎo��_�+���,_�D�ݫ�ȁ��ltǝ�7����".5Ae���q�,���q��t�x$|1h����D�=����jAþ�.�����#`J����]��ZN��{��kJ����H�a{}M��z^���0y%4Р#�P�f@�L
���O���z���`1�t�岴�dם�n��:玷0<�
�^���w)�|�����
]_���������H����Rn�&����{��a=I˸|�O޸h���t����h���hƉ��DI��2����Ffi��"��95ig���DM��$Yz���,�&J�_���ߟ|��r���o_���g�����B�M�t����x�A�G[S�SY����*��P�Ë$[g/�l�5�/���g��v��EV�K���,l���Y���x[��$ғ�����}��0�<�=Cs<�p��!\��rZm.�X�෮e�n`�49~�=�S���Ԣ���5�">��h��
Nw��{ ���z�{5KhV�YT4	>�o|�%a��=X��uk�R�-�J��'c�o��ըyR�3>Awߖ=��>lS
���*O�Ysz%+Ȼm�S;	-E�gh�������v�3�U��x�Z/�xc2}���ǵ.3�*y1�-���o�deǐ	'!l���U	�~���jh�2+�~P����TPs��/4��I�+@�e�7�P_ݿѮv����;�;yabC���*����L���b�`V~�E�ɩ��,_��\τJ5�2�ɲA��~%L��xa/y��1d��(�2+^\A/��.94����}�[Qٔ�� $���Zde+�*��sSr��N�=AMl�ڽE-^�O��U�?7�E`پ)W��T�)���=����K�t�K����������'w�����h[*�K�|��W���(/G�^�j����Չ��[]p��"F/g���r�Η3�\7�-g�p���r�N$�'��K��{�>�~�W���]y���W<2ѵ��T9P�Tk��+R��&%*
��ٙ�u���
/�6����W��|�&�R�Z�;K[�lq����yd��o�����E��(,�Oƕ3���Z�3L���o�
�ӫn���2�1��D�=}���GN_�i�]��P�e�g/�,���gx;���/���|���_���cۖeںkڏ�IW�y�{KwL���^~��Q����Y��0]Wa���G�],����!�J�s�b�D�^?�EF>I�C|����/?�H`���n3�ÇW��aX�E�G�1�3kR�s����<��iE������
�bQ����k\�c0G�z��̼������� ^W;>6��U�*���/�״<�h��jbhey��^f��������T���W ��f�e��=��.��m_,t:��2(Ct�`��qu�>��)N�
�\�^˲�[3	$���[�-sVwr��o'����^0�ƴ08�薌P�v�!��u��|�Y,D�jF�#�R�r�9�o�]`��^Axy�V��*���� ���׊��V��:�������4��F7��t�A�,�ę����-�Jk:�#�\k�^��'�e����N-��8����Ov�{e��_?h�x�o�(]^��Ƣ�;�u�;玻p|��\���=*
k@�$L$��X��3G�Fyr@�]���D1�3�h�X�ø�;���Ed�_X�c��0{6T#�6��į4���mR������q�ty̹�NnW#�r0��o��S�0O����E�|�f�N(^s\�)�_�(�/��S���8�E:���"����I��癦�ulґG(���u�V�fש-���{�^m��W7��q�^mM�j���s�^m�{�5٫�S�j!�9�Zy�$��,�7���n��<B)�u�Wc�z����z�,\�0]cJ���^�d����{�=٫m��ї�u{�����d��Oݫ����j�ɓ�jL�r|Ӟ׫�M:��}�WS���Vs��Վ��<m���j甽���k��z�3٫��՗�u{�����d�vNݫ����j�ɓ�jLϱ�`��ۤ#�P��e��jj5�(9p2;j�ന/˷�~�!EL���,�6Z�-���ʒ,�
hhh��L[fi�Z#e�k�*���2N��˯ҋl���T��a�ǅv%��:O�A7W�uU,�_gi���]xO��4�	~[�%���h�m�D�e���2NABUZji\$�yUl���("Lw��MS��~]&�.�e��|�<�/bsۄ�4��*�#Y��0�+(��Yf�6��ӗa%IU`��Re�8Ӿ�����l�W��Ӽ�/�Rqm�S���,���Kŋ�d5g&R;��:3T7��v��e�l���IM�MT2X8�����n��ـ�݆݀{P���;����3�G�{
	��7�p�����
��:��    �M��Ȋ����+�Vղ�;ڄ�E��%�}��J�w� ��ͶJ��,�m�P��T)Rc��;s'�v�a����jᲬ`��0ъ(�.N�xǐ���5�3(RmS����;����`���0[�
 �$
����fZ��%�Ԗ���$S)J���������e}�xEv�GeF.����k��:N�F9	��h�%/����0��.�J�����w�^����ø{Y�Z����@7=��Iu�7��8�)�=尧������)�}6{�aO9�)�=尧��Þr�S����)��r7w���y�Q�����UN�2C`����/�g3Cx���3f��!0C`�p�F�^1�ܱ��EtOB]'+P���3f�����}63f��!0C`����������ޟ�=J�l�Q�b���b�wgя��E�,,'���)��_�noK��*}	�����b+X,��BĀ���Ǘ!����O?-�A|B��b�	X��?������2~��֪@ۡU̓�k����2�:��W��(��h �؝1a�S�-J`�F-7�C�nTx��L�@�a����O�u4����g8��Z:U�X��ݏesr��GP����2�����g�$k=��Pj!=�ƽ裰I�$Ǿ8��r|kU��N�3-���Q�
M�aU��>��+-D7��ݛ5d�ܽA��<@��1.)i�$�����2���Ԣ���u�CM�)��+�\euFn2�3f��˼�FJd�_Q.��!��Y}Z��;�����/.3X_���c��`���t������C�(LW��@��BOw(2o�>5�j��=u˽n8K�z⩻!��'�e~w�{��O���/��u���m�TM+��*��2�O�/�MD�>q^�˖��Q�~e�9���>���(3tߜ�[!���~;�^f�K򀸎˗�l��UB|��[������/�8���(\��T��v����`�����B� �'���,�-&'��Ϊ����?\��"˾���]婹EK�6T�e�2�6�y��'�4L�Y�N<���ǁE}_�x���>Q� y��V�\Y��iD��6 }t��~�ı�;0��ZW�B#yS;�����;����;�6�K������������vg_�__�q�>��G��-��O�d���;�!$� ���e��a0P��_W�v[w��';��x�������I�K�\��?>����1��w�j����lҝþ�w�#�P��I�
�	u0T��r��9�
f� ��4��n�o���"N����}�0�W���Z?��Ƨ���xZ���V���5�|c���X�����:[w�����ǺݿT��ڶZj��՚���T7���?x�x"�x	Kk���?��[H�ƻ�W_U�n-����q�z�Q���Z���Ʌ
��y�>�n"���z�Ql�X8����熉���g��` �Y~�Iv�g�㢈60���O�k�@��?���NQ�����Z����}j���
�]����#�.��>�}%�I���`dj)�E���xUA��o.�2%,���Ϣ�XP�H~�e�*�˽;���\qv#�U���0��L�4�I�P��M+�U��q�'&,O_}��ݤ#�'�Ұ�u"�i1��#�Q�P�m�$��۷>�tZ�,�8�&�&��}����3(y:������94���좥Em�VC���M��XB��I�jkC�Z�׍Rc#�}'jz�8F6�khh����޷u��P�*�66���P��@�Ǧ>�|)&����/��R��c�6^v�9��3�s�aN�r�䜉=��v .Ew�'�W�O^e�;�h�Otz��%jE����ݽŦ��]�`����WMn���:/����f9JɩPx����tk&;�3�%b��s�U�iz�U������t��������)|D3`��aF�|��	p��],2M�
�p�Gt~$���aJ��#Z�~����A��U�w\��x�z�h	�Њ�_�s��8�$��I��&Xar
��B/J�����a��2�X����K8_�0�\HRJ��U�T[��	3�qV
�U�~DD3#4I��P|�2L�V�o��$�qj��e�;*���YRk�O����m����
2U���Q�ل;*:��ޮ�3ؿ���h
�-���k�B)5�&�%V&B���;��ڥ��3��kU~�{O�t��c/z�B%��<�؁a���EB^cq�=���}ߧk����n=)��8!�P�M+�U3N�T`nV�bRI8O��q)�cREk�c:��z#Gd�'a�Fld1h�$�������H�#Z��%pLR=�`���k�b�#2���1�5�ɬ=&���
>�zy�ζ�h=$�z'��qXf�?�a��w�,�ą����!�P�(R!�"��q[X��i�B�͊ڦ_Y�"�2m5���H�4�����8�2�{4Je�� ͔A��R@�1�ʳ���q��(.u���!�u�h��o�xH$K[8�a��HU�i*S��(u��t9�_���	��=�lC��mȌ�V�4m��G�0'�!�Q��9�t�0$@����l:����a�iXo�('� ���I��4��������LJ�������Y����.f�X�"�7�7�?0��~>�/ࠃAQ ����YK�b��){�H'k\�1m�;wZ�3GyT����(ǳ��<n}����O/c<�'�����r��E��Rd,��	A�B/3�9�E ��l+<b��;ʅ�p��ē���wB���+�9��I8���������!�L;p�����b��R�`��<�#>����@v+O��Mm»=|��FZ���H�)qGY��_����]��`F8+R4��f���kᴍņ^�9�kX�`��JN���b������]� �8��Y�	�j�RJ���7�օ~խ�(-GE!�-!L�U3ZK���e��/�uE^K�]�؋}�S������2�}L9a�0�;)��C���
k���ZWR�ti9�|kA`�
Ŗ@����p(����N3�~�]k&H����!�LL@�C�Eۋ}=	����)�|�sZ�>�g����r+S�#Rg�?��k��ϝ)���bӟ}�-d3�s�~��o���.GN>���^�cEx�l�������u�!������MֹD��E�]�=�!X���g���=E�PF�f!�0�~lMC��֡�^fO��XQ�X%,�Lw��b{e3�"�?<׺=�55�M��*���.����B1E�25�P�Ov{TX��u�S��@!ym�z�d�vf���E��P �Fs�eW���6l�eq��?��ѯŔH�I?��Nu�9��r��Ii3ut������b�&ʝ�؃6s��,�����씭#*>�Nt^�NN���Dխ����D��r�ަ�Op���T9(�fT����v��$�~���$9��Y:�=W�b�}O(��fkV�fkV��
C�=kj90�ڦ'�7:�~Ƈ5�;�[?��h��Δ���=+�~Аw�ͥ�MR��Gv�I�0]����>Fk I��v0V����@��{��W�����k���&�� Hz����O�4�!���:ϰ���Q����V�.	V�+ܔ��5�~1y`���h1�Y�+�.�D��=���"t��!$ՍM���v����x��?7��Js�rL&�	����b��dn������6 � ���ǣ��Bb���a����Ç�?���VQq��.�Q�r��W�>�|/�V"�0��ϕa��� ��h��� ��0�`F�a���D!��$�.+�$Nr��&xF}u��U8S�%VLeV#��&̨ؿ�R����D�OOT��h��
7>Y�o�}]4glB�q���u����g����7��DYMw*�']�EC=��EG9��t8�����xDvGƆy�����a����}-�������s�C]���
I]�%��g�a�8-��28!ݒnܱ�0D5���_|M 7��KżL9�lX�2�w2��:B.BL`_q1�ࠞҁ;�Um�����g�DB�H�"��P    y��$�W�Kx(�ל�@iC�h���Y�e�`@ 1��[��l�ROظY���s�l<�4�s�i M��s3��VrGR���3����������f�Pv����n�{�V����<d>z��ٗ��v}0��/����+0>Y���l�kՃQ�$�uo���$�*�;8����+��Vc�(�c��p��A�U��km�����<U=wb�	Ik�y�֣-�1�QO("(�s�4,6�SD�����E�?9��%���E�2�i��Q�2�;��Mm����{�]���82h��k����m�����.�g�v9<�g8Þ�5:*P#ZT��mןo����`OJ]7=>�iL�F7��#�ݳ{��iwomq�"��x���g�^w��]w-"�����┮i�o��۫8܏�Ύ�K�W�䳒�
���ä3���h=�׵~ ��^�`#,�v��ҧh�܄��>de�̄S�B����tx���t���p���gZ�-O"�.~&�	���lwp�h�e���1�̽�6���E����b�.�u�ks컝rQ��ա��nu��1��@J�	#�u��٬}J7��lL"��c�af��u�)L���R�gM�1���%Y4�!����;�w�s�yql��Z���\�����g��B�s���J��,��f�����o�>t��� �kÝ����L�� �X�yW� ��<���\�ϼg� �EgG�w�/��e�<m��[��w7�|�谼#��⌢��v��dĀ��L��9~�7� 8@�n���$:�2+?�I��/���[�:���k9�7r6R��$�ld^��?*��捀��w�Nvj���7�ۃzL7:4+<Et�Z
-]�a�(Y�(k7ٵ������7�T��]t���������)`6�lg�pq>���2u_-k�:�+@���I>����㣩���~:��[� �U��Nim���A�~X�m�1_9��h9�E�;�r)���|��"fJ����i�EtGqr�9�@9�X�M���>=��whyo.�ǖw���m��ݟ�U�O�|k��|k��|k��|k��|k��|kp�5�~4�v�1фN{�`�-t��i�Ro�k<+w����w�r3}�,�6�h�b�ü�� ��;�/t��|���GJ�xj�,�`i{#	���Q$��BuQ&44x�<:8pD&ãFf45h�As h���kt��v���M5W��#�B`ǅ�Y����|k� E;&���;֡�����N�l�#K3q��&�:S�Ou]���yB6��i�;J��١�D�����>�����s�ǋ�e�n�NU��*�}���6��*N��r��f����؃ݳ����S�hY�g�wP��ig��ݳ��v�Y� ���>�#P���X�����=���Mz� ��o����:�5��ЎM�2�g�	o��-|l�#��ɍ��rX�;�NK]{�{pWz���q��f~w������xk	� �]�=�ڣ�g�F�:�}X���$M}�N������mh,�Y'h��N�NS'艳���x�{�t2q޻�j=���np�8^�:{�;��8/N ������w����������0�=T�����q���^�NЧ���8i�|��M��"9y����N�x�2L8�f���V��OU�k�:<�{�ȓ�f<��Θ2�r�8�TF�}�9G�疽�0�j��N�]�m�6b34-����IA���_�7=��dd�"J�����nq�?{2���M������%jK���B8�Ø�=?ʹ���P��Jmn�1�ZZ�jA�q���+�S��em�x���J�)*��T�1FbI/c
փQK�ˈ졊�0��MQN�Ư�Ҿ\����o���V_����;���h���hL�� �j��"�o�	=�:�ӵЩTp�!oVI$�NFO'��;h�(V�f�oV�f�oV�f�oV�f�oV��=Y�_����]�ɷl�/���m�Q���|��6����Gm>j�Q���|��6���}�Gm�87����������y����F�d����ևr�R���n"<}u]�}��L�C��pc���P����)'��R�{_��w�g��O�A�K,۾!��%&��7k}���=�������gm�~ƸO?#����u���n����/�aG�t����/�����_�pl۲L[wM��7��7�~o�izz����Ϟ<
���/>���
�8|�����������^~�8$��������z��%8�>�����4h=ҍ�!���/m�,rlk��A�P����t]���F�?o�y�y��@a��{���vU�����7���`���U4����e��SH|KT�-sVw8�3�I��,�w����%ó=�`��9W�9�H-G`BS�tiꁰ�<{݉��:o(���v�EU�S깉�Mu�]�Fw�TQl��=�j�u�_��7.�հr��t�y�����O�%�_��W�/Gē�.�qp������M�%A�R�&&��e�-^,a9(��T���f���~KW�����&/��չ�f!��I�7�玹p�sP!����-|���-|���-|���-|���-|���-|���-����u�ͮ[ā�4��uK]'���8;���ptb�C,M��:��	C,ͼ�7!��p̥[��d疳Lϲ������F����A�F;��P��ٞ�����y���u(��X���<������-��B���ΰ{���&���ݟ�#:f^�� �-_�J����1����l�aմ/�a7S�hq�5�SvO��w��W�j�s�������mP����Ƌ������z��p�nZ���/�u� �ܡ��Z֠��/���E��܊ԣ��W"���C�� �?.�I}D��z+e�uv����)��OIuϵ����BMɭ��慎�_�Bg�w�7�߭����5����n����n����n����n����n����n�?�ݺa�)�n-t�5|c�M�R������C7E�rئ/n�,�� 0` �@�� 0x�@@=��F�n��������y�/��|���>���~��ߔCwy����_x��E��r�h�������)�x�8U�k����_��7�2�ͦ������2޼��Ę�}�o�u|ϝeer���~�9A�v�u��x�$��잀�	&&LL��01ab�Ą�	&&LL���1��כ^R��{�BQ�ɵ\�=��8����ri|[�x��纻�l�7���W0���J�tٔ�x�B�O\�/^�\�Spߝ2%����$4���`���.C_�!��K����a��+န&�M�x� ����ڇ�(7��n��I�
?"�!t��*]Ź�k�^O��Zi���L����V�)=�A
C�I�ަ}�� �bt�*\���D5�q�����E�t�&�A�����^CQ��uT�n7�`�m��;���&����C-��jAP�/+�����a#B��� �Gv�>W�
k���p�'�[�u�ǰBaPd��Fy�\��Y$� |�&P]x��`{��T��ps����8�S;�o�S��0u��Y��������=Ǎm�N:�~�1c�����.�	t�7f�]L;���hݱ��y�c>�|��(�Q��G��2e>�|��(�Q��Go��6���ѦN��F˳�QT1���V��SM�C8?`a�>��n��\� ����f�H�5���i-t�0�x���������:�~0�����:�^0�a��7J�cT��U�8�y�*r�;g�smq��A�����PG���Uʀ\O�L��{<�����~�b>���<�dK��A�1��)�E{Л%cb�Č�3&fL̘�11cb�Č�3&fL|rL����f���[L,�d����mcG*�����L��{
m���gf+6�iu6ۜ淧��k��lk�B������$�R����x�fS����'Ԑ_�E�\h]Ũ}��G��M�T#�mU�QG�Y�*��J �y�D2N    �Y�g��ԡ�5���SH��f�8��`l��^�x�=��R�3L*��Q"�)�p��g��G��T��pS�Ԋ4z/�-�H"�<�L�W(�o�[,D}ܘ��� ��l��Eu�L��5Ւ$���]���M �,_�ޤ��"UgX��� ��kv��K�I.�/�����@9�����xR$�6�� �%
�U@̤$Me�NI������#B���h�_L������O�צAn1�d�0�a$�H��#F2�d�0�a$�H��w#	H�3)�d�
#�q�Zc6K��k-gỮ=��0�q$*�ނy�1ۼ�)��LGv�}"Gxt�B綷������8׾�͂F���8�?g������a�6��u�{S�H��A=BI��Y�Ňn"�QDD�E��~0�V)2�3B��x���X���*�īr�S
��	�|��Z"�,:�����c5��"�?}��9!$�wB Q)��gmO�݀RS��� �4�ଡ�X-��h0���ӄU������b�DkX�Qo1*�\`](�U�қ���	
e�������F`S�ҫ,����f~�HB:E��b���t�5i��=mt0AVT�+(s�ȜZm��$�E0X����!\e��U��2%)2!���"E����m�gMsD�@z{$p)BԸ�Ǫ��w�mv?b��J�}X�U	��q-��%�^�12x-�Gd�h��m���ɒR+�5�D��J��*�s�棯�*�# o6K��LU�Q~�ϥ�����ѢY�d#�;��0(6���k�>����oU[��ą�(G�!��E	����o�F����F�ިRLwP��}���M�
�+|O*�׮?�RA��v���h��[�͡H{j��l�O`�@_����ו�Vb�,���.h`����2�#�#B��X�"�vN;_�Vh�3ux���ȝ�r�L�����m���0BΠ�T�0d&�V�Ѵ۵����ʵL��� ���I��)�Z�n�SW������mzް��!���������������������������������A���(��5�˭�����s˵���z'��l\���I\��p�)���?p�`uy���@�
��7)�uV��еD��~.$ྈ�j_�)9��	K=a���-�&���X����v+OB-=�GU��-�ڨ=W��2-*V���-�9�]�����kdc�q��8ʋ,�`�{#���ZW1��ށI�Q�8�u��8�E�,�����x"��<jԦ�8�h�����vF
8��o���?G7��eۆ���ͧ~�0qc��č�7&nLܘ�1qc��č�7&nw@�$s��q���-��#7�HU�]�c9��~'��|�Qݞ4k�y��)�hz�ߏ܅�i#�}�~�-�ᆼ��΄o.�(B%hTm?��Hh��Kڎ� �)Na���o��K���RZ���YIϕ��>����%��)��%dC����yY�P3ng+rN@�21b侊�0�@^�e����MLN[���\(`��Wh��<�r�[D��պ��b�#^��K�xUG%�5Y4�r�+R�����Q�������;�J�͊*e��<{��L(�22�H��*u&�]�8%��ZWT�F@q�Q�
�A>y(ҍ�f�n":�(�}@IP�s�	^�*�*4��б���3��gBGL��-�5�A��H�:2td��Б�#CG��:2td��Б�#Cǻ��H��t�:��U ��6�����'m>i�I�O�|��6�����'m>i�I�N���tҮ뤻�v�>��c�:�������A��N�{��N������:�v�)��9VЏ(���8��^��e0m��iU%�Օ�b���&F_`��B�n�8���*��p�3Ŗ&c�������4^�i��gC�fR��y>�la
$�S�MJ鹍|�u��=A/kT^�~�Fyc�_"t�j�o�*�vfv�/�ɩz���P� �j�i�>��Ш�L��S+���d������}���y��U���a�ߕp�W�OxڒUR`��I!�4±-ԑ��&����B�+��Ƅwo6q)\�-a����ѷ�Gkb���E�o)@4}�C�꿯���{v?�z[Pe�ũ(8��	K�JBPȨДh/�����ԏ��E������G��dPɠ�A%�J�*T2�dPɠ�A%�J�*�T�A5�_�R��sU� ''�Α&t���l�q�>ds�	�tf�A5E��JW?@*O!D����9�Q;�B	��r�� ٩�E�!��lE�ᒈ'!8Z�����We����M:b�[O ,eb�%�Ja��rӈ��|i!����
��.m��Co.b�1�D	YAƈ��4a\`�D+�|���1F/(�}�Lg�A�I
i�:N,@"%p�"�����P��:Õ@������?��Bu0d�H�Z\MĹ�s�܄Q ��d/�~�v�@1J�E�)���A!�Rs���L�%�0×�!�:�EUA$��sB�X$�Oa�Ie�������0�ɺؽ9�С\L�0����&��b���d֍�X�=�h�FJL<�A��&�Y&�Lf��2�e2�d��,�Y&�Lf��2�e2˼�F��ˬ뤻��2]s�e�Gz෌����t�Iw>���?L�� �f���t�-�����}��~/�A��&�S�Vk(ˣ �I���A�O
��;��q@�I6AbK%<��h�^%�_���HdS��!�˶%��C�C��d����t���M�^IBEU�� �'yH��t�FjܰZ��E�[dn�����V$�W�%հ�*Vx_���,PZ����sϡk21ݵ<Ow�iѐ���S�{�q�mkw"�����(ID$Z�Q^v�b��w��nHG���I�)tܯ)m�M+�F�=�##����=��j�V�ƀ�+o��&�$��3�F5���=D�Fq5�װV@�����B�0b�W��#>|Wl�vo�A[Q7����w%�V��x���IuN%���,��۰�(T���E`[��0�p�l�+�p��P���}��Z�мR�����o�>��~�[���&!%��Υ��(p�N�pw��T�Q�I��a��үC
,㱴«�%�}������HO:�&�2�L���"1˲��a�.��l����3~g�����;�w����3~g����n�;�W���w�S�!M\� ��T����o��]�fq�xH�F�r�5j���.(n�`(ʬЮ����� �G�
�WY��*T�}8�n0�2���"N�
.�J��M�o*�q!Z�R�*��RRI�س�u�j�a�iJ׫��cf��`�Q��0��CJ�l�U��.#����W�f�������Հ�qJf��&/3+4^��-�[2��Q��!��\i�'R�f]QՕ�.��V�/q�	�HB�>\3���(a-����Q�gZ�A@o#� ����U$�P��G�j5~Z�"���+D5H�u�R+ů`�G���2]
�Rf��}x��F\T����ފ�6�T�7 �J����h��#�����f Z�u4���L�q�x&�*<x��1�c�� �<x��1�c�w' O��q� ����^K]\v����cbdSУ�߉��?�z4E�t{���ٓ���A���hEj�	�=7[�J	m�x����Z��=|���hE^%E�:�����PY��p\�2D.y���96~aD�ͅP�]�v�H�
����J���~����t�jm8���#��·�u�ڹ�.�������
j��m��ck�����̷�o1�b��|���-�[̷�o1�b��|��֝�-��>\���T���|+8J7��-��3=�g�w��2�I=��;�7ɷ<� �:�M�0�����FG-*(<�7��I��BV�"ǆF�YV�=w��t�Hw���.�u�{S�h�:f��V�l]��"q��u��w)�G�~�R*6��B���=�U4��b���D�k;]4(U܁��Z�7BPM��=�3n<�E��QՐ;��*ۚ�g�F!-Zj���*    ^���ٓA�Kԕ�C��P��&�~��S��q(I��
v��>�O��b%��{�,sa�%P�|�:�����2��=�d+ԓ�?���*^��,QAr�zŦ�Hh"o79ɼ��a�/B-��1���)���TqeZ��,����Ѳ<�N�2�,�8�y��|?p-���i"��y2�d��̓�'3Of��<�y2�d��̓�'3�;`���{���u
D���y�|:�G餙熻0l�6��iL}Z+-Ҋ�2$�5��F��0z4j�%a��V ��v�v�%�f.��*Um�|)�$.C�Quf#��A��x��>߻݋Ң��J4F��3���N:�Ss8�*�"V�?6�H�
��2,o�8�W�2�e�0�a,�X��c�2�e�0�a,�X�N�{��u�@�2�*�5�̐�un���𝾗42��h�mh���L�/��OB�w�j����{~_�ƀ��*T��պB������L���d�z��x�h�	wl���^�߱�G��\uC��˂�{)r��c#��t?0<k,D�K��g��؋�c/�^��{1�b��؋�c/�^��� {���>a��N���+�^�͐"�u���7��H��l���Ҷ�ԣ)�kL{��q��G"/�]趁U{�3pC�V�gΗ_]t˜�p���)�h9z�
��hO��Sк��i���!�<
kQ4�DV4�D��a���I#�����0�T������nxp8�r�xJ�T�8�a���$.\���XVi�LduYf"�=ᗎ�Zej�΄]d]����Rz�Z �0)�1�4��X[�6l.�6����ɛxBQ���2Ƴ���4�/���P�\��bq��0�<^���a��r��5�9.���HpZQ.�p[4�-D��~)گ�$�mS�E}�Ƭw��1��fĊ�x���/��"p���(�U`���I+d�"lo���й�]UT����{�Q�q�Ad�B�,�
���'�֧�5�p�fŔ��ۮn�ìأ	�dV̬�Y1�bf�̊�3+fV̬�Y1�bf�̊��W�d�:��Nַ�Y�u���c���}�;a��L�ݴ�I����s���c/\�7���>�}'�sg˯)�o��=����01�B�[��}o�����!?{&kW�nNR7��,�O2�M�`�V��㞩����Z	+��r�v�� �����!Q[鳰柸��Q��0���S�A��7}`NG	��L������9��}�Ȇ�%��uajo��8�M�:7�V��
�x��R�q��Km�f�MbR�]`e0��GI��Ƞ;�PY�@��N�&��pέ���t��`%�g�����?�Ҡ`��<ޖH���SD�&��M�c��ɋ�����b+t����? ��.���v
S<mB�`���pNr����+qAa�#�9B���B	��q�F���l��D:���4�;-�ԢĄ�	�c�� ��|�Ӗ\��� �;�&�:Cg�/ѳ$�V���G�ThU�T$]I�3u6������M=q6�������3Ig��$�I:�t&�Lҙ�3Ig��$�I�]����'�^��2l��O8���p��p�`Pk�~'$؞M=����L��C�N"D�w����:��J�a���pC���)���ަQ��2�
�m��+4wC�I��M����UZ#�z&�)濏�r�]TR-ҙE|�m%�G��ٽ-3��L�W�y!������� .AI��d\n��3�w�1P<����ݣ5F�&�&��ԪN�R��Etߩi�R!��d���P��3��4�AR����
��l���(��u�h���KR��mlHIC���BS:	�i�YG3�s_����}"������*�|�}&Ts�Vo��q��F��J���(aG���:8rN|��VR��C� �(U�,p#��q�f\�u4��Ĝ�2����`go�%�K2�d.�\��$sI��%�K2�d.�\�n�${�7��N���� �#��m,�r�,�̆u�uך����	dh^�x�u�X�	l�W�֜pe��ҫ��)�C�S�r���:҅#�}�k�����(<s�_EqZ>��0�b�D��a��)]��E�"�~@�f��^�����j��gJ��RD_�\�ݛ�Ā�"TPK�%�c��h�r�b�J���U�ba���­5B��ׇ#�Uظm���m1�]P�/��Ԡ2�f��Wq*A����d�@z2���-�=�Qb��c�����h���=F{���1�c��h���=F{����	�p�~�=Q'��(��ў�r�-�[&����N؞?�z(E��i���:��Nb�o�������e���#L��Wd�?��A��NE���A07��D��?����>i�Yk��a|����M:8]Vy���ٲ�f�m������y���յMu�Y���$w�I������o�^�e�.�ǈ��N2��	I(#!6EZM1+r�*��UT�&6��%�\�0��Jͼ��.�Έ��;h!m�k�ARv%k*ߔfO��CC����P�-PY��1J1��_�.jSr�Y�jVE�3XW�L�W��MuB�+	��K♔EAO��RZ�k�i�3t<O�0�!�O��C�����x�0����&#LF��0a2�d���&#LF��0a�	¤c�w����*�t��wT�*��0f��ѧo�;�U5�z(E���4�t �Sѷo@���"�gѪ�s��v?P�Ȓo�(�J��i�S7���c��@:&='j��'C�t̣����ys��
�v?�`Q�������D��Q���W)�ҽ)��9�J$��qt��U&��q�*�U��W1�b\Ÿ�q�*�U��W1��\%���}�Uu�\O	�c���^���|���t\��k�Y½�N�kn���1�4hܝF��e�c�X=����M#5Fx���p�fE��8ԤOW��P"rwC�(�B�&�ZAE0��E���	&c)e�ծ�Z�&����W���`eV��`�b�c�xl
��W�mUhE�İ*�V�'8&m�e*�ʀ2�+�.��W�ǧBcJӘ�TL�9hL$f�����3��,��X����1Fc���1c4�h���1Fc������^�>���N��hl��:��G�N;�oGi0F�%46�U)��Oƿ0�� ;��~���0C�0�"�mKܖ+1dH�$��WZQ�׫vX�qT�z������B��� l���Xa^	��D��3�8Y��FV���Ǫq��|_��V�,� �ά�Y�*fU̪�U1�bVŬ�Y�*fU̪�U݉y�2����䛦ªtc��08�`��z�����[1:fۮ�%׽Z\�y���24=K�YO�mX�4�@���{�yڜ��`�?ОG����U�
�n���Yy9��_~'��ح��$C5~+9X�P�'�P�L�X�)���G\_�ԴC(�P�B1�b��!C(�P�B1�bu'�0�=�P�N�e��W�ҏ����u�����������
s�E=��{�9M��
S���;ޠ���ԢjW�!�6]?�ݝ���X����+�_Q����mT~�Bi���E���J�*߷;�YF{����O�4�*KTb��S�7ɲJ��S'��8��):��X�e.�:�g��7�0C�3�E���]�@���XڧϿ�[wmx���?�O�'3���_E�JU;Q�L8��B$�;����;�ŢJɍ?6��cb��@��P��"��e���~��Qb�1 �W �*!�o?�q���5��aG�mA���D �"J_�����4���b��@Wn9-�>��W\�9d�a�&�{�8�6"����K
h��Z6%�d���J��$�z"��иI�jݼ%D)`��~�=5�a�21۳-�ч�C���(3Pf��@��2e��(3Pf��@����̼O���x*���q��g-L/�����5��+�a�s��,�nx� ��D��kpd��@oW������ 7fJ~�
rO��*���Cgh�����J�h�2R�ö�)���턈����� qAbn`�    N���p���������0��1t�`�[m{vK�%�}ךw�5*>�:f�^���}�9ִ��[��:G~j�=g�j歀	+V&�LX��2ae�ʄ�	+V&�LX��2a��ſg���$cuJ�j���<�����p�`@A�<�dz;�՜Mz��7Mz� a=�m�\�]��k�Q��&ç	�JѺ^�b-�
�&�CRh���蒯S���T�bb��:����mwo�b�2�P�0Ϯ�s��~Z��\k3��%j~RY��"�u�M�P\
m���_hۈ"�0���^\�n$eP��"�h�3�iW�z�A�B{�]ƩT�\�N�ʑ.7@XV���АL4(K%�1��Ca���X��
�I�O��t)鍒>���f��&���O+"��-Lw�X�O$)ؽ�yh��!?�M�!�8E���z:.��LG�r0�Kcb���`�K{4�L�2d0�`�� �A�2d0�`�N��@C��:�z��0YG�0�"��p-�����[ҽ��ä��i2h ��������d��+dp����E�P��u��\�an�2��h��
���!���s�Fֺ�mJx�
�<��em!^g%Ȩ.���Ҏ�!�K��d�F��F�]��=窊*�c�!
��y�k�g�@wU��.~]E���� W�6�VU�B )����݈���C!%$���BiWP�09Jk��s�'"�-+�F�>�O�Q�4Fi���1Jc��(�Q�4Fi���1J��&X��Bi�N�m�(��6����Gm>j�Q���|��6����Gm>j�Q�n������N���Z	ƵV��.�s�]8��xޱ�w����T0P�n�ӡ;M����I�����J+�~�7I�֮⼬p�mv?��
�|D�X��fiPm�{ӵeC-���WQNV]��HlǄ���*Ֆ�٬6�QU�dx-@�T�;�y|�"��*�_����d�����=�>R-D$溦a;#V�:����Y�*fU̪�U1�bVŬ�Y�*fU̪�U���a�}bUu�l�UX�錳*�(�A��i-t۶=��Y�w�e{>�h�8X�{�U�B��g��۰�Y�
�*A�V�7<�AqZ*IӨ2|E�{^��&KU�H�1�^��?���c����J�L�p3�x���U�8k���$+��'iT��J�S�D�M���r�pI���6�������&*cHf��tb-��;��q\Fh�sa���5��p�Ѯ�db���9lO����7z��18cp�����3g��18cp����ٝ�3"'��g�N��(������Gm>j�Q���|��6����Gm>j�Q���|Ծ����/��^���$���'mc\E%8F����u}a��Pt���h�3��K�;�>��b�4TN"Cð4T�����
�#a���#��k呢� ��c�����>騟|����k�kѱ=��Dq`+�,�D�����\���PJ9�҇*s�Uf(}���3|;Ї�>lj`�I�(&QL��D1�b�$�I�(&QL��D1��}���{D��:��j-e٣(�֏�(���u=��Z�����\gR���u�E9�,�x!Z� p,�or��鲨=�ݓP�İ��Ú�&L���#�_E]����n	[Ǖ�L�k+(0L���]*�:�pO���8]	�%�v�c*xT��v�Ls�t:��H�w��	%f�����0�r�[�L��`1�b���	,&XL��`1�b���	֝,�0��ur�fK�8�2��/��0]�3�>|1�	�2fS���5Q���S��u�b'�zǍt�e9L)u\+�mՉ{�U�Bm��?T�3�pB��Q������2k<^�)Nɫp[�䦚��q�0�ً���gs�t N���T��Z��؆?���R/	h1�b��@��-Z�h1�b��@���;Z�h�/�%�d�T�l� �1�2 oa�m�#��f��6���J�<�=j���f�����,�G�#���p����x��<�r����Phq����UR �R��v	]-�
M`���)Ǜ-NZxE�&'V�akQ�[a��RL���<[�\�ܽ]�PJH2�6tg�74}����f܄I5�2,����?���K���"7�C�O��F����F��#����R�_�};oCH$K�O3u����
:f�N�m�,��ѠlW�:N[�`�$��8�.Q��'̈WTg�a7]��1fH��aNF��WۄBq,֢W ��l
#`�ֺ�|w?�q�~�S��[U��.;�0�ċ����m�q�O�>n_./�����y����B�<���������oI�F�������h��@�~D�2��2.��խ��X�D%�)�!=U|9ux�ޑn�Ebz�����0��h�0�1�c<�x���9�s���1�c<�x���;�s��{�,&�:y���9k\�̚M��A2gz3p��Ϛ�7#?[��7�fS���Τ���>�7O"D�6���.��8"��V9_H�N�i��7#h�_���eY	�l.K$-Df��E�$4�.DF��qz�0r�6�U
۶���ݛ<>!�j��m�(smҲ�a�S�:��C1�b��1c(�P��C1�b��1ԝ`(�!��uruS�P�8���T��������߉٣=�z4EwCy0�)�h;�9`�h�wE��b�j�,��VŊ�,E�+j>�d���T3��!�	u��_S�Y�Z���n	u�Ut�Ȧ`z�%�h&��I!M[���?Q9woI�j�s��&l ��RT��j���e����Jt���l$�[���3-�vw�~ԥ|�_L��~1�b�����/�_L��~1�b����N����~�:�FK	+�_�Q��<׃��;� �q�	�rfB�}�u�2'ᗣ�_'��n9�0�X�)�_�F�fZ��4�̗I+C��U�"���H$�&��4U������N�v��" ?���S"1ϵMô�A>��>0=}t�8��[疱L�1�^�;�Qc�ƨ�\g5�RtϜFƎ�|���=�{����1�c��|���=�{�����߫	�}�{u�LWu���|�=�>��/Kw�6�#Kw65j�n� �u �B���y}ރ�� ���V����۲�|�@bT�^�v?^�˺ѻ����M�(1��}�u��hR���'�OL��>1}b�����'�OL��>1}��$����O�N� 5}r��w�f��.��N�w�^6�z4Ew�i_�{�>�D�&�p	�Z�e��,���~��Sq캨/�$Z�,�0��97�9�,7Y��S[G2|��VO��%��!��V���?�Zk�w~����Dy
K��8Z#Wy���<��►[�L���G�xK!@��
F*Q
�)(E)P�&,�_C5j�'�1�!���g!R�KjS��ń�ͩT ����pH��]x	� ��"�$�XFn�A޵#�HF58]�N���~4(���6mײ�A�I��cPȠ�A!�B�
2(dPȠ�A!�B�
�
Rt�@����VS��A�$�ͅ������N@�?�z4E7Mg@�I�������n�U��,��]Ij�f�f�BF�,�䮨�^�0����#RRL	�����s[�wC���9�� q�b�j�'-�H����%fx����0ղ���޸�q��/lǰ�:Ɓ�f܊�1�x�)�oLi"����v!ڎg��+�N{�}���!;a�I�}�B�m�¡�8g��$�O
��9�!I:�2����v���zH<�U�a�ǒ_��_##.�����/�_&�L~��2�e����/�_&�L~���	���~�_Q''P��8����i���z�7x'��|2X�0��ځ����$BD[�A!�qԯ�˪ ���q`���atU"�E[u�a�vY�Of麊S��_���/B!R�&�pnH(�p�		m]{C��'�h�����'���b�����'�OL��>1}b�����'�OL��>~�g��d��J��qe(�H�9�[�:��z<�;Q��gS���3�����V�:�-�4�8���JI+�삛��7�&Ja9�}�YI=    x,ht�un�λ�R��lr���R�vo�םB�(Ҟ"��ݛ�E��!��^B�msb�T���6��"�F����X�&�_���8��ұ_	{���5��q���Zn.v?h/�J({ik��.���L1&GNE���`�z��<ZQ�&X ��D�E�F�+\�ë��fi�O�Z��a \2��P�(��68^���W�����W�$�_����i2�����⫯`)L�7�lR9��Tĺ�Z�v��n�ZWn/i���mb���͢�˷�H:V��Nd��kx���k�xp2��$�>6�/%�����>�F����2�d�� �A&�L�2d2�d�� �A&�L�w2ɺ_ S�ɱ<dz�8ȴ�4Ht̅���3���w�Ԟm<�4	2=� �<�M��{Z��t��6���B>&�c\��
zb�{��[��Hg�Q:�o�_�BjE�D!��o��>a ��B�a�\5>�LM[G�mPb����6�$RX�D��H­P2�"�ڻt�W��	�k(��*��7�r�&E������K�5���{!V\�~���Rz��2|j�+A�Ik��N��gҭ�_~�峏j�zFrhX�z��*�EX�G���J�M������6*���U ��Y��LP 	�#3�F���Jh=��E�Ƶ�|� ��߰D 02�-���+t~9R8i����Og���w�8ִ]$�x���H\� q0�K��W��ι�/<+��s@�صne��K����os��k��2�e^˼�y-�Z��k��2�e^˼�xm��>�ںN�e)��wx����-+0�>�8���vH�\����=��?���42��b�>Nwo�SƒU�4�S�W3j��*/�t�����]y�d�H5���8~��$�$ǒTC�>Þ�c�0����2$ָ�	<�/*(T"�oB~[��d��-�t�Ӧ	3��T`Qiw����"130�6�-���?@c��1c0�`���1c��1c0v`L{�"c]'�W��4F��k���97!?]w��**N�1�VI=r�OStC�Td�tc���B�z`�� �:m2��̵����2L�\(��Ja�WtXG��e
;�,_�ޠn���61b�ݛ����DĆ٠���%�DG�������đ�$J��]�V�pqTV��T��v$�3<v�&5K�g��bJ����"�P1���Yz��Gv<�j&S1�bLŘ�1c*�T��S1�bLŘ�1c*vT��"����u���Ʃ�u�e��/��ݾ�B��{}1Ju&���n�SN�>@aNS�S�t�o#�ՙ�SOX�>T�W�Q��f��g��W�O�P[���j�WE��/�\81�$BTU�k��B�ޗa3W�hoJX&\(�V����v��ǝBƔ��h�&-��X��mi��J�U�qg��<&�Wq�x8N�J�p�V�9!�m(�,n6�^���U+^a�;!ȫ;���V&f���# ���ai����	��]����z!�?�ŊBG���dW��lw?��A�����I�2����ỻ������RRNKA����P�����#����.;�RŖ���Q�'d���%�o�xH՞���Mbaɍ��U����4��0��Q���e��(*��f+���6�'JB��S����dB��O�Uh�I��i�2D=R) A��ط���i��}AWj��Z�_�2��� ��Q�Kv*�@c�E�QvM(�O�S�[�ff�9QkO!�}TDH��o��^�Z���ƭ��}��@A21�<��ݥ0�ށ�g�]ϰ�
�X���N+�w=�0L]���^	l��U�E��eU�����3U����L��%9����n)<X�� ����C��;��#��;K��+[;N0DU)/��4
�*+F��%�KR�N�~Ew�!y��D��ݠ.��BǼ�J�k�M.\�y|���X�5[{Ҥ��N�F������7�R:��C2��)&���՚�m�q�K3��"���_�M��Irt�����\|�Q�Ty����G/�@nZ��;.ƕ8��
�{��L4��r�{m)��(����7b�=B��P-1���6=`߄�R��բ�"ptÛ�Tnc�Bn���-!�n�V�{+VX�D��fҵ1�d�؋����1h�SyV�n����g�?�ãY���ڐ��ڐ��ڐ��ڐ��ڐ��ڐ����n�Lб׻O׆u��@o��^&�#=$��"pM�;�A��xvg�h�8�LX �)��x�>�U�������FK��*̎wr[$H�?y���o`\N�Ěq_���Zշ-��۠�;a.��b�]���b����-�n�F)]'�X���1ʖ(��� ~�y�oK����K���
/��=W�b>���<���<V�b��w1ڇ$O�,x������������ƺ	�JF�����/�#�����n;�I����S���BVv���Q�!kF�;�n�H�@��ʌ���Ȉd��X�N����n�!�{����|�}���GxdF�̮
�,��"<�|���߾_�wQЭg��Z�]�����w-�X��Ts�te�������x ���'VSJh�b�4��m�t�Z����s��+ u�ҴH�<�J@w�z��Hq�}BH9������,�sW@��I�ԧ����Ʌt#���B(1/�0�{�i�g�Ʉ�	'N&�L8�p2�d�Ʉ�	'N&�L8E.�ד���eJ��v��$����$Ѷ�2�<�\Hp<�貞�F��γT���M�6	痊�U���'�n���+i�/U�;{rbZЕ��FY�(b*��&:��I�;�P��������tq>7s;�n2i�8��P@�I���&U��/QC�u*��$I�Q�Ž���6{��B�Ӻƌ�}�6��4L̍|'
�x���C#�i��1Lc��0�a�4�i��1Lc��0�Q`��)O��2��c��$ڭ2r�@�U�Ǟ���:�De�9Z���z��i����x��1��]�����d[�%�y��"��~e8���w��%H{�� U��9�^Ȅ��sݜѠ�&��|SvM��7kiX�d)&j�=�Ƽ��	ٶe��.��4D�ɽV:�U�u\X�*�)a�����kk^J��Y	�IWZ
z�i��lY.�9�� ��A�g�=t�(ߋ�\�ѻ\��,޵B=��l#�9�����U�����Ԩ��R�A�6�|�R5`�X���,%�uO}F��Z)��T�_�a�s�2�;�;������;L�ٱ���1���a �@��2d�0�a �@��2|�a<�OJrX�)�cF1����Gm>j�Q���|��6����Gm>j�Q��ڏr��i>��׺Lv�G�d�[p�N;r������tG{uY��}�uc����Y*������J�U�T�vD��m����>hN�ay��B	%��v��n��U6[�t'u�LŮ�Qv:�M:KJCF40�e��Y�`&�V�g&d|#���a�sI�*����YZ��{�i�
��V�w���3	HH�=���X��U[�=Y'a�(��;������u}�N����$�a�Ѹ��M�aVǬ�Y�:fu���1�cVǬ�Y�:fu���G����Sbu�Lq�>r�֔��(g����1`�l��5b���e��Q���l���j�k��P�L��1#Yv�?����#}!���q��-��m#zb%L)p9��p�VYG��Z_+�&����k	�<LU�l[@/�`g����.,.j�w�R��;kj+D��Uv�6$PM�X*�4$f+�6'%��Ey�H/�BfF���W[W-}�ҝ-�R~��0�T����MU���/<u�;Os���v�񀑁OC�c��t���-�[L��n1�b��t���-�[L��n��j��.��E&��w+@�'����)�m{ۈ*�?��:~�Xꡳ�{�^K�$�O�R�n���h%#�ޤP%�}�؂�LY��ۯ�^tP��.k&X�ϱh�V�eJadC���C�}BRG�A�7���8�v�l�(6��7�c�;    ��	%��|�ԂSe��L��W���W����	�SM�Tb��G����+�2c8�p���1�c��1c8�p���1�c�������)�~���94ң8t���Q�|��P[5ʑ�>0���O��V[�N�rIYuvW�t
�A�Ը)B�8�z�A"럗�>��M�ڢ�n��[���{U��9�CW�q�����s���
NO��Z�[��N��h��h$%͹�x~���eQ�����'b���:3x��:��ݮ�:0C��ڹKz�R�Ѝ�3�A�TnW���[��:�����~y���0S�M�S�I���8��d3����L��31fb�Ę�1c&�L��31fb�Ę�Q0�as�f�eJ��2y6���6�����'m>i�I�O�|��6�����'m>i?�Iۍ�A�?���,���Q;����h��;S?��ٶ��?I�{�h��.����v���A�9*1��p����4��#���+�f�T��/�=Fg���{�GNO���� ��R�-Z2,jPk(+��a�ɘ��`�﵉�DQ�����Z&�+ܺj��O�T�.��Lk�	|�V�`�h)�V����!�E��?�' ]L�>���j(+�j��Р�zN��?ע!W�����|�,]�&��S��n'�.���:-ǵc��|���5�k�ט�1_c��|���5�k���$`yZ|M�)��K���k�m\'��N�9�_;��#�	��Ⱥ�U�q��R�Q$�h%n8�-�z�5&�?�~թp�XC��v��� �U[4��7����k3�\:T�1�]�(lD;9��R_®M�!Ϋ/Zt�:%|��u�ܝ=H�Q�^���(1?�7qF�JCAo� q�|1�b������/_�|1�b����q���'��%��&�r���+<�&*�*pB;v��M�I��㩇�z��������T��#�e�&�z��^�|�O�RņH�gQ����H��d��PVIE#I��tu(;R/�hv�iަ�e�IY��2o��S���p�߂ͩ!�tFp�+.����$f���޸�P({C�{4E'u���q���v���O2��m
#�Q��M��t�J��hL�,����fM9/�r!R����_�10����K��3V!$qh��_�C��i "C&U��0T�N�F�SZ�<EM�˜b*޵],�� :^��gmNtY�k����?8J�[�f&G�2��J��J��ɔa�(o�!un�aa�5��V�l�ġ��8{|(��}f�̠�A3�f��43hf�̠�A3�f��q4���1h*S����n���$�\׾r��~�m|rn>5��tn6�n{�^jpn>K%^2B��-�毖�6���e5�-��hI)j2�\i��M��W0�*t)��
�m��]�|�D�L(�*�G�|�y\[o�x��fBp���c�F��dg�>q�����]����ϥ�5�heIȽ�*h�Al�L��=���5�l�	������@�kD~&Lf6S&�a2���v��(&��G9de�d���1&cLƘ�1c2�d���1&cL����$O�ue�Sn?�����^����;��l�C>��G�dG�(�Y�}�A���>�g�D/F��-�o���	�����/��l�+��X��h:ͽN��y-L���m �/eb����&�����ҕ������3T�f3{J>�Ǵ�{��>���ճ4G��;�e%��L�p�lɲ����/@J�)|SE���Ĭɦ�+Ѽ���z����YӦ�Mz�C�:(�� ��1�+�{ی�)�Y�ż�֗��%���[��®�[�"U���!T���yݮ;�F'����$t�(ey1�]G�v�,�Y�<fy���1�c��,�Y�<fy����I��X�,��G��u�Gm>j�Q���|��6����Gm>j�Q���|���#x�iQ�'t������I;�-��$J�s���zc���'Q������Y���V3Nr@����F�Xx�x�j�ZzuU���i��E���Z��0k���*��B[4HAc��ZT0� �|�;�4��ь�L�VK�]9��>J�/�9�B����ާ�u�B&�%Q���B��=õ�a1�b���3,fX̰�a1�b���3��aXD1�â2��~����%��x����'�>��~�H��e=��$���X�Dl��P�~]�o^}�|��s��!�Ts��@�(��N��~��6�R���Q�����6���Ϊ�^]d��
�?��YU����!�z=�&3�~�v�UF�L;���s�֢���t�Ӂ�����%囔`y���>R���L�M����IߦPs��GVݔ���I�q���8�Sk��;w3�N^�
�*Ȗ��� _�h�����	}�*�0�M���K�F']���_��1�d�DQ@A��B��A�\�TKԯzע'� *~A���<�7�k����g���P�ę�a� ��PU��f�>
TU�{�X�c\*�\(V�JEj8w����qw�ļ�q�X&��}�sG���;2wd��ܑ�#sG���;2wd��(�Q����e�l�tSs���1�O����i셡�-9���>J<C��ԣ˺�{��c��;���p�bq���ˬ^���{��Z�B�hD6+�
�/$�6�LeoD'�ޢ���z�
�SV��ֲ��v`'��Z����R�K��d�A�eQ< �ē
d]@.��C�C?�i���Z"R��=Ņ��UR��H��{�%RL^`���Ƅ�:���Q��Uý�g��j��E�y;������H�abu�ۆ��)n�Ƕ�ʹ�:�c0��/>���+?��A����ܡ��81,��?#�{`��2�e��P��.C]��u�2�e��P��.C�G����=-�+��&�G�g�&=�I<2���i��N�����G�
#뉻ߘ�s@�sT��@��V�1P���$bo����R���[eAZ�hd�E�y�UCҹ7��o�ݯѮuVV�i<�+Ui0��I������p	:��� lv6�j���mUb�z���S؈����1c0�`���1c��1c0�`���=S�{JL�)vC�y�1�w��|/�����#��$O���Cgݵ�[�x�v�J��FD������*��$[�i�WC���FS?�K������C�D���a9��4ge5�^u����
&�����eU�0�;Y��MV��NRn�ºãB�Ɍ�vF��]-���>m��m��Qj��U�8W^���X�OH�]�̜���V��}vGR6L���vx��u�lL٘�1ec�Ɣ�)S6�lL٘�1ec�Ɣ�q(a�'F٨LA��-�M����L'J�m����$��?�ztY����7�� e;K%z�;B��M��̺)k�ݗ6�	���4�j҇��>{�ؾ� ��ګ�[dѕ�,`�J�����*2�si����}��@����i�(Ux��PĊ�֪]��P;U3$���ʳJ4�;��ʋt��?��JFgo�jY�)L��|fr�?��Y�^`���01;X��,!��x�:�窍1d�<W����d��\0��h���2�P�}V(_s�o�x��o�M�Cջ��]�S���=	vB��k�˼]u��M٨#�aT���@�.b���:;�� F]F҂��"�=/	��� Q$�S�U�7�63�e��ۅ\�`�m� �!jm���~u����y6M�Ef���t�U(h
�-�Z��_�(`���l$����s�/���뫝�v:��no�r�$3��Z�:%����(��l�Vu���kE�_�	�����=��]e$�:��޸������\v�l��#���L�Hn>�fU��X�J-/�tU,�/�+�=�dr#+�d�w��\e���~�lT,�%ܿ��\��4�"�';��W��'4���\��4�~�;G���0�?C![���Vk�V��+JZ���Nh�P
�uo_\ese`�{���̗��Sϯ��氡�}���ey��9��?����m-SA®��;1�{�q*����JI�Y��*��J���'��ɥ����{N�K>��W���{3	P��i7m    T2�),�e�H)�)N�C��{.�{q�|�����?Bq�g)�$�+en1���W���Z�f)e\�;��z�0���4��|��Z��gW�6��w���y�P֝Q{m=w#��˚ly�ϕ��g�{���)r�µ����~��W�֫�I*��d"�M��xG"��V]#v����X�xn+��wb��,-62��U]X�0􌆚�}ۼ5�k�f������M�f�Jo*�D}zҕ/���gK���*�WJ�Z��
��*����q���;�99�{9j�]h�a����kڏc( �\���gU��\�_Ϛ6U���{�?M�g�~�Vm���
�cvߵ0;e��'%D���Xq��q]b���iN�k��Os�+0�`@�^�U&3��Q�z��a�pB���WCe�^H5뢜W�2��f�>���bj]��qrCj�
[��I�n]OKKc��f�x��lh綢�+��l{�ZJ}ϠaM���R��Ϊn�aVZ���!�3�d@�7��)W��)m/��w4�a*h�P�h �TQ���>ͩb������x�h*�Gڴ�Y��G�B����;�3�r*�X��q4�v�Ǒ:dMw�duav�r�oi6���j�Kh!�s4��\Q��g.�!)�������i:��9m��l؍o���*pJ�y�kD1�$`#>�}1þR�i�Z�*M/��1�֥��[a��ٳ;\N�G���MA !u��Ţm�+ԝ*����Q���n��G��{���nᱬ��m�#M�*8� ZD�c�1��@�9l~�/�Uٮ���9��4�-�f��F0G�g$ʈ�S��-q��k����u9�7��a�n�=.����i���Fo��5���.o#`�C�@r#$��N��L�g�������0�8}��\t��W�3����\���|���mv�=��c=���K��m��x�Ѕ,�o�mmۛ�����T��x^�x[�6��
����C���э#��*�I(JB�&�3|d�p~H�]�	/��/��/��/��/��/��/��}/�j�,T�v���.S�.�~��x)>�4�q��DΈr�I���-���{-����Kg��(I"gDn,�
���ؿ6�@�c0��a��骿@���FDЁMɳk2����	�^��[�W@�NX�,Y�rE;��2i�2��iڔ�U�=�~���(۩|�V�N�M14�=E������K����RT+ǌ�*�~ �1����oa)(t����ՙ�B�~��*�
�Z�KV��kD�BAd��XH�{a	�P�kU��_5U���p4�K�;B�Ej�Z_P��!�fx��ڮ=}v6�����>C��j(1ǃ�gܪ�#�+�	<&xL��1�c���	<&xL��1�{���S"x�L^b0v0�O���\y(*���W�I���05��8�������!�6������D*�֭i�{��Zs�Z�\�f?�O�2�V����|���Ϥ끄V�)Z��W�hѸ]�Ʋ���jĪU�d���[vA�PZdV
����e�ݗ*/ШFV^oe���@�|!!+`�عt�1O�9Re�˭���K\�-ډ���k� ܧw2����v}?J�qdF�I�Ȍ�#3Ff���12cd�Ȍ�#3Ff���3�2�e�cS�+�6�����'m>i�I�O�|��6�����'m>i�I�Q���8�S:i�2��g����e�Iv��M��q�<��Oa��_=ʾ�Ⱥ�p/��������l���� �����&�Q',�7QuNڑ4���i�!U�ȶC�r��M#�/�|��%(u6�N�S���,]�QzI�a�PB�}�e�q,���y�ʳ&���1%�6#�6�Y+��Pcmg�W����(�u
���;�ى����f����E��0;���9��1c�0�a�0�a��1c�0�a�#�0EC��t�"����a�I2A�UNm�v��g�'�Z
��]�};�ü0����P�BymD��8l�Q ���@m�Y#cn�G�VT���u���m����(�`�Q8��[��;�wǣ���<��(� ��լ�j�d
�I�#҂�ʚ�2z~��m麵�x_+Ƕ(1'��N�ٖ�0>�-f[̶�m1�b��l���-f[̶�m1�b��(l�N���b[�L��l+�Ͷ�t�h�n<"�E����x!�.�n�_����3Tb����V�n��L�0���=4㨑�N�)����-�l�����S�jBH�HP��2э����݋
�(�]�q�)��C������*;����(17��X*Ym�.z�o�A�I=�u��`�a�;[=(��A_��ZA�P���>x�(��Ă$�(�2La��P��n(ԧ���ż��S�[&�R���$��������+R=���\l|�"*ڱ�N��D����/�UM%�.�U9G޻��4��t�m{Y�3�>��\�D�*��:a���/���f�c��o�m�S����A�4n�+u%ž�~u����y�M�Ef���t��vZSRt���o���n2h��ajga0��0��2\����Q�Oc�Q��[��r7#��T�a �?vW��٬����k�f���J��A�
^eb���>�q�˛�����Z����K|����F�ܿ�qR�I3�.l�p�)���
�Y�cv��٨Y�K��d��|���ᩏՋ��oZM���4_������M�ݦ(GG�5r���z���f��F�&c��<à��=|�s�s���I���z�1O�/&f �<cx����4��[��M���Y�=������g�Xt�U�����0O���0��d�j��1�6F�x��^�Z�By?�<�� אx��^�}E��!{6�ً>&7��S��{���h��Ϯ�[>��!oJ*�#f��܍0�:���ګ0��g2&}�J�������_�Xϝ _�`�;^���G��
�3��kS��:ޑ���Uq���["�O�r���D�߉�;/��0،���Յ�C�h����l�������q�\ަ�j3U�7*�
���f0�=*���*�W�a-ݧ��@+a�����՜�}�z�]h�a����kj=�P��>��n���+�^`F~/`�P0y�ϱ��-��)�+���}���d�����{f��9�Kl�a��z��>&�U��c_���,2S8���t��)�u���j`��݋��kQ�ae&�ͺ}B#3�Ժ6^����1HlrCj�
[��I(�����t��7Z��ڹ�(�
�F9[�桦�����h�o�Veg�f�m�9�e4$���;�3�d@�7�]YA�նhj�BU޾���PA+��q�(e�)�����w��T1��~���A<d4�#mZѬQ�hJ�#�*�	 |�.�T�Ҭ��G&Y�c0	lK�M��D*Y]t|�r��f��������*@�G�:������B`�,E����5�*n"=wԜ�r��n���ٰ�F)eU�����Ң��>&���F�E�r%g"h��_����aLl������?�I��&�#DAŮh���t+�E��W�;9T ,]�o5�����V����WmO���7�yJ��
��H'��_��p�9l~��Uٮ���9��4�-�f��L0GЇ$ʈ$\��-q��k��+pw]nP��m-���i+5D�/�Ո���ni����.���HN��AÚR��a��/���K�G_QC�]y��L};r�H���#�t_���Q{�8{?����Řn�m�3w�M!�~�����]���]���]���]���]���]����}���Z�di���zt��1��9��z�Cۻ�4��Xc�;9�|���h�.�~�����=`�s�J��$�G+q�im�]�1���wC������s�gݫ�z��$��_�3��vQ�+b�Y�b�.x	oʥ@�\�`��&e��{�L<��շ���\\~�m������yz�~y+Cg�7�O�2�,
�&����`���V���煘Y�v�:�X���h2���A���bV�    PY#nߤfyU�·��U�鳳�u�'�jD�Ăċ��7-�{�ۘ�1oc�Ƽ�y�6�m�ۘ�1oc�Ƽ�yۣ�6	\�o�e
\S0=�w��=�6Z�;A�zۨ(v?oï��bd=��kD��~�v�Jt����r"�J��fl0�k���_�l
>iCa�D���q�[7��S*���.C�K+��&ze$<!#��Z��}�������?<4FвDavKX0��9��h#�JWd`���j��O+1�^��$	���h�[X9~2%Kb�j#N �0�;�#��du{�B�d�!�.�Z�&�e�HOi^kC߀hbNV���Ν��_S��,\s��+�wq�X�b�:��sd�9��*�@�C�<K���W��}T��\�L������"S��\�\F_s�S�db0|� p����ˬ�Y�>f}����1�c�Ǭ�Y�>f}����}|֧���b}]�����
�ݬ�;I��L�؎���~��)4���R�u;���>� �;G%FAbo�aq����F��o�i+�gg���E�o-�"�R��]*��	�a8C+U�-7��ѯ�*s�o^�̈>ޘ���u��;���U@��|���Z��%�BI+Yjĕ���x��mi�Q8E����♅;#eӭ���s�u��-F����nX.�rI1iuy���Y.��X.��X.��X.��X.�\.5uL��ޕ������Q�[[к��]�H�3P��S��D6/i)����;�3���AJ4]�(�A�=��EZKt����hen�y�6b#�F�F�z��M�yGM��85j�S]��3�����������uj}��c8��,�5���$1��A�q���$x�y����R����L5���H�a	�Q	-V�2 �¼+י:�D��մ������y����m{���o�~���?����Gz�ل����|y����~j���qF�"oTpl؀��H�� a�(6�b�(6�b�(6�b�(6�b�(6�b�(6�b��_��a��_� ��8xR�u���v���`6b�^�#FQ	��G1�:�H��z��{���a��R�n���h%C��HZ�aЌk,�V8��ӑ��ȕ�~Vϳ{�!x�A�N���V���ɫ!m�ʚ�*(][w럫vI�Kea��沗7K�&���"r�#��B`�5"�T]�Ȍ�`�]y�����+�Uցp��_�u���ȧߵ�T^��M�
�rtp:m�y\�������=B�ji�`�:z��������}�.�N,p]��ƭ����:�`,�X��c9�r���1�c,�X��c9�r��H\&xBX�+S�t�>j�Q���|��6����Gm>j�Q���|��6�G�ta��Q[�ɏc���m�h����s�ۍ�(��G���n�Ͼ ��;` s�:tC'�[��9F��?���q���3�<��(u�N�8�&�W����=z�Y%��6o�sn��Vo����$��
���_*�H��wY6>���|�@�]������Ya�Q�\ܶ���}��ɨ��jFH���(��ɒB�����K�|�)]���>���S01'q�ȶ�q��}Ff���12cd�Ȍ�#3Ff���12cd���Q���&O��2�hd�Ff�"Ё;�b8鏈@���������}rt�����̒���~4^�Cf�1�>)mj��PO�\�2ҷ&r�҃U:k�S׊���FiC�����:S.�EI�ٌ_Mȡ
�$y��t��N�ސ]SJuD���k����Ԃi�@W�j(��ihO������ �SԒmt�$��+RU�^K�B�I=F��=�^�#ʣ��Y�.sX��TF������e��$�vGR|��*��������
�B~gt#�%t��9�F��9�;ĸQ���^l3�cPǠ�A�:u��1�cPǠ�A�:u��F�'է��ԕ)L\���nP��d��P�&;�c�1%�D�)9�zY�co/�����,��E�x%Aݳ1}�^i)	���y&,��4'��wz�q�,�.Ȣ��vd2���(�����%����Q�i��s`���B[F����6h�X�$���a2��|�/���/��Dv�+כ��F���@ڛ=���k�F�^)�y&�P��H�q�
��W��`m#rk�oi�(��Y�RrWa7��W��%*h��Xͩ �F7�@ٱ��*űP1%f%,o��"��Y� %�<]5R[��1�J�}	�U�:�M��T��0E��j0��r3��v�+z�ަ�<����]g���HdLƭڮ恵fF֘2�V��;�ic�@�D��?�&��t�l*�mi��J��VX3��r�a�����E!�Ľ ⭢�Ať]���f���op��`L*�l��řƭ��{_<�cƭL,���IB{t�&	��#iFҌ�I3�f$�H��4#iFҌ�I3�f$�HZ3ɧ��u��t����H:�O�cP���;���Xb
�Q�ꑴ��z��8��Y*��h��C��N���(8���Fb���h*T!�G,570��6�a����J�`�L��BG��I��� �� v�e#��)�n�<S:���,5G�4@���sY`-\�������p�n6;�N��1XH�Ò3��26cl�،�c3�f���16cl�،�c3�f��͈�<)�B]��1]��h76sN4Bt���D(���|�Oaɉ_=�z謇������Y*��n��Ӊ��%u^mfu�6�7��O�rSzp�Y�)��9�2��>;�#�$��m{�;ΜBjȄ�3'fN̜�91sb��̉�3'fN̜�91sz�����1'*S�:sJ����=���4��0�q��I��{4��y�^�8��9*ыg�����P�Q-R��`F����*t��|@���)�7 R/���01��єЮ���I8�}�2|�E4E�?��<L�=A�7r�ئҷ��Ia�d����b~h5�~��Zy�DPVS��k�|��l�^u�\��h��U%�Yc�����}��������X���u� pݓ9%�۶��8����9�99���9�	i��y�%g�1���/q`���>�߆SΑy��~j�y���g��D��ΙP�q�y��m�6v��� �I�����6;����|#X���\��_pi{����q,�X���e�g8�V�F��d������*����Q*s��*�R90��+h���;�p^ɦS�������{�E�8�l���j0��O�9�_�LlQ�+d���K)���g�>n�h��<�}�xd����E3��.�{F����3�gt���=�{F����3�gt�(�^�ۧ��e��p�����;�A������u�>���w4(����4!�������n0b.�m���4oS%Z=�5�R����0~OZ��|��x��w�*��m������0=�!�J BR�jAZXK�o��@Z��q>�}� j]��}���ɱ��\5x� n
�3Q�˴���*U�D�CLJ�F
��=�A-���wM���[�Rbn�D��S���Y�H��#1Fb���1c$�H��#1Fb���=
#&�V�2E�)<��6XK��W7��ݩ�~4"<x�\�#Y�k�fd�vX��mr�J��1$���uv/j>����h�h�7��*O
2�^�5oe�ef�
�q|z2���2ǝ'R*�Wy��}� {�"��)�k1EȌ5?��gWmA����V�Xz���;��(^F3�bl�؊�c+�V��[1�bl�؊�c+�V���$�xZ�J��q[%��Up"q	�i�%��v�I�Up4�����V�m�Vg�Do4`F����P.�4G:}H�f��q��WГ�n6�Un��dW�gȢ3{���.�%!w��k�v������=ZR5���(�k�n�ym�YKV}��LG����\U�h�,8L�#hxP�"�b��J40��9�(�5���0��d�aě�L��lV�p�27d�U�w~�Bn+�.�3�,/J��g�POte�`��l���C	u5%J������J�C���uPPZ���j0K"T܄���"d��eV��vj�a    B��3ba5ɨ!X�&�X��x(k�e�/˱�j��[A5��|`��ؾzDL�M����quG�.�5�=�E'�\�WA0u���Gf��ح�F��h�K�i�;�����f����y��,�ື�B~�����7�o�Y8��y>��mF�u�����r��	"�._�r<L@�C²�:��j'�������ۭ\�!iJ<఻1-��G�~�"��o_��ܯ�=,4$5���y��Uv�M}�.o^���k�g{7;�Px�Hnv�fU��X�J-/�tU,�/��=�dr#+�d�w��\e������7�}�W�?u��<�M0Ci%h���Y�o5�^�P�6�8H�g�J �O�r4��J
nȨ�$"'���n�<W���鬋�Z���z�{�gZ~ұ�a��Ě�˂.2~t�/��������'VYк\`�u����_V؎�)N�C��{�hae���b�SPVłS�.�����i��k=���^��"�h�-��7V�
*�0�j�Mw�J&w��j�7���{�~vEh���������`AY��Vk��6 k�%
�`�as����(��p�}���z�R��~�˲�#I@�֙LDn���J��/�L�^>�e���~'V��Ү>�:��T�n��]k�e4�yk�׬?�
io�e���Y�7J��ހt��){��r;E�He�J6��;Ve��&,�ރ�Y�����^c.hb�>���4V�,/q���y~?L��~u7��<nZ,1��@�޲�c�U[��5�+��م}ۏfY�S�Hh�7*8�b^ �J�zP�C��mZ�4���`T�^�U&3�CR�u���և]��*s����1[��JTfrx�6�:���b��s�iL��C��!5e��t�$��~nZ��T_K�1���agj��
f^9Y�J^S�A;�V-�-U���L�M:��z�%��v�0�<�仒Ì���T$c��؃
��-��d�ڃ��۷��	�jP}7��� 2���L!C�i���'ƾ���wگ$���y��N3>��f<J s�������#`�G�i�]U�_f���r4��UϠ���B`���,�Uq4mwS6L0�v�-ZA� 9v��(��
��!���(�D;��GND�z�L�n�0�����]�����Чu�ΧhB=BT�V�ξ�X����G��i�X��Um���|*�%���cb���,䙮�,���n��qM�du�au�в_x���J��}�dJ+����|����U���htՠR�т"}��}�rc4�s����.�(L��q��(U7�2ߜ�����#��n��Љ�=�$����3�r����M٤/P��5������fFtP�oqf���������ᇩ>�L�\6�un��dU��.K�V�߉i��GWN�4�Vs�=1h$�C�]�=�C��%�&.��]��PY�aC���n�m��wС-=���s.eDrLM�ߖxBص��R�k|�g�A7�"0�޵M[iF�����v&������e�[f�	v�Y�h؅T{�H���]�
ے�
�l{:I++��LG�t}����oW�7��>��#�e�Ԥ��� [���wju9w]r}��o;l��^l��^l��^l��^l��^l��^l����9l��k-����Ӳ�er}����mw��Cx�̓L� HF��Ob�m�sn�I����;`�u�:���1�
7��T�B�$��}&`#��\,��E�X��b�v�]��K��Z������h
G�q��ZN�x�^_�d���|���L��QY�6��/�_���Z!?)���B�8��g��\�%])�G�[YCi�כ�Ig�y:��[X3�\��p��	�BD���]��n{R�+elF��t-�}	{-�Nm��L�RF'�|�Dc)���ؑ��XJ�|�3:ft���1�cFǌ�3:ft���1�{F�)�Sbt�L����.�����+;�n�鐀&_�@��@��H�ad=
�I�C�% �Y*���툡X�!������G��),.�T���}���UB��E�v�ֽX��D��޾�0�h���ңO��)��j��V��	N Sͮ��Psc�:��%�Z�\�=��}#r2��ޣqi�f|tbݵh�*���K��f�!�(���X�"-~�v���ށ?�3p�=zX*w�zy�h1ee�7�^��#�6*Z�jC�γ�\�F�/dw���9Q��� ��᷾c3�c��	8&pL���1�c��	8&p�@�Ա7zJN�)�L+9��M���,�<$~n����.�(.9�ztY�{/�s��,���7Z��-���Ԥ*���m��c������-��Tn����uV���)��;��@����P���͖_�q6�OJ�2i�G�_�������{0e����(����,z	�*k�i��wu՝��B���0� L� �Ɩ۸ˇ>�;��q�Э�s�cO=/�F߷�`F���Jh9�݅ܖ=������/����<��������F��g�r����z��И�~����g*���:�⸽��������;�n%%�����m{���ovM1&V�NB1+�㶰��3&Fu�e��oS�ݓ
B����P	���
�$Uzt���Bgb#O�Ǻ��b�~�'�i���$H�����*�,I�k�a!6�dn�sdEh4��_���JLbފ-#���|�X7))��:u�E�@b{���*,~$E0�{E^�-�L<L�}#��N6�iu[R�F���Tg%���-��f�5��~��~��{������=���FP<�x@����z��R�Ot��c��?w��;��	��"�����y��:9�"F�Ot��-$�B�-$�B�-$�B�-$�B�-$�B�-$�B�-$�B>� �xR���L�㙷���[HǶO�aw�i�'��}�i
O ���Q:�q�O �0�y�z��h�T�qg�|�@�;��-��׉��"C����/�S3��I >��`�l�+Ѵ�����3w�
t�>4!��^��v�L�T����]��T�b=��~�F�ވ6G^_bb�g'����2��2'cNƜ�9s2�d�ɘ�1'cNƜ�9s2�d�b�/)�S�d�L*���d�N�hi�S;�g[0������#�G�� v�s��';K=���-lK�0�oҸ��Ъ�(|���h/�ƝC+�
�*����z�q�O��϶E4i�2�~m�[J:#�)�#Z*sB�H۹."l�z�a��P��z���R�uq�
T��Єc�4�|Z]�p���)����D�(&bDÔcP�9����RV��$g[O���f�L<X�Do眀�
����aS�� ~5!�uw7L7�r��K�⮓}*�Mf-VR���|D��M���cG�0�0�#��q��I��1�c��D��=&zL���1�c��D���G!zt��ѓe�"S���=�$�-��q�q:#��4voޑأ˺m�>�@��;K-:N���K򼯆�h�@�������
�e�vq�����z��"�Z�*N�'�T�͊�51���ʢ��y��^�U�l��Tfh��T�T�Q�њmK��3���>Ivj��ʳ{��3E)|���(q�+WIG�M�3���/_[䊌e�Tm{4�3��W��V�|�'��߿�sA6��mo���1�M&En#=�l1�~��1��!��@wW苻t=�0�1}p�>���~#��
P�I�����Xv��I`�TnG0�O����1%����j%��A^
�.]��=�k��Ub5h�ĆS7�nQ�a�4LxV���5	�;�t�c�4(r#�R��-;#��`ZȸpE-�Y��VI��橎]��J '�n^_�����t�?B���/�un%oC��@��l-;I���n�
�ȳ���3�g&�L��<3yf����3�g&�L��<?�-)I�>-�,��ڑI��=��=�W8H���� H�Ӡ�� c3�����t��T��8c���������1��9��g0�ļ8	��L-�^�2Rc��H��#5Fj���1Rc��H��#5Fj�c�ID�i    !5Y&��y����S]y�ԍ�j��}�I=��G���P��!�v�z� /c���o�<]5N��h�eg�n��-%g����`����_�/|����i�_��`�g��-��V���4|)�.��0�Q���~+��6_�g�%��2+Ed&����H�Vihy�o�T�J�\*jrE�U0gߋs�0�1"�T�K���N쌋���o}�f�8�q�0�a���1c�8�q�0�a���)�?%�˔x�A�|g;!�9}�w��$�K����8D�(��a����K�|�;G=zIoǉ�m��*ʼ�̲�]�0y�bc�̌�b0ej�Yo�O��"���a����خk5���2T��ʝ(j�c�a{v>��՟��(� H�8�w@,r��R�xP:�-`B��c�(u�@��`/[f��@=To��]�>��Uï�9Z�m4����������~��n˕ᯱ�hKe���+Vd6������ђl߶bAM�	��λ���_�<Y��*o�?���y�\�Ko��'�b��qm�NrU�1�N�"�o�A`��.��;�+C�$c)�7;�P����2��/'R!s����74V_֛Y��&d%G��a��#�9�A��=:[5zTi�(xnVWY�ku��00yA6����.H<*sBPm���N$���-Ӏ�.� inVfi��!c�zHߛlV�y�P�}.j�j�*�l�Z�gؑ��Xkh(;[ c�%ɾ���D&f�N����wf��ę�3g&�L��83qf��ę�3g&�L���R���e�"ߴ�0��D��S߳�hL�2�4n�ǃ�.�O7�0<���Q����;���F�Fʅb`�̈y��~T�3�I�\�G��a�X���j�~_�w�(����/h�����M�˻���k�)1;��@^���r��K�t���-�[L��n1�b��t���-�[L��n=�ŧdO�n�2�fxj7�6�����'m>i�I�O�|��6�����'m>i�I�Q�H\o��S:i�2�� nl�ǎ$8Q%�����&�jc��Q��1�2o��~;���9���Љs��v$�Jۋ��К�!���c��OmL��la�̌Ĵ��<kpD谴%8��D��v>:k�Ja�jK(l������U����G����S��ebN��:;�Gl�$#-FZ��i1�b��H��#-FZ��i1�b��(�#h<%����(w�
Ot�ql8�{N<�b�O�M>��G�����wi������z"��٬,��n�����o^���'�>L���W���__[�3���i�������$��>���9�d/L��a����W�`Z�L�D	�#�V�����D�(촘�ʚ�(���5�)
=��Xj��!ݴ�����XT��]�Ik��N�-ࣇ�4�����o��Ʊ�x;���>�7�oLߘ�1}c�����7�oLߘ�1}c��(����o�L��b��n���'R���F�#e��I���G��.�ߠ������(N��zҷ?��\�i���u#�o3놽���bHZ���}�z��$��/2�`�$�j#2�V��Q�h��X�B:
���M�U�Q/Ta�J-x��~ݑh7��ZP��F���t~Q�r�KB��/̼/|����L:]5��uy�.*1�阐Z���hY�P^�L�(1�u�0�e�@��V�&��W��7�.�ѫ�+;D�� p�x�W�*�Q4�H��J�Q���Յ
�ښ�1vt	����Zh��&���'!� ��=dl#;dح�E�uD���ӻ��\����r�_Y��K����P�=p����\�Ɵ���߉⻻v����,��CrnW�^#0ER��+;�:�k'��D��[M8L�˔�Eȴ���#�W�zL�#_F��|�2�e��ȗ�/#_F��|�2�e��(�WF�|Z�W�)�<��|��6����Gm>j�Q���|��6����Gm>j?�Q[��<���,����~�Ǻ�9Qf*��I{�H�2��$r]��c-et�p��Ta|Ⱥ�,��E#��X��q�WŬ�V�}m�uY[ºíwI�|9�M��]V� ���^2e�(�fO��:����eR�/�(�9���dU���u�Ґon
|��{��1ѹ!��~O/ݦ�����T�X[A��ўJ5��:���T�X�%~�찧
��%�ǘ�1c>�|���1�c�ǘ�1c>�|�����1<�FO��Q���5�X`��c�I^s�M����`츟���=�|�O��~S~��c��(p�1��n���tՠ��P+��D�,2�E�}��������SZ�jDO���Г��-���5%1˱��Y�h��Z��=�|��6�}a�Y_ |)Tn������JTy���K?�t^+�����j)M�i`�C���o���_QT��8�^����JU'�T:<^�M� �����pz@]/ �C�_�����w����0%�.��c���\ ��A����s<;�w���k���1�c� �A�8q��1�c� �A�#�8�a���e������8�D��:S�w�hL���4 �;�|t�O�}&HP��!w�z��115o�}Q�/�v|b�j��W[r��Po^�g�8�YZ�yZl�7�%e���q�\���Ls��5:\�(%x�H�k&Z���<��S�*�m'�N�T��縱�;8U�-�{O|R�'(��9a쏙'���qO|ds����'1}R�����ce���_�������+/�Fa�:j�V�����}����m{���oFeV�{��lBŇ�_�yU�X�,P,���v�9��B�>xp�i��P���U����V�zm݉�!�ы~��q��g���kX��u�Z���XM$�Ϫ�L<d&�d^P�R��X��Q�܋����WLz~q�-��"m�9[�ՄLe�8?�(-��" ��-�,�'��� `�̊�����{�w2�M�.�����j�~!`z�!��X؝Â@��˰{������ʌXj5b��|.�op36�� O���JޑB�h<���ce5���-Tim�]���:�DN�5JA�O�%+pz���d�U���CeA]�(�Xe2�q���})ٜ��hw��B~��))j�}�º��e3\��XuF�D���,�j��y&$�)���k)cДX5EX�wbf�\��]Z����f�Bwb�V�"d��ry�.n�J���+Fy�L(��rɠ�&�?d�i�fj�I����mӬ`v���d�-�s��v��/�%tp+�±��~�xv��c+�ﾐ嘮�w/�Y�Β8�t� �����2Ͳ��.��a�9Ib{�!�!db�5�Y����?�e0U�.o+�[�]{T��d����<��Q�Tvnx���͗�j��T������멖��fOHh��uc���OO�C�����l|c��Ɩw|���r�P)�h��̊<O�k̕a�4�|�ψ��	�Sԙ_�0�Y���P�{AJ��Ԡ�Be�8��B�n7G�Uy�ؗ� #�;5H�&�I�TF�Y>��Y�1�1�EY���t��elM�F�^.D����H���_�D��!�*o�e�O�����P�n��a���B�����Gl�dp���T�CNG4E��gE���j��~1�4pvU�!0w����a���ҙ��/�U�\�(t��Ş
W��/2<B�ߓ#�h-?���(�kx���㳉\u� y�3��a��*��}�:#!]�tUҋ�ǊjDr���vE^/�Jޫ�j���*�f�*�\ӧL��3���N8"����
����!|�¬5�-!�<��HS�U�x�{PO!�;���;�]4��f�Y%V:ߥ��p�AX��z�$Z~uY�rA��ʪ�z^[����N|��{��v�F��P_��v��i��Tce7b7�̱]h�u�M�Lc�jOt4�ˍL��6�<E��Dѫ	&��Ou#;�`�[dl�r��gw��Y��.�4��^!�
����=�x��z~��1���E�Lq����	l�Tc�]���؋�ME�;�\uib��L(�	ʮ��!JV��f�����w���7q75�焍A�ȳ)�/����&1/���M    �$����m�_gr�v�t��{H�;z�:���n�2�G���RtＯ�]���NY��K��D����� s͔��g���<�z��l�BA[<lqyT��kE����W���e׀�lq�ZNh�����h���P�6n��~H�X�����,~Ȭ�_�H�[�\"���⥕���M��6��X��uA����,lj��������V��Q�M�����=2�.f"�{om'�2�Q�Mnli�)�`���f����d������DXQ�t�����f��%/6��nc �^Z�q�W�����^�p�^A]K��
�ޙU�6iz�z{Z�>��~��4�OeX�e���O�����L6����ZK�!U~��mg��9���-*5���6E�lH��ni���oH���w���8��t�#�1n�|q��`o�����r��u��pa2�߿Qu'ySB��.�NetVa}{�
��:�lT�1�$߼����&�K�;�A����� ��%�-�6O�0��\o��.�YmNփ}c���2[�`_|�����������o^�yd�-�_�y�#���S�J��W�x��B`�U���VJ�����!5(
����q�\<�vj�Y�N<t�JM(����Ą�*���C����z[R��%�<�l���k<�rc����Y���tۇ�wD8GC_-��ث�b^��v� ���'u4-�`b�=�9��c/� �Z���EU�.�H�ڢ]!��TMSb�ϑ)�r��]g���Z�go+	/�M܋$��k�^�N�r=��ߜ��� ~`W�bV�uy�P6��V��}�D���&����XG�5���
&𬺄J����q��.��r�4���k���(S�ϰ̤ӲZ���/�����ʗ��֗��j=���@?�R��Љ���^>�����{�Z�.#��y��N�`6yQ�U�q��yC�`��K�0��=��� ��G	y�!.9��4J9좞/K�
D1[�����gC�&+|���#ɑ�k�q��aV��N&�+����ʭ��a&/;���B�*���,��\��z���ΐ��V���B�x�np�ܜ�4&���B�����q�bI����Qh �#儠�ѕW��0�V�L��b�t�98k��NaC�J�˜
pS��?չ�_�蕊�U��[0�u դ�� ���ϸA;j���^��棃˖��Y̨+��w@��9��Ĕ��u7s�'�����ҟ�]/�N��ϕe���(=����K��;�#����/�u�Eh5uޫ���D�\�Ɠ�A��A��Hu�l>r��Op�3�z~�n�w/�χ�9�e�����F�؜������꫚�75��i��4���g��f����*oV���G�UٺR�7*�ʯ�OپL�����EWz3�]���c�?�M�Ǹ9��q���?N����l������:�����E�Ǹ�8�FW݇�/����W���r�%����~]�tf6o�9.�|�1�>�]�G�H�X��W#��^���Z��MU|��=,aj�8��������_�ǻ	�������~�����VK������u����黪���؏��MO&���(���u�kgg���F�G��<T{4O
f��_��G?'ɴ�5�:���x�Ɯ���� �[�U�1�	xx'>�22�a�_C�U��q�Gs,��L����]��4vm/��c`�[x�K�n� �6��(��s<X_��eX_��eX_��e֗a}֗a}֗a}֗a}��З��"OK_F�ɶS_&�#���>�M;�1�b��B�W,љ��x��LtH_���'�����[
39Nx�4 ۈyVC���S�]�d	���7���(�@κ��#�J|�ץ��s.PT g�L�̜���:3�Z� h� �(���J�9Giy�A�������an�u����6�i��6�X�F��;tm�q1�1�c�ǘ�1c>�|���1�c�ǘ�1c>�8|����cT&��/'{�Xp�n�O}/p�x���F98�|t�O�}��~��!>v�zto,�\��Ǿ`#i|[C}�ß����W~}y��k�{Fc��J(����^��	ʾ�dQ��'��)΅��歐�K��0##��@��sF�b���Q�(1?q}o�ڲcS;;L��J1�b*�T��S)�RL��J1�b*�T��ԣP)b�ӢR�LqT*t�P��Dk#?�����N	?��Vx4��2���q�
�CT���ǉ=f�nc�jF�w�`��Z�����M�@O7Z���Be�������k%�s E��]���2�D������7�.Kt�D۬F��_»%��Eڬ�Dz9WRT�V	��^�δh.�
�ݶJ?���ʁ6��q���Kk�����=f�Y��=��Eg�%U$+���=S��N���%��E����40E��&�߸�xg�N̯��j�`T������o���cu�?�fJma�ソ�.դ�Kg3�0�����0��|\��Zė�(��I��ne�*U�L�W]d:���M�DJvhx���
{���b�U[P��8�,X�"['�H�rz��7/_s�5ݳ�4i k�4��B�6����2]Pjy�(��b���CH�(�FV�����Y��v?�!�F�B^���dt�W�3���9�H�	��p7�5���+�Ҩw���)��r���/_��3����YM:�'�ŏX��xwSe�0��NU6Og���Gh�Kl�N��:��e$��c Ft���i۽�=M|iC��lk�JI-H6�`�S�4Y�� |Uβ])���,�J�oB��?��&9(Q�v��|�I �P�"?w���öT�+�A�5��)H�Cz�ky�	|�'H��� =-��3#�*X����Ds�>�g�"�n�J5����=}]��~ߒ�i�i��AQ�D��{�~6Pv�C�>�T��{���z�FɊ5��trj��:�*��(��Pe������Ey��e��?��=�D\[i��J�z�*���V>�����~'�l l�5YN�.�ݔ�2uC)5�yk�g�-P.o�F���қJ��ى��f0�=*���*�W�a-ݧH���`�)�巙�;�99�{U�]h��& /q���X0������}V�ݰA!�4��2o޼AN���-ޠ%�Xa}��f'���)	��0�՘��!��a�R��TCZ���9�W(���N�Zɧv�Z}���Wg����ܽ �I���.�z��tB#3�Ժ6^����1���!5%
U�vR����Ҙ.��܆R;�=e���Q��
ha�AC�N��OӂΪ�Т���7p5��8�<HY8§$��S�N��PA+ ��Qʽ��Py�>ͩbȽ�뇽�J��9F��Y����Gڦ�G=���F�)�8Z�R���8�Bk�И�P���Kj��PVΦ�wUm	-DU��&�<U�/��3��b�ǡFT�ML]V��iG������m�R	M�R�Tj�4� ��6�/��������!��N M'<�J_���`R�U�r9���	��3�h��|�CA���JU��Q���V�� �w*O��cY5���`�@��b(���7{# u6�/Uٮ���9��4�p� ����SeD��ޖ��ܵQ���.7p�ƶ�e蚶RCd���rұ��ݲ�ؙ�7U����lg���{v�:��+y���WԐ��Wi�q:*0x$�S��+��=j�c��D�P�?��|[l�׾H�����E����q1��k��;�(�@�	?�Ӽ��6�F;AIjwk'emv��u
�D��������<C�0�+��������.�T��@��R�o�1L��
��M@XH8A�K{�����8���#Р\�$+cd�t� �>�&}��~G���:��F<��Uh�n+��n�C�?0M�o�&ՒK��y�uF���J.P2�Ne���kLgi��ǀ�<�W�*V�Qk��0�P��A�KŪ�g�'�}b�'�}b�'�}b�'�}b�'�}b�'�}bۧ_��aۧ_k�$-_���,��Ʀ�S���):ѓ,�����v2b�}���-T��    �~Ū0<d�t�z�#��ǡ��Ky�G1x�Z�\
��Te�ʹ�i;�=U���%���%;���l��b�Nt��%fǮ��!�Z3b�����'fO̞�=1{b�����'fO̞�=I��ؓ,�=����ɵOb&ɕO��I�f��ؓ�Q�~�(�ad>����)
����cy#��X�!z����v.zveE��S�[��0�T	� �Ðh�dDTf�ĕj�L���pȩu���ث�Co�Dn�Lli؏��<5dޕ�v�RyRd]�Kt���S?��}e=4���N�S��J�/�vH��$tÐ�C3�f��14ch�Ќ�C3�f��14{h���S�f�L���V�,��@3�$�%�e�>�u����D�
?{$��2�^h;�����عc��ݤf_���}��+��{ �M�(9>�=m6A��^���N���̷y�"Z�r.}�w�+��se����.���L�5 �Ǯ�j��}&wǱ+J��]���*�ސ�I�1��Aa�$�� [��ש5K���W��b���t<`������럠��$F�B
?Km	����M�*%��@�W��~߈��J�
�$���]��E�*�"C�Y�^��W"%q
O����):p6/��G3�$�@��B���&�
�[�3!k����S�UV��Q�<:k5�N�dJ��F�1�	\+Y=�s*Q�ʀ,e}1,�<��d���9�o����hڹ�݁�}=|�,�l�^���M'z�����x�m�+;������6?r#K�������C*㫫��O���F}��T{��"��`fR�AF�#K����v�s��z/]�Pl�� ,0qݿb��53w'�2Ȉ`H��5��R�?����gnn֬�
o�ٔ�#��xY�J\U��@�.W���������o��O�D2�u��@�3�  �H}�����i�^���A�o�0u�$k��_��Y�Xc{*7r�|4���ܵ��^��e�*�W'92Mq�z�go={��[��z�ֳ�����go={��[��z�ֳ���x��Z����֋9�▮
q5w\���e6���iOU%�林Ĵ}���h��z�x�t��:����S�P�[�L�OQ�#|/��SY5Bz�5g}KW}ϸ�y���g��N_��ᗻ�0Uw0����ÉmM�|�C��=\��b{����.�p���=\��b{�����w�J����%��[�p�wģ�G^>�̞ݷ&�qE��~.q������&פ)�:��]�k�G�X$�.v�O��^�2]T��\Q(+�E,�u�����EoY��jt�KO�%�pmQX$�+
\ɞ�N�E����Y�+��u�Ʊ6�I��G�S���J��T�ջ��w�x{����a2�'��7I�
S�b�����U�v%΍l���@B[�N	EAV�O������j$��Z������@\�/�dW(u�@\hlb���hb�8�F���c�;��i�N;vڱӎ�v�c�;��i�N;vڽ��p�|XN;1�����.�j3�f��P��6Cm���j3�f��P��6C�w�)[��iN��P��֎�똸�?�{��շ+
l��c�2�ߟw�k6��tAGk2�,auS��KĈ`�ǵ����p�p�R�L(bl�и���^�)������4X듂iܬz�����!.�H�k�#��@��טi,���8�w.�*2ps�%N�0�`X��X����o~�Ú�g���G�'I��`�a�)S���8��
^y��\���0�BE�\y�He�3֡�m~��:��87@�j���i0H7)��x!̎'(�6�B��
E脠ѥkm.O�P�����m|���0s��J>��?Wn�y+j�s�� uG�?�f�[GV�P�a��ú��	�q�=��d�${$�#�I�H�G�=��d�${$�#���{$�?j�y$�9������h�Grx�'����i�����H[{>���mk�Gr��삎#s4���7<�#��Ё
פ����Zsn?�Fx���x��,r�B�Γ�R�3u�M���� FVu`�&+F�@�c�L�E@�\3�c�s���J�?EEWy���FiĮ���[���S]�?��K���(��'S��;�h�"��ѡ�m�Wva�^��[��ѵ�+�������_b�٢��+������t�����o:�Uz����-{�5޿)��	{�����?��������c�{�����?���������'|?��O̩�7u��t���2[���*���*wy�����J�zt����X����R��2���A�&8�^ �7��aZ�N\�S���[h#�p�О8;KG^ǅ��6	�uH�tfm2`j��g|�/�`N�`Fk��|���奒N��0p��)9�PS�2�����o�c�q�<���l`4�hkJ�"��hd�嚒��z�I/���� +e2�7��7Ԕ�x`4��jJj������kJ��=x��c{�؃�<���=x��c{�ށO�������4�&�o�ɻj3�f��P��6Cm���j3�f��P�����ڣY�X�	j�9����`�N����12��,DF7)( ��u�c���a �;����I(�E��Uu�Ly��Cs:?��#�3�?S=���_�ˍ��C��b7��w�1$`r/�]�)����1� �qRy5	�»F
R�R**5�|���~XR�>����! �V���S$�m��J\÷W`��芍���ǃ����e��/��ù��(��5�/H�TWx�*��#��"m�R���4���$�l�_'��K�9�-�
��s`-eE6���g<w��oF΁�ar���!����0�՜hNB c��U��_����%�J&�#à�7Α�pL�^c�9�L&�/��6o���Aa���frP�E��4#{Ey�|Ft�rX:/Ƙ%����ϸ�o<�����^l���rѮ&�����-���^��(�W�}�������uE���Ј��a~ ��\��N,���A�N,�!Hh�{��,t��
4�ɶW�x�篊�l��(�[?��ԣ+�pc���V�0� ��%*ᄜ(��Dm�t�e1�|�)|�"��^��ѶTf��o׸��f%���n~!rIV���t��N�F��z�5B����d�s�ڃ�r�Q���]0�����I���p�U�6���C�S��ﵳu�\#���Br�V\ !:�L�F�I[��0{Csɂg��~�Ŋ�����5��ƙc�ɣs)�`���6��c
�Kh��������.��f�ڿ�#8[�T�c���y2Y'{�z�W5$����OŎ�G�t�)�)/	#��9��mq0�A,���;�!���$�vY�!K�֩;4H�4La�E�	�Lk�"?��v�D'�yw�����וTAf��8S!� m`�gls�Q�<�t�Fu�BR��- e��@	*\JWx�I�%�QX��O�ˍ������0��襙���^o~�ʣ+�����
��n�&�v����2�V.n c-x�Sw��\=�\��6#��NISf:�1~�o�I��U�vӚ 7���ŕ�4ɾF֓��3���C'E,Ta�d��(:õ�
�T�t�"0 �p�d�����/�I�Rh��ZQk�3.��x9<�8�`i�P3YG$�s%��ɬO�Gj�z�\��"��4�Ӌ��#}_N�P���7�U��GF�*)%TZ1�Y��U�P���Ǿ�|�fX8k��[k{�	�an~%�@��nH��nZ�e�FsAN�2\y
JNH5�J�J�~�.��
�B!]�ݿo�((����m�'�F��po��w=�����*�d�ʥ�A�;Q~�>��u�;����qA���7�z����i��}%�J�����u���^�C*51�?SLH�����L� cX�ͯ4�eF}�U��r��L��<$	*��	��Au�N!o��!��6��O�'��n��L$C8o�]P^UJ���`�������    �D��W�R�����Г!k�/�ZԶ��\]o�8O�]V	+�i�R�b	�T�Z�}
bik��$�oc/����``
�kWv�U%�>� �+焐��1fЕ�L�/N�9T�s�^Y��빏��+$>���0����>���w�
�wa��t���&��$]��*�@ַ���v���	�S�6��P��E��o�H�L��7L*�ُ��e(�gc�]���,a�ȣg;Å��
��e�K�0z��~^���b��]
�,*�ޮ�?���؂��	�S�zT/E�xb���� f� ��"�3�\�S3���Q��-�B��Dfj�)���z �x��1�s�,����`I8�`G,�^JY���D6f&�=Lے�0�hV@���܅�EYj���r��30f�B���`2�]��!Up	o���ȌٯKR*1�n@;�$(`��l�������Z��d�=n�on�+���<=R�x�hL�����}�����8"���#R~t�Eq�^"��L�XKjH:7y�f8(AOI]M�f`K�9~��N��9D<c�}G�=7��ys`F'���˭��6f��ʃQ"\��@/9�O��g�L����p����A��ٚك�m��v�p��tlR��B�}��4��������:��/_����X���G�d�R�iܲ�r�gVN剚Kiju[l�DN[�!v��H�uB׭H�uR�-vq.�h�H4���3i�'r�ҍ�yx�b���+
4t�����+����m��GF�"��-��Jdt� n��<����}���ƃ�D_�N���-L�o�߹Q'��Gc��sIKB��+M-�sL7m���Z�=�g-vW��-�56}�[M'놶)�Sx������j�v��m}�Ynםn�-R6����8��[����B����-v�	�����[�
w�d��=�Mrd5W+ص3]� >�?]`�Ӹԩ�y�K[��z�,:��o7z�{���{�_��x�Ʀ{����-��A�z'�v�gi�;��K�v����w/6q��{l�~K���{�� l�.\�����Sb�����l@����--�ӝ�w}x����f:�_���
�ݑC�Z)E��@g���H�[z�3���mT�b�������3<���������@��0��Ӈ	�!�	��>a�b���:��!ţҭ'���wD��B�#��(B:T�
��>��-wM�}!O:=�(4]E(�C����"����o�H|� |�'��� �"�D�{;��Ki��Y��3���s'�1��F|�����Fi_޹�}�(���)ȩNA�6�;;�KQ9��Nry�$�i�o��{�c'�;:.�QnF��a���f�8�}�I�����r3����L�s�^|����g�?����Z��Ϳ]�2�&En�zLE>Ⱥ��y]�kzgF�#�.e�<��[��3	Xc�,q{i2�n/�l<8,kl��l8��Ӛ�Y���e���3kɩ���jcN�ߘ��������_����nKqg6Sy�nD�0�td�I�=�&��)B��o~�MZ��pxyZ�O����[Չ�#~*5�gYF�+08��*���L��Kw�ͺ&7�f2+L~���j��#�[@�z� R�����=���5�$��^�$��\ �Hz��$Dh�����!W��e����u�e�Q�a3�1�0�T���Q�Ȇ3�߳�Q�
���hz`�����Q�Ù5����9W���oY�����4��wZ���#�����1�L��?a��3%>l�imͩ�Z<ȧ�_�3��L,{T#*v���N��wm� ��P_�H��`ʈ�l�eȈ����pf��;�K���Y��5����>O'�9���d�1G��A�Ü�b��Yy: OŪ��^~S����� ���04��i�_�%�~�uy���#Ͽ�0>?;�x�⇋�_n��:6�L�3�j�r��}(���=�ӟ�.��_�|`�m�'���zb��L�o5UyF�&�e���yr����ɮ��asN/�'�i�I0�Q%Ϡ�d�_�-��OQ��o�$"2�"�H���8Y�$������[�k2Mcey���g|�%�q�k+K��� $�һ�����X�M)N���N���������=q��t����˺y�i��A����uYP�z����)���3���Sb`���4��\�A**@��K�G��uI��!�&�7��1�%��wN�Q��Jį�P���|'�K:��0$R�n,����@uoA�6�����3GD,f�u��S��8�.A���GQ�MQpxN�rP���Fa1>�炝�8����WbZ���,Wڍ����*ui���qW*
B�p����N�	C�ڶsJ����(���jA"VԹrn��2��Q��=�a��!�D^���N��Dh��vD,����}�" ���DV�E��i����Yԕ:�"��'���\j'G�N�fZzY��"�uގ�l���V1�Ȩ1f���Cy�Wi�j���A�;�'ud���a��IR^ i��C/�fQ�fa�H�S-��ϖ�BD�ESd1�2���H!��D�ƋxǦN�����(�����H��6��J��b�v��e�.�a��B 55F��B� /m�W*M��Zkj�����o3hX9qc�����S.G1t�K��앦�m�F%�����Nѽ�gr�"����B�4��
���� 	>�hu��ѵ
WA���V<iC����T[TiO��v�xtQ/�[�ojK�Θ/wӧ�>z�ą~���Cr|�BsGl]�Ű��o+o���H�>��t�-���,v�0Q.��R	K0�(�LÇ�]<���h��҆��?[D�U@$�9s�0�a��0�y�0�a��0�aÜR[s���:�!�#c[(���g7D�my�u��n�3���'��)����v8V�>���ެ>���쥝ǮT���j��������֡PC
50�j�.(�7���Re+�� �!I2C�۩t4�M\��P��𷺔	z/�:xX-%n~��x���!���ɍ���2���^�.�acF��	O0��?�K��D������w�>�3Ճ�!�Yߚ����l��T~Ș<�+H9k�?)�Y��Z�V�p��r�x�]o��c��M�7�:�\�NÞ��ںMc�d�� ��;��?�n�T�a��:���J�����`	C�-��Qm�f��l8�d:*U�:_�+�;X�z�&���*��GZ���6�����"=#ǘ�!HdN�#LcO&��N�� ����z��
�zT��$F��S�jZ�� �{Y��"	����4�Ƽʃ�W~���>� I݈⋟�����mL^�,�C��h0A^ҩ�������xR�Rd��)�Q��aU<�X���(�<�Q}�|tZ�*<Bߡw��En�$�^U��''��Qyb��x˥h�]<����.N$����`����zul��AT�x��Y����9	(�wU��I�6���Ɖo�:k.N�q� �)���
�nw�� !�a��/5����c_���|8rF;רr�W(S�K�z�n�Tg5K$;ܹB�Nc�tF��b���S����4�$�ps$إ�<%�V�b��N��)S���y{np���c��ח`���p.+Dv�,k�s��Y܈Pr?�Ĝ,�t%(P��iLv.&p��z��k���{O���*�BT5�`�gI��+h�܀�s�K�Wu���˃��i/_�����C�A��Y���,�LF�k�\F��n^�(���Wa�^�	�&�i����w�'�g'ZR�祹{Uɝ/_>)V^> ��O �{a�f���v���u��4�_�=�;l��s����~��ms��6�R!�j~ǀ�#~cGc��՘��c�Ӟ��ؑf8���X��P�{�kt��v߄��2�ں���Bőh����^�ަ�N�F�Xi���Nlo6�L�Ԝ��~��r����.�����w7�����R����6'���g�S[����O��;I������:���֛��3e��R\��K�d��\���|    �K�pI�eΕF����D��9�2�Z�\˜k�s]�µ̷���>��ǇX��.���uo�8���U<��9�2?�8�~Pa5����`d�p�� �S�w��}�yK���9_'��� mo���=����|з�#����G�����۫~{٘}r8YK��R-���c�)ט��qv��m^�{�TY��,E��GۙQ�
��_lU�uh���Ɂ�mK����l\.O����X���SĪ��ش[��>2��`Ԕk�����6��e���������'��6�2\F��O0�p�	�=�g&�6���ZQ��!�4]��Ua�Zd�s���P��,�T��n��O�ݝB jA���@Й<����S��s��MP'�S��|���xC���r'�,��7k��ۣSf����i����vn|�>Lx�?�[��xp�Efͅwg*pg5q[T�.z5[W�VD��d-+���
�6����{�؃ŞO��|�g��`�M'��վ��hlO���|����z�!�hڗ&Ce�!��I���މv6	�o>.����2��=3	l�ph�LT�7��x���x�Ĕ7o�;wb��a� `������/6xC񆺏A�I����i�I@�~0���mV��������Y��.���.�����闛��'����_azf�,����±�d��)U��R�Qb)�)�(ew�Tc��o~<��6�g<EyI����|��x���ʍ�����XF����m�>�t��3�����(׮�n(Ґ�L����ׅ�ǚ��dcϡ�B�8L��P*�0U�v"O}�u���[��*�|�PEʺk�<76�ջY%e�8,��a��T�NVz�~�{��_��wez;�,j�UE�\9�/[�LnBF�׿��II�(��7�Ɇ����	�TZl��k��2���3'���R#�����O��)���1���n�kUW@���++��S�GUE�R�Iu����c:�4($ČyI��0+�-�QȊ��·�±�b�JՀ�S�ƹ�kG��ʹ#:xxX�{�{TC;�ͨ'�j�_;�k&��}�2g����"!=� [9����E�KG2�fuxr�)};æl���ꩶ3f�GO��3z���I�@2����2�Wa���UR�ԚU�	��0����k�gEQ},�2�+�0��f$_DW��Xd�T-��$][iܷ���o��µ�.J!��J����d�a1����b�/hZ�J��W4l��� �,0�/dv�<׳v���3�o?uW�=��)�!-§O�j˦9�%�o���l#S�8?=�IXL�V�|�X��)���T�Qf�bK���>�a��aឩ���H�K��A�(:ޭ���I�^�z����3�U��0�/4�R��A��6����zh���6�ӵ���؍�3������$���iOA�=����#�����ϵٺa놭�nغa놭�n�us���F��ݳ�is��9ɊY�}�K5pwnv�f�՛���i]���b�����.E4Үq�j�my�ˬL���Yv��Y�"�M��.z�j����}�����~3��o��|\�_��[���	N�2~�=���ɩ��������র��C�=Nld'��5�L�ީ��ΐOi5�q�Z�V���4Gá
�� FJ���E٬�E�v��
o����~��ٽ��`�b��Er2mAQ��+ �|� R+�)�RS(B�����=�l:��Ħ�Nl:��Ħ�N�N�ԭl�g��������7N���mo��hb���5l�󑑧߯��W�d<����'�9O��bv3�a��(�Q�F9�r��]��b6��tbӉM'6��tbӉM���A<��Lkx�֨7�XÁ�Y;I�tZ�{8�u�=��YN�A �=�'+J���{�߹UN�}v@�r��VSu�[�����"�h|]��A"-���Ե��L��� ������Nx@�b�O����9E�A�R�c(,bێ1VK����~�$05|v
h�8������ǝ�	�d+K�H��8����A�f�l9���d;Yѯ�˯~��Y�աbl� �[��^���=	�q �b�ƶ���y �nl;����8 ��Gή��p,9Hy��h���H�V�&h+����*��X��B3�7{�m��'"W��8#�	F6��wĲ]�Ae�ɐ�!'CN����!CN���le��9+�CN��g3�d�yO!'W�C�;��;��Ǣv"��!�v(%�v�C��`�@S���Ӣ�hbyv�4#�v�*#TF�J�3Be���*#TF�Mm3B�Ӣ�P�X��=8�n�~)�~��a}����`<��/����_ީN\ݵ>�Ww��\ݵ!ruW����]5~���]?��lݰu��[7lݰu��͇k�����M����Fn�"����J���Aa��/4̗A�ٙ�#ܛ�S�#e�ͳ�A���F�T�������]�|���x��c�j������X�aO2۾��-���!M�
4}�&��AP���W�RM3߉E9��v3|�4�=q�t�=�Fa1N�J�ᭈ��q�X(��*&��m�4�l�����!����CA�RhҎ��a�m��j�j��I�>1Bu�Ua'fZ%T�JKX�N�t�S׉aU`�:`���J�&yj�55�
�a�Uq;u���vZ�RQ��0�+M�l�s����D�`�byj>ލG�5E��5]UE(xU�N][;Plӧ�>j�M���dq��v���������~�p��}�O��0�a��9s�0�a��0�aÜ��T�-�����[~Й����4*��?��C��������;<��^�y
IW(��W(����ɓ�"��k���${��؍��6_��+��A���A���A���A�|ł��nغa놭�nغa놯X܅+����[₅>���C�'��t<Y�~�#��GM�|�>4+��؜ǆ��C�0a�0�a��!�de놭�nغa놭�nغ�����՛�����j�g��ۣ��cSH �e�9�͑������'���۟|��o��O��ɷ?���.��۟5���ONr�0�aÜ�a0�a��0�a��9s�0�y�t����ڢ�r���H��:U�<GRj7���rڵqsB��eC��2��}]bJ�
V�k������A�}��Q< ��4�O,�YV�+rX��~H���|��vaؒ��y�=lI`j��`k�c�|vF+�ǝ�Itd'[YBf�$ǅV�éu1��<�\~��?jExl����]]4)�ª0��5�+̴�=	�q ��O�qhmۭ��mg�Z���}��QK`���~1��WP]J���ڶ����~�0�X��^����ͶJ��*u���fB���M���Y�2r2�d�ɐ�!'CN��ۜʐ�!'CN��R�2�lby����P�)����:�Z5���랶=����\R���ݫ|0Bt�F6G���g���g������~sR�f9%�|\�&k�u:��	N��6G�X�<149u�9��狑�<[La���S��i2��NN�'��);J S�����)�f}"�n���4����2Di�iF���yf�Y�eF~�.�LU�@��2;�+����KY�]�b��3#'�6�L��+r���d�Q+�&���d�QS(斩Y��>��Nl:��Ħ�Nl:��Ħ�A��=�Ӈ��Qo<����W������Ӟi�Ѱ�Hʶ���o����������˭��c21�[y��d�l>l�KA��~zMČ�����L��/8��^2�AW]����۹�HOv��o@04�z.��R7N|�8יo6X^�sF����Q�
�d�K�.;�o�R�����]>%Kt�F1�i�_�6��@�o�;r�`>�s�ׁ����w/gk�`��OfC{���2}����
X���밷��?\8�%(�އK�\Ƌp�ֿZ.JJ����vn��tf�3��Mc'��E�ؿE����!�wB��!��57�&Cu*O0�oa�b?��+X2��E|�����e	,��O��u�km(�
k<�dL��4|�xx���iz�b8    B�X�RlB�(B
�!�7�-�h�#7��n]k% ,M�^�)Mf�S�b���6��ԑ���?;8�Z�
�^�Z�Ԫ���&��S�,���i����Ve���C�T1N�o��v��-�J�ZǪ-T��<�<���Whg��:�/Wɉ΍e
�(��p�3:'�*��9@���nGX^KaU+S�I6�����c��!�"�w�Þ�|�I ����i�s"����]����)� �܊ ��$X;#�:� �.>7���W4�	 �K��=94y��)R���-�g
`wn� �@�'��. �ĆI~���B��h6�����d"m�vz��P% Dhh��[�Ħ�E�bp�����}�e`
��}X��:��r�9�f�Ɓ������'%6��0q߂�#���6G"��r�B�b� ��xh��. �}ۥ�F�<^�}>b�,0��e���x�^2`,�!��0�p4�#�W�Mj�����ʍ���[\DdqZ�hK��X�ڧF��e!�Ob�s'��!�N#��&�)��������r�3����=#TC�|O��]�B	��������r��Qx9&η~`g4J0`�E���|�^�Wt�����D���'�*E�^N�[22�=8R�O"�f.n%��)Cs���%2���Xbq	J��2�SG��0�+'v�9S�9�[/"y��H:��	�"X5$��r�x�;BbMg`{K�k0"&r������-( ���(x�CC��� ��Cנ��BX2���~\ �6)���n��Kg	1��n�OC@N�X��]�>h�+t ��4*ı�ȝ�y��gF�+?gD*�5��O����od�_��n�9�"vK�ky�h�u�k�#�=��q�zF��V�T���!��B��"A:r��l�ߌ�+�aE>�dZ�L�"�Y�aYp�]{�x+/yE� :�Q�%��O�4l�(H� �$Ո!(��z�!A�Kh���i��/�����;&đ�\����?��_�/�[+��Ή���H�]�
È�4)z=���܀�l���|��\���e�k|!:"�}!&�B�ҙ/Dg�ݾ����i`݁�N���O �N��N
��k����@�~#!R��Fl��fH�}�;4틘���ȰKt��-�)�W��9�9�9��'�aP5َp�Q ���+���$���)T	������$��$��� ���{
PPD�;�t�ڇ����}�3��&�x4w��<^��4�=�%0e�1l��1(cPƠ�A�2e��1(cГcPkfN{�x<���[�!�r� �r� �r� �r� �r���:�F2�l$���F2����V/[�l��ջe�6+e�Hu�J���ʜ�S�I�9��Ub��U�c�s,r�Eα�9α�99�"��f+��(��؊b+��(��؊�L��o���5�'V�L���]�ImMzé=2͚�ԕ	��G�x��[�n�I-�3��9��q�㾼kU���OĪ�q+����=�ك�9F�*04��i�/�d��\�<�/��cA�"
�h+W��`��X�0&�{�b��}(�5={�??��w[���|_��p�G�e@��Ўro�!f�"Tt����f^T���`W6\�z�͎WT����t��Xa�6��vh�%��˵��>��貃"�<K���N	U�.�w����D�Q�y�{����\g[�wf��Iۿ��B����ެ�t($��vJJ�?�������}����=Х�~�e��3-T�[�gHN9�qWC�':	��k�C�n�޺�U-���Z�µ�
�N	+�o���iJs8��ִb���L�4Zu�7�������=뛽�?�Zv�#{:�O&C�ѰӅq]��6��X�l��x�t���=���fO7{���͞�����lE��V[QlE��V[QY� �vQ�Zk�GX�l0��a���l�E��l���8��qXC�l�v;�����L�c����~���^��������R�+k0�Oz{|��d��,�74��������?�*x����C!�|��-`���?giqv/U��t�T�4X�T�7�s���	�*ESahBY��J9�Uj}�Sߡ��W'PS�j���&���I�r.ȇ�x�N�Y9�W��>J�Q���}��d%�(�G�>J>�e+��(��؊b+��(��؊��Oz��{w3O���`:�X|���yNe���Z��������b���G業~]WE7�5vz<lP}Z�?o�^�a�h�9^�@(�� !���I������9ni1֖xf�,��qH��	�^f�?�W�0�%�w5���ǈm;�d-�?�W{�֒����)�\� r��ϮC��wj'ر��,����܇S�h3O�@��q]������z����`�Y�Ձh�Q���k��nlO�nȾл���${����к0> �k� �p,�Hy��:h��r)H�V�Uh+����*/�X�GD3�7;(�m���"W���.�	F���"�wĲ-�~TA�Rc�P��b���*#Ԛ0Be�Z�IF�M+��*#T1vF��P�Խ6>�f�@�����4|F��g�ΐ]7&��3��|���$gP͠���jFɌ�? ���m(Ȱ�a�6�m��1lc�ư�a�nd������������zV����e_sl�܌c��ǹ�U�!N5�*����Bw#�'��g����8}��L�q&ads��!6��bs��!6��������^fS�Z]��tXS!��+K�&Á9�Wv��W���p��qmU�gR�����n�y���??{����g�w�f̾0Z��9-�H��<��q�<�t�o~ى橀<�ׂD��+a�oU'R����ߕ����acFh _oឹ��Q�V�a�!���"�� ��`
�g�)"%��6l��4�j]X`��5 �m4rɆ��)�U�fظh�pnaK�Vg�
�/Ӭ"O񷕋Q�a[$�|�|s�M,۳�Q��зg��}xh�M��xz�l�x�;����h:iUj7�D+��`HdD���JC�8�HCb�Ӑȋ�������-��P`��hM��3��ܞ���d25G\����]�5
y�m�"��e�O8����8��HIl����RVA���쇬�a��;����)�s��D�P��xC݅Pq6>P�@�O�/�}�컋������1,Њ��M��G�/?\|�����"�^f���iu'� �c��Qo흋S�4�럝rti�RP�ٙ��q��l�A3���~vW	�I��Z�W�JF`lG�<?�ֳ�<���c�K�m��qE�Bo��m}���.	�M q �,"Co��u�ޢ�Xz�@'��"\�k'&Zz�2 G�x�q~i�b)��c��]W��{5]P�N��%sd�.�'�W)�K�E9��0�F�D|���v헉v�ٙ$��c�O)U�PE����v��<
#�ߙ����/�a�-=�b��-:����tVsc#;���4By�T�jb<�OaJ�Q�E�oV����mM�2��q����/�Um!����K�|���j�(���>D1�]m�K�NE, |!���P~�M[�R�H���%xEaG�w/��0��a���@�Z�y�{�G�l��p��ٝpME���>R�9D%�����ȯ�}��Log���յ;� @N�$a-�����Ene�a�#(�-R�-��ʋ9�,���V���v#��Ơ8��Hg-�Z�x�D�Y.�5i~.������sz���H\h8�-��y�2D���S��G��ɪ�);�,��\\�~�ټ��(A���$��z��`��@z��a� �҈0A'.�{^՚�@�$�'�1��Z�M�?��.Xm~�U�/HI[�K��հ+ʢ0��9�B����gg�"]��}�D᜼R��� uU�-5ā�oE����e`%������(�p�6\y��U6y��.�RDR@�(޵m~���^�f� �͒Fv�@>7p?]o~I����tT�%u1#�����r,�@�7/�G����.#]F��t��w�H    ��n5�2�e��H��.#�
�ޅlk�����y-`ol�lkV�/�ql}�1�%OI�e�>P���z�ct��V��V�t.|k��� � �B�[A�)������qp
���2Вôut�� u	����?�Ws{��9X�d��`;�>��s뀻��c`-Pu=�nX�!7����Saݝ@����О͞�6,�ĥ�z�	d�1O0�E�y~��P� �2�Ǡ�:�疒 ��<��See8�>�d˘-c���2f˘-c���2f˘-�wc������^�G�ƶiO͖���L�?�r/�tv��qX�H������9���Ν<���5���s�x��Y�9k<g�����s6��bs��!6��bs�#7��#w�":T�Ќ�YY����.��7�l���v���F��sB;�ni���W��}q�����E2�`�u�:��|I�<��o�)�W�	o�ˀ9�h1֖P��k���8�6襓Ef��^{��-7��0,����C�c(�$�Î�RK���}�Q-	L��`5_C̀W>��W�[����ޔ��d�qo֫�L�v�PG��N��Rz	=�سY��aR�ՠ����\mlO��<?J{$���W�� ��mg�W���o��Z�;aA�ؤ��Cٍ$T�[ʟz �V�l��`�X�ٛy��7�E��k�}`~3�@/�� B5ʃ{ޘ�2u�6�m��1lc�ư�a�6�m��1l{���Kyݕ����nS�i'����P��ɻC㪻C���C��C߼x����Ͼy�I��魡����cK�ә5��ǽ��n�-��3����E�k��Fl����ÞiN�S�-�����-U�z����F��Фt��|'���
t��쓅Sp���BdJ ��!O@�y�����.�xOB�hGx+�� �~f�R�|�+l�g�����r}���5)�w��k/zШ�@�[֎�z�+e&Yja��|y�>z|�K�q ���X���
�P$�R*�{�o�( �c&/H�h�K\au�w��"�lX��c�e�Ҳ���5K�o����@#��|2j�,�R����<\���s� S{�l�\��/�H��7ڷb9�Y�����ҷ8���Y]�bG_�uOs�2��u����E��|����'_����tvw�٭%N�TY�\�j��S/>�҈Ƨ^|�ŧ^|�ŧ^|����1��ӉYw֡���=���ڝ'�=��<j|"�n���<�Pn۪����� }i{�]R������%%X�M	,�oָ����th���^��ۣT?$�};^Y��<A)m�,|���d��.y~�������r)m.�ͥ����\J�Ki�5\J�Kis)m.�}`�.�]��GQJ��3OA�=�w�e�yj��e��Z�׺�kN<������W��~\я+�qE?����>��~\�-c���2f˘-c���2f˘-c���^�f�Z�������M���	��z��h�)L�>�OY����$cIƒ�%K2�d,�X��$cI>ea˘-c���2f˘-c���2f˘-c>e�XOYF��ٛ��mq��N
�w��T���h�"���4HQ�c�%X�����n�rΠ�48�g��qg���A�3hpΠ�f<{�#b��H��.#]F��t�2�e��H��.#]F��t�����8ߗ#�{Q��p�_�5T���T���';2����Qw���[������z��ptz�5 "�c�Fv�U0�'��:��{���cZ��}�bU��C;~1wE���3s0L{��M�/`(EI�Qxs�3
[�fC�7�LY%`��#Ю��&HE��*�R���Ue�M9�f0����شFSYlE�2/�r&"5��?���^��e�Z}�ִ.{�>��`B|�|�=��T�fоU�z�������_ix-����_*����=�%����k�|��h����c;BSH�dě�`�$h/]y�k�k�,���0o�ֽv��Ԯ��PYJ75�So-�1n�0[@&�G#t"�l��/�y7��8u"��u`��ܽZ�ћ�쮰��*�	M<	rR����Tm=���K��J���8����2��`ݼ�+��O��ܸv�.D�n&|	i&L@a9`5W\n�F�r�'(!�i Ϋt	�� o$�nn���b`d-��|�N��$�6k��Dς����������O��XDV>�D,� I�Z� ��h��KY�w����������[�{���e�;'g���W�J��q�1IO�XR\V29�'���4��*�)���sW@�n��
��.�X]����c�D��?�|��&IְW��������p�s�'K��q��'fߜ���Vl=�"��˧b������x1,���cӵ�����~츮��j��˜N�t�]�	�y9������g� �y$\�ȏ��v��AA���T�^�x��s5�������~���dw�-4�8Am,�I,�3����b�}���.��,���@K�^�э]��H'l���.�k�C;���a�H�U��*�Z �6o�E9�
<�KTr4�Z@GWr�P��(w��~/�~�{Gt�a��f<+n&%5_x �C:��i���r[�^ �9�Ns,dҤb���L7��a��0����w�W&�s� \/�"�%<�l�A%���g���"�~#ᦆ?R�d�z�ߑ��uks����r7�z¢Ҵ�Q�!L`(����ѹ�%8ߗ�:ӹ�'�[+\�}U!�>,��iv�Jm���u_�UT�@�⾆��}�ܖ�"޴zqL�Ls�a�t ��H?=̩Վ��; �D�.a�`��FK�~��^"h��NQ3D�"�Dt�GTxu�*�FD������4�N�Ji,�v��u�D�0��//�����"y���k��]zt
"��T��_�$\�@� �DE�kRA�!�$�㒤�2>���a��>U��^+�F���K�Mjk�+�\�J��ȍ$�\�.c?�H���g��a��%�����o�KPh�$m.Q��+��k�m���k�큨{��D� ��O�p�-���td��x�������Z�=�qI�����O�디�Ժq�Z�d����+7N#b�-y�dT�9e`���~�1 ���G��,,���cI��( ���O9�/�y�f�X# k�Z�1�������� �%��?9o΍��&�����k<|
�{��-
<����C��x�I�C ͯ���8���%��`�"2RD=a�ʣ�-۲T���)g%�Op���e#� }��K4FH��M@�
L���[m��qM�7U.�� #"v�z˅�R4r���+TJJ%�я���8��.���x-�v���Eb�	]`���E5��/�ơ��@��n"�}���tȁ��ˣ����K�-r�d�I�D1┴��ׂw׹3�$s���q?������Pk���0	�
�cTb��A�Y�'�I��{I���������xX�����)m~�����_>}���R��ɠӛB&nÅdi�#��B_�`�.�+�-�&��wo�+�e,V.W��2�=RX�E�U-�%��4
� D\�%׈tиA�#���l9��﷩�VLX�H�����{�/}F�H����%3�[7!��*����x�F�:���@��+�ʜU � 7�Sy̼�\qڑ�s$���	DV$N�r���v$Yv�V
�4��W%��Ε��W�#gjM[��M\*,�ɍ�L��p�2ˍka��O�3\ͽ��E��UB��c�7��~b������@\�?ŏ	n��}�Y�F�a� ];9��cI��q}�z1���[�.�d����'���O<�g���Xʺǰ
��C(�10Gݘ�ɃN�����rM�`�,�'�s;�I|y�9�O�������z{��.�_'ȍ>����P�XIʀpz�8�Ƿ�߮A�>*��p�d�y����,T1������@�5l�8kJge�w������Ybl�¥�vp"v)������F��<`��w��ܯ�k)�w� "P�y���Cu��g���t�]'��I8�    I|���*ХI�����ky��,���Ч�?��$�����AF|&��jiLA�$	�w�����[h�����+��d��;��������i�ә=�M��ڋ��M{ַf�qo2�G�M�ӥ\^�0�޾Be�y�a�:����N���[4�E�$;��)����5������<J������k���t_s��<�"�5�<�U3���<��Ve�lg�lg���ų��>�͋{�s��g7�y�@wD(��R�Ͽ{����?"86f��VW�Ѯ��`Yol�#ܯŔ<�ﻁ�F�A���7����j�N�p}�6�<M�����7I���U��F�
�/oМ|�K2�M������?a]�s��i����\:@a�:��X�ͬ��m�w��?�Y�Y$��n̂0�f��g��ò �8�4{CӾY��p����9�;YJa-ߟ��� �Υ�(0%����\h`�ɍ�p��_xN��ıc�u�vƎe�r:���h
h�bǆ�*�1�F�m��\�Cw�#��q7���B��+�'�[ņYa�ޢ(���K7�Чx<����e�&�|���X�^mA�D��E�E+:	��,$D���I�����$�u�\�^c$-p@�7@�[�Y����4u�K�W�*���Ii�1��Q�y>9��kT9��+���X"�{w+�:�Y"����w�HF��b���S����4�$%����ڞ��M+U�DY�u�)�@�=7���\��ח`���p.+Dv�,k�s��Y܈�*|�WEV��R0 ��4&"&p���GY�pN��]��R<����F�߇�����*��ؼ7���~UG;��<�ߚ��	��������[�;�bb�*s�aD���e�\��uw�%�s�*��KX�4����
�0L��)��c�?y?;ђ��Ks���e��x���S�.��qb�M*��3D�k��Zw*n�tկ����������_�~�����T�����1�����QØ�w5&����mƴ'�4v�YNp�,�*��\�sW���0X^fR[7Q[�3�4@�휝nѽM͝��l�Ҵ�����l������g��^^)�����a^^s60g��ۓ/�R����k[xIklٓ��`Oo�'� hõD��03wy ��@0Ey/��_������Ł�p�h+�*��H�s{��Vl l�j󐯧r�N�w��hצ�"��^ѯ�vH���k]x��ZL��Z>֖+-G���r�����z�EG�VZ��^�J�!a8��v�`>�M)����1z�|��۱je��o�-ɿ��W�xA�
�V��˭U��Wu��PݫI��%%8kԻ^��kT�G�f��%ۅ��	���_�ʝ��I*�}ބ�K����^�k@E�=W�ۏ����u��3<h8[ ����'�V�u/��	�]�V��ڱ���a�eD�X����2c+��:����o>>�B�3�v�$�eX�0�D[U���t�uM��N;p�YM�vui���~��>��q�}L���~X@��]���*1��ָ���ِ{�����^�񇳭�]�v��+�'��s�v!�ذW��Ft�����۬a3r; x�׭�W;��/�p�����ͯ21M)<�R��*�S��T�M�W��;%�Ԯ���mug|Swޑs}w��sO]w�t��sr<ywґS��
Q���)�{^78���tEA����+
z����+
_Q�+
|E��(��;rEḄ�����w(s�a�7��G�f��-|��/�����[�r_ny/�[4wƇt�e8�=۴�#�/�t
s?���r_n��-wlSvr��#:��8�/��B<��_��+S|e��L�)�2�W������[�W����'��p�������_�����[,�.��x����޻�$ŗ�����vN���S_�]���I�_�z痤�7��.Ii8}�//I?�
��5�����|]��S�>��}���?�ML{dO�N�����h�X��袣�:��ʥ:���Ku�8O�T��U��J�6�Sji��E������qs=5�XZ�.
��X]V����t[O�����gO_|�ka��;�0�F*"nY�F-��=9���̲g�Aol�wF���x2����Y�~�ZX�S�t��Wn�݆�οkT��زl�^�f���*�;�d�<�d���Q@�~z-n� ���-���KD�U�/�:ѵ��o�n��_����� B�؀td�(X^�sQl?��U�藙�t�5�(����~�y���{�����/@��_��;w�Fq�����[���u���hn ���W0��u`?~~�݋��=�	$'��Z�7�[T7n^z+P&��^��up����}8�R�ʆ%s.�E�v�߉a��aa,��
t23�z��K7^D�NZW��?����i<�~x����ftn,��	Ç���R{tL�� �P��K�cD��Y,ĢсM�������<���ۣ�������Vw8r��	4��Z}c�x��'4;>�	;���ND���Qm��nq~k9?�\���a ǧ�{j\8�b��>�]���|����*�C���c<�Ob#����I~���E<������E�H2�5����X��:x��'�aOC���GL+�#_l���/+` �`�EƏ������1�@m~���G3� �?���>�'?}�46o����p0Ɩ�:rW��%b�r<��	��}��G�jn|w��xh�*2�����x��M AcW42�[ �ky�LbNб�+�C�c��ay��f"�y������;ȅ�u04#[($�L���/��Õ��;�\3I�瑷r#G|���-��dr9��XXC�T��?rA��OJC�"ʉ���H�{�t�-�$]�!nW'��V�3̵߭�ٶ�'�-�ԑB@���q�����Z|�^��ڞ���*����G�� �b�8q��ss�5l' ë4���D^�}z��
��bP��5!�+�~md��rp�^D�5����eR7o�BR�g�'bq��Ɩ��`DK��d#E�)t����&.3���FV��N0�p�QHk�b�,d!�H��DU����Kg	b8�vn�B�-7@9�T�z�\��_ZE=U�J6d��4�K��q2�)_�[�'� ��|������%Q��N$��(EG���a�W4�؛�4}o��-)�I��A.S�`W71hOC#� �ㅑ��y��ڟ�
	𤑄:�,�S���w�᪬��l�9("	Gr;�� a�@~�i������f)H�"�_D���%6�m�x�E^��X�6�DSjC縺?��_�/��BVY	u��k1qM;"=��J!LN��zډ�m�f�k%5?�G�U��h�Z��knTm畼�7y���.�?{���`��!F4]Ga�ֆ��8+�7�O �`��X�� ��-��)*s�M��f���,���+y�!9!�+` �؅=�8rK�yd�˷�#e.��un�E��[+���S�%�n��w���K�
���rL��|F�Nao�����N+�P�|)����+��.2jn��J��Z7]��LW5�U��j<T��9�3����N����QV�w.��gf/��M��3^�	��q�L놋�bE�LZ�_l�Q�$�6oB?��SO����I>}��U��J>���{�&i$�)��Wq�M/.u�X]��?���:��C0=�@L5W�p-�ض�~*��&���m���j�ɍ�DJ�o]��xMlz%
��v��`k[\"�x�69�R��吪v����6�����=����t������1ގD�����,��0:��\Y�d���ԋ\�5�z2%#�ܭ����g�L�x�ǬǬwZ��qP��gG��@���HL?���0�I��O
2>�>)��>)��>)��>)���擂��g��]�{oq���=�{�|��B��e�Ӿݷ�?�w?�缟~�Z�
B�؞8��m��88�m<�w��t�o  �G����.V�Z�b�v�tl    
��g+�X�u�*>c+�X���.Vv����]��be+�X�}�.�\�ǡm���˼�ճ����z�~�ӻPj����G5���}}7��éw�dj��7���<�����c�f�4Mv󰛇�<��a7�y���nv󰛇�<����ͣ6�i����F�|��=���`z�+��$-�m�#j�?�&��7���}��p�(k��:w�F��x*�)�S؝ҭ;E��S؝��v��;��)�Naw
�S؝��v��{w�6L�����7�#st��+;}!u��O�����z��*���l&�@�^��za�K׮�g�za��^��®v���]/�za��^��r�]/ې�>�`���pj���=���u�t���$�~��̹R��V`:J��V;�{�"��@�O���r�-gO��A�^�&�d�� ���D9eƚS������b�k�r��q�ț��|_����a�eH� �X(�-w+�ʢ��3R�)��+���^k
5���
L4j]��Jm�&hF�pv~����P뙳��$�6g>��k��-�U0d���Pu�oY7��w#Tu�����pW�մ(Ȧ'MKG&���g��]U�+�$��Wa4�Eq�)���9�MdAkjZ#U&��hU��p�������[��m/�,^��z&������Ժ����<��(��$Ȁw��[}�f}C�M�EnK��MM%�F��l��4�j��Y�~����7{ɵ�/�%\�w(�
��W�c�7����n�����Ȳ޻�+P�E��8@�p�{M߅Ll��� [��`99���%�K\i�����J99�[NN49��,~���@���;%�K\�5�,5+�|�³��w!C+��ڔ��6%'���7F��oJV��I�}V�]�v���k��b8�"�G�	YKL;��vt,������il���<�����/z�#��%WN&�J�����A�ի{��=��	�������sH���bt��C<d /���%>�K��M���@�E�� l��[���QȘ�I����2s'���!-�%.�%=�_RT�`Zd�l8�[����d�H���]:�Ri���x�g�<O��_=:$�t~L7�t&�9�^�ӹ:���b'�8OvA�򝚙&�j��M8o��+n�!I�T��ۭX��������`03�Y����({�wC�h���=I�q����ƒ}���W#�aJd�T����"9�x�,�'�p��)�6ܱ������N�qdu�RB��AC�����2�U�r���R�i�(�~�(mH��C ��)��y��-6ޑ ��������u.�TurQp]/�T�k�5z,�j�^'2����h�B�{�������	�ٹaZ�2��b,W���6�f,/�����/�������u��.P��qC����;G�_���#�D�~{�ʹ�g��7gOw����O�-�VD�ˎ�0���Tz�ӷ^]��L#?o`�,�q<����F��+4cPp���M:��q��O��BM�s9O�� (�����Zs�޸�~�ex뵛�Z���.���%.��?��AX\���2HH�-���X�<�7a��s����Y��0�c�yv��z��^�+��s�x>RN�I�V
���� `��f���V�9ȒD(�(H����*��" �[^*�_�n¥U�^�Ҙ�P]�N_�(�S`�%�t�[�Kb�_a�N�`x�؇�[M/��%��]n������\D�{��t(��)W�z9�o�*_�S
���*��}���xS���
�w}�v������:���o�����YAת���1]3L���ͯ���@�7��M�L�����7M�t�̤f�gh��6ݮ,]�ƃ:���t��M�.�n˝B��g]ĺ�u�"�E�j�F��d`�ࡊMQu�]��J��^%�~������+O-�����k�7���<��2X�ኮ�*ݫZ�������.C��y+�g���3��g��[?]��	D�J~�*�/�s�9��	պ�����[7�K��63� �F3C�`�;�1ި�]l�K��=�s�)�w�����tV����l��7�µ�Յ~�|3"_~���@7�`}��
�Q�tU��ȍs4���_�2^$.]Y��K7�^����vi�7��8F=�`���*O�����
#N��� _]q�6_Xe��:ojVǥ�qJ�c��X �N-�r�U/�X#��ї�ɗ�іz�Bm�Bh.����X�X)1��V��q��V��\�Ղv�ZV���b%��k�fk�f�%���UHk�*_+�T0��/��M,���V��p��*�G-��ԛG�����[3k�3Ǧ5
a�.d$���ǈY@����לBf`ù�(�Ό��'�ߵD�v;*�`wI�l�U��@����>������9��d9�O!���K$
s;F(U-�������K0~/mtl�sӁ(ѭ�@M�k@4�犀Z�>Ė<��-wg~4�:k�%�;�]T��/Bv7
�6��2$�����e��My�4T����}��	�R�s+��	bś�tB�dic�:>�O1�?�����p�mG���Q�	D 犒� ���颖�g�W�-��!\�K)��oKo!r�ؒ����� 6&t�y��{	p��-�SP���+"�;��u2S��1T�7����F ��Mv�L��t��9��
D��GGʚHy�� �Q3%��6�3<��Ś��BC�l����ka��z��sN����1KJ!���E[E�D�6�!�ey&Fό�Z^��a���
!�����v���\$������Ȥ%��Y�(����y�|3F�*�K}��D���gxt.�E���	:�A�uy�$��!@cD�>.����qʏ��<��z��HAr�4�l8+O$؁�R���j$+7,%�'���͡r�<��ņ1h�B$A�R�����X$�p���S�eX����0e����:�eLL�%�G��);���Y�k*��!Ap�R�B�X���� �~sY ��x!���o��U�����TCuuQ�o(
B��V#�x�I]�	A�3�i��NLR'7M�3�`�;RhpdY�R�,����䀴�L�8qx��Bh�Bx	`ag��8K�

�s
�R�_^�n4}�F'�g�� ����"Ԥ�\&�
��--��3
F*�her�r�u4� �RH�Ud'����(�cix�����.^�W B��'Ѱt��Q�A!$�[��0��+^r	�J� L(�
�e����	��rP���d�S��b��������pE./�k�N򂬧��ȧ+&��[%0�k�H�.��%p��k��j�T��ݫ��ȩd۽�t4��G9��4���$+Nb(�8D�VjrA�����S�Q�T�T[Sj�-��bN5�,3���=-���-�Y����ޒ���&�Q6�
�liv5�]��M�k{�3���;��Dm;L����>ep�I�3�϶&��92t��F��z#aw".wQ7�p��H��
�ѡy��e���ˤQ�F����Ltti��Q���S���7��v��w+iO�}ш��N�"Ѽ�;��%Hv�Q�Q�;��f��������"�p�[����N��sm�m,�b��u���m���%o<���mc~�t߭����F�~�ӕ�M�{/ɍ�m��C\tD�Sx�J8���,���QD�u2�	<v�t��̸.�R��p\�����)�R��Ts��TS;J�Lp��\UZ�U)��W�X[��e�p������&l�����#:s��=*�R�t�p�s{�0�b>Q#�D��sX�xa�c�\�G�c_7TFn�ƭ%x��l>-��s��?���,+r@l)����)�x^�>��`hZk�S�z�S �0�g��-�\��*�ą�j�	,�C���^�la}2��<�4$���q`��"�&��yD�4q�"�������WN���+�=��S�9����ox5\T�d]n����a��br9\�3O�
�    .ݙ��r΋u�
��oA(�j��<44e�E��BX�_��)#�曷FH�Σp�Jʓa��!(�D�|e��ϚG�Sq���ʽ������؀�C����J7��)��PNa���<�b��$�I�Խ�T��'^���j#ܲ����&�7���QHP�
%DӶ�i��%��)���^�U�\�4�L[��V	��)��r���x�jY0v՞����g�\������ic�޵[�gR"����HOK�S_�ؕ�R����*;d~C?������j�'�<�.������݃$��Q-�<ay��h���d|n �J;(Pօ/���DG����pf�8����gۓ�ey ���W����Z���Th��m�F۞_��B�5l��-�X1�nլ��Ѵ""�se+<�����­Ҹ2WK�t���>GL`-f!�Rͪ�Mj��ڵ��h�ce-7ˡ���ANaOv��Iޝ@�g���:6y2�.��v��E�Gk�NZX��<�am����֧�ק����S��|
�L��gM�w�i�:Gђ%��Jt�Ӹ]:�́iW�*B��H�/�r�8��c�O�Nq�V^qL-��B�j� ��5�4���]��5Ξ�Ijpd�n�G�_"ϥʺ�ׂD���l+�޷��gO_|���ųo�}w�U���+A.eB*�H%Q��������t�ux�FU���UU�'+�.S�BZ���\�FP}�P�=�m�2M�]�Nr�je�6�mЩ�u�z�=��Ma�~��щ�?��+݊��Xb!�l��S-�_.S�{�_~�����w�|���b�q�H�XI���1��AUnR�%S�G(�iW&��N�{Ȏ.XQ�!��R����U�ֻ�*E�Tw�����ò>�2���������d��9b�wGU��JѰ-=�r$ � �}���%��ͬ2u~2� Ł�t%�w�Q�p�:�E����D��c��W��f�:�Z(���<{ԇJzk�~�Y勅���[!i�H}&'-C8�%��un�,b�YP<�r\L�Y�~�L�.Ĵ��UM��sQ�ٯ�b�:	�n�2+UW2�S� ��SO.�吏�V0;J���V�6�B)��չ^[��mƬb@}���ޭGn+K|v�
�@��Ad(�,�Q�r��Ke��F�����A��`Z�A�8�t�TOe?�c?`4p��Ŀd�m_� �_Z�Q]��$7�^{�u_��]g�q%�	/�2� ��MG�+�e驘�)k��$�k~��8fo�O>a2�rOK}���{WrҨ
���0J������ܷU�v�=by�N(��Jlk�F��`\FA���P��
�p~k7��>���5��?�|�'4U#w݇�L�I��|��e7!���h;��r���_y���%vB��RР]�(H���/�wv�K�C�Ԗk���m~��RȦ���������඲(�ɜ߻ټ��s�S��zUrF�
�-J�`~@lj0O�_"��&#��/��H�zD���yg��l��0Zn���N��d�U�w�:��^�a��P¤����,Hk0U��$\�R�g�u�X(�	~L^�b7ꤑߪJbX�nM�����U�OX
��L��S!�?�`h�C"����r>9�zT�I��<��|-�uX��h ؾR��{���Js��u���X�;�&I�}�\v��N�?�	}O�/;��~�=�saH�$F9���p!Jgz�_���6�t9�6�����;WQo�����cj?�b�WF2j�Σ��Q(?[���=�;P�8o�#� ��N�"����E�t���8ˏ8f�v�os�9؍p��R$|����]�}RKիf�ߓ���wf�\4��ఖK����:�z;o�t=�;�BG}�T/���oO�X5r<��#%���L�N�����=�����%�:k��v8l�s���V�r8v9�tϐ��� v;���g�9�w>ױy�o���>�4�@��wR�e�.~�^ά��{�rbmir�[���]�rpM��9|\i^���zN�n'<�USN�������g�-y��u.�sq���\\��:׹���u.�sq�`J8w�,w.�/��=��j{�H.b�F< |�������ޓ��j�	��sg�ۄ��G���c����E�%�lӁ��K�7Z��?�������<����z嗢�Ŋdϯ���kOM��l��y3�J��PVFw���� �p�I�S W`����#6XdS{���IC�WO��WD ;�5���`#����'OR��NM�O���˶k�.�#�F���)&�:��`��񳑍��j6�g�C�F�쭧�����iKU��2�KPDo����F�w�z&�|����UK�h�`������LD��,��\$s �3�_>�p�g�PMi|ܞ�LE��XJ��-�
�޺���|��3�wC�;�����j�]��K"60�B���?�N���OR�C�H
�|�3��	��O�9k�v��g����D������+����d���U5���b`Z �j����7@L�ɪB��"��Ґ�m�C�k�EF eW��!���/�ֲ�S*5��zi�(��z|t���g�_Dɕ�o���g܃ʯT�)Lۣ��V�wV��63\a�e�\>,sX�WQ��T~
����k��]`��S �^�۽W�DC����)0�U\�Y�VO���\s�~M���XЗ���&��$כ�z�\o��Mr�I�F�]o��Mr�I�Q{��jH�=7w.�m��P>G4Y����$[�H��26�Yb�����m*�{�'O������m��ۺY4��[x����ݱ%�Z���)UGS�n��<�R	�=�t�UM��/�^v1����\�+�uŷ���ߺ�[W|�o]�+�uŷ���ߺ�[W|{�Avŷ���ߺ�[W|�oqŷ.����s��M?�u]�u���躀�躀�躀�躀�躀�/*����߹P��P���\8
[ 	u8
V��p8���Qp8
�*a�����hb�(���9�{=uF_|�� N,��-e��7ĕ�������'�>y��6d�"����WA��x6�G�>\P�Ja
@�� 7~v�����K��ق�Eo@�Eg6�rR;�y�W[�Tf��%	��vL���?��"�͡[3�S�p
���Ҽ� ��f��7�x����z���Ż�	^`��x�!��	��e�.�'�d��W��%3?z��H�g���͒UP����DY��h�]d��� �L��+���p���"��S0�6�YZt���m�w~:"��}0|x� ��i˛���ɫ�E�� ���6����ϰ���m�ꧤ��9C��i`��?�3Gs]5M��w�n�Ov������h����_F��t��>坂���|K�#uǰ�u��S���]�q	�&l��%tm��Wa�K���I��4�0aĖ�� G��Si
I�o`9���C���1ְVQC�X��-�p�����K�k�8*p�*,�~�G15zO?���	-c���So�&�oP'G�����W�ؼ����=��w��r��ֽ�/�U��M�@�,�A�|�Q� O�9�dn2 ��	����0R�L:��Rn��\H]��z��\���{�<�b՘�ѵ�g��o���t;��>-L�\&x��/���l2(�X��)_����C���፹5?%/p%x\}+Rc�:E+��m�f��D�d|X�})H�6`(��;���A:Yk��ɹ��70r�s�gɕd���|�d0V��v��Z9s\3ZB����}?�7^�L�6L���<�4�����f�
I��3�
o�c0�>��V��TQg
5b�vs�DxO�;F�,Ikp�c��`<dD?S��X9P��Ff�fa��� �3��;\ g^s*<L�:Ia�b���V��		z����*���c�}�Kj��!n���� �z��)It���2EG
��~Ms�«��b�uf7��
A.c ��@$����p:H�����]��G�CD���P���<�w��E�p$����)t    I�q�WY��m��I�"�r&���m�CD`�(^�W2+���@4�6,�A1�/����Mh>�C��-�0�e���#IT,�u1��Q�c)Ƒ���������T��2bL��5<���$�����:؜� �ʰ�/2���X>-EF�S�/pjr��,��f�l2�l��E%@�C��($�
sԆXE(Fb�}�p<h׈�e�2"Z��)�"#��i#���}6j�{��%�y�,�If9Eö4<+LO��`+�����"����꫶��3]�9W�:AZm��\R娦! `��v���^�rA����N�l�[X���E��+�=3�ˎ�M���p�1�YP��4�ze��:u΃u�G�WA���\rv@�^��<�9�n��Bz5a��ZՊ�:���S�u�U�Q���+��bߜwǐ���w;���������ΐ���H�=�9�����1[��l鿻8��Y$���$�$�Ѱ\�Q�&�d��J7�~��r����b�T�a�*���jR����U��\�u����&�����vG��8�*��-_Ռ\a��7���쏏���|�}�����F?y�ɳGm�ſ-i�A��fn����	o�'� �#��%�qQ(�&�ծ�g�m��z�"�SX�#>�o�u��ﰄXOGB�E��p��q��L*XF\��K^��q`9�����j�SY �����Z�,�Y�M�%@1\��	$��@r,D<Zd�J�k��֪z+��?�B�4k���k��6��1��0L�^��	���o�"��pM>�u_D�L*���d�*��}a��"�%��ui��kp���~RN�+�+Q���:��^���K����7j"����z�$o�AV�,ą�/�U��~�j��#��(�z7�6�s�v�wn���B���푴�*�X�%耦 S�O������Q��k3�k�%4Ftb���@.b��ϼ�D9G�窌A$U�c �Kh�K�8I�i�N��_�+���$JV����ɋ���z���eo�����sz[O�[�/��˴�+���&6���ۓ�h:��-��"���R	-\���;�T��Al��2xo%B�l���������V�u�Kn*�����
�}W�ݴ���[�1O��+(�=@�P���jd�7K�+o��0�}�j�+��!T١�p�^:;k��֫�S��'6w�� J���
��~��*ϡ?MK�AT8A����]g���Sj�Z��Ի��l�Ӱ���bw�9ҹs��٧s8�װ��L'�S;gQ;�Eɶ[7��ܭ䧍;)J�����-_��<��M���6Wv�4-D$�2o������$A�3Jv�C5�o+L{��δ�Nw9�����w���^EI�|h�d/�.�~Y����O�Y���� l�($�;ͅ�T�H+�Q0s�o�p���ߔ�����W�z.7�����ൕݼ	�h�/�8\���U��a���O߼ĭ�?�o�[)���?�{e�R2���5��d�$�:�
ʿ��g�U����{] ��|��:P�����)'d��2���U"a4�<�ޏp�0�!B�L*��<S9ު��/�1	��I�<�$��8�I%K ;p���a�+��K<>S���e2'.P,����3�D�Z�WT(\�Ã��~�Nwc��WA�2�e��C��/�@���/�r8�R�#YNB��ט��'�w���&\�D��c+q�������'K�����Wе*�h쌅��~��O]^�����S���49^�M� %�W�A�r��M�2\��E,��MŁ��+�U�W�j��>�W�!�g�����o��L��(F+�`�7�	:ۢ���1��ooq��#�{�A�琣y�|�>9j��~�.9j���x"�����z����h~�Ju�jy�Hg��ʿV��z�
��������Oh����n����3�����?U0���Ͷ��Vфw���{�̛`�g�3�t%U{&SN�q��>���������X}���bk����A�K����;����vZ�dD���*v��gVŃI{<��'ӳ���-��f�G	n�%��WTFܜζr���T�%G1�C:�����lk���v�۩o����>T}O/;��d2���I����»Y�W�ϥε��S�������;����u���N�;���N������;�N���]�p�roLQ[Z�^Q�O�X:�C�����S�wQ�v��ik����>��tv��z�;jk+_}��nTCk�[�����U��dpW��OE�0|����+`�&tu��׹�ڝ�����j��_��F.�+�����{y�i�_��.@�9�����$�����`���[?�ir�Xo�X�ص�(�p�z��w�yKu�k"�E��F������8���q��9�Ė>�˝���kq�~D���u���f��yS޶�J�y���!Q��wF��ަ�ĩa��]O���N�ru�px9����t���t5�����F5��^�x�������z�N;]�\b����E���ew�O:����.��97��m%[����{�j2�+zX��vz���N;e��U� ��v�3�w�|b�ɞ�5n>Zm����z���H4����̶�i�3���g���zv�٩�_�z���%�\2�JԳֽu��Z.(qQ����8��4s}���rm���jv��ܪ�{��\�:�ް7�v�Ʈ�P��p������W�[�'�<��|���VvZ�ie���Zyp�郰�OGM����{M��έS��RG]�eO�Pk�N-;�\��{N/;����ϭ��?�n{2����^�ީ�ʇ�hK�֨hk՝~_��w��Z�S�NE;������U���������� e�˄9@����N�[�v�n�ɝ�>}hb�N�;eS�N���������+ICzO�/�����w� �~�G�$��Kn�:�(#�9��:�� ��u� ��θ=�{��0���	]{�N�[t�M�M{bA�}�Ry�����h�>����X�2� z��!d�����7߮��~��N'�[�W7 o9��GI�9��~���FB�lγۚ����<�@T�-ϿA����x���,\�"pr��"�[m�.��^��7o�v�7*���A�x�Տ�(����9L�D�,�|�����C�B�ʣP��x�!,���m�>�7�����|��3�q�&�-�p��������15T�y�M��i�'�����hOc�G�L,��g��:���~�=���_�8�e:+[������>��hSj��E��b�{�g�f���m~�3��q��A׳)G�NX��t=i:��������G�~y~�a�ڳ_�	�2~�'�{������i���;�c��t4�t&�\Y�V���N3���F\T8����/���Hy�8���ǌ%X��y�ӟ���;�#��:�,�|����ZKiN̩8p�̺��"�KSx�H�"q`�|/���߆�,�)8�Q�}/�i�z�>����,����J�U�@��'��曌��O��ʇ��%/WQ��2/!g"�34��� �Z��x�=����$�7s�D��e6�-�0I ���Ҩ^��_��|���B�p�y�%4<�k��{���wO�~�V���%7ߵ��ę7	��e���7����	���g�/�ypZ0yC�,�pٷ��~<���+?|�{�~���/�X@�V
� l^5����/�sRS~�#g�,�����(����&�n���4��-��|\oq���u����滥�y��{�^�g��
4�7_�`��¯@E�cj}����m�-<����'nf |���̴T\UR|���O�3i��r�G�O���'KX�,Lg9�����"9�X�6�p������my3�-d�,�J�u���[8�q�l �@�x��v�YB���DG��)���vS	�Y8�ps�y�'�����2�<<�@�y��MZ�����˫p�f�G��tpIޢ<�y�6��}�T�������u"��a�Š'm�G�`�X�3�R�� �R��kc"6��,Z���eE������Z�j(?F��u���a.��� a��    u>k�n!o�@)�������"-��fx�TEU���� �6o�0 ���a/pD؈�A��'�|0Z6ocd28��o%�)ga���c��x|�<" �PD� �y�� �x��Nsܝ�g�����X| �9��x8:@d�02���r�Dj+��Z��ý_�/��Gq�O�/���LE�2�#<��An������4!<� !�Ь�I��W�f$t�tcp���W3��;z��q��
�Q�#�����L�4�m0;PLy,X��\���dVa��ߣOG[@�O�����ÁAE$)Hl����`u0�����f�S�P�������ez��=}��f �Z+�x��w�a��tfd-�I,^L����9"� !7?��<��X<���J��eLe���8�D6[i�d�I��B&�-�Z�<��̃�|�}�T�+��L�I��m�+��ZHY�S�,R��՜�#�`�	J�*Z3�<Iif��'|f��N�)U�i8|%{j�x����5#��ml7�o��Rb�x�e��y���c�v�>hK��9c ��jq�kP�q�"=���b��_����"��
~^^�W��&X��CMl�J�\!�����^�jE5��Ħ�9Q����>u񖁇��ҲaW֛ob:��c갢��-P>z�Ȓ����D���wpq�[0���!wM�D� 3��'���0���F�U��ͧ@X:F?��i�4�J"2��Z+#�������G
�F$��� M*y��lc
(Y{�����<���\����� ���S�4m�l�]�N�ؖ��_�)
�%D�8͛����o��Lً(њ��F�QP=%��[?m)�#����%FR�������B�^2���+���~��E!�����I��q�������H�i�iH_�{�?O�fex�~\>���.| �:�2�mI#�$�Ȣ�`�T�x�{ӣHΉ��+آ\�1�I���xn�8��J˺U��_<�LEc��j�&�mb���!kB%%�����Է��v@C�K�i,&G��O��8T�C�7��eIK�5����Z;�Z$������j�����N�>1��z��+�I��h5�S���3��F�UFUޮ��+Y����4`=r���@(��)p������������x�ghB�Ë� �'r��I����3un�8��5,���>���?e;	-H�����Z����g�>~�7iGyQ�ygr9�R�1cZ݀R����*P^�0R}n���͒Վ�9��u��0�ю ��P1Ǘ�n�?�(n�`����( � $UX�#�REW�g���L�0�-��X�q/X��,��`WL��w���'a�`���-iA1�r=�d��)l�(0F���Fh���[^s��"��8EB���Z^�V�*�^��"#����P��#/�k�
CS��/d|a*7*VF=K�[��O>F�}�wq0�9V���/��J7_߆��K�@}�A~�q��+�"'����8R��Fs��%��<�ǭW�ؼ��珞y��C||���y�C U��Az�����_"a�
>=a[�*e�ߙ�;q����]]G.�.�F�nId���7_��w�gy�۞M�g)�/��o���@���w؅�C$���c���46����5Q�E��r�ӑF�������n�Zj+��5ʙXE~ɐ��*:���q��_p/*;��[��^�->�	�Xl���`�k��B^����9�Jh��d`�L�k��[�}L�e�������݂�g6N�)�Ú��\7�@��=�^��Ub��P���Xy�,�d�K�]�1����s���d���%������G����9���J(��U���C f^s20���0}1R�d�+[�n( ����i��&'B<[Æ�{_����H�$4(��P��||�_��k�s�A�O*�IP��C�
t� ��\8$Nȉ�����#� ":�$�ad&O�y��"�MY�`Ǜ�#� E�pE��c6f���	�0���Z%�%�T�í�x�C�ǢX��@RZ���@4�5,�����ch>�CbM-�0�e��*��u)D�'��p�l��&
5?�J?,VQ����q��e�ܪ�x�c�̯�	<����
<�v`�\���1��YBG]��:.��y���\i��~��HZ�)�dб�y�|gm���m�� ��gQ��%�
���&���H	�g�F�,�_��-�)	�X&A�j{ϓ�����C�^פ�mɸ�F�d=g�UE���u��S��}�cTK�Vd��r�d��zC�;iw�2 ��̀i�cA+ݮ�j�9lO��o�k��Ȼ����_[<�*qh"���]e��Y�z��[�>�G��:�_��*�d3��Z2���k�Q[�=%L0�v8Jj��+v�yw٬⥡\����;��@�/�c��r��Wq]�������'Ь�7�U�f�'�����t���ˣj�]/���C/O�9]/���q�<����s�|�����S�N�gn�:u��-zJ�O\���	���}�Ȥ��Mw�	����GõZx�Җ�Q�������:%PY#u�ĀA�̉���z��KL�ĄKL��ā�	�s�	��p�	��x�3��_�LH��� ޵y���u��ioԛ��~�ڛ]M�w����,�w�����)�徂�AE�s��R!{6wP��N��ۮ�n�Y��v�B��];��>�\�]=��(������q�.3�#�ѽ_�~�Lz��Z7��2��L�L<a��<�c�]�^��k��U����<�	��ޭg���y��Bq�s|<��z��C3��w������w*�aK����ln�m������]mi�=��޳#Q�q����*������)W"�~�!m���UZ��~�ݘ4��uV��z���^g�:��Y���=���g}���5�	ȳ�z���/���p$�OQ��uV�,��L���,��Xo�I��n���B��(���Cd����C�|�>�b�)���_'-���B�7�+�vT�YeQ��k4�x�D��O]����k�B��3W��*�\����sz�B�U��z*�t�{?�T���xN�t\Ma#ފ�)t5�������5�]��������ˮ��ˮ��ˮ��ˮ��ˮ�쪫�tހ��7��8o�y��Ez���X�;Q�����B+^?폸�p�15��������{��`�ݾ�4�v[�W��c
��I;<�g9^��d���*@�C|�C��k�vF# W��!�wMJsG��y��kyK��%Â^k���H������8�"�������\��Ů��I���+�Pl� ��]I��w���x�L��Y��D��D)���"�l%�)&��m��v�Xm�iwp�\{��t�ښ�^v����T�UZ��:�{{ A�^����R�t/��O�vv�ŵ�K����T��Y���VZ�w9��~g P'�
���Kw&Ztͦ[�7���<:���ۮ�N�:q��[.�W2�`q+��E���`��O{�n�F�VHAy�;�M�J��v�-5k�5�A�+�����N����UɄ��� �_�;��O�,�����-Q{��%K�ĭ5�qGٱ�w� ui����t�[�z� w���'�h��^��t2�yP�� �t:��_d��S��m�G���h��\$B�!�i��B՗I�F����<P�����sW�k�w�����5��������y\�����Ս�]�%Cy0��N����Cٮ���z�-���i�7���[�خ�ﺐ��4;j��C[��:�����1�g0�����3�C�H�M���@���g P>���[����3��3�<�n���16��SQ��Ȯ��(,-���HEj��� ����-Zě |����m���g��p`A�_z^A�Q�F�@��X$��"#�����(d#|�59ˮ�[��IVl�.1K�$*�pS��    k`�Vo�H�d2`��: Kb|��Jt?�7�1YrY�d��b;D�kPkl�_KJ��{�����EG����x��x��f�`ۃ�v��ٮ���/��*�1���3��w�7��=��=�͞��{FE֮%�dD�7��I������1s����a�_q�`\/������{�d�33z��{�yo`�ڼWf������=����^P�}�&[���
ٟ�tF�����e��9�K�,�M����*�~9�<�\����x0�NX,�X* ��&���+���M���F��d����j"������fT)��GK��%��/+#�A�Z~D� �o�]�Q��7���4 �� �uQB��i
k�%�̏oC9����ҷ��9:��5;��n��-p?�?K�q7�4�+�Ĕ��ł���U���������M��0H�X����`u��=A7��|�s�3�����%,�S���bʳL��d�|ע�{� 5Kg����`%��C
R.���)�dE1���I�o�~�
�m��oR���IA||�P���!~l��c�|2�\E~ʍ����|���Z�OH�YɃ
)"� ������=��7����d4� 39��Q�����A�[�uFF��%��EE�S6ߦPK�<�w�J"��t��A�<O'��I�!�|�,*m���}}��!��0��.�=`˛!eqIwRJ�NC���.�F�m��a�v
C��"�k�����Y��L�9���Q�� ��S�ѿhE�04��ښ�˫pg|f�'��_�v��"�?^�Nd��:^QZ<�����0-R�mp�S d�CF�SX���0�a�/s5:��cD?Y,-������?��J���o�0ᒣH�����%�ּW�����S�h�nަ!���"bۨv��T�,*��1��ꤙ#���G���cd�@�i�Q��5�%
]��cA@��"��Kd���dن����%~��#�*��_)6 ;,��1���

�ȕ3�_��E�}Vq_)vO�?��H�W�J�]��0FΓ<����<%��5١&v>n}�����o�_Mˈ)=��Z��s͇)+E���3;!'!nX�*
z�A&�̵zՈ
޳������J�7ʷ���?{���A���N����Qs�ٳ$�I�"/#�}�@b.l1|�x�Ú36��FȖ��6|�2F	�TR��ͤ�Y٧�ϊ04��z+�fS�l���dPK0;+�8��¡2�GŷI��d$ב�;r�v잎TD�'M3gF�'�Ы�?�G� [#2\�TA{i�2�3�*�-N��aFG=�h5دz/G'N�x�H�i�u��#fU1�9BU��Q�[�Q\P����E��RJs���jU^@}q��B�����JEY�%�D����?_0�_�[��S\]H�
�7���ri`�j?m�lE�%���R%.$�ǩ�[�â0/�k�<Rw톾���f>�3|Z��ӭs�:�$�`�sM������i� ��Y�x
�D�mK�Rkδ�@ul�N���Tu�z[�[�zW�%2�`�E�Wh����!/�iP�l�V��.��� ��Q�5������+p!��Ò?Xn޾���s�7�I�!��x���I�C������7oQ��stȍ9iyC@2X��Ve���0�S��z
F�T�+TB2�6�����G��%ƎV@~� |�D�*���Lحh)��/�&Rў���m)6Ӵd����h��^��u@Kn�r1�,���Tz�ġ"r�����J7���{�H�:��	�db�R�y�H"s�7ʶ����5r*.��Rxo������hR��o	�*��/{��t4�%���ᑤ)~z2��'����1�����>=��ոZ������5RoBX.R�"�.R�nG�Y��ss��)�8��Q�|�[�Za�z�2�E�N����Q]���g)rj���6��dn�Z"mKY�&Ю����'�J���E����-�%�E��6�U�*�Z���1�N�焛��D\H؉�����#��)	�%�,f�j�ͷ�bD�W��g�i�&��)��,�3-r<�DC����X�_'X����a�\�R��%���j@���\*	
������A��D�W��5p�!����Ԙ�1����[t
5<�E/:�_aCy�nÃ2]���K���=������TH����oh�y 6�T�E�oc�Z�{��ĵج`�����,�2�J��m��9�Ȟ����#��&�������'��As�"D�9g���\S�I]��$nK�ӡVS\�=���檙,3�$a����L��l2�Ġ9`1�IK����'͞��U��L�듵��,��G3ITd>�K�y0gS�_�W����|Ē�/�!a�I9رe�""��d�U &6?�JB|�$D�:�5��t`�����HPF��FF��r[B���_�Q�K�~F��o'���=Eˁ��\Y9�t �}$	(k�ur)�$ �D�%((/b!�A������\M���1�ͷI��g,��M9$%�gTi���#ٖ<G--�
a�7��?�_pn0a��jy᳼|K^0���PŋE��3�!f(0x���:�:�:�Ȉm��
��A�G"c��˳�%�2��
v
���0�%��au#9� a��b���@��rR˭�h�!����,�R�)d�0��#�"���!c�,F�ry���V��>�q�dY�$��%	0��7o�:fM���!� �a{<���O32��v�7T:�{�LU~�����F��ʠ�#sRmdx2)��辽�b����U��ۖg�YZ('O��A���y*R�r��*�v�/!5D�����A[�M<)��0f�5ܔ�[�8l�fh�ߕ*�Y�'�m�b�?�p<���Վ6�������:?,"Cm�T�;�T�Vt~3ڭδc-/���ب���o~�&gf��$�ְ��Y�!���ה1�g�o�9��RBA��Ea-P��!
�����0e����|��������ʁJUup���X	�9&q��Ucz)#ql�PB���\&B�󛯱ʦU�WrS5�P�'.�cD6Eht���$a�>B&/O�6o1�X̠�1�0]%�%������Ͻ6���8l&��#�V�������BL��#�#����*|95395Q,�*�)'LQ�qm,B��7�_�P��g�����y#�}r�ڣ��:����Pm��8C.g'VJ�h���ƻ?Ob������N�C�Tc�f��I��g�EPs�r����e
db��koTHg�����~C��$���X�ɜ&�K�4��8}�}��D�a
<�4%���Y�I�OZ;�#+�(b�JN��W�j֬1�=�����Ic�?lw��A����2FxR�����_���t��T#��m��e���p4�3���y����찲����A���)�s̆<|݊f�r��z�SYoU*�j
x�2�݊Ѐ��6�7�I��������8�	�L�k�;5���f׀����A{0�;���zN�^5rF�+�� gt��gaz�Y�ڱ�es��f�M�!@VO����������Q|�=�o������3���>� �Q����!�л6�t����B�:���C��[v�_�P`�Bw���JU�Iy��V�(���;��\���C�,Z��_�3.ݳv�ݚ��[����bUcڐ(��CQQ�f)�2� ��������W�����`ko��?c�J&k|Ff�fM���¯f�W~��iQ\%��TD�Hn�4& �_����&���Boط|��J�*	`��[#����̐oK"I��0����,�hX�^���;�������֯��L>JV,r�X���x9H.jbU���>d�.�:��pK��r4���2�F�:Gö������9�*��N��L��	�����w�oБ��&aW�6(V�w�3`�-��8��v>�0�h�fq�*R��R�����%jK�rq^UJ�L�R�d&�P��\òj(�d�"8�~΃���Dg�    ߄��{n��&=��=	޲x�~z��3^U��jDd<��>~�����]���w}������>~�����]���w}��������}�Fn��W��MUa�а=�N������eju���m�7�rߨ3�k @�9M޸ ��: \�� p ����������+;���� �/;�����	�����
?w�_�W���
?w�����]�g�6�
?w�����]���sW��+��~�
?����v4�M��_᷵C�z�ǫ��F�Ӻ~�ݽ�G~���z�����W�~������B}-a�ͅzS��R��j�΃�����<��|�yXd�Ӡ�z�,)�G�u�]Uy�F>��kИ�,W�&T4p���]b:E�NVwt�m���W�����ޅ�'���#�Τ3��аd�ؾ
�.m=�hA����V�����K���_�����=��r%���~�����<Ku_�u��R�d���?)���	x3�����7�|bɻ��/>y�T�.0�wH%R
|��%P¿����`l�b��ѝY��Y�>V����0 ����ݤ��z�����z�3j�EF�{�x�ç_^�U�g�Ǉ{�����w�"�s����>�@�P��l��?d��J�ה�A[m��]2��,�H�3,�嚖�2�8��t�.#[j��R�ʗ���5i���e��	7�� �<hⅲ���֔[�pp��d8S;\3)M�=-�-*L,�Z&�Q�XB1����,�
/�M)�b�B�t�	�Vo�, &y��DU5\A@Q���H/��.� ��O�D���E��>PDQ둲�wmd�\�W�h��+�ܹ<*웆%�'(�e ����vAP�fk�A�S�Y*[bHL[:x\ք��k��L�.�?�����}M�Wm���H��1���QoL&�Ͳ;���_ed�_��n6��p-yu����-f;�ݮP$^��Љ�Q_hP֏�W(x7oAP�jOZ�!����cp@&ĶHB��b�3q��#,��w�+L�[e�ű)a����T�r���&�=џ�*��LtrF90Ԅ�Ɍ�y���\�E�[ W�e8���˨P�������|���>הUL3�cf��|��!��6���d0�A: �e�!ӕw�K6����j��rHa*F7��~�N��B�����q�qG�����U��W�\{�������ނ��Q�̒�����;^3u�8�O;�*�5KoWK��&��.�,g@l���$EE�4+>���U����ͫ��.����b���jh����M�CL]	UR̼tB[�S��=(G���
�bY+�%�4���4�⼂�/�q��`Q���k\&�T؄B��U i�bcŁx�����%-uqF���ˋo�v�zI$O�I�q��6^�C>Y�nK1�Z�?�����$��=ʘ9	L=~1\I�b�0����;�6�j����˕7�%�CoPU�����q�Ńi�R5��*��U�Ҭ�t�{"M8x���D������p!�2��p��3�:f�j�
�}�ʩ�RS`Z�@R"����1"	㒎�1[�۩�U�ꤠ�񬪖���[��7'4���T��nhnf�i�k��çb��눊&A�����ISsKK���d�D�w�eFʞD�J��-�݇*E�"O�U--2����\�)�+U�>���i!��)�|�}{�w����,@:J?�t��{�1x^�%vbI��TYR�l����ӹ@'➯��~D�Ώ"0:��]��ʖ7?D�p����1�L�T(���#B�MvjL��!�ơ������t*�̄�4��g	uVv6�	s��r����䠓�*ǎwߢ6���V�% �5��d��RA�v�*Z11NJ�tFYb\K>g��3�F�}k�e:`u0>������wa,�<�.� p�r_���N�r�Z��,�CE�*�2�wq#;L:��i��V��69!d�~j�[[fX�ƒ����\U�6�����h+`�Q�YD��w��`��_�Zh�a�Z�L�;p�ۈ�i�h���A�^�v?-W�ߣ�JC�(��$�/Q�+��4�*x2�xD�I�?�V��|�<B=�B��l�b�?�
4�?�k<i��Q-��,� E!�S��\�Ɂ��:��"iː�s�����(O	���AG�61c�ȼ��u�6r(V���-r?~c���ng!"�>ي{���nDd?jcR0����x���*aԀ{�(���'$ز��Q�W% Nm�߁♒S��[hX8�B��s�]�d{��!��{UZb��V�s؃[d�{AF�����Wv�U��#*�1�긲a��Nr��wZ��er��#�0k�9�o�Al�n4­OD�ˠ,�T1���ٍ��v�֪*`)�b1z�u�8
]2D�	�(VM%�K��]B)��&�dE$lVĖNp�X�g]^�e�� �X���1"w�K�cYl�-�BY�m��"jq�LW�v.sL`ґ�沶��kA��$�O�v�M��Ň`�)L�LI���L��(ta�@nl�"���d�&�<$�~JK�.3/˕QG���{V�Iye3z�r����8��sB<�.� �7P\��p�x3��"��#�'H��V1f��d��^�G2?��T�M�^�s�]�I��=�f�)k,5m�R�5W��>�5U�Up���ֵDޡg߲���3|-�v�58�Qd�&d�s����v�h��0wKI�Mͭ�Hi<�f�����:b",��T��h�V�썡2R�C�Q�\����V@�����0��D|!���J��`	kKZ8����j�!�cs"H���z�4��J ʹ�t
F�RP\���	�R��,Ȋ������P-u���4t��U�9�?�\��(�+�8>���+�*z�E�hQ]dl��b8{�#b@��V)��p���r�/�8�� 2��IbPP�ܣb)���+ �*Dg`N"&k���a��I���v�c�pJ�k��nn:,a�c$OI8�%�&�9�(�}�D$)��7�S��h�_KήRWqB��\�F��<��[췲׋4c.h
&������E��B�M�"YtdY��N"r(iE�ˎ�0�W,XdH�"|�lc.��Oy30�+��̧�O>4��V
en���5@s��Ƈ�{�
Ȧ��DFh:yU�h�:�	����t_[@����@t���7 
O�|ȁ�99�%����R�=)ֶU�_�'���$GYj��P�-#a}���h+Z��?�-&?%q�ʓ��?�L����SBO��ݑ[���n)�*��Ua ?���L�����\J�2D�Jpn���W� @��5ֆ+�	{��b���I"�\�vLn
BA.�U��T�EN�w��C��1e��Y�iW�㫢��"]EY�T��=��f�#��b{��k�����ʳwP�}n��Ð��B�@�B9�I���A�$����:?P�������A��q�0`&�FVa"�M��sDfUz�w��th��ҽj�;c��
�O:c:ޮ��J�8�Xh��Z��P�Z�>��=⻰��#Q���Rʖe�RZ�m�bW}�2�Q
��4�J�q-/g=�1��2��Y�/��c�@�ut]\�Pxb��P,s˲VUK��@��rUny3��L�v7CU���*&�Ɵ�X�.S-�'�e*�/�Ǭ�Thh��ݹqhF��m���؊��%�Q������$���p�|X� a�_E��	�Lb�ƋUFGWD}p>si���[m�.d*���[5qF5+6@8Ķ*,A��;�¹��u3� �� m���7y9�l�`�e�.���`��9�i(yMN��������س|7EQN�Qy�P�MG�ŵ�#3����c�ƿ�,�/���o��0�7�J���V[Vm��I�4SU��u��h��d�9c�p��֏�E���{ ��w�G�B�%���p&����̹r�<j�иQ#lh�|�-���X�?%��o,�X�o&>E�R]�a���ޮ"�kv���� �2�Hh=��l�)$Τ��؛�򩍶�� U>��Ve    ��"r��Pj�
���=�kLHS^$�"ap��d?�k�H�S�y�윂�"�Eɢ,����D-C��f��~z�� �"!i_�)��A���	CK�̤��$��}���JGb�-�5,mV�&Vs�~X���5+l�R9��~���ZL�فF��G|#�L�2�)t7���IG�6�[��v�� �[3{f�Ϟ�~(������z/_#]���:ڲ�v�IR2D���3tf�w�|FsNR/,�b�_)@4ݜZY���M6�w(�yW	��
��"a�7n�x�(`�0�-�#�L8�}��s���M��� bn�pxe�@�3W�v�]�4��*��**r����؂�5�ܑ&1ʳ�yh���W
IP�$�Z��X#����`x�ǿ�?�s?���}@ڡ���Q:W���aU�5l��5�����x���8X��<s#�R�a�5��T'�Ŕ�k�$�����c��e*��J�[uU�,��JdM`���R��g�m��ڶVDyjN-ے*��6� �K�HmP�WrB�i��+����?K.H����$5�^R8�@>�C�Ք�2�7;�<��㶇"h2ơ%ogeaE �$�G@֞Ԣ�pՋ%�X�b%߅Bv,�bFf-&ԭ�ɒ¨������B��U(@/�a��K�g����>�N'=I��晁w���j<�x�8I[^)s�������IU�Xq-��
��5���|7o1���O(�%*�n�T�R���;,`���%vdصsǅ����r�hB��wT�U���D�L���l��C֚�)���uj�;�L����,�}���U)�Rl�R©�����qx����rTö�.�����\J�1�F�{j�,ܾ̔֬l�]�T/U�cLw��+�+*���OQ!�P:2-��f�g�R�Qt�s�4�%gcJP�D^*�#�&�V�:��O�A��+�':@o?�H?]�����#e?� �<G�7��7]�lڒr���(�����)�lM�wHY0�2+�l�g5�Y����7�^�c�{��[�d�ݥ�k�A�%���ǭ2�m���KT,_����F�-CJWc)x��ܺZ��@�����lN^X��=�KN'T�*�z�fyl[�6�@���@v�)�d�_�������׋/=�)�xk(b-��0�R|�m���LηO�d�k�,��Uq<�;6�����L�t za�ϥ-�ߠ�R(1�LJ�j8C�%
+%䳲��v�M%��З���
֡��Ve_�&xaKjS�9�klC�s���,s��
~��X1]�6 �⊾*�e���aH{-�'R«����A[e��
�J�uW��]3�����s��<��H5�%���T��Ӏ__K�^"�O��VZM�1��Kp��K�š55�������v�Em�K��{����d�����:c�>6���!K�Z�=a��� ��E�Jɇ���t�
�7D�i�#'L�7#U�m���+�%Ml��ЄQ���^j���t�m~XU*��w2܂�a�_E�1N���E�#�$���jc�Q.{bUz&��-�Jv���y�:@�YrKr~hkm�Hd�e�K���K��H�=i�4"�	��J�TXGS�QQ�3�Z��%�,�R`�K`m]�2)Y��RT�TV͇��*��H��)��R-��f�2S84�b�%���BT�D�	��6Z�2_����'�d�V@��<A�6ʹ���PWA]��<S���3��g�yg���V�uv�4v��t�����N9�D�ĬШ��-��%�=����=Sv~���߽��a(��>9��&�vNkb�UT�f�R"}͇���Ą����ǩ/��y9�&˱JL����8�x���,n�N.�]f�g�إ��XGn�}y�'pt\��A|�1et|������Fs&��ʚ	R��byf'�./�IV[n�m��|ɨKI2���>Y�^�Z�e�Å�T�U_�
O*BP9jl~*�o�(�/�)=(�-N��b�r>#�B��%�ZP��|6�#j�sRҔ[B�~g4FlCK��
)x�bK�=�'�Ȋ���M3�F�n��g�A��j�k�v�qɲ��gk��>޲*��٪~(��>
,��J��Tj
>5���GG���92�1Fu�j�2Q`�q6��t�_�κ�_-{�;�H����m-X��|�"Z�
u-J�zE�t�m���4.Re3j��V�^B�Hn�?��H���� �1�I�s7z�+¶�k�d\a��w�@,��K�^���3���Ә(B�L]�����U���)oXq���g���+�;��Ddr��X��m���q�WX�(��(|�����,�]
b�8Sˡ�A���)�c0u��n^���@�s��NUJe@��:�
�X��3��rզ�i��;H�Z��������
YBE=���Ͼ�OI�����&Q�SyX	˷�Ȣ���J\[L�|b;{�������{v�}�ߐ)"\��T$�,L_���tgF)� aG�Q�U�Z�O���=w�6��&�*(G�D,�A���+�T�鍊�m�1*%῭\���N�\�jWyKM���M�s�M!A��$��SWsU��H�+��}j]�)��?��l�H�����I=~Z�#�܃�Yt���h(�0M�:����,�ׅ*Z���"�f16e��D��_��22����o�ތ��f��]0~_ϱP�����_m�D��֦a�1��yʹZ5�t���\���w�}�
����x���'�0�����y�OOۃ���=�tgx9�;�^�3a�=AI; �O���?M���sG�/bo/�ڞq*��p\F`��z�q��|[����C���ݶ��'1~��n8�p�}�n�Σ�p�
�7��{ Eh_�=�;ds�D~�!���c����Wոp8�Y��p�s����8@���q�P��8��q8�Y����Sz0�ܞm��q�5ǫ`�����!�h�3���g��I��n��<By��/@��#����k�v��πb�r�@v8r%��	R���1���|�x8�9���X�'��)�i|<:gg���q����%��ws�C�%�`�d'΅���80�}Df
GngO,Ԇ��H��m�5�� ��G~�0��cw>�\����ףQ�H��	���(��#UQ�wؙ���!�8r��)4�'nW��}b�6���O������0��>'f>Ɵ8�����"�E��k[�B 4��&A %��8�T��d��8�m<�S����
x��;rstAk��R��
cp���$��i�A��;k��Gş#���
�B�ơ@��{z��X ���0z� lCy�4�!�8��!�f�\���I���U���̊��%)�<:b1Oq(@⡻x&�D�77�H$>
A� ��Ȋ�7�HQ����Fl����u(�Q�}G>�񠯙l ��г�l��;��r����!�p�U�d �xиE(H�F�d������òEd
/�@#�7����vo;R̆����G*��x�w��<<t��l ]��n
`�*�hcҊY�f��k΀4�(�4�$�E�x�� 8
r�Xg+��φL����w ����[y�P�\j���?¥�T5r�
ǹ��8ԥ���F�T�F/�6Ȏ7�y)Q���=*q&qq�R�0(&[���TJ��yB���#owX�5-��p���6��nk�(��6�*�y�M�5����8j�Co�hS��s8G�r9��It���ZO��$��N�{�i[/�A��b˳�w��g���r�����S��4�g!}^�l�SO
��O)R��>OP��`��D� <�S��Ӡ\��l���gDE�4x����;@�hQ��"z�(�~ �j�ͻ#��TGl���:U�'��`΂F�����^/`��VTQI�V҆����l�Tdۙ�L�S�,��$
ψg*�AHӓÂ�?6�@Ae?�q T;��$j���!8Tu���;"*�E=��4p�ԓ��N�f��8�5��P�P8�����e��@�S;/��    ٮéٓ�0X%U�<+��X�,>�)��ZC���[��<~���;��.n�U���2���ztn��745�&�r��WKa�3��*S�q�X:�?�+��vj.V˃�#���oL���gÓ��mRV�Qè�$�,+r�ز$�^v#�;+)���g%��4��2�ǟ���A{B4Q��p�ȎS�F=�-y�J��=
і	 ��'��L�̫
� �݁x�ґ͂���½��;q���N�;�Х���(����Ҷ�	I��<��{X<� ��S�v�G����Mܮ	�* �b	�,޽�Y<{L�&`zO8oʷ�Z=�I�q��a����k�PN�60���L�~�#�~>�`��ڇ�7DR�,c7!��nz`ᘉ���X|�`X{�c3C�a���N�au�F &I�����W�8�|&|b���	�����hY��ť/�0���0n$����Ũ��S�.hd��g@G��]� ɥR��0�U�Y�0ɪ���Hɇ^WiK��"`�280c,���,̲(FZޚϿ�s�����Y��0\�,+}!�0��� �UP��
�h�kP�
MXN�� �k�s�Z��p��O�;�p�-�M�N�U
�&���~@��Є���@ު�=P�ۃ&���M 
�M���*@Ợ	�8�%@Ợ	[�m@��ф���P�D4a*׬>MX���Z@�;�	[��nM�T�n!j�MX*e���&l��#�0�[	(�<��:�w ���{7@�h�4��
ﰫ�4�(�MX�-(|�0��(@�Є�(| ��"HӀ��� 
oU�Uvw@�
4a��7(l�	��f �-4a�p��Ü� ��Є�Ro
PX�	�+���Є��4(��ܦ�M��
�&L�y���h�:@{8��Ah��8P��h¤F���AV��U7�&�jP��͡	���jE+~g4aY ��CfI
;4���Cvh�Mء	;4a�&�Є��C6_sh�Mء	;4a�&�Є��Cvh�Mء	;4a�&�Є��Cvh�X/Mء	;4a�&�Є����rhPɡ	;4a�&�Є��Cvh�M�:	�Є��Cvh�M8ph�Mء	;4a�&�Є��Cvh�Mء	��84a�&�Є��Cvh�M�'A�Ws�E�/��%B�:��E��x��eor���NgЁ���T~d�۝q�י&C|�F��{ �����@�p��_�u��aa�:xo�/>�������<�������{/>{�?Ի���n�;���ۃ�p��wqq�ES����_`��O���H�C���$Q��5�W������F�=�y,I߼���?��z�[���c�e6h+Y��~�.��[>o�W����i��$*���b����Pê+�R�4���jM�J�P�a�yJ#���r�B�	�8���f�$�x�eLjRʩ�l"���v����[`�؏�`JUE�MO�ŗ�Sݞa`8@�C���L����<e�j��WT�P^aαF�	)&抂�Nh�`��t�W���a�&���s`*�7sM~�j.F�[Z}iNv���
u<2t1Y�ۀ�v6=Ե�	,d�l�^v[ki0�2u.&�#,d��Q��is�����b���W�"�h��^�C����������E�|�YJ��D�_|x/-9�{�����_�^�,�u�(�Jr���,�T˲�]d����i����`�-�u��	���R���S�<'����W�|dV/؂�qkOm�D1�q ��
�W�,�>A���
�@�feՔ�X�Ho6o�µ�S�|	���q�f�a.��X��rw��G?�W-�>��n��I�a��/��8mJ�g�{�)�"�@�,��r�5@�5S<E~����L��!b��k�Π[��>�"ҏ��pA��3+1J˒�F6F���Sf�K�:�Ԉ�����_�$\TE���.U.J�u�J����� 5��p;���H��:ޜژ��`W� 5�+��䍖�9 &�=�C�ϔ �J����"��jzanPED4�\n�J�ئ��m��X��ڦ�1�Df��ou��B��(՚��|/�F��k*�
�*��������y����ѯ��)U5/C���'���@��8� 8���Pq���ҟ�B�i��n�m�*���l~W��#U0df���/)�B:�R��Ǜ��-j�L�u�ٻa���zۜ��Lm���m��z X�5x^<�7��oWo���6PD�3V��P��;(`i��-��X٫.�O7k�E눎�9�����#�h�?�CsT��z�V�U���[.����L��1j,��3��0j�
�ˌ��#Y�3��}�}Fu~�|�����߿�彏F�����}x�x�M���#Rz@K�'/~��(��Ŧ�F�`��q�Y�_ּSv���!;�����C ��t��<���ո�u6W�~�N'� ���*�W{�+��ҙQg�:5Z��CF�<�}�?�0F��{2�I�z�/���ax�z�5�����vh0jw� �z�7mɭ^MH���+������v%�5���%������UB���y����7�$�s��<J�R��<��,�n�|it m�1�U|����m��(
	��X;�u�V��'��]�4��,�%�'�9� F]�nX�"ݰT��+i��B��N�v�I.H7"�4�(�倫~A+g�a�!q��a��%�@z���ߒD��}���)o����&-���=ch'�Y,f
7/�4�bW|��C�����d�d`<^E�\;2�"7��q��0���"��pS,���f�1���5��-�V�[�Z�Ա֙�PO��RA#����;�S��c]^PA�v��O�=�p�G�ԇ�z@�``?�a���#6��v�Ĺ 6Y�����L����4��0OKZ	dTP�3}�Y����$�S�W�l΢@9p���W�-@�յyT��,V�Ld�#��(Li��Qƻ�Ǝ��4�Nd���W���Sއ�`d��T���+�8|�Ҡr���r
+y����]�Lk-����U^�V�
Xa�ԒD^�����X��i�_�p���%�ּW�|�n`��� �Sm�#jt)�h��M7�d�gu������S�t�K����|8�8e-���PBś��H�X�Q]�� ������ת��l��!?��TA����b�
�tn�U�W��+�0cN�4�Ǉ�;�o���b#��Dĭ�E��0T��%I� �~�ә^�=���m��i1��Y�.m�>L���C����(��
 "����V��@"�JA�_� ��g�<�=���3=I��s���gO�}����D��p�ki�Qs��֒��T &Hx�#��[���x�S�(��-��1Wַ�E2�T��{^��1MX���e#�$�8���g3����7�ś��V��P(0G�c7+s; ԴnP"��(��ĿU/w@⤥����V��>�G�`���@p�S����P�ԫ<��\``��9�a�I��Qْ�d�d����`��J̋���Q��PОF7��?	���jT�W��C���/��]R�Q�
e�E�DRɅ�?_0�c`�d*�8��-U���V�����j?m�0�[T�5��K)r�ʮ�NQ�g�&ˣ�[��_�A�|�B��OK�Qs�uθ�� �����X*ݯ8��� ��������ۖ2�օ�%,���7.ĸ�Ӗ�T��F�悫����}�V�C��h���Bz⾨�+*)K��[,�G�j�꣉�[bͲj(k!��Ɔ��F���;�$l`i"���s��r ��-��Q�'�e�J3sm�y�q�rcNZސ�\6�o�P<"0]���[P0:����2[5JB�Hx�Q���z4k�4�ϒ�\����N�2p��0Rv�_<5L��=cME�Rl�i�x��]���u�[��*�B���Ɣ�$��u�/K���.EX�|T�sBu��v1���O�B7���M�ywH�<�v����^���IwZ    �#�ذ��;hw��h�a;�\�f>=<AeoMG((]p� Շ���K��v�O)���L�g�ε���e�}�V;S�C�����O3��S���4�]!��6�:���?C$E�R�L���O���C*�l/�]T������sht�y�1UIs�0�L�\�]�w�`���*^s
��/�s7ڡ�)<,�S�#���R��h.0��3g�1�%<�Z���)h�3��N��8ў�6�������6p�J��[tI�0�"'�(�7�:�V��7�RT;CĊϚZ�4��s�r�O���V�=R�t��\5�Z�c^8�qa���)���SE�N:r�D#���q4��Bi���h��?���0U�h�k�~�p��8Gĭh��X�	�?���D㶾�E�.�uθ�ζ��)�U�C��Z{�Z�����V�Ƹ��O�ڵ��k�>�.���ĵv1�Oת�F�rq-��eĵvɉ�,�Uk�����k��Z;�i�q�����Z.���Z?c\kws��N�u�uV-X�ߗ�iu�q�=t,�����:xTu��;��[^E��b�C��g� �Z�������]�!/|��G|x�nc_���^�E��ۜ���.�{�{^�=�9]EBX�滹#�}�ɗ�rS]���'�ƛ~_���h���WU}>-��S�Ц[���C��;�[sj;Q�Wᯓ+�&m{_��_���|�����>�&��K�~�����;��!X ��F���$��%��\�s4i����CBb����Ҿ'�Ћ�Af�����A�.�=��+�`�y������p����Gڳq.^��{F��ZlV��R��<K�n	E���m���.֝���ق<�9���u��R�h�^L".�ݽN�f`B(�rd��� %8���t�a�W��A���T9�e`�@���\�=c�>��7a`&�Aa��r����(p�U.����dm�T��HO<^�=���l����{��(z�"}�"�*f>bɂ�������^رe�~��&k��4��+	����%���[D�ED�2�o52"̖��, ���}����DI?#�~x�%x*��k0]�"�_�rV9���lQ�G����	�	� Q�!��� ���D����wΏ��H��.n`A��� )�	�{d
�r�I[�CR�Jp@e�F��q?�mi�s��¯z�8B����n-/|��o��W��lV�5��E�
�i��C�q��:�Ȉm��
�Q	Hb���?/�ږAƓnHm���|Y¸�2�#��&�Sa!��P����+'�ܚ�!�$|��"�R�)d�0��#�"���!���1��Ҷ$F�ЧٶM�I�xx�	0��7o�:f����;�`���i�^���n��7�ЇA{�Ѩיv�{��?���:��,?�1�0fƌ�ǘ�!���a��F�Ө=z�)˧n�|�
�b���vK�j`�-�M�H�o/�3��R������F��;9z�jb+��0X����Ae#����2��Vc����ػ�7R��j?5��/�d�f�Fgp����B��Er�1�=s�)(?��Z�8	�[�R=��גw����R�8�8/&��?K���6� ��@f2�����E�w�ӽ�Qy'��J�m"1�s��<��zO���.��>�b��A{�oP�/���ӟLz��YV�zU��#�G��B��Ǐ�p��"�L��dTi��;M9�
����gD���s
�)�wD�i�ۤN��io0�V�_�����B��П�8���@��h�ˉ�7����R����9�k�8��gIQ_�ԅ����N�64����+F�?-�Jϭ�����>��y�#U}{��k*F��vG�I������x�ò��.�?�8�t�مיt��y��ʦ���K�zؤ��{�����j��Po|������3��X��ci���+�?x|ѣ��/
w�~Q�C����F�t�w�	�/�x3�̻��/>y�䁹�].�WD�m�-�TS������쫏�R-�3,W�k�n��U�i�	������������s���D:�T�\8�n�Y1�Be����j�n\�r~�m���K�b�%2䛑�RZG�ׯA��򖺬<�4f�
�*
�W��7ߚ��T*�1R�AY4�o�0������}��%���
	H�u���^ ��g�Uxan�P���&�r;u�b��6n�"	�UU�up�d�{?��C8؋�ź�]�Rev��z:��W*,#u���Tg�NQ���o݆1P��o|�o�3U�z����ߋ����n��Y���W�&���A0��5�Rg-+3��AJ����Z��$=���3���L?��>�K7��Vc!�~�v�:��~ɞ���-"�Х፮�$annv�ع|�;0{T��\�pJ�:/C}��"8�K:0A��Z���l�m�i�9>���{4�~�����zn�l���_f�$�恥�눍���"*dOZ�#\���X:�[~2�*kPU�g�K����	�~|�I�mR�y[q箤�1�Xܕ�tK��ю�I.�r%Tu��5�ݥq�.�v�i��y4�uT'�ܐz�1yDqp�N`���J�q�]荏"�Ce��� 3Ot�pn��G�������i�
3��2B~�&c�d��ï}g��n�i�(Ri�@-ݶ�B�G/��&�u��0U|X�_�	�s��L� ���9��c�i�� �ށ=����9���I�B�Jl�Η��^Dg�t����1�sl�N�_:������FN.DH�w���K��	hRlY�3�ʟ@e����4i3i+�o�Y�J����Ր^�Z�Ĉ���17͍(�-�$nr��>��­�җ%E�f�i�M;�|����6Y#TQI�En�2�K�Yi;ۗ�s������3^�d�������@R�:'9wK�7ݑ[N�D.`�����������/"ay�6���
��W�����Ҫ��3����D ��M��oJR��R7uw9u	l]
�xe�(4�W��R�:��;Xm�.�^^���&�PSi'�v�7�=.Xz4��R���^���j�|$���	��Zy�c��	��B�A]�t�B#����Z��c��KR��Yqiz��d�Y+5��jF �Ђ��B�`��'���S�l��&�\S})���l�uX�aj�M;ى�\�R��c�=,��!o�V��ABT	���Nck6�ĭ4�Ž-8�s�R�I�4(ے\����H�"OrЬ�ep�����&%b��qDҝ�Cn��Ԫ/;MF�"(u.?����(U�Rb��6<ƉMJZ�"Nl!M�qa-P����F;�8���Dl����5�#���(�Cm,[�JjE�����4cg	�\�PNle�Z,�d������R�=��7�v��T,C��Ez�&T�M�jr-�mNo��̓��Nʛ�tn�\46)�_��{�p�t,�;�̹��v'����.�=���]�(���RLXn���Qb5x�t �"|�X�/��KcU�
�wE��`���7X�˒�/��Y�VŔ��kH�a�Կh���P�M���$G?5そ�3,b4|F��}c�ھ��Ӌ���V2���YG�g��u8�������0@���Z���"���d��mzqnÈ�{�Y2��î%5��f��5_�N���a(#�NB�9u�h���	�ڷۭQ1��,PX����œuH5���u��D�y`*�W�,ޕW�^��~�Nt���zJx����b8��h�16�sn��~�P,#�F�ׅ�w���n�g�Mj�V�g�(>�܈�=~��R0����z�e��U%�p�*Ťp��#eV,���V� �i�9�*r�!X���8T1�3v��dtID��XE43�rP�J��Q��������ϫ:�|��`D�1�W�j�nĉm2��&L��B�����Ĝ�o�AT
p���eP�Co�t��D�g���^��2��6�f��Is��j����O��+���?e��Ɨ���+��	Q��ҩ1��k��(և%�p��]#��z��� ����ɇQ����m�    �"��lSg;��jґ3沱��������ԀO�v�}�����S�$����#6��夬t�5�x�qmk�@��8��O1v�����+��Z�q�X��B~���ч+ ��'4�b�B��e$�T���=�ƌ��m��	Ҫi Nz�b�Ὀ����	I�w�
�]�I�X���ᔊ����e	䈋+��>6�k��\M�u�w��\��6����dYͿ'B6�̙����o� �
i��6KY	si�D�tn�m����!���d$�eYݧR��Uc�rgo/#�>�P���e_X�Q����$$b�_@����ޢ2X·%�8����:�!�X6
�4�/�C��$w�]J*��Q�C�M"�P*�<��|�F��Y�����7�:�"�
k ���HE�vy��ߍc�Z׽򪶊�a�r��.�Vv�b8{䏑 bUJ��V��K L��kA�󋖇�@�62I
5,��1����m�30!��?���^d���`�v	�\:��W�ْW������Ȓ�IAc�<j�O���$u^~�ݳc�-gW�+�Ɨ ј�y��oe�=hX���)�`��K�n<�D3�S񂳎�� �ID�u�DQ�߅׎��h�X�L?\�X��S����1��,>4��6��-X�S��+�Ğ,��"�^nSaQ�sh�m�a��+�ҙX|��t�X@�����[�7����$�',6xQ��Xb��P�"�c�P��r�����Q��(�@M9� ���jX�47	�]vo,^~J�Lԓ��v�:��SBOX��ő[�EԔ0MT]ئ0�����b�q�w�J��OR�E9^+ ���;Dث���=]�!�'�<�r�۱�SP
,{Ƨ�vF� q�[�( I����`V`���j��J��\��p���z:E�G�����F;׉���1	Td3.�@��|�S"�T�����j6�� ����=HK���u ~�1O1�}	�|�T��$za�L$��a"�Mi�9"�*�����	M���k��3�B���m錙x�q~�c�cat\��|����0��Q��߅��%����X��Ϭ��^6?�1�Q	��4���p5D�M�1�z��q�OmI��1�����&:�..�<�y](ֹU]�h�x���k���2�����/���4~�Z�K���/�|T�c��44	��P�{���	�n�?� �
}���`	rQZ2	���\V ,��}��أ�bu��ѕ�"�>8�h��;�{m�.d����VK�Qg���f�WFK��pn��	��2t�H��;�af#���b �p�I+�����95���õ�c���tE9Q�CUD���M�شtD��`�W��Y�B0�o�{�����8�|���Z6��^Y�j���R��n}��P����p`LQ��R5Z�#Ea�d2����1��x�}�l*�1�����f���D9�ɉ(�o
F��%�)�\"�[�^G�_�Ӫ12bW���$_� �2�}��)
���M�������uRcE�13�PL�}��Rm��g��@/�&t|j{�qp���0h�YD��
V��Ш߀C��Ř�LyI�T�pp������4�tѵNH+��9�E���E�"���f"˖!�\��f?���8-.���}S��(�&�Q�9�K6)�C^����f�Z�Z�R,t`n�6k��Yg?��24��e	N��A�8�ZN���F��G|#�L�X/��������,��t�\�|`)a���#0o��Yx�<{��P�]	#k�,U���\�2�f�-^:\��!bI�Ѕ�3���E�9�9I����Yq�z�K�M3`G��;l�e����B��L���P������B0Ʉ#�tR�v,'h����7k@�d���%�]�7�́�֠Ce�7�O�-�^#�0�1P���C���KO)%A���B��𗈑�i�20>����<��?��#�JQF&Xv_�!�aU�6�&�!Z�-~�Gl0��YJ���gn�>�^.���M=a����L&Y������/S�6��r�����	J��J�����P}�Z2�n���Q:�%!�A�&�g xtmP�W9�ش`Օ\F��O�m�ăԢ�S
��q�6X�y�PLb�|s��PM������iҍ�5�l��{�E��!�dq��Bn,�bF�]l�[_�Ŕ¨��M�A���P�����5͟>��3o�3:y�')�\l�1x74e<�x�8I^%sb������I7V���]l�k�7�	��'�`�[�)��5UI��:%���0;hm���K�RBF���\9��l�A�*�].v"6��Ȑɛa+����)���8��Ξ[z*G|�3g�xU*S�&#񬜊_A�
�����6�p�������%�'�Ƭ�{ܩ��0Sr��]�� a��%�;��RE�T���_�5�)*%*Gf`�����:��{N�!�lL�:��� qd�$ߪO��6��	4	��~z��'��g!�[�.[��]���+(�	z�)o� ��iK��WRB*�
�l8�5!�pe�@ʜ��M����������z�`��Ë//��<�.��7�u�h:n�og]_!.=�X���āb��T͐2h,�bnέ�[��/ڀ� �&���*���tB�U!]/�a��o�m,�N�d���6�E�#/���{��������Wg��!��XK���Y�\e`3p�}2'�Urt
��x49 nls)��eH�o+����2��o�q)A3��'�H�D�M�y��z�ꅅ�áE�I�=I��Y���mʾ�M��M��?�a\k��X�%�昫�U�k�`���Ѝe)n�  -ۥ|��ל���=���^������fhg�K9���\K#hfG+��(Wڦ��w������٩Ak��^��%����b&q�����E%���+J�m�!�����9 ���d���F1b�0����q�e�SQ����� �ZĬ�|�;n�ԯw�)�#'L�7#�}[�h~JR[I��(4>T��/L��}� �5?Ԇ�޹��-8���5��q*L�^�&�MArɠ�V[[�rٓ�R����Zny�ds���:@X�rK
�"�ǚ���0���v�����<�Z�0�Ʃp��vu)ۙ�c��kJnk�����D����B^J�\o��,���P�:(�Z��fM��Ȍ�)�RL��"�і`;�*4�b"�Q]���w&��
*D�In�i���І���l��83��=õ:K�;�뭭�̭�(��l�-�u>b�Ch+���=�Y��<+�;
�h�-M�6`���o6��[C��d�i��	߄T��L�%A@5K�L�AOx{��&&�g��,Dz�jPM^ǁ�SQyq��F����](���"p/;5����(�m(��	�|��RL���`��A�w�9OA#f��5��X��	�ea���h9��o��KF] ��u�}�{!����Å���\}C'<�Ap$�u����颐��SzP"[�3`�j>#N)i��%�kA�g�Cl�ٖ��.��ڔKB�~'q"V�4�e�`���1+�Tna_�h���4M$x���0�<��,6(/<�ڥ!�"1�X����8��r׬J{�����߳�Y7�9�YLP�4DS�D�}-�#s��D{vj�p��DAx������U�κ���=�[t��N��,pj~@�HC]�[���C*�����EB6}?\]ao�^B���0�1�#�c���z���y�3�@�jW�"��$�K���Z����3���g�"�טV�N��i�w��,�a��&�%W�[�+��Ddr��~X@ٮ�Qk|Rh�
5@S����Tp�.�_����DF�*�����4Ez������f@��:/$�X��3�T����Os�� U�Z�/X��D+��]=�_�g�b������D�I���\�0%>2Df��Zq%oF��;s[��q#��~C��8p�t��'�Ԟ����g*�0J���1Gݠ�Kke!�>%1bw�6���    �#w"���+��*-9���Q<���$�W˕�h���U@�bWyKm���M��]�� U�� :��9�@�D&-�@X���+��?j',wIB��z�4�����?�`]��1�L���4k�b8�����Quu<�Ã��~�қ��e=�e���(6�Ȓ�.?a��k,c�?���KD�c�����:Ƅ�����PSJ��wU�����Iw�oM�b�ӿ�F������m{� ?�{xzx8�=�k���bE�7���=>�;@Z�ャ��!��	���n�M�[y��dk��E���u��hK�i�M�q�9���ww��%�V^5|�rj�e�U)ז|�9�o���!B6��1'����۱~�1f6i�W!g[�髓���p�mñ;�n��t�޶�����$m��������p\M-wG�&�=�I�K�J�Z����:�����^q#|q��ǎ)�Hiv�ǭv�&����]sǉ����>n�����9��)f9|D��r��}�rv��R��w`�[CE���mӾ��(�Ϋ}j��9�:���h��4m���&����x����YY��N�,v˅��#j
� �c�l#w��{�;֋+0�-[��x4��I�� �[�S���A6<:7[�a���	R<yC�xK��\�s#�y�tϚ'�Έ�V;�қ~s�z��_��3뉪� ���9��H���["0��}.fv��{8�&��k��[nX,�泆R��|��6��g(�t�A�,}j���:S�:a�{dEB�u���]o}�θ���Ç4��-y�Xɾ�P"O�܀-�.��ϑHV�M >cU
A}�����^�.���Wb�']J��k��Uޛ�M��$݅�p���B�wMZ��^缅ƞ�u᪻�!VC��&6�%���J�a89��1�!��C��l��иD���+�j/"�|7jĕ�f7���U�NW���>o\�6��	�E�U�zْ!��J�I�#꘧�����mj;U��B"��sPet�'�#�9����������%;!w\=����񾼏��cWԏz�7��H7�� I�n�RW�kH��n� %Iq2Ȼ:[Y(�1�H�6��$�F�;+嗾d�x�t3ܓ��7@?����(�tNB�6t�<����c*J$�6J�R�R.�Ur�s�J�AtKWɖ�&+����V�D�[T�V��NԴ�{"ȡ�)0����^�a2^�{.L�uM�i��sFL�jݓb�jS^��9�;�e�rl�2S!�`�$��^ęKӵ^6éIy���j��b��r��
���tS��5�f�l�7;��T�I�7;�ߤ�T��\�l���^��s�K�em�����rz�E�5���g�V���3�'Fס�\���b�������v�wO�OAGԈ>�h:UĠ�'�'��P��6A*��[��hE�*F�Ƶ!" h�`Ttۆ8F�S�-ͨ$
7�4*��C�ѵ�!l?6��'e?�s�R7��%Ki{�Q�:2�6�Uʹ���J� Ci*x�嬦͂����n�/ɩ6�sj���p٭^��t��ί����pZ�d-vTIUvO�J��)��{�O5��T�-����*�M1�:I�M���B�_U��S����̲z��L�oX*��4�Z�^y+�m6�ߪ�^��t���k)��!�����r]=��=�+gy7��J{�=٫���^I3l��U��X_I#��AZ�VR�]s�JЭkZX5�:g����E�F4�P��p��u.�v�Y��^L5{'�Yt@7�L9"�Lc�M���hp�j:�[:ZuS��5y���9��:rG䶄�\�o{�[ږq�2�s�4����Wb�]�Wd��,��Ϣ��u���D�[��/`�]*���k����͐�6X�k9	?.��kX�Y�Y�n){Kp��X{9�1�^��u���F���{g���wi����W��ܷ�nz�]�.���X}l���x����@W	�WY����z�:�&M��x��7�8��!�`��݋<x�7�hY�����7�R�蝳w[CrN�bְ΅������x�)b�=uq
�{�B�:&0V���9�W3�.��x0 ��*m/���� Y.�@����z6�M�g�ل{6�K�g�ل{6�M�g�ل{6��*�l�=�p�&ܳ	�l�=�p�&ܳ	�l�=�p�&ܳ	�l�=��~�g�ل{6�M�g��j�&ܳ	�l�]�	ˏ��j:�|���.ȇ��(�wH>��wI>̹;. �ɇ{��|�'��ɇ��{�➫��*{�➫��*{�➫��*{�➫��*{�➫�~�s�\�=Wq�Uܲ'=Wq�U�so��x�TN�+�S���=�qOm�S���+�=�qOm�S��A=�qOm�S��$��S���=�qOm�S����ᨍ���	��ٓҴ��WF����5.f0D&~~�$�{��������otx�{xzx8�=��C��]���z�ǧ{��'�ャ�������_��?x������`��|p�?��pr��s9�Ql���1�.������A8yp��YT\�?��V��@gG������}���E���*��j�	+K���H�y`y<|o�?�F���Ξ<�@S�`�U���H?N��}�	q��H3
L��?�+40#-��.�jb�V%T��;�'�쯾����Ͽ&n���7H>��CVEO����]�������P�Փ�gp�+(�6�8��:�Ҙ��MM�..D$Q��<�BH�R�%3��٭�|��i�%O�rV�~����*q�p!��̌tc���&�A�s�l:F/��|"��dP�X��`	���ωS�>��r�K�t�����:x\�$��j��:&#e|Ajm���I��$X��x�w�����p�d�8M��K��{=�;�?D�{"��n��a|q�$����Ta��~�`��}�)d*�����Nw�a�ݽ�������ˣ�=A��?�6���P��D�iz�hOo���[���ȱs�\��4��T�3�7�#����oW�Np��%���b_4}�o|.r_}\�ڀ1�(
��Q�K�U��q�l���o�j�&Q�� CE�(#�WSBR�J��?\q�-;E�<�ּ��S��
���`�e(p�C|
���0��*X����n��2!Gej*f�d* nWd�s��~��߻�#�p:�6{��3Pl���)"[�w�(=�����A6m��QH��).�������.@#���WH����G:q%3kA�̌��I䬀%.B�l�t	�*-�C]ڰ���?G���۬�2I���$���t���"��Gf�d3�iEaH�3��1�P���4���
�@�>2�x���45������Ȝ��3�E��qz�$�.�-��m�A��2�0�~�H1^iH������_%�R_��+
������3�b9*�4#m��p�F�r���r
e��,.��-�?:�~��
��ET8�#Q� ��~��2|�pY�=��^��)�ȅ��ld�`.��1�#��h����<~��������#$&V3�E�f��e#i�V�9��~���W;VJI�N`��bL��0Ѥ3�U4�-ˏ1/�UPa�FΌ�!�J���^��Wlv�)$Q����0N{L(��PAG$��I�CȘX(�M����.�+��G����{o��:-�����hQ����Ô���������e�� �-�B����D��W�0�����}���/Ͽx�ɫ�pWR�!�:����O�¡��=�y��a���>�iyj#��~�P���H@���L��ӄy"f#!\�����9{����(v3!"�{��u&�M�bf�Aa8X����[_�z� ���:Dn2�%���S.�t�2U���X��3���-2��Vv��$�c����]#�]�ڱ��ʀUX%��b�&jx�؇R�0����8*?�^�F���u�H���]RJf��A�i�0KU%E�����fG������t�4{����>s=5����r� ���J�    ��sń����٢��hʙʅ9�4��n�'�h$�9g��(��o��߂z���^�t 0��Z��C�&�WS*/�	0b��T��=E�:��G*����.S.*@��~�K�z�pKdl'P%6�7��-K85���- ��D�\��X5D�'��Ɔ�2E�{g`�|R�l�F#��g��I�:����~�Y2�'�5A��R�n�z���Cn�I���R��ͫ2"e�~M��-(	 J<m��B���)�=�����`���!�IU"ǐs�0C6�t+�0R��/�^��=�L��Rl��z��*��]�������b:��"������:�˯��_-�s<Z��������0FY����G���(oL4ga�����=�c�9z�Q�C�19�<Iߟ3���=��|���k��x��4m䎴[�;fV�F^>�n*�<�(�T��n��&�����xr�3��v��w�!n?X2'Җ��i��6�c��õ���4��L����Ͼx�m6�A���^�>>=8<�=����uN�k-J���,�ƿDh;_�0�󒕩����8���K*��,��h�a��NG�Ã�C�'&�p�g�l�{aY�n�����R��q��8)J�ůX-;�NJ��	`��3p��Vp�u��.�&��|a6;����;˼%�W���2t3�b�!z�|N�o^����g9-^Kc$�Ւ��I�3�t[s	EB��\ �!<�|Q{�S�,��T:&O��w)~Ē
�R�s��>���������ɇQ�䣨@K#�S�����F=�Ю��x��|��J�/�'��ٹ�p�u�2j�2��C0:��ە�E� ���66�я�H�L�S��<������a#�m�pu)>a6J�����K*�Ԧ����)�n���W-F�c���^1	�L�7֔�
A\>�u8씯h��v[�]��	iW�q�Q`:'��-��D��*���[6L�s|aًW�u7��N�������+�o �5�*��w<Di�`j�\iкD���Ъ/��>&A�|��`��nC&䊓Iʎ�YG��Ӂ4��0_��U5F�	~�O���t]+עt�^.�rm�3 \k���q�`#��Jh��պ�)7V�3F�O�U[5�Y���O�1aT��*Z��'q���j��#H��Z�!�u� ��0�H�-�4�>׊8Ǖ��jl*h+�\D��\Y�gZԃR�/6yIz��[�7FnPb��cf��.�H���9��[�R�fr����$i��N��b��s��V�^���r���{H�4�v*>��;-E���������6QV����I�"�ʏ� [pZ�B��RL%�ac��@�`���T��˺c�p\�^͎Mp���%y3t��&86	4j`���8s���!f�M؜��p<bȭ�\�$:-!�D�ƈ[�	%q!�:���=�_��l������Q1��}���� :� ;A�l�S�bv��y\D9B�	.2������.�}A�L\O��d��:M��#��Y�UO}[�g�-k��&¾�L���G����
����5����gk��s�G��4E�\1�:����J]�]�S��La��Õ�(���;v�jQt�{���D��H1���]�Z���	<9l�G8�;:<�x�I����#9��}<��G��>��#�xD���}<��G��>��#�ONNG�������~W��z3[�(�����J<���#���Hl��B`*Ʋ#�JǮ!���fV.I��F0�Q�g4|m��:��nW�gT���T��P���{�]܄�I;"Ͽ����k����Iԏ��Xq��Ȍ�gJ� ��S����E�L���B�.f����CP�KO�ZV�k��|u`#��"��u�C��GKv��֍a�u�֊�+==o�� �1XkH�Q���&d��H`;�ڦI0[�!϶H��TC�22�G\�8�Y����~���[�m�!0	�@e�*�ܽ��᜽[�l�����l}�-��v{4�l�#+����Ww�� �ftw~�a-X����gPЎWR��5o�gѭ�g��U��%������.�q'�]�t���I\��P�����3�S�cj��#Z6�>.�������59��q2i�~�!�I���L������7�aZL/X$��.2´�d��텙�M�.��]e�_�o�ɖ��`d�@�|N;����%�o@M�$ф��Z�싵��2�ݑ���1�utIͤƇ4t�)P���I�_->)�$�/.p�س"��R'K
�9h���9�L�-8��̋��]%�u�}��*]���;dg���g�*��{+?�E�=w�gz����=�N(=w�~l��إOiPo-�`Bw[��Z2���jN����`�9�QX�>ȱ!����l��1�b�&����$�\���?���/���m4�:��ۭ$	�ԯZ���Յf�F��#�ۆ�տ[��?9�=8=8���.�j�����G��I����R	ߕ��0br|���~a1�B�J�	�a(�c���c�AT!/���������4�BA�-Y��JUNY9�(�$�����H�5j�]]9,�#@�P��hM�[f�Ye���$P���Y?B:Ն�5�}���4�yТC#*
4������i�yl���-�"�M�Lo��(�}���[�o��K��߭��֊�]��~�e�:9�����Zt�9��᜻�v\5��4����R�b̘0O9ʳ;���-��,��j�g�N[u��6na-�Ѡ�`�yC(Hw�!$ǳ)$�j��B@�ہN
i��偙E[�j�P�&�s6"F�e��E�)���X��ۅ���Ak��E�*n�-����B�s�ҩl�>�����t�Y�9Xk:�@BWөƟ6(5+E��}������j�k5^�3̵�j�k5��Ya\)�E����-��ѭ�ey/?��8� L�X�_��8_`��XMF�es:R�7cڒ����5]`�Wv���҈�]����j���"Cw�'4�H��^c�`�a[��K\��\X��K}`��
�����Q�����VT�w�
�q�Eb��'ͱ�������*{��{_#�� Ĳ������B�`A�'
�����'P���F��C7��h�/!��+N���W+�%��~����HLW>�
����u˦ktaX��A��km2��	���������R8ul�>sj�,�˲A�]~�����S*Jd�������r�\���
��}�O?�*�X�O���N��������*:�.������O����H#��&�g�~X��O/u.��u#jNO������V�7�%�E<����ܿ�,��͛�_W�UJ�������l�.p�&>X������}��Iy[��`Q�f�6��w���}R��eP���?.������W�U����v�����O��~��V�V�5�N�-S4I�������^郼n���������ʦ�'Zߛ]���$�lcK�j2��`n�)�Q��<��s�4�����J+��&I�PӳZ�Q�7�H
~Q���vR*�"v\ĉ4��3#�ɦ�^\&��V�?�Ĥ`?UZ�����'U�I���K7AH'1}]����|r��,�f}��}Q�����%��,���/&4�b�>ƪ�]-N��;�=���1r�*݈Zs|	�0��c�K���en8������4��v�*��7��Ѽ��6s�4���U�;�]�����6���k_�����J��}���}�����鶇�?�������~��_��W����|��]��2G��n�?�����������7�?^;�w�x� ]��]|�h���=R�ZI�~R�� ����r� �y]P/�4�f�?ѾZoLQ֥	V��Sݘ�XO{/�����H���.��i��U&����q/}��~5/�W��J�V�zO�������^��^�~E6.�s]6���_��im�F^�0Mwt���}�l<T(���j���l*,=^��ï�����+q7+�!    N�c�-�v�T��Km�{��������������/��8?j����l�1���*�1�ˠ����'=q�t�݉����Lҍ$��a8���y螨X.�ι�qܮ�q�M0��:��K5	�x��*�$�i򆶍Mn�XO<�@Y>�ri]k���`i>�>/0&x�D�LW���y=C	��i1�����)hᐙз��^z��OC⾧����ᑾ�q�����)��.��7L�x�c���ۊJ/�:8�k '"2��G��uV�_� ����5Y��5�L��˧�GϿ�=�yٕ�~�G�������c����+�ɖVnq��>�O�[�ԩ�MI�SwP��2�P��&��;)�@�M跨����JRQ�!j5��GafoPf[����i2���-�"��ȸ{6�HCx��y�s~s:�~\�����.�;�}�����jŅ��~�i=eIĩ��9x�Pۜ:���r�#S� �O���>�]�x�g����O�9C�a	�m�5V|G�H��+�,r��b�:�xG�bހK��S(Մ���c�5����s}��}JB�����D�r���֧i��g���~d�|�KW����Y*ś��%�~�̠�Inp��~���N;NEr�e�-�\���6bh���g�֥p�1_z	�aV�JZNb�C�9۟򺼑>�e��c�}��_���H�ps3.f�EB"��<=���g)��osd��Fh0�̘�8�U�ͫpE����_t�ȏ%���g��=ml�/��b-���?��w��b�N��I�����dzϜς�����)�s�#�wKQ�ar����Fc���zڎQ2���8�;Ig�������S�-��ʏx�%��\�(��e�	��_�tz��K8Xc03�q���������L��4O�?r8��h���kq��7�{��)B?ӥ�{�!�C<�!�d�IA_]�U��k��.-֪co�e�v&5����&N��GM�^��`� R�����p��?�eHM���a�7�D*4�3J7,{d���&Jܝ�R
����^����j������ߢ��A�Y�13�m�t�l&�%�r�y�@�9�A\���?߱~�ĉY�	ҫ��Q��T�ƴCg	��:�4��El��a+�#���	������PZ���zgD�@��٩�4`Z܏��.a�c��I���\~����)$���@�mɲ%��:���;?/�Ojn��Y�[9�e]���ր�W�!/1S/Q���w��|���2)�S��}���ܬ�p�����[]��藥��u�[]�{�li���BV�*�4K.ǖV��	�,-��$�xKm�����y�"��lL<E%4��fݒ�3�E��5�>�>���o�O]ӑe�7�� �ld	��[1'J��%'E���o�Ad��{��NCl�eL]t��ޟCs|8�"pѯK�fَ>'�͞ �JOֻ�6�|96��i�9��Q���uX���u��X��3	�����"4$�=yL�S����%h�M3�W�^gd�qa���9�f��߫���ԓ����m8(i����Lg��ƿ���s� 8��M�>�x(�\�
~eo����������C��'�U1?#�QI)��|�n$��0��~�;u���|Ł����V����4���^|�={N��s�xk�?����/��ܵ/�R���b2?�	�H��<�#�F4��i�'A =i��Ow�s���>��$�I�t���s�/;��\��c�b�G��0�����]���Ez���6�ne�'�����%�w�,��טQ��*/��&p�1��`���:D�`Ҹt�Q#��}���wNj��j(�����`�&��[��2�����m��an�'{�����^�>q㰚4=�9Z6	�q����N��H6ع�����ߟyM�p4ml0N��_�і[[��S�����p��.Ri�NQ�%>	HuN$&@7	�zk^�����a!�'�z&�820� ����Q*���,nTvIQ�`[�7���B�]�w�����>��W���j=�$�>�9�G�]�I^m���ԣ�d�j��������ŗe���gӀ��/6B���[��r�/�e̹�]���k�*��%�
�e:�B��+��+ᱏxxJE���Z����kS=���������_?\�(i8�dѰ��6�ЬK�p|���ڸK0,9Jl�'1'3�Fe?�,!ڽ�HnQnnGIf�]��g`��݂ɝd۔Af QF������PR��b�x)|O>H jKoR�?�i���^��M��&%p���?�ņ;�b����!4W*"�34�Pr��6`�%��m~�F�ǿ�F������ڧ��s��-��{4�c0/�/�AWp��7+�(˄�@-{���.q��8
4p���m8�3;8E�+ނD�3I�x���;&lgK��ÕC��G2�G&�X4/껺r~'�'9��-8�p���0��;�i.#��"N�TiX}Ws�j����B1 ���j=x����v��fR�L��6x�Q�]-��?q��'3�q{ƾ�)��Y��׃c�?,����AE<�|uL�}����t��Z�g�C�`L��A34+�:�V}��H��n��g�;�����#���/�V�Vb����\&9�g��%^!3P�9��0 DK�txy�QE���`.�oV�1:�K�6zh���j�q'Y�K�X�B�6�D�gdv8�& ����������V^�G�僃�3����B��0���8{����^������߽~�}�}>���^���_k8J�V:	�%�m�a��ݸ�p#a*Ԍ,��|�x>�~�_pQq�V�����H��)��*$��;E�{�u��2��{�RW?j���~0����*��]K�H����s� �E2x`[<���|,N��<�1������Z�-׷�֟�o�pXQ�]�l��R&(�o`��I4Q^o�K"�L�K�����t�IkPdG?�s<�z�<�!q�b8�ba��'��,�T+�д�z��L�ڬ�#� �m�zO�"�ܓ�6��K�:
#�ed��=@��q�x��c /Ŷ�V�����3�&���b�4�i�^M}6蠸V+�<v6�=(m����
h���~y��ю��u�$�ٲk�i>���o�̯��Gg�0��wE:��̝$o��_�<n�>�M��������d�|�=��da��f�d����%�yo������zw�`���i�{A���U}~�{������toxxp�\}nɦV/??8��>��O����%����R�}�����M#�M��%sY�(��|�3,���N��N��JG���b&�\���n�H��)���޹��f���;R�xx����P_	��6�E���,�A��}|zp��p��LEp��a?"�+��"�Fj'�-�/2����`r.�,,��h��������1��̔�E�\PUW7A�����wכ����P���R7����K?b�{L����W#,X�`ƭ�D�#����LA_Zn���Q������y����:�)q �p��$�����g|ń��x��4��؂�<ڰD�����/�>'��8_BVh��P�P��|X���ο����ѓ���GQ�.�w���y�*�0=�kt�a�#l��w���W��~	��/�ν��CO��|�_�aX�,�A�vI사m��b��q;"x�c�]�g��<�����Ξ�DZ�r��������p��Ͽ�!��n���.�yN�G߀q�`w?ܧ�C$<�5��j$�2�+Z��J�e���4.���$��,�5{P��#FF9��B�䅥� �{�-噽x\cO����t��{�]���p��qF��H�����\�`�t��e���&j��:�����6B�!���T5��&)0�u��k�:*5�����\��I���A�����9��;תk��g��E[`Ţ,srA#��@�2�~�U\Т���zY��&�U��    �*._lF�$D"(A1)`x��h�ʔ
5�ǀb�����>|��k�9]�:�����kD�u���&NK5�D_,������b�ǐ���3U�$��ŞɬZ��z�i��!�N���6*�G"�@Q|���9�n�ř! #�`�,Er(6�������Â��El���}F\� ��e$X�/�[9���"�PN��@J���M����2}Rv���)��̔���Z�Ă�T�x-�S?׍��bJ�
����l��`#���l���[�ǠAt*D�>�k�͌L����nZ������h��;���\�&p�X�JwIh����Lij�]���!ԏ��~+�z�4v+�]x��s���7WW�___�y��՛�=����,w֪�'�����Pd���H�`V_|��\�R"�xM:\��3v�y��:������8���������Y7�p���������`�ߵ�Z��v�8y��E�3�<��5�N�h �:���x� �-��!����L�>:,�H�h�9Uϓh����s�Z�����Ex_��Yi�$�땊N�k�4�K���$��"�ǫB.s&M�Bm���1k�cF��v�1�IE�Ae��a�=+�`)բ�����3m�z�ևE�ń
���A�����	�'��	�@��J)�ݧ��c�!����\���ȫI"�����:���j3�*��s�)l�*./��H�L���'�.�jV
�ն��S�S��+����h�3�%��Я�p��?�8������>�=ص����R��NWZ��/>:�ηa8�?RS��
:P3�����v \~,+kЖ�$�H��$�=�	���;d/�"C��Jǯ�XG�8ψw�����:�9:>!�F��y��l�J��/>>�hX�=���E�T82#�U�zY:i��̊K�s�#A��,[�(����I$�V�}:p�	�ߨ��>�BJ7���V�\��^����Wt��Կ�?&�fR-���6�@����o�"N�9���<c�����Mzp%%�ɧ�P�4��@�D�gі5�B��9ZTuw�e�"T �i�%�s�4�v���0�2�fs���?-ś>.�w��il����cxD�%�C�,eᬂ���b§�a5/i@řw�S:��0��gD���'����84��/Ll<�o��G�ޮ���8O���̿�%��\(Pc>u6�Ծ�K�B�P6J,hP�G�,�O�V�R(d9p#c�a��򺋊��Y��+B��9S*e]|&M7�# �TJ��ƅcz.��S��T�,��=
�E��»K(��y�.�2�b@5a���n����?�N�3PZ�#��ku���Yhp�����1&����ϼ�����^E�a���0����1��o�C���#�y;����0���ℴ
�#�4��O��̿E����F 1��8�5�s��q��B{v��9U�q9V\�ϣ=�%��� ��;S��@����� @%%�M�jR���$/������J��BwD��T�Q���-]tZ��T!�F�x$�fHJ���BK����̿�%���
A�+���}����4�w+��A <�ˆ���5�YM��͊�4��C|v��x(�D5)�j([JU^\�ft������_$�).΀�O8���'���;��cWh�����������H xD�L��3�'��&�P?���H.�������,/�|p�H2��|.�#� ��YC
s"^���L�����:Dn����F/Tmܰ�U�,��V��lV��kRzŲ����tk�o
|���'m�x����,C� )�1YY4�_ӟ�L(��(��f���N��>���X�0�z��h=C��r&�q��VyP	-=Bם]Yʌ�z�Uwڳ���/��m�%�Xh�M«$c��p�T��U���Թ���Qଢ଼�Æ1�e��nCN^T5���L\*�R^o��n�e�Ā��VP�J� ���k4��ά�ާ��\f4oA�N}�p �>G��:����+UMs~Hu���.��T���;�jvRt������6a��N��'��;�0x��5	Em��ð�u�h�����`Zv���\GL��`����C?������H�d��ޙ$>��@uZN�iQ��}��o��ok*�𬠅�bس��	�p�9�B��@�bm�ӗQ�?#����Mu#��BK7ȷ��d��txQ-�{�ZӞ11´.q��LT�c�����s�'{���� �g�-��)�V�s}����㡼�`���	&T'��B�

dR�H������ &*&\��6���u�>�);�KT6�,�q"�b�͊Fed�#_��T�+Xо��ŕ��XĚ�'��B�Ƃ)x��p(pI
]
�Dߢ��#0����IF�9�~y
p������TZ�|�NN��\�5�r5j�䇓s�|SPL)�� ��+���P`� ����O�(��	��P�x��"�Ӛ@=7��� ~UE��fc��}�?֗���G5����e���舢E-�A=�
[�<%bZٛȡ�]Z?5��%\K��u��A�b(B١C����L�@b ލ�.��p��;��OȎt����rOE�W8���0`��48�".צ_1Hͪ�4u�d:���a�[Dx V���j�`�����a�l��r����g|4�K��
����%2�o�9�a��ewiB`Z�~��XbtV�$���X/'�)�ē��Gn��D��(?�Q7�c���Rs�;����|�p�Ȼ�'�qq�XhoE^\���Bsx�Z�:��9N [2��X�{�&r-&��m�(D���p��&^E���8�Xl�"[s��!0��q��W����2�%��V�^�{����G���=؟w�U��]�l�Z%�K�%��xM���mE�̼$%/��%OI�+����G��[.��H
$�}��K)�G`��P���O��a0}���1����O�ȡi��(�|1M�/}���q��.׌�*
��6�;fUM����S>��WV1��'�!V~�FK#ܚ��ȀN>S�ܜlC䆸���g|f�km�F��-�xSЮ������26K�'M���B#]{r�sp������!4HX���A�"��%T�-�����mQ�b�X�C()��y:)_�]�����8-f8�k�S���s�wb�-~�ЬP{H(}b`R	ʠ"�$�~hYXZ��v0��lG���Ɠ���&�F-�OΞ�?�p���
���	��u@R���;fN�sZG?���5��������2یM�WKB�0W��3��l'�,�v ~�,Q�mV�	�OA��ńAy|�Brn�L�͂�A7�;��M�|�߅l��j��?��o���\S�N:h�$��,����V��%��xN����,��d����G[w�1ɚ��Wҝ�6W���h4�Ki�4�%K�x�I��e�Ŧ���q.8e�FkR�p���8�A���` k�����Yq��d��cplP�s�
*�Ir	Մז7�$iXu񎰸b�:TE����Y^_Y�rZK>�	Z&�@!�K�z��ɢ/��!�r��W�������f�1L�.��l<zO��ܠ��;f|�s~��٧/���M"(4��	S�(��8��Ya�+",L�� *��")��;+)�[�`��<���̀Zn�Ƃ�����R��7(N�ƌ�hՍ�gXc�
vH휃%��܄C�*��Δ��L
�S����U%97I�?A�B�-�eU߼�)��vͪE@�dչq_��mBW8悆�AQ��kW�2+FT������4�ga�Z�-2�M)c�b�)
iF�ƛ���i?�p�.��R��s� ��ao�5�3�<�G�-M.{��Ţ{O�iő2uR����0��<X"��f�L	g(���3#�O}XxY��]}HG�m���ZP�՜>�#�#�Zs���{�z��{���ǻ�{ל���������xx���`�Q�+����	76�iı7 kd�; � r��:=JC��p�kPn���DU��\�n��4Ak�(�<��    
��`��̨	x��2��D�sg�g+2���l�*hs���s�"���T��.!��(�Fu�qH���� �\�ļ�51�� Q��� N��^+Tt)Vt�Ő���`��}�s$ic��0�rɨ��δe
ET�9��������U9v;E���P���y�ꫮ
V��[�*q�vY]��
e�w� ��i�6�u�[0еN���e6m���Mq�z���)$�h�6��U+l3�X���K�j�Ǌ@v��]f��.���;��m
?���ϖS�v-S�9��mG:F�
�vǀ\n����ɪbu�7�f�8�F��L�k�.�!ܮ�AwEc/A�.w�+�^WC��]���o����#��"���	�ʬ�^���6"Vky8b�����]`�92�)��8{�(^����}�s����;�[���@��sP��cg�;˂,�/��E�d3z;,y=\��5A���&�	�!x2wA� ��,����}t^�P��׸F�]�֍�F��Kw�����k��#L4�[�E/Yû��%��)bZ��M�����:��i:��Ԅ����i@a�3^�b����b��� �}���+��k��{�6��!������V��)�@7��)L7�}gX�,L0��aЬ.�����G�B��v;�V��E���{JI�M`ɹo������|i&���v6w�f����8t��ڡ�Kn��;������V�������։kC�^��c_�`BfW���"�R:��swc(xs�;�S(m~����5F��jӰV�����Zt�Wt�@�6 ��\�{��;��G�,��oG�/��O��Qt�����7"�iE����k��%�_��d�%hiJ���{K���3|��Um�S�V`��|�~.) X�(pr�>�k��!g�� ����2	�u]��ʯ�b�V0����M��a���P�&��A��)�Y�Z��)o�L,��bkUŚ�ɕ��@������`P��R���Ҷe�F{ݗ;��}�C_��/wXzH�r��ܡ/w���r��ܡ/w��a�Q_�x_����ꈾ:bq������#�ꈾ:����#�ꈾ:����#�ꈻߨ}uD_�WG��}uD_�WG��m)��:����#�ꈾ:b5Ӱ���#���#�ꈾ:����#z_��d��-��-u��})<�/���������Gj�&���G���p�gܫ����d8>����v?��}pN@+_�c��Y�1��̙������bbD�56Ͱ�9�b�uo�9�<
��\��=8wA��&o����p�Ea���Ai��Q���#q�$�i���)�c̫�c������13�p�]�)��f��d4+j1��4	�o+�N}�*�!��(*�I�W(f���f�p	m1"��,qH҈^����07�f4ˍk�;�<�U����C�҆'�A
A�|d�������N�5���^�42f�8��̞"��M�(t7��^O)Qn_#�-�'`�f��8����$�v`����>��V�Ɠ}��d����q�	�pƠ�T�	,e�d�*���4��s�׮c�I����܋*(��:�ĸ�$tw�vG�wwF����;��9�M�v���{�Ǐ�G�����������������������^���]jz����ջu��������9�� ����,0�����6�2���(���a�eh�'�� �"��3j�S�,lio��kJ�a��To	"M��Ea�8d�Р��y�8TN����hX�u�BJ �;�<�ƭ�aR��:m�\���4ڮ���+�؍��u='�>��S�����FO̟��;<��j:�t��e���*�=�w"��T@+Za���"s�������!������Y�R*FGf�|��4�HT�Q�V�����A�8!#0��nI)�j�F2�$[R�P�>B�>�r��;,8���Җ��Z�^�%Z:c�|=l��8�8�X�_w���cp������^*�b��n�7�PM`\�R��D�E�ܢn�Yo��*2Y�[p̓��)�}Y����/@^r#�+�5EK��x��Ŋ��G�*Hm�EI+��� �ՂIpƤm��ׅ\q��Ѡ��<��?Wv���I�L})�|���rL��p &#�Ϝl�W�T�#����� }چ�}i�F�Gób��.��:
���v��ރ�d;��mg�dtr�?��M�7c�����70���oF�XE�����|L�{g:����'|�s��d�����3X�!�o0��7��RM��J6	d����$�{��S4�x�D(j��w����&�o�+�~��[����$)��c���ç ���C�����;9�=�x�32龌��������w�[5�+0�����$�>Nn�T\-w����R���Gy+1^�=B䀁E H� ��u�]&M�~d,m�-�6�i���Ɉ@�XoV�T*EI���+� $�,�����Wf3���F�����b��P�#�\]�{���9�@0�˯#����t�����K"�%+$��1��V}�QduR@��gN9xi���E�
�^b�W������.���*AH_%���UxQ�<?�)��}�Dy�|�����p��_z���Œ�`����.��+�-�&1P�HupfMK�1؋�f��Z�Տ� �6Uo1r�=4���p�n��x��."��2�E-�B��U��n�Y�Ե��B��qa|��k�e��@�40�^ů�����x\� �>ͫ����L��h%���dd�9R�
:�8���p��?FǁcGjc����M
RWX�6HwN��QgaȰōb5����k�Ӧ�8M��*��6(Ǜ �팎�vނ�H�f�
��Ƣ�$�m�i��6��l�����}��\����?���Iz�y�/wX>��m#+���]��@?�|�¶A8���QMޭ66�=�%�#2	v2�
N�Nv������hD��q����*yPs�ѧr�ᆒ�JZ���)��͜�pW飊hr Ĉ����Z�"`��i�oˋX����Y��;3q&V�X�߆Z?�JHMOp���U=�brj�����,��d��]x-:ȅ�%�p�nWT8��[0s�/�ט� }�#D[g�R��8��}��{�x��ap+�7���5-<���)0Ѝ�kb�X����%�;9=�>>8X����t��t�;�;>겁��hxr8:�����)���]'��c���*b�5���]5�[g�h����%(�V�!_.�j���+�4ᎊNk�:�I�AaW.�^� 0�
!�E����g�F�k9�R4��[��T�ͦ�p��`3��ěI�9/�9K�=�\�;o�v����6��Z|z�+�c�&�-�wǮ�è�F���׉f�I��[^��ܴ�r������Wy�x� &����� ���̫�ȸ���D�!�~�\w��D��荂�4�^	��uWW�R��u[W�qqx}��z;�Hq�?0O�����M�����}5����m��"����@P�XN6�W�V-��*Ow�/������J����mr��|7�c=p�̢�;�=w��I�l�N2rOw�Dh�=�WA�C*a�Y��at���VsZ�+(:�L�B�Pr�k���O,� T�J]�{�B�b51�wnc���$9�:{�	��O�Y�6���&ީ�<��7��ʚ��&��x������<����jHYm&[��گdt�\��Y�J ��@�	u�M���$��$t�*i���@�l��W?�Z��&!�-}��O��ɖ>��'[�dK�l�-}��O��ɖr��O��ɖ�%[��U�����>7��f=�>7��f��L���s3}nF��>7�K��, orjr�F��M��f�>�WG{��M��UɛF{��4:p؛��ˋ�m�R�I�H����p�gcp�qq��Y+�1G5;��%�`�������3��%jxjx�����ݙ�$#�aT������O�O��:�=c<q���[�|�.�w��1�    ����1B!�uh�.�(
g�����o��]�x�[�V��9N=���҃h=Kڙc{�?)\v�sC��;�a��w�4�W�3����K��|�@�(<3Oö�Є�G���xf�1��;�H�/�nG��,���vv2��Q|���F�+kl����OT��JkYϑBސ���n,G*���?�k�B�����:e��}�d�����h,�Vnt�����o�\r�Zܴ�Prb���i	�*}0:!����ח<>@�״��6|���jC�$�+6�;.N`�1�M��a���g��7�?��0�^�*�l���ֻ�[b⟹���҃#��W�k�������x�������-]XL�\8mL&X�!���[��_�J]u#�]���G������u��v�:���\ڕf�e�y���U1��3�7�7��3Ŵ��j��	�������C+������޼������o|����i������m���흎NN�v�G��u�͟�O�,����\��C��p�,޿d4^����6��	� 4%�S�*��}�0���B/����Joğ�7O�����;��%�ҽ���� �tjhh~��ٝ[4�����`��f���v�Bo���
��S��uN#C�+��8��ѴR`y���hr�J__��\g�E�4/�z��u,?n�X!�����?��1tW4e�ݰ�ִzuɿ�}ӸO�۰s���$?�!��	�@��dq�j-�B�޴W�jrE����{$�m�J�=8�D2�̞#��>��o�d�=�q��1��oi�ɏ��f�7��k���`�Q°�lhnx����.�G�w�Qg�
+���n�+����=ꜦOF ��Ϳ�ֈ�^���4/	�ɝM���u����ƒD�tF�Q��&� ����Y%��@��gH�Q�\�c�N̑��1̔��bcC�d?#js�K����ۚs����i5j�$#�l��ILA��|�}�s�Tƒ���<��t�3И��/}|7&�B�2��m�07Z֦��@�!{��5�G�<A������նL�5��hl�&�њ��̳�����8�چE�E��5,�L���>�4���XZ[Ē����V�C,Q�鲥��+�;H��<��4���
�@�^2�x���:�#�)\M��PdNW^�٘�{�+�!6n���{Sw>�s6�eӭ�v
w�]�>1��+�rC�4N
��U26�!��y5
��ó ����҆m���&�|�ϧ�Q�+���	�4��j/���)��3T'��n��Ő�������^�6�U"Bs�!��#�}��-�x�֨����#����v���R'S���sn��h� #&���1�Վ���d�LB�3-ۻ�.�϶��������VA��E
�
�	��~Vq_}�zR��)��W۱

����L�J���:�	�K�]�������{��'���������?/�X5evE������O �.I�.G���0�a�6_���^�)��,tЕ��I��e�K�6���$�/dn�_���@dB�"�WҺXF-tTW3џJ��	�{��U÷����C��6*w$�	�T�"Y����>M8�L�e#�jw��� gcO��(v3^���qh�1�1:,3y�븚N�:gE٩\���'-�6ĉ ��[��s���eXp����e�ʮ�)��囂+ܴ8@o:$ �}.�j�#�]�ڱ�2�=+�he�����55�͛C_*�<j���gE-&��k�(�7��t�6O��.)����T�����F�TIFb��1`��E�IS�)���`����(ri`��~Ɗa9wVA�KPSNJ.��E�����M֢p�G0��r����'�h$�9g����UxӉY�\�~K��y��@pk�A�8�k1�r��ZHm�o鷶�l�H�/}D���@��~��z�pKdl'�f��7�u-�;U7Q��4���5Ǫ�P��"�S�a�Ԩ3�k��`�p��߾���s�'��@��f��j}��Pt���R�n�J�L>�֜t���QVF��Ċ��[PvwN�b�psY|���ى0���)҆����W K�r�q&_��et#�K���E*�3�T�-�f����wY�6&���wh�TSD�H��L�PgB=���V�F7����廦�v��	��1�]@A����
[�h�'ML�//�7���ң���3I�ȫ���t�d�<Z�I�?:����$��ǣ��c�$u�j��p@hi��%+TO	�2�
���.m�:�B��ͅ^��~�e�LEh(�q�f��	8C��P,Ǆ�7�� n7�u���4�E���6�9����@|���
������]=P���r0I�6w�'��8n"�Ļ�q�I��	>ɔ7�r�̈́�T�kj\%R%�{Y�j-itZ�ӫƴ�^���湔ӣ݅�p�E�X�6���]ǽx�	}q�y��ג=�`�ucM��8|�x�/ff�C��f��/c��:���i�P�W�A8]���C�m(����h��&0V��n�uMv�ИEѻ���H|�`�Z�)��Q+���:r7�ұ�F����H��F^&\r������ *}�&��n@cqĲ�֊��.�� #SK�%�X{�b|��Ȭ�ɚs&3�q��9/ă�X��Z���<x�'x����6t������m- �F�X�G�V�V׭���ή9̌Q�;G�`/O�=��Oa�J�^c�[Ȟ=e?S�a���)����.w�hx���x�sɂ{�W. Ye�z��t���y���H��Q�ȟ�]�O��jw��G��Q�a��RWi��E�&���ǠUai���/��ݛ��+����/��8?����jH�)�۔�ěa��ޒϘ_gh3���F�oN��0�p��-4ĚƳ_����dK,�\��7nRK���gP0%S�c2�8�-�%��R��2��g�bv8A��l׉e6a�I	>�P���Ra�q<B����Z��p�#k�i�'D�RB�ß~�u�RQ%�_�@��7�M�c�B��<��W�I��[��CP��|�2��cBP�G��_&)�M�Xj�������τ�k�Lp���z�� �kta��>K�	؃���]o�J���߆�����P��0��)��y��q����6�1`�QTi��x��E/-�pQa��T 
 ��D@�P|�C�^���>m����8�����/�g�_�^��,�
�Q���#wV�o��,��q�NQ�����O�4�}��" �	|@��C�,�O�ߍ9�����[<͔��b��K��������ć�4�q��<�\���!L���K��
g6�NRj�[�s]��p�ٗ�5Nn͓֑	Z��V1�(�Sn��H{��Z����=&�l�o�L����C���q)u��&�\Q��*��?.|��}����p�E�s������黀�n��!����Ehb2�̪6l���J��J�(n�$P�{gp���ļ�c��y�D�3#C�/�h:��5d� �H���\��<�oѿ֟l��P�=��R���9�z���9v$�^��	f��6�}��uK�����J\B�u0�&gT��0���܆W!���(�:G���[� +?���4s�}������?��]_�s泎A V)���*��;��$�-J0�@Wy��|H��F6 �I���B˲$�����������^L{�o4����W~�-$���e�H;(�gy�A3��ȉ4+�_;���|e��fU��"M��,�Y���\��ha��(ߑq��a�s,��!��U�2;�Rk�������� !)��g�s��Yд���t����[��D|Y�rwT�|��|�R�(0r��>=$�C|мR�#�0���	w���_� ����qM�Րޛ9��+������R:z\�?�4�N\ތ�?�+^E�����{G7K���*�?pZ�)&K�*<�7,D['��ٳ�2�B��>g}J�%N�ȩ��3"X���N"#ȕ��    ̌l�i���q�T�Uٯ�V=��I"\~���m[�b}-����c����Ȕe�j�^:hw�%�Ϫ�ɟ9-�����5���O��������~��?I�Q�Z�=B�ѺT=㻆��[4p��V��G{ݗ�4T�M[�(�`�cق������[x���݀��*8r�S�^�q���:�Jg��,�i'������IVj�r��O2�-����f q�1����\;&Ȩ�q�J֬Bo�"�hD �Nm`	��|��)WAj� 
ϻ܅�b?��J"ǐ��9�2>�2e�q&�][��o��>#��K�A(0�C�D"M�0�H���g��'���٫�\�w�j���%q��=9^�s��oCs���;c��'�F�R��ya<�8٦�/��7�Q#C�'qG���D�$i����s^��M�_r'MMl9/���0���^|�={N��s�ؑ�?����/��%����M�֭1������F��'?Gu*R%���4�|U	�o��N��`҄v��@��m��;����.=�Y��Z�+�&0��&�o�5�	e��(����0��$="\�tgѝ��5h����Y�����M�B�E�]ul��_r�����I'�O+�� �n�c���;��$��v��=�`�C~ÎR~���k�Į:�K�J��;n|HT��:!t3 m'G����~�X������%�&�.k:,���O1�.�}E�1`Q�� è�� !�s�����+��6��c�V�A��h��h��]>{��w��}�J� p�0R&F�c�wpi2��W�hN����w�o�\:�+����gBV	?��P=2��z�~�
-�5����b�i9�1\k�G��rG������s�|����ߡ�!H�����;9��9h�.U���,����@&�)�q���%B�"���GzQ $N��G刺El�xa���m��!�/��,�'#�e��ei��ĩ�V�IB����OW!ꋿ,<�#�����9­�-�O߆����Ŀ��vd�4�J7�
�9�i������O~ F%eF����5�h���(w��4ȚnH�:#b��(3QA��"�1��ߗ����h<��M"�RU��ؗw΅����D�
KT�	�xzv�Z�Ee( k+,��T[�ZU8�p��n�� i�qRCJ���%�@;�ϰ��ݿ��tһ�"aòT�Q2Zb���R���N�P�Cr��[�K^��	���8@n�O�v�,|�MI(Z2>��Kr��Z'�&y5I��0GL���cǉ�"��{�f�o�֟s.�t��F�=M����37Z���#�B5_*���,؁�]R��]��s7��'8��%�or(�R~n��L��#�c80Z��{d>�k'�^�%s����,u�F$IU�!<��)�yfSR3Ὀ�؋�D���0V��~�,�;�Y��%{�U��RN5h����o~�����7/�?����'�w�����'/^~}�?szK�\ ��"�:3Oa�]$SE�K���f��u�`�j�W��f������l�03�������>���M��F3{�O��D��j�R�ЫA����@�����^PD��60E\��qX��>�0��m\Dq3-���}$ĨN�I��s�"t��ty��K2�m;�%�A=���r:\=��t܊&��t�!�8�B�55�&�=���t�c��a�^kϓ���zlWKz��{�_�|�!�р��Ȉ@��Ϙi2�s�4��%ai�.����Qd(H������.I�~:��ω�s$���{fP�{��K`�y�)B6{��Q*"���)��Ƥ���5��2<��BH��)I��Vηq�%�Vx�w>e�m�Z�nb����fy���������{��!����������{�Ww*�d� =�z��O�`o� TNe�����}������^,�3-�`�2l
+��������b���v����r��k����vй{��>y.��0p��Y���ţ|WL�4�������*�hƿ���}�a�ì�6�d��P����?�
f��8�3o�̔�9����R	{�3�zph��FD���(�}*-�EB����p+�h�ƖV�Y����ֲ�C�5�+��MB�i�렲���}���t�r �=�; �����~7K�o�:JwPj��� A�Rp(tM�>�^�D'��I4��H�y"���D�*�o�40��A�Y�9E�[g��1��=�u�Mz��^�.��z��pT���Q`z�����3�oCB��'����R%� �OBܧ�7�`�$������`�����>��3����� ����^|P(@�X j6�QK��u|�<v#	]l<<�U��">��Ҷ爀�҈�!��Q�{b#�,����E�f�&dQ�cC'*c'��>�ĝ�ŦB(��zQ��Q�ڳxPDvU�!�<���2��Ih%v�M�5�7�C��k͢~q�QTf�.�0!a"$L����0�ߌ&B�.��DH�	!�.Y!a"$�!����	!a"$L�ā�	!a"$L����0&B�DH�O��DH�	!a"$�j��DH|8'P�V�T����)�9:o?	�� ��~�Tqz��0���A�	Q0!
'�-&D���*�`BL��	Q�1�G!
I5	�萩� �I��q�۵�[�#Z���`����Qo��c�11�=c�%~6���~v��f.����Ջ�G���=��ߣ����uo��`ՋKe%�����X��nY��^�#���r��!Z��.��E����v���f؂�J%4�%zv��E;��Ǐ���\߃�E��)mu��D���x�Y�Ф�|���VZӰ2^��M�O �gٺW�H]����Ϟ��B�Ǡ��������l{�wz�nU��'y6�Q9���Mu�5 �D��\�4"Z������uQ#�߮Pc�Cg߄����D�e��'[k�79��1�K�<@�����?��R�p�f��8��[���+_v��"W�6҅S���xև�3N�C.�B�C���x(fH�^q:mKߤ�=-<��Q��q:'��|$�<�?|+�.g଑�8�	�N*�I���NbDum^����\�ȍqO#j^��_C���zKZI�,����W���WpSF����C��F�x��h��_/�p�w�Խ�� ��+�q} �H�#FD$�f��uN���v
����~\�o��&v�Us��ey���/)*�u��5ߡ�e>ٰCهpqG{v��FqZ2.�z�z���a]��--���@�:W/��uK���B��H-�� ��+����$���Z��Ez�oC�Đ��\��B�HC�Ȃ��M� $lN��):�d��'�#6��d͎�ޑ��W�F�,7���+;+9������ ��k1Y���'�5����RiKpM�}P.}�\�9J �ܻS���P��S�MY�B.�A5��nrR����J�s����v������1 2�`'�Ϊ�='������~�*�&Bֻ���@Y��"�q0��j�z������!�O��[9d!'���J��_,y|�E߿��~eG�}Ϗ�dG�+�RO�K
��#�z��޽u竭sU}R@���t�sس]L���;�9h��^D�͊�����lWs0�v���Z�W�pt�9�	A�8�ơ�;��
���G����lG�FS����渍��K{+�����{;�3���S���u�t ���H�!�`�,�; ��&�ҁ��	��\qm]�Y�W�Ώ��BQ�i�\J����U+'	��b�h�P0��,��}��;�u�����V�z/5�ǘ��n�z�+{ֳg��3N���xW�(saQs!�G�Z�@�r���E?�o6�Jb�9m���LI�M5x��Ȍ3�cdad5dd=sY`<v+	g�����ʺ�D>���4l^�G�WG{ͫ�Ϥ3���WSOc^t?Y���v�;����*�!��|`��Un�x<)3�j㰧6���='sz�ɜj'�ߘ�h��    e�W*F�F�̢�ƻrG��?:��?9�����gEpN:��n����.���6��Q'sZ�d��1���L���N&60�|�'�?���S�?͞�J򡣩��q6y���R�6��Ԧ�9����8?ޖ�CE}zv����cx;�c0Fb(�����E�w|.��/T�D����0�-j���yyǛn�|�3�r_�=�C
&���]L�@]\������/�>���)�áør�X��3Lo��\m]ĸ իt�K�9�T���8���:�IՖ4˫+ֿ1�oa����Y췴�ƽ������)��
�H��ې�ɠI!�x2�0�ϛv�7?2�"?�E����5?F����q����9���2V��F�t��-q���B�?΃���\'���$�%�� �L�hv����Q�>�iI(JW�Z�4�eLL��pD4/�%��������9���$d�KJ�Y�]�K&&����^`fxN�h�@�>��։��$�8J�4��q�tLE
#B�RG�b��u��d����}�����o4�3`ܺ�M'�6A����P����v0n2XR�Ŏn��KFt�;"�f|I�h0H�d��qr��{k:ud^&�w��3���
�u�o��Г�oy�U	%���Ȭ(49��ګR�h���0��bN� j>��
��fjrd Gړ×�t����Noh���Ewhu'�no6wƃqo2f'�tf�DU+��$wf�N�k^I��rt5b�]52E�0Qd� �B��ţ9�/m�@h�-m�$c(8E<���C-8@�P����wR|jDGU�F�(t����gg7"S;ޠt�ٌC�$��v7���+�~�ZA�E�"^�\F��6�5Rn#1�S�G���4���]��%�h���*���H��t���]N%CVN(ʸ��P{����?��Ug�Y�^�gN�9���6wrkJ���� ql�D'�b wT%�W�ʇ�|����}$���|D�تI�V5s��.~���r6C�S���-'��t������K�_���d}�݃����aα�~��2/k�SY�l�KY\Ee�V�;�P�L.��E�N��V�Y���tą���p+<ϸ�U~�z����,�@��9{�������͙����	�ϩ����:�����ᖋ�>�z}$m7����KZ�������<���L���p��wO����~��#�?U�NU�� �2����-���Ig�l��C�!k{�^���ms�Z��{ef�ކ%~�,��w��P���O�_�r��.[�u��3�Z�u�xk�ե�*�U���(���ͫ{�u3J;�U���/-*�g�N�J[U���xM+l��:�B���y��4�"ޝG�0��4*VQP%����Է{�{��ٯJ���7����&�S?&M�f]�D�����2/��2y���gN�9y-����]_8PS>>й�>M��ۜ�[���K8m�}�{�Z���uz����o�k��׮������������o�s��:�?/���2�h\;����{wj�����&���|a��:@�����q.��G��)B���Ý�_U9vh�A�]�����(�X�g�h�)�"�?��35c�s��9X��c�e�r��Y��l�*�j�}�p�X� 9G:��c�0��3�����W��鰅k =|=�-r�ۆ�[g����P�Yz���b՞�[Q���.w�(Ī����[�"�)�q�!��5�M8�M���K�M�W�L�m0�u��#��Ćso�\Sk �dH�]�l�k|(��,Ͻ�;�%���4�X.m2�IY�>���=���YoЙڶH�N���8�I~�#���}�������������/�O蒄�~�m���������¦S�nx�-�(�݅���#���Y&�z����oݗt�@�u˕�#LƯ� ����+F�$�D�����X/��0��ef�����x�H9J����+VD�v8Z�5��a���X)���G	���E\��շ�s�#(-�S!��c�[K�o�L���c�~� ���[�y0�v����_���!���/���u�7f��B��W�����q�/H^B����3�=�n���y�M��F.7��ٹQY#OV;��{�>t=�V@��b���x�!�v��7�Q�-��C���n	w�j�����XҠQ.0m�����"���.� :��>ML"1�o�%	k��x��eH	C���9UÐ�Y]�H�.����9��YK�k�<>*.�U���Sⲗ�`�7;NX���ݙ��p�?�7�\oI��a�7@X�p,0b������tP��q���y���N��/k��uyPx$��d���V��!w�m�� �y[�9 �-V�<��c=�^�͕l��CG�m����ՙB�	oZkܱ#�<����yC`���柅��,�.�h�`A�C'3^��G�j-�]쬀�F���̆�(`3�����R:�7�p����RP@�M~>�y4�{i�{l� ���w�'�K��9[�}'Ҵ\Fd��~a�W4���G�7�(�"v�g�`U�Sub-���L�~�b?���Q>l��$Rĳ�=ܔL��pĶ����zcf���6K^
��Ia�"�R,|�4$)�.͌v��`�䭡�s�]���x���	�T�|�z�XD�E��ҭ싊W�;Q�N��'N
��gEm~n�j~��~Q�2�<[�npK�F9�M�x�{
)�H�Q,E�@RhIy@�*J�7���>\ �"��SԻu��e��Z��zb{���9�`��tb��q����IxOm�p��c�c�5AL�B	�;28*QLg��C$�%����_�=h:�3��!����^�"?�f�/�B!�+��+��~ܐT_�ӊe��l0��t��÷�nɉ�)�t-���]+�@�K�z�6�؋������p��cI+wi(��Q�,�uR��g��zet$��v�n+�ȵꑋ�QG뤣��r(Ҫ��T.��b�DY�1� �*T7�\��������k����o��pԱ��x�����L9�3��|0��:I�˒��7Ԁ�Bٷ��1��#Q�kjO�K�ojO5U{Jح��4}�v�˺GfG:��掩�s"K5�I���=�L��Ϝw+��0�#������گ�*����UTj��c�!h�t�!��p4t_�9T���:e�RS��ֳh���Z�~��H�h���j�ll-�uN\�Z�C��1�Ss��H,��&�^��#ɂ�{�Ŷ�i���>�,�Zq��p�G�P�qzƌc�8ƌc�8���3�1�3�1�3�1�3�1�3�1�3��`��;�I��2��Ɠ�n��k�FrXɟ��ݑ4�\{��Ç�e��T,��z�{��i�`�p�����	�O$��A$���<�x��KR�ʱ��Ky�!��":dK�IDb('����i}����ڱ��3u����!�)��	I���O��!���:Y��S-z���I����O��ݒ;���v�Pō���I6���>�\r�t0�n��:�Jĩ0)�_6'Y0}�1�P̋%���t�(����|���xv4ưZa0W�06/ޭ���0������H\g���R=��j����{��xfw;���h<���8�I=U}������u���R�� ���6�|	�{����$:WFP�������m�����ѭ����(�3P�F�{�����Þm3��H�~M�e�=�ъ0K��i�;�g��E����80&lc�6&lc���wĘ��	ۘ��	ۘ��	ۘ��	ۘ��	ۘ�?x�4x�>"����N�����;-R7ɒ��r=Փh��٢���G�����b0�R�x����غrn�%�O�]>�r������%����Mf]���t�F�g=�g��y���Y����*�y������7a��իFϋY8����,Y%��������7���`�D��)v�]ÉB�)�:s�f�u�:+6���l�X?�h�\9@~������i��0��w^,��bР�c��    ���~}Ծ�?d�Ws;�^�c�9)����B�U���������l�j�����*&���:t��ג�R�%˅Z�������L�V�&\������a8c�\Ě�'ڏ�x�x�z�?��.�lk���*�#�L.C��<��6�׽r}�����2���$�xѯs��+X�H��9�S��t_�%���dND�]��hI���V��ʌ���'�,Lś��/X��4��r�4y�P�?|��D)�Qw��l:�f�Ag�����J��ԕR���M�Y�:�},8��NA�<C%aE��#M�c���C���+�ߤV������f��^�ڒ���\�'^�y�62���Ж��~�w�ݮ=�N�����ZH��EB@f�&CN'5j��_ �^>�^a�k�ֆJ ��̡�w?������=Fz��U���<�ю(�-ҽ���s��ap�EQ{�??
 ��?Y�����0�Ⱥ����T-L�H�N}+pn�kgn���=J4�i�"wg��y�	�����k�h�'n�)	�?�E;g��C�c��]�&;��5z�����y����8�����<�D�M��I�n�����9{/B�ne.�$��+wqn]c�JL؉pB��k��+���Б���Q:f�rV+��An{NAñ֞/
�8�9�^�t�����Jd������,<j��q6km�\9�����]�T�����KR��"c�L9����@��^� �nX�Fd��s��*3�R�Am�}C��/�"%7�_t��q���[QhFR����Sfk�ѕ�&5>9U�GK��4����E	Q�$������CuK>�������w�����y����Y]=/ǽ�t2�����b�[/�u/��������i�_�	A)�寪��:��\I�v��c"�'��I�X������~Bb!�l�X�GR�<X��1㬇�7��J�4��9�%�L�����Ҹײ����[�G#�H�Vٽ��?`�Wʵ�����)됡y2����.c��!Gx��@8�W���}bj�ڽ��������$�6���	� .�XoL.��/=��ᵧsM��Vyz����T�bx)�&�.j�F1��2�z�U��ʳ����Tc��C�ޅ�w�:{�L�K�M~�u��k.�
ov�6�T�v��4X��F���l�Z��Z~r/�уs�Kp�/X�b�	���Ǣ�ʜ$�2�(�D%cN�7�:���.`|G��+�c!gq_���AEj��zB"o���pP�q�"���>���`�\K���S�~�'��
vΚ�Kf�c.�kv#��
$Jw��!��e7���K4�R�k�<\�E��ʢ8 ���v?{{���i��t
�~��?X�P�����=��t7 �������R�\��7���U;Kφ�D����î�iY�t�y xf���2���k�X��Y�8{�w���ݼ�"���8x���"��Y�	�DUy�*+�:γ��7�oc}:\$DP-:�&����Y� ���.H�T0�]�W0�$�4^�bA| H:�X�O�P���9�$���p���ܗș:8H�����pKU��8�( ?iX�8��}`�s7��պV#��}H6�?�q���I��d�$A�<�jp�ī���W�������4|=�Í�|؛��Q����?-��8��_Cs��?����)���`~�g�R��]��,��V�`��0N��!Eƀ��ӜGX�@�^y��8���zU�P��z����G�0	��P�s,{���zs�ŠK#z�����+�͹��+/����ʵ�?�=���ex��ѥ5t�s�ID�����B�1���R��;g����o�[���寷�('R�eT�(f%�l�*Yi��ʇx��9�!v�7	U {��>b(�m!^➦��L�b�qH���8�S�%�-%��J�A;F7{�H4�B�e��K���~���3,|���T�dh��x����A���:D}bf��+��I��	��'륛��$H�>W4ėnRK��4��#�z%���T�)�S�K�M��������~�B�?�"��N�ۯSI������>�JEۻ_o	��x���'αv����d`#*�p.u�0��ޠ�ƀ��j�:%kk%�h���M��C�\"<����ӪJH�$�O)s���+�O!��^|��9*�!\jWd���hV��v�V����4�ѕ�:�z�[]k#��� ��u��^Q��@��bKG�*�������$���=X� $������⦑�GH�_�Tn`���`�T%��P�س�Š�2�KmՁq,]M���=�u�-o�@ug�p:�Ⱦ��g�����&�@T�����0
�b�Ѝ.�O"��=z_�_Ed���m����^�쁻\ 9��q!֧l\Oe/��~�х��t���å����Lޅ��X���.`���!��G٘����u��8���^"8"+�a�\�I{]m=�ǳ)�u����z{��
D1M%�J�fYJ�".��>�����/�p�>Ȑ&�y�k"5�jt�+^\�[/��.|�S��b14k��T�ѥ�6�t�[O���c�'8�
�d�);�ٮ��ŲJ .e�N���w-x�^�,�,ͣ@���]#W���&���1$��kY�v�l�[����.�O�,�RIx� 9D��1>��0��T��I�h���{d���~��[ghI1������X��_t���Ά��d0(u�c�OBSg�^g4`8&9�� q�f+���-lq4��o�kw'�?�����wE.Yg6�`��l��o\*�ݚg�tNx'�'�
�~ő.
��~ִ�[-�T��س������b`�-82t�<З�g-@!���9ě��ف#,�Y��z=�8ⅴ��[:A����#����n�AB��	�n��~bRU������q.��CE�Y�S9�`��r�����`�Y���0�x`�$eM�%����ϾW���Tc�)-�p����`��-٘GlbӮb+M{stwvЖG�>ũ#w=K2�4���f���k�~���B�w�!(���������z�r�r�=�3逶��Lǯc��X��~t�TK�.���^�������xe\^����z�MЬ�Ky���S�����j���N��h�I�'�Q�Wk�k(�[��cĦ�����v�PoT潫V��u�UʂRm8�dݰ�O
 �8���6|~�nKn?�Y
<��t����^����c�}\lk�,�3?hԿH�b3.F��`��n�=�-w?�
��̩'�8!��߼Rh�ͺ"E�x#�п��RӭN1̞{6���������$bi�Źo��h��)-\5����d��c��'Ͳ���ޚS�z6y�jsj�[=�=r��xo�G�n���zIzl��K̪��l?�f3�>��QWQl�c��� �����r��@725*<�G���lqoD�������|��ߟ�������������'寵�öi�m�xl���S����m���ָl�˶J51.�����q���q���q���q����-�e�bse���dr����]��tjr��\�&���ejr��\��~\����2��r�ڟF2�=nK���d3��f�=&&��Igjҙ�t�&��Ig*=H&��Igjҙ�t�&��IgzB:S�h2��`��{hҙ��8g��Lx�	�3�q&<΄Ǚ�8g��Lx�	�3�q&<΄Ǚ�8g��Lx�	�3�q&<΄Ǚ�4c��Lx�	�3M��ָl��ָl��ָl��ָl��ָl��ָl��ָl�|�5.[��]��k|��[ԁ������������}��V�(�򏖧(U!���M)JG�q���;-���^��S���ܺwF^����8#�a�U.�?L��@H�J�?y��eo�O\9�,3~}����׏��l��{%�ν�^��=��&���NK������^wփ�w�]v�mF.�YK{����GE�Pq��	�^�!�������Z�� ��    ����iq�
��r@ɚ� �R6W|��n1�q��O1�4D���b�a0�8�M�ױ�:.��+w;�o�q�(ٗ=�+g�f�;�?���f����w2hL�6@{צ��b���c�����~}�,����$��ҝ���&�a�qn��a!Ū�py����D�뭳�6���[_'�D��A��y-i/� ��|ﰥ|ngb~�w����Vs剝�ބ+m�p��X�5l�A<_8A �	Z��Gs��q>^^���.�$�:يSM}���M�!n|�Q�|���r}�7���8Y��]�8��u�Wo�+|D��S��D	�:zRR<ѷw}�c�c`"�����0i���=S�f~���6��bC]����e���OL4 �r|u�-3K ���}�� �9�3K��+��:�?�2����$���x�
��>
X�z4�E��#G5���^[��@��\�E�ԝL�e?)�G>=���j��QΎ"o����<���.@����#����m���(&r���&i:�����KW���������xa=�|���G_?��H)�o��j�� 8H�ƞ�pQ���"ف�ԛ+.j`�����XKo�8��a4(7����0)�FV���=+\��E�^�u��G�]l�a�w�Z�M�d���$^'z�Vt,�>}�6q��Z�:�P���-�)�y�]d�w�b��^��\��*�:dr`0�h6�����a�WhfB;�Cf�g�� �C����T�~���.]��c�c'k|���M�`�6r��f6�+�m��#�$%9��%��.	���t����]��r�p"a�_��[m���Q�^�V%��	u��!��u{�/+�ʸ}S�9>u@kD	�����=���^��ݢS4c�F�s$U�ԵT�ђI�  ��3�=iA�hIk '^���>�A?*"��FQ~���:�x��#�'ϭ�O^�����,�	�QĿ�+�k��o��L��ԸΎhT���^�%s��)F@~4+>���[��_�ݒ���&�����b|��9~%�B?4���;�� uڂp�Y�i�|\���-�c�3�^��$��F��r_�xǏ>��Ax�z:�&h�3[��&ڧX�"X �$[I���,n�����u��,]7 )*��q��B���+�|!ZY���n����2���x�A�^W�൳}�F���3O$_�q}�`C͌*�l�R�τ!�z�J�^rgx�;��JM��1�*}<k��JF���z����ُAƳ@��V;�@�����,����Y	R��!�PD~��ic��r��(���z
��ž����^���q������X+Ao����bu^y���	H=�͠Q���Rk���4u�=���׹������N�o1B)H�,��I���c�;+�$����t���D��� h����ƸV/��v:�oHE�G�c�\�lS!�A������yA�lw���mH L>���� "4�G���i&�+s�nF`��^����=�)?�.�w@E�ȁ
-�*G_�.�ņ��	M�,��$�,���l1N�Yݸ���[|	����"r�6�@(\�B,��sr��\o���w�X�̅͞N�ܧ��x��+=P���6�us�+��Y����� b��8W� #4�� 	���&捠&��.fF�w��V�~��0��wt�l宽����;�"K,Y8��
�����fo� i�c~��5e�8�<��u�F��&Q2���t��@� fD�A]y�_��"֚�여SИ�7b��g&�p%K�Q̯��;�y��
���Pf��ɥ�r�X���pN��NK�<����qϤ/�0���1�pH]ik���T�X`&��9�(W�3�k��u��SOjm2�I:;ӏ�$.�H���w��v��i���*htSd��2�b�L�F����#�U++"���\%�L�E�1�D Կ��)�k�����G��3 n~I�0C7ԌB§<��%�s����C�q��D�y�Nn�,���"9�+χ���}^e�x�H��Vx$�]��"o��V��r��b���eE�F�L|�nao%-��?q�#{�kA�Nq��
C+��g6ND��Q���z�h�"V�`�+fi����y�7q�/(�,��占�H���vGq�É�	���k�9\��M]_�M�t���x��A~w��o��O���r�o�������Y��D�9�yk@w�SaؐV!u��Oc�KV��K�W�W�|�	��pA�e��^SLF��F��*0��eͰPA�+�|��*?�&������Į:�df�?���[K!E�D��y��*�oK��qݺ	;vY�a�$����1C���-&4<K�_��1�
$˭(��t��%/T�@�8ڻ_��<�l����]>{��w��}�
� P�,)�˝��d��&�2=���v�/N�%�r�8�t��_��lQ��x$9	�#�F�����������"1�8��a��Y,`��Ӄ� ��:�L�;�	�ۭ� $0G��D���#f�m���Z\e�*R��$ҋ��/��X�����U-q!t+ʲ�]9D��󉥃&z�4����-!��8~���t�����Hg/!����]�-`߆��#@H*��l5�jJ��t����w�XQԩ/�P*<��0*!���Fd�d_FD�䪜,�p�TH�9��l��(�M���%����ϕ|_⠂��v�5��Mp`T�S����y��;�R����a<=�q�p��R��
���!����%G�6�%n��	�I�â���dh2��涸��^ S�&�%�1�8�d8�Ĕ'#��K�Rl4˂<�+������38)p"��B�0��X���-�Jд'�h��&��5]�D�y�ID�0GL��kI����"��=_�=�7U��C�� ��Jw�&�s�fn�&#���^;�y���/ف��3Q��]���s��Op<��sK\�d�W����8�<5�$O��"���h�v���l���2�U�P2�H��p ���!�&pa<"�ޔ��<�)���^�G�Ej�x��P`  h�E%�,N��ڒ=ƨ)�_��\�����k]~������_�|b}g����z����w�3�M��x��1Ɲ h�%h��z�'-�q�j�r�:FE5�+et3�����;h��$�;�V!�ׁ �݆�^u�d@_�?Htt
�"��t�2&Ŗ�~�
?��Wz���hfO;�]\�G��j�a���{�Τ?MF�J7J�%l�K�*P�>��dZjJ�9��ij@M�d@M�d@M�d@M�T�oj2�&j�g�2�&j2�&j2�&jr�ɀ��ɀ��ɀ��ɀ��ɀ��ɀ��ɀ��ɀ��ɀ���I�����z�QM�Ys$�&�)�������VfgJ��ʀLZ7�q��L��2 �2 �2 �2 S��� ������ ��� ��� ���5@&d2@&d2@&d2@&d2@&d2@&d2@&d2@&d2@&d:�4l�$�@������3�wǣӐ����8c�N	����:�ۼ�~��Ǵ&�D���(�\�2:�"���.#�y�H	�o��ő�*Q-��J�nӀ%l���ٱ��z�ۺJZ�z:�<�h(�k[�(l�4LT��I.�T��	�*�xCh+l4e�jvM�{<Ǘ�0��wæ5؞'��_s���[�+��p�w>`��i�F��i�|�r�j�Fg\Aݚ=\:L�ݯ#�5��{���=ZS�w>'B�Dw$���A1��/�&�	����G����קh���$YIIA%��Lr�#k
u�Χ$ћB�o��m'�w>e�Z��b���fy����}�T��i@�l�������m�]p����=ë�e%��
��$Ŧ��hӠV���µ֡R}��+zKh�o/��ԙ��|����[B�bӇ�l���w���a}��k�v    �{�ΈbHM����v����$XL�`������8�B�	��^���0�'���Ԅ*���aV����y?��yxӨf��6��	�а���J(���ՃX���4ʚ�6���Sik�Dpkl��56�@��R��X�樏ߖ�����^i�o�M�\��삶o`T9��|�� ���5�9��V�/s⾏ }�Bs�wM ? _��'��I�Y �/� �K��L�m���I�S�s4,��ճ��%�x��������aVX|2���3�oC�F�'�����R'���O�)�q̾��J�����`�����>'�g
x�iBP+�@��# ���H�Z��l*��C������=�y�F;�xt�:8|h[�m���z2�Bpͣ"+��V�YF�h��%̈́]%��ȋ��b�mD_0q�v��l�^�aQ�n�L|L�
(��*��mbaHY:�$����Қ��!˸���9&���-���F�}���ɿP5�1�L�îNj�e�-Kj���t'�Hjk&���v�%��r�X��6��~������^r�I�l��f:�mY
�+gE�\���@��O�<��W���ΠW�@�����l8���ɨ/��1Fe۴?0�6�8`�+4�ԍW�UW���3�Ѽ>��d(h��i�h���K���v5F�Y�ߙN��/<�(Q6���0����{x�Ndet��c8�:�:l����7G�r������=�'Â�OAlՄ�QQ9��N��������S�'��9*A�ׁ-��R�'8�d}��NQT�i}�#At�wQ.!��Z���y�{}�W'�]����?�m�Ǔ��H���,%ħ�2J�72�=�x�W4%�{�a�c���}lI������M(K�L�lr0�M42C*�.�`uA�h�zTDw�2���]a�)*�\��_x֎���	���L����NR�_��ER^��FgHb�1?��Q�_�Af[�}�'a�G���c�ޠ36��C�#�C�c۞~�{��m�1�G4��A���X\�M�Q�q�}�l���"v7p(x��
{���&SZ���[�Q�;�ԴKd�[1t��W�qv�r����R��K!-drX�o��k0���9HcY��OKh,��Y_>�n)e�,c��&HP�[��2���E���)-~����/U��s*�"I|��C�F3w��'s^��<J���9RRr�w��Ewxѵ�`���7s�����	e�aJ���AS��ƶ�Ic�'O����Âu�R��'>6r�SQN	{	�@;��x^��,Dy�h���F�җ+gU7�����(��t!m|r�'~�.
����@��.4�Ί�7���W0����n��02$�k̥ng�s݁(<Ż�H�r�+�^~m�����ej�_g�����	{��6�� �d��M�*����{~I�_�b��9"f�aX4er��͎n��-���:�@���@HB~mÅ��Ea�v�[���O����{���L"�tll�9�Q���JD	iY9p�w?�����|���`��a'їA~+�������r[Y}k�F�Y���ž�0a��~��S�g��-�I9>�@R��7V�`�#�Hۥ�����Q ��0�u�ڻ���?�޹"��-П��?��Gx!u]�L����=�
=jRx�$XSf��DF)�lf��SNd��e2���?p˫��7i~]���u��Q�K��Ur� /�֥g�*䥌��/����Ѱ�0ꇭ�
ܲ
�k������`ܙLF�ɤL�KQ��~���`�j��~�س]��i=���jsL�Ej�6����f��Oe@l��'3{ؙ����ӓ�mW�޺����>�][М�S��4�mWc�ݝ����=��R �i�������)Ѩ�����3�����䛞����ztͪO��Ӣ��۩�.#b�(�.rA7_��2�4[�] �[���Fd�Vkd6n�@�//��4_~�?���)�]-k�F�4�_F}[J�oUW}AI����q��������X�RD����$�o#[}+���S�
s>�3%�����t�<�l�y�Y|O��Y=ӄ6��<0�F�'�+vؤ�?�wz��`(0����Z��j�V#�~�Rk����e|����0>��J_�eЈ��l�����8e�~�+����?�2�d�������������~_��3U�DL�~M"2����3olNٷg�IQY�`��od^#���ȼF�}�����{�YߧP���e��w�����D��I��84����G�y�����I><��a�I��Q���Q���:+Տ��h�?��x�{l�b�@�A�&�/%L��L5�R¥�y'�~��y�]�%:��E�kouu����t�K�ʤ؇U�-�j�&�n9��j��=$��˪�V���[T*.��i�. {�$͉���e�^+V��j����Ϊ�����VʔG_��i�R��n!h�u��(�z!h���!	�A����b<���k���P1.*}����k��T��-B`���ڬe�9gM1Ҳ��Gg����gBOq}�S���^��������Y����j�'Q�&.��zrAT����zzATQP��&jSQ�j�DM��QR�l�LR�P�P��>[r픚�@���1�謠��5:�|]�jtZz�N��:�Fg�@'��5:��}�f��=�DJ�}51/��NbEM�#
b2Uשּy\ALsuṂ
b毋|M��bR��kb��lE4ׄ�a���,�������@4�ug�Qg<��2��.���#{_�b��2;�e�]n�^�����	SQ������)�YƊjT��6Tt�mU�T���pY�_M��O�ĥu|]K���"��Z�ZԭյTg��:�eG����
I��l�pcu�ʍ�Wn��:��S^U�Ԙ���
�� Gi�U**���R�zԪE(����R�j���Ue�$/9�aٞ�r�I9·���j�t<���ʔ�Qq*@���[�H���%����~i|F�WEB�k_6�:i�oҎӤ�I���� 2��r��M��-���>�q|���8��Q��¯!W�����E��Z���M�'��M���/ڵ �	u�t�����#��DhɃ@��e�n�
O�v|m8����h������2��f��qe�'��+�g�Ag�۽~��2q1q1q1q1q��!.FX4¢��h�E#,a������'��JS�|?��M�I9+���D�dz�E�I̶q�*_��U��[c�UM�;I�΂��K� ����PT<��/�g�U�$0�4��!��b����n�I�f ��K�@�����@+�U��D8R��9��[�8�s�Ʀ��At"иg�ȸY��D9�..�ߞ,�� �ǣ���6�4n\>�0X�ʧ����>=�q��ʍ%�t ����d�:���W�j@wKp�
����8B��%�����-�Vcn�z~�#Y��՞���Զ��lJS`ښHڃ���'Dv/p"�d#���l8��ƣao�8a"M���44��&��D�HCih"M���44��'F=����ѐ\�մՍ��y�Z��\m�j#W����F�6r��)WW����e�"�7`�W*�%���4��g�����D�έ{7pO��o�*����C|���`����C�ztO^��ݕs����חO����;�t�����Lwֳg�A�?���+��mp�L)���]�Jj1N����qv����go�xK�u�����x����*���r����!T����f���8��'?q;��.��`��M��[+�׍Ļ�G��ٸ1~�|�R.
����7��=-� L���IG"�A����6����}���p�n��+g	7T����[�
��,�9t}�&�a�qn�ǅ����u�8:/��a��l�j���u�#B����kI{�yݒ�����_o�ݦhO��\�_�ê݄+b���� �5�;)�'�=A@�D��|+�)r�A�Ɵew�upv��V�jꫤ�,�/C��<    ��6;�v5���m�%��)��\���/�՛d�v�*�<�ZI�5V��'%�Q{�7>���G����v�ݤ��'�,Lś��/Xw���Z���+��`�������`S�o��5���g��xM0D�.<�t%�/�uB�j�I�c�W9�2�2�P�'�B}�O��G�Z'��vmM�u�s�d��������$�7�}�e�7�����e�>\��)���?����e��]��F/��M^r�뫤�����B��j��^Ϫy���4N���(��Zd�&լ�z��]����b\��@>(~j��uk%�۩o�tqk�������e�%p���*)E}(��kP�ɦ��'V�NfNA��5��|R]Zks�Li�?�h�uJ����'���@]�����Y�t�v_ԖI�ɤ
ɔ��B��3��{�:�TNw4�����'�2<,+�}�b��$9H�I���ŗJ��R�Jh���_|�{_�CU�6���|��v�U�\躝*�Z�k��!.,�^�:�n_��M��Hk�>���j8S5���љf��B듨���)��^�T]�\
��2�m���6#���X��d9E1�\KMUR��(�N�(�l�^+Y�g�B�/Ṉ*���͆��d<j��ͺ�\��]yi�b���@}��?�2S�0+C�yM'R�Xd`b��"�Ȁ)2`��"���GSd �]���Z�V�{S�@e�jL�tg�Ag�vG�29�L,��%b5.A�>DF֒���������3>1����3��>��b&��I�eRk��Z&��I�eRk}��d�Ksr�=�{��x8�+��ȳ�f�ǻ���"%��V�aŚ�I�e��M�	�7a�&߄�0|�o��M�Ioe�j#W����F�6ru+r5S��#q���p���[��DlUܭY[�͋��NK-�G�ش�����mD��2]ii���-���M�eRo�~���������N�;�SO�~o:�_Ј쵧��@�.�;�e�3��ǻ����Aa4�}�䥭�I
}�.D�y�M�:s}:�(�`�k��Q꒝]%�,�q�M.���Z����(�oc[�9���2T���+���QG�!�ִ��jB���$vj�a�x���S�(�(5,J�H)퐉����iJ<�×��V���=y��[��1���C1v��ʓ dȳ��ez��w�D���?�j�P&��D��p.y�U�6^5"<qw�/_�G�g7��K�4�������������`��=z �>sI��wGeZ����Qxu ����x�3
��J_p������� 2K���+�d5�ȅ�QOb��IB�:�`�[T�l72�Yç�{�k��g	}����C5�F���C�	��np~ܦ v�r\	+C�Wϭuy�?H�G`i� � ��pDǺE<�ݯ1ʴ�/�������F�p��Z�ZUx�"Hd�MM7z̩�D��#�h��}�q=��@A�b'����_�%�&
(*�[�bK��1��+L�Y �Ѻ����"ж=z�tYEO4���"h�x]�a��vѹ�t�̨��aV"�T
�sՆ�.nB�d����
�RAa3h)rxe`:KZk�BS�	z<��Tu���&H�&i�a��ep���W("��`j"�ĴJd�a{�p�&9��1�	6�<�2#9RJ��~��-+��Q��J1�bL��$��^N�À_�w���z��/ȜA������6zv�Ð���)0z�"'��H4��Lج$�o
\Sg��
�sˡĢo1�KA>�Tc�J��b\y �c�V�lP_vg`�:�a�8|��6��S�״7������/���ƒ1r���y��/iM�<�ћ9�X�7� �$���ȉ�����;�7%k)H�ܒ�*�
�&�-����dȒ��ljxb������ӽ���s�t�� �Rꗝ��V��C�v��Ų[�XXzŻ�`��6N�{��D�"Я�;����ERlA�>��.���YH�(�⩝[0�������D	���H��GL݅W�b�#AU�\yH%�XzKߕw��S���݄�!b��k�Í��]�V1�����Ek��Ѱ6;
;�Z���/^�v����Bo3�ɾ#�Ru�8���߲�Ce��2]Ӟ�R�+"��w�ziQ,�
?W^����F|Y&�0-Ꮅ�u�"u�r?�qM2�\�`����O<�-�h�&��z���ޑ>O�X�>5����r�\A"�U�&�O��pN�V�C�D9�]��u�u�˗J�]0j��_z��aN$�1>,b��~���oX>B�-�� ��ޞ+��qt���$3�2ҍ��t�HZ�(R�Q"�`L7_d�����%7�
����6�u����Q���>�4��gS��|��$�/�%�{*è����1��ჿU�����#�˸1��T�{�Α����N��v��vF�Ik�[�|�Ѻn|���/9��a�=�1�y�������Rˤ/C�B	F[�^dHv���8�����֓ �3�!*>��K�:Jn<��9?�ɛ��)��D_0��O���(�wMP�?"��`�Υ�J��h��InPޢ�9�y��"���U9����ˁ��dHxPJ�_��q�R"����d����1��yf���BR����?:-�uį]_)vr=e��'�n�Ur�=��`|�iN��g��=c���g����ޘi�pW�Zr���!ɚ�#�o ��ՙ�Xw���^_��-���g�#v`ӆK����a{��D�a՘�'��D�y�Vry��ȏ;Lg�ۨo��G�d�Ӻ􂕷�]��l�Ȫ?�	d�a���n	�Il�JÝd�t& �إ�&�[9�#�+������� �a,
�z���M+�\$8O��0o�@����������eE���C�nB�xA�2�E&�"�f�A���R�@�ͽ���.��W�[��}��7N�"Q����R<G;(zf8�k�̫�A�p��|��H��Co�7w�K���
��x*�#>������&�,��%�Q9�&�C�Y�X��Gؘ�G�OH�p]z9���\��i;�O˔{S+dDκ�Er�y�N'`�Ljn��E�"Jb'ɦ�,4���ڢ]b��_v����;�L���k���ug�~g4�5M�L���A��z��Q�g�^�gOz}݂�ު0��,��Zj��+���=�2�0�6�1���0C�[43�U1A��7��c�h�(��%#2�ݖYlf�d�V4nM��bP�s�M�����F���q7u�f{�d#͚��RC�3�K���e��ƛ7^*����M��� ���d�&l:�U�c($m%���C�~"���3?;�\���]�O����ݵ� ��h�1ú����\0������L�,>�ڞ]�j�;K}�{n)K�r�۱��Es<�ܖ,򂾛7��z��^6����6��.��B^�M��2��?���8 ��| bsu$JM���|��:�8:����#�/$�#|	�#��@�q�Cs�Q^�[�v<��߸�A�m��n���1�uBp@��~�#Υ~����G����8�>I�5���;-�=H�l���;А�cϊ�S����"��M�F�Ռw��2:�C�
v^Ϲr�E��j�C��7�H�q�'�r�
G��%�il�]초�k>-h�uF�oD-/�6pԼ���m����m����m�����-�������D�N�G0c����{c����ȑ<j���dG��Ty3�2۲͡7����n�YB�O?	I�����������D"S�URݵ$��ݯ@*\LZh�k����&���!�XaX��9�4�2U!���[���"�V��`�Ƿ��j���	~S8��.8c�]�g,��a�<JHlAbA�$K�ʝ���h��P�|V;�ω���b]:����d�J���Լq5]��5�`:��}p�yρ�YA�4!�e��i+��D�ZM�c�"
�ߥ<�4�z��Yc�(r��&�I�V�A��L��������g�8켒�#&�aۺŷH��Z���T�+_Ju�-�&Ѡ)��$���J=�    ���X�$!�b�+�2݉��D`�!���)���b
T5b�t9h���d�k�5�T:?���ߓpa!�,wi��6�a��^�yÌۻ�Vt)�5G5)Q~D�g�Q�gjq9׃~{+nH�갊�q-uH���8[�ȩ�B����Щ(����T�����˛c�)>+U�D�X�b ���d:�����ڻ�y�n$�]
Y��b8�N}?Ȣ���84s3���J[-a|pwm)M������$�Y�|��(}4r�K!̹�NeNA&ڌ��&��R���N�D�\����(Ә\7I㖖*�4�/bZLIb`ZwR�cb(�4����x�h�1c�լ�B�i<�͗�S|�V�8��c�c�,��3���c;ɡ�H��|V�*b�A	�"�\z�o_>y���o_�H��.�-]����T��.f�rc��#j�e����;(��_�@#��y�D�k��Q{M�[j���C`�}�^9���q
{)nS$+˷�?�}�8��d�?��r��������S2��F7e�dÙ�^	�
nGc�x.(��ӉQ�*�y�}3��zuE"���7jA�L�=��Q`h�J"�z�i�"�`}�t�L���g&���ierZ��V&���ierZ��iՖC1�M49�>��NJ���xm��w���Ә�/m��Z�ϕL�7�������qȽ�Y�m����5�$S��¼'�4GX�^���k��՚�Eϗ���G������ե�f���H/S+.&Ϳ�v�t%Ο�<?��}J}>�j���i��ӢW�5�N&oY�)�tӵ=9,��t6�wz�~lR����cbr4П��119&&��䘘�cbrLL���119���&&��䘘�s�[��䘘�cbrLL�����br���x_���x_���x_�h�/��b�/��b�/��b�/��b�/��b�/��b�/��b�/���T�I,�j�uD0X��A�9����j����k�O�%G+˟����Ӟȟ�7��L��/����ǒ?M�g'J˟6�����z���<�8���]�4���{C�	\/�~:�������]���[�X�Rb�~Ek5K�賌3�8�M�\+Vsa�Ëހ�v�C�`��
�����-rÔ���~�'��mr�=����*`>M\�8�t�̸��tI#}�^<�|��BmӽJڝ��Yw��9��(�soT�O��u�������:��T~V�d5�@bs˟AQ(ά,�eTqrz/��l0��Î����h��6(��Lt�gT4����֗�v��hY����\(���$2J3���#D�H�%$�L}��m��M�#�A5E�&�'�
f��5���P����H����L��e`�2M�%55K���I)�?��!����zN�g�Rx�@��n�>�t������C4��H	�'(���H����BN�,����T�R�70��P�?>�_QQHRI��.:�^b ��ѧ�*��Hy1���O�l�~���3�`���}��b�R�����1���cm������$/�����u�F���e/s ~A����S#�n�kOk�I^���'�2Xl�0.���;q�p�He-[.\]v8ȍ���N/��ix�3<ʅJ�$�������o@����q��61-؃�p�H�"�(�!k�3C���㳞��L���!W�derP�؈񡦮���tJK���ރ�㐥��',��{�,*?���p'm���Y��o '�p,�#�q =7'�p1�wۻ�WH+���~Y�����HV{VZtz�QE���Ƌ�!w�>� \m�=Q��M*�iH��	6��;�*�&�T}�-ˊ����H\��nK#7^ ���f�F"&��Q��A2"��;��� ��1�����ʀ]�����c}�[.�?��7��f��fl[���eT����v�\)��9[�u�Q)�'I��D�ޯh��}'1L)�f��-@Y඼\8\�a>[�_��Q8�АFL�8�4���kwe������7�p��#x���/����P�om�����OBhl+l��(���?���kCc�
�u�%�`SC|D�E��
�c�wq�K鉣m��Rl~n�Se��Tx�ED�����΀�\�F���G�>!�$�,�E���hie�Pj�`K`�C��Z"v%`b�]x�nF]��Cʓ:*A� �1BF����^���R�,B������(�Dϔ�ΐ=2j�z�;"hW�%.wd~�Ih���������_�ѥ��ի�T�:K'. �Ў�M����^�qC�F'���փpY�Ե!� �9�8
�I��W ���܀&���p��賞Ğ�$n�W����F�T�@&w����+���Q�=h�h,�_�:e�猶�!H�N��Ykd���}_Q]v�rF,�������� vl+�0�\��+�;ɲeu�A�v��^0��8��H>�6�������[ۛ�,;'�y	�aU�qX�h{��4�+�r%���	�5uP�����-6��QK����Ͼ�����j蔲q�vqk��(+����vu�W2��ѽ�(=U�ZU-k�av�O�D<A��i����z	�ܴ�+&׼��w���{������hH3�������ӂ��ԼM���&��TW�����l�@[г��6Tmyu���gG�	�QE\ d]\�N����	�+�e���7�1/�zOv��?�L&�i.����������p�U�>��FF�4¦6��i��v�ͳ3#la���3{����%�L�<<sX ��91�0��Ƈ�R�a5>�éڂ��NRK��1p�b����\���r�Ak��Ak��Ak��Ak��Z�=����p8e��N��������MI�����m efmv�/�#'f� ��$�;��;��;��;��;��|�v�A�*���j���ڇ=��X�j��f(��эA�%��Į�����g��Al_�|�\���l�טV$���SFq������(o�����}]��(oW��/�n�ޭ��O���T�1+��
���!�����*u�b��,8���ˇ"M���k��^gНL�c��db���̒O����C 5M�#�i�/�cD���jB`4M�����nf�����w�C����I�.��p�^�,dȤ��i�)�fA���,���`�]� ���y��Rj�v�zۆi��6�
~���;��W�E�T��A'^Ee5��PёF4F���\i�'��t�� n���6{PpK����P/����.�#�m7  �A[�oJ�c��u(m������*S����+��[�����G�ɧKn��K{8�Mf�i�/�ӕY���p�O�U7B��Fs2��
{�=^]�w[�x�&�7��(;��pV�)�4�9 Y�ii�tY�zt�[�o�`�[�&^��d��-����o\Pg��(�67���Eh�Y9p��������0��W)ǯ�8�^2c�x�p�__���?d�W �`�+�pP:�[ǣ��b�x�K)�������9۬�.o}=�
ØBB����kI{�yݒ��ER�(�S�m�CEsX��p�C�\`��=`�=� �{��h�g�B�̽WD���:8;�d+N5�U�GVf��q�\�E]�B���c��yƔB\'�o�:_��7�
>��Z�<�ZI�����̉���ӛ��GӇ6]�i��*�ܳ0o���`ݫԿ�]����e���OL4P���F�y����ݛNB����<u�|!�zV�Or�r0g~e>�zOE�7�Hoe�x@@m�C��8ʵR�fL�
y@.����'�OVЗ�����20��8`ā�ā�̞v��~w������ǭH�(�lx#;�v�h�x���!ɔ����ڙ�������`�e>-���@�G]!�A�-�	����^j0}��waΘ��;��>����?��I��6,���iۆ�5<;�
ۼ	�����p�צ?;�ѠǕ"~�aR�[�/ICl_�zK��d\�/M�|iRʗ�Rkfi�{sj/S��DcK���L��Gk��G�b&�1�J&�j�UQ=�$�����(Z���    8D+.�˅�"�t2hQU$��U�C��r�_?y��K.=Gt��4�K"��O��R��ҁ��Q����%�m�n���q1�>�˨7�=�Aݣ<u�jߺT*����B҄���-;�0�M;�Ѱ����q�;�X���sL�c���iҗ��1��O����!&�e(�jM�5�i�'�q1���� ���A~A.�Y�e�-%��hw$Bk��\�4K��x0.!��~�'~0�T�2
�v�6��=��O�����<c�#���� �={ԟ�-��R�+�i@��KN����ֱm�i�'9QZ8�����/�oGY�b�Q�O�h6w@�=>rw���F��������Jm}u	�e�$O�k��<��ٚ�\�{Ph�=�u���ѱLh�	�5��&4ׄ��\�kBsMh�	���Cs?�]��\[~��%����t��qw�V�o5el:.���ma����4m`:3vc0vc0vc0vc0vc0vc���ng��&-���yWUZ�8וk���Zm��3�U�Y������Đfl�����Y��P��*��y8��ֽ�O?� ��1�?Mm�,��Cs�G��!�*�4ӦsJ�����P����;�R-���,��>�}Ɩ�:����\��̶;��߷EMhDHbC�sh	ۅ����ܘʟ"
n4���l83�Rϥ�������w�0��Rf�]��˝�)�luv&ϿԮQ�G~ـ,A(��K-Jr�I=M32��*�B���Ȓ}E)�$t�ZN]u�L��h� ��ub9
adɨ�h��?�'�w���"Y��Ő��Ţ���xr�xðA	u��o� �)-�l���uB�=N2��Ѭۅ:]�?�\����1-z�Y���^�'d�[��@�
�~]�P�3|��_m1d���N��n�F�s�e5�#�z3�����lY�E� �������Q��!H,�����V�AuX������ŻU�kL�:��p��u��^�����T���ݮ�L�,^pK����U =0=-표�g���	وE�j���8U�(�$X�%F$T�r1�����ȍ��Rpo��!��DA�P��������l	ל(c����M�-��I���+6u��F�����lE>�����t�X�̦���u��V��6Њ��aw�7�9��<6ae���$[���+&4���Ɉ��+�ڃYo0K���y��h�9ÓYj��B���+���2;�ZHD��59Jo�1~C�{���{Y�Z�;����,��eX�aY)��
�]�w�"�R�L�	�M�O:٠�=d��d��}���a���b�$X�t�b�M6��l��J����q$�iW:��&�K��r
B;0�qB+ŉ�%�/5bƲ��$�ID�2B��C(�N3���1�Sa'�y����L=*�byu(��Hb���З�ȀF42`k2����:�y�%?\&��E�bu��x��:���Y�X��H�L�q���i�ˁ�ŲD8��N�h��墉Z��'�{��)��2AV&"��3�M�� 3d&��D��2Af"�L�� ��#�R�rw6c��/�&�L{�ӈ+SI_D�x�\r& �^&ݤ��>��T�Ɠ����8��0�5��X������vN���ux`�y�08���U#}^G����E >I��k���-]���6 �^ _Ý���A���
�A�������c�ك�g�3z�{�Jc�
�,#�0�Y�P����tm�XA���R�Iq뻟�ˢ��Q��g�7��XK�]�<���X��+��W{�'
=�Qٯ��.�|�yV.B�<�d9���{�?{���ȑ��k~�������DI��������Aw^$<H�H��tR��J������z���B���Eջ�?�_2�3s7���`����"�t��;�}�!0�J�����o�V�X�㹐�+m�P_�TG�<i��mȀ�M|a���Y���k�x�W��l�t
A��'�~a%X�Ng��D����o?��tGa*�l�}d�y���ͱDڊ�fs6����Г�7&�XyRtg�+y�I��)�n�@W�M����N;�3Av�o�y�z�Y�j����<$s)0�fHڷL���կ:����wZ��I>�&%��h�X��0 ��!'EmK!c�*�ȇ�ޏ�>�u�%0�"�AD�*Uj"E՗�D_�~do:y�Y1�ȓ'���|C��%��J�m�i��4�%�}�A����"��J�YJ�Z�∅�&�L��X|�Z�J�N|�Jw��}�ڈݍ�U�(i�����M���k	�7ŕ�-�������ʕ�:߮V��m!�`���j0#����������e��ʸ�[ꏠ3L�ڸK��pvh��=�.�+/WI�x ^lտSYr|Sq�'�q�C���W֨i��70��݌^���~��#c&n���}�X��$`�eDj�YY|(�_���W�&�,���3rO���XM�����l����_����y��7�R�8?�l]��tE*Mɒ[��,����:Spe��u-UQ����  զMլL�nUl����$�%�.�4}�B��l<��9~�xg�ὸ����%(h��uބ{U:��R�E�m�d���w����I�����K�Ę\�ok��` p��MZe���5C^�1�f�M�^UQoݯ��wCy�4�}d���º-��+q#j���M�NI&i��:���k�����{������~��>.&����U��K�իϾ���0t��PI�%��aS��;WJ����u~�z�]�}^��q�z���f���Z��a�{t���Zі69�M��mrwi�=�֊4"�_�ջ��1 �5L8�f DIm��������ZҾ��{�E�kX��������ݹ��1ͭ��
�v�� yP�5��a ����� ��n�M�|��<�m�Cӳa�m2���^�%�.�a!�a!�a!�a!�a�'gX��}C��j��_>��-�}�[5�b���3K����iّ}�4x���͵&#��9���.�82�Z�E0�PCE0�PCE0�PCE�Ѕ$��(
w��֋��yHv�M���ߋ$�ు�
�E�:cT�QFU`T�QFU`T�QF�F����~#��-�c�2h�A��Zgږ�$�Ŕ�*���0v�W��X�����OY=]��5H�#�AfDP.>��~L.E-���{S�F�3r��퉛��{�'�@�<o�[��z��l���'��J�s�������Xqj��\�"�36_[88X�_ޥc�wq�������ls.���(��]��k���P�pK��)���`of�9_�F��|ٜ��s� t�b�F�Z�gb�T�@�ՠ�����Ra���"�jDI�.��R�QH_�7�
�`٨��=JK'b�f ;�R�ݤ2v�U1x�h����2����Z�c�B�q�S��ɲB���j��Bi�m�r+�$^��l5E����N�D���Tj��JB�ّ^ݿ��q�:�e7��^�[VHy�� /���K��\QQi�7�O
���M>��D2�Y�Y���6ij�l����Q����4�K���\Fs9�|05P�9��zI��u�ɦ+y�!$�Z��0�H�]�5���,�_���?��BWm�ō�A���#pZ���d\�yF�+?l�eG^b�_�;S����:$�ޜ�����%Hn�ںl�h�Jb�W���!ē�`ݍ��zk�x,[�KDb���V��$��|<+��Ż� ��0L�&�M�]a����o���a���d+��X@�
�[�$œ"��M��mY����8�֘����6���1�,8,A-y���n��&\���hbfsu\�ө�G�fZ��n%qsK�x�5VkP�M�6Qwh(4�?|�c&wcM��)��p�c&��1�3�H�D��!���H����Dpa�����q��v�#��7#�4 ��M�Y-��V$תRm��4]����p�U��z�3Z'6����^{�]�;�� ����    +�;}Q��C����p��[����F�4��?� .�A�>J����T��<{�\(�-p},1Ѽ��Ї|&���2�0��?��a���k �#O��[m�PjX�pjj����.�gX�2B��������5]��t ��q����(A�F�T�[=�=y�D�����m�;��X��"���_g@�_�*�������7ϯ�j���%Q�DD�H�2o�.��8���yge�$G�ox�eY���W��K�D~E�Z����zG���a��A���L��'�DZ�pl�}WO�]�+��:.�F�l�S����/�=��e-�}�D���@���-����q�۸��%tqfLӌ�&�5l�Y1'%�ꋍ�O����m�c)���R�	b���_�+���ٖ9!ܧ���(�/�`U��� 8��c��x���N_�?*���9��5E�8�IҼM�̒�a�U-K�M��=�j	��NOz��#�O��#�O�N͋�1i��YU�tó�8��#�H*�R�P��
J��UV�:���m��p���ai^�b�G��ۇ2�u��a4.͗�LG���>�r����(�:�Ō�]cI"���b��n�,p�/p�da��|�0a�G߀0�
�\���\q�Rwَ�Z� 9$B�/O ������؆��[����uk7�Y�-kK���#ph��T��EjY&h�k��Z�4�3a�$�4<�y�MS�Ÿ��Z���$e*�xK�D�Dh���b�`�19p0H�
�0+ʥ�F�dS�W�s ���A��ɒ��yJ2�ūW�7qKXII�E��D���n�� ��L'��֍:a��	��b�	;cŌ)[gi�kV����kL��tY�,�#��de�С��j�PR��Q'(A��o�v�ҿD4%�E���w�*4ɥ�|7iYoֱ�Ċ���yEL�J���/�頙R<�.0]��⽃N �X0�'�X�+�a��x[��u��#�*�:פcN42���X���u�hK�t���O��$_�-�ǚ��l���N|#1�3�q�1�<ƙ��xF8�g��c�y�3�q�1�<ƙ�8�g��c�>�<��<���}-���s��\D�>�s+འ�eD�aa�	�qȻ)��p!� �<��Y���*�`p�B��~ <)�Yr�WC�2�Ħ��f.����{��4nD�R�⇣��^�w������Iꢭ�w��=`oU�w���32ÑC'"W�޸q�=��!����+}Z�:�г��@K��(L]=b�-M,V�J��'�e��hw�`�^�vwg�wd�B�e���nF��>�a���v�CaߔVN��������?���H��<�8��0��<�8��0��<��y��s͓�q�>Y����6�w��r�y�葽�OaU2�g��6m(�z���1��8�݋��)�uV�d��
��Z|xW�٠���O����xVLJ�n��"ЖJf�A����l�W
C�m��G|���oge�2͓�:˙0�Nb �=��~i��뽒
���Jr��\;i�r�O�k��`��@o0n��B�d)�|��1o'G����sMxSi͕J��p�ʲ0����6��1G�;t��
k�܃��x�y�Vƫ���e���xki�J�ax��u�]��۹(�(s�0���f��W���� Xﬡό�Hg�g���+����:�a���+v�`��A~��g��A~��� xD'�k}��@�-�Y����_8����ƫ\��1_P�Q�d�(DE�wtx��kCj䤜�4�ʯ0ei,4��ƘI���{"�7?۔��H-��匬\`������[v��A��`�z`|�ݗ/��1�B��x-T��D�I~#�I�b&E2X�t�];���
̻M�la%�hh�->��B� Fv�X�$���8�e5�j,"��s�X��-���q#���M�zD��$��5]�x����m��:�K;�,Qj��9K����4�WT��J%�����QO�FBˤ����ބb�4�����oi7�t�.]̬}iY�,{�ߘ��T� Z�Y?6�"���$@�vKx90�|����BS�K(��'���"����0C�5��^� ��[�5��7ov�S�����V,��U�y��|}��o>���,�����^��񿿅���|�ZC��[-��vF��k��+���S[:E��q����x��O:IB����U�ݲV����s�#�O�q���l	i���ڗT��X_n���Vk/�u�Z�@��ֽ�X�^��I�Z)}�V���u��i�����P��]��;�هӏ�uM������[uM%�v�5�+Z���?�R�4ޱm]�����=����)V�)J��I�Y�<�����V���� �ͪ#��-��Xc�p��P?ER0T��.���^ZQ�K��Ќ �Q���T�c��J_?�����~�f���m2�	9Xc����ӗ�YF�/�p�wG��q�4h��_�^��N����]�9/V�*�����>I�c�@�-S2ғ���O�2�,a�
�XU5��J�eI�������(����6�TS��,���;�v��|���f[\��sc���"C��5���F��P����O��C�[�G;odv���[����+����LW7�Hɲ���/�=g
 �^�����.N3:��U��U����:�a����>*e�N�늎���n0�!mP�d-dDC�#�gu)7����p��GB4�L�ꎩR�tn?�5t���|�����fkv�cE�Y�&��'�Y�m֎�>֎�p]Y;�|�ecЗ6A��3�#/��e���X�t�VB���D7i4`#�h�8Xޗ	H�Yfȴ��
����#�aK�=拳���}]���Ni7i6��J�ߧ��{L�-e�Mz-���q��PV�0K��ٗ����@�`������@a[M�@���L�J���-_m�+��_~kSy�HO���jL�#?�I�_�	�O7=D)$px`z�B�"�ς��Ajm�4�R�ˊ�6�C��Gg2�o%�Z�`�a{���tv��t͡�^jO�g{I��j{�x#�ڡcZ�~���]��b��B�z}��V��갴�(�e�][ZrmL1�	Q�O
Lv���R,]������G��6����/����/�xF����/����/����/����/����/����[_*��=!�˦O��hD�c�[_�J8�
�q�D��,*?>�,�^�d�c��?������"�l�#'�~�h���}�yǮ��Ē�Aݝ%o�����3�=�-��i�aE{xڃ���d<{h�_[W_ǘ�z^��t!�'
ە����B��)�19H�'��_�AC���lO�'��X�4#;xr��^�]>������뫰H��o�[��D���;��'7k�{`����&	P�?�i�dö������Nl�X�G^��B䅁/ɯFrc�WE}��A��((����F/A���q��qV'�>��Y��_�[0���7t��m��ס��Êvo�ф&�-k}��(��+h(gm�V�M>V�l�̶��6�������>�d��A�Ƶ%�������Nv;F^��*헢;��O��2I�������I$]�:�^���a��[�Z�Sl�Td8�57��(��=�^�=�V���C;�o�/-o�p�:��w. Q���=��,w����b�s!ʅ�Ǧ.�$BGY��,-�X\�D�E
�F�B��-`tc����f�@�'C�m��8r�M��y2C+�F>�Q����F�͍���f7
v�`�bC+wt�p����^�zrK?�Én�m�Ho�?y����<�������t�	}y��/0����I����5>�d?���P�S�'�����r�L�2y{|������0�c:�-s�/s��S߭��<s{3���Ӄ3�m�M˶B��kBw�m��v�F��7�W�eF� ��2�o��R{��_f�2×��̨=�?��L�xӱ�ˌm��1���1��񌰛1���1���1���1���1�����w3�����8'�flc�-k�F�
T_�*�nH+��,/��x��6�����@�    ������X�;����򗏮,��ņ��൭]�H��au�v�� ��5�Z�w(#��}#*Y�idE}{FJ(�gv���..�PB�#@X�Vt`x@&�>B���l	��;�6�&�}�j��z�l����<�nw9U������]TԷ���h�}D;��@W>��ۘ�R�iP�.�c�9�`L߼.?潦������4��5X��5H���58�ܞ�P ��&��	Z?xG!�v��雒M��������0�)냋vT�~�H��^�hy������6�h��!�-Ӿ	V�p7�iWnD�vo����P�q>��{5gG8Ts��#������6=�Kww�6�u��ںdml�2�u�Ÿ�E����;v����A��M�!�/�ʂ���y��'�Z��o���7^U]0�W��SB׏i�n�4S�֠�"�Q_��4B��C��w�����g{ͭb�Է۶N����]�[;���s���9��69�h�3N��q:��~.��ޛ=8��r��~�n�s� ۽�)�3�pg\N؃^����#m[�D���]z;��4� ��D�h���	�������~2X�',>F��S�)t�)�#E�>d�����'���;F{A��C��s�#rc�f��*u�LǴ�#��y�Y��C=�`�շ��:_�ڽ-.QW�e[���Mt��o���8�5��'�k��_b����r�4���U�y��+-A��ft�Ĳ�^i���ݸ�q�<ocB���cHI�
��b����i`������Y��j,ի���^����`��A ��*?{�N�[*-��Ά���ª�Ƹ����6��b*ka�3"Iwd�-�6[K�D�y�ޖ8f:C�!%��%��I��L��z�k��$ �1�i���e�Q�b��;�W�pcP���H@��d$�I<n"�a�/q΍�ղ�BGb����a���	��XiXJ
|�L�0:�DD�Y�)���2��9���Gh�r��X�������1���)�����y��
/d<Ƌ?�ÿɯ���I�&H�z1�1m ��k
�(�(��*P��nV,>ܥ�#���~��,��r�9�s;��ʤJ���1����O�q핕�HWύ�-Ob^]\S�j��Bl���B�N��T��tdPuHI���"��;�|�	�v��o��g�ptcD�ْ���߫ƹ�B���+�E��"�b�M�G�0�����D��#�R-,��Y$pT�?�7��FND�i�f�-�C��:`l�6���5���ؼrO�a���5a���)���La4s�]r���jg]l��:�A��Y�o`�l����w��s�\�m],~�ȐB��?M�&�p%֡��;�e�1d��R�4�M

qڎ�n�y�^#.��S�1�JLb�U���i*�l�F'�J[�4դ�P��?��q��	�yF�;���A�
a	Gy)1Q�!D��,�iP�Z5�i]��%�&ƀ�1EK1�.���H|�pR�PZvP-� 60;��"].���T�*�l�q�>��(�T��q!P�VOVÈ�QKH���M�Zlm���*�+I|�a���S�JL�n��6'�2�mS��`�h�BD�J��Y<��6�I����8_���8ۍ�S��K�����z)�%�t����|�Ed�i����R)�T)�AS��&78��׋ƛ�����[�4M᱒u��S9��ok���u*w
&��Yl&e�h�������N�OKZ���D�d��&n��F���k��%KC!�CT���H
'���5�^Н��Q�PZ-9�CkA�~K��U��A�%=h��A�66z�j�t���FJ\!�*ɮe4�(x���D��t�m���x9�hw���ΐٸ&«Ѿt�8��G�1�
�Z����헱����.�2�f�R�L3��lq������~���s�|�[xװ�0��R��C����dT�3r�o6�ͯq��`N�b��Ŭ�k�{���˷�7�߽�t)��q��shS�5xo�n_�/pf�9|v���, �o�.�hש�P[�S���b�պ�K�=�F.h�V����*���\��ż����˱�^䚾����Em�;���%'�vg�Ck3���aڎ)����E �NNK-2�c�i���㰨���T�(��F���1S�b�����-RO��9r*FM���폝��M�4��<jZ�n`�c���S_��!x�C�n|��;�I����J*���^�M�<�Ak�W���\Sv��i98-�=���_pZ��gڰ�~�;��_�;�7m%��u�͵�<���N�v��� V=Ÿ[�^
��T�:�ڤ�ѼM�i�2���-ھ�]�Vx�`���Ff�-��+y3"�Z��8D��
 �\�@�~�x�zi|�Fм�QNtH}!qQA��u�o�����t�I9���%����tO��'�	�IJ�.�$��D�5Ev���w�8i�K�"u��&���:zo$��^A�KЛ�d��x� ��L�.P���q�0�oR�M\#F^n0)��G*�;���~�py��S*���B���B���>��V�F^�&��*�\�u{#c�����\1(�o��e"���p��	i�t�j�W"�re��;b���~^���oY�a� ghZN�I�K}J�Cvy�쳹�(ŗX����.�kKb�Gڕ[�u�U~�b�k���춗���lgr�:􎦡h7��!�^ݿ�y�������n���YJ}�J��ß�T��A|�=ۋ�4z��O��=�mW�&�W���W���
B�i#�و(yڎ�[I�� ��Z��8ۮ%�ȁk�gn���]��z-��CsK��uט;ܢ�jc��֔�(,�z��"N�i$MK�y���*�q����=
�!�[BR�(*�������K��NI����jf��Gh��vGe��`��҆s��ׂ�n7��t^P�g8�V�MBMf�"��҂Zε='�
%���	qBc�(Vu����Nx?��A����X�d�׀�^tT�c%|}�4�����xV���79��b���)�c�p<G�?����YZߥ���c�
�m�`w��:�5�|{���mAwh�������T:�8����{��"Uú��堋�./�L'IѺC���O0w���<z��vu�?�[�0�������g�����/Y*
�T8Hq�(Q$,�����+m'B+��!h���Z���yĪ��́�}{7#��	�"�|`_���,�1L�k ]��q��k
P�)"#֎��u�Y�г=ߗ6l�R\�`C=s�/�em�z���I	�hB�h����a���׳�ă�����Yv�����D7�,���*@��]�t�'�.�|<�*%3��L��.�װHH�O��\�`�����~V��/�פ濩�|l�ub�x/�>t�Ԩ��fNe�m��V%�c.�5v"��o/�}�Z�y��oh~��0�^#�5O��,�����o
�U��MV1��i�Ƙf<�2�t�ںX�]���!'WW���u���J$���j�m�~辸M+�5�����ȓf/��i'a��CW��z����M �2Ն�k9��+-�$���Y�&ʫ�K�ȑI��3r�5�3rrFN��yz3�99#����	�}SrX9�3�[�G�����#6��\��k�s�r�����\��k�s�r�ٍ����5���ql�+�	�ww���Qq�%C1*W����-[���M@9i���u�e�b�ſ�W�
2-�Q5OƋo0x�`3}�T>�pF�E��ތ��ocD�_�z�엖���V4�̽U�y���32��#۳A��:Ij�\������.�Q��ڌlJ��@Z��j�
C���}q�����>:�Ir$dr��&G�9�ar��&GN�09���#L�09���#L�09���#&GZ(o��T�:9����4n����?�?7⇃�A��8�3����8�P�����) v7�,EƟ`H[���S*@m,��n1ҩM�K]�Z��X�/,��(�	*.���UѸ    ���z�<�/�1P?�!�f�[I�$D�]t�TMh(���?��������neo��e]�z��;�={o�FV�-{��F>��?�6&�G��<�^����=^{�2���a7�����y|�y��a��y�3��y��a��d���<��0��<�<��0��<�<��<n��Y�З1�N��Q}�"K'z��{0�sj���3k�dz��Y�F�h��=s���x��޸b����Y{�c��Rq9�S*L�0�r�3
S*L��,�?`J�)�T�RaJ�)�T�RaJ�)��M�H(�=%JE��	�R�3S˃�I<(�D-s�9]��zr�rN��������u��.�@n�5-<��x�6�߻���e�̀�G����`*���b��9�a*���bN�0�TS1L�0�TS1L�0�T��b$�����ۑ��%ڒ�%�#�K4�P1�K��F�Pm	;sM����k�Gz3�	Q m�m�/�����M�1b5��S�>2���.Q}8A⺃}R�D[�Pl\�a�����N= �V�gK�X#��fx�J��f�P��W�C9�*޽ጥ��$z��N��ɫ� ���]��a2���F���8�vk�L/b�ZN�9�K3	n(9�d��9�H�#9�a��9�HN�0G�	s$̑0G�	s$̑0G����H�g٧đ�>9� l��������{�<O
��1B���`��>����)\X��H4d
��⽀.�<Iߥ�	#c��$O)����B{)��ۢ��!>ܾ/A鯿}��T�Q	Q�
؄��қ�y��\���3��ՙ��F�9��p{İΓ�p5� �l�䫆�i{����r����X�]viS���*|$c,Sk����ͥ�;5o=�ְ���m�Lߓ\��0��\s9�<#��0��\����r��a.���r��a.���r��y�\���N*����:��i���a�(+�]|f�ˌNP��2�7�\gh���:�1���ʖv�S!hyg�O�M�6=M�1�g�	&`��9�a�	&`N�0�0L�0�0L�0���&`\ʓ��D��>���0���Msk�C����<n:���7�R= �¡�Xn�������n���{7�����g��f�͟o��
�b.�� ��xF�b.�����'�1�\sA�1�\sA�1�ع ����D��Ѹ �3?0@� %��<#P2@� ��bf(�d��J(�d��J(�|� ��;qR��O���~��~c�`c�@7V�2�&*SCұ(��b�sc�Ѡ�/��"�H:��
�-��k�[M(�hc�%?�
$)�IM��h�p�J^o��6�e�R���7������R2����1�r\m�l�@]T��3\��ÍӃ��Ӄ���!.�(𷧃�<��q�,�>[��h�EC���h9��y~a�];���[e?��I�-��&vm�}��^���C�1?t�3���C��,e1`~��!懘b~��!懘b~�����I(/8%~H��:�P��
������!� ��"��������L`�7�5��QAq��s��	�"B����I)#��i>+n��c���.:H�@�R�?l��`SC/ځ�<�$8[
�2�A�]?�SQ~� �q�]�B� �#۬�ڷ��أl�m��ZӮn�t�I-[r:s:��0�Ü��s:��0�s�4À9�t��aN�9�t��aN�9�t5����S��i�䛁��x��-�;X���=K���LL��%ٿ�I�@��
L�6BWj��&�b���Ь7�N������"`1��t��#q7���`��/P��J&��.��#�Y�г=Ic��"��h��7��Ms�_����YM�͘u�7g(�Ƌ?��0SRU����c�(�L'�Կ.G |"����7�ڊ��(5���3-�3�� �bl\l��ߚҼ���ĺU�g� �������Z%��}Q5}���s��(}X��I:'��
]D@u�^4>����F�����Aml���A=L��k��A����@���->���� �z��ה@*�1\�4E�.n(�8N�5��@?��$�֎�/��_�QH����s���_GǆCǵ+t��������W�j�t�s�39�Ң�X]�eOTӖZ��:��O��8��#r�ˏ��}nk��u���y��-XX�������7�	�ym�k�1���QE�𕻟t;���I������x�)�h[�`\}��H%�o����H�i�A1�M &gi��5-�.;�έx�&��]\�*��z9�%���n�T�5����
�L+��K'u	�����9(SYV�g�}�TK5(_F\�u�����0��Ҁ��x_��!�`���>1��%XW�V�Xx_7>��V2_�M�{p(ἃ]��窉�����@��I۸�p����jBg��]Mn���͑g���jW�}r�U�u�v5p3s���8"I�fWs�]-O��nl����h��^5�9H�d�]b���דY����@�6t�M���<ח�Ŧ@l
Ħ@l
t�3¦@l
Ħ@'k�2`S 6bS 6bS 6bS 6bS 6zܦ@��N�H��vC�ȷ��3˴�O��K��;�f�#s�TiUWO�0(�%gu���Y��,<�D�����Db�d������I���N�Nrc�fD�.��fH�����x[�_G�1�D�-Tw�<��5~OP!,�&�6?,BX�C� �I��H��:+	a�Y~�H$�*P�3��/U���#��g�wf��4��	Q�B��Ft���CC�b�ʤ&�l����D�ւ��󖝢�lZ!��36PCx~-�{�k���l�Ħ(�K�u�܇`���l6�;���R�!؎����9��'��� asq, H�����{|R�6V�fI�^�b���X�rt���g��@mWD����d:���3���d:�d�ӁL2�t ӁL2�t ӁL>n:PBy�)с�O�o�t���t����^��ܨ»S:zf�P�����M߁��[Gjēx^��%!�H�jt1�dxv� qZ��]T����9�?V�L�\�2h�t@�[���$ch�D?��e�}0&�me"S*g���Z��Hޡ�I�Q�-ꞔ�d���F����kV�bDSV�H�Ir����/��cDZD�7ȎA�2��a�(��������}:w�T��s|	��&G�>J�7�'��X8���@}�S�� ����m��H���Z�L�2�A����&&�L��ӎ0�������t����^^��Q����3�w�Uy��Kz��qAćK��������-���c�",�҈���$
��Ȥ��T��xot���Ä�Ihc�G���a����DL`��Y�f9��o�{�b2��,&��g<#�b2��,��kf1��d�YLf1��d�YLf1��|�,&Ay'�b�>�aǩ���b�^�,���Y
`
T7�z�`��R��Ȑ��W���Ȥ�:����T�0���L��Г��гoR��0$�\�Kt옄BKb	:�5��e[�0�K�����^�v���e�z&i+�kh�v��Γ�Pp� �l)8����Q��;����T�ݷѺ���g������ܱ~�8�m<w�s��.˓�R���JL+1�t�3´�JL+�,�1`Z�i%���VbZ�i%���VbZ�i��M+I(�be�>ّ�6���J�>���h�4g����~ך�O���I�ƕ`��Wq�T�B�Ƭ��K=��H��xw�h��PC���Ay;PC�;�mgjH{r?j��3��<���o�v?5t�M@�7�����a����yx�4b񺮽��if't"I�DL�0A�4g<#L�0A���r&h��a��	&h��a��	&h��y�Ay�i4�On��'0�4�>��,=��*6=+�d��r��_
&��c�yCQ��+"=ݠz)qங�;��K�R ^�j�?h��5pX~Ho\���L���Q���m	�zX�>������_T���!���2�Y�3�#    /F�N\���~\F�����ȵ�V��r����'��9����v��U��#"��ǐ��is��Kb�Φ�r�R�|SK���KL,1�t�3��KL,�,�1`b��%&��Xbb��%&��Xbb���GM,)(/<!b���D:�do#��}�%�6��<)�
SaΒ�V@$�&",TVJ��WQbΑ	b�s�)����6�b*�.�i�:���̸Isdr�Ye�$�%�8�ٺ���OE_�Ǿ���b�	��сCt!H� .f�����T#�ȋ{0�1j� TR\���X�/�Dē�\�.>�&L!�2=�
uؐ?��Sؤ;��ş��������(b� ���DT8r��������>D�,�l��lg�C?�|��N#���T&��lA�o꘻����F|�0%K<�E�uD)%�:EP5C�� S;82�M��Dm˒��dL�1Av�3�dL��,g3`��	2&Ș c��	2&Ș c��	��M����)d�O������ ��=2ۮ����"�"Nqzbɩ�N�uV��G����eY��w�y��@a"m):�,T�j��9Ȁ^ꫤL�YVϥz�6�]�����?e�[�h��C7���Q�'���d���Q���D�r���vA����ҁ�6ak����Zr��l�O�1uM�Z(�?a����O�xF�?a�������̟0��	�'̟0��	�'̟0��	�E�ğ�>����'�6�h�h��'_JO	�j��P����=��w��
	=�ء�ó,�`/��h��r���ˢ=��B��ӏ;���k���-�,���f9ж8H��a�4d-#֨o��i�f�ƭ%`Z�i�e��9�aZ�i�eN�)0-ô�2L�0-ô�2L�0-ô�c�eʳ�ӢeD�|��	�-^-{p2:#�"ѳ�c$$�*�|�~*AتH@;�͛f��M���awi�"�p[��b^|:��x��Ȭ�"�0�f&����I%�Os#�YY��0�RQ�9�E�qo}��$��9�nB�Z���]��܉ΧF��d�;���Jæ�5|e�rv]$F���h`O�gЛR�����F���^W"��k*�I]��v�>O��	����J�2�P��Pɩ5�74^������'3����bo�sR$�@,�is(+1HY��qܧqv�B��w�������%��)-�Օ"FfS�{���Sg{g[h3k�#�����M�Oޛ6k
��s��<�0�L/\b͎ ���:�蒡�&�D��`X�d�(�b�1��8��1VH���n;ܔEL�M��E�&�&;�1��l2���<#�&3��l���f��Mf6��df��Mf6��df��M~�l����b��>9f���ۜ��=|�PMir���ɸJ��	"���wIj|~���/�xzM�of��tZkx<��q�#�[xR�X�����
�e#E��Lj�G���A�#R!s��RT��Ɗ~E�!0�y��B�
�����$o8�n,M8Z)�S�`v�&"7!�"U,��W �rFO�@U��GSĲLDSCW0Dԃ;hm��jb}0�� �+Dpb��^�6��f@>�I�k:Gj6��C�ƃf
�w0ho;:I��:'ʡ�M?b�r c�BO�<�R�3�+�$OU��!5ޠV
�� ��A��\�6�I�YV!��&�����c$
�|���ه��ݵ��,'�yʖ��R�΀���i9MDuo1kky��6��FW ��>N�Aɱ��$���\�&��KqANl���`0׎�ߩ�L�Mg�O>�Cdj���U0�	�1�2A�+2����/as`�b���Zi��
�©���f�ƛn��8W�f�ULpA�򸆵G��6�-ܐ1v���8���w�������6�*�%�%i�f˴[W�8R"kn��g��U����$��uv�کA%o��˧����pT.~��궁Y�
}�?ܨo:��6�9�p\���۞������ �l�@ap��iz�r����/�H'(y���wG8G%�|��Te_<�iJ��@ł�w�b��8V��ß�4�?\��#�����ҔuN��U%�*�U,����Ҩ�����K�ע��qC�m@�^H��|	��*�8��IH�8��d�ܤH��,�(
�`�"�bW�'q������K0�1������
c�BA<r&�m�
e���a>���*vh<Ci*ױl��3�1c�(I�,�e�<V{-�,�T:=@��>�m�XSt� 7�h�+��;���`����:O�pI`����q ���,w9��Ѷ	�c�,ib۳�d��;��Z�-M�����{�i��1�%l�xL�Y�J��-[в-[О�-[в��u؂�-hق�-hق�-hق�-hق�-h������m��Z�������e�Գ�_I����l�c��F��D�Q+iX_ܞ�J���'	���rF��8��21Dl	$��,� ��!-5�P��^���T�'����|��W/�����YC�$��.~Dzјw`i��3��gn/���w{Y��t�iY[،��s����'�A��Q*8�5����w�� ���{nn�{hh��B-?�A�8��D���z^�D|�Is��nA,s�]����e�DJ�n��H_w;Fާ�;PHb�[���B�f�6CA!�SHL!1����SHL!1�t��ƀ)$���Bb
�)$���Bb
�)$��7�$�<��Rz�>Yf�sH[����pH�@��
�]R��!v个Q%��o_\�|�k���@b��ez'h�n|nt@K4x�x�.�Ɔ��ױ�I�t"�?}��$R�'4l��>і���Ԓ7_����gnx���ʰ��mvA����݇�K�������^
F�9�͠o/�/-o��#�:���G�������(�,�	�Dk�X�������a�t�iKZ������ep`�A�[(��%�X8T�p�^�Xt�84ѩ��f3�f�F�7Rh�J"_Rh�ѭ�F?��=���t�m�`@l��`w[��E+��ס��\^�{֥�ɲ����c�bţgl�^+��f�f��0���a 6 ` 6 8�a 6 `���l � l � l � l � l � �� ��<�� D���� ��N��>�J4h镧
1@&e��*ֲF�h`.�L�2X��ˑ\Q��{�T��v9V�2>��Q�?��ύ/��X�߂���p�؞����L��u�zN��w���~�:��+g��#��Nzђ��!�=9Gb�eQ���yy��m�	/��l�����Q-�(t7���D����#�L{0�q�3´�L{�,?`ڃi�=��`ڃi�=��`ڃi�GM{H(�=���M�<W�=Bw���C{8�-�3�)&���p]y6˫1f�J��8j| 7�p�%�l�d\Z������<�%#
�s�dly�0���~7��e�s���iDL��%-�_hQ�����Y����	�g��SlL�1�v�3�SlL��,�3`��)6�ؘbc��)6�ؘbc��)�GM�)(�(��Ov�a�1l�>�����ף�*�ߊ����|~V�.��J1l=��.������Q/��8�C���|úk\�P�D?�-@���\��}��>�����V��Ǒ�]�/���H{r?�#*�<Wz˱Ff8�B;t7e�;�~@��A[�<�r�� z�I�.���`&jK D�a�;�q�u� �˿�k7^e�S��!D�C"�]��v'*��msãOj��q3<��0����3<��0�s��Àfx��a��fx��a��fx5ã��S����v��q��(-k��[_�(_��Mt��i>���b��PZ�B�K�0j�V��h��"ǩu��pԺW�����<����H������U!$N��ܴ��h�y�m�.��B�pҷ_�Y.��x�Њz�:�R�912���dT�eB� ��K2��}<A�u�w]���ia���fZ�xF�ia������̴0��L3-̴0��L3-̴0�����O�iQ}��H�ҳ-\����Lc����i�A�d)JU�}��K����    ?1�4���H&2�M
�e�C<�N������*x'b[=��o_\>��S��z�jR�P'��_'��C8��tG�����p��;���<��#�,�=WG�����`9��ᖲʿ���s�S�X��`1NXqt��'�T[=G�"q�v��sD�2m�~�c�1��|��<#�g0��|��B��3��`>���3��`>���3��x�|����i�M�,?����Op0K��4`V���=a��}��IQ}Rм��([�|�S�V�@V�,�ž��� -��̸j��V�!H���wYۣw�h:;D��<�iA�m�.��-jF���K�Ł,Q�ΠU&D�D�$T)6}}�"�V�6�B���r6��0Xv$Y��`ւYf-�yF��`ւY����Z0k����Z0k����Z0k�Y��,3:%�B�ɷ=������>���Ii���yiLkK�B1�#�1���b���|��E|wv]��9�I��1n��F���Q��Z ���"E��y�x_�x��'hvB��q���-��.��d�W��O!�ET��M|K��q��LL!��P+K�L[�6Aܥ�=N�G��N���Y�mk���I<�R��&벣C��NɼJ�mcp 憒�����;07f0�o�F{r?�
�Ζ�1G^8�B/��Ӯx�"�r�m�%~�b��7�)����4�s�a�H��4�m�GzJx1�$O
�ZN��k(�<���a�K\�G/#��Z'cպ�ԛ��v�)Ռ��M�s$��0���SoL���0���So'��zcꍩ7�ޘzcꍩ7�ޘzc��qSo�N�zS}
MG���m�[��Z��;��18�1�s�O�]����!�7U�\��[�
�v�%N�Ir���)��u���W�T`�7g�2��$.����@D=b+=����SĮk��X�I���w��-��Mas����趩%/Gӛ���5]�̿n }�jPd`o	V`��]��j��%,$����I�� ����@�q�r`�̬B�e	�s�×�q�cL���H�	�(��1}��,�w��f�ND�yW��#.@υ�h���,��-ϓw�(��ā�r3D��~@=ȔdH�j��q>�f�)��������a\�q-�0���|K��!5I������S`+`8J)c��k��9��Eq�[)N��бz��'��8E���=r�a����.q���H�O>
��#�H,��R=���Cp`YI�?�����'1y���xk41�����PU]������d�`�Cm#�ߓ�~Ĭ>����3��3¬>����,�<`V�Y}f���gV�Y}f���gV�Y����K(�X}�'��Қ��P>TZ����b@wa�_�c�FdA�����P0YP�����*'6���BH�Ϟ���J�*����8���ـ�:��W�$)�E:�չR��W�i:���<-�y�� ��0�
��d8Fi���ĚV�6C}�������l��f�X�,��4�0�eto��;�d2�#|��x��=Yf�2d?���t �-������>�4�K�ġ7͑�&�?�E'(�6��{C���[q�ϯ��������n����b\B��?��_q>����پ�*I��̃ֈ#޼�NU?H`��V,��U
�yò^�j>��ش3L3
i�����o�4E�7���q}��VK���ѡ�ڦ��6iY�S��-��Gs�-���A���$3J	��b�c�{���x�т�6�Kj��)�	�II9��L'u���w�$rb���s!	g�x�{z�>�$�47R��L�b�[�bk� �
BP����}��<-a>R�Ml����L�Q�Ľ5!Gw�����5M��9�b�q�5�߂�6w� �¡��X�hO�gAB8gkA��hh�����mOڋC/P���X�"��q6�����������ɏ"tWs���%qF�q.���l��jB� �YH�ߵvu;o�2�'\h+ �}��>w ���q���=���D"�ghZL�3�Ϥ>��g<#L�3�Ϥ����&���gR�I}&���gR�I}&���ܤ����S"�U�B=�ghn��m;��u�`�Dɖ�eB�����M��u���0�a��^M�_����p��(����V<����鋤��Y�N�88�u� k^gЯAӘ�Y����뺬�K�S�p��ڕ�O���0��Xz]��#N�� ۢЛ?0@4%c�h8��%U�|r�ޒ_� �l����:��W�����V�ȿ�֦����{�xr��@~�� �Rh[#�������e8�BC��YVϥ����Q�. ���.f��gZ��dA�,:=Vog��[��xFh�����'U4�	&*!)`�Ab(�=�Og��#��N�EFY#�Y.�gg_�SU�-��\khF���A�.���:����.�$Kz<�%+8����[%���8ۿ,��_ٿ|�?v�x����ѵ��᠉WӲ7������o�	_&|��e��|g�	_&|��=Yr��/�L�2�˄/�L�2�˄/����P�I��OV��o� %�P2@y�3� %�P�,f6`��J(�d��J(�d���GPz��v��i�@���q<���~��Ⱥ�CJ���囿�˿^=�u��P��\��qf���:��rv]���]\��s�=��,��p_����Y�<p�C3��b�<�O 6Q@x���P��ph�Q�YK�Y�|_�}0�G�xF�<mX-ԋ'�̋ \I)��1�J� �4�?ܖZR�Z�1�_X_�Ln0�����<#Ln0�������&7��`r��&7��`r��&7��x��F�y�ɐZ�\;�ɍ�Z{���@[��P"�k��!�g���}��E,�I9�A��SD1*�j:��Xh-�EԤY�$�[.����J�)ᔜ��Ҳ.-X!)��hf5"D%7�OeN&m���vp`&��1}���wC6+�j�����g軞�F��LL�5�ͳ�O_6�M_�(
�#τM X�6���j)��ӎ�١df�dj]�in�C��Ɩ`ح�	�8V�'͸�O�2��F,/X:G�*�.�f���ڝ��k|�ݗ/��ü"P�tT��ILqK'�5=X�t#��)�����1f����l�a\ز�H���O�Ё��R�J�LAEMR�ob��r��t�6m�@<��ޣT5�%�s�6���5�����@{oc<sS��_��.A���k�-@~\M�i��,ؔBͨuYS;J�R�-M�X�}͆.��P�I´&$����!�`���R$x�w���q�1���
�Hs�uL�Z���9I�x���������Tx��%4�I=�f�|�{�e�O3��� ����w�,���K篯�"�/�-n��
^�Y�p>�Y��nV��X�,�`��ٌ�3Ž�_�q�����i�n�aXw���iS���G;_�f��x�"��+�ש�.ձıZ�R%k�( \r��'�� ҞɆm�
<��?[�.�Ƨs6{#��=��(�e�ɥ9��K��Է+����p�CV��PsvP�U��?<QGWc���HƳb2�u���G��3̾G�!�[\��kx�Ps�����NC���vP]/
B��u���'�fw�7;}9���[?��M�����q���H�D������
���fpב���-Io}=Q̴�����w7��8�Gw�u<�e��×�����:��D��|\C	�l�H��eҗ�ԃ��[����Kh��%d��u��.���_��o�,���O�����P��]�̝��Á�n�r��ȃ�D�nQ�=�cM(
0G�3k��[j'ﾭu�:������ѭ���ƃ��z2����]��*�t�D��ؘ�&1��� �tN�xN$>���I/Mw��1��}6��N"�r��|�d4$s+u+K���OPO�"L� [��g��o�h��2Jd��V��Lq^|����'�gI��uތH��J1�\��u�u�&K�a���Y�7T5��ab��������uZ����+�AkC�<�5ЖTN�R�    �,*qW��C� ߘ^/�H��ogԋt�� ��eId���p������pֲ�r����hN�Y?��O����¼�U�Dg-ۏ���p8����Y�2��֍�ngPN��-C��$�N��G��������1���+��<��I�*�<O�T� �/xv���"O�>����"���c�>,�8�O�J>��ҏ"y�����%r��0�?���WoΛ��6D��2Zx���l����l�~�3���l����'kB=`{u�Wg{u�Wg{u�Wg{u�Wg{u�W���-�睌���'���C[�a��m�WD����q�FҘ��ث��f{u�Wg{u�W?{�����8���&�a��Z�k����cȬ	��ߔ�Y�0��j�M�̆�Ǫ��ِ��27{�3w���O~�e��V�_�l��d9��o�LAB���ג�E��;�ç�'B#���"�"2+[�R}��N�ŏ�E�^S���	.H8w�����������}X����J(uZ�����ԋˤn
���1��8�t	�m�W�����eB�c�����McT3'un���2c�C�m�{�Ȇ�6Y�9�г��a[;O��U`E�i#���6�~h���d#{�=�����q��d�2d�^چ�ۿ�I���D�$M�ŤU�Ŋ6Ƥ������f�<w�=�>��<��Iec>d��2� �����l\g�6v�To�}���Y�^��4���Y��	�(�D���;4--�bkb^_�		�D�F�7�}#c�.����C���A��wɸVv�ؾ�uvh[���h������9BȳKX;d͸�S#�@0�h�J�|r�Zg4�:>�ҏ�{�o`�u/YS d8t~�_��ɳR5`��iL���f��Ĕ�i�}��
�l���Й�2�pݪ��>�f��(�岬N����w�R�������U�Z�A#��o�ag�Ә/>����J�6,�yn�x?�D��}Nd��� zi9�v��Γ�x����<�A�vGf4��0��hRR�ZPb�G��X��%i'��4���r�!7E��U��ɭJX�q^]��l����B�r�c�G:ǅ�|ࣜ�{��\���@�.8�g�6guLy���b59l�` �[����.����.g<#����.��r��vvagvvagvvagvvagvvag����"�<gw�G���d9���%Xd�ޟ��6Z1�_%$��	/�3���Fd�_V�$-�<���M;���⃰կd��m�gh!���ߑ%��&B�:�
�t�Ca\�U���IXU)��2���o�b:#{��C�����V���
}/�q<�t��'��&�L����C�[?�A��6��
`�#��J�v�܃����kN厼hh�fd�,ش���x��2T��$o+��K]��dυ�Zz�Xjm�t�G��h+T)aX�6jR(�����&Ic�E�v�j!�ƂK��G�.��|�3�(c��f�~�fԒx��1�bݏ�[P�8�r�b�vA;I�T/E���C�d؄;�6���m2Ӗ�뚒�õ1�<�9��`̃1v��̀y0���c�y0���c�y0��1�By��L�4y0�ON�'M�8��}�)�]R���+�܁%'���	�n�g�<4�p���o(��"�RP�Aba���L�b�#n~6p�@�t����=�A�N��OH�>�M��an�jH�zR������\��� wt{���T�2\s��3�0b�G��{�2���>��*�PE
U�,{��C�N%��%��u3�-����f4dߡ�h^R�5�+ʿ�˿�����u�X$I�������%��烡1��D�OC+�G�����7H��d��ne�;�%��:=����Q��m�{JEN�,C_S�y�ޥ����-	ޭ�����s�y2��)	�KkA����E㸵NH1�[2�ŧ�R�EJ�o�fa�g䶺�L/�y�A�0��ᜅ�ш�y2V4�B��E��2����֔���e�pFAG1�h{�K"	�1�ӷ�:I�d,S��mq+�w�ު��	�N�&"D��ҳ�$Q')W �QM������ �(20VB��{+��Vc%d�C���X���>�J� �|��C�
}�Y�4qx�VB��NHa�G�SdtxQ�ZZQ�{	,i�up�K-9�ԕa^����nJ	�\˵��LӒvS�M���M�����M���M��)�=qIl��b�)��b�)��b�)��b�)������g�N� �O�Չ�o�`�? �E|~w筝
� ��,��y�&�_���)� Ƌ��,7�0��6a!(
��L򌓕d|r �;Xg�0�Awd�Răk��o\B#��b��hJ!�[4�E�U|\��C��/������p9�	-����7�;�gS$y��R#�V��rF=�7�H!��
tj���IzL����b�����Ӛ�t'����6-M?�c��T�(����2�vP�Z�P��"����d��Ԓ2E�w���cơ�d�v�8A�X���6�'��8� �l9Nwd:C�4Cw9�ͱ$�~haD؏ ����$��}$�$���+�h$�^�ǐ�謰��,�c)��;1�F5"hh<o��73щ����/�����@c�Z���UO�ڏsKf����������og��W)6�e��eZ�i�3��e��eZ�d��ӲL�2-˴,ӲL�2-˴,ӲL�>nZVBy�)Ѳ�O�e��,�~Zֲ�_�A���ڈg.y��#�z�k��
A�����0������&��������{;�q9�����>D���^��Ȣ���U�.��ӿ���u]��%@��[�U�x<�&���%�}�Ap�-�}Na�
��{�*?�I�.t��'"l�N��x6'ݏX�	'@#���?M�1�ĵ�p1� wȩ���-~�E�ղ�V�(����9D@�/������qC2s*�b���B�=lk8|�
�r~%��ֵ�Ԙ���q�X�t�j2��Y	􏩡�LԚ
���	���Ң�X%�c䌐���PR�7�J�[�a t�ڝea&h�N�?��g��n吣�e�(��!w�܇C�Xg�!�#�Z�m�����;�n��G��X�1����|�mO\���?�Yh%������&�7�G?C��Q`mdh���9�`hmN��-3��О�0C�-3�'K��e��Zfh��e��Zfh��e��q3��;)�V��t�YW(��8��o���O*�ɫH,%ҟN�
_&y'�e7��|�!�>ۊx|~���_�/��0h��OS��K�
�¯�.�fh�f��T�_W����/M��
_Z��1G�9��2�:����`4xɘ��������ߥc������lV.�c:{g-�6�R�D�={��eC�y=�E��wJ�ȢZ;|>��>|�w�r����|iT13�N�h�6#
;�WI�Yq����_w�@G-E��]L1� �A:m��b<��:Zf3z����}J.��iF�����Ez���*���T�����}���ͭ*��"Uy��OJD�W��h�!����.���J�|���/�~� e�a�Y^ �ͥQn(�~bC��3�E`\��^��^j����������m2�FW�#��H0!�h��1���h��8���J��e�ނ���Ҵ�_��n��E�u�]S񅘧�^��M����Do������'L��fJP�v��>�vg��	_PZ��)j>f�?CbN�q��2Ԟ�G��D�e4]��HS}��A��^�}�I�I�ǚc���8B�[�Յ�W%q��/���[]G���г?uA���9m{����=�VӸ���0�<}�~%p���mQ�I~K�!4���l���8-�u��=�
�#�h����fp�%[��W��+
j#��+z?�N+2�)��16<y���DL�9f.���g��aǳ�t�-~�M��w_}�\$�]����r�,R���7i��C+��&�N"�\Uq�kCup�7~��^��#R�t6�:Z�����Z*؞Z*��0tv2�מ��d�
���d>Y�0�� �M揱=)�ֱv    �e�q6����٧8�WBk-h�0��n5
�3 Ud��2T�&Ff%Y�c��d
��̴�+�a�v�؎��J��%e��z�k2�lfS�S���`r������B�:����ѽԶ�w�����Lϕ��ێ��8ێ����ێ��8ێ��9�=+l�g�q�g�q�g�q�g�q���l�%�g������X�o?�;vV�5l(����g����g�{�g�����k�h;~(�>�������,}����?����k��n;B[ZX;Q�Oή�刉]��+������;���Ʊ͚}��{�[G}�7��{��p�����74���iмp$W�W��6Y��ֈ��_�g��e�K�Ӳv���]�V���T&͇�[-m/�nO��UQ��)�e�Di�?I���ɶì۰ns��M+���j��� �.���_��:A��	���	��Ɍ��	������=�Ȅ�L�Ȅ�L�Ȅ�L�Ȅ�L�Ȅ�L��I8�͡Z�dd����z
9��#C������r�¯�Ks�ϊ���<��D&Ƌ��ð6����R�-БI=�.-s ?G���҂�4�5p����E�<�.����>pa3|�	\�-sc�B����zi��;F��^t+E�SX2��AD��9����:ާ99���cCFq)�Vj��ԹZ���p  �� U���^�b� Ћw`�B(��,�Au��S(�*և��H��i�y6���Y�9Z2�hw����#κG��7����nt��=���ٹ��>�W��~ �y� 0�ϴ?��'J��=2��.�n�kսa���k���ڐju��|��]���*�v��l��D,��,�owEق[�ȵ����+��\��i����Jk���/�✊x-Eb�U�L�����G1�aY���qY�d�k�jD�Ўo�x�obc�\�q�hcT�a2�r���hﻸ�_��#����{hw��|��̹,D��I|ن��z"��&9���B��&yR��q�� KC]^�˂Y��/X?]ܶ�ǉO��Þ��Þ۶!� kk���������FV�?�$��. �P�V(/ ��/ |8����'d��t�: �V��������|�
���{� lO��ós� �.S���:��~�]���2��2Ǳ>}�)�eՉU'V�NTuR��?թ�ں��E�},��Zf�`�'��"-�"�Q��EA=g��(�m�
j��QP��=�;r�k��BjӴ	�l�b�I���R�2��j\Ұ�AFT6e�]>����F���D�"��N
�)藈Ԍ�c�}H�TKHk�f��a5YC��.mW��NgUg���J3%i�O"������� (e�X-u!��)X���Y���`�دt|5}�Ջ��<��\od��U���MR�^����J���{���$Qt��
��R#22�QkN����U�ْ�3$��LJL2�ddIu1@o�'p�]W�1�:���j�O�K���;�$��HF>B^�J��?��m�f��wW�e8�sO�QZ���b���&�Ґ����%�K�g���"�����>
�� j�]7w�[=��0%i��qe9�#J�J<�~"���,b L��q�[r�Dd�?�C<s�@���X��Cu)^��2N���k�Bh_c��n��� 1=.����rQ�ay(����O��E����c:E�oy�(�j��5��(���|��K���w���ߐ副�G�����O�.u���O2��͏׎�tN����\�y6��xҟ�H`�SW���gG��Ԡ�����xb��E䂗��us��#�@��;����Sj{b��+ޙ�w�p��穦~9p!t-�	�K/��{�P-<O����� =	@��n�^X��=��q"��s�Q ��d�'B��Yc���ʁ؉��D�����DxGl��wma�7����D���z;����Y��/�R�ov��}��>�{� k�T0q-��;f�f�+�) ��u���qš>@�����f�B�d�w���>����0������ˀ�8�ƏR) ����W��
6��0QLGi�f�L��+�;vE͌xQ��3Vp�p^�,A��>-��5�᪱p֑���0��~�a�f>��Y�GWR����p�[�6�k����d�8,��B	%1����|���#k+`���;������ϭ8_W�Q��F�v���$��nS�'�8����A�8~�\�y9�_���1v��'�6�� q�D�-o�g�������X���ĘaL��.�3�KyG�%ႦQЃ�&���7:x�߭7?�R�S
Q%�A�!�H5u񤨓S�J��:sH)0�J|��C��|v<���QSBBL\�9�8�=�uK$5I8*N G�<�Ǎ��8���X�v�J��KgX)L��0�(ˠS��;r�L�A�=	j�u;zb縌E���K�DƓ�D	#��$V����[lφ��0KH��$I�2�g��&����U�j����Y�%(��z���e��GG����.�/2[:=���g�{vd�P�p�B��
������j���@�R��A=_�f_b�=��{z��Ucw]�^���?�Fn��"����w��(�^�/�dTn���5\�|�N	�I���q�}���x�ݥ؋�(�X�A�	J�,1\��3�ٹ$ ��'SjGF�;�&3^4�
�G ����2f�c��?'�_��0N�6-uLH����;&r�0��~�P�2O�u�Q�|�q<��pw6ڛ�c���t��t4��X��9��r�B�%{V�D�N����ܡ���t���f���L0�`��/&3����R6�XM��g+�>R�s����T�!��C�}\xw���{@G��Ծ�.��Y�a+)���kfN,3v5k��v����m�6U�H�3���&7���X��࠱�Q�@M��v��	��ҧ�vњ�@��(��:�
��S��*|���	�.15z��en_b�I��h<S�ӊҠgr{O甖x w��燭2�
'���6������4���ެM��j���j�ԫ!$�y5F�ޤ�������6ƾ<c��� ���N>���r妼�K��2ap��� ���r�,�8q�G���_
���l�2����ʻ�.���qW�GɳX�|L��x0�����ԣ��@G��0u[���}O�;�A�{��Ғ���2����h��V}4j�r{�7��h=�j�R�� ��b���]��c}��4���r�o_3����h:�/�wv��{��!%�Mi��͛C��e�u�H��z[�Z��n�:,��b:,vo�b\�N�*,ƶ4��=؇݃�v�`݃��t�o[�`�'�P5P����{��a��������ΘM�����{�������{���-���P����l>�v�����>�����04g��։��+�m��f#w���e�}i"੶`�G��V&���B�,X�ښ�bl�yKU�"��R���RQ���h'��98��z;�zQ&d��k��׼�]���)��>�$�Ub�>���V��P��j���$jrg�Q;�P���d�5�8���t1{Ę�Qջ�=)~��*8���z9�����J��}��NC�R�+,�:Y�d�#i<��s�J�Uf�+��dnJ.<TNJ�V���P�T��${�݆eGR�,\��n��&Y�7��w�=���K��Y1��b�j^ƨ�`V{�׫�uR�*��גu.�����Z�p����\m-'��!���>.z0�5�����5�M���f���k�zYw������/���ֿ�־���=��*K���ov���o}�Z:e&��%�c��w���&���<��/5��o�̞&i��^��N}Zy�U�S�ʵx��18�m�S&���YW/�^��%s7� u���W�b�v�"��aCo~Ď��&N/���;�e��M��O^����gbV�X��>��I@O�"y�Wh_�%�*c�����?�M�����"p����0��    <����sa���Ս�H��򖐲�1�����h���U5(4>��֘�Әʼ�%�P��X����ƕ�7Z�u ]�����\�N��k��֬�-qy�R �֣w㔿7��{�~������~���� ���q�{�Vx��Z�k\ʭ�C��ʛ��;�O�j�Hٯ#���͆fr9���\�X�#s��n&^8	��K�u���'L���|;���_#�?0�s`�G�[��A�Ց�]��:��FojH@���XRe4T]�������8���]�0=��n���� ���j�ʪ��YO-�]�oP���J�����!�(Ia1�j����pc90�|!�������3���~�F�F��w���?-7i�k����p��+�Ep�K�z[���<�w'Ձُ{��l�`-��p��.���C��ѰV����G�n�JAGR�<�h�!"j(���u��o�aS�9��Q���N��j`�#/V�3Ǉ��ZE�82D�.��8�+��o��}|����y-����Ws�����G�ïDш�k hG��%���Q3�rY�,9���,���g:�e����v��΅M���e��A*{m_��Ԟ���S�Q��d�k�O؄g�Cx��O�'����-/��s��@�>��W���I�-7��"�qX 'EX��gh3c#��OFG��������pB��Al�C{��1p�XPv���ӂ�':Z�]bvf���I j?	����߇��ՄB���QCx���s�a�ة+0y$y������v�ڷ��"��%
��Z�Y@`\�0@�fY_s@��	���n�9��ͼe��T�dW�T<���yC�8��>D\`t�ù"g�ͳv�?s�翉A��n������Ν��"W�}⛶�ra`K�8���=<���(��9s`հ�k �6rJ'4.-�-���/�H̘�޳ba�?`��ע��ay�Ϯb�y��( �Ҧp|�Yrv�����@�L똡K�kݞ�s٣����pM�p�� ��l|�v�Ay����-F5�|�%��;D����
��N^�! geG�m�b�#W��$�89��`EL8�?
GvD�1�$���|�];�JϏ�s�8����F.�tQ��'?b�D�c���Oƥ����#������:����8C�}@���U��i�̡�����;z�H�g���a��i?���x�V+ƃ^� -:�5��� Y��9���#̯�C��c�WY�K��������3��E(BU� �FĤ�kᮩ��R�����$�����V���=���k� oa�O�^m~�^Zk^����%:��"�`��71��VD�cl⛔y���x�F~*��zH�pN��Ÿ~LdK�y����l���J(BH|'dQ?|��c$��q����1Dħr�
�+:݌�b��<҈���X{��
���1TZ ��U-%�f��m����:���B��>/Ig��G�b�"\W$�hx& �����gƣ�E�!��K��v�_��ѳ(��sT�c��JbH	���|�D��%�2I�Y+�'.�b�mPc�.i�#YHp�o]�B݈�H���zq�����B`�O���l��.p���������HhD+��crn� �R0c��|Wl�L��e#F��-�Y��}"��_�4qؚ책�FZ&qΰl*K�\�8:ʕp�b����uP��W�����9�R���&=��<��oP�a�a��@Z/QiYN%�9�_ĺ*���w	da�����Z�9p���~�tTgLǢ:�ι2�b�g�G`���l��<�D�{�D��2[�C(�3fL����N�/��Kr�j�q�*^�,�y�f<�y�6�H3Zt�
�
hf�R�Ҫ�Ʒ�ៅ�n���9D�s���sĽc V�h5�"@�D���Y1�'���h�`r�  �5�nI���`�:��"}�g�� �5�; 50"��8&�����a�sYĔ-Y91Q	9�"�����1�Z�������nO�B��7���D"���~����"��g��DTu�!����˲d(s*1�#�E�z1K� ��5�<�+��e�r���\uĀ0Aʄg��ip2iV�3^��CkP�\�	H���|�rP$. ��-����<J�)��
c~����pX�
���+ga�Z��kBf�y!�Q>����%Y��!�bm�e�Έ�C���k�B��B�AK�N,c��T�=����XA@���� �W�d���@O\ ��sf� �f�F�:�*"�F&TiVX+hЖ�~���'X���Hl!��ð6��5x�g�{*I�ţ�F��S�#	��u!_� _^  �Ը]���C�5\��W'�$��*?Pε�ݚ\H(R�^j��� �� �A���-0��bF'�
�C�	�`� �Jt��X$�&X�L�LY���E�<(`��� ��j��H�/3�P���DQ�f�"&MJ�F��X��L�J$Z���dKZ�2f܁+�l��Lj�0��@F��Yi�� � ��@h ֍�.�Z��j;�����+�7�В�"���#Ke(��ј#�������
i�؏��FF���(N� �;\|]��06  �J��9S���7'/��P��S��@��E΄H���Ed�%�.3� u\X��Rӓ4>q����w�Xɒ�#�~{��Q��$�%N9f��QKxIߓ���H|} V��(e��,<ᤊ�"��
�/
���)i���. &��B�Y��䂫<H)Bں�sf#��*ܐ6Äm���ȉ:C�(s��	��U���:b�FP�Q ��lƓ7o�~���x��=8���y���~��\HY\��I�]�x2+���S,�V#K�$�]	k��H4	�;��y�d2�y)�.�^M ��J(������<���_F�
�:�������k�Rl��Cx1��,�8�aD��ubav�n�"2G0�М 3�&��&Pb~�wm��'�)��'V�?J�C��@��tu0���,�����h�+���7!�!�έj��]p�����ܕ��X��lE>6K���:Ë��FG��ыW�#�k@B���gԝ��6�"�b���}u؝�x.
�D2&^D.�-Fh�y�#�f'拫���5~�W8�� LVv �%@��?K��~����2	�{�m�uB�ʠH�k<yf��}��w�3l=:���ﻖ�Zv��H�������et�b���;·N�\�� ?<?~u��ّ���VKD����-��xM�<����|q���v���R�b� E�Or�
�!���]Z�::t-���	P\�f,����*X/Y7�|�����,FC�I@t9D�!E-A�N���[�1}5i����������I�#C8��HP�r�	p�Wį� F�cۉÏ�x�u�'��u�L����������04��R�ptq��G����������pe GZ���_?:���a9��
C܏'��F��!���Nf���DG��T〄!mB$�pW�Ӊ��|GwD��A�:s	>Xq�a����?� �/�B:�şg	\�A��"�x��Q+�����wt�7G��>���ʠ�!�nJ����k���s�Z�{���fҟ�W�/��-�E�ۻv�d���p��ĉ7���_����Ha�J=�#q���,P$���	��:w�wbIFg@�����)0*��dG��<�$n��,
y��c���YA��9h"[2W�@@nΤ��Tr�� 	�$I��>�/mtD�2�o��AS�`�e�+g�z��DtUI�� \〄�z�i��m-�4ɦ�"�>I��������j)c�{�\��<������vw,�q��D�X��N�z�8E���.�p4
i�(�ቾ^v��Dmr#����"#V����@N�J-H��+�ᔃ�O_X w5ա>!
b*
��U�΂�"�`�-�J��M�o��yo<���hRX�tp�    �5�^>v��ix��`kHXl �b�)��|)��(�h����9�NAA�X]Q��X�.�F�tOsG�8��q�Fy��+��F��Gt�,Ǌ��_9����!N�N��ިO*aR$�o�3Y1!�R�NY1�2͒��R�%=�o�oY1�����S1�˦hV<�n�q��Mq���Nb[�pV����Fzg`S����fw���&���:z�ٟ4�r9��
h�3Cq�]%�����erE�"Z3ԩ�t���٣KX���]��g�
��E���m�j�)G�8�T�<�Zv�uSP���n*�^"j�^E�*��rT9�o��Z����S�"�ǭJb-Z�Q����DW|W��B��M�+�2^q��%�r�l1�JኳXIwo?%V�hWY�[X\IR%�nc3$ؒ��v�-+)�v�-�Z�i[i;e3pYe��$���;��eB��T\6쎲q9��(!�s슜�j;��+s�z�[����|aV�V�Gs���z�/Af���ʓ`,j7��B[�Av0I*U�p��0j5I�l!O��8A���ZO!&G�n������D��m;�Xt��� e�XP�i�^�l�]�q�jQ%o�qL*������d�+@� �Y��$��f%o!F�L��I^�J�2���j=Ǚ�C��9稶�Lg6n.ٹ�M��y���<hfG�&���r64��&DoAM#FM���P�"�:Ⱥqzu���aM���$kfs��g]K��a
v�״��M�r"��Y�s��+�9�J�A����"S��:7M�怉��TX�����3To?�{�6��-��݄��{R��]d���wI�<���<��H揓1�z
�d��ȫ�f+�˹nU�`^9pQ��)�=�#m��N�1�
)t�W'/��y~��SN�09�bbʷ�N��y�H�����Ywg��1u���N����-���/|�HTۨ����L�� _����̋�y����y��z�<÷��՞�$��/Ϋ��8ߞ�`�9��2�^�wO���ϥ�W<_#լb��h
���*l���;�`���"锹P.������Z@��#}]�7nrc`�=��(S�łm��t��;�ھ��_kW��8���BѤ�'T�Au���d�u��T���{١U*Wa�Ycew%�DLv�B�lwp��P������*�}��YQ�gAt������Ġ/1�K�C�K*"i~��a&O�n^����Z���KBϭ�v�*�NJaǮ�֫as��VA�j�P�p�6ke,A�vз�m}�A�vзnp�a�o;�����u�a�o;��������o;����ö�F������o;�t�a�o;����������&������o;�����V�������P��ӷ�m����p�n;��m}��^�v0{���m_wH�GP�L��>b8�z=��H� �cz���飗���|��J.�G�Gl�G�}�=������5��]�0��j�?"p��)�{۹��f=�iaG��ixm�~��-���ނ�X��&Ńϝ_��2_Y�6m9���xz�,A	�:f���\��ƍ�ɖ|l{�)K�qy!�5�z����W�/�S��ܡ��k��K+����x�p}�AL���7��9�`�Է�	Y\�rO-/���"�w\qJo.�X �Ss%>�g�w�g�=:�@Ugb��F?F�A�H!`h�(md�b�tG���'y���5�F�q�ϗ��<fԉc���O�/;7^R���>��k
�2���Ǹ(���9�Z�E6��d\R��^F>H����q��	�����R-�W>�����􁅇�dv��7V녔��Բ��qf|��Iy�����4���ϻ��a���8֪�P�ٗ�f�9�@/�����Z>a)��g�z&�ġ��܉�̽��Oɴ�H�e~%�o�w ����}K�F^�����:�����z%f�`���.ʈ�o��T4M��ԛ�ऒ�l�"���G��|�9�]���_*T`��Y�gE`_�/1#��ԛ��|��:e�����uHM�p1���i��K�]�F�����'����zIAA�3&}A�HD�/U�
/A����%�+&*��t�y�KN�??�l���m���-��'�DE�x��\��9]�y���Ntzf���}
g��h�#x`�AѣӻrBrڗ,�{�+X���{j��*�NX�Y���-^Iߴ`�0�q�U��'�מl~+hm���;�;�	���Ҽf1�lw���(�[���,��+'�X���4���a�55D�ʉ$%��N��b��|A����Hy���-Oc�-�`�����T�v�yk�U�Z�E�jQ���nA5*h�k�����|8�z�¶����9���s������$=��P�kx���4�}sn���є��<��r�]��^�����Z�I�b՗ѧ���O�N�5�Ǣ�0���= ������³+s�.�v�h���#���r�RɒbOy'C'�@��E�h�V���`�js�|AADl�y
KU����\M7l5����h�s(��;�7���ֺ'�2"��y[x�x�q=q��ħW6S����;p��˸�����+��I�?�����Dɍ��
�`����2�ԧ1z3�d
�5R�Rה��ct+��O�l�2���~��n�( @������#1ϏjZxT���Bව����̟ip�N���h�ڽNC�R�x.�:Y'w�#i<��s�ot|+���
��8Y�ϛ�Ǜ�U��%y��ǁ�RQ�}�eGR�/\��n���8Y�k��w��₊K��Y1�t��:U�̂���^�B-��բ�B/y��d=�m-gp��3�j99�i[�ɺ�w�5�����̺�w{����kͺ��`�Y�}�Z�.��"c-g>�K�]��O�v�紿��{�k�+��vT>6�J�c��P�;P:�K-�2I��1sR���J�j��f~�	ߝ��=!L�2*E�Z�����ȧZ����t��9n�2��ͺz��Iܙ��Yߺ�v�o��[yoy�,~;��ʭ�'t|A#�}D�vD�d���"�I�����0����fZ�jO�*�F��Hd�?��KW��lh��t�st���������ߴ�~K��[�"܍���x����!zD�c��:h�����>�/��Z��k�O%FK]����ZX�#Ο9��8S�C�b��Z����QuqS��е:Z/������B�;$�C�5����ۡQ�>����kx�{[V��kx������kx������kx��������t�jx�{��#,��G.�A�b>�J~|d�G�����I�7ç��3�	�<���G �X��v������?�/�+��6��*��r� ���K�^J�������zP3r}�"�L`�ہ�����G�'�wr( �x\�4)T�F�$ۏxT�4��%��i��W��y�9��m�>�(^�\:��t�c�Ҁ28��1y�C�[=����W9���kەv�c2�c�q����'���
�p�#:ҡ#���#�,��H��t�H��:�;:ҡ#:ҡ#:ҡ#:ҡ#:ҡ#;�����>E:ĞF���UE:ƏP]8������{�:�o�T�#���̬Sl�9�Mf�+��`�?����y�?���ZR������z�aX%y�V�s�X�p	��,�^���ަT��x��;/A���_�F�v��!�G�\q���4�y"#m�G�k��v�k����j��F��rڥ�]�ڥ��^�v�k��v�k��v�k��v�k��v�k���v�3ϭ9�'���So6N\��^/q1���PO�;�1W��:tט_�����&.-��{tgl�'ǯ����oO������;�MBS/�賗��@�P����J��8X�����?<;�ǀE<��������* <���gG�+Z��p�\8(P9���N�����%�����?����V.���<��o,|y���p�]?��+���<bYɸ���+{��,���B���� p����}_�ό��׶Ǘ�ԉ?�災X�§0��\���ڣ}�!f�{�=O�!=��6    A���7,X�5l�y�\�0.�?Ʊ��� ���p ��EW�C;@U���[ ���o`�F�.�6\
�8�ŏ��* ���C?�����pE+@j��,ƃ�P`DVpaG�0(�� ?<�>���zN�;�A��=�h����Bw]7Žu�sHwf���)4v q� ��_#�D!�8p� s��N>C|����Ձ�^G ��! �7��~��k��m��K�� �>.�g]���L[�'x�Pl���q���>C�v�"� ."	іi��DS�Fp~��|�1�6�(C�X`���8{j�Pɕ��*�3�W &�?���S�9�������Y!�@���w{�?6�����sԂ@��"���H~`ҜI��p�·�y �ן�Y䕳\ѝZ.�w�K)�e�鏉�R{�*~�Wvh�����QR�a��pn*;�#�Mc�SM�vY8/G�S.�p���9�a�8���p�ɿ��J�e����t�j�8߾�`e���p�]H&C�X��@f`|�jQs�غtʰ���*��z������o2|�D��I���ϿN�����.������ 8p��|O���k�� YPRY�9�#u��1Nx��I�_��`��k��F��4V��N���Յ�
cD�  +c�%1W&	=9����C_�����|e�c��i�~�U`y��޴7�%�� �i�0G hz�����=�q���x�?�_X�"���.ך �|�,��4U]?�Tِ������ca�L}�o^�z�WV�χ��h�j~�@�|��J���1�n���@�����Р��R�TF��>; )�?b�R�ҡ-G@���$�)B��%��$��%`14�Ҏ%P���ZD�X*Ɵ:��,�)\E�P9�pC`9�=*Ln��A�
,�恍q�\Ν^�	�37P�5�<t}z�Ǣ��T�D�-�E}�q��5O��X�k��oX���W�.������*Y>�4�lQ8�ڂ�/���Dw! deWKX�Jֹ$ތ��?����x8�;&�8Q������|��0$�΋�:����٧#�U�����n��r>�ie��g��?Z�w�s�<����F y�3ᏼ��d0H��.�8cl��rM������S%�^L�D�"R��&�� "�Z��)!3��'?W�A��gB9�Q��!.��>�����,qݮ�pD���v���T�毞7��^�
zr`٤�D����u��+�%f8��
:'H��3&��S�����> "�\?x���R�}��[`nh�gn��^?�J�V��ӿ
�Kn�h
���b�&ƀ-KB'<q4�B�Ƌq��S��� �5����Ɠ mKF!��Ky���͟A����#�@'�?�^�k;����\���.f"�w)�������r7q-��I
&�H�����d�m�y�/�f��5I�mo�&��-͚I���ܹ4
����Z�*�S<RJKWi�W�#-��d�u2�j'մ�S�Yb���|Ѭ�¡���d��0Jh��#0�y�0�Y����L,����wE�Cm�?x��q�������P��z���� 	-�aj�&&��/�񕷽pn�eB�w��&�����@Ϻ��h0�0�IR1@8�e�2Z�8���9z�o��&w�U.o�7�2�|<�V��ʵU�����rm�k���X�B�nS��Z�����l���*8MnR�i0���`�MfU�I��������}n���������N�T��ù�ayg��|r��5޻����C;������-�5�'�^��פ�5��9�^�F��r�^��פ�5�m	�������TrR{S��ďB^,	��Ȗj%��b}���m�kj:���Ԥ^�+��Y�<^���/ꨠ�E��F��9y�ݶ��P)�ͪ8���_���.�C�ae�+����t�`]�e�T�#�fv�D/��4Q�Hߥ{l|@�6"� s[��D�L��/� �Zg�G��P��5SԱ�Xm����s-{!�����=�X�GI A��E@W����
o��8��[���IY����(4:�~��c#��Cm(�(|������Ō����D�xKi&��-׃��ù����!��PF��|B��JǐڛTV�j�wR{�K ՝�+2�I���D�6�������(ɸ�G���=a/�$X6Qހ������[���r�t8G�st8go#����ɺR_��^���|�y�]�[��'�C��H:�#J@�=��>��L��jHh�ʸ��* �$�� �+'@�#="[YHXm;�v���
�S��bA
�h��ڸY��/��G��� �3��:���=yX�����ٍ�+�r��
����׽Ú��ē���*�Dv�Dv�����>3F�a�lm؛��n�ۣ0�p0����uz牨���[�ʢ����-��R�	k��u�:`8�� B�,��Gs�_�Z\H�+W�#$�
"b��S�X��~p ���j�a����OTF3�Ca|��i�9 ����A�WZ,^l��u�w���+bhV�`c� �A%�s�8��h_�*�bO�36�Ȏ������A�)�H}�:��J�\#� xM��Q;/T8v�"S�$j��&*�),��&
�E��~P��=�����G��-~��*8����g{�H�h^:���4�.�A�2����1���*�0�à�"��������U����PE��[E�>XBQ�O}�g7@���Zٙ��
W�<�]/�$,��^�G?������� QG��P`f���@5�rY'�V�����0<X��ݸ���*O����׏�6s�����Z[w�7>�A�����M��E�~xK��ǟN,��o�a\��i�p���{�� ���o�l��yS�����I͸�q�
[g6h��p�ZQ�B�ec�_<˫�$�v�SD��Μ-��"ryӉ}܎��R������\�ߧ�a��i�-sR��]�1�&��͢w����Xa3�pЕaP)��:�ԧ��]E>�fi���{�18�m�S&���Y��ב[غ�����V#�F��ym,R&����)M"�5���a���4ӚT{�TYl�$b����[��� OC�����1[��J�n��)�B75b@%��[
��zL���.N|�a��Ɲ�C�זL��5#��܃o<Y��ÎPM�ͯw�ꄾ��N��,�b��z�c����6���~�t4\��Z��$��i: �  ��'���2�J���C��Z��6��86��o������d�o��G���9�c�/؝H��x%2�I���l�+���B	�;��h#�)w3�),��2p�H�Nq��}��a�/	_RȷU��Y��=o%���Y������s�&�k{���?���߰��0	�@��6�k�~r�:i��\zv:��aw¯����ΕuA�����]y�uK=�`��Upfkr]�k��,�e\~�?�M��iwf���98�֏�������۟����_�0%阃�m���'�Dn�Y_����)aPi�g���v�Kk����O���x"���_ A����%�-��p��6�1�9�X{wt8�"���:�~S{\�i�h��Y_��0<��ZdRx� R�Z���\� P������?�b�IT���qa���Q���p.��$
6?^;�Sj��l�>�:Ͽ�f߸��g�jh<�O��L!,���~���^q��%4�^�Ȏ��̶���l�~����y�\/؞`b�Å�����:W�3���nWϿ��p!t-���i��r-�Ǻ���A�<��2H۬?��8������Łh�N
��d֜��'�9]����Gr�������a��&[(hb��^�-;����e!z3d��x��T��r߯�O�^�I��e�o���Z`ŬVizoV��0�_��.W����7?]�/���$�xh'�O�0L��/��	�f=��@N���
v�5    ^I���l��(�e��t�6l6Й��	o���cW��>���ف�9���=�W�y������;�â,��8�Uc�#k	L7�a.��+�z����|�j�\I�_����{�n�A1`��s�G;w�&�Ǽ�4����|���#k+`��D�`\Pc�XE���i͡�!�ֹZ��@r,�o�@� 0�O'���p9�3M���~	$��|8bnH��;ʕ���͟yOw�N�������1Ø��]2P$m�Ѳ���
4���� 4!5$���ӥ0��Ԯ�BT���w#R��]<)�{��;h�pJ�1�V���"�泳๢�Uq��W!!&������ճͥpT�@���8����Y�E�c\�X	���f�0�?�4�,�N��D�*c�Ѕg�'�� �t�уV��Zc���^U�A�5��2��`��'͉Ft눤�Ue|t��`�92�2�_���k_2g\��A�
%+��n>_80�3˸��W��=������8{�X�of��C��#� ?<�>���R!�`�$��W(�ޯH���%l��XUF�lP�WT�Y�1�>�[/����2{�	(�O�V���=��� #�� �/��j��B�>ZE���$"��-�����Y�7���u�) �S7T�畴YT1�fw)��T�������`	%��.�⊙��\��K M��	@��>+��~��_�g��1�Y�e�'J
)�]7g��)�NH�F�b�<e�e~���%�%��)��#G�m�#Ǫ����h���>���*?�6}7��J_�nd;OC,�� �K���+ml��^ݔt���ܫ;�%^�ol��?=�<bn�G�6{�����=�����9B�o���`>ug��`<d��e���;�����B���Ü���spPak� (��y3��el7�Z�!��k�n��������Ǜ�B�r^��{h(Ds�@K-R�����̂���8�C׾ b�g"b6��{@9��L�O�F�w a�	W�z��?2�È�ڹ��2�q�c2����#�	P���ȁp��9���/����:3h$�������s(�8|wFW�<U1`T6��о�4����1%�ȗ7��y\%hQ�Q�F�o>�����)�8sM����7B�W�V �3��O`��?���;9W	��k�7>��P{=�����1`������k���/T�/�Ơ"{���`@����'��+����1z�ް�������
%�?Y
�b��K�h9˲,J#m+�p�6���N%h��$���(��������0h+N�^&�64���x��-x���]s���K˄�0����S�"�:���z�ɺC�2�:��f>>h��\ﾷ(~�r�W�s�?Ӻ�ܶw_�Kg�n*uzѽb��^�`>6�0�c��1�"a�N֛��D��dyj����;��-c��D�k;�������]�k��]�$���q<+"vGI&���������s`��K[���t�jo�&m�Z�5��h�s缃�ӕ�OEJLʧ�y�Ҥ��U�В��e�iUS�Z{{e��K���y8� ��;�r-`�E�r`47{�Ѡ;����W����ƿbK�i����$�ZD�Tj�M�ihfVZ�i�c�p=�ys͔%2�z�O�k�oe͜NY(��Py�OƷ��eJ� ��-��$
�3�XEEDcʩ*�W��T�II*T�l<S(�qruH�W��ts��?�A�-��g���A��Zp$�nk�K�~���o�5�~7�|�)��w�\���'��H4�+LDlLܕ�K6aeF�6^3i�H�@���K��0��_� j �)�k�qIG�AH._jE�7�:����k�^`"@���#R2�U���"�'Q�a! ��_X�J��s�˳�;��LF����J3`�1����3���E&８��_�}�>�t�c��L�x4,�� �������h��@@� '�\��[���G�L�#�ܜf3�
J�`����	����m��iIQR�bx���'#��Ю
��x�`֮
��Ю����v�?��xK#�S1�t�wQh��^��"��V�@���	�Mhm��h�̺���h��9�-�����������i�ި��-�6�
2�u��Kdj���I�#2ɫ,q����#J���,۪,�ƛ���_^�Y!k�]�t^��r�"�38>y�n�4�������s4e#f1aY]��*ޛ�Kk�^���6��*n �]赪�+G��j��)媨�*ʸ>���+J�>;���S�Z�E}VzA��ް:�`5Mj��(���f�����b��',��B�+�9b	ū�މt�̽�BQI�소�������"�7�C5�o��-��f)U<�����*o��tn���7E�I�jTX���)�(����U��r,JTE��7�*k���J����TV���.Y��WVR���jYQ��ȟ3�3%��.�֝�#���ƨ�OG��Bs��V;e��ȵ��qf)��[[P���5k[/XۼZmu��T��{΃�s>��W-���maՒ��٢�u�>,�qo'�>wP�A�ϺP�Va���[!��Jlk���S���%8���/��V	��dK�?S�U��v��$��Z�������0UE%'��ʿ�s��<�l�b!�A��q!�-b��[Ӝ�͹9�NFSu�16Ln1����ͮ9�&�=�(�(�nD۠wk�V��R^ڻ�N���jw���q��f=���̕6�+���y\��u3ǔ ��o��c#Q��Ww+�~��L��(ݎLi��=��v��[�J�G�մ��a���o�[g;�?��l�e�ho��i6 ٻ����(%)�iL��Or�QҲ����=m�Z�B���a��L\E?�z�k6\���k\����eus�/�'g�Β��ny��{ӲZ�)�o�X+�Z�M�nƻU3^�Z�Ak�N� ���d{�滷�o���m�h/o�S��@R,�U�9�j����l�[ᡫ��5q@�,�+w�l�NŽ�����w�5�Mp�d�64��%ڍ6�;��6��'�[mE�0I���1�WG�G�X%�f��c�=5z���툓���b��I�HsMM�a���9ʹ՞UK,�p)��h\e��$(��b������Ò a��O�PS��UI ��·���ևO}��ǽ	�����	j��u�h��������PZ��4���4�C�Ľ��U�Pi`�y��_+[��w5g�^Q���co�P�ә9NꝞ+9��Ѡ~9��(�:�r�g��^�<U�шŜ����.v���lU��Lk;�����q"+"4lT�X-P,�
٬�g��Ų�.o|�ɥU���K0l��+u�J�����[V9	qA�J����^s�j�:�Xr�I7x�%e������I��m`��w3߲���A�?�]�'�������Jv�i@Wv�7�j<�]ߊ�W��:�����g=��Kg���2;���&�g��[�Փ����s������J��}U2��H_�u��aw<��j1��b=<����op���ÿ�׏�	�4�L%᧗�7ǜ�'��qUu;]踭B�[��t�ٝ����K=�;�2�V!�u�"
�%_������St|����}vd�m��s뻲�U��x����
M��*t�h].Z����
�].Z����u�he^�.��E늬�\�.]C��u��˜j���rѺ\�.�4t���r�q�q�ۛr�Ҟ�����y�%v������Ou��{)�]b5���鰟����F�::��~:��6��O�O�~�D�#��l�l;��t^�k�c�e�l��=f��=f�':�5K�n����Mʜ�m�[,�񼅁��'k�ښW
����$�qC���	��5��~Cd�.f�b�v$4��;2G{�b���`ڝ�{c��[�Z��a�$yuKBݱ�>wl�-	5��5�떄�%�nI�=�tKBݒp�(s.�уlI��RW���eG�N���F7�[�3t�o��Aw���M֒ua�����ns95
�)��s�����Z�-bM-��ֽ��=�Z^�����Z[�    �.2����V��U��~���nh������qC+��ծ��c:֠�>"�nj��ZiMJ7���nj�E7�:�#��%�*�0D�L��]6p��lFݐ�A6����PP�|�С�nX�mR�%]�#B\���SP�0��������6�B��:�_���U�a�"W|�&q���� j-�Q�d߭AS�A�����#�r�2<yZ�i%���K��n�fI�&���D��&�w(I߁���C�t�/oMd�Ǐ@w���TqǤf;���W����� ����9_������?�?e����G�%|��f#Y7�d��i�A�ْA�ޤ���d�A��/�!��m�N� Y�"TU ]JW���ytE(�r��tE(]JW���"E]JW����em0�U'��vE����PU������k?&�}ㄥ2�m,��Ŭ���
Z�}+��{��;��&�[�|�Z+V۴�^�q�@c� ��k�t��Jd�����l�_��؞fc���TGst4GGs�k]Gs4�=X�����ќ�0tt4GGst4GGst4GGst4GGst4GGst4GGst4GGs��9�yo����͙�{��l0��8��N��f1}QT�����s�/�KG#�^#�{��^:���E��ѽtvP/~=�^:-��k���N+��N:���.�u9?]v���D�t�R�S����~N_ ӨSۺ�ԃ�(��m����i��
��=�tO+��J���!�R�=�4��k�=�tO+�I�VՀ�=���V��<L�=v��6��������BA�@���{�X�)�jJbg�^��u�������6����"�8{�m��0�F(����n!~���-��	�;�u��`i-�R�
`}������n�\'��
~� S����g����<�U b?�-�����m'��aW�/\5�W���tҊ�lM���NZ���l�;iͪ:iM�������uL��>�[��ƹ����=�����{w���q������}n��E������Y���Y֣�Y�'u߬ҾY�������I}�&=]i�������+-�w�ҢF�{�r�Ң���+-�m񿎮��+-�J��*g#k%@�v-��W��5V$�k������uq�c���b&w_�m����N������^�p�?�6nZ�q��V��q��}&�Z�:]ٱ��٫ʎ,�2�WeG���l$5ꚘU���#�G�r~tt����a�G� j=2�m��:��fw`f�	�'	�`�����<
q�����a�!��6��p$�t�s��Àj���]���{��^<�䝗�N��/�ltX�O8��p&��i��D�U�m� ���:���:<��:�r�t�N��t�noCH���:���:���w��x����x�&`���:�����xTf�O�:���9��u>��#>Ҿ|>�(�`QN��t�H���6����#>��#>��#>�{���=`��#>��#>�᣺�aon���Iol��+Ι+��5hqV���Q-mqV��^Y��k�ָ�I;��u`�e�,�5�M�tϣ{���P�?���M�4���)S
ps�nE��In� �7k�)�-����#�ϏjZxT���Bව����̟ip��I��e�m���F�zw��+s[�oS���(��V���$+��pڕU7𫢟z�����+���j�������l���-�t�-�E�F]�������J7?ݳn��u�[�l�1+Z�囜�o�vIk��+﫶S��@�ڏv������(Zմ[�bc���O����-6��ѽ��)�I�Ьk��H����@N}v�T#�}�46)����ꋔ&�ʚ�V�0c�s�iM�=M�,U!Q���ќJ{IP���Z��ч-�O%A�Z�z��1��@�-�o=�xOCu'�0�W{�F��Bo�$��* ')�p>WN��BzT�>��v>§����b�6M-�'�	���B�������7	�~A��{|\�`tDW��ZM�@x���k�S����V����a?��e�[�(��z�+��|m2�G�n:'E��mv-M��3�l86��R#1�
������4�����#��D70�������u�����9����+�%si�Z.�v�W�V��8�;����
 �S����`��,�i ��׌9ڶ�e��ao|��5��^�t{�^#�������b8�=B@;�3	;Zf8�kgA����L������aτ?x�r؟��]sb�-�ޅ�|:��X��s�����W��
�<.����t��Qw6dP�DJx�3�,�'*�=�'�y����`�{��Pp�1�nu.�g�v��g�W���!��p�ƫ�z�$9h�>�Α�^�X�� w�_�� �Y$?t��@�H��?�<���'}�wV�~" �x�����i��t�k���&�^[�Z��X	N�O�>���`a҈E0�_���"`��ue巔�jzlF^m>��~�댂ڞ�7g� a��Gq6��2��rK��Px���3=�� ���F�m>����h!�8~�C��~]ZA`a�}+�PU�A�Қ]�������]W���Pj6J�4B� 3�sy��X1�� � �dj��8k%���k��������3�<\��E���k� �e��W�s���+����>�!�"vj���e�~z�("�(`;���J�If�(Q���#�:��f搻D·���Dy#� ����=���
M���ŢR������=���.��7�m4���\�n(���T����Ƴ��1���GE����L�U�d��WL�#ΔL~�q��\1����\�g*&�ۖL�j���S��r�E�Rb���7`!�e,���ҟ��N&~�.��59V�wy���%��h�(5�͟�X�Ɗȟ5��W�zM����Q��v��	�����]��X��逞$���#��<E�q[qmd�)��"PPQURW��`n�[�i֝Q]�"���ڤ�fK�f�N�t�\y����Z� �FuJ�`��&ZA�;�BKJ�]�B`�bA�U�)��c��!��ٰ��v�E�`47{�Ѡ;�`�bW
o�`��Ro4��-L������B��B�=y�PՊ^�NhuB��C�����ܜu�
��O�^q��{�8��Qߜ��oF^+y2��
�a�!�*J�������^h1��1�ޏ��<09�PՔf��huE�+�C]�O����I�&�-��͌�d�&�j_�,��}9��.j��ޮ���l-qnt�A��.ϡ!�W�l�N��lc�z�o>S���.�˥#�:�,��THr|�B��#5nh�*��J5��*!{���!�T&��޶U%1W~[]˹�{+��ԹR$�j]�-���,u�sҤ�qQN�dXqG��Mg����q����?�[��T��6؂KK=w�������a��:�}t8��4�}��&�i�����fw̳зItW%����p�������M���h֝U%���,�$�dQ 0��},��w�g�r��F�{�L�F8��a%I�R��#�0��B�^a��t�͑>�+�����鲬��.s�����.�FLg�Ҵw�"�D����:�l��{�]s�)/l�b�O:�5�ܺ2��+���,q�������ֺ:����Q}� ��.��y`�t�>�2DJ8f����΍˽$�O��|0��3�_�\����w^�����g���3��h~�(d��
����O+��:���r׼��6��Y.N�-<E�,�YN�m�V�H�;�'�q�"�*q��H}�-��t�%|Eژ��޳��	>�x�����8���ޏ8k"Y���J�)Q�$�*mi�&Y�3Sr��lɏ���>��P,X������<���J�}����5��T�o�:��e#!�Q@�	�E �?���]�5�F��hB��b����O�&���d������m���c��苵��Q��=#jK�k�lc�w~A�� ���lv�w    �3�K��rm�]nGv�<�c���Gx��b�#b ac�-�ud��o~����� ��`��nb
�@rb��p�ҟf��������I�J�@k�yo2�������O��d�-�z '�Ϡ���u<����^:�Ā2���IGj�Q-�VO��:�U�p��J��k4��B�1Ҥ=C�i��Q����k�!����=Pη�Z���IB�ao��xR;�F&Y<3Si�L��$o���a���<��;���ռt �l�Ьk�g�JB���Ջ���ɛ�m��M�s���e{�);��	�j�Է�\Z�u����-�]]!�y��]UǮ*��1���n�_+�_����,�$կ޽{|E�u�)�/�2�7���S���~x�̾z�����>vd=�*��t��we�n�r,�TyM���<gs�ن�
M�*Z�jA&�=9&&+d|�R9&��R�O,�y��;�12s�j!���O솼�������"�7qj`���܌�G�xPyEyo�v1�M�c5��(8�\�[$��eM�����E��%A�fQ_�~QA}�T���z��D���%�;���J��S-k)Q��~o(���#ʶƨ�[]��?@*��Ut��\k�g���z���S�د-Ψ��zE�u��ʏB���"
K����CX����{a��xcq���������wP۽�9���8�nV�������K*�gː����ǽ�T��Ay����B%�dG�V����/k����cN��M��@��¾0�ZMJ��m��L�V�n��n�j�@��L�6�bS���4V�w�`���{�yo8❉�,�$̸�5{�i����u'��:�#6Ln-�Cړ9��C����?
��<$Ew�
�m*�9����7��R�ȱ�h���=�����(J��=�yb�H'�����C�_T\'�h��T�Ctb�N�br::1D'�����Ctb�������Ctb�ǜtb�Nщ!:1dG�!<�8ܧ����Д�O�*�Njg�� k�RhÞޕ-��/%ڰ0�S�e����;�"��2�* *���[��$��b���pԝ�����M
�Ɲ����E3�(<��6&-���ʰ ��bs�94^-�&�A#t�Qw���)�r|�kăg���
�a<`+{F#y I1�E�j�vĪ�i��e���G�� �����k���&����V���d�$�<X"�{p�⏬8'/���RB��1�k������X��8<�
g�*�R��a��pi(��h��u�lK
�:8��m>wv�m0���8,;X�!�����BP��O��ﲊ�	���sy��I�7�G�	h�Y���6,h��
����ѨkŃɻ1J�G�2R���9/��/1;���L����1����>Ño�Ū��l��d�cq�fn��	��� q�
Xܾ��F8~�q\��C��Z}�iQ�fYNL�V�y�LU�U�uYa]���WWm�U�S)c�j�Vm�u�?U��-�g)��T;g�s��9g��}�u���M��UƢv�V:g��;���_�w�`���Ȝ̆-{g���z��M�帮4�?4$?�E$/�q�����!#�Mݳ�:�����l0��ٙv�j��v�>0�j��v�j��}q�
ɺM��=u��[��3�=;n�=;��Yힽ=�l���ݳw���Y������]������y��9�q\G �xg���"�$(f���N�wV{g�w���W{g�wV{g�w�K��ygŖ�ӑ䝝�ʼ���]�ɳ�w�+w��G�Xʛ��[�J�kP� �֙�R��+0��%B�
�7l�&���o~��c4tu*��C�<4�`�r�n��-����9�����t��W�����{A��u'���+��W6Y���+��I�CnLO[�MTL�Z���ȼw��JaY�+�_��1�Z��O޼x}|�JU��9��Qi$�_�k��t�a8��~��Јq��-����=��]|�{7
x���)����0[�qm��1`T����_y�_:������s�WF�sZX�|E�лw��[Se�Ⱥr��.,�L��h�Ԝ��.33Ӓ5%ԡ�%�D��Na��Y�M��SUP��~/;�ކs��S7��G���7�@�/�Ś4Bt�ʪl_��WS�_����k&���93�#��c���ܲ�����h��-{3f�N����6K�1w��ȝ�6c�A��M8f�����6�H!�,B���cQ�cQR�&�i�cQbu�>��?3�cQ;�c�W;�cQ;�c�K�}r,�-��[��Ғ���i�#�c1	΃Zf{�C�����}p!N{�Cs�?.�1�! ~w6�n�B��G��lnP���N�&EQ{��`��G�.��<�;���	z7�I`���Mxg��`�3WP������８����g�����`�Ώ�ٷ��^��r>�>���r�67[Q/�O��Sx�QP�!S��Z�s�Αlw05M�7�9J��$6�&�*S�`o0qs�{�źG�؍��w��ojY�S��W#�� �;��κ{�쵡�P[w�-9)�Y�"����;��敶;��κ�9��;��κ����κ����aos�ۛκ��`4��Ѥ?�5�EN���(�x�N����� �0�Y�5��C�,	.d�?������B�,X��%cPP[g���R���?W�DM5|�2��,
�y�N���|Vsa7��Ϯ���(؂#�o�B&�!�
+�00� ��2qD�/о�+TDgĞ�g����X��Mn�Ț��ԧ1�3:�d�5z�:zה'����v+�O�(l�2y��3�l�< tY������#�ϏjZxT�0�Bව����̟ip�N��=�#��NC�R!,�:�hd�#i<��s!J�P*����8YEp�Uh��U��%�%��Aa@�J���3+
V�Xy��^nI�,�Y�~:��K�Jc�YA��\�:Uq�̂�����oK�Z�^�,[�nbldU�����m��:��5��`hˑ�Ƹ0�ƅ『�F1�� �e�,�@�c:��2�T��D;�"���RF�XBc�e#����j�P=��j���,�V��Q�Q�/�_�
��-���i�-Y��#�"���������B̛{��v�v6��lg���p?P�K}UeN.5LK|��j졫��5q@�,�+w�l�N�2*E�Z�����ȧڔ����w�5�Mp�d�64��%t�Y���-����@����U8?:R�%�1G�e��*�~��;��OQ�����b}�K����*��p���wX�����"U�+�*f�]j�� ��<My�Hy�(��Ѡ�+M�j������i�u��t߲pI\R�U�P+�Z%�Ć~�:����m�-	�֊��ֈ4���o)���{ 8Q��2ޛЎx�}t�v���7"��ә: �j T'��B42�.d�� ���2�J��̓��Z�E�^k�����m�a��ӎ�J�O��4�2�ْ�o
ښo�GX{D7���l�p��ξI��ğ����{C*\����[-s����>����[<��<�͇��l�+,x��Y���tn�}���,/x��5:q��(Hݦl�k8)�S�7Y��)�"�U�y��C#�Пm$��/���B׈9�"�!��v�x$�
ְ�F�@^`�S�W�.�#�HFp@^/7?�Gi.2�ڹ��ɬ�ܯ�k���T�ސ� KNG,�t�⏢������T�群�=�[/���M����=��;܋���6���	X+Y���7,���oX+4��-�?�tfo4��:�1�f;�����fSs0�+��K�y2�ɏA8��:�݊M�bӭ�xu+6݊M�(�[��i+6!Y�ӊ-�Ro0�[��$u�q�\�{d�G�8�-@��L8�^��L����C]�=��^���t*=0���i�]�kɾ&�	����3�VIϦ
M���ҿ���Ʒo"�E�X�#���g�c��	��Ua�S�+�@�ĵ�K�3�kjn    d�����e���#��C����1�¤C)*��	 y�3�@]�����+'nU�����Ǭ�K�ŕ�k`c�,,u��Y� �����+;�)�O�g��K�M�N2��
<ږ��:���Qk��B~`bEa� �kY8�F������5���k?B��'Ϲ�ǹu�����ˁ���C�/�C:��Ϫ#"�偪;��N�84y��{��E�;�,!���j���?��k�4�L,�;�奲��t>��!Tpk,�⯔Z:�"���c#N n0�
)����9:bg��[y������
�,C����xr��u�H`��R��$�x��Rǣv�6�������Ы��Ŷ���b���i�-�kS^1� ]B�" �0���Aa'q	�5�t^"�+Qo��7ak�3Vҍ���2�Q-�b�S�O�9>���s�b��x-�/��&K#�PuB�r�Ű$�M"���Ӌ������b�/��
�qK�ٴ��	�2xY�+ �~�d��9�?��� &�٫�NlD�<�i(v����=j#v��7��.FCȋb�0��t��2,6M�␹��ז���-q ���1!�ϻ��+N����шR8~aҼ���j0�Z�W$���A��x�#��)���ڌ]���xi��K['H�V/�)e�Yڢ�֥�������9l6y�x�RZ��{��O|���LQd����/,�[V��|����`Z�9$A�,-�-(��"��̿GB�{����Z��
	�BF9��k'�; e� !�E.�	�sD^�:GVz�bx.�y�rc��5x���A�S�r7��	�%�yѨq�82��� TNh�,N���&C�m�?7'ss�5{f��Лb�?��u,l��S=��-�'X��ru?������;����S��'�����K�9n�t"?��Ó�Gi=;P�Xb��4>*���n_��Ū_����Tª3NTE�+�mQ����0R.ێuF���^m�sv8GF��:�z�f�[{ʦH�ۑ�YqU����X˪(�m�X�6
i4^�Gw�����պ���,k�50����e6�+���jW�%) �n#v/T�*�
�u�ֵ�[U�SpnQG&fۺ���g˚rV���,KZ]��\��y��N�vj�S��Z�|0j��:�֩�N�u>h��8OR������<Iّ:��'9���$����y�:�O�Q���<J�G��(u���(�3P9@���'<�Qށ�"G��a+(�?�d�"�FZǈe)�R#�B=��o���Gf��%p�O�E��@t�/?Qr��.Q�&!���a�`��%7!�����@D]�A��#Fvr�"e��z��dF�xGXB��2*�@�*�N�&]ʒ/]�W�27.O^��$�q	���s9�����Q}��u@ɜ�l?�Q5�gng��9��J��gW��Kg���2;�׽0�4����o�VO��:�U��֩��J;/�.��c�i`5D�g&`!`����$ci�W�O��#���y63����6fX�f�<W�שV�t5�es�T�Yv�"�e>y�&�4����c~�[�@;�����b²Z��7��Ί�W��Ia������S\�u7u_E_E��g7��������}�\Q���|���z����t�u[i~U��x*K�&�H�Sv�lCS���D�K� ў�2>a��\��!�������W�G��sC^]����n����4�o��M.Tͪ�T��j�
���h���7E�I%����ƨ�+u*
R''x�/�U���͢�ߴ��b�2���q+��U�
�����t�++)��N���xm�W�-T����x^�(K����\y���ѩh�j� s��Y�,e7u��ް�n�t��ѭ.����u�yPt��p�7*�ZP�uے�%_��^��}X���N*��i��u����#T9�B�������1�ʃ���l��}a\����K����3�J0H�]��8IСV�}gf�1�-LU>��X��݂�Z�wЛ�{��p�T������y�[Ӝ�͹9�NFSu�Al��Z⁴��d�p��f7�c��4F�g���xu�Nc�i��#�q6���~w8n�Ƙ���g����5���tZ#�Q��p:���(�3+���^�l*��ꪊ�-�*bj���HV�B]S��;]Z��d4sW�����d��+�8�(�-����$��?����Z�E׌A�\Н������:0k�n���e�@���k9�Mg�-��3Kq�/.��֏.��]�K���Z�_#a��c���1X�"!�����*����n催G�k�n�,ס��(��b4��H�V ���m�Ud'U��'�:`b��ɥ�F�p]6��������gh�bZ���2�� �M��(ЁW�h6��®Io�j�g��E\�/�ui�e�]���߭Xy��aa���;�w�d�Ȳtح�����k`�f���z_�0��bV��R$��������p�I�.|��j�n�!\8���^�=X"�H����x��-tZ���*7��ᛧO�'Ȁ4F�o�M��Fd���}���ә�^��C,�����%���A�o���6�J�X��_�ƀ���u�9�s9!q_�뇱��<� ,K(t���^���xC�"VbI�C�
�hx,�ڀ��ʞF�j�uZ,��]B�;�nxn~t>�M�N�s�{?���B�lב��&c�;����K�V�<\l��k�0�XG�So�ŧ����m�gx�1.U��)�
��|�]��%E�ҫ03	@,�d������N$� �� 9��H�����;�l�V]�<v���"�9>^���Cp±��(MK��-�Pd�H�'L�P�Cv�u9 �G�%?��@�
C������H�s���8}�,�����&~�{V�Rlka�'p��10K��Yq�!s4�d0���,\���+J3<#��/��_�P�: ������cx~����n��\Y���W�P�"��[�T�=H��άNAFH��`Y�� �z���9/���( �� >���'�Kκ�;n��\�t uI�����Zߺ�q��o�����w��I���Dym�S1ׁ�0��y&@�ư�1��'?`lb�T
l�{��$CvИ���ό�7�Z���l�[	F��a�J��0� �]�Upg\�&9J���2�x�p���m�C��A�w֝L�(�?��g���O����l�o,����E)c�p�� �T|]�6�!��R��'�MK{��*����
;�^U��)��Q�e'���R���@�2�������@X�@턅�HDcd|o��DR �q�#����@�jc]�я�8�ᱴ<��Ӟx��B�:����k7Q2:��`�V8\���S��}��&8NW#�-�}RW<��7����u���x����� �֢�:�O����>��.x��7��+�e�re �~�>�Q! ��:��ʝ��|��M��n��n1��,j!v�[��B�b����-�n!v��{s�OeP��M�jy�LE��۷s���l�v�};۾�m����l�v�k�v�m;۶�{GdlٶӬ����y���Yǣ��xԶ�l�'�����Im���R�?����Oj�'�];[�٢�u����:;ZڅVf
�P5��Z���k+�<�S��$GGw���_����7{Z�Va_�~���I"���P<�E�����-,na�_7ܸ&�\��.S��S���icn�)ً�f�N����q����9��rW.�O�t�w6s%n�"�a����(:o߈�B�Ӛ���z0U�P�m��	Sۄ�m7�j7�6ajoE{+�&Lm��	�o�/Ў4��n�0�M��&Lm��	S��m��6aj�0�M�>��x�m��	Sۄ�m´_�!z"'㏪	�ZӀ˭�&LӶ	Sۄ�m��qmoۄ�m��6a�u4a�����Ѱ�5��O햌NH5�6�\�F��9�K��`rV�nɘ�l �p��ǡ�N_Z��_����/-|�u����_%|����l����/��7    �f�%�
����{_�-|i�K_>��m�K_Z��/J���[��_O��y�����gu���l��@,u�Ƙ�Y,���(])GW��O����`�7���WRG�rH�c�&�?�
K��J����]�������0ZQ�猻t�?�z"_<0�m���2�P���]�����W��Aac��w��ٿw�y�(�wL��>��6&�c�6��0�V� �n�D.�A,x>����7��:�G2{����{ghe�&��Lœ����� ��#s"�A/@��P�_���r�����v�܅Q|筀�!�j�P��Z'xj?q@^r�����}��R����7֫8M7��xE���Ѹ;aGx��H�t�N�T�E(x�0����aj��W��[�Tߙz.ҷLJ5\�ت޴7.2k�zۤ�6��M_�M�/�I���hoE���&��I���<�m��f�I�N�M�m�zۤ�6��͛k�zۤ�6��eN-̩M�m�zۤ�6��i�z��8�DI�zMFF��ȉ�������qSv����I˫��V?��	��m��*�%�NvF�L��ƾ�����ϯ�|�{�t�)�����҃S�N���0�tG������{R��X-��~�]k�i��2��a+����.��!s۹��ˊoP!m͂�En��.���
�L̙�z�&	\W�����P���;�v@��o�r�:�p�����_����O�?���#�%12 �����|�%	��0��a��s���P�<�X�\��v��x�8���<�6����M����894(ط��,�O�[�f�1�N�G���A�^�A޶l��js}���H=��	Az�M��b�^���%��^��T��:v��?�7���eHA��Dr;��2r�i5o/vw_�؊$�$�����ç�������Z����&4R���s�W>��w��9���� `$PA�Z��y�w>Fw ����j��Ҿu+8φ�w�YY����L0ǁ���j^Us4^��D`O6r��?v�2�aq���ش/�`yJ�~*DR�fA9����! �I�7��M���\��rbK}��7_��E`q�VF7�?+x��.)|ˬH�<�EU�4�s��6y��lR�Uں�Pz.�A���/�1&o�i1F�1Z��b�c�cp>�#����cd���z��A�����ȑFFT!��Φg�4!�QqF�alL8Z���p��� �·��?Nx�_�aGS���l{#m�~�2�?��
Vr~�Z�r�?��R}�ڨ�~]<��y�2����`���oD�o͚���f]W>�y��pu��*r/��Rv�KN?�D��DKR�~c��ufؙsڛ����s��n�773�7t'7��x1[�ƀ��b<tǳI�6u���`1]|��ܬ.�k��8��n`��l������o&��Y1���&g��x1��+���;8��p�-���E�qa��7�Ucz����<�0=�x��!c��ӟ�M�Hr�{��3����~��� �h�$Q�h�:���ߡ�/�j�׳����K$�_�|���Q�4	I:�g���Xh����X��:�f��{Ҥ>%��	�`[����+�V����'���y,5���T^�G=\�t2 "��k�E�%o�#�M�>9۽�Y'��WB�U}�ZA*S�u7�p�t�����B��ȱ�OzCr�����D!@$�Ywp��M�� ����*�9����:!�?I28e�%�?q�Ya�fش��r0.�n����c��-�X�!���n���͘�yi	���!j���u>�w����sI�;�^H%�S���j��b�0�;�?���` 5˾�}��h�۾���ʝ�i߫@�\t���	���>6$����d�q�����и��N��gOa�p#7�|�~Q$&� ~�)��E-�u�# K�ף��S@]S
#����v�J���*���%�O�ͣ�����;���~����x�<L1�7��n�աu|'i�D+��ſ���՝ΙS����L�L�xq������Xv�^-��y�YE�b[�(�3�2���<�����t2N��eײ *sM��x�/߳BK���C*��Ulh��n󶧺�T��i�pò.�Շ��8j�o��v7�>���1�����%а��<����!�㨽��m�,�َqe;@Y\� ��y�6D��u͒��$��A1�LZu�q��t��1}k�{�n��ƯMݨg]O�*���O�f��o5�M�h�/�&{�;�����޶���������s4����}�;v�l���f��8�zs��bTt����dʃ��a���Mx~x><?���yPF[�Ɠ�@z����ו�t�o=�R?�&d,�ށ���㑵ǣ����+��]�c)I�w��"���_}��t�̕\b��a(���M�{�Y��Z�E���5���	&ֵ.�Ub���y�0�Z�=���_�|�U,W�9��x^@	ʘ�2 &�C�%.��%9�ț���]%�qNy������u��#���;�J=�	�>��A=���{:�z`* 	�!�"8�=�_����^ph�濛��K�Y`�z,���L�g�m�m�
��6X������8�W`���M�����kjp4���_#��M���7ձ>��㡰�a�U�~Y�J�CC�j��T�6���c�_S:;���鬧z�T7!i��Ҡ�{�E^�Ľ4*��^�'�9氿�ڣ��l��\x�&,=Fռ��S�[?��9�7���X�9��z�H�J��hS>!r(����k_�)�d	��X�����<�-^� �W
;�͎\`3r=���N�ە��+/yg�8�d��g1"��5�F�͸�#-8o���TG�d)�AIn�!Oּ	f�Kla�>�sl'�܏�
V���_�J�e �BV'L���TE���/�=\X"h��R�A=�B��PV���d-�ۓ�px���x��Fe� �I��g��g�3FF����\\ٷ�'ӭ��Xq�)^/?�vdϨg�	��L1�8�����oY9G럍�S���H��6TX)Zr��W����`SN$�&���"��? x�Q��HD���?h%�\����},L�`�rL�D�,ԇE����Z<M�	ͷ߇���K��m|�\|9>C/�wr���[d�Ȣ�\��7x; �M����N����,�V4�-�� �J�G��Yo�I԰��&��OTLW�j�T��/E'�5����-��/�g��R��T��VM��}��z}���k5V����S��\��?#V�Eꄸ�X��|��T�=�M�:�d�T"<�s��H�3���`����,�ǫ߽8���`���OX'�?�^E�| ��t�����b��ޝ��b>˭�;I�m��W���	B��xz�ɕ}0).W>�2����]��NA)���goD��߄��~i�}<���h�/8��O�� ��:~��͗/.�w2��F`�d��9l�}WDF����ӝ�;mp�LK㔱>ғ��E��M=��IS%x����NI��a ��rܮu�73p@s���znyKʽ�E�ZEm�,�
��B1U�&t�����be�q��x��� A7BKݏ-���[�%T8�&���,�8]b�� k8�c�s߻U
 �&���}7J�엾q���Lx\�zE���B�� H�r�;L� l�$m�� T��EД錮}��)��5�?�4Y��8v�L��)=��)�d���Q���dY����Q��x�5;^C�gZ��_Q�ڝ��R��IAӁ2NH{2%	������^ '`�<��u���@��°/�E�M�Tf��"�&Jb�&ݟn�������q�:L�p�(��9K�������?-���y��r����q��xβ�h�bָǚ6ԁ�4Y�����}�$d��� �Y����&/8���*x���m�vd� 9j��p+�?��߈������b��ة���օ�������B�:�YE�KA ���ncX`^JV��T%T�    6&�B�WqY����z66��N���#��W80��m�T���)66���3�G�����[:�1"E�@:�_a$�c�������R�O�txHQ��Aa�kΞ�d�l㡼�N� M*����H�������b�q�MX&/����ԧM�E�����]���X3Wױ��_	1�m���I� Zq��U]x�#F64?��f�G���q�,N������|c�	�{pF�R�q��� �"Ӭ�v�%�!��(.K4���#�N��r�*O��>\�?�|�a���M�X�Pt%�<��A;ʐ��\�eSy�[(x)ZjO/����o�-�E$�W���.5z��(�~XνD�zB�8��������z[Ċ��5��l�C��Z��ݹiv�����n,4�-�2��B`��M�+j�b����-O@O�L.Q�"!_���6�V텀Z���@���:�k`1�װ�8C�v^���;�c鈱��7�/ȶ/�L�t���}N�q�o y>h/KDĀh�	�a�k#�3q�lR,��!�R�����]փ�O��s�٪�H��(̡��<���̐�!������n5��"�I�<�p�v��04L@N�v��	�<m� � ��C@�"��A�����9�w��8��q�P���{y��&�5�S8��H��'��EQ�� �̔Q�7���X�s���M�jl$�|���%t�ٷq�"�����9`P�.J��\D6� 2�n$q"S��{�!�f/"X8)K��/�y��q(��Y
��hR��NB)JD#(�"<!2��;��OR�����sy���"��;L�
��@	I�D�X1��ȷ�0>�����������l�
��5�'a 4�_�?��	Ɉ�IJbl�7_ϖ7�n׻6²���N�\dML� �-��7-6�i	[S�$H�a�g�$����q���T�W���;b`"r���iAP�.f{��p��m�+�cd0��B��/�vwZ+�l\T�Ty܎(�&�vPP
��u�V6�{4
�_Xy�Z�?
P��/����u�o�1z�2x�2� DE�9m�p�{-&v�J?�y��^���:�rA��zo�ԥMT�ׇ֋��z���?	\�'o��*\P�8G���˗S�k� >��(]�vN�%^G}��P�YY����_|�c�h���1G�HǮ�� ��젭�6u#�Y0�(:�?�{IS�U��]����qlI�F6M�z�E������Po p����
�cK�_� ��PE�n�-*�.�K~��m�d���[����='o��� l����,L��ql��'�I=
�sR\�lP|����x���@�GG��=k/22"#Q�foDW wc��u��~�y�"��HZQS/ry���a��N[�١*�)�Vi ��7�`ZnȂ��􌫦��&�?���������^'E,:�0����4Z��(#-����!]Y/̏�_��U�H��k�����AT���$�pѭ�E�7%Di��{� �Q6q2�16|pĖ@�0Q�з��'R��u����!$���K��߾P�+�� ��g%�Pf���.q3��h��w�}z�������(#��߇����a;�Q�{X�E7ºx�L�=Z �c-m2��}�i�i-��S�S���Hbg�R�]��d����7V�(<1��� �0\�.QL��:n�@9b� �a"�������#��!J�\,��-$Č���m�C��A��q�Q��Y�O��H c�}�E�H99����3@��I���|G�bb.�Б��n�S�_����3bJ���{u��0�����~
��[����n}�xP�fN�����"\�ǜ��(��؛�-)�(����Wd�U�Yhp\��"E�Є��x�A�?5F��B�"�3��v���A����4FTz0L!���-�E��VS��&k�v(�rJ���޺�P�К��Tz\����-�y-��EYe�ԑ&�d�tU��0�#�
(��Yh�C�g�c�� pA�'�\)O�(D���ybQ��sxz�oye'�{[v�x��u�����A���"Oy[��Pt���1����٧���VV� ��@��s1-$� �|{�KZEB��
(��.��*��w*���n�o������pw�R���n�~ �X6��qm5��h"D���� �m�)��E��J�� ��<�7�:w��(�}���^���%  ��c�AH��IE���a:�v�\���_��h��w�]y����$��	_$MQ$(e`��O��q��niL��Z�tZDDY��\��e+N��F0Z���~�
�@		`e��g�z�x�� 6<�-�9�����lp�.R��)m��� au60c��78Lr '[Ga���Y���Q������P3��?W����a�_m[��0�����y�"Y�AMh,
�� ����~�����`ã/զFĄd�5��7?P�AU�zZ����#�V�pB�z����ך�ȉ���(r%U	�&ʧY݈�\anO�R&�lc9�f���Ő�D�ɨ�&e��BA��8,D|a$j�$(��Q�H�nO1�]T1�����hc���"�*�a���?�F,E��B%"a2����lf ��'�����u��ގ��([�'M�-��R��*O�����ITI�m���q�i|�@T��yec���G����L
��\�v`��QH�@\ʕ-:��LY|���T ^
�㷔����-����x��L��m�	�I̖Hυ%�r�V;���Ԯ�t����\PQa����d�J��"i���S���(���&ro�+ň���
��Y.7��z�<M[�9������H�R�Gƣ�|�d	��e��ڥ�F��0b��ƛbl���������h����hZ�<F�(Ω������Q�A���B�����ҫ�B(��czx視/ ��0_�ћh�W�Ap�^z�*M
*3h rM�3
�̋n�آI�6Kl$qN���ծs���̒.K�T�8�ܭ�0� ��|��� y� 2^��,u�X�o���X�ʅ"[�Oȫ���p�N�z������jC�08�I�m���|�K#W�.up��EE����N�<F��/���Ĳ_"n�c��w)A��Kn��e�V(	�U�m9T,��]�rŶ�
}f��rTr��E)�O3�l9n��
���h�P1��I!��λ�%�w�a���=ۜ��6�bݩ4/IZ0����25͸��|�Z��e��G��6�&'�n��t�,!�a%�- Ή��`ֶ\�����G��4!bI!׃'�q�D������XHI#�5l��=�-���ΜǶ����9OBGK:CW��_m,���7�D/F�k蔤���3v>�'7-��<ݘ�-%���g!�^���*�1]TS�!�ܜ@��}N��u���|$�����x�.pn:�YR�x����boqό����� [���l�C� &��u!�� N�*�H���ߜ�<��Ս���x8=�
��d����c�6��ҏB��� 6c�]���X�#'E��wº�>�l9*��X�a�� ��t�D�E�J�)ɽ2�C����b��J`���FD�;y��>I~2����7����⇘E���Zr�%������o����ϕ��9Њ��1�J���b�U�X"�}�舗���_s��l�Qs���3c�	�;�P΢���L6uU%����XǕ���T�QPX�J���``�����R�N�j�&!CL�avJ��X����&aJ��2�y�. ��Pu��OH�;�I�4U7��`�$|�[��Ϧh1�A_n��HG�������o�:T�{U���1�A���Sj��%�lx��bd����<�ڥ/��b8�*��3��T6C��!!S�{N0E��ϼ���?�Ϧ��&$����ə�02¨c�����{�~�H��'�    )dL�-��]�03��hڍ��O�$(�*��@���Hc��y΍�$#�"��[�T�d��j��J�P�
��*��{8�/gnF�t҈���,:҈ޏ0�P�C���6���bm�bs(;}�aJ�"mq�:�J���e�8�7��LL{��sَ������*�Y�: �#��O�0`�q�Tˡ'�����H���z��)���pίW��jf�n�s�m���#�gG����<5�U�?E.��U�m�M�}]��MF!��t\��5��v�J"
T�����@4\$,�F0�VQ��R69h+���$7F�!$��i��1��bP C ��QV��`46�W2WyM8mv� eG\T����$i���53�G�+�h�����2���8��3y��U�r���oѤ�u���*u\-e����(ы[�e>	�u�N+ͱ	����S>�X»w1q{�p����Dl"�i��0�/o���/^�|����x�x���09~<��&$�����J�u2�!0$��G1J�rl4.w�4{�3Sr;8[���q3^A)7�pZ+�ꮹ`�8������V �������u��īoQ�f�ԒfG/SHw�&�rF�S��,��F^ᒪz-�~�At��o�x�s�췳��\��w����Yd�F�Kד��:_xHQd�����+gA��#��ML��@\yG��z�c=�D?��ԋ)�_���"�8�%Î+I#t�)�������u.=G[�j�e(�L�T��\����y:D�bL���P�am�6��b'M�Y�4*E�[M��qȓ��I�3]�Z�����d��H�O�{ʸE���W�V�����b4u)�*��,���r�	��&��t�Eaq��l��=<!���NrDk���T(N����\$�����Q��G��FV���È�P��R��M�.��N��;��Đ#QYg|���R2SK�2����F�Y�*���%��9w,)���n��pq+3P��RN ��<�7����u�K��(�x�%�@r�F�n��WEbt33����(WIBr�U +M�r]�,dN>��z1,�`<W���}��tZ�2MR�!T_a�,ӈaˌ�A�d;��H�N]�>��+)���C2ޱ�А���NA�����lh�UY]Ń�n��R���XA���������9bș��W+M�Z�9)�0�<d1F��O��FD\*xm\�S���QL�V�x/u0�ZW!��(0 �dk���d�cK�! ��s��-�k�^E}��ڇ�`��Ѧw���"�˰��;kF��ˬ-��A��&{0�T�-���TUX�M�m�tk�x1T֋0|��<A���P7�9�0I����.�a�!��u��g ��3�
�Z��d�(��1&?�z���PȁX~�	�C�L���� ���>��3�:����e���\P5C�V�+Z��F�M�U#7��Zh��|��#)�k��!�
���L=���{w��D��h|�)��[{�v�sU���ʪ�E���Q2�^
��,��U^=>HR��q��({!KV���6��aLYF�\̛��1+�xf�<���ʛ��������[��ab9�[ǘ9n�*lqS�lľ2�Կ��Ѭ��������ヸ�a��~��	�"��a�:���=	4�ȟٳVT��B��.�kϱ��$H�ȣ�����^)$+qVʪLL�+�:d��"o�e-��*GF�)��{��et�caVThE��Lƫ�4)s^��-�.�+�m3�BP�}�.���RT�a���_D�o��|�}��P���U�JU�`3���B�YF�n� uLՀ�R�Y�`�&!dT��f��xiTM2����D;f�U�p�)�TG"`چC�_v�P(�9�ra?�JLu�R��ƙW����u��,�hR��J1`P2zzˡ
J�)K�4������8���w��蔤�~fi6�F�mV��e���R�k����@̫��݂�P��SVנk�@I/�]�aϗ�i%ۼJ�`�Ȍ�<y2>��Z��w*�@�t��alkX��ְ������-є�G������m�D�C�\+�AT����\��S(�Wm��27� ���n���T%���a�ե �bɔ�Nn}�MM>�K��U���V�ADa�1�h@�`�XLAԿ���+*�*��'Z�����JV��c.X��Mڈ����FTE��/Z��F��2�YJ��
TO�#�0�mw�)5�z|Wl���F��h�´]a~]a&����lԟl۪
�75{1:��7n�/�U��a��e�f/��Fƣe��^�f/�����;���T��0�D��'��-u|�xݬ/^���|Ⓛ��~�x��h�H��}�ں�Vq�}��c�U�,)��C�l�Ύ��Vs�
L2��rT ���8�Ė����Y=Z*����T��/0����7�"�br�~����+�'�s@B8���p����^�'W߼=ч�l#l�����Qw2a�t�Fᵷ�oi4?������Å�_�0R=�3���E�r�ٻ{��|�뎛��%���l�(����`��3�=�y)�d4P�`�E~�3�uH�f�*�^��O�̭cE��M��3"�����Z2�4_u�]2/5;VH%F���"K�N��(���H'��T"��ct�p�S���̶�7��D8ޥ�S-:��ʹ?��En��T,*L�yϹ�l����}��O1�ւ� <&��H\�>��OO�q�'^����7W�q���u?�%V�d�#������IZI?�����i����o��S\-+%�ۅ�kSX�:-q$;��;��*Hb�[z�l�BSBѶ��=63�%�	�����SI� H��ܳ)���u�u�a�]iI���b�n�}�O�߽��Y	a����Y�"v\����6�;��K���Z�m���/�����׺Q�JJ��\
P�
��ch����6T:x�2�{��t�Љ�fn����_T�.�X��	�b��Ma[�3:Jw��ڝ�KoZܱ�z5s�����\��?"�$3�n���9b�T/��^����e1����v�PT��p �Q���+,����G&��{E7�PQa5� Y�/6�V�X6�ؙ�
m�˼���ATFW�\:�Vr�ѶZ��*,#����ҫ�X���bR�d�:��/v��@M#u������*y+�"��,&���Kh�Ry;"4�4�ب�����G�\��6m6�/Y���k����yϕA֞�1���/�f�nA�2[�^�{��5r��$>u�{�i߸ע�^�f#`�R̭p�F�f�c�9z�y�M�7(PX��EpŐ1�e������9Qƈ��M�r�o��T�����Y�(�gr��p�������{����bXv���Ϫ��}V|��S��$�@�n�A�W(�ޭ�S\e|� ����gý���L+����8�cvf���Z����te�}�^rw���� ���G=Z�	(�&�ʰL~�:F������ء��]�f.�e��*Y,�e\>�w���X,�OE��UnhgY�l4��h����n@�mXɀ0;�SP	��/3�
�F�����Mʢ�i��]i��v3K(]p2��;k,�l2�ĸ��l�ƳSe�蛍g����*k�?�\��5�|,]U2�ur��m�u��Q]��o�z �*�^v)!H�q]��'){�e��2
���J�H9\�BZFfgDq7����;�"���o?=�oa�Y��nUS�����gfᐻݴ�$�$_ <�\.FIC==N�ē�يA�Ƃזc��c���U`�h�
%�1d"���m��A��1�q�r��tE&@��+Sb;��Q�<�t)�)t_Җ����c�wp�*~Q��\O&��#]~%��D�7'DT�? \�Ѳ�[�c:��3jcE�_~�\T-���������@���J0���"|�\�����[�	�k��uik��0�|#��	+p#���T�I��q�z~��gu8ݟfw��E�3X��m���P$�ѓ �O܀+z��nn$��!rɣ.Ǭ*�p�#6�B��    J\�l.ֶ����2��v����Yi2?I��^�� �b@��UD�@o��(d��O���;���::��,yB��ݥ��V	V��R,��\*���q��AN�Ta,��Vܐ��Ɠ�1l�C4Lm�`J�|h��������d_�@��a&w1���.�$�r�&��cZ��C� ��K8�8���E/�:�.w�����H�� �yX:Z��/%�_ �y��F�)�
d���,4�
O�n��:G;��O
�\�+Φ�,���%:)U����CFD��t�v��:����fo���l�KS�`D�G�..�����	)N_��+��E�
�����Q��(7O��jm�u�^Y
\�O? _cخ���+�x�z��Z3��&�2k9(����6̈Qxہy6���%�>�d���-�
��ElG%y	gl�K,��TJܼ
�"	Wނ����33x;�z罳�d���������|48O��!�����7!�xT�0U(J���֠>�����l4� ��|C��GaQ)7�x8Zav7���R��RU��V���X��MK{��*�ۦE�{Uf�S@_]�fG���R��� ps��V0�o�4��X��D4F6+���H
��z:$����*^�����H�������8<�D!_Ц@�}�vu s��`�V8\"��)z}_4�	���Ո|v߄�O��M��KQ�C�x�*�w������NkQ~̧�gu`�˔�� ә��䁒d9�2�����*O�H:����۩��u��Q�B�b���b�?�e�o�H��J4
��P*������������;W�Sx��|�!,�)�D�^��֖UoU�VehU�VehU�VehU�_��P03�L�٬_NB.Y�G0sV0�}���L;V�27�w��2�C1���_^]t�L����W���?�CP�����ص�)!�������'���U)@��ԝ�8��"B��@�I�W���L&ά���P|=h�e�'�5�mU~:HQn�cYɦ`�L�ʩ� �E����yи��Gn����.C!�<I[r�|�eU.�]:��{N�Z��(,'+ݰ�z{��O縩�lWmI.��62�GzA�ܘ��5+�j��S۱�bo/q�m|>���f��d/q�|0�NT���y�Gd9��g��t�����l��&rj�5�g��L�T�(�J3��D,]aѧ��4�S0v���]��ów1��+�Yl�b�BT��&]������e8�(�<��&u�u(�"[�¥d*k>A�AT#�~�C<���$�n>��X ܙ��[�߲���������7ۣ�*2���T��Y_�Q�����R�3�ތ��ZÔx*�<�m{#ՠ�H�%s0t�~*5��� g��u����U�3kВˈ.0e�]]�	'�c���3��s)]_�[TB���I�ј��ex>�.��HLi^���Y ݃ �֦T�?`+	�����D�\Խ�/�بt ۤ뚜�y�}{�[6ek뙾����Z��$��nx#%��B14U��Hic�������m���TߗP�ԋ����+n|)L��r���Fl.B*��ae��U�Zm�.�����
ۘ{43���ӟ�EkN~p�+^��'���]cE�,'{�np�s�zf@�F^�>W�q��}	*2�P��]~�R(
����x*�坼ncV�-�+���r��n,�$�}��<��m�(����91
'k�}�+�*���W��e@jJ�w�F�I�7n�(����3���iQ���p0�ޠdp�:[[8_qZ	id�����0	҃����0��=��Z�K�ͦT+Z���w>;�k~�l%T��v���A����vo��]�d�]� Yp�p���7�}O��r�O&'��غmDXV��Y�5�v^�Qd֡�ɸ�)�!��J�X�5%�Zd����H��"Bgkٲ�Z���R�'����EXm-��ȴ�>�J�VR����T�������ڨWVԽz��@,n�j��!`}3,��������#k�kd���mO5ug��թ0>�
D�T��&r��_$Q��bt�Φ�� �e�e5�d����[��J�/�� y&(�W����Q�_W����^���*�6��6un�T�t-�j��~���;���1mSF`$�x��§e��R/$j�l�4�ۢ�vr����~
�Շt`�G؉�#�0���`���F�"K�f���~S�ͅ>u=�C�1�D�_%k���<}���!'~�qZ.����485k�C!1�h���#?�%s}s�2Z�\]������TV.獇���bC9ܴHD�(�J�9ny�]�����}��Hg���r7x*]��J��8�D�q���`��GX4ۥ�A��1��:�X��V)W�$<u�����{�����s��@m�'l����S7�υ��K��Ex�RO�L��or-Q��JwAŔX:$���W���)����PLA�x�
�vx/�U����dA��Ob��~���r�A-ļ��X�f�e6=�Ys�*����ԠW��16~�K_`��{k6X5��;�4P6��K' j��D�T�])�!��n��_�D��.\�^�7n��<�Cbd/R�M#���^��� �H6�>�}K�'q�|K#��v3��;\~9�UF�6v�3<�8��� >�Q**��am��D�zn��9��Òh�Ԣ2�.rs쟦h�낑T��(UNzٝ��VvL������{���	{f/L�anH
6_T�@�F?�F��-��/z��Rՠ)��.��8?7�fJl��*s҈���?&�ql��-ڈ#��0��]��C��a�dZ7F�s��=���>v������y�G�HG�ùA�����`8Ά��A��n�ʪ����J~@ lX>����p����@qQ��x�9��t��f����h�I��$i>)�6e��ۜ�����n;n���k��ᑸ���`|K4Ns���y͡����iЧ���3�����R��~4���;�my)����[��mt�"3<�`J��j$�@�I)%�i�.������U!r�|@-���fE���5)E�yC��\���~�F�N�^lTBv�B�+5)"��-��������c�&��"���j���-��ɻ�o���a��;o_8�P�°�y4�Ϯ�a����y}m[<�q�y���
�ߐ�f�
�ƣ�8��?=Sq8�G�.3�p��emﲶwٯ�w��اblE���Z����JORQ%����vUk���]�ڮjmW��TW5���֬�z���	�x6�͚ӛۖmˇ��C��m�ж|h[>�-ږmˇ��C���W�2 �}ǎ�����1�ѓ��+���Y��`�	�2��m��w�T#v�!��|5bWB��mՈ�u�n�Fl�CPL�#ԈG���Ո�t�@;�[��,�r,h���o�N��zx�i\[�;�D�{�:�G��:��ՈfB�S{(t���j�#tZ���-t���h3�!X�����E�M~/H�C�:�^m�z��+.��Y���F��`���Jc�hP[�x_�t��$4�'��Pl�X2h�p`�ԕ/l��i��xꝝ����x�)�����;�����h�����hk�Ӧ��O/}m@J�A�`i�"���e����	�f~�>,�4�i��p���ʪe�
�A���J���_}� N��,�gXD�`l�W�I���K�]��U
��5s_���]��.+�iR.t�A���d�����k�fg�Fq�y�!�C�F%�H�?�~
�p����TCݍ���ŢL��˟����	�Q�j}R�̩���]�����Aj<�[~vJ\���cuD�� W$=ox�������y�EL��p��E<��韝��]�8���A���N���	����M{��Aٛ��B_�>�!���չuu3��ӓWu��f�fn�ĎR��b1D֧W�䌵	��#�F��4��!�$s+�H(A�*BD�����.��<;=��p��	�vyt��;�r������o�    �z���z�B�2t>?6�7���ic�VI�I�*�����D�m {�|4Io������g>��������'ܫ��V�Q�r:1A3RWf��m����k�bS$�����Umo��p����C�2�;��:�X{*I��l�b�JsJ����&��¦�?�8�ѴܩJ������Ħq�ֳ[����]Ecp���n�M*���G���C���#���.��{^7���_��U�;�,�(]��Է�;A��O�� �!3�?u�y�T"/��[�g�B4B����1(�Ck�%��?�+�h�<����3$𽘳�`~�a�JtVj��f��'�&�q�@ىA`�����*E�A4�̅��*���X�l�(�H��|���C&GW�}b~_�Z�����kQ�c�	Z�Vn�e��&I"2�r�r�(�����#�tv?I���[qN�bZ��v���M�c��c��L7���$%��СD.Tt��0�p���x3�s���H��*�e�a�a�R|Tt�<��.=���V��?�
�}���RCbq�dkǒ�l�ǹŊ���� =��`{U��jݙ��l�S����J)y2�����? ZZ��a$'�ׅ��Ƌk��gJ�f7,�Y/�%@s�V�9w����ܵ��%2����ܖؘ�8� ��l�D��;(�/'���:i����<e��H�Y=s4%��ɟ���>Ҭ�\�C�<:.Ƭ�FR+����k�*�`�Ŕ�MC�S�%��
ް�r�@rrdA/�ynZ_��  �s)���n���v�@%�WEɓ�p�[�c0&b�̐(�x;:(q���;�t?<!O��P�?�+��.2D�?3V�w��mT����)�Eyk��oPl���g�t�Ґ�:��EA�E��
��Ȩ�jn	g�t=�ԅ����wd��َ\.f��N�� "�܅*V��r �nmKw���L�FS�D'dW��x�
7����d_Y�����>h.T.��1���$"�w)�IW@)	��"�Q��@�߭�M�e���9r��B�k�e �":Z^���а5"6�*�(!�LB�	��p��s�|�_"Pxĕ�]~���~̆�\+Q�1	Dd	�釸��o@��K �9|e�"�v��0fr�^��Ѕ��� *�E��$�E�O!��QN��%�2/��9����b�F�lB��;�$�W���U�+86+Hd^W�Tɢ�\����Hc�]���
�1M_��K[�S��9f�`�㗭�t+�f��+�).�������:��I��n*C�:��w���t�M>���b��-�,��l-�(QF���K|;�A3՞ȁ��`hDV�t<v��*q�����US9�}?Lޙ7�I��gڵ.ă��Ӕ&�ftc�w���L՛Bi��C^6�C\��a�x��1�S�&R�kz����i�M�"wEp�Թ�=ྩ$X0���&Żc��� ���Hc�)����$�07�X�G�2^���8�Koa]�@�nJW��� �=��O%3�d�flo)��p�gTlp��S� ��x���Y��0"ZX��P޸�|�����b!��� ~����+Z��b�`����ڇ��\�n�� �"h�0����J@˱�w�p�$��)�&��"�BC���10s����s�z�2^p�WIނR�@Є������H��;6D����%*�F�<.U.��?�	T��s����I��vn�T�6��_*����A࠸"4U�Ĥ�!�Ԙj���'�W�r�K��ݭ�]�̇�3�%V3Zjܙ�*��A	�P����L󱱾N�_b,�@�<���m���d5jr�i�/--��\�RQ�x��6#�6Z�&;�^j�}$|:�� h�DT������  ��=tdl�м����)4bԑkpk�*��A�L�'BHf�B��l��v/Et̷�+&=��t��ɑš�>�\ 5�j\�����%�T?�y�`NYS�}j,Z;�� !�>g[a������C2Њ�3b�za��\>�6�fֹ|�'9�bntZ `f���׬���Cc��p����p�� ��[O�,əT��.e��H��F8�)�BS\�A˄9>��^�s�w���O��P�8w�I@oL�T���氓b�4�h�~LK2��1�T�l
	Uf����^�J�"9�H�-�\io޼~^X�Զ
 (��>x7�3JX��l�� �n�z���p���/��T:�<1_��̬0��H���h���W�v�����7�%��+��1��?��w);�q�j�������SB�$Q��1�H������XC��q�}����1.(ʨ��߇��	wC(�53��څ�պ{r�TÍ�[Wv��h������R�d������	0M2�J�&�)�V��O1_Օ.�W+���x2���"�=�2Q�
.�e��Ϫ_�QxK?'�?����ttv����n��4�����),��cE�`�@,�ک��A��
m�7"���D|�[t�#c
�)bǆo}�+�Vo#wn����UW���Y��Bz�?z�)�����b��`�з�e��px�]9]7>U"�>�2`ݻd�7��^\^�TW��0����앃w�֥��=]اz���_|�����⫟��!2�:)��5�C���`�r��/�^Q`�-��,_*j˾49�(u84^�1E�����=��_���ui1 �b:@�Z��v���c���.ک����,�MT���VE߸��'��%��߇N�'�%Iʅ�ƥK�44m�,�QiZ����d�Fd�o���DW)�u��}e���	�PE��e�p�@0��6�u$"NyRQ����1����)k�����7��h	�C��)����Dy�����O��o��1��v���u��E�`f���7jx�JT{D��9�Vur~���z�P@�^�\�������w�Ӷ`e�T�б�J�H�s�ǃ��LL��y�z!W�J��K*s�h���xn/��R���)��x�9Ԅv�-�M�wo��_A����MQQ[��5��B��!xpf�-�_���-X���4� (
F���N�aY�B�]+�Hrt_� 2.@t�� �*Ƨ�b�Çþ4�։ʟ��@� �y�	�v�����}l�e/����~���-��eiZ�`���X���?C=W�@���ʙ��=%e�rTo)�e|�����^*7�Φ��M�$g娠�� �59S��;}�$]�wl��6���gQwџ��WQ挵�+FbZ��m`D�a�ñp-{�B��AM�66�gkd[�<V�{��J�
k�4���X�$���<�E��GG�2���^��h �Đ_������u�Xf��`4�L�ɧ\�SN�����
~�!b�T�̷_��A.��W+3`�s\�P!nn<��9�*R��˙!�0���%6���	�k�a��2>�����K8&�HQ�1Ǡ0MЁ#8w�~rp�=���"s~�.҈C�������|���{_Z��.h�W�����7oO�9>�O���M�G��ި;��(	�T�k Ƿ4�ކ�Up��� ��kF2Y�
��}/[�.O
;s�nH���������;�p��Cp�����K8i+��M*�CP�)$r�{���o��2�X�cs�Y���)�1�&�^h���~�gn+�n� �j�%���aE�ʅ�+�l���B�����m%E1���EEN2�?��r1 �����8� P�Ñ�`t��T�T<�܀�����e����Хx>$�8��8H���R��O}�W~��ږ[�hY�QW���t��?=�Ǎ�xA�#D�\\Y������ǼĊ!��K�z���u�\:�B{<<^=�Y�7S��)�v��k��m�M����T����>�r2�2��*�m��F? �}<챗�.�L�֐����oh�X;��;lɈt�c�L���%^��e��Zx~�4B݉�/N�8���>G��F�V�<�Y��,��Ŏp����7�z��׿@�5��؛�M���S�^.����7�"��n��k�L��!���Q:/�}t�H4-5P��.�'|��M    �¶gt�ث'R�3#��MK�;
u�>�� ._�-��;8/3�Dō�9bP
�,�9�@�Y��������L���% ��ق�HA1`���Yz#���q.���d�i>���.��Q�X.RtCs� 6��pb�P^^]䂝(����,�1}G��$Fu����Գ#�|�W= rģ�LU��q3�	�Ri�H3C}��U�V�"�q;�`� E�TN@|���_��RĤ�h*V���G6�.Jm#t�Y.��Y��7���bs�>��!�n~:�>�Ț�� L�-K�ח1gk`Ա��`���V��*�k/�����br��t����`U%V<+�s�m}Q�,��7�g��G�Qh�/���(��U!��|�4]�D#�$6��T��.�lQ���ti�y���V��P���i٭��w�
(u���as�
��M�Q�_��{�"�O�2��A��)F���1��k�<���k�F�T�%Q�����3@k׷Q���o�K�".�X ;�y@+���. M�Ȕ�E�u:�K�O�b�V��Z�f�kߤI���v+�|�鸸�5�SB� La������P��\�3�(�-�{��q��Og�)QȴB�(�0�o���1EZ��<qSU�pH�c?	�����I1G�U�O�-���I��իᙵ��8��[�������?G��&��r�̕�5K��-f�jl"#�ݘ4����B状����[g��Z�ɭׯ(�T���X�������G�dR6�N@T![ϛM�*2��!���F=��n��=��g+�ט��~_(R����lL^�W��{9�������AS��	}����͉\o9��odFT�iIβ���ȋ������_\��[��(��߸fc�5/�}[~��e���|�:}[|7������@p�*�g���Y₊����XLO�f��a��yu%���z2�tE\e�M۬�k�u��� '��:��'�PHO�3ꦜ�"'V�c���幵��*�U
�X��wu��;��;�Xݑ)���=a	�A)a�9<8��&m��r\
>�˾����Oݥk����cYqO�c�i���mz��
�@n"�>E����ӳ%��^Ҥ��F{+�[�Wt+��c�6T2u!'���j��p��g�O��wk���w��B�tӑ�Wo�����l���n�/�ٸ��>pt�vw��Ej�A��yD�x(K�\U�P5��הX�v��9��unp�����^�<�Ҧݺ�"t*|	�Ʃ�����~�_b����_b�e��f�C[vSMZ�L�~�'z���kl����AW`��}7�����yg�8A:fHeH���]�;435����~ռ1;����5��}��dǗT�tՑ�݌�Nd�l�#��%�s�&��k8�4���)�*S��DK�������Ov�\��_G����m1;��!>�d�S�\ ���bJ�r��Ī(�r*�S�=xdi���.��ܕĔ`B�8� ����OFBa�Q"���=�Eh�11h�-{nKa���D��S��1�Ǵm����&�
�ô�/�w��,LMc�9�yQQ>м�1�ً�8q�	���00"��>�4��u[�*^��k�����*� �����u�|aER�i�|��A�%�@�
�J��Wa3y��;C����H��*�Kլ�e3:�P�%������[��Q-��0���~�-�֑��+��`��V�̢��� \�})��
����@h�j�̊Z�dt�������P�+|��n��_'sj<�V��G��۰/�ʻ�13��m0;;���kc�J��׀���Z�d���7v�'4l����j�����‪����RV�_@]�O=���F�Yw��mjQ?�$�6`�NF�o��l-��%�U�����w'�)���`qr-�G��:�m0�6��L�S�г�)/�Ja6g�aw��OG�Q�L#�Lrg�:�@���Ո��~�s�S�L�+@�P�y�D�5�ŉl3��ٖn0��[��,_!5Պ�U]�����K�o��hӥ�n��N���|���4� U��!�(��?�)��T����k�E�O�2R���^#�6����y�9�Y^�K�Tx�Ԧ�gJ�%��M�M���T3e��yd~��io����}��0��F������7�p7wK w����K�a �h
`�:�w�|����� ����� �մ��#Sj7� ���<����<�v�N)�q�_����]6�u7q����#����gXr,�_�­��Z�TV'[�R�Q�P�_չ�a
u���� �-��!���ά��\;��S|��n�<�o�;ow:�}Ίl�8I��y�i�6&\�k�ɦ�r���lu�k=Л&�4����X����C:~��䎾�-�?\j�����ia�L�4{z�������������9��;3��Y%���~p�û(�jk��;V�o��\o+�����n�%~�,q+�x-�}�~���vۊ���<3�ʳN��~u��{�K���(���-�{��a�v�Jm�o�Pq?�to�Um2rU���_�v��5z:w1@<�G�A�_�#��EH7Q�F���s�6w��iV�mzۛ�v�γCn�yM����%��;(�HW" )�k�&1Mi�{��&�S��*�W�kl}���h�&��k�_{�~	_�΀`��� ��[b��;�Ӭ��������|��jj��k�[qG��6�������ͻ�o;g�^���_ȱ��{������_����q����ӳu D����	�`.�6J�u����lEh��x?�q�7���߫���������T�N&V	҃餮T��o<�G��l|��j~�MW���ɠ��5�z����|D�-�-=�����?�����j�{h����s�G�~��o�猺&�ڳN��X��Sn�Y�x�J��Ϥ,�k7V_Y��_��LT//yp#,@~�Q�%�
 M��@�t��ģ67���]ꭸ	ILz\�����.���F��q'k1p�.�����������vQ;-��ۢҵb����@��I��럱! O�{�a�{�����O���`� _:V[�g�Z�w��>��NǹƵ4��:����hS3mե�x-V�#GzX�n��a���X��{������g��+��U�-�V�An2��e$|D��4;K� |�����Z�o�֪�}���ɂ[s�;�CG"w�4�ͻ𬨬��8o
q�����F7�R�ܒ��c6%w��݆���"��i@�?�M��_��}����]97���d��M�'}w<>���uݓ��btf��YoXWS�5����Z0�h�ґN��Jz�����ن��?#�H7�5��&s�m9Ki��O�l77�ʎ�0~ւ]E��w"��y/���|߆#īZ�r�s�g��.S��O��@(���to���"q#���
�x��]��'K<�x�7dI-�yH7�K�Sw����AxK��G�ˤ��[�ux�\Ss;��A/P�<����G7��78q��a^��myܙ�F�sT�z8s7�[Ml�y�i���(w��v��������Ǻ�z/^����\�H�r��Ţ�"�C������xd��ò���ª5��x?n�v,�����Ցhӕkv�W܅.i��l���gQ]9���b�㎅Ԗd:�t-�Xs�I�p����?�Y�lo�1v�ϩG(ȉ$u���i[[Xpv��,΍�]�(��B�AƈP�?#�hD7(46x�!E��nҚ�l~�M*� ���O��>�]��x�����rM�[�5V�������DYe�������O �T�͌+ܺ ,����/k���BD�ˠcFM�W�5��]8m[����Y��#�ݸeB��D���;�Q��-W�T6�s����=\���ƭ�8J��,�\��v�՝ڰ�����4	W��t0��Ά��������{���qM���~�7����-�A�[jd��ٟ����
njY䷸�
?P<\�.�7�    ������y��=J��g�H- #|<�7�����,>#����ma/�b���;�Z�^�����w��@�Hl/�����k� �Y��~n���f��hر.c�t~�qlYH-�o YoG�{x~޻�4E7G`
+!����?eU^<�d�͕��C�#@H!$��. Y��.�Lu�-R[���RU�F�f"9O�6���f�|�D
�tIY��b�wI�Y!B�H��X�L��y��L3���4�y�S��	=�����o���`��ۉ��{�֣���	�"�j�$�]��*�D#�Γx���8k�d���	J칔���D�����p8:�z����?�&��δ�/s-�^ x�`���~:Z����͗/.�w�!��an1p�1��Bݨ��}�4�^l��1ڄz�
 ��W�8�Pf�'��dzn���Bʚr�0rA[U��D���%��� ���ܴS�m(���}�#؊I-�-MLFt�=dG�7#2�0a����Ŏu���P���B{��[zGW�C-*fF*h��`s���.��@��`E�x�Tk�B_.VD(l�L�w.LE5E�R��:J	�a׀���L�c�����J����h����s��3��s�ۖ�"
��&���	�I�ϝ�'����{`���	i�����+�ent��r�dߺ'�?u��J�ź��o9��w��0�=]ا��2}�x'�VN`�O�ם�)��+�� ��9�����v�W+9�"�"�{�7p�N����G��)�R���г��.L��)�f�C���t�����?܂T}^ M��h����U`Ө��!�y�R��G�c��b�V�/��i!-�vp�ޅ�X��N��:�W(��3�)8��2L�{e\*.�g�߭� �A},Y�G��!�Em��d�]%��Eإ�
�׋D�y���i�Y�����0jp���K|�0Y1ڹ�Ѡ����d�=2z�(�M����J�#�ͪPVU���Fo�����|<�NG��������|����}z��z��M닌2�z��jZb��vL&�i�kZ��vS�W��	I�VКrI�l~�!�Of���M6�
��V_r�4~���������_�3�1 ?��N��,{w0�0�=�}ؤ�M�{
�la=����Elțc����H�a��[ٖ�XĎ6gEc�n��L��	L�D
{Z���ϒ,Ro�.������U2A۩���}D���=[?�I��
Vm1k������&m�5�N��߾�a��V��9-�r��2�s�KFg�2������[9��ܴ����P�-�����S/�̶$TaR�$�F�z��N4tx;ݪ�Zٵ�]��͖��M�8�M���6zhpVg��*�-7���~#�W������}�l�ĸ��?�}�B���/�e+-=�h��L/����_{KN�2� 2�і8�%5I���H*Ɲ����٥а�zW�$;?���E�p�~x����úd�<{`m�N8�1F��j/����\���}*1�B�D���n��؎��
i0>�"��r���_́�y5eO�S��0n��+�˞�?��f��e������8�g�sU�Ĺ��/8�Xel��%�b��UD�qooQ��H,�]F4�x��rmsă3r*��_�Z�L�i}3�o��ʹ���7��fZ�����`�L�?�n	!6��k�VW�,��B���ma���@�����A�lv����]$?0^�K�#��6�$d�!ы����/�b��mf�	J{���w�_=�cv�7O0ZdŞ�-AN W!
� ������Nu{�����H䷓�q[磢�����yp'��n�Gf|{���>E�_��5p��Ծm�(=��K�Ǥ���T�TfTQ搔�Co_������ֿ�_n��m��������ֿ��w[�n���+��n�g���ê�q���Yo(��&m���v\[;���֎kk�U;}��qm����v��R.�P�߯�48M�lt����xvKhݔ_X���=:�n��e��v[�V�-WF^�M��k�Vܣ
��K�#��w zip�mI)�3�@-maö�a[ذ-l�6l���maö�a[��-lh�+W�p|>t�Fg���-l�&ϵ�sm�\�<�&ϵ�sm�\�<�&ϵ�s���&ϵ�sm�\�<�&ϵ�sm�\�<�&ϵ�sm���&ϵ�sm�\�<�&ϵ�sJ$��s���ֿ��w[�n��m��������ֿ�����N��[d�5�������>^��\�����O���+Wv�ڔ&��>r�<���=��i�f{[�l�f�j��'7��;{ ��zj[m�m������׶���_��k���_��k���_�k���������k닝*��;5r}'�;=�e�N���3	����>����~����EM#��`\Y���˯.��wfj4�~����=/	P����g��dql'����.����M�\��|��I�� N_¡:Fn4`��4��6������՜@1QZxj�?�qi�P݃ƞ�Wi@;D�S�p�K'd�L�㓫�oޞ�'�g5y��U�moz>��F]8a���s���[� �'A��������6�d,�083�:}٭�����0���,u�go|>�u{�)���1=_�t�ϐ	��A�t�5��s�wvB7u�$�6~x�c�Bg}�;x�A�zEl7r{�����	��u����?�c'2��z
j�U�2<ħ4���D\�a@J��H��r���x�Kr��m��S�� ���ˎѲF�-�RTl1����5��RN/��h�A�=MA�P@uB��tJCʭ�8�'
�{�~�+6��OBZ�����:L؇���9IP���9��~�ُP\|sqe��������X10d���n�K'��������S�A5zy����y���k�uۅ�kS��:-�;��;Cj�,�v"E�dK�"�c�����>������`-EXd��\��R/�)���u��J���4n���q\�Zv��d~�n�;�BaLF 9r	��3݉�,g�ƽ��Ŏp���ཹ�{��������Z-�k���l�a�h������9���mIb	���3{xƎ����Ő��{ D�U��p'��*����O�p�D��hpFG��}�vgF�ś�w�%��T��3���G�
8/3��\�}p�h��,��)m*Ӫ��R���@x�a\�Q@���>p|R�-)]�5<���ĀɂK#g�yg��Ӿ �fd�����>�9bl�����²�y��oh�1|H�_fp>^!�f�m��,Е�0�������0���i�^��p@��3�|8b��9�q�[�C���똁3����=��03���X��dbBa��4,��"Etk1#��[��e�-U�aC��G���^�C!�,Y�z7����@鰳W��̛��M��μ>��!��IRH��u� AE!�Z�|���/Ҥ���=�tL�&[�K�@
O�A�w-U%ј.�6��3�>��Q/��sԫ����88`�wv��Tkc�X�,3��"\���l��d�gk\��g�h��f��s�)�+�Zo��.��`\	����L6�ʬx�Qa.����J�.줮�X�9U��@�s C7�P�+�p�V��)�.�S�[Z?�#q�A�%�B�9��k�F`N���6̥��ag�\�Fa�2H�i/�c@�ϋ*��B'�����M��Oɔ�7�Vԩ/]|S�C+SE-)0��gH�H�V_�|t_��}Y�E���O��i���f���J����m>�lÌ�]�?:��'���l6�s��L$�����6)�S����R�������d���v�P�f�i�QZ�x4KD�%�M�>9ۺ�@Y+�*,�*����-�nv��7ô�Թ�߉���w�<1���49��Ոc�v��f��٘+�����woa�>ʹ;��7k�Jv�L�"��r�!�0Պ
��@�x��a�}������B��I}��8�v�a,�"Tu9O�ݓ����l��G����    ���!������֥Ʋ<'��	3	U�3 ��&�ɨEa	yH6�"�V�i��]�B�8�!:��T��S�A�K��?7�����)�z[Y���H��̼&�Kf2��ͳW�;��g��z#9����_��C15�� �rs:;3U�E�*�L-��Z�'����Px3��:��4�P�4�X
P�����𗬝����/a&)%kTu1�ss�c���>���Th�ʡѓ�f-$��R�_G8�HK9�C�+o��#�|�~��V�Os�C�@3�����d<>'5Z��`�¿J�*O_U��R��=�|��L��(�Y{�7�Px`Eo�x��r�i,Ӂrs7���?%8�S���X(��T	��*��ҳ�I�|�Z���rajnO�kH)��^8�����v0�UᲊURG�!�X{�#�q��PǢ�p)�� ��,]�(�#���r�AF_C6*^���K�����-�9����d:|$u�9y�5�8t��C�)u~����,5�B��_�* -3�1�5��2�2*4��&�J��pV��Tof#�$7�T�5�E��bW4�(��?�V��Q��&�Z	��p��?<�j%1;g�Z�|>��G����ccu�X�c>E! 0�v���l�d�/d��Z8F�6�<��L	�4C�A�����1�����.�UNɢ�ŀ���,:YM=��)�-@�b�����D�W�.���*(LQ����Zh�oS�R��Z��%{Y�0X�T�����i�s!�q4�N��g��B��LV����ԉ�ٳ�E�:���\H�g���9�g�r�?A�y�V�(����9����9����9����9����9����9���9��|2���ӳɏ�s�,si��(�\P]��'���3�r��0��1�~�Ћ�q��K� ����̅�Ot1<�+⨰(R���)-�B&�Q���=OYiM��2\����λ���F�9�gI�����bF:O[U7��4���eu��D(�����i�������)�h�+�y[�EWәf��I!F�#36j�d��ܥ��f|��ֳ[)?�J1k���R�T�-n�������`r6c���Yܶ,n9�.L���Ŭ���0�y6hP&P�\i�GO�CVZ�NiuSZ�J��2Ni9��+��|0�������|xV��fYV��T�Pi�=���Һ�%��4�+�	
Ae����BPW�
A]!�+u������BPW�
A]!h�BP� !�8NgC�$�*�,-h�;�C3�o��C~�������M��_����Y�l2;��mP��'��z�����������/ŰD���_>��o�̋?\C�M^|w	]j�ξ^'����o���Hz6Ҁe���_�e U�� �N2=�=I�$I(�#p�G:�Aj:?�n1
�� �y�d �2���c�k�i���|{|��`���+ģcoX�r�"ѕ�w�r�5=A����?�z�~��/�q�#�;���B-�-��?��x������K>�����1�ٿk�y$(yX��nx�\�b����=��%����+�x�[�"	&ZH�	a1�e�t��f��&*H -�� ��q�n-!��_�e�=Y�w��
�.��apV�E'w��+�l��RX���A�?��MxW�6���_���&D����,&����~�+N�}�fzt��$��!\C]л�������0'�fzRpTaL[�Z�_��m�-�$�}*t���/4�?>9��D�#�@򖓶ݸ���z��o��\o�o��Ձ~w��}��)�nq����-�滚���5�.��j�a%�?�rW�����52=<L���#��_��!��jJ̪��7&�۠�_����F/�\���\���P�F�:H]��65�)�(�!�T����i����J�o��g:�3��� ZD�w"��,������w�G��ާ�	����o/I� �n=��:x�:
��e��`<rE恰�4b���^��>\��|G7j��~#U����x�.Z-�g�+����س�'&�]_c@U}����"X�"� �u�-AR�r������`�.��l)���aǧXG{aޢ܆������_������2��$���S:��q���u'���Ë�T����@��"�(�ʨ�+1Tf�����s���������0���Ll�[��+�i�� ���;� �J�˗ň�`cB�
��`Ƃ�F���(��7�b���Xz=2�OD��E���5���d��O��>>(�;~���-�B�������1��jңH/�V���0�_����.E�o:��y~&&v!��b����rMy���Y���_�x��_\���kg-�������T5���OniD��]���2>)�qUr���.��U�9
,H��{�¼��P$7brw�|#B0��ä��ʜ�	LOJ-v�AY�mH��ƣ2,� �+��gl�%
��)��S9�Nl���d���j_�f\&�k㗬�j�As�����X�o�+L.�%���
����Ke'�)�ep��W;l��q��rn9�����2�]���~w���`2�\��*./�UJ�'T�Ɠw��菂m���?�n���`��S��]0�I�C�Bi�����G���G��|���B�0��]��*�������A��y/)|�F(Т��/�ԉK�aK@�?|Orh
6���1=Tz���z��>|)z*G��O�e�mp�ĖK.�k�T��cR!�6=�>-\��'��=8hr-_�IPR�����h�Nhk��v�й����{�~H���[��k5�g���.�N*���V� ��X9$� pr�]iG�W���+)�j8�������OL���>/�'8���W;���m��1�s�g��d���%����>=}�5�D�Y�a9��1官B�SI�R��E��b���:X����C_���{���gڼ>]��)���!�g�M���V�+ēD[Bc���'�mx�Ӗ$~��{��`���� �������k��%=��}{'g�P,���b�]��d�	���7�q���.`��.(��Y�]���}(�Z�!�i�����k�N@�<��݉�M��bA>����}.	�_���iY'�I��xR�>@q��H<wu���h-����\���e�ȯZא����#�q�d�Ϸ��Jd<q�5�{��b���^�gz�ʨ@C> �%�1O�Q|�{�",�5U �YT��Y 1_&:>�C�=}z�����z�d��}I� ��Z�'� Y�bE$S_X��#Õ:�n����.�����+�	�.�+�^e';CW��"4�o�!�eM!�(�RM,j�r�)��E�5!�u`�C����@�w�`�kW��Y:�՛Py]J���mi^��gՎ/���*S�`9�U	�?�O��;�-;P��:`�Sa��a�8��L�J�7�n5�
"�٭��!Z0a��*�M��]�yRU;KE6��~D(V����0A��VX~}�?��ɾ������(�X��ߓ�q�Ÿ���w���;K���T�a|b���Q�=ƍ!�{@��W��)�6Yu/t�K���(�m�wYIWѻQ�D����w��j��>VE� %%]�l(x��
~a�J&���'Ef���禴��̤�ބ&c�a2R/
�tţ+S���A��ǻ�ޫ��x�.U���Ew�F�=h�N�ݍ���h>�g�����ݘ�;��| Ls>�������:#�����z۬�/\�ɨ?��MF\�Ɇr*� ��*F,��ʻ1��,jx\ި��UμacZ�co���uL�|�FԐ%+��6m�C���^k���ֱ�b����.'4������k��kpDm-zh9�츱M{�J�����x��:����j���ذi/��(�y
��e�Y��k��.Jc�g�����;��J��:�h�g𦗸�|%��"��B��r4ػ�M:{#u��֑Gn�4���`�V�ڍ)�c���Yʛa�]'��ƣ���Oi�r;�!o�>���x�����    �0�fє�M7�}�9?� �·p>��!>V���(��#��(G��Ѝ�n���oY�v�*����w��7tr2�aéT8���d�)a##�6JۤD���ʥAb�����U��Ek'���|Fk'%�|N�D)V�59L�n�g4q2h�u�3j�h�|B�x��G#'C��]��:{׌�3�����(oL<=mr�$�"���9�J�Ƹ��q�ӹ,x��`k�O���m�V��>=���+��N"~.�R�3�ҕNӲJ�'�؉�7P�ŕO��e'��vv��?���x6��nDC�ńm�Gt6�	/�dx�,���+�#���މ�Gh�S!�ba�x���d�<���,Ls!�b+���#eh�#���
D���ӹ��D47M�O>�X��d�B4kH��Z�7����ga���ۻ �p�7b�	v*t�Y��$�g�����=~���g�_~�S�M��H�#�lF1���[nJ�-�Un�|$g��h��9Cj������|��ҿ;z���$�a_������G>l������~�b�0���-�%whfb� t���K���- ��+��"q�#|v!���P�������n$g=�����-%�0z0�!͌ ����:�mc��4go1�4`V��ԗP���5�K}aɚ]u��V����Q{F�]-��c��Ń*��-=q@�mR��b�l��|Ơ��~��mT#�HԒ#W5����"�]Zm�.[w�Z�nj���c�K�rC���x/�ݯ�P�dŠ��yGgZ�=,�{%�0 �ي�]���ҡ�fu�Wa({jסu�&ɓ�X�|��b丝�"�t����H
YL=� ?�*�+PeתzN��g2Ec�U�τ����
n+�+K�k�O�;�uĥ�$�0���2���=��]��F����A�,��)Dg24�ӡ�^<��4V��-��.�v 9 ���a���oK�"�[��t�S��� ہ��v'l�����ư8�Τ��w��G�$F_�&u��i�d���%'ϓ/��&D*.#]9���/v�� J�#E��ށbƇ����kR2Ӓ�:b��2��
�ދ_-}�{���2ڄ��ƊN�..]�l�õ����� ��{D��-�-Cm!��WD�ɞ��O���f�#?o��` Z���W�_�
�Z� � NUp�]z_c/o�Iή���d��J��H�׬��8:r�V��*�����y	�R�@I� /����b�b�dG��Yb¨�����H��S)�8�<�'�7>�� J�g-�xw�@,Gh1&a��
��������-�Ɠr/!V'��РcR�)��M���
�X�z�h�n)~'F�.D����m�A+�B�o��<}�k����o;��Zv	�o�PqB�e@J���2ưv����}�D�����]�o�D���f�"�ϣ,��M��h�W��HB8�(,�-�B����)*�.����{B�!�c��咄�s�CN�X�jrBT��x�T�]K�;������
R��m�`��4�P%w���[�)sZH���)1>���J�I�m��%�5e�ME�d�X3j�ܣ8�D�&��)t$�>�Ma{�!����(ap�2��1�0^l�Q�i�e�H���:����YH���"��h�;V�0�pj����1�W�����0:��������-�N	��,`L�P���I+�k�d�����, ��rM/��M/]�Ş
i��D@H��� 4y��w8�	���c�U?i8p�|�������Ii��&��h��B�c�Xۂ�v��'��\�啂���/Inb�Xf���L�����_��g�������hJሆ�R��`fJ����=�}R*`�Y�Y1աk�0)~;��؄�ۤJ(����O��amj����H;2W���m$)m)3Z�ܵqd{6��2\�;e|�7ꁉ'{��i4�J��I�P��M������:���&Z`�!���U@ˉ�_$�Wܧ�{-��-�Nb\�&�+�<B�!�!�UW9�I1�-P1�_�%��P�8Q=�m��-(�<a*�h�c��a�o��G�8e0�K!�j'��,*��X��`c��o�o!�2Ʌ��m`x{7{���5�f;�VA�ʖҳ���n�J_~09b҅	,V�� ���&Y�@�Jw5QL
&�/*Ên-��V<BR{��\s�#GX̏�iJ1�E��r�p�O�����!�z��Y�Z�}+|��5�T>/��!�`D�1&�/-�a��X�M&��cE��>j�1{f/��=�%=$/���~9�u�I��OpҴ��v��@4	�HQ;V�]A4�uA�4�/i	]� O
))��M	챜�Ɗc}bg�`�k��})7�PL]7Ì���	Kv��*PqJ�:�H�KN�������sD)o<��~��]����In4%5S�m2���������c���l��B���_Y��X��{`����v�I����B�^���rCmMQ�`|(l��7@]��b��4�d]���^	��6�۲�\0Zi�/�Gb%�'����{�]�N	Ez�م�"���۲�5.+���vx[T����n]��x�=�j�	��@��y��<Qټ_O��;�t�:�YJ�,i%����ɾ��FZ�-Z���XYf�) #՘�����Hn�Vh�����5_x'�N�����n���	CY�,wQn,��_�~��V��P��v�#�(��^�mt�4a����Q 7(*�Py��B��	��z�<v����S�X��8�Y�R��KƿIH�~����\yY[E�p6ǟ1�0b\���x�� S�'��5 ���"~�t�<��2�*6j0v����oİmBp��R��h��Yج�9�N�vE3�4��d
.2��&1�儖�4�"��g,X%I��XM׍|{�?�o�v�v%�{'���by
y
)��J^/x�b0 ��`�Z�Ӛ��[�{�o�J�8�.�	�F�Pϻ�F�U@�����}��5+HF�#`��?�1o&������1Z4����rA��0[�$��b0���� )u|�N��K��C�M���2�4�˩��1��iǀ�>N��)�g	�L
�ݹ�C���j6+*_��]���L�V1�tB���D����Q� �bF�ce��L`>g)�:�d�go#��UsYB����lD.�Ǌ?e�r��lQD5kr�)1��~�n��%�&W�&�"�r��#�j\'���K���U����h�%w�m�~ 1T-��b�!է�.�2��VmAA߆Gd��r��-����d���'� ���6�����k�����aA~0U��O>y3�܈���/�lb��U� /M/7�@(���R�����X��*> !�N$���(ˈ��d�Y����\�=���ƪb3<��O�K��@��л����P�N<H��� �r�$�T�{؍!E�x?�Y#����	2��NZ��{U����G&���w2�G�w�wQt�������If)i4�@�q�b&��
��³�=�cF�7�ve�zȋ��N��D���rBCy���5nt���ҽ�T/|уi���3��48K�%Ѱj-\
���o*�-e��}�O*`!Fj�8H�B���<[�����*�|\A�L|[9���r�G_��XNPP�O#}�Y�e�W��J���Wd�P�m�z>���1Ю���37��k��$��La m���ٌ�����^%�d�t���&���G'G�����J(�p\~4��%ң
�i�I���Z"����qY����?)$�|L-&'�<�T`�v)pi �evh(\&k/B���J�E[���I�~H�P�kpNa�cV���5���W�򻱞FCj���S=�� gWW\&M��2xg�0�Qa�.��(�dX�8�N]�� ���H��{U�A��PI������I-����KS�4���]�y���G!��P���Ѐ^z5�{H��gz�	nǘ�0$�X�������XU�R����
C�c��[�T�m��L��M�-�$'��30(��e�2wW��g    �ˬCM頃����t������Ԯ��fų�Dp��G~��*YȬ�"��9˖�6���~T� ��߱2�����W�J���G��X�f���ј^���DX�I�Ix�{*����@-�0���}�w��L�ꡃ!�" �t�)8��k��%��9�zaj���#a�[^�^X��J �1m�!W�]EuK�,S73���.�6Ҿ�f�,��v��N�7+*��1
ꃤd�����;L�Mq�r�h������ī�P�8�\��8�<�^&;}JcFF��Ԩ�2�/�r6L'�����s���q�o���P�*�U�C
����X�)+�8h���G>!������PbdD|�����^�ۦ\a��ִs'S��|�>c���Cc��p^�E��X���<���.a)`Q�v�o6E��Vx�HU�j�%�S�	�۫�0�L˘N�6���Rޣ��ϣ�T�(��cd 5|P� o�)�T��hk��p�a�CV41�^���IN�3��=�}���i�a�)��h)y!=����]� �|��n1�:��+>ÂuvA0�Cs#��tr/Ȧ��g^���/�G�ڱͳ�]s'��'ZG۞�ɧ�%I�[H�le5Y�=}�Y�y'Q�]�$-��?C\-���遜��j������f����(A�����J�%3�9���2u�t�4�� �O�b&q9��| Z��V%-�^��,���=M|	D+�*)S2��N�/%��N�{�H�ރb�tD�"���m��U��QɅӐ��Џ�5),�-�}'������N8���S7�g�ꁱڙVQ*��Y2�$�M�1��'GG�c@�*�8���,�'�JSr٧�w�Fן*�����O}/?�(��T�H~�����ź�d���y	^_�Ϧ-nN0_�RQV ��I��FVH��gNRj%%[���>��tu��+6��~M?��+����˭0����VdX_�EF.��!�j���.˸˷�;�T�Ķ�>l�^��X��r�3=��`=G��] G�na7?�D=/���	��J>��'?~������7�>��C45��zM�y��(W��K�b}�hN���I�La���D�BZ�ko�P�O�za�ϥ,�߂�*<��D=Vv&��(�1��Zabe9b?����$ilm�](��E�:IJ/��c��MlC�I?'�4s~vl,�Ґt�,�J[2Qikq�)���_�\4��:�ZD���U����I����k��ِ��"\.w���QP�.��tTQ'��|O�\EQ2��s�=宦k�ٷM�*aփ��	o�h��W�!�Ot����Q]'�M���+�>�<�� QTP��-��P�yз�7�����8stX1��!���.�9��*9]���\ɺpVo`v�S��H&az
HG�����̗z�H��ꄊn�he2��>��xu2�!+H�ބ*��rN�ȩN�>�p/C��!�ӈ~U���~����4X>@v��>x({��[m���a��UM �-]��b���L�E�#P�/��-M���69S�Zj�[� H!m�Xsx{+D[�(�"%��w���]���ݲ���̥�U��$���zZ��b:�`V���,ب,�����o��=�;��%Ŧ��Ȕ��
�����Y=��Xg�7�i9/���Ĥl�>��u&PUxn�(�m�%����Q:��,Y�q�z�>��)L�y�e*��8M��Ŷ6<�X�n�����0F[:�u��v+ْ��fA��k*<���u�.<_G���l?���i\/�~u��.W����No���Ί�k��GJL�c��'��Q!"J�zO�����1 �C��nk��uQ%n����z�L@�VHd'�un��*����9��5�P����5(��Z��0{������"�r �^	v8�v�V�"�3��|�*qȦ6��a�:?�xx�X` Z�!I:9_r��:$߬M�̨0�Q��m��s��p>6�3��ц�#-��ԃorI��/�uާT����Ǭ;�W�g,����X��ُsVe���
!R��6nh�_ŉ�Ѥ"T�n}�	��M���X3F"���š^G*��A'�u�:��E�+��Ct�7Q_M,���y�apk%�^7���d�F�:و�ϰ���[W�7#�aq�NtAՓT���B�HY�+iI���rB?T�,�&R.��F>,AG�!	M����ud��GW.$9�{p �ER鰡#�*�G׻�>�����\���i�/	�gd�k$�"ߕLɅ>K%���j��*���0���ka����~���t��L���4�XFF�P88��%�#9u/��j������A�%zB.9z�;?&Ceߨ�
V$�Y��.qY�K�XS�vI�X�Q�ϻ��4�ַO!�o�[4E؁��3���s~Ҟ}a ����A�B���RWeש�J
?}�g���keR�E�E�9t'֜*�幸�J�I}'�H��6%��\�DS��ȊV��$bG����/dr��*��<UaWm�AF*YXh��� X@�3���+C0��?e���߉݂��tXS�j��Gؔk�G�B���V,5(���5��/Ѐ9�R��z34����a�;�0A:<�A�Q��-�d����3"�)P%���-���%����P6�m}���]����Fx/��R����.���榏���.���8�ۀ�O4W<)V6=3s{ͨ���\�9:�.���y��5ӷ��|4�O/���Y��5|}g��kƣ���?���I��k���>$ĸ��&�s���0r���:xZM;�P5h��j:f�=]��ْ�����5���|��Z�M�ڠ]K�6y�H�v:�؆pI��6BV~k�ۆ`���nқ#�l��F�d�`7�Q�[�p�ZIV�o��j��&1�|2����<���߫W33EP�e�yF��ء�I��a��_c�)���8VZ5N�c�y����k�<tN][�9x�y�_�e�>���,����tT��''8���"]}���C��v�{kP;ZMV�v��Kh;�y�]"+�wr@Z2��S�#�l���*�B�CV�y����A~�����y�3�<�ԍ���v����usl��G��2Z�Dͫ��,�V�z���L=`��5[и��$�q8�t��A��=V�{вq��H��j�����6���E����+%����P2	�������Ov;0�𓶋���9~]"���}�!s��۠j�����l���o�D��46�#O����n�W��X��o��u���A�<�`�4�� ${���1	��i,!��M�	��7ȶ��(Im�����y�2li(�=�TCeϷ6�EK�C��Lcq�[�	�""R �0��5�E�Q;hD���j	5ZnNl��d0��S�ŦϳAbLB�6`�(�Mx�m7[y�i��Q�i�#{D�)��� ǲ��f-���t�mfSES&dK(��C��6�fh��lH�ݙ�C6��J%G�B����R)X�G����� $Q�mP$刘I�\�eIrN�N��o�,�֨��~��> H	�Τ���_�z� ����nζ ����9��`��.��n�v�%W���Z	��%�@K���vL)���Ɖ�2�a�IqZ\L��fјB�|&��Ut��f�*\�d��N�q�f���mR5�y�&覡�j�s7�V3��$�&���TN�`NY`k�͉��Ax�V֋r'fI��;�yK�N��U <�j-ړ�b��N �F��x��O#�O\Ki�g�-�JCݔ�e}���7��z�"9�7:��P��>nmM��k�h�hR��֯�D��6�@�(�^�p�m�E�� ?Z�B��	;4Rڬl I9x�b��7�FIqK�C�\�(Ɣu�%������L9i�g��� Ҵ�`h���ec��J~�q��0�B�V�¡�E��"*e�AQ�	��r�J=;�X�j9�%{ӡ(U(X���)�:\�Tw �v]��$�z�Oɜtb�r"�<�e���`�)M�<��dp��[����o�rv6�R!���    r��8ȕķ1��v*�ĕL���K'װ#�Q�$Yi�ɢ�x�œMe�"e��8�*[7�Ie�y�,吭1gqn�cgy&Ϣ"��e5e�?�*�5��M� ���3��֛qF-����Î� �I��uG�M��x���ܯ������Tw` |[���M�؋��@q+��2{i���b���� �Ӷ�.r��],�'��A��X��Rũ]�n��#o/�Hko�ZL�|&X�E��t=|��V4�k���ʷ�zS��k����PA.�ni�E ��f����S�`
�YCc5�q�0��@�\�U����1��m�᜻�%��6������ !V��a1	tE�d*�r�����7�yQ���ՖƜ�;c���dp�<�8S��Y�1�n�s�S�� ,�N�,���+C,�>4OY��y�r���kYV��-�É��	>�!|9&�\\fQ̼c�9ן���q��\c~Q�{������>��n~����,�%��M��?\���T��x�r<E_���	��Ygɸfɨ�� ��Y�C�S�nM	�*RTInMH���
�܁�LN����r�5���W��A�A,JE��@�sf�^�0��h�
aN���` �l��L��0��e5��\Y��e/�s9�;��\E`���.�r3�Rs5�Y�-:A��	�8�& �Ef�� a.&0S�0s��bF�A��	̴I�0'���W�a��F`�b�
��'�#�Y߹J ̝̸�@������0�XNs3U�7�0[!0ge�5D`V�x�����g����I�H�I3��@���نON�!0�J�C��i�m�
� 0�8+#�,�9=!�C7G`���l��LU<�!��̔�oa�Z�3E)�9[�]O`ƭ�@s������9C`���)���N��0'E��|��fI`�v�A�5��vfav�z��c�0��5�fw$<c�I�#���O Ϧ	ϸ�d �F	��o$�g��g��$�ui��L�^
�l��L���<7 <S�� �5�g*��
y��	ϸj�B��2�3���C���,g!��eҕ��:³��[A�-�u#64Ex���n�$�d����#<;³#<;�s*��ώ��ώ��ώ��ώ��ώ�\�u�gGxv�gGxv�gGxv�gGxv�gGxv�gGxf�������ώ��ώ���Gxv��f�[�+�ώ��ώ��ώ��`�p�gGxv��T>������9	���ώ��ώ��ώ���D�p�珊��,�!���ws�=�Ë���d0���h2�^�g���d:�?�>2���x4������x89��#�p1�<z����o�0����M���=��M����^-� ��윪�%6���G�z.���y�;�W���Qѻ��ͽ
�T�=K�gr�HZ�泏�����p*^|`*�AÿӚz�y�����r��^�O����o�"���Z�.�S3��7��ܴ�O7 O�od	�����43���Ő�H?i��~ZI�xr�?�B����ṅ����4)~�h��j�3�V�1��I4L������l�l��l���&���4,��ˉ�Vp��X�v@��)�v��WN\��=����|�%vr189�B���U�>x�ˢF;��:��9�9�B8��7��6N������&��5�X �����)����2��&�8$6�#����m��1�_kܰ5ְ%�pe8�Kh�VP�v8�z`�D�
A�
>�;����@m ��Ё+����\� ��)�������^)���i�o��u��ۘ�5�s��F1�&���`ʣ�� ^!��Y��vE�b����OV�S4)�2t���d+e��ԇʁ�r5Hõ��Mqp3oVǻ��͐nS��'�Z��Zc�z�5��i��J�k�VkU�zI�<Z[0Z�$Z�C���lK�l�ɤ��P�lQ�ScS��@�Z��6�n,Mȯy�����+=��`�_m�&Y٦@�v<V�0��$�� V֌K\Vz8�j��j�j��j�j��j�ږ����qh��)uw � �L�*~`a%��)���v��z��9x�r�l�yf�E`i�T��*���@�Z��zv`��$�LP*C-�k�F�rP+�P�P;�P+�P�PK�PK�PZX�P����=������>mr>mA>��.%|V]� �y�g�Z/ax�@x���&�Yvg�Ȩ�˙3�ʡ�������m�Fm��l��7bl�Elv�k6�k�akZ kR5u�Q�x%S����3�T�|Y�T���J��-={hK;\K�PK�e�-s3���4񵁧������A����lʣ�O�bM6M�2R��A�������,Zn�ypm\;"��!��!��P�Q�f�G��G��GKxG+l�6`ǲ�t���N(�+ZE+��ᦸ���V���p���yf�M`�Zb���*�"'�$���`'��� bg�aF�.�J�Ns�"��
��
Ͱ
��9��܂�<�r��5azz+��5wV��؂hh��E*�;pe@�P	=��������$�L�"�edXQ���qΪ|������6n�8{�!{6	{�zV�zM�z�-�Y����HF�+��;|<2���
�x�V�l��j�w����{�w����[B�e&�u�x]]�!L*YXh(#�����`���*c�8�8C�8��Z.
��<�d8�a�� C�	9\\"wm84��"�BԷ��h�v8���烋�xv�G�mK>	|��:?���_����H8F[����GK¿]R�Z���ܓ���s��|<�OF��٣������mC~�1�۲��B r)ѭ���۫�մS��v�	���u$��<[��Z��k,�����5!�s��P+�9������E�0�xLjN��x�r<E_l��o�E��ц8�:��W33<��Ե�audj�WG��U9��fD�Pv��jhv9�=P�bQ�(��@�N�WӬ;$���%\n�Ļ@c��!Ҙ��YϓW����1r�B;m��G�Л�(�g�Kx(�6�=][�=���8l�.%1�ۣl �h�(��u�d�n�sFk ?�y�"ï�	���w.�$?\g`~l�Y����궐~����O�*c��3a��G���n��m����l���J����P^����|׎yB 4lHWR2'�F^[��n9;��Fa�"�[E)H�ٚ.\�i�1(U���e8&I������]�Au�w[�`��|�9_o�FȎ�q !n�L��*X���Q��Bu��ab�Bjצ��u�	�0O.��`�a:�Y8��ߨ��Đ5�A��5�B4�k�.�$���^�h�Xd�7d(�t��:L��ΨE���k��e�&߯�3�5�`�H���f4R�	������YG��P�86�r=�W�q�#�Ug��rV@yl4$��Ǌ;�@JK�&��0�����5M�$ٷ���,�D6�~$��!��i4���K6�S�ɦϳ�����,%���)�n�ty|=���T0Kv��,�)ґ�e]3u)�KYYЈ���IJ�!Zo
�lNɤ �iPf�0n>k���2�Ma4���$M-~f�IN����HM��TMJF�k�����گU��95� :�m�i`�O�X���$���S�F'~�1��1l��Ok6���&=�m���� h�S
E)6�՜7�xP�mB垚��v��f@��r��I��o�3CUB���07NM���Q��6�%�4~T�q��j�!���$��v�m�'�ᰋ(�u�(��<T��z��0�:QkSh�ɔ�0��Z9姘朦2�iԩ֩4�$����+t�i�-����{�Q�l��9���R�[d��Fg�*�ǍP��Y�v�Sm�S�֭ U��6�@�*v���m�E�� �Z�B�X�c��J��4+�St���F�()�k�� mIjN�@W�m����*3�uE��*ٕ��A�k'���������8�HX=�a�
��_1����?+lXʤ5��v ��%ϱE�X    �j��%{ӡPY(X�ʪ)�:\�Tw@�v]��$�z�Oɜt��r"�<�e���`�)M�<��dp�al���E��rv6`����8ϖ�Ƒ�$�����S9%�$=��κtrˀ���ԕ��q�.j�[d�T�� \W�����u3�T�G�R�}��<����a/*k^VSH����[#H� �\ `���1:Ө^i���r;{;�
�D�Ywt�4�ٿ�8����ۊ�Ku�u�
�d���t���,��f�Ъ-JpN^�>m��"w��z�p�0N�%�0U��E7�7�w����&ׯ�$�g�Z\�-�
��\\+��Gcbj�a�)�q����Ix��#�|�4��B��0�QNUߘ")S��L�	�����T沬:�rmD����m.��M/AI��h��ԇ����I��P�&#P	k���0�5E%��Qϋb��Ds���A@�o&�k�Yϙ:�o�➩u���"�Utzd�D� \l��y�4F��#�3U&ƨӲ��0xZ�Ξ�N�Q1�Y�2���2����Թ�|l����ȸc<gs�g:��i��Q�ue��H���� ?�~͐�>/1���	�YϭJ~&m��猽|�9�}.�x�-���g<��\�}N����1��x����̅'����g�m+��]��|��4��a��e�,'?�l"ڟ��:��M$s�g����3��B~Nc�qML~Na�I�̐��b���ޔ����*�-��	�Y�Yڐ�b������5�Y&;j���ϩ=��Ys,�0�s%�{���/@�֍�\�}��Y[�s#�3�����9�����g9 ���y#��\4i�����g.]0B~ְ�j4C~ְ��a���OAY��"�3a���
����6C~ְϸn̓�U0�4���ϔ6H~n�}&���1�Yŗ���a�9 ӎ�|0���b��L�(���(���Aiϛ�>���b�<@�;�Zf�9�3�H���������������������ρ�>;���a���a���a���a���a����}v�g�}v�g�}v�g�}v�g�}v�g�}v�g�}v�g�}��9��>;��>�̉�>;��>;��>;��>;�sJ���a��9�H9��>;��>;��>;�s]D�a���a���a���a��c����0D���n��`xq2�f�p:��ӳ�p8'����c�#��|<�OF���`6�����l��E �wx;���.^�7���G��G7�r~zz�X�؂�s�>��؈N���Q�<�{�=�(^�oďGE�z$�.4�* z�w�,Il��aȽ#UhE��>���|��x���Nk����Z�O���Oxa?}r*��yZ��#�5�Yͼ��t$UsӒH� G-���N��_2��0[�X��*��@r���o=9��f��s��A�k��R���v��V��%[��p �fC�hu�>�K�ٜ�Z�:ۀ:�":W��yޤ��F�e�}=����}�z�4w�4t9Qp6��v�ʞ%��e�2*��4��
}���dWi5�&��"������
�XF7���Ўy���Hc[<c0�f$c9�Yb�\�=V�P�]J���C(��'��&f�{M= b�}8[s|z8���m���-a��3�
�|��j�dp/8ٚ+���!%=]��V����+��8�Α���1S~#~��y���(��$���Ly�����#$�;Kޮ�]��~���*|�&EW��Sтl�����P9%Wn����)8n��� ����m�S��[�[k�[���4=�[�q�"l��kS/iRk�PkO땳iS#V m	�M5��J�-j�`�l�Q�X���f��ҍ�	6�4���5|����,v���$Q۔���j����ژ�j͚q���J��W��Wm�W-bW�0W� W��VۢVu3<�2T=�� ����)�W�,�d�A9�����T/|4G4��3��252�H1�@�j%W%�R�R�R���O�	JeУ���(T�4b(j�&j%j�#j"j� j	��C��������A�[���M��-�'ޥ��ʡ˝�0��LW�%`O\����3���:s&Y9�3W���xCN��M�M�F�Ͷ�͎���M;�M��BԦ�=J/@g*��[beZe�(�ʃ�/���|�Y�g�wivi�t���9�enf5�&�6��6��Vh�6P��9�M!���W �f�I]Fj��6p�VY�@�E˭0��k'j�d�=^d�*Ajc��h��h�h��h�؆�X�.<��A��	��E���t0�l�"i�
f�c1�"4R�IQ��P̔u��'Z�'Z"'6Q�G��F�F�CE�D̨��Ũ��i�R�aS�a�����<�2�[P�� RX�(� (�F'LOo���Ί "��[������He#Z`X��"*�珙�� �� ����A���+�_v?�Y��>=��"���|�<y�&v�s�*p�	mO��ET=+H������w%Sra�G��ab^.O�J,�&^/շ�0��`��wK\�l�� �γ@��7 �I%eX9L9@9=\e�&g%g�#3����EAb�g�!V>i;!��K������Q��A_7:�����|p�����M�r�'�V���'�w���p}y	�h+>��B��hIL�K
\#Vt�{����n:����������k��!��xnY�^!%��օ� �����j�)��A���O��:��j�-1r�s�!��5�%��|��Ȉ��st�����kt��-��"�3�����4�<�A�ȃg�$�N�B�4�1����:�*���G�L�2Dhc�r���p����"��.�����q��5{����XU �n��W+�f���
���e$��c���z���Y�C²%�C�������2�8���k�,`�D�(c�V;K �i��4>y��^�m��'�����"TF<��t��WZ��a������~������qf��G�6�Kd�<�OHK�_�pf.n�t�@��V@�|9�i���p�u����b�����K�@2��7�G�9��TN�qr ]|fX#����f�+�nP1�� �1�`��ۈM𠼞H�A5��m�<~�U�!�lBH6�a����s�`�8��om2N)D��TXoXT C�$�P]�fc�8����P��vQ4�<ΰK������4�vqnT=8
�8�֮	>��v�Pv!:�fh?��E;TŬ٥)i��W�K�]zq&�xg��|^�r��24c��W �0Jm�8�ip#����zӑ���u$KA';6�r=�W�q�#�jg���rV�~l4$�HȊ���B�i�TgFj���F���%Gj7V�#	V	TZnǕl�4^g�"'�J�)e��� U&�R�J�v4�U��l��z�es���n�\�S�s.˺f��V*/i��l��$%d���zCrfst&N�qzf�OQ��P�f� 7���*\L�5実=b��IN�ȦӜM���MN���m������گU��:5� d�m����#�(�v �\jf�*�%�c@q�'�ʤ�i(�<�RH���%T�Z;��Jx��P�y3�%?�6T�Yrh��o�.�U&�S']�Y��5R�~4�"M��4R*�6$��G�LR5Ʊ�R��'��j�p�������rKq\J�Dn�ѥ�<�^��z�6�'Xd�B��6��p�@Vkɧ���S=h���J�I2P�@P��Y�v�"KY�\)���e}d�E��J�n���i���N7⫶�Rصc�	dZ��Y-�ۼQ�\ؑ������:k�
�C'��Zi���k��}
�Z�(%�u-D0�Z\��W�m�@��*3�zE��*���A�k'��h����$��8�X=�a��_1D����?+�Xʤ5b�v ŕ%ϱZ�X�j1�%{ӡ�Y(X�ͪ)�:\�Tw��v]��$�z�OɜtB�r"�<�e���`�)M�<϶dp��m������rv6�R!���r��8�ķ1��v*�ĕL�K'�    ����Q��]ig���x���Me�w��8�[7�Ie�y/吭!yqn�Syy�"���e5eϋ*�5�ԍ�� ���3��֛q�/��ŷÎ��I��uG�M����ܯ������Tw`�\���M�؋J�0�+��2{i���B��� �Ӷ�.r�b,��!�X�Sũ]q��#TqV1�Hk\q�ZL�|&P�E,c��kqƵ��^{4&&H�֛�!X�����
hr�wK��/��	�l�T��)�2�Ϭ����8d��p{�e.˪C-�FT��ܶq
s����D��fj�H}X`4+��0��:Kjn2�g��C�QSTr���(�@�jK�gN�Dyn�f2�f �����,�Z7���)Bq@]E�GMt�Q��Pct�<�:SebE-��Өea��@����M��+�Z..��j�1V�������]D�1�����*������ϵ�e�ώ���ώ���ώ����)�r��$��ώ����%n�#?;�#?��ّ��ّ��ّ��ّ���[G~v�gG~v�gG~v�gG~v�gG~v�gG~v��\y�#?;�#?;��#?;�#?;�#?;�sy�ב��ّ��ّ��ّ��ّ��ّ���u�#??8��#?;�#?;�#?�ّ���n%��#?;�#?;�#?;�s�Ñ��ّ�S� G~v�gG~n�$<8�#?;�#?;�#?;�#?�?*��~�������=/N���N��|<�OF���`0��X���?�.f��l����٣�����|�Fc�x������݄�����bb�Ω��Wb#:=��G��h����x��?�����ܫ@|� ��ѳ$��!��T�m>�8:�^��} �����4�;��'��Oh�>��^?�u��ɩ���i��i���Bj5#��V�mK(u"��J�<�x�T3�xi[l�Z����O�������d3���ƍ��FKy(�C�!C[�B��J�ÙКͣ�����?Xdsj�l��l�\At�y���Y��U��fkf{ f[�e��e���D�ـ+�!+{��ʖ�ʨ�;�3+�y>��]��d�d��c[�c{�c+�c�0�<�<N�-�7lP�m!�m������ >d�����p�6X�vA�����������5a�,0�= �l��A���
������D6�>�)�b�Z�6��V����dk�@�k���t�[�K8�c@�48�:��mL��湪w��^����C0���B@/����,Qx�"x�c���'��)�]ٺONE��2�n�C�\����Z@����7���Z��f��NՓn-`n�1n�����4ԃl��5J����M��qN�-H�uB�W��M�X	��%�6�dRbx(h��كi��Fm c-�b��bK7�&Dؼ�P�W���~
[�؉��O�DmSPk;N�EHkcBkc@�:k�%.
+=�`5�_�_�H^��]��\5\mK[���8��Q���;��j �Z��^?�0�����tS[hS;\S�������
��<��"ȴ�b��\��Jm�J-pJ=;��BBi&(����;g�P9؈����������%��%���-�J�Ä�f���H�o�v�6�����dx��?+�.w@�<�3]���=M�=S\OX�,�3_dT��̙d��\URZ�Q8m#8m�7q��7ۢ7;r7`7�07- 7i���(e����Dvn	�i���e*V���`�WL&f���=�ޥe�%�2�H����0l����V�`VZVڠUZFU6�T�_1(�(u��N� NZ�MZ`M-��<�6����v�����Uz����Q3��U��M�%��c�cYH��p�N'S�"��pS�E��E+�ES��L��<K�&H�E1S�a�h��h	�H�DyT�!����31��_�&r�9KQ�M9�m0�f�R��TnAqZNa9�����0=��R��;+Hl�lA�����"����x�2 �
���?fX�lT�S&��22�h~��8gU>T`���ߋ@7S�=��=��=�=�̽&�=����P�
�k$
#ߕLɅnR��y�<�+�x6�x5L�T�j�=�ໃ�wZ�-����\;�Ԯ.܀\&�,,4���l`�l0��p�1����!��\3�q�yb|�pq�L���..��6L�G�}!��d4x;��G���E<;�#�6a�%�n�[�����E�/���u$����nY��%a�.)p-�X�]����2 ��|<�O���������k�!�nY�^!(���օ������j*�A�Ċ�O�κ�j.Ir�t���յ����|������st��"�k(t��-N�"�3�����4�|�T����5ɨ�/�2��CXo%��N��	v�R+���Ǯ��<e'��HS��� )�����%�p�dj�**�D���[`����1x�p�B�#�u�Y�^�y�s���l	��(`;t��J�L7��2��#�3�٫��Ko���*��O�'`�Ç�e[E��K}:��:��O�1Y����X{l?�5��7;�?i�Y��Q��s�Y1���Ғ�W/����%`�8��� _�g�v�:"`� ?dI��a�@�|�/��0����=�Ʃ��n����dHןY���ki��@�{T�9 c0�lA�6b�=(/)R�P��i4O dUaB-���t��F`� ����7N)仛��
Ѭ/e���P2�1TW�&*��vͪ1���]�0O4��`�!�#��]�U��m����k�h:��0�]HO���#�l�X1kviJ��lŒn�^��2��(�Wz�?�������F����)�o��H�&�Ɔ�^�u�fm��R�ᎍ�\}�Uk��Hw��A?���I=������hEZfC6�Ʊ����ɑ$�v�ڽ���F�U��ۡ%=����١�ɦRc
H��y6X�I�������m7[�l�f�\*�%�[�9���˲���ĕ�K�R3[b3I	�"g����ٜ��S`��<�S�}8���2�M�5�
ӄM��g����l��e��)G�4j���,m�&m��m}�8d�����k���N�G>��i[������A (ʳ(���ǀ�jI�$P\0�a�2)j��<���ҷE� k	�֎)�R�83Ts�bCɏ�A�{j�!���b�I��I��o�?�z�����H���0��J��3I���0�T�q2��j�ᤤ�$��v�m�-��;��R��)�[kGz)�:���^�M�	�м%©�M,��6��Z�)?�4�T�f�F��x�T#T.}�Q���R\*W�6$�v�D_�s���R�[d��Fg�*�Ǎ���v�Ym�Y�֭�V��6�@�*v䀫m�E�� �Z�B��	;�Vڬl [9x����7�FI�]�)L��(�u�%֫����^���J|e�c��I04 c�����%?�8*Vr���f�Wc�C��
3�2i����H�e�sl@�-�Z�l��t(l�
�x�j��W2���];�I�^�S2'�(��5�EY�Ū=X}JS8��-�fx[�(mn���ȭT��9��/0��%�mL����)q%S�9���5,�b��"kWZ��q��%lwSY*��]�>����xRY`�K9dkT^�[�`^^F�ټ�H��yYMY ���Ho� u��r�i~/��L#|��f��������c(�k=f��e�(g��,��j,p+.0�@�)G(h�!������
n��^�EC����9y9H��m���!�K8�Y�m`�8-�x�TqjI�,�߈V�W�2ҚX\��0�	�q�X*�Z�q�h����	�q������j''ᡂ�\���(�ur�,^9U}c��L�3k�e�&4�Y&#�j�˲�h˵�"
3�mĜs7��#Ѧ��8R0�ʳ7Lj&����@%�Y.>�g��(�F=/�1P���w������g@g�4�5���֍���PPW��E�pejԇ�9��3���T��Q�j6�@jY�s8�:;�G=�Sg�D����,��w�U�����#?;�#?�
�ϵR���    m��uC��ϿL�sݼm�y�s��џ���z-�v����]�D1����p h��� �N�9��h��v����ׄ1����X����2�Q�Ān����� ����/����phC�nю �N^�#A@��ߏ�I�M��rtgty��p��X��|�e�����H�;yt�o�AZ��VJk4���b tctM���:���I~UQ�o�r8���A:Ãn��4���Y&�a@h�����h�	��j7�G&BcI[)����	:)�C�����ht�R���C�	�j�@,tZb��L�D�Ma�U͓�J��͆���Ph��h��n�8�`�ƻ�)2t�����Mw��l���G�C���ѡ?*:t�`PQ�������C�v���ѡe]u@t���@�u=�ю��'D;D�-Dt��p#Ft�X��D;H�:e�B�R�9Rb���s
m�M�m��D׏�n�8Lt[Lti-�D�a&8Ѹ�Tt���Ntu��o�r�1������莥��ÜfE��rPt��QG�v��)�u �h]��P�݈����gEwd�:X��E3,�Ѣ?"Zt���pѥ��u�%�(�v�hxb3dt^���V��ּ�$�݂�k���Ƽh�N��F��V��
��	��]O:h�/ݢ��Q�5��]��p���%Y΍���x�ѵ
ґ����	��Y�&Tk|t;��mk|t;������Z��`|t�h�L����� ]{�A�˺�BHw������^�d�@�93݈#�"M�6�Hw�H��R�t�4���9�m!Ҹ���H7�H7BkE�)���i6�2ثb�t��R7)����3���,"I�m#-��<F�@�4��i�4�H5G�Y�?J�t�W��4G�&��O��Ѥ���N���I猡�%Oz�Y
�dy��� ��'���`����`>�����l<�?|d<O����x8���G��b6{�"z<��ϕ��E��^S|���=��M����^-� ����/~%����G�z.��ި�ū����H�����^������+���wt�=|��� 08mO+�P��]��w~�n����/��%����ZxQ=�Tt�����p���U�{ҧH�x�~U|�GuC�w�j����Ҷ1F:��p)����*��)ɽ0�+>u4=y��˷'4w��|ji��3�O÷���d:L�������w�6�o�lm�D��������R�f��������/�u�	�?ѐ�Ѥ/��DD�����B'�a<�b?��چXڣ�l��3,\]��V�s�	�,;	������x ��~O��<p0�D>fh9zNGx���R�vϳ0�'0��c)��&�/"�LuA�2<4� �Mx�%�5S��̽�����̠�-�C>���免'� F�����!��o����t�&J;�]@݈p�N��-GD�(��8K8�R�O������U������] M$\�ǣEv�Dň�t�D��W�u�%ؗ�|��{<�R%�]ٗ���8
62�؉�.i��r�P���>>���z�W�;���Sx���W�O*.]��lq�v�׿�s�9e}H_o�I��e�Jf}��x@V<."���&V��p���"���ѻ|�#��@;�b�%�E��\�U�I��ɠ��	�P����Oh����'[Q��y.�7Ѻ�e'��o����w���q��� .��_i�l�{�&�f��!�n�����P9�x?=���#dv����݅t�f-�H�K�1��I6T�.���B�+�$>���R�W�`+G�#R7�jڑ�k�J*W�9\|��~R�;�q���yn[�@ZsHVy���ȉ�u��&��5�.��@��[L-cx�
�q�;��,%��r%�8� JC; ��Ij�𴳟Ć��M�پ� ҏ��,T����4�V{.����T!*�����ä�l�7\/u��_�fO��H�孽%EB��,���@�����`�R�/���a����/x�P���ɿ�������	_�8��А&�!�-�����&�G����)���u��:~F2�f�?AU����@���q��Z�H�#��%�/�u�W��6`0����OI�*�L�� �+��'�p�Q��,)�]��tMZ�$���]X��F�Ap*�lx��$O������|�I2'�$��jpQ���瞜�ERx%�0�&V����}�A�k�w��V8��e,$/��0��K1�B9����B��L�ğ��7�h��D�n,�����.z	̆)�Z��v�ǸDw��,�nE�[��� 3S0B�s�90/!���J��p�7���d��j/��Z>���w!;�_|����3]-L�m�_%�K���h^���QƷ��'����b<>:99�z��
������c�1��͆ò�֏���c�Mc_�.�PDP��.���.���.���.���.���f�%6�mnZ�������lv>�Qh!q1H ���Ϻ��Ǥ���.jТ	�ջ��.\��LH�\��\��\��\��\��\��\��x��|><�g�c�E(4h�:r��|�o����'1H�r!bp!bp!bp!bp!bp!bp!!�ɨ>M��!��\�'�����@By�Auo:�p�a�bo��('M?��)h.��B.��B.��B.��B.��B.��B.�`:�0��5�š���Éw#~�A� CIB��h´��A|�1%E?�؃0{p�{p�{p�{p�{p�{p�{0{��?��Ϧ��-�`<��bZ���G��]����������9����9����9����9����9����9���٘��|8������lP��,�9H��C����:4���~�1���I�m8ퟍ]���=�؃�=�؃�=�؃�=�؃�=�؃�=t�=�Z).��d�m<M���xX��9�%�<<�����ɤ0����`8����k|�q���Z���3\<��3\<��3\<��3\<��3\<��3\<��R�A.�ó���b|v^QK��j�ܤ�g�����z?���@�"�˩��Q�T��qE�iگמ%e-[зЬq��vԺuJ���wq0*T/�JW���4ɩ���ۊ�[�X�$��h�q����}�q���=1�d������������������������u��U����_�"��Go���`؟�MΆ��K��m]���\�1�R�5����	V� p:�[V|�-��l�A�3vA�CO�J�rA`vA`vA`vA`vA`~rA`v�H�A@��fi�֩Q-*Q�кwv.O�^$��?hc�,n¥X�W��6�#mu���PR��z<��oϐ�Z�t��&�O��{��C����ǵ��R~w�߅�#�h.?{��� +{ќ�xJ%UE~�������l>�Ӫ��l�%�/���n>yv��E�ר�/��|�5�������xX���MJ�$+���%'phD�����nu��_/W�Vvq��/����XBv��z|ؕ�׻@�I��xn6�.����K_,�b���}���Qz���Be�Js�>���C2]�.��*���Zh�(����U4��u���B�'a��+G4�-��t�!P��f�l��7��Q��?��^���� E/�A�d������4\^ʍ4���.ZR��*\���VL9�����-ʾ0�����%�Vh;҆���Fv$5B�^<~ˋ{Q��l�O��1�~F��!����B��rp��v�I���H�_/���w�~$ޣ��|*5��0��r�ԇ7�V⿠ �\�^[��S���mv��?/0�Q��LM�#��	cR���~�s31��mԙCإ���.k�h���7�G���?�\�#��A��[�y���w/��&D�(-sX���i�T��:��X��o����rE?�~�\qe��r�Z�Ώ&�_��z�J�'�����;<I0+1��    �����]?>V�6Jt��aJ�H����R>S��T'��n��SN��/��/����'���^���go���x	������g��������7o�'��/_>���7x#~���7�����׾���矽~��w����50�<ݸCB-k���p���^~��)�[}`�a�ӏ�0ͮ��*5��JU_c����ٻv�]C;��9뼛;���{���tp�,�R��mey��s�U�����p����Y_j`���/g}}t֗7:�˙_-̯��Ϡ6�N�g�f�Q�'���>���|EFd���K�p��1]�����ٙ��tvf;ӈ�s��34���#�á7�����`���]L~�v桉��4��8�]��|w����^�^|�����a��!�n���)�_��O��B:�����rJ`0�����C0��G�9�!pA���!X��\��g���̘�3���A�V�n8�N�n�\��* �fV�%���H�_N~͑Ya���1g�9C�#4�\h�Yb�ki����x>�1�g��ф-��B�/�C�z9��1��_�ɖ�JS����ݗ/�ٛ�_>;>~�$�����]n�ƃt�_�A7~��/ҠK-�j�NI^NA9;��y��sv���~5v ��/Ƴ�r;/c���켬�WfЕX�ev^Έ+���܍������yj`~�v��9��tΠs�3�
��|8�_L��Y]����A|*���G���Tq�l:e���t��..ئ�U_/�flM��M��7�寛������D�>[��r���	� 걦�`L�6K����A���`r2��6Q�����Ed��.c���N�2R�2���`2^�U]}P�5t��uC�	>�t��#�\r�k�7k1h���">�P����#��
D0.�S�Ǻ:�إ	a=�_���H��	�Ww�����#����W�����i��ă�0 �ex>�f�4�V�`�拏L�67k\��];-K!��L����σaX��U�K m�
j��y�=�����|�ml�ɶ���]�]�z��2��M���0�4�����Lބ@�p9�d�'��l"���p2p�������f�r3w�����]n�.7s�������f�r3w����r3烳���b6�^nV�yV���g����I`Ȱ�[�9�dˁ�����8]�3�,j��KNfɳ����W!��\B�:_T6��]ܚ�`�ֹ���꣛���[���r��]ܲ�N�c�"�mX>�n;��-C?�;��r�}fj���\;��N��!��� ������X�i�̻��n��Ѥ%�y�k��o�;���yڵ�����^3#/�,���C�)'^�p�]�޼TY�:�?J�����tƦ36����26�t��q��3<���ϟ��,C��<���|6-+��b���,�p�B��_���i�ꓢ�wd�uGFݑQwd�Wvdt��w���?8N�!�_�!в\suT��(m�	����j�$���'�=�z����a����1�+3#5���ʄ��j3s�V��Z�w��Oh���(;����O�<d�[���\g�:+�Y�����Z�g���q.܅�rK+*?Vs�%c/gY���&���&V������?6g����;Krz6������*�A��E��p�;
�> ���QD�^2�T��ۤ�B(+�%�9E��B!���nX�y��j��ˊ}��
�����|�hT�O%��2ļ�
S�T��^�Τ`6@I#�:�go�7�0��C�/��p�~#J���?��u:� ��� NI|{�?���_%g��XG��$% W�=�������^���j��ԣWha�#�kyL�-�a��{���P�.�f���PO���a���a��
5�ö�p�Cb��s�ͦR�S
�$Ts1�[H,�	�nxv2<���O�W������މ�Gh�ӭ��y���A� n��Jѿy��{�٧s���hN���O��WTݘ��O4vB��5��Rm��v	�i� F�M\C+���o(��N-��|��ʾnV4k��z�	(��ӳ���R��7�1�n̝����/���'����}*x۝�8��+Y��ԫ�J���_݆k��� �$(ԇ�E��
FFX�+.��������/۰L'�y�O/��/,����)�L?0U.J��������	ʪP������VB�O}��-���U�^T�FZ&zcJ򊩆����eZ'l�[x&�X��AJ�� �s֖��v#wX�!U�:��@R d��璒�
�!5��KL��0�jrn#��<u�wjh�=�@v6���Sr(;��t����z�ָT�1�����KZ��mxHb��� ��Ä��c�r�����Q;c�*��,����/Uu�����*�!�,�n/�|�Z$��[,[��U�����oy�%E*�SI�;�xO%;<)�P�|ߨ���/�EH��D+")Y�i��ߊ^�;�����5��	v���>��Dc�.�#�'/B� J�Um���nI���R�N\����.�3��R�I^�	��.�x�rK��Ψ�yq�����.J�C�ж<8*~�L(.����3��X7�W�;���?l��/~�@�(�u U��W���Calf��B�U����
&;I�㓌����\�╯�d�B��|z�͘IT0�h	'k�T��H�Su�g�}/bIcY� �J�5�i��B�_� �&�XHL��@��:D}ƭ�=(b�(�o���=}����/K�/�Auh���R���r�kzY	������_���`�a]��x�(����mg\����;�u袪%�K��`�a��0�i8 �r�W���bZ��󬜬�ܩ���>[�?�z0�͊f�Ms{��]|1��^-�5N:׶���`�58I�,#b�.��A��c��=���;l����2L���߹Љ��:\�&��`%�Wj�%��̮�8W��KM7%�.��=!���H@�D���;�)���߂�F���1�oB]\���>��$���h��%�`a��O�W�5m���V�1y����-���Ѧ؃�:Ͳ�_J�LB�oE�A]A��u�R������;�@����1�"c����2��$u���ʗ���j��bR�	/¾��ZA������Ӝ�FzM6�w��Q|DѢ�qviM��z����Q�tӲ�V�e�+=�;_2�X%	��޵О�[��+��X�Ǳ���ĊK�H��h�!Y�G�����F'�â �L��BM�P�`�I)܅T���@�#]s�Q�yS�w�0o�)e���4��MG�6��N,�ݢ����Ě��7��Z����]��o��As� n�d���P{'~��זTL�fPT5��1�H�!�0;AlU"˨@��a�o���$��ŻO��&�������Oz`� =E$F���Un�㻐,-
g���9"9[1�Ym��B��3�9�U+ZXB& V�T��=\�l���[�"��x�V����B��J����\��rҪ��!j,V���-�
��X�m|R��(�b
��Y�A�{�>�����5v�v%���Z����ϋ�:	�t�E�rn�J*�:���)b�Ƣ�`-�d���e�R�R�{/�B��=�?yo���j�r��/�%��=�W�����C$T'�ˆ�Y�w|
HS��p��I �ۏ�hHƄ�;��@��r�>�.�^ɒ%��}���#V!٤h���C�H�*>U�UXо�͞�N8���,S�@���C�>�k��O(���.L�H??�LH��2��T�/�� x�����]R#^���,� �:Qm�D�L��b��E��1��@��K������|�"����o|�E��O�*�%f� <}T�ںI��IњTE��&c]�OhZ�q�%?���]���[2�䖁I������ri@���XV2���HU��`�N&��:��n)��!�+����T�v�@ q��A�W@1ލ|]���k�����_���7�����X�_�@Sw��Į���2ˆ�[M��R5j	�(k2�	��}����p���/K#�=R3    b P��(�}�$�J!�߽~A�Gq�>e�K�R�s�Dz���ݰ��%wM��Jt�oT�b/�p]"O��H� ��y�b�[�TA��
�$�$>GN:�j���=}Xi��8�^�)Ȼ�w)W;�&�".#ڄj��
��u��w��`91�q*��U�MX)r�]�B`�r8G[j�U�b|�lw�},91g���vn��W��~�9��Z�w�ؑ�5��o޼�$�"��nX�mO�χ�z�m���C��!��RtI�+�&af6x(+�{��Rt�R]�֕�$�
����O�@Ɂ��x_}�
;���P���?��'��S�������O����X�@�*���[��W>�,4�a�\����Fa��A�F��p���fVM�@M���9-ܽ�V<N2!ZdǏ���hI��.M�`n��+�ɡ2=��C\���i!���]���CpBn�X��5�]Y5+#F��m~/�mt�_�l�ڋ�������$&�J�:/�{�S8�.x�o�,��L�3&QDދ}Zh�9�kOG���Ru��n��@�o���g��]$��	���VP��;8��hلʀx����Z,�\�ͲħR����z|��ݮ�Xl�^�~�5с��f	�z�Ԋ��.�S�'�9���~���[h�����6t~�lS6l-���V:��=*ۥ��:��]���6���
m��/鼝��G����n=ry���Sp�4���$��/�%u��[m�{qz�(�2YUt���dfI�~=����9@�yσ1����y��&�$����,R��c�nKU��`\���B�߰�/b3�����)�	
4H�@K��B���՘U�U��J#+��Zd��$���<`",�G������xA�0	�"�q����"u��$s����|����V� #��44
��4L��%�0�"����K�'�v�IWJ���o8A�Az����|i�J�A�����H���!Y�d���"Y?��]�	C��$.r�	zʯ-���Ht>ȭ��_W�E�)`��F��W�B:�%>�	R&���,Jd�"Q">�΢-�ix�r0�L�?)U}(���RV��xڷ���s�Z۷;P�v|�s|����_]$<BV���1-��J��L�x%���u��-T�B�Vh�0�$@�4�S!�U�W�WIFg@�'zcAR`�~��*?y�����F�3,���O=$��A��ܒ]�r
s&��a�A% �>9�q��H�N��>�[�}tlKNˬ�y�]M�E��'�.�?Z�h���5�E�0�v,�v�Q�K'�zv�뗩^?�֣J��\/eҌ���ȥΕ5��io�<��/C�M,
�/
��^�;͓�i<�ɤ`�����ne�5��H�46|��3Ci`G��\�	�Cu	{(�)G�j�>�`�Ű���B����2��j�[m�PDK*^�׎3��C�?M**^�׃	&Rړ�d:�;װ"X%EY�k�4����]�碏%����[�lNj����u�#K���u
s=�Ϝ�F2��)�����9�2=96ξ��|�S�z�'��~B#��iʒ>���Kx�k��h��Ӗ���k�����G9:��8�����@����L�&�;
q�!�"����,��z����£��yo}!�F�S8	�5o���w�a#]I�!�AO)�!�#��R��I��7�6XsRX�o-cȨx��|<]���h�]�����c,�!�JZ�d�,������h�r#b�ox��M������Ӷ�i����W����?J��M k��6*�(5�������R#��F>�n{!�i�vʑ���Ŏ����c�Rn�)��6P�����f���<��&�x�U��?Z���4��z���)��J���a8pڔ��i�3�Nr�h�]�w���gRN��r��/(����^���썺�x�sE�񢬩PR��̂�����W�n��8J�ܾ����q�e�Å�<���a;�{b'�!���R@=dA���űi$������(c���𒕃�8��:�,*<I9��]�UMeG�u�]�f-�/+ے`M"�>j�G�/v+��e.���ݱ#޷��
���㻝�`�c��]r����<��F�z���<[ �x����R�?V"`C���5�<E�v���*e^�������0ăOU!,-��M�%�*oѿ��_8�l_�"˫,c����Ѝ��}J��ӳr�[�J
�b.�5����j��������&�ɯw�w����_//N&����M�Ƕ?��ѱ�����d1{�=��2��R�%"%A����	�A8�4'>#�~���&A��m�E������u�����i�Ǫ����x�R��-�7��Ѓ)��%e�RT:5���@�(�*c9i¿T�]�6��o���*���GW�t\�3�����+)��x��LRj��S?�.]j*iW`7�bL�H�ܳ�B�z���A+�3�j)/�b�gN���l�!���R{O3ڴ�-�nd�R,�;�.-��!vC*(��4��BjJF�O{|�`7�P�j%��O_#�L���rJR�tž���}�R�2����.��tDq��Ȅ�Y�ڶ��:�n�s�^>���yė�{��{Z�(~]��_�,Qբ�Υ�HaL����k�W~-Gq�A�����.��<�؉{ɬ���~D����\������ׄ�"�@%��L��.ņп����.59^��P5=�����yqZ�p:��]V�u���k^F�eH��[/����;�����T�0��L�h�׫9��Y��ً�2�}:�z�p�&F�,JT+���$�!)	�c��������'�,��/$�*�S�(�/�M߁�gv.� � ��8�g�b�Hm�Bg������$�<}��؞R�`�_��%��<���d�g 7.w`Dt�xR;#yR�@f�lp���_V.����.����>o�>�'t�=EN�=qf�l����*����7������������?e
��̯yS�ʖ������R.F�"�h[L%��ր>��J�L�7�}� �M�����9IPt��I�k���(���1zz��
�W>��_z�?�������I���}�ַ�<�9Ƽ�U�=���Z��`��,t��R��J�
��0:Ƕ�]@��S�(���{�s�������7��V�VS�⭄�-�8T�8/6�����jEz����k?�5P6�B��9M�7�$��*��H�LQ+-i����c�i����:I9�ꇞ����`��ˈb�҄�PŖ�H�t�����r�È�:"2��R�TuIf��%��&H&�h��ڤ,H�UJ����X+�N����0EC�m�g�	%c��g0�Z�W�t�W�pb�~��x������y��W_<{�H~���_&��|��%��G+cQ��hB:�ck$\�?�3&N� �x�(�I�R����:��]�N�'��/�Z�hF�i�5�r:<�{��������&I旔>��d��`ltkM/��a�/�Ѱ���J`��zO�H�T�5��R:.WՈ���ۋ��-$o �8��RF�Lq�3]A'�n�<���'�T.|�摑�fg��j������9����	�,?.5�YL>ïɋ��v,6Q]l�~|����'�d8tNނ����ǲ�kꢍ�9ư��?���ű��~}%�b��oػ�{��^?�\b���Ox}�j�`
鱐u�0���G�cXe}�U ��5눷^�9�!�-��Ob�v�I|�	l{8�O`)�=�}V{Z&�����R+�5��R�INO�ԅ�������ifi��N-Ϟ^S/K��ו2��+�ǁ��b�X5��g�Uq�|��S_x��@�!5q����2��xN���������AGʾ:I�w���Az�m��3�Ф��$�xp$��T���c,�Zh�?���(�����(,7k�K+FG슫0uǑ����s}Dp��KQ�#'"�N~��{<"�ۙ�GN:VG���3��Ǔa{���|0���d0�{�Z���.$�g�9q�2�2,��L��L��ڒ�ZS](��ո��d&��    g����`P��!�Q]������YFdu!����Æl��4��=�4�+Y&��Y^Y�rW�hje�M�R����2S�\�I�q �teZO�ǉ��PL�:�Pײc��[HCo�O��t/��U=�*/P�]�&0�Z�\�t.�Xq�>���(��{QgD�<<���"�y��k��%U+��J������i���v�<f��a�fA��s��^�5��(!��!��sI��R�KZz,1tJ��@ځ=y��L��Q�ې#��Xy�p�P}�ܰ�Lh�=��l�Kթ�Ђ4&��R.\A�7{'մw^��%zz�.LM���q2���Ͷ�BL��K5Z4{��$��.�Y���Kn�o�'�qv+�Dp'dA��ө�7�������cΌN���+�{f.�1II�hC��9
�?g4�j�5$@
bG9Ǩ�N��l�m�i�0T��ɣ�q'(�@�⬣��(��P�X�>8z�s��7�,Jrni�f�0�u���=��1������_�"�&�0�"&_�`E��ž���-趢�|�쬎�xh��z�Ҡ$oJ:_D�d��jՈ��S�Vi#�P[���71�y�!%��"�[�x�ER6H����15�Baֻ?Zzr^�����LnL!�Dw53%!e�a@Ry��*@����w�"�=�ӟ��'R>6x{�m��ל�.=>"0M2��tr�,�6脠�[�V[���+����vmR�F��P��j�˕�* �.c�Oe؂�$jM�)�;�ȏ�oy-6b�Pa�l�g���<P��Z�2CKa�-E5�	h˾|O��a�X,J����_�.���Ir�gz�Tm��A���&H!Z	8�>�rd�3{�	9Y�*l�@�F[/�Ȏ���f�|C����v�R��d}KqU'�/�d�{Â��J\f'[ߎV«�@7 �l�J���%͍�q��Gˮ�O�� ����a���ƭ.~��:)�+z+˜��Ao'A�ĮԒ�{�jeR:�|��%�Fq��߹o�DL4n�m�l-˿��0��6��o*��\02����$�/.����ɽ�KGm�{�"��O��ҳ��<0���"/��-��H��A������"�W�ғ$��)9�YO�(�t)Qi��	@U�{���o/��0�CZ IrTbP��m�x ��,�x)���E袥M:/�}���Mi����4�T�n��a��	H�H�p\ę7�j��w&���ʷ;x}��FuNYK�*+(�S�P^�P�#���e�M%I��Y3���T�TZ�z)_	�0͐L��e�~vJ�����=aJ���:�U���<���=�T��+Y���mn0i�O�<�Z�|v�h��\o)mZ��%)��Hņō���ҶB=���5	�XL���F���4���+��$��B ;.��dE,`$�X:�7�u�)��E~��b�H�:��!��Q�෤� _��_z%�yOT"�"����#�@И{]pK�ô���K��-U�8鉴�d���_��^_�4���J
��cQ�_V�5e����{�|N�w�B�[���&��;UL�	^�D�����J,U���L���������_K�HD�)kѡ��<�V�(��膶���
qCk" �肺M_�lUu�.anp���q���eI�K�J��Ҵ��oՒ��D9Xx=I!&�K�zB��o����YY�L9���$e
^Cެ�c�
#^���J�ӵ�[vȔ{��X�t��l8�(_����⒐��x�4/�����^:B��HG�e�?!���l�$�"*�nG׿��:�:��pL �	~�����_$ `uP��#a{����|
:��~�n��NB�K� �_3v��Tnz�r�~��{9����2�)&�K
vs�v�|Q�3��M@��rQ�[YI� ��>�=�~�@�.��Y_�-6
	鍏79a��><g�#��p�">���X�z��z�e]l���
�.��Y	��D�4�(Lۊ����ќ` ���gx�&b����=0b�xY�E@�-��dJ��3�c-��XyKY��';M/�O�V��:K�c��6�t�b�".Ȼ �^ba�qbB�,��5z��F��r���\�E����z�QffeW����ݛ(�N)�ڒW�)ECy���.�i1Y[ඓ]���ϊ�zU[�����J,C����n��OZ[��XTF�Qs�̀-3+�ʼQb���x��0��i���c(�w) ���6��q�C��5(B���oa���K�,�wR��:-nWcu!oiC��^�D�-O�V`s`�W8BY!��Z��
A�4��B�&i�B�4�nO^K�g4w�	�ӂ'�[��B1��h��p�?���DU!�)�.���*�1�I�$˴,�($C�r���߅�^�����\��G�G���5
��~^$<�����[�:��9�r�9`X���2���ŔY628X�֥�����L��<�{��>)���F`u
��i�C�":�:&���V±�_���3����vȴG�Aו�`
�P���/���H)_E��e�Tx��u*�Z���0���4������@��|ĉ�w��]QAQ"�$\A��+�)лn�S0�q07�|%�9�*lP���<\�8_���3�dn�2�%��u$@�z�.�������*��#T9�%�H��i�s�x
�2eFm9e�Xh��k�;�9��v`�P.#j-�FXCl'�k�ڢ�l���V��.���	!�M���G���O+߃\�v"y�@OdRV�m$C�V�����X�0{�D/��,U�D�&}�:����^�1�'J`�'a���D��ď�l��O�XHŞ<�5uAFЄ�W.��,~b�s%�U!B�*$���Jk4!����R�˩��+�A�ړ������"8+ze��j�s��(�f&��ɕy�i!��x���� ���5���\�� �q>Ԥ�i����<hX�,�Ȼ��;�����}�c
�nmȄB�ʅ�W�v����w"E�����ػr��$�L}UDY����u��Y�uʣV�ܔ�b��z��+�_y7�F�/��)�H?���%���YC�$��6�B���Wl�{G`��2a���9�8JO)��w(�h�㭢��ܤ�H�SEؖ�a����n��k�T�}�4�o4b��%����~e19gկ2��rީ��aw�L򐤂�Tc�]ɼM�𤲾�Z�x�}��UYs��~�x;!�I#�&<' ��mL��H�+�"(��v#@�_�H{a����M��%F^Z�.�$��=�Ll^I�ERVb�����Q*5�K��D�	��W�fyk���J�
}�'�9���TQeOľu���СL!Q�?���ל�yJ���*uF84E����ւ�i]��"�D^�
@�0��p�{�5JZ�pJ���2-}�@���R9>�~��'��E�-ϩ����N�D+��ħsЄ��y-g��[Jf��<���k:��%�53��:���x� �J/�{�w����B<4�}��B�=/�J����a�N2�.�L�IŴ��f�pL2ꈪ��<h�p�,��<� 5���7���89N�m&�h�x����q��\f�T�s*;K�������|U?���a�ܡ�LG��ː�1�I�YQ*�\�����W����sLg��s�ҫ^e���AL7���AA>=���c����\&�.�7����,g��O���~��������k�#���*v�y)�H��oIz�>g�Q2��0y%�)���N��XT	���dJC�קLT��3�� ��EI��� /rab��DP(��iaa�@g�$���阔���_H�,@::(�,�;��mA�K�r��d�@�FaN^���a�N&7T=��C`��B��\%If�'90h"��%�"!V4'���㖁�C���ȗ�����o�.UT�hnW���2R���S��e���z��&�ߓ���Ŏ��~\OXHu+�'�ʐ����U��0H�҄V&�Lz׼%h�2 ��xe%��GǇ)�d��<�`^�L���F=��4�$ƞ\�ד�#��g�� qm9r�ȴSJ��6屺�ә
I�?�&-}++��V����    P��d�j��j�wX$Y����^����	�Jť��/L�����M�KYW	jR���H[IzX���O{:�BM��7����>��z{j���x�7\a΋6�+$Dʡ0�X��-�S�T>����$�F��<����-rіd�HvC,(Q`�˨�3�n������c��0$��7"o�K|�gώ��:}Z-�xrț�m�Lk��K��%���i�=Ζ��
'�qkb��B	�F!{���Jusb�A,��_��Js�� >���$飄�-0�tEe�c?I���$�r%7E�e_��p��FR��g��H?��/�p��ʥ�ٱ-���=ԅ�҇\R�-TU�y!���T�����V{Yc_�
�k�s���<4͑���)#��AN��M
ڥ��w��+�(�^�_��V8����Ȃ�/�L��2a�&9��]�^O�d� Օ��K�~R��C��J�֖�+nE.l���\?����3����UY2Y�P��3Q��L���[~J���o�j��=�[�][&�H"�航]�R>�z�n�4�1_@:���Q����"�"�:��z�C���8�2,��ݭ,Ȃ�n��ɒK��$&���X����q�%>kKT&*#�d��5��(]�vP���4�7P�P�$����7(*������r�d�y[�@Ȝo�)e���֝e.��B�Lr�Fe�&�!��㻈v��w*�,��!���*���^eNwΕ���\	(��hfU���AQ�]VtQ��d����q�_��UI�#k�mY*��Z7>�Hq�����N��p��ֳҤ
�PVe�P���8���l��t����^���i)��{t�m�U��AB_���%���1���'�O9�� p)\�.��*�<L�٫+ɽ�J��y�&�c��s�l5H�l@�=LU��ǀ)r:Wr��j09�JM�c(O�d}�	G���������N���v1�p��^$S��pBp��BgC(�`�`�k���3�յ�y��\��.�oN�9_�zϣh-,%�?����o��IOgw��S��S���FV�Z��
gX�LL�e��U��]��}m�Hk?�YL��I樂*\{h"D1%�jI������Ums���
�2�\I��(�m5݈��<�4�7A�D�G��P������Q�w��Ia%eI��wo&���`%�ҕ���������*��{e�K	i��$b�9Z�L#�`]ܬ��慊�J�m5Z	���>}��A���_e ���Uڸ-$��*�E��.����
{��d�oL#ߗLF�>O>���j־���kCE�/��T���w��/y@���w+i�RAxJJ4c��@�4%҉�vR�u+I%$r�L�a:��/�3�	?q���	����q�'�D�N�0�v)�^����
Z����1��DA�ֹP�+����K�E�*��@��Bg��R�s�Ð7�jW'���`%١:V��k�T��E^��;�aD}M�[ɲ�+�[Z�e}��|HW��ҽ�����M~ɀ��Qe�HU�_�.�;�8b��A��}u�;a�R�#RG(ؐ���%���\/��k�!���$M"*o���S�ey�&��)(,U	�7A���x����Ѕ�q����p��k�[J�?�@��KmF��Ma�f�t|
�jX�T�O���P3R7:�^���nJ.U�7�>#yy��$Ǥ��&N�P�\,o	��.wM�U$�	~r���a8���t�Ho�̝Ad�f�Az�G��#��=~�f7��5���"~V��?I}^�0Ӧ�+!@ެ�z�\MC��9l��s�)g|({���I��k���k-����>��������ى�ܣ[-(IU�ueO|:�"�M�6��ۮa�խ�b6�	�{�#(Ma�����<|@.�t�}Q�)�� >��6�P�툩G��*����{�A����h9� �'�a�]A�����k����T��vi}�����Jh�H���H�u��cy�	����'���\���
����$E:�>���;�R�;���(u�Np�������bi(d_n`���D	�!YRwB�s�}��:	kقu��S�9H=n;H:wW�A��Z�Ҳ�?H;��2�Z�b����{8�Pl��)$i�>��ٖ��wI1�F��Zmd�Ga�,C!,:�b˭YO�#԰f���t>R��b�] I�/��k4�D]j�(<7�3Qv�o��(�F,b#���D:M�"�rT�8-�H�Z�m��vq7tmr��wB4�'�}JcE�wa��a ��]S�c2�z�/�U�EO(�<6��PH�F@�o��6UCd�����r�1"I?h��l��4>R8G�%H���
"�[�!G�ј�$6�bR���S&I�M6�,���x�J���:�2Yέ�(5��l4�ՐJ�h©l�8)Blz
�F�l��.���'��%GB��/�>��Ŗ�1��CE�VX��L��R�̲��d���t�i�vs
JS�N���p�ߐ����GG�4��Π"�Owu�|�m�:�4��q�$�;#v�%��S�H��N^��;E4e/z��ZHonw��Z�͝��)��:h�r�KO���He3����Hk�)*�*[ǊҞi�,*��m�E�e�_���]!F�MXF�UfJ��o@*�+�2H٬�C*���� �p�VJ�(�*�C|�Y���.���&�:�4�Z��rVw��S�$�2�TC�S)��'��tS���C�1UxJ�栒��
��%��P�Ra���:d�b��Rec1��j-$��am�Ti/��T��&^�R��PU�UqU8'����񫇜�_��2��(�R�wj�]۬V�z��Z����fkh+��	��D{�#�U$���:��U��p�P��������_�3?���uu�����T�n��X�h]�c�}�.;V[��c�.�"A������7N�Y��Z�����6ѳ���rב�	��ck���� ũe���x��bkKΧ��k�g�3x������!��C�;���TP�������������h�
�2>n�pm�+�[�����24W��mrsY:�[G�V-���;%Ve��P�a����(��+U���$+~���r���UFuߺ)O�G�f�J[���ӳuЯ�H-�~�8��ˇm�_���YI���E^@�<`���6X��S�Epj(fl�N��㐃��1L*�<��1�{q����C�	HLvSY�)�0�b�lE��vE#έ��-@���U�}V_-ۘ�-�[�S�aۈc-�uw�q��@# �!d�R�� �o���� ���,E}=$�vu�� �J+����b,��?U�������|b��L�m�f;�6��6���k��Lgx� �Z'��T�a�lg�n5�;7�)w�����5�#��4���M���-F�m4��:t���x.;G������^M:���J�t�����z�p��C�+IQ��>�=W����u�5���\gRQZc\�jO����\���:;Ï{�΂��-�X�l!6����ϟ�O��O��O��O��O��O��O��O��O��O�𤥑���'mx҆'mx҆'mx҆'mx҆'mx�cbx҆'mx҆'mx҆'mx҆'�O���`O����I���I��'mx҆'mx҆'mx҆'mx҆'mx҆'mx҆'mx҆'mx҆'mx҆'mx҆'mx҆'���I7�*O��O��O����'mx��'���EB� ��
��P[�.oƵm�M�	�rmBmټߟk��&�P[l~�mԖu����{AmEI;\�,�V4~g�m6v�Ӄ-�$~��fv��j�k+������h�kk	~M�\[m��ɵ�k���kk��+õ5\ۖ����t�噷�#��س�{<�X�h>t��?�\����C�v�Cg��#>3�m����ѣ�>��z>,^z����#~ܣ�`9?99_�pᢊ�>�;8�Nl��?>���ִg=���%��q��>�߃}�     z�ǧ����n=V�!|������o},���/<[���֟����
��gbk��	|~�y�K�zŧ����7��xE��ۄ�+��#�_�����]�sk�����y��>;�>�d޴��팋[ŕ�~����m�ɴ�;�VW��p ��'�y��h��.��]Ak���b��	p��!��~=f�3�lw�ٮ�m�e[��&B�xl7�X�#ll��X�c3��Yޭ�ۨՔ�.��]���vGv��*��3]�&.�m򻠶v�l����*G�,��"kw8�.X�݂X�e7֎�]�W��;�����]�U3{�S�j���N��S�Ǧޝ�*��oI���	�
������|F�Z?�rO;��J��\�OӴ��i�P ��Ӭ��K�mO�&����r�a!�T��(�� F�g�������C����@��R@h�SP@�G�6�f�MPH:�|6"|�z�&y��������ze������	�3��Yg���l���~3�G�YՌ�ƀ�T�bڠh�{wTf��.x��0�0KϘF�˼�PX���Y�%?�Od8��7�'�ܦ�� �(�'�'�@Of,�"�Ow�K���,�!V��d'@��i�{�$u�<:fD*��� �P ˄ߗ�O,t�d|�~9��+nc7�F=Q�=bc��NX��;�4V!�Ĭc� �V7�b�b�Y�A+�Gg�S9�B'��h�ݠ;�$v I숐�Qg#�-T2�
h����U�a���o�%ܰ+�!+��X�ʱ��t��.l.ܛ[(�Rh���j`a>I� &�r�ҫ�%�`�|�.��4����r�
6`
v�&X��I��Ѐj��;bv�S �1+�V��;&L�v�~Vw<�n`~��H�i㗛Z�.�-�.�|] �:��u�������kF��IQ��^�,�.@zE�0�E؃�x� ���U��2Н6H���> ֮�]'@��hv���R�C.�e(��u
�K;��"�u���!�@.6l��%"�>\&�8\�d���p�	'�b�u~�����p�[F�,U�K@K!mM	m� �Z��I�s$#��kl� ��k�����[�L����S,M��<��>n���>�K�Y�N�g��gJ�/u�6+�YP�|_2��n�e|��.+��oX�'�NVG&Ku�Fon?vw����� cY۳E���Z��r#,N +����^]����z�kL�.�^mѼp���z���ڇv�g��E�DJ���⌀Xr���D�.���cg��͝�|0뻓���	�+�$��^��.�d|�=Vg(���v�n��Ks��#�{�+z�Gi�h:w����ǓG���oV�Eh�#fje�g���r��!,="' 
���U�P!�fX}���y�Dy	�fͫ����/V��`|�\'0"?�`��{�Q�G��|%�����(��J�t�\�m��0y�A�0¦V���VU1BL\��>E,�m$VN�\ޝ%����b�q�2j0c	�Yӛ����j����C�ą\msȘ��	�L\]F#;�E��$����j�f��m&�����ĥ]�hW�9���.�VBKNx�4k]P�$�]��)M^�p(� )�〈��PluEq],�\���_�/b��&u�N(k���Ak�bi��&d_�Z���\�+�&���XRwc�9��cS'a-��n�ʢڨǭ���B���m����l�^o�:��v�Q7�6e<�NoÖ;���@�,���nb+~@�I��	oͶ4=�K��4RT�_��7>
�G�	a�[n�z�Yp5+淨���[�ĉuZ'őv_���.* r���&GN]��2JN��K�Z��IF劐r�x;v�N���C��pK�@��n���]�]ۅ�����v�jnW����k��K��Oa��Ko�J���xM�-Ҷ�y|G��.</{�q%?���IbD�M�I���z�4��5�s��'������u���-���hL��n��̗\F�:����z>_�q�r�H����J�O������:�O�Wi�F�Z�����&x�F�㱐"��俦�@kP����xR�@r$�	5����]l�P��8T�Aa���d[)�,�[[�mr
JSr��B�Ợ��`؜`�GG���Π"�Ow��|�m!�4��)�$�;�%��P�H۸C^�E4e/���ZHonwl�Z�͝�
�(��:rb�r�KO���ad3���Hk�(�*[�1Ҟi�(��m3�e�����]��MXg�UfJ���o��(�+��٬��(���� �p�H�(�*�C|�Y���.p��&�:2�Z�BrVw�\H�$�2RC�tH)��D�tS���C�1;RxJ��G���A��%�A$�Ra��K�:DLb�Q&ech��j-P�am0(i/�c(��P&^�R�,J�U�(8'���é����_��2����R�wȷ�]ۈK�z�a.��\���e�%��	�D{�#�R$䡗�:��U$�p�P��f����c3�3?Mάuu��kpT�n��M�h]�6�}�.rS[�Q7�.�"x󠕡��7N�N��Z�u���6���㖠�rב�	��ck�Н�� ��d��x���>KΧ�?�g�3槚����!��C�;���TP�D
���a������h�
�2�h�pm�2*�[�����2kT��m�FY:�['�V-���;%Ve��P�a��x�(�y*U�֩�$+~�
|�r���>UFu�Ӻ)O�'�f�J[���ӳu>��H-#R�8쌒ʇm�T��J�YI�1TE^@�U���6IU���TE�pj(�j�N��㐃��J*�<���{�Y���#��	HLvSY�)���V�l����vqͭ��`)�Uף��]~�B���g|�wy���T�@[�X6�;��b��#dY7�"+2HjA���^`V4�:c6�[ZI�>=�$����V-ChyI�8�M���O+�_ˈZՔ�F]/��f�`+�wc�6x5iз���r��-��:��c9�(I����&(C�r�H�]�?��̈́�[c��jO�����
#��nv�����2�Wn�vQ���`o�?:2\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\[õ�F�*�6\[õ5\[õ5\[õ5\[õ5\[õ-õ5\[õ5\[õ5\[õ5\�|
��c���k[ 8��pm��7\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\[õ5\۟׶�Ui���kk���kk���k���0\[õݏk+��L�R�����z_ð)]�rzd�K+�]���,��0Y�V�AE�uQOD�O)��yr9F�5�B�#v��494�GV�G��43�T^P�Il(�$�u��\]|0_��&Q
�=4����۰�3f ��z1|M*#92]q B�'��௲>5l�7�2��]��W�jqU4������;���-
_��D���ݖ��	�'
,M�PQA��a-�@�i���Q�f�����%�X=�8�u6��yLĆ�O)�8�.��{n�(�O���t�7�r���cuo:?2�1զ?`�+rv��~�u�S9[7��ó��TC�1�F��=���lx�A��*]
�>��M�jx���l�V��g�G�N�+S��;���b�|ݝ�͞�TV`[�lM�bx6�-�����ur�����Rk1�lC�N��r�o�ن�}(9{�^�B�<�s�h;{v<p���e;�3w��=����``�!���t����'��?���`���<���_R��O��G�;x�I�[��e���|��5�f؉����t:>z��#���ܱ�Q�L�����������ߠÙ4R��K�~pX�F�C^��uq 9K�����<Z�W-<�v���e��%��ŷ^�.��n�=>ÕD�̙֡ћ��d��ol�������k�Y�5�J���1w��c���8���~�LM��z&��h􈟍c������5�Y��x�?2j�z�Rfd=���Ҷ    ?���P����-
똾^�l�_o��`K�R�5����S�j���?�4~�5jgW�TR�!�W������2�sP�@�?ן|V���gD��0ˤx<�&�聈-�_.ή��j�]�����%z����+0Fb��i�_矸������Jq����S5��v�+��F[>��x`�X�gp��7�����}{h�6��e�{!�0���#௃��7��e��)�������
���@���k_��"Z�L||gY�=o������K4�w�g��@�8ہ�#^o�=S�����������ky��g��B�P�OJ�)���WQ�����T>���ǖ4�LGtqA�:��}ם:�)��6��)E�r��xĤ���ƻ�>/}Ф��}0N�3��ݖz�
�N;�h�
wUSo0w�g����ճJ:;f�<���F�(�(��oe��\U�F����d:��\��^s
<��܅�8l��/ErtK/j�o��f��)b�d�+:��l�>��On��t%�>��3�&��*�}�v�{�3o��a)���n��38���`ß)A��2K��ۅ[j�P��T�Y�°�h�hQ�-�2�w@�I�u�3���c{�����|�����p.=�$���u��y���n�?j�w�܀,:F�z���a�����v�/����J��?��3N�������=/��؋0M�_�>��O��M}=�Hw�8c|�Й���p�أQ��3ͺz�5p/E���Jrey2�!&RE,g�."5'74��#�"�aXg��=����_�61��}���r[_ax���	�d��3��?�a�g�S�����^��3̓
�l�BF�r|��8�KR��F�l�M�n�e�O�9�Ϟ̘������ґ0h�߳��o"r�?�����D��^A�h_�4�8��.��J͂�T�������^≦}K��*g�Ӟ$�X�p��P��5��,����7�"
�Ӿ;�b�+l.����")�����#��	�Ƭ�����[���(�ѳƉ���>S�~UC��X�ա�c�E��S0o��SJv�+P_����@���<rzkm��y+�+�f	���Q��8=�o����+��*K�^�����H����Ez��J���nȀh�Ȼ=o�(O�إ�4f�m�05���%5w���?����X���o8���7��c��ʗۛU�7:���o��I6 ���dDZ��۶��yA�7a�6��'2�"Z]�����؞�Y)�5��M�_I^P/CD� �Kz�y�"Ϲm�]綝�������x�Z�P�Dqډnʽ�=�\�x���q�SA�~��8���ti��@�{v�R>���ט��%U�:�B���h�ھk�q��:-�w��t����F����������C��S_�x�\b� �A|��ˊ�D2�^&�e�i�[*]f��b4�g����]����>�(�l�Q�:��O���;}v�"����e|&�U͜��w��(�Z�w��V|(�v��q/�@{�}���د����Gp�Ϊ�dg�Z;􇍍d�Ӝ9|-��Jk�i�Nk,���nۃjkX(�a�@Lс�v���:�p7o�[��T�{��I�ҁ�u���k]��u!>��z�3��jCR������������9���S�$.�"iGR��������c�,��K6Fv�;�Z�ِ �bh���Mͻ�Q���K��#�؏�9�>��]i�A��A�� �9��m�>To`���`F�����1ͫ�Kl|a���g������gb�i':�'��7|"ȣ z�7>:�u)�[��g>����È>7�X0H8���Z�ލ��w���ǭ&N����u� M8�o�o���ү���"�å�lo��{i��)�&��Ȋq�O��5�\�R��u�Τ�܁pgF9�o����>�>���J�����ٝ�?���)��}Dhl���k���u3���d�>+��rq߂#D�����N�3׶g{������8�J�8�\gnP��Hdqڶ�p��p<��5��0�{��G��Az8d�g��p8՚As׆���f4�{2�Fs0�����p7�a
�:��|4�fg4a?Me�b�K���7*H)WO�\?����l�F1���_>��5���_��r���k��ݷ "���� �ch5��;�;�������\�QJ�V�SYʴ��x(��aUމ��r����;�~�1m.o��4����?�:�2�U��0���~�˧=��������k���ز���׿� ��g���2sdr<�;�|�D:s��]|��ܑ.��,��q2|m��3�'}W�L6�t�^u6
�ײl����;��v�F�l5��L:NѦ�6�nO��Q�<J`[��3�ش��gL�8b��F�ll|�ǋf�ܟDS�K01#$��@9J��K�}��_#�ﵑK���D�!�V�dY<��/�i�����O�*���a,��3��H�ደ�5���1�H)kN�yB�����ky��H��S��6)/1�}{���)-�B8ÞI��;N�~���N��E�0�f}{:��єT�ɤ�٭%$���X�م��ҷ������d�ȳkdr��m,�6���6������G�l� #��I*ՠ-ВQkl�`�:hF�@;罷iy[%����ٴ�UT`l�{l˂	9���`2���;C�_wV�����[��\��I���sƉ-��3�HG��hlWȨz�����>O>�i�ځ�ύ}�І����>7�������j?@�\�;�uݩ����n�����N���d.5;�ː<Ɖ�$K��~�}l�>c~���q����j�ΘN�A2��bP������������ݚ	�V�J^뚱�/����0�n~�CV���<m��ⵞ�z���˧=����6|#Ս�|�%^�������C�A��n7x'��C�:���?,�B\���=�x[9*TA��oPeY�[cr3�v]8$D����N+O^K����t�؛7���{x�
���C�n`�;d�Z|Ik�����cc�uq���q�409�n�R�	����S��R݆W� Av��lJ]����)l���bG�t���1l��`?���FO�N˞e����ӹG�;s�i�c�&�ƸڱQ�C
�;��N��10�M:�r�q���h:-�rp�&�Q��C�
g8^����x9��/��r/ǽ�r��:���Cv^�-J/���'��hmx�f`4������?��;=�"Й��i��̵�IE��J����&m�S�t<�R�L6�tj�\ڢ)�{��z���;��+�4t�]y��\F�� �K���b��WЏ���K����3�'��7&�1����ߘ���&r�67��Q0@uޝ��;v�*�~��q?,7��2����a����F.f$΄M}�+`X�
aң���n�+@���Gt{VsG�iQƣ�@��y�_,�mD�|Y����D)��̇�;ﱇ6�
	�@�\	����n�7.�?X1�j�&�Y�<�u��k�_[��M��� �t{l�t��a��`�;���G{4�����c2���x���Iy{�t�N��<b���d�uM.�&z�%�>��@���0z��m�Cc~߻�5�1���}_�oy����V�����Jέ1�?U�[S>���݅�1����L��-��]{���g��Fn�a��ڡq�������8:L~h�<m��[�j�fSɜwL^��ҍ��І�X��J7V�=���hm~S���ҹ���(e�Wf�.Ч��`���Zug�d�@���|�&�@uu��L��;� ���ӡ�_i2����vsu��?�gD�{F��Ng�����1���6��3b<#�3r�<#t��g�;?t�)ψ�����v�8@��ð��\i�Ό��&?�t��?̇��p<����x���k��vSPW>��#x��Й��F�_5Tb[�c�gҶ6�����mx�mmlkc[��Z����U���K�]s��2�@��Vց
���u��>�'�$�-y ��Ѭ�:�ٸ�    :d�0�S���n/J't�p��q���pB]���ԗ;�h��#�pp��@��`mx���8���9�hu$�@u��R��������������-m�"F6��'��=���wJ�;�! �a$|> 0 ���A�FCמU��[(3��y:��6@ct����1���m��{ct���A�U�v�-�V G�ݣ��XR�����"�@���>�����؞~:�|z�!(���=ĸ�ף�ջ���3�ՠ6��s�I�k�꫹u��g˔-Sm��I����kWP����j�T'��_���e��,��������/����3��>��t��3_Ny⻶F�ă����IlL�6��$6&�1��I,��ك4�e�'cG7������#G ����Į� f6qW�?�6c�Aw c̙�������C�r<k����+��qO����o`��0����x�\۵����r��M*�=c}:����t�ge�'/Bw��1��Y��I�=Ș��;�f��	�ضթF�Ħ�\f�MC�R�cY��ޠ�Ua�����v�` �Q)+��������V�&I �������c�����.(��x�F�� �8�Oǋ��Ի��)��^�����?K�h<�{zѨ�5^���"M�Al��"=\��w^g\t��@Ӱ{�C%�x	��w�?R��BĊ��7��_�LCS.��I~�`8���C�wZ��-�0�o�]��g=���/^I�Ϡqؤ[ܣ�֓%GɀSa�&��W�FiFF�ĵ@j��W��j��}�w}~�Ϣ��焷?�ͶyR�|���;�*��|�D����Udy��̡�Ng���a���Q��T� �-�h��˴��Ǝ;e�E�[��m��݊jĝ�T��Ҹ�[��q+��q+�#�"���Ev���U�M%�r���`R�*x�_��,���?B3	�.�x���+���6�?.2 �����#�rO��i�a|<v�F8���zF��3;��1�� ��|8�φ�R���k�=��\����0Ba���+�T)������e��2�yl%�c*Kl^l<K��l�����iv���ƪ%X��-�@����mbA`��lh!�כ����39C�An0ط��7`����g���a�Q1£�g�OS<��l�t㠝�o��V�W�^�o�к��)"��s���	�	X�þ�c+>��#!q��ou�āR�|�YL�9K@�aC��XZR`#�������͏����ID��Ձ�v������� a��lG��Q��eW{4����S��У��3����x4}X)[|���
ߊ���#Y��a�ߊ�<��5��[1��{�[�����V���,�[V�JM�CϿ�*FS6Ar|��>�mÁ�~����f#�?����ԋ�:�Z��F�gXK��kw�lEm�Ʈ��f�؊�V|h�klEc+[��؊�h}�wF�λ�ԽC�Z3hn$��mFs�'�k4�9��hmhC����e�w��J^�7���=��#��婫'e��Sv�����<���h#�N�lg��Iq���T�:N�{C#�m��7+�*��?�>0�{WUp���_���_�ڜ���zT?��*��`V4�����<~�ĳY8O�� »PDA�@�VP%��<�y�s�ͤa�W+�0'v~�:�^���#'c	�o�����'�1��v��߬��:?rX���nڗ��8�N�:��Mֻ����9wݪ�'�/Ɏ��q�H���߬�I�R/��x��I���)Qj�50��ЍtO��@� 2��0�$*d$R�@YJ����7��W�Gi^Rea�=��F>�����M�A�J�2}$,�so��`�����$暆$���K<�V����0�&�����(�:�W,��`:a=�8#���
��[�Jz����؞�Ƌ�zK��lB��?G��Ƴ��&��6V���&�D��ӛS���q�':���)&Xkh��g���D}l�9߉���бo-���w�(h���؅G�cY��s�}/�#��g�h��&X�נp�~��Q����oN*f��	�K<�
z[ �[=Pr����/��蘷�}wpeх=1զp7�������(��4�����8�ɂ���<��g��:6趼xxK:�Czi�:�Y3�*��a@�� T$L�Z����W�2�N9=NL��W�Ħk���������z�����`Æ#4�
s��R�U�U�<��ɿ����U���ñ[xkZM1XiA�S�	x����&��ҏ���1w߱4zɦmi�b���mk�b���meǒP�6m;;V�G�M�֎M �@hqǊ��˸�����X�ީM{�vl��n:�����:��� IN�u�-�
o[ŷ���u��Ӕ��h��n8(s�������c36�`{h�kl��fl���&��ul���&_i�uۨ��mz �/��S�[���0���E�sԊ_�ZqAh���*���P��·�ܙ�/��U�^}ZV�iL�p��?�8�Dt�\y`�~'�v�~+'	��Ex'oC�{P�4��{�N���5�:�B�!؍7	�i?�:�wt�UX�мj��u�� i�����]�>Du��Tg��L�j2��m�?���`TShh�i��o��7���7ƾ1�ϧ������ؗ�d��ƾV�X��#'&�����6��`��lC�L|!�������M��s�Y��H��-Xy��tW^|��.�"+{�M�&���)�,ޝ�=�xj
8�F�r/�3�_�~��b�2���`:��a2a��
��30�.��s�&���,�G���i�ɇg`&x�"�ⱚ]�����&��o!{H���q2������a{�ؖ���?Ѧ�?�#��tp���Gx�[��q��-����
b<��,����E�K�<��������@3�#Fg��|e|hJ�AZ.���|0�����'ZE���B{ӝM�3��^Dx�������������и�V�����n�/�� ���Y���_S��J�A��J!���A�+@��)��=I�u����&𞲍�?�,>��u��r�����8l	���ׁ�~��	|\�J�J��ބoN_ZO�~yݔ}�_��	n�܈3�e]�H5=���
ɕ"�3�9��]��gs�%H��l-Y�]���1�g�{y���>����=q�(�&��p�hws����E{;w?���2 ��!v������7�Ifc�o^}=f�Y���^�5�~1�ƍ;���d���O8	��@l�ћ`C�w-7�FoN�?a�P���[/���DK�IN@/�3#5#��Sך�T���i\�<9�%�x�)̂�����Co�;`�\���C3W�4"8�-�"�9 al=��d����aFH�ǣ0�УJ-��9���Ҹ�RN�$���;�D#1�7$@�4ē�5e/J����	\����(�������F�/�������Ƣ�����цk�\1��a�h�k�`��?����� '�<���$d1p��	�[!������[�dlx�N�&ȝ\l�à�D�!=���v�?XW��M�RQ�x�VD��q�P��m-�YO�D�)��YT���Č��K�,��W7���ʮI9�}й�P�<%^��������}��>�ݛ���Z��9_����ջ�YʛyP������*���N��e���Fb2�'�=�u�:�d�zmi��b��K��]+7Tj=�[�]B��N��_.h�3Ϻ���޼y|�ݮ�'' ���$�/�-��b{?&���#�����>;�V�P�+<��]��_f�&H���i�0]Rz�ɂԭ"T��KXm!���.7�n�m�f�άq�=�{&X��������G)²��R0	#<c/�Yp���6b�\�'���E�:yPک�$١9w�I(��4��?�\��k��y������s��;Ӂ�L�*&1B)��
��������    �Ζ�����͆��훑�p'�$6ܡ1�ͷoO�t9c�,j�_�(Ѿ���ٻ0��0g�P�I�]*W�.nM76�U�L��v��Mz��M[�e�NW��e͝d�ZN�n�]ٞU����Ѻ�,^�}�YV}�mB�N=��ţђu��5����=z��p��Mql7m��H�+��L����R皧��ul�{����6�kf�9�X��lʠ׏�;�����3�^����w��jv+�Q<��i��v[U6] ��B�{�(�F�4ʦQ6��i�͏�l�@\���'�L�Q!�5��uG�:rM	��
7Y�lxMV��
7Y�&+���pg :E��ٕ�������\�p4����os��?�O���xd�<)묉Y�o�|!�Y�GLڈj�9�j�{�4�h�\��� ��n�|�}9�`O�}�'A#�0��y����� ����.�M�ɍ��9��#5�6ڙ3;7TEcCb~t�ǥ�q��N������V*�>����w��r��Kӏ"�Dx�Y)�?�4��*]Z�N���đ�D�N��h	�I�h�b�ג^E1YKj�R����2�O|	�=�����e�������&X�}����_�}��7��%���=�l>�����?��`PY��3��xfS'�xq�r�6��(��,��d�4]\P���n���m����>f��Q�t��I�#�F#� ��e��ڝ�]y�e�o�b띝�[�`=^�̰���'z������Nw�`��Ͼxy����Azn��U�^�[�p�1ж�����@\�ǚ$��+��/��m����}���n�;��?� ��<������������c.�%����xro�х���'F�ͪ��/�.�h˿��}6���"M}��-�],3�f;X��z���*Zr�U�|�`tS�����/��.���i�yJ��Ejx�ӣap�[ɣ�
ǭ���?���ͯ�9��Ԃ}󛗿��׷����C��/�~�������~���k�����~�ͫ߼��~��������w_�r��U)�M��|��r	,5� q��U��[ƤN���ߞ�G����~$�Q�2�Tj�wXY#ϩw�Ov\^�{��Q,mLU�HF�U|�x�[�����X0�Uuhڀ�W�p螢{"r��!l-��_���D���W�r����(�I��xzI�[�<l��� ��J	]���΁h� wм����қ7[�'��!g��]�?���p�Fu����?�9}O[Ϲ�HME�����/�6-}�O�F�^��j�UԵ�D�8��V4���
�j.�i�S��o��>u�f��0C���z�����D�=�`�N1̢���R[

u��B��(��n��j��f����3X�w㪳�U��LZ0��^Vp�z��s&�A2�'S���}D�we/8*�H�R����}�����T�d歇әT��&��ceq~ry�&S�d*�LŇ��8J2�cS|׆�ΐabB�&9��C?f�b����4���T���ƗC��ˡ�����D*&��t0��Cۍ.�VUlw��6�lY��Z��)�&�0K�AI&[�nDs1s�3g-I4����Eq�X�2WiH�`�]��C�8�-�Vd�Ssʖ�Vԏr5�ҳ�a4~���������Ӿ�Ovx9�Dv�u�\}.+�������EI6t��/8!�_i7�.<���`���  ��-�K/x�t�WjC�n@=�jp->�-�/��2{��F���]����v[p�sC����/6K���]m۲'E�O�����B({���3��j�^�x������`���>7ƶ��;]:[t�أў�κ��N�����`���.n�M��j�{�B�`5�1X��j0�+��ѧe����m�R��`u4X�,M`
���NGy��id�Vکk]mMȷ�J���Pp+a3¸yv��M�@��FD�H�:������'Ip�v�NkfI�N*Χ�c�	�n�[����_k�6�ڼ�?\�9Kf�^���+�sz���������=lɶ�	ϫ]bE��1:�,D���ߘ4�9D���>����^2���+т,���z�\T,�}l��������j��N��b䇬s��N|܎`F��5-���$H���k�^����?}Zp ���=L����؎���$�E$'Oܱ��2���bĞړN��� � ��/dc�� ��|��"f��{�L\� �5H�,�:J��Y�w4*:�(һ:I�S4�s�Q�}mϊ��9ݤ�
���S���X�:�WUY�wv;�ɻ�|�PM��|W�^y���v_��w��#���ګ��Ӽ�{a���އM�'f[�ݱ3;��+g4�W����,L�,��s���1�\��9v��j��{�B�L5f�1S*ΐO-N�: G'e���J5V��R��g��{l��㙈��9��3cQ����x��g���6�4{��dS}���4ن�d3&۽|!c��͘l��d�3�u>Q��_ζӑ�j>���f�S]����l6V���fl6c���=�7�;�3�t�f`����}mF������^c��Ɯ�[����8����{��5�H��$-/��X�O���O�������=��2���'�9����Dc��ۦah�?>���8#��^:�pL'�۟��`X�3rs<�/���֬֣���w��Q����	�Ս:�^�%^r�	)�;�8�]���(���`�w�{"�#�˝g�����Co�Y�%
�3����"�X����
��_�N�uL�r����`��u�[��S1�߽�Kޡu�H�1�!E>�X�s�i��l"�<^#!�@51�������?@v���"�	v*�����*�4�sf,1+��=ⁿ��=}��nG���C;/����*_�xwYW;X�)�EC��!�2c�J���u����_����%bO��Wt���H�nm�{t�<u'�[Z��'��(x�����a���[-#$���<�tڭ�5��ڂ��O�ȝ���Q�bR۱y�"N&y5v��b_�+��D&SF�=T���t?�V�j~E�cho7�<Ⳬ`�����xq,��:`u'�����.z�n�%�8��⫭w���w��~`r���a�mb��a�������[�o��Z��Z�)��H��>^������h���|����Gk-A�]{��m'0Ȩ�^��e��|9��(٦/Gv����7��]��9^Q�V�H4����a��%|d�]x�������=z�Q����'��lL��P�r+P� ~A�1����`�b�V�a�^��С�Ae���s!�{���R<�g�-�.�݋T�_�x}��!
����9��g�u��/���Jb�� .��~|�7h�_���؂�.�-~���#�������A�X��"�����~�ى���G�\h��_��ƅ�]��_�&�[�\l��n���@���Pz��S�K���fs<�ͱ��[|��}�ީ&Vr��V�jҪ�t{�S����r?�Ƒy���h�)��'tG�]1��-������+��];���9#[W�F�2�� MJ��)K`�I���19Q��%3�<�_]ҥ�����/y�G�hY`n�C�;˒�yۭ���_za�M}�:X׻�3^k�4�;0�3+���������`<�u��h@���!���&�[_Gq�b?���ཀྵ���2��-���U.�g�+��;�g%OLfU�8(?u���9�!E�a��w����?[n���s�_۳s�"��g0�-u|�Э���6���,ɻ|f���Hנf�ax�.O�@mt���[�K���
T��}V����Q���+E,it�e�h���������[�b_�?��ڷb�!,3� ��G[�
J�x!�QV��:�6��sX	̹���ĎMZ�O�����oQ���%�cu��%5������%/&�?�W$7)N���ʻ�@y �+�q�z���A��V�Ez�-��Y�L����V\����7�g�l�Oab ��k����D��2��9.C���أ��شA�*ȷ���]-��&	�]�\ңcF��    ����[����q�~a��[��i�Q�Z��	�z[�§V��Է~��ara����	+���4�~��?�@:��-6�QX�1���ƣb ���g�%����)�j'�f�Ek�\�/[3.�½�)��a�;ou�-��]���|X^��Sƥ��� � tf��Jp��*Z,4V��>��Z��0�����bFzM����=Vq��A��Pg��s{ԟ����N�0��(�d�k�g&�jB�&�j�G?��	���a6�	�����V4LhՄV?��6�UZ�Ъ	�����0zaB�&�jB�F8�K�dB�&�jB�&��ah��g�����B���&�H�N���y��$,�Ǝ|�
��˯;�������;�\���O6�D1>�����$T�EI�KȈr?��n\��k�T��hL��o~�2����Y��۰k��)Y��y�e��Ų(ӊ=��e�:��`U@�[DL����u��{�D��.�Wt~�o�_�������j/�\+����I�!��Lg.�-h�������
t���r�UJ�NfÂ;�r�r� \Ml��b�WL��	���&{�l�9L���^�؊��^1�+��`�����3�+&{�d���&{�d���#��p2�+&{�d���.�WD��{%�}��|��`�g�L�»��_(�.��__|��߽x��T�����2Xy�^3J�n��h�ݚ���/���6�ί���R�R	3<v�t��x>���.'%���`?	#~�#E� "���*�� �����z?U2H�w���̊n��|^�Н�RDr�8�Jqg�5���d�,�t��c��?5�z�&�ɬ/��w�d��ܦħ����:'OK�+���Z���u��;��~w�Yuk@��@��Ў4)�&Eפ�,�O=Ѥ��a6�I�5)�[�0)�&E�l��kRt{&Eפ�ݟa�I�5)�&E��{)�L��I�5)�&E��]��0�4St��9���]�a]j���Ijۛ����4�g���r�4"����7+�vR?� �<`��z�rOL��=x�*��R�c�f���ӿ��N��'Y�����oV2{.� �Ûtd�L���0!ޟc���?��a6��0�[�0�&��l��`�z&���?����a���?����`�ӽN&���?�����e��)m����o纩􇱉��Ȫ������1xd"�fs��a"�&���Y5��Ox�Md�DV{&�j"�&��3^�Ȫ���ȪN�R8�Ȫ���Ȫ��vYu����d#��vcg�
�N�*��ƕ�^Y����?�'�YAe���,&� ����֓�8���c1{t\��;ȁ���:�^`�1�L?��p���|��o@����p��5W㯾��M��	���ܭh�Izg���'R�?��?�:��o�e�J�9��7���k0Y�IM�_��z�������O;xE��I�yي�U���h�~%����I������WԨ�ϴ�'����UPΠ�|�7?����`I��Z���{Gx<Ɉ��DO��������g��ܿ&z)��7>^]r#�z�C�]��D����S�Z�!�M1�(�?�T� �]!����D�����d-�ߵ�<�9�â��*j�]޾S�a2#Lf�	����&3�l�9Lf�Ɍ�؊�Ɍ0���`����3�&3�dF���&3�dF��#��p2�&3�dF�̈N2#sD�r�~b��(��u�tf�̄VMhՄVM���=2�U�9��0�UZ�؊�	����'<�&�jB�=Z5�UZ�F/LhՄVMh��{)�LhՄVMhՄV����θ?sf�fhU��m����tPZ��an��J��A���G.��+͝7�Ԉ�ߐW��*��#ֵ�����{�����i%�_���2Xy��t�fU<��	x��������ӛ5�Wa��-����ǥ�$�����㢖�v�"MQ�v[�����'m78k��?�
��0�m
wTYa^��Շ*w>�j[CI���<��m{�l�Ng�;�m�IM�=n�=��2�+�_�)N���e&�#�*�CJ�^Yi�qm��ݚ�ݭ�}{6�����3N�N��H��S[+Uop'����@I���F��l��z#~��aP�|�E���Н���F���:����06�q+��d>���9�אmE��}�sz
��'�c�1�:'���Ã�����m<]i-+Ex>v����sZL����A1�iR1'�p6��C�+��D��?�ZԨZ�j�o���e5˨Y?5Kn�ON�B��?�M����,�*�=�J`�	9M��9���H
����yk�Ѹ��I�7�1$H���U^��]�H�ůʴ�wݺ�+����ɴ௖g�em����p$g�ved0�B�e��ǧe��=L��=̝i0���D2�苞�E�|Qǃ�#[J$Yb$��Н�F���~0.H��Z+����il�`��O������������x��b����^h�&_�fɃ��nd�?�C�.�&��@����H7��'7�My�Oަ0�%������� �S���U�fM�7�:��H��iq*����u^�S~v����V�(���f�
Z��~���Z\K�����w,|�ǋ��.}�@��=�m�D��;�>��;�@jIi Ei� ���,_�YZF��8RiX�K��K��@,ɼ\��g���d�(-�ּ�$Ԅ��"�>8���̄�(7Z�p�/���Df�ְ�Q�5��8/�r����̚��̚�)G�BFDy"&�i��^~|��E�9R��'�|4�O���@��/���n0pk���b�b�&X�����kX�aeV�bV���6P��o�Z��6����
�&z䞩��$�Y%Yn�Gm˲�q8��*� ���\��cvލzћ�]o�O�K��L$^L`,UQ7����D�}��s����o�����[~`ε���.v�)��e4��ܛQF䅹��}�\W΅D!����o`5��]3��9�)��<ղ��b��� �9J������Wʰ�h�����	~$f�1���9��d������3�G��
$�5r���}�s������񋟾�Kz�����s����ϴw���/V��/��j���ӷ�~|�F�x�����[���7_�����?8�|���짯�3���R�ah��R���j������ӷ��t���2�ʨ+�XoT[����V� \� ������M�Q��!C(�4b��� Q�ɸ���L�y�mۖ1֌��qoTmh�2��s4d��r)�Q$�H6p$.x���E+,6܍��"��c�?�at='^p=��E�� W�ö4�4
r�(��V��.xo� )kl���6p�_d����k�0�Ɋq��TD��7(�Q$�H6\$�.�+\k��ნ}�#ʹ���n�VD�� W��5��c��(�Q�� �/�	��pM�O,u�Z����׊��'�p��Z"Yu�&�~�ܕ�$du_��H��0�{���ÕDy.5���D�2����(]���C�q����Y��Pu����d*w�T�?׷Ҟ��(�����_�w�-g7�y�٩w���gM�Ӗw+QIՊ
b׷���
�*�~�B���_2� }��wf�ZU�c�w����[����E�JrO�g�g!��ҋ��5J�b�Դ�԰,M#�N��&`<�3��υ��G�X��㆟�8;�
h��^b3���6�{d)�؛Q�զ5��_@_�aY���9�Ͽ��_��7��"��>~��д�[�j�-Ǳ������z�c�eY���c��;���p%F�~����jLQbL�k*1��������.89��.��k%�t�%�c����H�8O�Or�L%�%�HԒ�>�������=�F�@`ݬ4���=55kگ4" L@���0�����g^�����yAw9X�����"��F�8��F(��TR9�2b9��"K��XD��!���lRQ8pQ�3�M��񉡍,՘��UD`���=rC*��zzA�	�&k����[J�J�1�������[�T2R    �H%cO����n�r�ɒQܙf���Q��F�T2Rɸ�+F���,EF޶d�k-�mW�O�քJF�����Ih|kB�^VK&�c}W)�d�]##��)�]����z������Ӆ�m�x��2��:��w;�-�Q�Q�F��ݬ��2�n]�ᇌNpr�6՞�!WB�w����������ʢ����ߘ�~~Ǥ��"JZg�#�m���u����΢:��2r��-ww��u�V��؞�꬝7��:���Y�J���?�~`=�Q��Wȭ�#۶�v�T[P�w@����[��luy�5R� j��*w45Ү��P�D5�H��p�ۭ�\&�Ԫ�H�o*ҏ_W+�F�x%>$_�p����@n?�,8��/J^%|�$��4	���`(��u��Av���� Z��፤qV�Bg���t�UwBf�h���H:g&&%�?K�%���]8�E��%�9�o0��/^�Fq�tV�u��[E'�9a��
5O��8A�4s<����M 3��D!�(���3H0.�H9ń��"�˔K/���
)�o�%p �<��G ��ƃ���	� ��<u�@R��[v� K��!T]zɑ��W�3,��"�S�l�)w/`:���N���ޜ����E���3?f#\	W`c���!�A�8�{a���}"j��|�S�
 �)n6O�v�<���`~����� �!&đ%0�G��Ë��������%���ࡃk⤲��X� J���>'}�bV�c�V�>��O �(�lQ.|��Ǐ�8��ba��3�c�a�9����W�Ë��Cp�_@Fq���㥣��=�9�9�s��j�)$iM��pYMt֒��7f5<��(����^1>�h�}�@C,�6�ӎ!{��f�{����r�&{��n�8;��_��6�A��� q�#𦔢 �ĦbLmݬ��~]��Tٝ��p�R��
�Mڹ-"WRn`'p��r�������A�s�ʥ��l9����,K�8����yV��V�Իj��3�+ U0��� [^������u��?��)U�����Z�L!�'Q಑��l�l�#k�\U�tև�Y71���؉,6,� p�Q�{����9ۜG<�Ogs�,���{���[p
�r��e �l����N�GS3��2�0��`�
���K��q� ��{
��G`�V�� ��X1�eH��oJ�c%���0��Z'��}{Wx��H�}�9bW�J Z`fE����	N|��r��FMh�1f�(����	�Ѭ��x�����U��K*^�@>�����0,�����[nL?��EX�U��>�p.�ϥ��x~	�����k5QQ��m�h$6�t��j����up9��w���u>��]@^�0���/4�`K(瘱aYx������gn�Ղ�;���7\@�ǚ\8�M͕#:��9��K��m�l��Pps��Rɼ�=xţ{�C��Id�E^ ���po�
,l�0L�p\tG�	��x ��*/�1XA��m�Y�d	`� �ٷ$������:���@��َy1��q�A�s*��Μ�"[fpo�z�n���~�BwV��*ы@�[�����T�[���o�P��hU�X��&�i�U�WU�@�Zǚ�F�O�)�����hUީ~�k'�5� ���Ҫ�N�j�N�&��M��U6~%�U���0��8�q!�0̣B�ʟi��B9���^�X�b���� x��fn�z��Ɗ}��W��sb�e���n�z�ͫ�bV�A��4��L���#���s~g�o�˿t.�	D�� ���C����󐜮U����F�*�-���UR9��V���J��t���Zy<�K/��YQ�V=�hc�$��Y�X�v~[�q�9���x����׀2mS���{�:�ЇL�W����	&*�C!��H�Ę����hy�>�ۆD⇮� Ό����T�:H�1I@ɑ�,�,eq�3��[p���,׫uT�S����(���X�,���|�TNN�0��#�%���D�W�B��c%��؇��M$���x ��B��Unz�(Ϝ��Ꮃ{UV~�${Ba��7���Rrw?C����+o�
�?�}�'\��zD6�h5#�C���.l4x���"�!{��*DA�Z����,f8i�����(���ei��U��l��xKHSI�B���1��$Q!� � �
IT>4� �
ITx�I�B�#���D�$*!L���D��ӝN$Q!�
ITH��O�JN=�)QwC�JT4�̈Z%j��Ub��="j������U�V?4� j����l�V�Z="j��U�V?B���U�V�Z��t'�Q�D��J��^�U]}���t�<������Uw�wW�V]ӻ���z��o���cus[��c_7x��j��nF׻����M���C�������O�=Qm�ǻ���tclLM[�����*��c�u|5�ϿW��-�-�,����O�܉c/]��%�.;QI��7�w�]|�=�&O[���\����s/D#�?-"@`K?d~�/������I6��4|%�o��� ������Ͽz�3�.��5�Q;A��!{V��~���	���x�b�y��tA�/+�j���LS[׬���ߡ__~[��;�	=H�AB�?F.����$� �Ǉ$� ��O6	=H�qDBz���#�RI�ABzPp�����$� �	=�)�ȩ��a
=��M4�&�0?���w`ǟ�י��Q)�x��v��'$����ԙA�������h�g�r�H��:��R�wX��=��V�X���2�>m��X�ި��:Qu�_�����c��|kzF�����v��%�D$s���b8p�s�	����h��xu��9K�6����]���d�����'�4x�^���j9����]���+,�f�9����������+���v���������m�Ä�B�����T���b(,���>�x�a�o��1��_=�Il�p;K$cb��2a��K��p��䝴�� [;�v|��}�\�	��AJ�|$gX��f�e�#6�Q��yz�PX�y?�ģ��y�D�݅�LVܿ�X#��L]Qm�e���a�ǹ��,Su�����@ޢ�@�P �~���Z�|��Rթ�|X=Ӥ�Z�HD�jqb�n�5�N��0��"�Ų"���ֵlFW3pw�R[�Xޢ,x���f�X���9.�h^/�����92��M�{-0��f�"������;�|v��'�{��F�Qt���ï�\�_�(�ʣ��_��o��<y,` x��|�/ZQ��O�t5�n�W8�� x��F�s슻\1�R����"����r�1G��C�K�C��1Us��%1�m� az���#>x�C����%��O �ÃA�a��Z�C��E��֍Ч�nubnA�/k��4�o!h8u������>Q���v��O`,�TM�G�Ҭו�FK��Yjth�c�&�~%�+�_I��1
�H�J�A�A�WR�~h�A�WR��d���ԯG�~%�+�_?B��_I�J�W
Nw28���ԯ�~%�+�_�T������F�iY9���|W���dLg�h9�y�㏙���O����G�x�4�B�>IZ��Ga �hx���?0�h:C~�+���g��Ѯ�D	�K�q����ě�!�'�q��N�.�w�Ƀ�x��i��.�!���	"��VGt���O�MwPE��N!���"a��DR�$�܅O�$�N}�e���d�V�#8��|������B���p%5�9�5k�6�Վ��Aw�#�%�%��{"��s�!A ��9$�mB�nC�y��s���;��6��[�T�֥&��N� �?�tc�6M�p�	3%��:��m]6���N�\V�
$[�+]�5�	g	�̧U�6���p�y�1��Um<3��e�/cuqV� v7�Y��:b�*�{�(i\�M�t?�9�LF�8���n&)mu�Ѝ���r�yζ���������
�-�ؠ]� a�C2B�� �  ֤PV������ֶ`t��i̖l'J��oHmⅰ�5��̘=�$d��v���c�����3�$�o;��b������)$lH�E��J�4�h�e/V�uښ��GL{Q���M���N����{)��^������-Y���c��PJo|V��!�|N7<�k���O�:Y�m@�� �ñ��=7Y�F��ڵ�����>ݥt�3���䶞���Yu��g��s	�
�H\��
�O�G�w7�����p�t@�/�z�9̖U����Z��fWa��ػ��ܾ�#�m�����w�b�ú6��)#���� �I	6��Õܛ�'���\��I�oP0l�x��DwKn�5٠(�%�K�!pؠz�%ѭ��.���o�R�`e��<��[sE��6���$�"�Š�ұ�24R��L�"�t�.+�6�`�״0�t�x����v�/69PU{2a���8���O���     
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT fkdc4897cf864c4e43;
ALTER TABLE ONLY public.policy_config DROP CONSTRAINT fkdc34197cf864c4e43;
ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT fk_user_group_user;
ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5;
ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT fk_supported_locales_realm;
ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT fk_role_attribute_id;
ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT fk_resource_server_uris;
ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT fk_req_act_realm;
ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT fk_r_def_cli_scope_realm;
ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT fk_pmconfig;
ALTER TABLE ONLY public.credential DROP CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0;
ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_pcm_realm;
ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1;
ALTER TABLE ONLY public.web_origins DROP CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT fk_idpmconfig;
ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT fk_idpm_realm;
ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j;
ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j;
ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT fk_group_role_group;
ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT fk_group_attribute_group;
ALTER TABLE ONLY public.user_consent DROP CONSTRAINT fk_grntcsnt_user;
ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT fk_grntcsnt_clsc_usc;
ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8;
ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy;
ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog84sspmt;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog83sspmt;
ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog82sspmt;
ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_realm;
ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_fedprv;
ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT fk_fedmapper_cfg;
ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT fk_def_groups_realm;
ALTER TABLE ONLY public.component DROP CONSTRAINT fk_component_realm;
ALTER TABLE ONLY public.component_config DROP CONSTRAINT fk_component_config;
ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT fk_client_init_acc_realm;
ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_cli_scope_mapper;
ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT fk_cl_usr_ses_note;
ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT fk_cl_scope_rm_scope;
ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT fk_cl_scope_attr_scope;
ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l;
ALTER TABLE ONLY public.client_session DROP CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1;
ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT fk_auth_realm;
ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT fk_auth_flow_realm;
ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_realm;
ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_flow;
ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2;
ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw;
ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o;
ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c;
ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd;
ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr;
ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr;
ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT fk_5hg65lybevavkqfki3kponh9v;
ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT fk_33a8sgqw18i532811v7o2dk89;
ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8;
ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f;
ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT fk_11b7sgqw18i532811v7o2dv76;
ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT fk5edfb00ff51d3472;
ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT fk5edfb00ff51c2736;
ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT fk4129723ba992f594;
ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT fk404288b92ef007a6;
ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT fk3c47c64beacca966;
ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT fk2b4ebc52ae5c3b34;
ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT auth_status_constraint;
DROP INDEX public.idx_web_orig_client;
DROP INDEX public.idx_usr_fed_prv_realm;
DROP INDEX public.idx_usr_fed_map_realm;
DROP INDEX public.idx_usr_fed_map_fed_prv;
DROP INDEX public.idx_user_service_account;
DROP INDEX public.idx_user_role_mapping;
DROP INDEX public.idx_user_reqactions;
DROP INDEX public.idx_user_group_mapping;
DROP INDEX public.idx_user_email;
DROP INDEX public.idx_user_credential;
DROP INDEX public.idx_user_consent;
DROP INDEX public.idx_user_attribute_name;
DROP INDEX public.idx_user_attribute;
DROP INDEX public.idx_usconsent_clscope;
DROP INDEX public.idx_us_sess_id_on_cl_sess;
DROP INDEX public.idx_update_time;
DROP INDEX public.idx_scope_policy_policy;
DROP INDEX public.idx_scope_mapping_role;
DROP INDEX public.idx_role_clscope;
DROP INDEX public.idx_role_attribute;
DROP INDEX public.idx_res_srv_scope_res_srv;
DROP INDEX public.idx_res_srv_res_res_srv;
DROP INDEX public.idx_res_serv_pol_res_serv;
DROP INDEX public.idx_res_scope_scope;
DROP INDEX public.idx_res_policy_policy;
DROP INDEX public.idx_req_act_prov_realm;
DROP INDEX public.idx_redir_uri_client;
DROP INDEX public.idx_realm_supp_local_realm;
DROP INDEX public.idx_realm_master_adm_cli;
DROP INDEX public.idx_realm_evt_types_realm;
DROP INDEX public.idx_realm_evt_list_realm;
DROP INDEX public.idx_realm_def_grp_realm;
DROP INDEX public.idx_realm_clscope;
DROP INDEX public.idx_realm_attr_realm;
DROP INDEX public.idx_protocol_mapper_client;
DROP INDEX public.idx_offline_uss_preload;
DROP INDEX public.idx_offline_uss_createdon;
DROP INDEX public.idx_offline_uss_by_usersess;
DROP INDEX public.idx_offline_uss_by_user;
DROP INDEX public.idx_offline_css_preload;
DROP INDEX public.idx_keycloak_role_realm;
DROP INDEX public.idx_keycloak_role_client;
DROP INDEX public.idx_ident_prov_realm;
DROP INDEX public.idx_id_prov_mapp_realm;
DROP INDEX public.idx_group_role_mapp_group;
DROP INDEX public.idx_group_attr_group;
DROP INDEX public.idx_group_att_by_name_value;
DROP INDEX public.idx_fu_role_mapping_ru;
DROP INDEX public.idx_fu_role_mapping;
DROP INDEX public.idx_fu_required_action_ru;
DROP INDEX public.idx_fu_required_action;
DROP INDEX public.idx_fu_group_membership_ru;
DROP INDEX public.idx_fu_group_membership;
DROP INDEX public.idx_fu_credential_ru;
DROP INDEX public.idx_fu_credential;
DROP INDEX public.idx_fu_consent_ru;
DROP INDEX public.idx_fu_consent;
DROP INDEX public.idx_fu_cnsnt_ext;
DROP INDEX public.idx_fu_attribute;
DROP INDEX public.idx_fedidentity_user;
DROP INDEX public.idx_fedidentity_feduser;
DROP INDEX public.idx_event_time;
DROP INDEX public.idx_defcls_scope;
DROP INDEX public.idx_defcls_realm;
DROP INDEX public.idx_composite_child;
DROP INDEX public.idx_composite;
DROP INDEX public.idx_component_realm;
DROP INDEX public.idx_component_provider_type;
DROP INDEX public.idx_compo_config_compo;
DROP INDEX public.idx_clscope_role;
DROP INDEX public.idx_clscope_protmap;
DROP INDEX public.idx_clscope_cl;
DROP INDEX public.idx_clscope_attrs;
DROP INDEX public.idx_client_session_session;
DROP INDEX public.idx_client_init_acc_realm;
DROP INDEX public.idx_client_id;
DROP INDEX public.idx_cl_clscope;
DROP INDEX public.idx_auth_flow_realm;
DROP INDEX public.idx_auth_exec_realm_flow;
DROP INDEX public.idx_auth_exec_flow;
DROP INDEX public.idx_auth_config_realm;
DROP INDEX public.idx_assoc_pol_assoc_pol_id;
DROP INDEX public.idx_admin_event_time;
ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6;
ALTER TABLE ONLY public.realm DROP CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi;
ALTER TABLE ONLY public.user_consent DROP CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt;
ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT uk_frsrst700s9v50bu18ws5ha6;
ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt;
ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6;
ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_dykn684sl8up1crfei6eckhd7;
ALTER TABLE ONLY public.client_scope DROP CONSTRAINT uk_cli_scope;
ALTER TABLE ONLY public.client DROP CONSTRAINT uk_b71cjlbenv945rb6gcon438at;
ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33;
ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT sibling_names;
ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT res_attr_pk;
ALTER TABLE ONLY public.realm_localizations DROP CONSTRAINT realm_localizations_pkey;
ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT r_def_cli_scope_bind;
ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT pk_template_scope;
ALTER TABLE ONLY public.resource_server DROP CONSTRAINT pk_resource_server;
ALTER TABLE ONLY public.client_scope DROP CONSTRAINT pk_cli_template;
ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT pk_cl_tmpl_attr;
ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
ALTER TABLE ONLY public.web_origins DROP CONSTRAINT constraint_web_origins;
ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT constraint_usn_pk;
ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT constraint_user_group;
ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT constraint_user_attribute_pk;
ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT constraint_role_attribute_pk;
ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT constraint_resour_uris_pk;
ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT constraint_required_action;
ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT constraint_req_act_prv_pk;
ALTER TABLE ONLY public.required_action_config DROP CONSTRAINT constraint_req_act_cfg_pk;
ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT constraint_redirect_uris;
ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT constraint_pmconfig;
ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT constraint_pcm;
ALTER TABLE ONLY public.offline_user_session DROP CONSTRAINT constraint_offl_us_ses_pk2;
ALTER TABLE ONLY public.offline_client_session DROP CONSTRAINT constraint_offl_cl_ses_pk3;
ALTER TABLE ONLY public.migration_model DROP CONSTRAINT constraint_migmod;
ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT constraint_idpmconfig;
ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT constraint_idpm;
ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT constraint_group_role;
ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT constraint_group_attribute_pk;
ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT constraint_group;
ALTER TABLE ONLY public.user_consent DROP CONSTRAINT constraint_grntcsnt_pm;
ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT constraint_grntcsnt_clsc_pm;
ALTER TABLE ONLY public.fed_user_consent_cl_scope DROP CONSTRAINT constraint_fgrntcsnt_clsc_pm;
ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT constraint_fedmapperpm;
ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT constraint_fedmapper_cfg_pm;
ALTER TABLE ONLY public.user_entity DROP CONSTRAINT constraint_fb;
ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT constraint_farsrsps;
ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT constraint_farsrsp;
ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT constraint_farsrs;
ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT constraint_farsrpp;
ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT constraint_farsrpap;
ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT constraint_farsrp;
ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT constraint_farsr;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT constraint_fapmt;
ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT constraint_f9;
ALTER TABLE ONLY public.credential DROP CONSTRAINT constraint_f;
ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT constraint_e;
ALTER TABLE ONLY public.policy_config DROP CONSTRAINT constraint_dpc;
ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT constraint_d;
ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT constraint_cs_pmp_pk;
ALTER TABLE ONLY public.composite_role DROP CONSTRAINT constraint_composite_role;
ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT constraint_c;
ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT constraint_auth_status_pk;
ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT constraint_auth_pk;
ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT constraint_auth_flow_pk;
ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT constraint_auth_exec_pk;
ALTER TABLE ONLY public.authenticator_config_entry DROP CONSTRAINT constraint_auth_cfg_pk;
ALTER TABLE ONLY public.admin_event_entity DROP CONSTRAINT constraint_admin_event_entity;
ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT constraint_a;
ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT constraint_92;
ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT constraint_9;
ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT constraint_84;
ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT constraint_81;
ALTER TABLE ONLY public.client_session DROP CONSTRAINT constraint_8;
ALTER TABLE ONLY public.client DROP CONSTRAINT constraint_7;
ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT constraint_5e;
ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT constraint_5c;
ALTER TABLE ONLY public.user_session DROP CONSTRAINT constraint_57;
ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT constraint_5;
ALTER TABLE ONLY public.realm DROP CONSTRAINT constraint_4a;
ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT constraint_40;
ALTER TABLE ONLY public.event_entity DROP CONSTRAINT constraint_4;
ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT constraint_3c;
ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT constraint_2b;
ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT constr_realm_supported_locales;
ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT constr_realm_events_listeners;
ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT constr_realm_enabl_event_types;
ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT constr_realm_default_groups;
ALTER TABLE ONLY public.federated_user DROP CONSTRAINT constr_federated_user;
ALTER TABLE ONLY public.fed_user_role_mapping DROP CONSTRAINT constr_fed_user_role;
ALTER TABLE ONLY public.fed_user_group_membership DROP CONSTRAINT constr_fed_user_group;
ALTER TABLE ONLY public.fed_user_credential DROP CONSTRAINT constr_fed_user_cred_pk;
ALTER TABLE ONLY public.fed_user_consent DROP CONSTRAINT constr_fed_user_consent_pk;
ALTER TABLE ONLY public.fed_user_attribute DROP CONSTRAINT constr_fed_user_attr_pk;
ALTER TABLE ONLY public.fed_user_required_action DROP CONSTRAINT constr_fed_required_action;
ALTER TABLE ONLY public.component DROP CONSTRAINT constr_component_pk;
ALTER TABLE ONLY public.component_config DROP CONSTRAINT constr_component_config_pk;
ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT constr_cl_usr_ses_note;
ALTER TABLE ONLY public.broker_link DROP CONSTRAINT constr_broker_link_pk;
ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT con_group_id_def_groups;
ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT cnstr_client_init_acc_pk;
ALTER TABLE ONLY public.client_scope_client DROP CONSTRAINT c_cli_scope_bind;
ALTER TABLE ONLY public.client_auth_flow_bindings DROP CONSTRAINT c_cli_flow_bind;
ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2";
ALTER TABLE ONLY public.username_login_failure DROP CONSTRAINT "CONSTRAINT_17-2";
DROP TABLE public.web_origins;
DROP TABLE public.username_login_failure;
DROP TABLE public.user_session_note;
DROP TABLE public.user_session;
DROP TABLE public.user_role_mapping;
DROP TABLE public.user_required_action;
DROP TABLE public.user_group_membership;
DROP TABLE public.user_federation_provider;
DROP TABLE public.user_federation_mapper_config;
DROP TABLE public.user_federation_mapper;
DROP TABLE public.user_federation_config;
DROP TABLE public.user_entity;
DROP TABLE public.user_consent_client_scope;
DROP TABLE public.user_consent;
DROP TABLE public.user_attribute;
DROP TABLE public.scope_policy;
DROP TABLE public.scope_mapping;
DROP TABLE public.role_attribute;
DROP TABLE public.resource_uris;
DROP TABLE public.resource_server_scope;
DROP TABLE public.resource_server_resource;
DROP TABLE public.resource_server_policy;
DROP TABLE public.resource_server_perm_ticket;
DROP TABLE public.resource_server;
DROP TABLE public.resource_scope;
DROP TABLE public.resource_policy;
DROP TABLE public.resource_attribute;
DROP TABLE public.required_action_provider;
DROP TABLE public.required_action_config;
DROP TABLE public.redirect_uris;
DROP TABLE public.realm_supported_locales;
DROP TABLE public.realm_smtp_config;
DROP TABLE public.realm_required_credential;
DROP TABLE public.realm_localizations;
DROP TABLE public.realm_events_listeners;
DROP TABLE public.realm_enabled_event_types;
DROP TABLE public.realm_default_groups;
DROP TABLE public.realm_attribute;
DROP TABLE public.realm;
DROP TABLE public.protocol_mapper_config;
DROP TABLE public.protocol_mapper;
DROP TABLE public.policy_config;
DROP TABLE public.offline_user_session;
DROP TABLE public.offline_client_session;
DROP TABLE public.migration_model;
DROP TABLE public.keycloak_role;
DROP TABLE public.keycloak_group;
DROP TABLE public.idp_mapper_config;
DROP TABLE public.identity_provider_mapper;
DROP TABLE public.identity_provider_config;
DROP TABLE public.identity_provider;
DROP TABLE public.group_role_mapping;
DROP TABLE public.group_attribute;
DROP TABLE public.federated_user;
DROP TABLE public.federated_identity;
DROP TABLE public.fed_user_role_mapping;
DROP TABLE public.fed_user_required_action;
DROP TABLE public.fed_user_group_membership;
DROP TABLE public.fed_user_credential;
DROP TABLE public.fed_user_consent_cl_scope;
DROP TABLE public.fed_user_consent;
DROP TABLE public.fed_user_attribute;
DROP TABLE public.event_entity;
DROP TABLE public.default_client_scope;
DROP TABLE public.databasechangeloglock;
DROP TABLE public.databasechangelog;
DROP TABLE public.credential;
DROP TABLE public.composite_role;
DROP TABLE public.component_config;
DROP TABLE public.component;
DROP TABLE public.client_user_session_note;
DROP TABLE public.client_session_role;
DROP TABLE public.client_session_prot_mapper;
DROP TABLE public.client_session_note;
DROP TABLE public.client_session_auth_status;
DROP TABLE public.client_session;
DROP TABLE public.client_scope_role_mapping;
DROP TABLE public.client_scope_client;
DROP TABLE public.client_scope_attributes;
DROP TABLE public.client_scope;
DROP TABLE public.client_node_registrations;
DROP TABLE public.client_initial_access;
DROP TABLE public.client_auth_flow_bindings;
DROP TABLE public.client_attributes;
DROP TABLE public.client;
DROP TABLE public.broker_link;
DROP TABLE public.authenticator_config_entry;
DROP TABLE public.authenticator_config;
DROP TABLE public.authentication_flow;
DROP TABLE public.authentication_execution;
DROP TABLE public.associated_policy;
DROP TABLE public.admin_event_entity;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: beatbuddyauth
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO beatbuddyauth;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO beatbuddyauth;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO beatbuddyauth;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO beatbuddyauth;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO beatbuddyauth;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO beatbuddyauth;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO beatbuddyauth;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO beatbuddyauth;

--
-- Name: client; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO beatbuddyauth;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO beatbuddyauth;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO beatbuddyauth;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO beatbuddyauth;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO beatbuddyauth;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO beatbuddyauth;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO beatbuddyauth;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO beatbuddyauth;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO beatbuddyauth;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO beatbuddyauth;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO beatbuddyauth;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO beatbuddyauth;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO beatbuddyauth;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO beatbuddyauth;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO beatbuddyauth;

--
-- Name: component; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO beatbuddyauth;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO beatbuddyauth;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO beatbuddyauth;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO beatbuddyauth;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO beatbuddyauth;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO beatbuddyauth;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO beatbuddyauth;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO beatbuddyauth;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO beatbuddyauth;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO beatbuddyauth;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO beatbuddyauth;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO beatbuddyauth;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO beatbuddyauth;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO beatbuddyauth;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO beatbuddyauth;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO beatbuddyauth;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO beatbuddyauth;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO beatbuddyauth;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO beatbuddyauth;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO beatbuddyauth;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO beatbuddyauth;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO beatbuddyauth;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO beatbuddyauth;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO beatbuddyauth;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO beatbuddyauth;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO beatbuddyauth;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO beatbuddyauth;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO beatbuddyauth;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO beatbuddyauth;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO beatbuddyauth;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO beatbuddyauth;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO beatbuddyauth;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO beatbuddyauth;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO beatbuddyauth;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO beatbuddyauth;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO beatbuddyauth;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO beatbuddyauth;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO beatbuddyauth;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO beatbuddyauth;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO beatbuddyauth;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO beatbuddyauth;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO beatbuddyauth;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO beatbuddyauth;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO beatbuddyauth;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO beatbuddyauth;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO beatbuddyauth;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO beatbuddyauth;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO beatbuddyauth;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO beatbuddyauth;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO beatbuddyauth;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO beatbuddyauth;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO beatbuddyauth;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO beatbuddyauth;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO beatbuddyauth;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO beatbuddyauth;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO beatbuddyauth;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO beatbuddyauth;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO beatbuddyauth;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO beatbuddyauth;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO beatbuddyauth;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO beatbuddyauth;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO beatbuddyauth;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO beatbuddyauth;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO beatbuddyauth;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO beatbuddyauth;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO beatbuddyauth;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO beatbuddyauth;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO beatbuddyauth;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO beatbuddyauth;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: beatbuddyauth
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO beatbuddyauth;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
3a36cade-3bdb-4d9a-b4e4-de33379e8167	\N	auth-cookie	f0fbc87d-9020-46ea-b572-7f7ccc131e82	c4e0f8c2-e868-4700-9745-1f08bd4ce57e	2	10	f	\N	\N
719e8fe0-48b8-40dc-8003-93bdb8d2074c	\N	auth-spnego	f0fbc87d-9020-46ea-b572-7f7ccc131e82	c4e0f8c2-e868-4700-9745-1f08bd4ce57e	3	20	f	\N	\N
87b9388a-88d9-44ef-839c-1213b548befd	\N	identity-provider-redirector	f0fbc87d-9020-46ea-b572-7f7ccc131e82	c4e0f8c2-e868-4700-9745-1f08bd4ce57e	2	25	f	\N	\N
c51c4539-9a1f-42c8-848a-2718c28429e8	\N	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	c4e0f8c2-e868-4700-9745-1f08bd4ce57e	2	30	t	d8e9c08c-1831-48f4-be59-2c988a6335a0	\N
0ac37aff-f423-45f0-bfe3-42f7ed7b170f	\N	auth-username-password-form	f0fbc87d-9020-46ea-b572-7f7ccc131e82	d8e9c08c-1831-48f4-be59-2c988a6335a0	0	10	f	\N	\N
d95a3032-32e3-4a7c-b42b-49706571d58b	\N	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	d8e9c08c-1831-48f4-be59-2c988a6335a0	1	20	t	97cd2026-85e8-4c11-b227-614c77256fd7	\N
4862c7b5-29e7-4e5e-8932-39d1dee8072f	\N	conditional-user-configured	f0fbc87d-9020-46ea-b572-7f7ccc131e82	97cd2026-85e8-4c11-b227-614c77256fd7	0	10	f	\N	\N
2b1030f2-e322-433e-90bd-74fee00a301b	\N	auth-otp-form	f0fbc87d-9020-46ea-b572-7f7ccc131e82	97cd2026-85e8-4c11-b227-614c77256fd7	0	20	f	\N	\N
cc1d3239-cedb-41ea-b3e2-fcaaba1bba03	\N	direct-grant-validate-username	f0fbc87d-9020-46ea-b572-7f7ccc131e82	000c38d9-7957-4b5c-aaf6-7918f9b78861	0	10	f	\N	\N
dc5fc33c-7c2f-47b5-9b21-bb9c75303fdc	\N	direct-grant-validate-password	f0fbc87d-9020-46ea-b572-7f7ccc131e82	000c38d9-7957-4b5c-aaf6-7918f9b78861	0	20	f	\N	\N
9e8ae266-1dde-4bfa-84aa-fd9cd1460a5d	\N	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	000c38d9-7957-4b5c-aaf6-7918f9b78861	1	30	t	6741fe14-64a0-407c-ad8e-36767b128311	\N
95e7160f-0677-4ee9-ab48-aabe896b0136	\N	conditional-user-configured	f0fbc87d-9020-46ea-b572-7f7ccc131e82	6741fe14-64a0-407c-ad8e-36767b128311	0	10	f	\N	\N
cd288a35-6e68-4a49-a809-6a32acacfb78	\N	direct-grant-validate-otp	f0fbc87d-9020-46ea-b572-7f7ccc131e82	6741fe14-64a0-407c-ad8e-36767b128311	0	20	f	\N	\N
8e04ae3a-5c18-44ad-bc07-c58004138fe0	\N	registration-page-form	f0fbc87d-9020-46ea-b572-7f7ccc131e82	0ba9e862-750d-4406-9fd6-9fc290a8e51c	0	10	t	8c98bd16-8e21-4886-890a-49e537766c28	\N
b47d52fb-668b-4961-bf02-1f892f388c8e	\N	registration-user-creation	f0fbc87d-9020-46ea-b572-7f7ccc131e82	8c98bd16-8e21-4886-890a-49e537766c28	0	20	f	\N	\N
4ef90769-8b04-4640-af6b-7c486fb6f588	\N	registration-profile-action	f0fbc87d-9020-46ea-b572-7f7ccc131e82	8c98bd16-8e21-4886-890a-49e537766c28	0	40	f	\N	\N
c0cb1da0-9f23-4577-9b15-db56bec509c7	\N	registration-password-action	f0fbc87d-9020-46ea-b572-7f7ccc131e82	8c98bd16-8e21-4886-890a-49e537766c28	0	50	f	\N	\N
537c006c-fcb6-4350-a01d-ba9b179193ad	\N	registration-recaptcha-action	f0fbc87d-9020-46ea-b572-7f7ccc131e82	8c98bd16-8e21-4886-890a-49e537766c28	3	60	f	\N	\N
518bc174-0acb-42de-b4fd-d96866dc9446	\N	registration-terms-and-conditions	f0fbc87d-9020-46ea-b572-7f7ccc131e82	8c98bd16-8e21-4886-890a-49e537766c28	3	70	f	\N	\N
62cbc08f-97a5-4e55-9400-56c9805de260	\N	reset-credentials-choose-user	f0fbc87d-9020-46ea-b572-7f7ccc131e82	c14ea7ea-047a-484c-a6c5-6f085d73f70b	0	10	f	\N	\N
68a2857f-7bbf-4b3d-b4ca-f502ccd17b1b	\N	reset-credential-email	f0fbc87d-9020-46ea-b572-7f7ccc131e82	c14ea7ea-047a-484c-a6c5-6f085d73f70b	0	20	f	\N	\N
c9b82945-b63d-4aa1-b132-641253b3f7c8	\N	reset-password	f0fbc87d-9020-46ea-b572-7f7ccc131e82	c14ea7ea-047a-484c-a6c5-6f085d73f70b	0	30	f	\N	\N
22dda8a1-e8de-41b6-b99b-36f1c071f0ee	\N	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	c14ea7ea-047a-484c-a6c5-6f085d73f70b	1	40	t	a8a78a33-da4b-4b27-bb40-5e64cdd1cd17	\N
0862c07d-07a0-4e5e-aff2-e284b2d3a26b	\N	conditional-user-configured	f0fbc87d-9020-46ea-b572-7f7ccc131e82	a8a78a33-da4b-4b27-bb40-5e64cdd1cd17	0	10	f	\N	\N
00b7e07b-bfc9-4029-b3cc-67aeedfbcb5a	\N	reset-otp	f0fbc87d-9020-46ea-b572-7f7ccc131e82	a8a78a33-da4b-4b27-bb40-5e64cdd1cd17	0	20	f	\N	\N
5b820efb-5565-47e9-bec7-a36523142ecb	\N	client-secret	f0fbc87d-9020-46ea-b572-7f7ccc131e82	844fee80-d9a0-4abd-b9d4-9e9fc01e1c8e	2	10	f	\N	\N
79fe0dd7-e07f-4935-bb20-4683ea37f29b	\N	client-jwt	f0fbc87d-9020-46ea-b572-7f7ccc131e82	844fee80-d9a0-4abd-b9d4-9e9fc01e1c8e	2	20	f	\N	\N
6eedf5bc-d03e-41cd-ae0b-63f5ff3d4979	\N	client-secret-jwt	f0fbc87d-9020-46ea-b572-7f7ccc131e82	844fee80-d9a0-4abd-b9d4-9e9fc01e1c8e	2	30	f	\N	\N
39bd9f36-8b10-4ff3-8b7b-402d8db09b10	\N	client-x509	f0fbc87d-9020-46ea-b572-7f7ccc131e82	844fee80-d9a0-4abd-b9d4-9e9fc01e1c8e	2	40	f	\N	\N
d0bc22bf-ae06-4d60-a951-0d753b66ffac	\N	idp-review-profile	f0fbc87d-9020-46ea-b572-7f7ccc131e82	5e7ff8b1-efa2-46a3-ae75-945a7eb77d69	0	10	f	\N	c5bce831-2728-476e-b530-9e04a8f8f364
0562b14c-3a5b-4ecd-af4e-729f772e50ad	\N	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	5e7ff8b1-efa2-46a3-ae75-945a7eb77d69	0	20	t	eca0f42c-5b61-47a1-a007-bf609514e28c	\N
0abada6b-7149-4538-b2b8-4cb07f9110f4	\N	idp-create-user-if-unique	f0fbc87d-9020-46ea-b572-7f7ccc131e82	eca0f42c-5b61-47a1-a007-bf609514e28c	2	10	f	\N	eb865bf2-9552-4687-987c-c283af61f441
315b152d-265e-474f-b203-c0226c86bd4c	\N	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	eca0f42c-5b61-47a1-a007-bf609514e28c	2	20	t	d7b4fea3-5a6d-45a6-9c97-841e3c0bba27	\N
c67c1552-571c-48b0-8692-921b3079cd18	\N	idp-confirm-link	f0fbc87d-9020-46ea-b572-7f7ccc131e82	d7b4fea3-5a6d-45a6-9c97-841e3c0bba27	0	10	f	\N	\N
58ccecfa-4581-4758-b842-f47ece91053a	\N	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	d7b4fea3-5a6d-45a6-9c97-841e3c0bba27	0	20	t	8d678922-f3f3-4f4b-b94d-de5fb2eca42c	\N
d29a419b-36d5-47c7-bd44-9547821badd1	\N	idp-email-verification	f0fbc87d-9020-46ea-b572-7f7ccc131e82	8d678922-f3f3-4f4b-b94d-de5fb2eca42c	2	10	f	\N	\N
6d27632a-783f-4930-bb59-44349601c9ab	\N	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	8d678922-f3f3-4f4b-b94d-de5fb2eca42c	2	20	t	0539eebf-8130-43a8-8acb-4db17ce2557c	\N
b37421d7-f424-4a42-9a3e-a9c1198162fc	\N	idp-username-password-form	f0fbc87d-9020-46ea-b572-7f7ccc131e82	0539eebf-8130-43a8-8acb-4db17ce2557c	0	10	f	\N	\N
7db1ebde-a1b9-4bd1-a14b-4fcfda08166a	\N	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	0539eebf-8130-43a8-8acb-4db17ce2557c	1	20	t	b02ce949-e492-4438-b1f7-d97af32a59f5	\N
a0a8401d-0724-4ab3-a675-5e2ab72d6ec6	\N	conditional-user-configured	f0fbc87d-9020-46ea-b572-7f7ccc131e82	b02ce949-e492-4438-b1f7-d97af32a59f5	0	10	f	\N	\N
adeca4a2-c8fc-4973-b391-e76c190f6185	\N	auth-otp-form	f0fbc87d-9020-46ea-b572-7f7ccc131e82	b02ce949-e492-4438-b1f7-d97af32a59f5	0	20	f	\N	\N
f972c8aa-2a62-4a5e-9b16-07afb70731ef	\N	http-basic-authenticator	f0fbc87d-9020-46ea-b572-7f7ccc131e82	f2dbb6b1-100c-42c5-819e-f59a5a25859d	0	10	f	\N	\N
524b40ba-8e03-4ba9-8d6d-e75f24ca150b	\N	docker-http-basic-authenticator	f0fbc87d-9020-46ea-b572-7f7ccc131e82	9c746ada-4ae0-4a79-b665-44dd63484e59	0	10	f	\N	\N
d041b26e-c33a-4905-bbe5-e04c9568734b	\N	auth-cookie	bbfb0c95-df74-4043-af21-ff214ec2b0a0	59c63ad8-6bbb-4dc1-986c-6e7402520629	2	10	f	\N	\N
f0f0ba69-8518-4c90-969c-74181f37de15	\N	auth-spnego	bbfb0c95-df74-4043-af21-ff214ec2b0a0	59c63ad8-6bbb-4dc1-986c-6e7402520629	3	20	f	\N	\N
76131cd0-b989-4870-9d35-e1e15601de84	\N	identity-provider-redirector	bbfb0c95-df74-4043-af21-ff214ec2b0a0	59c63ad8-6bbb-4dc1-986c-6e7402520629	2	25	f	\N	\N
de851972-04ed-49d5-84b1-488021312e09	\N	\N	bbfb0c95-df74-4043-af21-ff214ec2b0a0	59c63ad8-6bbb-4dc1-986c-6e7402520629	2	30	t	d67ce303-e6ab-4f56-a8ee-26e9695ea4cd	\N
78d3ce3d-5594-42e0-82d6-f86901861e18	\N	auth-username-password-form	bbfb0c95-df74-4043-af21-ff214ec2b0a0	d67ce303-e6ab-4f56-a8ee-26e9695ea4cd	0	10	f	\N	\N
aef4da6c-e4e4-48b3-80f4-b0d77f42edc4	\N	\N	bbfb0c95-df74-4043-af21-ff214ec2b0a0	d67ce303-e6ab-4f56-a8ee-26e9695ea4cd	1	20	t	8d636b4b-4724-4230-8a2f-b016a014e292	\N
c8754b6a-43a4-4c37-a5e7-5018bf36a416	\N	conditional-user-configured	bbfb0c95-df74-4043-af21-ff214ec2b0a0	8d636b4b-4724-4230-8a2f-b016a014e292	0	10	f	\N	\N
1f806233-9af1-4742-ba12-3f24c1cb8073	\N	auth-otp-form	bbfb0c95-df74-4043-af21-ff214ec2b0a0	8d636b4b-4724-4230-8a2f-b016a014e292	0	20	f	\N	\N
f4a5a07e-8ffb-40e6-bdac-5af07d028679	\N	direct-grant-validate-username	bbfb0c95-df74-4043-af21-ff214ec2b0a0	4673074d-b363-4a15-8393-7fff61d0ead8	0	10	f	\N	\N
35f2a72e-84fe-4a59-8faa-37f437d6dd79	\N	direct-grant-validate-password	bbfb0c95-df74-4043-af21-ff214ec2b0a0	4673074d-b363-4a15-8393-7fff61d0ead8	0	20	f	\N	\N
108c8522-ac1a-4752-aee6-72b1338dfaad	\N	\N	bbfb0c95-df74-4043-af21-ff214ec2b0a0	4673074d-b363-4a15-8393-7fff61d0ead8	1	30	t	95721217-7966-450b-89be-9ccd81456ea7	\N
9ee293f1-fd20-402f-9626-845159469d51	\N	conditional-user-configured	bbfb0c95-df74-4043-af21-ff214ec2b0a0	95721217-7966-450b-89be-9ccd81456ea7	0	10	f	\N	\N
0d2f8cde-bc44-4a34-ae18-9a072ebf9f22	\N	direct-grant-validate-otp	bbfb0c95-df74-4043-af21-ff214ec2b0a0	95721217-7966-450b-89be-9ccd81456ea7	0	20	f	\N	\N
4b2626fc-bb15-41d3-8587-a73df3a27ba9	\N	registration-page-form	bbfb0c95-df74-4043-af21-ff214ec2b0a0	aa8ad4cd-b373-4981-bbd4-ea01bd2d4232	0	10	t	009d35f0-0cb1-49ce-976d-c0f9abbecbe4	\N
d68d46a1-4fd9-488c-a3ca-21d6cea7740f	\N	registration-user-creation	bbfb0c95-df74-4043-af21-ff214ec2b0a0	009d35f0-0cb1-49ce-976d-c0f9abbecbe4	0	20	f	\N	\N
8d393504-0d9d-4683-936e-6c92307e14c3	\N	registration-profile-action	bbfb0c95-df74-4043-af21-ff214ec2b0a0	009d35f0-0cb1-49ce-976d-c0f9abbecbe4	0	40	f	\N	\N
ef2ffa6a-9f4c-469f-8831-97a4ea5b1e70	\N	registration-password-action	bbfb0c95-df74-4043-af21-ff214ec2b0a0	009d35f0-0cb1-49ce-976d-c0f9abbecbe4	0	50	f	\N	\N
6587a8b9-181c-4c2a-bcd2-2b2982a82fd2	\N	registration-recaptcha-action	bbfb0c95-df74-4043-af21-ff214ec2b0a0	009d35f0-0cb1-49ce-976d-c0f9abbecbe4	3	60	f	\N	\N
0b3c2244-5da9-4783-ab73-39f28aab9187	\N	reset-credentials-choose-user	bbfb0c95-df74-4043-af21-ff214ec2b0a0	eaf535e7-aa53-435b-b772-0a28b81b514d	0	10	f	\N	\N
afd9dafa-f95f-41fc-8799-c09b3c634c3a	\N	reset-credential-email	bbfb0c95-df74-4043-af21-ff214ec2b0a0	eaf535e7-aa53-435b-b772-0a28b81b514d	0	20	f	\N	\N
4345a07c-57a5-40a1-a88f-f785975ccdab	\N	reset-password	bbfb0c95-df74-4043-af21-ff214ec2b0a0	eaf535e7-aa53-435b-b772-0a28b81b514d	0	30	f	\N	\N
4de2af9c-f65c-4fe4-bb23-7ce7e0b1002f	\N	\N	bbfb0c95-df74-4043-af21-ff214ec2b0a0	eaf535e7-aa53-435b-b772-0a28b81b514d	1	40	t	59ae9a46-41e8-489a-882b-b443237bdf44	\N
5b0165fc-d0e1-476f-bfc8-d912d058d245	\N	conditional-user-configured	bbfb0c95-df74-4043-af21-ff214ec2b0a0	59ae9a46-41e8-489a-882b-b443237bdf44	0	10	f	\N	\N
7d4958a5-561e-404d-942d-527303304a18	\N	reset-otp	bbfb0c95-df74-4043-af21-ff214ec2b0a0	59ae9a46-41e8-489a-882b-b443237bdf44	0	20	f	\N	\N
b0ec0fdf-e0e1-4550-a81e-d84551abe895	\N	client-secret	bbfb0c95-df74-4043-af21-ff214ec2b0a0	a44f59d5-1b9c-4955-946c-69cdc8e66bf2	2	10	f	\N	\N
786ce9f7-3427-4ebd-83e8-3964f0faf2da	\N	client-jwt	bbfb0c95-df74-4043-af21-ff214ec2b0a0	a44f59d5-1b9c-4955-946c-69cdc8e66bf2	2	20	f	\N	\N
9875d3f5-ebdf-492b-b060-191afb7721c8	\N	client-secret-jwt	bbfb0c95-df74-4043-af21-ff214ec2b0a0	a44f59d5-1b9c-4955-946c-69cdc8e66bf2	2	30	f	\N	\N
f7dea8dc-bed2-4404-a1b8-238cf028d251	\N	client-x509	bbfb0c95-df74-4043-af21-ff214ec2b0a0	a44f59d5-1b9c-4955-946c-69cdc8e66bf2	2	40	f	\N	\N
116749f7-492c-4fcf-ba6a-6eb1677e5f7d	\N	idp-review-profile	bbfb0c95-df74-4043-af21-ff214ec2b0a0	53a656d9-052d-497b-87d3-f1420742c5f6	0	10	f	\N	33a48093-590a-4f53-b1de-63d7fb1b5db8
b07295bf-8676-4931-b4b5-f6769f1f2f4f	\N	\N	bbfb0c95-df74-4043-af21-ff214ec2b0a0	53a656d9-052d-497b-87d3-f1420742c5f6	0	20	t	463d7ba8-4739-4364-9405-a43743005a1d	\N
bae400ef-b718-4f93-b68f-06f87439ab58	\N	idp-create-user-if-unique	bbfb0c95-df74-4043-af21-ff214ec2b0a0	463d7ba8-4739-4364-9405-a43743005a1d	2	10	f	\N	22cd6186-9471-427b-807c-406306ebf4f8
8b6a189a-8849-43b3-b921-c68a96083693	\N	\N	bbfb0c95-df74-4043-af21-ff214ec2b0a0	463d7ba8-4739-4364-9405-a43743005a1d	2	20	t	50fc68bc-2cdd-4c60-b469-583b42827ffe	\N
86cf537e-c91f-4bb2-ae92-c4998048f14d	\N	idp-confirm-link	bbfb0c95-df74-4043-af21-ff214ec2b0a0	50fc68bc-2cdd-4c60-b469-583b42827ffe	0	10	f	\N	\N
2ad4cb19-f357-49b8-a669-b767b4a7141b	\N	\N	bbfb0c95-df74-4043-af21-ff214ec2b0a0	50fc68bc-2cdd-4c60-b469-583b42827ffe	0	20	t	65ec566b-0b9a-4715-9b4c-a815adac3571	\N
8818ec4b-cb9c-41e4-8353-befa0bd8a2d4	\N	idp-email-verification	bbfb0c95-df74-4043-af21-ff214ec2b0a0	65ec566b-0b9a-4715-9b4c-a815adac3571	2	10	f	\N	\N
ced2815a-46a5-4301-8504-7dd5374aa3ce	\N	\N	bbfb0c95-df74-4043-af21-ff214ec2b0a0	65ec566b-0b9a-4715-9b4c-a815adac3571	2	20	t	1cd350b5-f091-427a-ba2b-55f50325f5ce	\N
0b44cd39-e003-4401-a42a-0fc63b53c915	\N	idp-username-password-form	bbfb0c95-df74-4043-af21-ff214ec2b0a0	1cd350b5-f091-427a-ba2b-55f50325f5ce	0	10	f	\N	\N
8f1607c8-b094-40ad-9d29-7ce74820f794	\N	\N	bbfb0c95-df74-4043-af21-ff214ec2b0a0	1cd350b5-f091-427a-ba2b-55f50325f5ce	1	20	t	53967a98-a630-4345-94a2-b68e68c271bf	\N
b5044b32-2f12-4945-8e43-8c0ce9da0404	\N	conditional-user-configured	bbfb0c95-df74-4043-af21-ff214ec2b0a0	53967a98-a630-4345-94a2-b68e68c271bf	0	10	f	\N	\N
a741ad55-2096-4dc9-b834-b4819babac24	\N	auth-otp-form	bbfb0c95-df74-4043-af21-ff214ec2b0a0	53967a98-a630-4345-94a2-b68e68c271bf	0	20	f	\N	\N
f518941a-9156-4459-b242-70ed56e06818	\N	http-basic-authenticator	bbfb0c95-df74-4043-af21-ff214ec2b0a0	8afbad7b-bb8b-4693-ac93-0ce4119b3729	0	10	f	\N	\N
9fbfb38e-ae0a-496d-878e-e6b089c37c29	\N	docker-http-basic-authenticator	bbfb0c95-df74-4043-af21-ff214ec2b0a0	81f408ef-3afc-4fb6-b9ea-3eb0dee61201	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
c4e0f8c2-e868-4700-9745-1f08bd4ce57e	browser	browser based authentication	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	t	t
d8e9c08c-1831-48f4-be59-2c988a6335a0	forms	Username, password, otp and other auth forms.	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	f	t
97cd2026-85e8-4c11-b227-614c77256fd7	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	f	t
000c38d9-7957-4b5c-aaf6-7918f9b78861	direct grant	OpenID Connect Resource Owner Grant	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	t	t
6741fe14-64a0-407c-ad8e-36767b128311	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	f	t
0ba9e862-750d-4406-9fd6-9fc290a8e51c	registration	registration flow	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	t	t
8c98bd16-8e21-4886-890a-49e537766c28	registration form	registration form	f0fbc87d-9020-46ea-b572-7f7ccc131e82	form-flow	f	t
c14ea7ea-047a-484c-a6c5-6f085d73f70b	reset credentials	Reset credentials for a user if they forgot their password or something	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	t	t
a8a78a33-da4b-4b27-bb40-5e64cdd1cd17	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	f	t
844fee80-d9a0-4abd-b9d4-9e9fc01e1c8e	clients	Base authentication for clients	f0fbc87d-9020-46ea-b572-7f7ccc131e82	client-flow	t	t
5e7ff8b1-efa2-46a3-ae75-945a7eb77d69	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	t	t
eca0f42c-5b61-47a1-a007-bf609514e28c	User creation or linking	Flow for the existing/non-existing user alternatives	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	f	t
d7b4fea3-5a6d-45a6-9c97-841e3c0bba27	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	f	t
8d678922-f3f3-4f4b-b94d-de5fb2eca42c	Account verification options	Method with which to verity the existing account	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	f	t
0539eebf-8130-43a8-8acb-4db17ce2557c	Verify Existing Account by Re-authentication	Reauthentication of existing account	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	f	t
b02ce949-e492-4438-b1f7-d97af32a59f5	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	f	t
f2dbb6b1-100c-42c5-819e-f59a5a25859d	saml ecp	SAML ECP Profile Authentication Flow	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	t	t
9c746ada-4ae0-4a79-b665-44dd63484e59	docker auth	Used by Docker clients to authenticate against the IDP	f0fbc87d-9020-46ea-b572-7f7ccc131e82	basic-flow	t	t
59c63ad8-6bbb-4dc1-986c-6e7402520629	browser	browser based authentication	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	t	t
d67ce303-e6ab-4f56-a8ee-26e9695ea4cd	forms	Username, password, otp and other auth forms.	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	f	t
8d636b4b-4724-4230-8a2f-b016a014e292	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	f	t
4673074d-b363-4a15-8393-7fff61d0ead8	direct grant	OpenID Connect Resource Owner Grant	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	t	t
95721217-7966-450b-89be-9ccd81456ea7	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	f	t
aa8ad4cd-b373-4981-bbd4-ea01bd2d4232	registration	registration flow	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	t	t
009d35f0-0cb1-49ce-976d-c0f9abbecbe4	registration form	registration form	bbfb0c95-df74-4043-af21-ff214ec2b0a0	form-flow	f	t
eaf535e7-aa53-435b-b772-0a28b81b514d	reset credentials	Reset credentials for a user if they forgot their password or something	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	t	t
59ae9a46-41e8-489a-882b-b443237bdf44	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	f	t
a44f59d5-1b9c-4955-946c-69cdc8e66bf2	clients	Base authentication for clients	bbfb0c95-df74-4043-af21-ff214ec2b0a0	client-flow	t	t
53a656d9-052d-497b-87d3-f1420742c5f6	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	t	t
463d7ba8-4739-4364-9405-a43743005a1d	User creation or linking	Flow for the existing/non-existing user alternatives	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	f	t
50fc68bc-2cdd-4c60-b469-583b42827ffe	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	f	t
65ec566b-0b9a-4715-9b4c-a815adac3571	Account verification options	Method with which to verity the existing account	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	f	t
1cd350b5-f091-427a-ba2b-55f50325f5ce	Verify Existing Account by Re-authentication	Reauthentication of existing account	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	f	t
53967a98-a630-4345-94a2-b68e68c271bf	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	f	t
8afbad7b-bb8b-4693-ac93-0ce4119b3729	saml ecp	SAML ECP Profile Authentication Flow	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	t	t
81f408ef-3afc-4fb6-b9ea-3eb0dee61201	docker auth	Used by Docker clients to authenticate against the IDP	bbfb0c95-df74-4043-af21-ff214ec2b0a0	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
c5bce831-2728-476e-b530-9e04a8f8f364	review profile config	f0fbc87d-9020-46ea-b572-7f7ccc131e82
eb865bf2-9552-4687-987c-c283af61f441	create unique user config	f0fbc87d-9020-46ea-b572-7f7ccc131e82
33a48093-590a-4f53-b1de-63d7fb1b5db8	review profile config	bbfb0c95-df74-4043-af21-ff214ec2b0a0
22cd6186-9471-427b-807c-406306ebf4f8	create unique user config	bbfb0c95-df74-4043-af21-ff214ec2b0a0
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
c5bce831-2728-476e-b530-9e04a8f8f364	missing	update.profile.on.first.login
eb865bf2-9552-4687-987c-c283af61f441	false	require.password.update.after.registration
22cd6186-9471-427b-807c-406306ebf4f8	false	require.password.update.after.registration
33a48093-590a-4f53-b1de-63d7fb1b5db8	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	f	master-realm	0	f	\N	\N	t	\N	f	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
42e846a4-a827-4703-bf13-b109fd47a7de	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	f0fbc87d-9020-46ea-b572-7f7ccc131e82	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
c9f45c5a-c9c2-485d-978b-9b3aacdda522	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	f0fbc87d-9020-46ea-b572-7f7ccc131e82	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	t	f	broker	0	f	\N	\N	t	\N	f	f0fbc87d-9020-46ea-b572-7f7ccc131e82	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	f0fbc87d-9020-46ea-b572-7f7ccc131e82	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	t	f	admin-cli	0	t	\N	\N	f	\N	f	f0fbc87d-9020-46ea-b572-7f7ccc131e82	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
fb34e799-f88b-47c6-9de1-063a0e0f3491	t	f	beatbuddy-realm	0	f	\N	\N	t	\N	f	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N	0	f	f	beatbuddy Realm	f	client-secret	\N	\N	\N	t	f	f	f
3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	f	realm-management	0	f	\N	\N	t	\N	f	bbfb0c95-df74-4043-af21-ff214ec2b0a0	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
dafc5509-1e81-45a5-bd98-6d6181a5d07b	t	f	account	0	t	\N	/realms/beatbuddy/account/	f	\N	f	bbfb0c95-df74-4043-af21-ff214ec2b0a0	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
8bc25416-0142-4f4e-8a69-838bee9f6b0a	t	f	account-console	0	t	\N	/realms/beatbuddy/account/	f	\N	f	bbfb0c95-df74-4043-af21-ff214ec2b0a0	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
858761b0-4802-4e35-a222-e44a0279baba	t	f	broker	0	f	\N	\N	t	\N	f	bbfb0c95-df74-4043-af21-ff214ec2b0a0	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
df064836-2d23-4b64-8386-52943fbdf40b	t	f	security-admin-console	0	t	\N	/admin/beatbuddy/console/	f	\N	f	bbfb0c95-df74-4043-af21-ff214ec2b0a0	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
1ded6cd4-0c53-495c-af36-34003ea1ac40	t	f	admin-cli	0	t	\N	\N	f	\N	f	bbfb0c95-df74-4043-af21-ff214ec2b0a0	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	t	t	beatbuddywebui	0	t	\N		f		f	bbfb0c95-df74-4043-af21-ff214ec2b0a0	openid-connect	-1	t	f	Beat Buddy Web UI	f	client-secret			\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
42e846a4-a827-4703-bf13-b109fd47a7de	post.logout.redirect.uris	+
c9f45c5a-c9c2-485d-978b-9b3aacdda522	post.logout.redirect.uris	+
c9f45c5a-c9c2-485d-978b-9b3aacdda522	pkce.code.challenge.method	S256
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	post.logout.redirect.uris	+
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	pkce.code.challenge.method	S256
dafc5509-1e81-45a5-bd98-6d6181a5d07b	post.logout.redirect.uris	+
8bc25416-0142-4f4e-8a69-838bee9f6b0a	post.logout.redirect.uris	+
8bc25416-0142-4f4e-8a69-838bee9f6b0a	pkce.code.challenge.method	S256
df064836-2d23-4b64-8386-52943fbdf40b	post.logout.redirect.uris	+
df064836-2d23-4b64-8386-52943fbdf40b	pkce.code.challenge.method	S256
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	oauth2.device.authorization.grant.enabled	false
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	oidc.ciba.grant.enabled	false
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	backchannel.logout.session.required	true
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	backchannel.logout.revoke.offline.tokens	false
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
d583a1e3-e18b-42e6-80d1-ee0cdda065ae	offline_access	f0fbc87d-9020-46ea-b572-7f7ccc131e82	OpenID Connect built-in scope: offline_access	openid-connect
199b1901-d1d3-4bc6-86a4-593520815117	role_list	f0fbc87d-9020-46ea-b572-7f7ccc131e82	SAML role list	saml
a0b084e2-ce1f-4596-8b2d-e6be1845967a	profile	f0fbc87d-9020-46ea-b572-7f7ccc131e82	OpenID Connect built-in scope: profile	openid-connect
6ff0a578-8421-4f55-b0a7-62e9212d0223	email	f0fbc87d-9020-46ea-b572-7f7ccc131e82	OpenID Connect built-in scope: email	openid-connect
aa26d985-8993-4b65-83a9-d49cc8585342	address	f0fbc87d-9020-46ea-b572-7f7ccc131e82	OpenID Connect built-in scope: address	openid-connect
965df560-c79b-467a-bf22-ef030dde9fce	phone	f0fbc87d-9020-46ea-b572-7f7ccc131e82	OpenID Connect built-in scope: phone	openid-connect
14b41792-e9c3-4607-a5c9-7a82c1648653	roles	f0fbc87d-9020-46ea-b572-7f7ccc131e82	OpenID Connect scope for add user roles to the access token	openid-connect
5551baf4-77e4-4981-a6d6-cda458597cf6	web-origins	f0fbc87d-9020-46ea-b572-7f7ccc131e82	OpenID Connect scope for add allowed web origins to the access token	openid-connect
1d895be4-0c51-4fcb-9c72-7326520785a6	microprofile-jwt	f0fbc87d-9020-46ea-b572-7f7ccc131e82	Microprofile - JWT built-in scope	openid-connect
e2dabb64-0bff-4a25-876d-a421fd1d54f9	acr	f0fbc87d-9020-46ea-b572-7f7ccc131e82	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
c6a99be1-5c93-47b2-add2-ee3648afe730	offline_access	bbfb0c95-df74-4043-af21-ff214ec2b0a0	OpenID Connect built-in scope: offline_access	openid-connect
b6449b51-993a-45a8-9ae0-2dd84b6bb1db	role_list	bbfb0c95-df74-4043-af21-ff214ec2b0a0	SAML role list	saml
c25849e6-0940-4ea8-8077-43f091af2a16	profile	bbfb0c95-df74-4043-af21-ff214ec2b0a0	OpenID Connect built-in scope: profile	openid-connect
3739025a-6c5c-452d-bf07-470f5b91aa92	email	bbfb0c95-df74-4043-af21-ff214ec2b0a0	OpenID Connect built-in scope: email	openid-connect
d87c24c2-e2a2-4c5c-bc01-57156f1b993b	address	bbfb0c95-df74-4043-af21-ff214ec2b0a0	OpenID Connect built-in scope: address	openid-connect
f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	phone	bbfb0c95-df74-4043-af21-ff214ec2b0a0	OpenID Connect built-in scope: phone	openid-connect
9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	roles	bbfb0c95-df74-4043-af21-ff214ec2b0a0	OpenID Connect scope for add user roles to the access token	openid-connect
365e0845-dce5-4776-a0e6-500d21cd3ca5	web-origins	bbfb0c95-df74-4043-af21-ff214ec2b0a0	OpenID Connect scope for add allowed web origins to the access token	openid-connect
7e40abff-7bec-404f-8fc8-ca019be62311	microprofile-jwt	bbfb0c95-df74-4043-af21-ff214ec2b0a0	Microprofile - JWT built-in scope	openid-connect
e6307b01-1269-480e-93bf-5a01f85cd21e	acr	bbfb0c95-df74-4043-af21-ff214ec2b0a0	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
d583a1e3-e18b-42e6-80d1-ee0cdda065ae	true	display.on.consent.screen
d583a1e3-e18b-42e6-80d1-ee0cdda065ae	${offlineAccessScopeConsentText}	consent.screen.text
199b1901-d1d3-4bc6-86a4-593520815117	true	display.on.consent.screen
199b1901-d1d3-4bc6-86a4-593520815117	${samlRoleListScopeConsentText}	consent.screen.text
a0b084e2-ce1f-4596-8b2d-e6be1845967a	true	display.on.consent.screen
a0b084e2-ce1f-4596-8b2d-e6be1845967a	${profileScopeConsentText}	consent.screen.text
a0b084e2-ce1f-4596-8b2d-e6be1845967a	true	include.in.token.scope
6ff0a578-8421-4f55-b0a7-62e9212d0223	true	display.on.consent.screen
6ff0a578-8421-4f55-b0a7-62e9212d0223	${emailScopeConsentText}	consent.screen.text
6ff0a578-8421-4f55-b0a7-62e9212d0223	true	include.in.token.scope
aa26d985-8993-4b65-83a9-d49cc8585342	true	display.on.consent.screen
aa26d985-8993-4b65-83a9-d49cc8585342	${addressScopeConsentText}	consent.screen.text
aa26d985-8993-4b65-83a9-d49cc8585342	true	include.in.token.scope
965df560-c79b-467a-bf22-ef030dde9fce	true	display.on.consent.screen
965df560-c79b-467a-bf22-ef030dde9fce	${phoneScopeConsentText}	consent.screen.text
965df560-c79b-467a-bf22-ef030dde9fce	true	include.in.token.scope
14b41792-e9c3-4607-a5c9-7a82c1648653	true	display.on.consent.screen
14b41792-e9c3-4607-a5c9-7a82c1648653	${rolesScopeConsentText}	consent.screen.text
14b41792-e9c3-4607-a5c9-7a82c1648653	false	include.in.token.scope
5551baf4-77e4-4981-a6d6-cda458597cf6	false	display.on.consent.screen
5551baf4-77e4-4981-a6d6-cda458597cf6		consent.screen.text
5551baf4-77e4-4981-a6d6-cda458597cf6	false	include.in.token.scope
1d895be4-0c51-4fcb-9c72-7326520785a6	false	display.on.consent.screen
1d895be4-0c51-4fcb-9c72-7326520785a6	true	include.in.token.scope
e2dabb64-0bff-4a25-876d-a421fd1d54f9	false	display.on.consent.screen
e2dabb64-0bff-4a25-876d-a421fd1d54f9	false	include.in.token.scope
c6a99be1-5c93-47b2-add2-ee3648afe730	true	display.on.consent.screen
c6a99be1-5c93-47b2-add2-ee3648afe730	${offlineAccessScopeConsentText}	consent.screen.text
b6449b51-993a-45a8-9ae0-2dd84b6bb1db	true	display.on.consent.screen
b6449b51-993a-45a8-9ae0-2dd84b6bb1db	${samlRoleListScopeConsentText}	consent.screen.text
c25849e6-0940-4ea8-8077-43f091af2a16	true	display.on.consent.screen
c25849e6-0940-4ea8-8077-43f091af2a16	${profileScopeConsentText}	consent.screen.text
c25849e6-0940-4ea8-8077-43f091af2a16	true	include.in.token.scope
3739025a-6c5c-452d-bf07-470f5b91aa92	true	display.on.consent.screen
3739025a-6c5c-452d-bf07-470f5b91aa92	${emailScopeConsentText}	consent.screen.text
3739025a-6c5c-452d-bf07-470f5b91aa92	true	include.in.token.scope
d87c24c2-e2a2-4c5c-bc01-57156f1b993b	true	display.on.consent.screen
d87c24c2-e2a2-4c5c-bc01-57156f1b993b	${addressScopeConsentText}	consent.screen.text
d87c24c2-e2a2-4c5c-bc01-57156f1b993b	true	include.in.token.scope
f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	true	display.on.consent.screen
f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	${phoneScopeConsentText}	consent.screen.text
f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	true	include.in.token.scope
9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	true	display.on.consent.screen
9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	${rolesScopeConsentText}	consent.screen.text
9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	false	include.in.token.scope
365e0845-dce5-4776-a0e6-500d21cd3ca5	false	display.on.consent.screen
365e0845-dce5-4776-a0e6-500d21cd3ca5		consent.screen.text
365e0845-dce5-4776-a0e6-500d21cd3ca5	false	include.in.token.scope
7e40abff-7bec-404f-8fc8-ca019be62311	false	display.on.consent.screen
7e40abff-7bec-404f-8fc8-ca019be62311	true	include.in.token.scope
e6307b01-1269-480e-93bf-5a01f85cd21e	false	display.on.consent.screen
e6307b01-1269-480e-93bf-5a01f85cd21e	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
42e846a4-a827-4703-bf13-b109fd47a7de	e2dabb64-0bff-4a25-876d-a421fd1d54f9	t
42e846a4-a827-4703-bf13-b109fd47a7de	6ff0a578-8421-4f55-b0a7-62e9212d0223	t
42e846a4-a827-4703-bf13-b109fd47a7de	a0b084e2-ce1f-4596-8b2d-e6be1845967a	t
42e846a4-a827-4703-bf13-b109fd47a7de	5551baf4-77e4-4981-a6d6-cda458597cf6	t
42e846a4-a827-4703-bf13-b109fd47a7de	14b41792-e9c3-4607-a5c9-7a82c1648653	t
42e846a4-a827-4703-bf13-b109fd47a7de	aa26d985-8993-4b65-83a9-d49cc8585342	f
42e846a4-a827-4703-bf13-b109fd47a7de	d583a1e3-e18b-42e6-80d1-ee0cdda065ae	f
42e846a4-a827-4703-bf13-b109fd47a7de	1d895be4-0c51-4fcb-9c72-7326520785a6	f
42e846a4-a827-4703-bf13-b109fd47a7de	965df560-c79b-467a-bf22-ef030dde9fce	f
c9f45c5a-c9c2-485d-978b-9b3aacdda522	e2dabb64-0bff-4a25-876d-a421fd1d54f9	t
c9f45c5a-c9c2-485d-978b-9b3aacdda522	6ff0a578-8421-4f55-b0a7-62e9212d0223	t
c9f45c5a-c9c2-485d-978b-9b3aacdda522	a0b084e2-ce1f-4596-8b2d-e6be1845967a	t
c9f45c5a-c9c2-485d-978b-9b3aacdda522	5551baf4-77e4-4981-a6d6-cda458597cf6	t
c9f45c5a-c9c2-485d-978b-9b3aacdda522	14b41792-e9c3-4607-a5c9-7a82c1648653	t
c9f45c5a-c9c2-485d-978b-9b3aacdda522	aa26d985-8993-4b65-83a9-d49cc8585342	f
c9f45c5a-c9c2-485d-978b-9b3aacdda522	d583a1e3-e18b-42e6-80d1-ee0cdda065ae	f
c9f45c5a-c9c2-485d-978b-9b3aacdda522	1d895be4-0c51-4fcb-9c72-7326520785a6	f
c9f45c5a-c9c2-485d-978b-9b3aacdda522	965df560-c79b-467a-bf22-ef030dde9fce	f
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	e2dabb64-0bff-4a25-876d-a421fd1d54f9	t
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	6ff0a578-8421-4f55-b0a7-62e9212d0223	t
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	a0b084e2-ce1f-4596-8b2d-e6be1845967a	t
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	5551baf4-77e4-4981-a6d6-cda458597cf6	t
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	14b41792-e9c3-4607-a5c9-7a82c1648653	t
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	aa26d985-8993-4b65-83a9-d49cc8585342	f
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	d583a1e3-e18b-42e6-80d1-ee0cdda065ae	f
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	1d895be4-0c51-4fcb-9c72-7326520785a6	f
cdba24af-66dd-48f5-bcb9-3d4ac4c146be	965df560-c79b-467a-bf22-ef030dde9fce	f
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	e2dabb64-0bff-4a25-876d-a421fd1d54f9	t
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	6ff0a578-8421-4f55-b0a7-62e9212d0223	t
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	a0b084e2-ce1f-4596-8b2d-e6be1845967a	t
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	5551baf4-77e4-4981-a6d6-cda458597cf6	t
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	14b41792-e9c3-4607-a5c9-7a82c1648653	t
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	aa26d985-8993-4b65-83a9-d49cc8585342	f
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	d583a1e3-e18b-42e6-80d1-ee0cdda065ae	f
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	1d895be4-0c51-4fcb-9c72-7326520785a6	f
dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	965df560-c79b-467a-bf22-ef030dde9fce	f
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	e2dabb64-0bff-4a25-876d-a421fd1d54f9	t
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	6ff0a578-8421-4f55-b0a7-62e9212d0223	t
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	a0b084e2-ce1f-4596-8b2d-e6be1845967a	t
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	5551baf4-77e4-4981-a6d6-cda458597cf6	t
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	14b41792-e9c3-4607-a5c9-7a82c1648653	t
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	aa26d985-8993-4b65-83a9-d49cc8585342	f
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	d583a1e3-e18b-42e6-80d1-ee0cdda065ae	f
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	1d895be4-0c51-4fcb-9c72-7326520785a6	f
76fb6f0f-36ae-4417-8fcb-a34afff31e6f	965df560-c79b-467a-bf22-ef030dde9fce	f
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	e2dabb64-0bff-4a25-876d-a421fd1d54f9	t
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	6ff0a578-8421-4f55-b0a7-62e9212d0223	t
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	a0b084e2-ce1f-4596-8b2d-e6be1845967a	t
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	5551baf4-77e4-4981-a6d6-cda458597cf6	t
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	14b41792-e9c3-4607-a5c9-7a82c1648653	t
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	aa26d985-8993-4b65-83a9-d49cc8585342	f
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	d583a1e3-e18b-42e6-80d1-ee0cdda065ae	f
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	1d895be4-0c51-4fcb-9c72-7326520785a6	f
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	965df560-c79b-467a-bf22-ef030dde9fce	f
dafc5509-1e81-45a5-bd98-6d6181a5d07b	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	t
dafc5509-1e81-45a5-bd98-6d6181a5d07b	3739025a-6c5c-452d-bf07-470f5b91aa92	t
dafc5509-1e81-45a5-bd98-6d6181a5d07b	365e0845-dce5-4776-a0e6-500d21cd3ca5	t
dafc5509-1e81-45a5-bd98-6d6181a5d07b	e6307b01-1269-480e-93bf-5a01f85cd21e	t
dafc5509-1e81-45a5-bd98-6d6181a5d07b	c25849e6-0940-4ea8-8077-43f091af2a16	t
dafc5509-1e81-45a5-bd98-6d6181a5d07b	7e40abff-7bec-404f-8fc8-ca019be62311	f
dafc5509-1e81-45a5-bd98-6d6181a5d07b	d87c24c2-e2a2-4c5c-bc01-57156f1b993b	f
dafc5509-1e81-45a5-bd98-6d6181a5d07b	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	f
dafc5509-1e81-45a5-bd98-6d6181a5d07b	c6a99be1-5c93-47b2-add2-ee3648afe730	f
8bc25416-0142-4f4e-8a69-838bee9f6b0a	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	t
8bc25416-0142-4f4e-8a69-838bee9f6b0a	3739025a-6c5c-452d-bf07-470f5b91aa92	t
8bc25416-0142-4f4e-8a69-838bee9f6b0a	365e0845-dce5-4776-a0e6-500d21cd3ca5	t
8bc25416-0142-4f4e-8a69-838bee9f6b0a	e6307b01-1269-480e-93bf-5a01f85cd21e	t
8bc25416-0142-4f4e-8a69-838bee9f6b0a	c25849e6-0940-4ea8-8077-43f091af2a16	t
8bc25416-0142-4f4e-8a69-838bee9f6b0a	7e40abff-7bec-404f-8fc8-ca019be62311	f
8bc25416-0142-4f4e-8a69-838bee9f6b0a	d87c24c2-e2a2-4c5c-bc01-57156f1b993b	f
8bc25416-0142-4f4e-8a69-838bee9f6b0a	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	f
8bc25416-0142-4f4e-8a69-838bee9f6b0a	c6a99be1-5c93-47b2-add2-ee3648afe730	f
1ded6cd4-0c53-495c-af36-34003ea1ac40	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	t
1ded6cd4-0c53-495c-af36-34003ea1ac40	3739025a-6c5c-452d-bf07-470f5b91aa92	t
1ded6cd4-0c53-495c-af36-34003ea1ac40	365e0845-dce5-4776-a0e6-500d21cd3ca5	t
1ded6cd4-0c53-495c-af36-34003ea1ac40	e6307b01-1269-480e-93bf-5a01f85cd21e	t
1ded6cd4-0c53-495c-af36-34003ea1ac40	c25849e6-0940-4ea8-8077-43f091af2a16	t
1ded6cd4-0c53-495c-af36-34003ea1ac40	7e40abff-7bec-404f-8fc8-ca019be62311	f
1ded6cd4-0c53-495c-af36-34003ea1ac40	d87c24c2-e2a2-4c5c-bc01-57156f1b993b	f
1ded6cd4-0c53-495c-af36-34003ea1ac40	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	f
1ded6cd4-0c53-495c-af36-34003ea1ac40	c6a99be1-5c93-47b2-add2-ee3648afe730	f
858761b0-4802-4e35-a222-e44a0279baba	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	t
858761b0-4802-4e35-a222-e44a0279baba	3739025a-6c5c-452d-bf07-470f5b91aa92	t
858761b0-4802-4e35-a222-e44a0279baba	365e0845-dce5-4776-a0e6-500d21cd3ca5	t
858761b0-4802-4e35-a222-e44a0279baba	e6307b01-1269-480e-93bf-5a01f85cd21e	t
858761b0-4802-4e35-a222-e44a0279baba	c25849e6-0940-4ea8-8077-43f091af2a16	t
858761b0-4802-4e35-a222-e44a0279baba	7e40abff-7bec-404f-8fc8-ca019be62311	f
858761b0-4802-4e35-a222-e44a0279baba	d87c24c2-e2a2-4c5c-bc01-57156f1b993b	f
858761b0-4802-4e35-a222-e44a0279baba	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	f
858761b0-4802-4e35-a222-e44a0279baba	c6a99be1-5c93-47b2-add2-ee3648afe730	f
3719c483-0a4f-4bad-a087-c0b8d8fffc65	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	t
3719c483-0a4f-4bad-a087-c0b8d8fffc65	3739025a-6c5c-452d-bf07-470f5b91aa92	t
3719c483-0a4f-4bad-a087-c0b8d8fffc65	365e0845-dce5-4776-a0e6-500d21cd3ca5	t
3719c483-0a4f-4bad-a087-c0b8d8fffc65	e6307b01-1269-480e-93bf-5a01f85cd21e	t
3719c483-0a4f-4bad-a087-c0b8d8fffc65	c25849e6-0940-4ea8-8077-43f091af2a16	t
3719c483-0a4f-4bad-a087-c0b8d8fffc65	7e40abff-7bec-404f-8fc8-ca019be62311	f
3719c483-0a4f-4bad-a087-c0b8d8fffc65	d87c24c2-e2a2-4c5c-bc01-57156f1b993b	f
3719c483-0a4f-4bad-a087-c0b8d8fffc65	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	f
3719c483-0a4f-4bad-a087-c0b8d8fffc65	c6a99be1-5c93-47b2-add2-ee3648afe730	f
df064836-2d23-4b64-8386-52943fbdf40b	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	t
df064836-2d23-4b64-8386-52943fbdf40b	3739025a-6c5c-452d-bf07-470f5b91aa92	t
df064836-2d23-4b64-8386-52943fbdf40b	365e0845-dce5-4776-a0e6-500d21cd3ca5	t
df064836-2d23-4b64-8386-52943fbdf40b	e6307b01-1269-480e-93bf-5a01f85cd21e	t
df064836-2d23-4b64-8386-52943fbdf40b	c25849e6-0940-4ea8-8077-43f091af2a16	t
df064836-2d23-4b64-8386-52943fbdf40b	7e40abff-7bec-404f-8fc8-ca019be62311	f
df064836-2d23-4b64-8386-52943fbdf40b	d87c24c2-e2a2-4c5c-bc01-57156f1b993b	f
df064836-2d23-4b64-8386-52943fbdf40b	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	f
df064836-2d23-4b64-8386-52943fbdf40b	c6a99be1-5c93-47b2-add2-ee3648afe730	f
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	t
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	3739025a-6c5c-452d-bf07-470f5b91aa92	t
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	365e0845-dce5-4776-a0e6-500d21cd3ca5	t
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	e6307b01-1269-480e-93bf-5a01f85cd21e	t
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	c25849e6-0940-4ea8-8077-43f091af2a16	t
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	7e40abff-7bec-404f-8fc8-ca019be62311	f
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	d87c24c2-e2a2-4c5c-bc01-57156f1b993b	f
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	f
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	c6a99be1-5c93-47b2-add2-ee3648afe730	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
d583a1e3-e18b-42e6-80d1-ee0cdda065ae	7a13270b-36d7-4cb2-bf6b-6b6dbcedfcc5
c6a99be1-5c93-47b2-add2-ee3648afe730	6dd58860-5a3a-43f0-840d-1663dd08a596
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
e23b422a-7acc-47c4-8a47-63928129e4fb	Trusted Hosts	f0fbc87d-9020-46ea-b572-7f7ccc131e82	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	anonymous
0c18f5aa-beca-4716-96f7-f766bb360c67	Consent Required	f0fbc87d-9020-46ea-b572-7f7ccc131e82	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	anonymous
17125e10-9582-4607-97af-d0e7a79c2559	Full Scope Disabled	f0fbc87d-9020-46ea-b572-7f7ccc131e82	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	anonymous
929d964f-9bcc-4e65-8566-e5fda010db0a	Max Clients Limit	f0fbc87d-9020-46ea-b572-7f7ccc131e82	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	anonymous
bb6e3633-6d09-4b73-a3e8-c2b6dd56926a	Allowed Protocol Mapper Types	f0fbc87d-9020-46ea-b572-7f7ccc131e82	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	anonymous
bd35f0e5-13bd-4e83-bb45-52495a0056dd	Allowed Client Scopes	f0fbc87d-9020-46ea-b572-7f7ccc131e82	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	anonymous
e6596633-5491-41af-a577-0c31def425cf	Allowed Protocol Mapper Types	f0fbc87d-9020-46ea-b572-7f7ccc131e82	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	authenticated
1e75b765-2df5-4da1-b74b-eb327008825b	Allowed Client Scopes	f0fbc87d-9020-46ea-b572-7f7ccc131e82	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	authenticated
0b204762-2903-4ff0-aea6-221888717a8d	rsa-generated	f0fbc87d-9020-46ea-b572-7f7ccc131e82	rsa-generated	org.keycloak.keys.KeyProvider	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N
f121d9ca-f07a-4cb0-a4f2-883b6fc4b0dd	rsa-enc-generated	f0fbc87d-9020-46ea-b572-7f7ccc131e82	rsa-enc-generated	org.keycloak.keys.KeyProvider	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N
def65697-6a0a-4dc7-98b9-0890ba2b639e	hmac-generated	f0fbc87d-9020-46ea-b572-7f7ccc131e82	hmac-generated	org.keycloak.keys.KeyProvider	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N
a2633764-1e50-4d93-b1c7-232638a7f7b3	aes-generated	f0fbc87d-9020-46ea-b572-7f7ccc131e82	aes-generated	org.keycloak.keys.KeyProvider	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N
e5d42491-ef97-4d37-b42a-4b670946dbb9	rsa-generated	bbfb0c95-df74-4043-af21-ff214ec2b0a0	rsa-generated	org.keycloak.keys.KeyProvider	bbfb0c95-df74-4043-af21-ff214ec2b0a0	\N
a0561366-9f80-4f98-97c8-48f81c49520b	rsa-enc-generated	bbfb0c95-df74-4043-af21-ff214ec2b0a0	rsa-enc-generated	org.keycloak.keys.KeyProvider	bbfb0c95-df74-4043-af21-ff214ec2b0a0	\N
38963a48-3aea-4a18-b261-020d512b959e	hmac-generated	bbfb0c95-df74-4043-af21-ff214ec2b0a0	hmac-generated	org.keycloak.keys.KeyProvider	bbfb0c95-df74-4043-af21-ff214ec2b0a0	\N
51a6d94d-f31b-45fb-bb22-52a466312635	aes-generated	bbfb0c95-df74-4043-af21-ff214ec2b0a0	aes-generated	org.keycloak.keys.KeyProvider	bbfb0c95-df74-4043-af21-ff214ec2b0a0	\N
ad46bcb7-427e-4f1f-a084-909f93633841	Trusted Hosts	bbfb0c95-df74-4043-af21-ff214ec2b0a0	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	anonymous
657d2359-4cce-4f4b-ad65-707e9a35cd04	Consent Required	bbfb0c95-df74-4043-af21-ff214ec2b0a0	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	anonymous
4cf01a22-5a84-4810-83f5-cc474d296d25	Full Scope Disabled	bbfb0c95-df74-4043-af21-ff214ec2b0a0	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	anonymous
3f708038-1593-47b0-ba7b-864909a22f74	Max Clients Limit	bbfb0c95-df74-4043-af21-ff214ec2b0a0	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	anonymous
e91aebdb-c701-43e6-b6d7-85b71a579dd3	Allowed Protocol Mapper Types	bbfb0c95-df74-4043-af21-ff214ec2b0a0	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	anonymous
9d39db50-6eca-43df-a577-31645505af4b	Allowed Client Scopes	bbfb0c95-df74-4043-af21-ff214ec2b0a0	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	anonymous
69d288de-7107-4502-9e05-e12f4add5891	Allowed Protocol Mapper Types	bbfb0c95-df74-4043-af21-ff214ec2b0a0	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	authenticated
c6259062-9e76-44ad-8835-54df7814cae5	Allowed Client Scopes	bbfb0c95-df74-4043-af21-ff214ec2b0a0	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
0f5f2a81-dd84-4c5c-95d2-acfd2d052744	bd35f0e5-13bd-4e83-bb45-52495a0056dd	allow-default-scopes	true
5b3141cb-a3db-4087-8451-23bd042bc8aa	929d964f-9bcc-4e65-8566-e5fda010db0a	max-clients	200
add165cb-7ae8-4c97-8b27-66164c8e8182	e6596633-5491-41af-a577-0c31def425cf	allowed-protocol-mapper-types	saml-user-property-mapper
79120d95-c195-43e0-81b2-2451f2c82879	e6596633-5491-41af-a577-0c31def425cf	allowed-protocol-mapper-types	saml-user-attribute-mapper
93a9e639-cea0-4a71-a6e8-452265e2353d	e6596633-5491-41af-a577-0c31def425cf	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
a60b434d-be38-4666-abc8-63343eaf3206	e6596633-5491-41af-a577-0c31def425cf	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
1239e9ac-fb6d-4f89-8305-51bc39c4ba6b	e6596633-5491-41af-a577-0c31def425cf	allowed-protocol-mapper-types	oidc-full-name-mapper
953cd3c2-dbb5-4d77-836d-e7d302419529	e6596633-5491-41af-a577-0c31def425cf	allowed-protocol-mapper-types	oidc-address-mapper
a09f721f-bcb9-4000-a157-d44ca9eb8967	e6596633-5491-41af-a577-0c31def425cf	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8bf31615-ba2c-49af-bb19-2b7bfa419da2	e6596633-5491-41af-a577-0c31def425cf	allowed-protocol-mapper-types	saml-role-list-mapper
4d6220b3-30cb-4d59-8a0f-369c1c0db46b	bb6e3633-6d09-4b73-a3e8-c2b6dd56926a	allowed-protocol-mapper-types	saml-user-property-mapper
97157138-edc8-4801-a161-3273f683e3a2	bb6e3633-6d09-4b73-a3e8-c2b6dd56926a	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
7038aeda-7623-439d-a3c5-ae023c7f104b	bb6e3633-6d09-4b73-a3e8-c2b6dd56926a	allowed-protocol-mapper-types	oidc-full-name-mapper
20adb3a8-952e-46bc-a2d9-14574519391e	bb6e3633-6d09-4b73-a3e8-c2b6dd56926a	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
3f95af8f-03da-4ecb-8a6d-8671efef0476	bb6e3633-6d09-4b73-a3e8-c2b6dd56926a	allowed-protocol-mapper-types	saml-role-list-mapper
5c814aa7-a659-4662-9df8-daffcd78dd9f	bb6e3633-6d09-4b73-a3e8-c2b6dd56926a	allowed-protocol-mapper-types	oidc-address-mapper
48db8d96-5bb0-4699-a4fc-e74ac3b4ee2b	bb6e3633-6d09-4b73-a3e8-c2b6dd56926a	allowed-protocol-mapper-types	saml-user-attribute-mapper
03234640-db83-4a42-986a-be0d6f8a1863	bb6e3633-6d09-4b73-a3e8-c2b6dd56926a	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
93795b40-3a85-491b-a3b8-1d33fa509c11	1e75b765-2df5-4da1-b74b-eb327008825b	allow-default-scopes	true
3f9711c8-2ffc-44ba-8da8-50002a5f74e6	e23b422a-7acc-47c4-8a47-63928129e4fb	host-sending-registration-request-must-match	true
0105bbd0-cb9a-456e-a1ed-b2c617685dd6	e23b422a-7acc-47c4-8a47-63928129e4fb	client-uris-must-match	true
20633cab-f6ec-4575-a86e-4d6cdad78e04	def65697-6a0a-4dc7-98b9-0890ba2b639e	priority	100
bc16a60f-ec62-429f-8bfa-7ac2ee73df69	def65697-6a0a-4dc7-98b9-0890ba2b639e	algorithm	HS256
ef827382-70a5-4364-8cf2-0109a7f0314d	def65697-6a0a-4dc7-98b9-0890ba2b639e	secret	nGOlWrhOGZIPD4JIH5tPZAZel4169TgQG5v5w-4RPm5RosuhAxTY2SuW9vElombFK0R5Luc9ainDzdhpvVTM2w
252fe2b0-df17-4aa9-bc18-356345507175	def65697-6a0a-4dc7-98b9-0890ba2b639e	kid	85a19ce0-a755-48d5-8e53-33079294bd56
016b0794-1879-4a48-a279-9c1469c336d6	f121d9ca-f07a-4cb0-a4f2-883b6fc4b0dd	certificate	MIICmzCCAYMCBgGMaBIsPjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjE0MTEyMjUwWhcNMzMxMjE0MTEyNDMwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDArG3BJI/NscJVSWuVF6OnoMPnF/0moRfynN0p+58pcPRPE7/M5E+s5LbKga2MdLFkOR/BcTo3mBKemAPLEVBsw7RJchBiJcxOP5OaaVqifVTTPEog9b38070Z8hqxA87J2vjHxyIzhfoGYC0BFExUZ8CUzgCLNxT1WqbvctpwrWQxLq+saSAUlTX2LPRCv6xCVWUtIsSDdYY7YTMZQz3FgPEMd+mQ6AycGtJmkxmWw3afnyPcGEKYrbA7t2miFrIP/zxt7d/rReuuZJmGbjVCNWUrHFOXFzUTah+cottkdUJ76wF5tP+IE9iW0UKPu/G6+rSZ259o1EEPGNrRb5kfAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKEGkgt9kbsg39ztlO4LT881vjkgU6Xj4+ghlHuCE0vALvjmg9o0+gzxaUpUwZjmGfDNceZqQGNBDEw+TTMjlUdofRXBwsSwyq4cUzbqpkuLqu1PzX627thrj9pzgWN6wLV629ZfALmVJm0rg2Lya7gAKbLbjpDhVPVDALjbAirF6fKH6WssjakBfzMceFrNixelpng7/wA2POXpGzbeC+tLnwe+yfQRltZM3RawQNmzC1E5IztgNBasQcJRS8+tdLUah6p5EIK/00OgshwxJUvA2r5jLEPRGxF5XoPiG1K5MKKzL+1kp+fy0zDMFSgejR7W+Zj6/TunAqqNcO7TVZE=
282c0046-71cf-4a26-a38d-1b9b62f4550c	f121d9ca-f07a-4cb0-a4f2-883b6fc4b0dd	privateKey	MIIEpAIBAAKCAQEAwKxtwSSPzbHCVUlrlRejp6DD5xf9JqEX8pzdKfufKXD0TxO/zORPrOS2yoGtjHSxZDkfwXE6N5gSnpgDyxFQbMO0SXIQYiXMTj+Tmmlaon1U0zxKIPW9/NO9GfIasQPOydr4x8ciM4X6BmAtARRMVGfAlM4AizcU9Vqm73LacK1kMS6vrGkgFJU19iz0Qr+sQlVlLSLEg3WGO2EzGUM9xYDxDHfpkOgMnBrSZpMZlsN2n58j3BhCmK2wO7dpohayD/88be3f60XrrmSZhm41QjVlKxxTlxc1E2ofnKLbZHVCe+sBebT/iBPYltFCj7vxuvq0mdufaNRBDxja0W+ZHwIDAQABAoIBABojimRIjIXQVtfxNPouEdK8+bbRR1PFSRVt+Icojsg1fb94o22tj62Z/b5tZ1kFv8ckBM3eiZJfPC9t2h3jhHCtADlykwxtqlD3SRQKtPQUYryhkkD0dcjmBOKPONXI+XXjEhswRdCNnYTd6V0bHtvYk4TcibBZUauTl9AmWcItV2erdckZX2j42583+aNYa/iz2TScLtMG5KajfrY8uECScObFK3/TfNWhiK7AiucmKz2nxc19Dlm/S1bqbU5iTHcZxxYaWktFkX/JyacVwVPR4NiqjkAOR2jKoPoCHurxGZpIoBmQ7r/uIg6z1L2bkblYsXq/dguPM45U50VSe5ECgYEA7KM90Up80mtvOAEAeZWaKb6oD5jhMhe/5nQEOVQIFlY5rVY4n82hxicZwJsO1eU+CsGhUwkiAbAuo509lF7IZiB2UYWUN+Zcr4fm4t7JMjaX0PB7liK2wnauLCS+IhOnnamp17V32jRMkhyQAKUIvgYHUDNdE8rtIfZ/VZk5iMkCgYEA0HBJrra24JxxYlt1apm8+0TxJRQHbRHpZ0zQts4k/317c+8ysqCqXrnspWjHRqsDCOGed+c8g3Rw94lR1T1UB+LNH4uCKCjZUaYJWP6PNB8EJl4Pid5SAknATjS+uBNjEI3knGL5gGdrMfPow2pyQ4umO0ViRsWSnDdATUSZbqcCgYEA6bO+VXhPFjDsQk8a/Pj2q8uThvPhU+uIpjxl/4gyBH1bsQi6G3imEGCFWmbInA4u28inXq5iW3B4XzXnnySMne/palGWNC7Z0rFRITYNVf38qWkXZQsbm6pCEW6oKFdo7pilGFgr6eBEzvhOb5SNsb2ac2aGwgljcGtVDmCpJaECgYAKi+PuhygxrTi/dUk3n5fETvS0n5LQnftlUqms1jlhBARfFVdHWoHEUTv8EpUiqjx5EpFmF7kkHZwpqjUNyRCbZYpjcjefuJFmZDRM4HR2eqtHFbNLkogrvXeRfXG49qIokEVk9E0ThigSWvkICjbF3CcJELWsRwroBJOoVTQ+OQKBgQCUFFIBvenDjge/YhOUk/tRNPM5ZiGl3VReoH6bp15XkmRvQu0/ivg+BK+e+dwA+cisGAGh+0WGQGRh8P2r7RI6StsRP8QqAMcOV/Lkn40mGZRjIxJ5KZhiRCM28BgJuxKs2CIzwxc+7xtotvnhAKXeiYQR4BjASbCScCoU8Q/O8A==
9d0b4ce9-b915-4c43-b013-4b19e6f8f8e1	f121d9ca-f07a-4cb0-a4f2-883b6fc4b0dd	keyUse	ENC
45b12841-8105-46d8-8fb4-c10457f25829	f121d9ca-f07a-4cb0-a4f2-883b6fc4b0dd	algorithm	RSA-OAEP
4fbe42c4-92b8-459e-86f4-1a6c68e70edf	f121d9ca-f07a-4cb0-a4f2-883b6fc4b0dd	priority	100
bad94ea3-e8e3-4900-90e7-73ffce525537	a2633764-1e50-4d93-b1c7-232638a7f7b3	kid	8aa41a45-57b4-4bb1-999e-c69ed9a84fa2
fb34ec12-7ff9-4790-abbf-b21ec509d700	a2633764-1e50-4d93-b1c7-232638a7f7b3	priority	100
d5d7d6fd-7965-46c0-84a9-dc06463c7147	a2633764-1e50-4d93-b1c7-232638a7f7b3	secret	-HECl7ZNinUXUwcxKFtBLA
b729a478-911c-4af3-9c6e-f926cca7b756	0b204762-2903-4ff0-aea6-221888717a8d	priority	100
fd4c8a3b-553e-445b-9893-dd67f2139101	0b204762-2903-4ff0-aea6-221888717a8d	keyUse	SIG
d0ed5384-2850-4c3a-9045-147ec9792d74	0b204762-2903-4ff0-aea6-221888717a8d	privateKey	MIIEpAIBAAKCAQEAzeVGCkJh56OOLJOhH5GQXqyCOsERGajDn1xBnk2ic1N+ttMFb45m7u38YdW198uZQNSiyvvCahiVVJwKrCS2/MFYxF/HFPE6HV02hrq29QAlcUnmNlfQGZ35otr0ai7/QO5Y+DYtKbofMfwaUtNCm4ejhJZJHS5Rkqru3o7XiUh+P296NJE+PlOxWN91O62Tj45OfMJ3JobqnkaK9JZMa70p4xn1DJOYhKE7OBEUbEqx5KlGo84ghBHnmqTEZEC0G1nbEulgnvJkNB4U3vfZFQs/w5FlbxYEpedlvfQeOwPGqbCFDU33S5HYE2G10399i10Ovv8aV8nJe603XgJBOQIDAQABAoIBAAh5G/XGH5NRxsMM3D+ZVPCgdseGNHby3AIN4OFr3niSgg9yBbI+kPvaLV21VsS4yzjAx2ZFEA4frt2JgmLtK96g8k86hc3V04dr05edzXOtqtzLpr6rxHOZbbGHAzHvdy+r31tvl1I1R51d+5NXAFG4NkF5kc6ynkbD5AqipDoQ/7PMIiMEF9YbHT3EE0cw1Jg+ZDU/t3HEApJQZ0hDKHtSwfsRux6T60DCmcsTxxeu8gx+Bf+EsYLd0ZDsCBOIuRo7q40hjErH7ZapznaBPv3AhpuysO8aPJ5SyppKvVEDR0Jr7tc+TFix/udaww8McjVEsKbp/ZrRCCUHFGYhRxECgYEA+OqJeoS6T3ry2nINSrBBs+Yga84alWTDnqDha42bdJfEVRpQo/mp2cel/9IyKVUaDjbTfVOElc2Rp7zEXkA1v0pX84czDPPDP8AA0sj6Z823jM0RR3tQdxezDlWQ83VgO6GKWf97+yCPLgEOTbQtRHOFeiKk0HUBpAUM+h6HMSUCgYEA08FQIDr4jGgqIeZpRm0JXeYVqWJxJFhbtPDeLzDVX7VKPnJvsaxlQJ6e6r8KqRPE7iZgg2afcSBOR8ULrsvJNgfkmDYVrnnmTbARAF8bM0u9N1r+HHP+JuS7nB9EKlIoyQsSx4+QJjfjGA0KwOQLAilRLlMDYycorxeW5YWQBYUCgYEAxv9qTYLTGDuo768CpVVoEZTHEqjBY/Ic2jKwRLX/NCUpFwhks9MjUTJlqbG33Idmvzphte4RL1obOkiVjOw0i+u5iL3ruE0hKVQs1FdMqbQzK+O+DrGtUKinw6vwqFKMTuAEpZK04b3T+elqMAD9t53LditALE9+skw/Za8GUekCgYBu4YHgbqCpfP3a5HjpvLyz44AiQv71xiK3O41Mbqi8RgTLcEbWZWxbivOx/jlJ0aVEAup0w+7nYMA8yoxUijchSL7FiUSPKRuUQIaWiDaJBLbe3pHDOmWx3gHzPVgHRSBALcE2qBEWQhtzA5lG6eJtzk7JEATtDZs7HAISy35ftQKBgQDYLjeUQLnbImLqhR+6LNGV+tPuWiHf1SD9cBKES5ffvGFG5+UUfLXh5dQZNlXMov7JSVtuNUyD7ry/YGmLio34KBWQUnwnKZh4yQAMnMaQNHRziBq/nalHqs3VLfakR34CfiQDnGnrRYDsNq1/M3Pj5lw4Ha6ApmpWAmDIdgWmyA==
ff7eef4c-c218-4c37-b488-6bcba69c3fe6	0b204762-2903-4ff0-aea6-221888717a8d	certificate	MIICmzCCAYMCBgGMaBIrOzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjE0MTEyMjUwWhcNMzMxMjE0MTEyNDMwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDN5UYKQmHno44sk6EfkZBerII6wREZqMOfXEGeTaJzU3620wVvjmbu7fxh1bX3y5lA1KLK+8JqGJVUnAqsJLb8wVjEX8cU8TodXTaGurb1ACVxSeY2V9AZnfmi2vRqLv9A7lj4Ni0puh8x/BpS00Kbh6OElkkdLlGSqu7ejteJSH4/b3o0kT4+U7FY33U7rZOPjk58wncmhuqeRor0lkxrvSnjGfUMk5iEoTs4ERRsSrHkqUajziCEEeeapMRkQLQbWdsS6WCe8mQ0HhTe99kVCz/DkWVvFgSl52W99B47A8apsIUNTfdLkdgTYbXTf32LXQ6+/xpXycl7rTdeAkE5AgMBAAEwDQYJKoZIhvcNAQELBQADggEBACAdRYPKNhFY2qSfPb7JgN+pVQwWxzTcxz8UvCSTtZoh5XO4Gsrhcnx3RaYD8LPW+oHAGE4N/kQzLxdSwEqEcXTeCxJHVwwl6u60MU/sT86n1aRieZQmNlxYed0DqA+P0OOG5m4N7tHOi9XagtiANankc+rikgA7rhyjAprdj1UVSVrrQwdR4whrvMIjh7pAZcoy+8rHtidt3U8uiAahmyAyruzVHyuyHggbMoaRUzafIbQ0qFN5cvnIsrcD7FcGYyPfXT1hCTtlFFDXvzYg2wHHyCtnO7srrmAGyoP+/yfnEl6Yec1A9xh1OZ0c6DtyRwLfEXVZrjh3IWKCwU/zhbA=
1e7a6f7c-c51d-476e-a6c3-d7be861072dc	e5d42491-ef97-4d37-b42a-4b670946dbb9	privateKey	MIIEowIBAAKCAQEAtkKcvs1Y+Ot0VjlEHz35CeLP43+70NnDI40yRvFr7Q6oRqEoHHDZzKb5OYGwQzsLTe3FM/N8/Dd/NC4kgWpUtcAB4tV3j8FcbaAPyQ+QCS5rFaGQneYY9RatxABSd5GEJSC1WzHr5C/Y0U8uxOYUR3+2K9qsUpbmOfpZAlrlJ90aaz4fKJEIRiFLiywsuiBlzui0zmwsV75kR4HwX+v3ppeyKJduda7QyNUHr9yiCSEE29oNu9VD4/XCj/atL81Ho4l5DJEr17pC7ZK42mGrwKzD2+wCK9HZvkcceObVS592XYNovwcH9SKM3rrRdo32bweVXGcDTsBfng/ojLJp5QIDAQABAoIBAAhSocpbiADgU6QtiK0g83KrOLelTH2cuOEybR85nnMpThYUY64EzNVTf9VlIctRv2u0FcmQO8VfgJk9gC11HkaPn/M5SnS2LWyhUgc262qX6ljtbOd6keowBzuIXjuw8yCOgU/94ObYwbH9+sWpntE/0jq0PIlBWpfY+3nBjjq6aJdECeIyvt837s6EWqv+VDctcoc5nQcrEaHnaYu3aOwP2LDMSSr2larcODePi1f3R5KuTbvtq9/TlbtC6jMO2qy4ZLqRia6nNsJHXyaqu+pOo+QZnd0QBKAEJSD/m8GmJzzQJGaUSgsKSqP0AK3xRqnQbzGDDnVIhZi3/d6dw4ECgYEA+SavA18stGQG0DCRb3eMBLoG90/DPeE0/YY/gQ9hgnuXFHPnH5aTOpVVFdEay7Isw4LHxaiJwbyM0Xh0NyX3yunjbSc4nNt7JSkkwBVroYzu+q8wYDOBg1+2iIs8l1IlEhPVacmmllYz/eVMZKpQEjrzeTt4br+iUrFn+xKER0ECgYEAu0U05GvMaJZbJiitXwYEI25ndUqjeCtWZJfRw42sLvMLOiyr1CHk4VzVpGfMReBXHuu+KtWlDZHTt96CZWCTs/hWDWv5VoUqIcVx5UM661xiy6bpQ32+NTpKByYnRfwe2K2t7SNssQNax1eknwyxSVB2H2airGEDId69R6D2PaUCgYA3G/daJ5Mb04QuSI/it+6gnQUtbtcguM+fxDIHuf83fV7Nh1V4BzZJnv5S9Q2YQLDmDediMQVHdQ0wyBPsntlQaKuFWUeMan+ymIcodZR5B1NU36sznDDpfiJB0Yp1bhYFCZ4K6C+Q0UBuyGk9Wu6bGa8BAcaBuKGO6O62+kGIAQKBgQCYbdx/kL7w4nGOvc1gayUzMcpETlyAk8XeWzUCV26vSGT7FSFHqc8DIO1ExLggqFpBcOF5PCz8vpX2M8cvfUy8UIa6pghtxDZnBq+OTQrISIqh+Vok9VS9PpTC/Os6q9zvwW6wdwUhj/l0CIKWc15aroN3S7NdXBmQmBy5EOtdgQKBgFW11J3fI0/Ug/A1pPW5vjh4T4IQgOcQto8iKLAsP2CY5j+9Nq9/OPNd5fhBKpE2dn+7Yr8euIy5BvNziUW9Gpi+JxR0BHNHAXF8qCf5qLAgIV7EIkpjtlWYc7YI3OYKMxAmaPRCurQRYXyBa5qzYyXhTFOxVrkDPM5cNgIoDaDh
625efc7b-ad1b-4e8a-b589-aa6442acb217	e5d42491-ef97-4d37-b42a-4b670946dbb9	keyUse	SIG
ede033cd-b7ce-4b2f-8bca-a34b7fcb8172	e5d42491-ef97-4d37-b42a-4b670946dbb9	priority	100
a674d64d-1220-4a2b-b76c-ba7fe95f5440	e5d42491-ef97-4d37-b42a-4b670946dbb9	certificate	MIICoTCCAYkCBgGMaBMRkzANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAliZWF0YnVkZHkwHhcNMjMxMjE0MTEyMzQ5WhcNMzMxMjE0MTEyNTI5WjAUMRIwEAYDVQQDDAliZWF0YnVkZHkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC2Qpy+zVj463RWOUQfPfkJ4s/jf7vQ2cMjjTJG8WvtDqhGoSgccNnMpvk5gbBDOwtN7cUz83z8N380LiSBalS1wAHi1XePwVxtoA/JD5AJLmsVoZCd5hj1Fq3EAFJ3kYQlILVbMevkL9jRTy7E5hRHf7Yr2qxSluY5+lkCWuUn3RprPh8okQhGIUuLLCy6IGXO6LTObCxXvmRHgfBf6/eml7Iol251rtDI1Qev3KIJIQTb2g271UPj9cKP9q0vzUejiXkMkSvXukLtkrjaYavArMPb7AIr0dm+Rxx45tVLn3Zdg2i/Bwf1IozeutF2jfZvB5VcZwNOwF+eD+iMsmnlAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAD9x/0hqXfaI6JBWEsXXtAD2CrGXpcy1WPwzKIXo11dxKP07wGI9RmkQhHbIkfV0F7IewWdKleb5Fm+JiaUH4/K/po+LmYsjeadh1C5gblKH2tGJt8/+GYc+24qfEfFXuEns3h/+AkXBdVVSBIG+9J94Sj3eL3kQZu4NNqajGH/Dr1gI4sGxrU7orTt51OIChJm67HJIuhqjrD/hA1WcWw14XMqVfqYeW/5FkpW8wl/QKB0JHAxGLY0sXe1n2Pa+37lEeWMruFIrnW4GyUzFU/OTB9oad372fNrSrcmFrRq/up7lODRc70B/Rq9Xwokwd8X0SFOwvWK2Cp4P1aEANXY=
dd2b13fb-e68c-42d1-82d0-29de1ed9827f	a0561366-9f80-4f98-97c8-48f81c49520b	priority	100
a930755f-4507-444c-92f0-a6333755ed18	a0561366-9f80-4f98-97c8-48f81c49520b	privateKey	MIIEowIBAAKCAQEAqxRVAY0MjSlxVxOFXNqrsE6vHmWyHAatLYs9mbc9Wr5nPtcnre4QliAsEMTH7pTOYLAtJCdixhdc0PHj3xk9qK5/oLuiK2EgBovjeHStdXBCrkvO3L5UNHdAhxDK4hAf49zCWSs98MZG4U6I72pJPnLEjiW8K4eyUOzTcUpH8YNlWibDH3+DH+FRIG6poHPJ47N+dnlBqR63M2JaUgby7s0gT4jxGcO2BfXAhOMLlQV8/Zn6mYzI70B8VRCFMr7c5oTa0Rl7RQqHjS6egvafk1uCMqLAFhqrl/dr+0dzZBPGRJQolSHVH6oBgMZ5w0Qg1m75iQqHd428N5+ZqIOtFQIDAQABAoIBABbMqN+CCrAtW7t9EILlaYgflFr6tpfhk+bD7bu0neqgAWZwigs19OPs+bJqZzK2hiKAmCN/VDyOFIKMGhA7buoyBzRGjUA2u2vj7La65fsGsPxFghYND2/GjMTzSfaCq51UaFo11xVld0DDlKBDi+tUpDlFciRi+zKpvSwV+CyJXEHhEpBWkEBmQRZZJi/Ifdj5MBKFJmKEUcHH9dBV/S570AWib2NYaj+l3o0+MGkDdnIMoARSYoHuY2lAQnS1x0xfYDkKiNrOpqnB5vNT2QtqODibft//vsi8IaaoAk9sg3DSxD26zgMLkthajOxP3R1DHwcR7i0rXz6ns386gCkCgYEA54Dehg5s4glRSYfF8RKMfMkppASSXMeKf+BU7SLvt7ayqa08dv8DqoxSGLc/RaDGkyhfM5h+ON0E9/ZF5F+1fsMLfODG133Pbas7SC0An+FAqS6M4K1bD8ROl67uYQVx1MigEjor+A4E4KTjjJns2fYjCseAk3KBbpD6ITGMm58CgYEAvS6nmkrIKaXglzOHs4tN5kwaFxFvC5TDogM34VzwQx6D6Jw/UNdmXakehS8bBP7cJu5JyFMdfKiC/vVXVA937XayY2DalgWAWT2PMOY0eniAZAq3zOZMKPkmgJ9OqtxZ/UlbZ+IcYqvy7BoK/G+45gAfBSTQyj+9zAm/YHYV+ssCgYAFrTRHpzzmQgI7QlgJNEI7oRcjTXVlTwNHZXHPqsakA5fX70aHSHOHkA9HSd8ETw/vddL3yep2bHz9s409L1ec9x1l/4EAsbYPY159w5S7VuOmAl0z+Sw9c7vVnlV8DY0gAZdjOwfu+jEGbSSjQvb61T1Au2mcs/cWhfmMLNHc0wKBgQCKqbunV9DG1hJ8QQTiEOUUPAuThO/DqVKLWZiH0rs4NxGwWXX/JyKc2+zG6fQAAV4UGuxxrJocWNdLUUClGIFqyGmQddlBxN6CiqB90v38Fn7k1QZLZTHFhnk2JY5fpgs/n5kj15O+rxHrBFuxE6KO0t/pwUZYN8hB2ZMwfN03aQKBgHSMpZWPN8/7oQYR1RQD5Lu9aEs0Q+MZYazOlSWcl4ZzzNWuShJ6fqRT0JUP5jZpsZ7Lg3HpkOLaWGvx3ulxC7vixP5mT+8oN0Ld6T4hgdXubLmN9K8g5m2+nVEejy7AfMs0yHuFmihFjB7CRYi/AGO8JeBinMgkkrNbJHgFKPOh
b1c23f42-a3ea-45ce-87ce-8439ad07a7ec	a0561366-9f80-4f98-97c8-48f81c49520b	keyUse	ENC
1bb66c5b-e42c-4edb-a3b1-fdd2dc306ada	a0561366-9f80-4f98-97c8-48f81c49520b	certificate	MIICoTCCAYkCBgGMaBMRvTANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAliZWF0YnVkZHkwHhcNMjMxMjE0MTEyMzQ5WhcNMzMxMjE0MTEyNTI5WjAUMRIwEAYDVQQDDAliZWF0YnVkZHkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCrFFUBjQyNKXFXE4Vc2quwTq8eZbIcBq0tiz2Ztz1avmc+1yet7hCWICwQxMfulM5gsC0kJ2LGF1zQ8ePfGT2orn+gu6IrYSAGi+N4dK11cEKuS87cvlQ0d0CHEMriEB/j3MJZKz3wxkbhTojvakk+csSOJbwrh7JQ7NNxSkfxg2VaJsMff4Mf4VEgbqmgc8njs352eUGpHrczYlpSBvLuzSBPiPEZw7YF9cCE4wuVBXz9mfqZjMjvQHxVEIUyvtzmhNrRGXtFCoeNLp6C9p+TW4IyosAWGquX92v7R3NkE8ZElCiVIdUfqgGAxnnDRCDWbvmJCod3jbw3n5mog60VAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGmvu6NwFkCW/A09dR5aHv97UVp0fqhNxBw7ZPuhJKsiEHvg2ESfiX1/yMbFdyJQgly6CQegOsKxpe7D1RSrXjjU36CqU8a2r2/ynaL+ddpmb6lWUPn50PFAAqYoUjvF/HuzQPqq3xi0O0YPZH7zOdlX5BBCMTrIMLGnCcALMUMbnIS7AdbGXf05eemXdh5HsUj6oqEwpW/RGGivs8Tq1pptcBqV17RrfnTTAYwmcz8QJoKsP54hLKm5umxpO51bGQC4wX+JQOA9qUJbUgtOYCwkqhMt25ioS2WV9bz+GWf15JUAvFGLSo9Q59rlw6EWgcDLUhSAQrKYHad9fFx4Zpk=
4fd70b94-637d-4d87-a991-62d348b830f2	a0561366-9f80-4f98-97c8-48f81c49520b	algorithm	RSA-OAEP
4c36387a-c1a8-4b4b-b71e-fd256bbb646d	51a6d94d-f31b-45fb-bb22-52a466312635	priority	100
ecfe0f4e-71bd-4b95-9482-8015ea82fd73	51a6d94d-f31b-45fb-bb22-52a466312635	kid	7bc93a1c-6504-4a58-a9c0-305347f8cc32
5dbeac8a-48d9-4610-8d3f-635e28c2994b	51a6d94d-f31b-45fb-bb22-52a466312635	secret	4DO5UWaL5jhU_Y-PtI1ZFQ
2c60d60b-1a65-4243-9d29-a2897887df75	38963a48-3aea-4a18-b261-020d512b959e	kid	97014a74-bd42-4b1b-9f9d-e41e4877b04a
f1721cd4-a87a-4874-9b87-5d913efca275	38963a48-3aea-4a18-b261-020d512b959e	secret	k4xC1FZdyMBfDXqYTuo0r369RB95sKabqRGyFYRPBpC_Wh5qjUYP0awMFiKCEyNxb2kWBPkQv0wZq4iOF8UjpQ
018a4370-cfcd-44d4-8a02-e3160ce5bb5f	38963a48-3aea-4a18-b261-020d512b959e	priority	100
d4df2bb3-877d-4448-b8fd-7654d2449630	38963a48-3aea-4a18-b261-020d512b959e	algorithm	HS256
92ec7944-c7d9-4c50-8e0e-268f4ff1f250	e91aebdb-c701-43e6-b6d7-85b71a579dd3	allowed-protocol-mapper-types	saml-user-attribute-mapper
f20b76ac-1f96-47bc-b999-552134dd2feb	e91aebdb-c701-43e6-b6d7-85b71a579dd3	allowed-protocol-mapper-types	oidc-full-name-mapper
9846cca3-646c-4999-895d-98a734a2f706	e91aebdb-c701-43e6-b6d7-85b71a579dd3	allowed-protocol-mapper-types	saml-role-list-mapper
8a96d632-4e53-42a1-844c-906b8203881e	e91aebdb-c701-43e6-b6d7-85b71a579dd3	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
0a7b0447-0101-49fb-9d93-f48f1d1b6876	e91aebdb-c701-43e6-b6d7-85b71a579dd3	allowed-protocol-mapper-types	oidc-address-mapper
e4511805-c0a1-4fe7-863f-7e82cceb53ad	e91aebdb-c701-43e6-b6d7-85b71a579dd3	allowed-protocol-mapper-types	saml-user-property-mapper
7056a7f1-59b4-4375-a270-d1562708063e	e91aebdb-c701-43e6-b6d7-85b71a579dd3	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b9475730-cbee-45a9-86a5-3ec7935adeff	e91aebdb-c701-43e6-b6d7-85b71a579dd3	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c677dcb8-cd54-482f-bdb2-b284579017cf	9d39db50-6eca-43df-a577-31645505af4b	allow-default-scopes	true
316839fd-1ed2-447a-9a76-50f500d7e511	3f708038-1593-47b0-ba7b-864909a22f74	max-clients	200
ce4b4aac-95c0-4880-b5a2-2a184139aa12	69d288de-7107-4502-9e05-e12f4add5891	allowed-protocol-mapper-types	saml-user-attribute-mapper
3d305e39-e4e6-47e8-846a-ed1415eb20c0	69d288de-7107-4502-9e05-e12f4add5891	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2be65baa-7b60-4b91-b753-1ae1f72b87e2	69d288de-7107-4502-9e05-e12f4add5891	allowed-protocol-mapper-types	saml-user-property-mapper
5bf0acba-89ef-438e-b97a-fef1c9ef165c	69d288de-7107-4502-9e05-e12f4add5891	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
9dbc3d3c-b539-4549-8e93-3b6f4d72ce1c	69d288de-7107-4502-9e05-e12f4add5891	allowed-protocol-mapper-types	saml-role-list-mapper
ffdff3ab-e30d-41f1-80e5-a07b525df78b	69d288de-7107-4502-9e05-e12f4add5891	allowed-protocol-mapper-types	oidc-full-name-mapper
aa3ef373-ed1c-4bd7-b8aa-5f10acfff8b1	69d288de-7107-4502-9e05-e12f4add5891	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
0f14fbf9-7535-4474-a149-e39681c20a1a	69d288de-7107-4502-9e05-e12f4add5891	allowed-protocol-mapper-types	oidc-address-mapper
92a426d8-a928-47de-9665-80b4e8e00c6a	c6259062-9e76-44ad-8835-54df7814cae5	allow-default-scopes	true
15e9cca7-af8f-46cd-b991-a40d2ea23055	ad46bcb7-427e-4f1f-a084-909f93633841	client-uris-must-match	true
866a9f0d-65a8-436b-a210-2a332a79b462	ad46bcb7-427e-4f1f-a084-909f93633841	host-sending-registration-request-must-match	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.composite_role (composite, child_role) FROM stdin;
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	7bd1a68b-4645-46b7-a48e-19f6969efef1
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	8267804b-b26f-42b6-9eba-47c96411f819
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	68aac967-ed20-4b33-bc78-607edb832afa
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	c9bd66e5-249f-4803-b8fb-ca92019d910b
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	4617c0bb-5bb4-41f1-a02f-b3b1058ab3bc
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	dfc532ec-e161-4dd3-92bf-3d601f17625c
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	cc1edbb3-3d3a-4989-a43b-b6988a260e24
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	d1d60a79-3084-482c-8ef2-672e4979b215
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	b0ae38c2-572d-4494-9349-7326d5168822
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	b46cb817-d00c-4f9b-ac63-5ad9c8e8cf34
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	0b526bfa-96fe-4d3d-a941-659e67111ae2
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	d51321c0-9b06-47af-b1cc-0667f10f8d3c
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	c6d1d0cc-b824-42ac-8889-1cc3217ebd83
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	8cf6251b-b73b-4e10-9d26-6b9c82e304eb
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	eac9f214-b153-490b-a99e-ec59f36e677d
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	756c40a5-e0e8-4b36-abb2-edae0237642a
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	d3f156ed-f75e-45fa-a319-1800d3acffee
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	5e1abc88-c962-47e2-9588-ee4ecc22be87
4617c0bb-5bb4-41f1-a02f-b3b1058ab3bc	756c40a5-e0e8-4b36-abb2-edae0237642a
a352824c-e889-4ad3-a724-e776e5da2987	09e317e0-a51b-4970-b0a4-13251ac4f729
c9bd66e5-249f-4803-b8fb-ca92019d910b	5e1abc88-c962-47e2-9588-ee4ecc22be87
c9bd66e5-249f-4803-b8fb-ca92019d910b	eac9f214-b153-490b-a99e-ec59f36e677d
a352824c-e889-4ad3-a724-e776e5da2987	f12c528d-c3b4-4396-ade9-b7a78c39489a
f12c528d-c3b4-4396-ade9-b7a78c39489a	587e6eb2-5dbe-4f7c-86bc-64c8724a9ab7
300ad5ea-6bd9-4992-804d-9e8a9cb99295	195d5e69-5ce6-4a45-b236-642682c2f744
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	24c012ef-6aee-49d0-bbaf-c60582284246
a352824c-e889-4ad3-a724-e776e5da2987	7a13270b-36d7-4cb2-bf6b-6b6dbcedfcc5
a352824c-e889-4ad3-a724-e776e5da2987	476a25c6-54c0-4ac0-8dae-47f034c0b27f
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	f1a5b5ee-8ff5-4329-abb2-19782b8e7b56
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	aa39167e-b4fc-463f-bf76-75cfffcb09cf
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	97d55325-63ab-47b8-b734-fe96ce962747
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	df4a7bf7-4ea1-4515-b24c-744d98e54efc
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	27757cb2-bbee-4116-9194-8d16a698d52f
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	d3db8514-40bd-481b-9bb9-e9c346d2728d
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	8d208f7b-c2a8-4b18-8839-9d8fc8c580d8
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	66fa6c81-8a48-44f6-b729-041d873a4903
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	9b6fd0c5-4620-4e45-a607-a6fee68f8fcd
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	0b8a4bf5-7777-464d-9ad6-2afe9b476000
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	ea17aeb9-cdf8-4c21-803c-986cbc0381ea
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	0204bbb3-4f8e-4527-9070-bc5b87c0feba
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	e9e3146c-9d10-45b9-8e3d-7aabdbef8875
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	29de3798-8fae-4370-b1f6-ba69809fd04b
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	8e505167-e02a-4615-a604-390265862b54
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	50dd7e24-d8bf-4ef9-b3f4-01a0a37374de
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	9b183106-5f93-466b-beff-4e7996a91ed4
97d55325-63ab-47b8-b734-fe96ce962747	29de3798-8fae-4370-b1f6-ba69809fd04b
97d55325-63ab-47b8-b734-fe96ce962747	9b183106-5f93-466b-beff-4e7996a91ed4
df4a7bf7-4ea1-4515-b24c-744d98e54efc	8e505167-e02a-4615-a604-390265862b54
466fa100-35b5-4e99-a4b3-e73a6732fe9a	ca973bc8-bc53-491b-9f7f-84aa237aa39f
466fa100-35b5-4e99-a4b3-e73a6732fe9a	5281d355-a100-42c4-865f-e189fa8e550c
466fa100-35b5-4e99-a4b3-e73a6732fe9a	576cf22d-b68c-4fc8-bdd1-bcc199778407
466fa100-35b5-4e99-a4b3-e73a6732fe9a	1647d07a-e730-402d-ac06-6a64c4ce7644
466fa100-35b5-4e99-a4b3-e73a6732fe9a	0db5e2f1-bb02-40b5-8dd1-4bc572fd75ba
466fa100-35b5-4e99-a4b3-e73a6732fe9a	da869ef6-b7a4-461c-a70d-dc0bebbfef36
466fa100-35b5-4e99-a4b3-e73a6732fe9a	c1ed4194-2941-46c6-b320-dba00dfb7968
466fa100-35b5-4e99-a4b3-e73a6732fe9a	0b494d55-0389-4514-b271-668feb4987dd
466fa100-35b5-4e99-a4b3-e73a6732fe9a	b5dff861-36b4-46c3-ae33-87e891fbd46e
466fa100-35b5-4e99-a4b3-e73a6732fe9a	042a1a04-499b-44ef-a1a2-bf1bda0bfc48
466fa100-35b5-4e99-a4b3-e73a6732fe9a	44956af4-8359-4cde-8b92-8d97cbf46d59
466fa100-35b5-4e99-a4b3-e73a6732fe9a	1bb40808-8c63-4ea2-a422-67be9d16a65c
466fa100-35b5-4e99-a4b3-e73a6732fe9a	4a2dbbcb-fd1c-4962-a792-00cf622e58ad
466fa100-35b5-4e99-a4b3-e73a6732fe9a	e0ad743e-0896-4f8e-8a04-c79a42ebf890
466fa100-35b5-4e99-a4b3-e73a6732fe9a	c579b08f-7db5-4483-a20c-f719f9a772b5
466fa100-35b5-4e99-a4b3-e73a6732fe9a	9591772f-ff2b-4e77-b257-97bb464e73e6
466fa100-35b5-4e99-a4b3-e73a6732fe9a	715c14ee-20fb-4ac0-a304-b3538fcb0996
1647d07a-e730-402d-ac06-6a64c4ce7644	c579b08f-7db5-4483-a20c-f719f9a772b5
576cf22d-b68c-4fc8-bdd1-bcc199778407	715c14ee-20fb-4ac0-a304-b3538fcb0996
576cf22d-b68c-4fc8-bdd1-bcc199778407	e0ad743e-0896-4f8e-8a04-c79a42ebf890
ba014b3c-92ed-48fc-ab62-d025f714bb5f	b579bc80-032c-47c4-824a-3a5eb2076f27
ba014b3c-92ed-48fc-ab62-d025f714bb5f	607eadc5-7ffd-4cb2-98ec-72acf42da09a
607eadc5-7ffd-4cb2-98ec-72acf42da09a	dfd59ba6-b3ea-455e-acdf-331f1b8e4d15
b9bec2e8-1a9e-4242-ad46-7876d4eaf21e	c187757b-0293-4117-9c7c-248a15878204
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	bd7aba95-14ae-48c2-828b-6d781755c841
466fa100-35b5-4e99-a4b3-e73a6732fe9a	b118ab0a-df77-4f55-bf69-79bb0bad2b87
ba014b3c-92ed-48fc-ab62-d025f714bb5f	6dd58860-5a3a-43f0-840d-1663dd08a596
ba014b3c-92ed-48fc-ab62-d025f714bb5f	8d60a4ea-9288-4633-89fb-c0f638da0bdb
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
6151a065-c631-40ab-8680-c73e0473b5e0	\N	password	952b0a1b-7c30-4041-8a0a-b86cb11200ad	1702553071301	\N	{"value":"dFceJNeUG5vpVdJgm0UeTveRXukJqNjiUrkOuhdLG0s=","salt":"8nZAzYpqlsWEycX6kOchlQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-12-14 11:24:25.407263	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	2553064526
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-12-14 11:24:25.445432	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	2553064526
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-12-14 11:24:25.513635	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.23.2	\N	\N	2553064526
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-12-14 11:24:25.524826	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	2553064526
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-12-14 11:24:25.701101	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	2553064526
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-12-14 11:24:25.71748	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	2553064526
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-12-14 11:24:25.845893	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	2553064526
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-12-14 11:24:25.866215	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	2553064526
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-12-14 11:24:25.876475	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.23.2	\N	\N	2553064526
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-12-14 11:24:26.070506	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.23.2	\N	\N	2553064526
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-12-14 11:24:26.156821	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	2553064526
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-12-14 11:24:26.222444	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	2553064526
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-12-14 11:24:26.244601	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	2553064526
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-12-14 11:24:26.28018	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.23.2	\N	\N	2553064526
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-12-14 11:24:26.284149	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	2553064526
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-12-14 11:24:26.28917	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.23.2	\N	\N	2553064526
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-12-14 11:24:26.294378	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.23.2	\N	\N	2553064526
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-12-14 11:24:26.375363	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.23.2	\N	\N	2553064526
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-12-14 11:24:26.44818	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	2553064526
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-12-14 11:24:26.458758	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	2553064526
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-12-14 11:24:26.472491	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	2553064526
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-12-14 11:24:26.477878	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	2553064526
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-12-14 11:24:26.504818	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.23.2	\N	\N	2553064526
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-12-14 11:24:26.517384	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	2553064526
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-12-14 11:24:26.52221	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	2553064526
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-12-14 11:24:26.59999	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.23.2	\N	\N	2553064526
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-12-14 11:24:26.745522	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.23.2	\N	\N	2553064526
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-12-14 11:24:26.751837	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	2553064526
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-12-14 11:24:26.88028	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.23.2	\N	\N	2553064526
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-12-14 11:24:26.915874	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.23.2	\N	\N	2553064526
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-12-14 11:24:26.947098	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.23.2	\N	\N	2553064526
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-12-14 11:24:26.953809	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.23.2	\N	\N	2553064526
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-12-14 11:24:26.963176	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	2553064526
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-12-14 11:24:26.970633	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	2553064526
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-12-14 11:24:27.019731	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	2553064526
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-12-14 11:24:27.028921	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.23.2	\N	\N	2553064526
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-12-14 11:24:27.042406	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	2553064526
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-12-14 11:24:27.049287	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.23.2	\N	\N	2553064526
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-12-14 11:24:27.056636	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.23.2	\N	\N	2553064526
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-12-14 11:24:27.059918	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	2553064526
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-12-14 11:24:27.064817	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	2553064526
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-12-14 11:24:27.07142	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.23.2	\N	\N	2553064526
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-12-14 11:24:27.40022	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.23.2	\N	\N	2553064526
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-12-14 11:24:27.41358	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.23.2	\N	\N	2553064526
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-14 11:24:27.425417	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	2553064526
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-14 11:24:27.433071	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.23.2	\N	\N	2553064526
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-14 11:24:27.436882	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	2553064526
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-14 11:24:27.515987	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.23.2	\N	\N	2553064526
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-14 11:24:27.527037	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.23.2	\N	\N	2553064526
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-12-14 11:24:27.634026	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.23.2	\N	\N	2553064526
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-12-14 11:24:27.70303	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.23.2	\N	\N	2553064526
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-12-14 11:24:27.712378	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	2553064526
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-12-14 11:24:27.718011	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.23.2	\N	\N	2553064526
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-12-14 11:24:27.724159	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.23.2	\N	\N	2553064526
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-12-14 11:24:27.737771	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.23.2	\N	\N	2553064526
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-12-14 11:24:27.747283	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.23.2	\N	\N	2553064526
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-12-14 11:24:27.789462	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.23.2	\N	\N	2553064526
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-12-14 11:24:27.941745	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.23.2	\N	\N	2553064526
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-12-14 11:24:28.001373	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.23.2	\N	\N	2553064526
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-12-14 11:24:28.015857	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	2553064526
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-12-14 11:24:28.033333	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.23.2	\N	\N	2553064526
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-12-14 11:24:28.048351	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.23.2	\N	\N	2553064526
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-12-14 11:24:28.05726	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	2553064526
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-12-14 11:24:28.064491	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	2553064526
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-12-14 11:24:28.07274	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.23.2	\N	\N	2553064526
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-12-14 11:24:28.099728	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.23.2	\N	\N	2553064526
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-12-14 11:24:28.113124	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.23.2	\N	\N	2553064526
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-12-14 11:24:28.122723	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.23.2	\N	\N	2553064526
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-12-14 11:24:28.138751	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.23.2	\N	\N	2553064526
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-12-14 11:24:28.14765	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.23.2	\N	\N	2553064526
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-12-14 11:24:28.154837	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	2553064526
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-14 11:24:28.165258	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	2553064526
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-14 11:24:28.175071	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	2553064526
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-14 11:24:28.180045	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	2553064526
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-14 11:24:28.214814	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.23.2	\N	\N	2553064526
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-14 11:24:28.233098	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.23.2	\N	\N	2553064526
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-12-14 11:24:28.242347	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.23.2	\N	\N	2553064526
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-12-14 11:24:28.246343	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.23.2	\N	\N	2553064526
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-12-14 11:24:28.277343	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.23.2	\N	\N	2553064526
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-12-14 11:24:28.283445	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.23.2	\N	\N	2553064526
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-14 11:24:28.296617	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.23.2	\N	\N	2553064526
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-14 11:24:28.299983	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	2553064526
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-14 11:24:28.307222	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	2553064526
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-14 11:24:28.311002	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	2553064526
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-14 11:24:28.325201	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	2553064526
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-12-14 11:24:28.333451	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.23.2	\N	\N	2553064526
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-12-14 11:24:28.346537	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.23.2	\N	\N	2553064526
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-12-14 11:24:28.370896	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.23.2	\N	\N	2553064526
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-14 11:24:28.383783	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.23.2	\N	\N	2553064526
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-14 11:24:28.399138	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.23.2	\N	\N	2553064526
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-14 11:24:28.415039	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	2553064526
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-14 11:24:28.436378	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.23.2	\N	\N	2553064526
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-14 11:24:28.441333	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	2553064526
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-14 11:24:28.46327	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	2553064526
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-14 11:24:28.470867	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.23.2	\N	\N	2553064526
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-14 11:24:28.485539	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.23.2	\N	\N	2553064526
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-14 11:24:28.508668	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	2553064526
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-14 11:24:28.512064	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	2553064526
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-14 11:24:28.520178	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	2553064526
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-14 11:24:28.533521	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	2553064526
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-14 11:24:28.537569	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	2553064526
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-14 11:24:28.551795	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.23.2	\N	\N	2553064526
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-14 11:24:28.558219	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.23.2	\N	\N	2553064526
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-12-14 11:24:28.570326	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.23.2	\N	\N	2553064526
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-12-14 11:24:28.58529	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.23.2	\N	\N	2553064526
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-12-14 11:24:28.601539	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.23.2	\N	\N	2553064526
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-12-14 11:24:28.611159	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.23.2	\N	\N	2553064526
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-12-14 11:24:28.62448	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	2553064526
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-12-14 11:24:28.627859	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	2553064526
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-12-14 11:24:28.640231	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	2553064526
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2023-12-14 11:24:28.648832	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.23.2	\N	\N	2553064526
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-12-14 11:24:28.711114	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	2553064526
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-12-14 11:24:28.720025	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.23.2	\N	\N	2553064526
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2023-12-14 11:24:28.730843	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.23.2	\N	\N	2553064526
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2023-12-14 11:24:28.734715	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.23.2	\N	\N	2553064526
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
f0fbc87d-9020-46ea-b572-7f7ccc131e82	d583a1e3-e18b-42e6-80d1-ee0cdda065ae	f
f0fbc87d-9020-46ea-b572-7f7ccc131e82	199b1901-d1d3-4bc6-86a4-593520815117	t
f0fbc87d-9020-46ea-b572-7f7ccc131e82	a0b084e2-ce1f-4596-8b2d-e6be1845967a	t
f0fbc87d-9020-46ea-b572-7f7ccc131e82	6ff0a578-8421-4f55-b0a7-62e9212d0223	t
f0fbc87d-9020-46ea-b572-7f7ccc131e82	aa26d985-8993-4b65-83a9-d49cc8585342	f
f0fbc87d-9020-46ea-b572-7f7ccc131e82	965df560-c79b-467a-bf22-ef030dde9fce	f
f0fbc87d-9020-46ea-b572-7f7ccc131e82	14b41792-e9c3-4607-a5c9-7a82c1648653	t
f0fbc87d-9020-46ea-b572-7f7ccc131e82	5551baf4-77e4-4981-a6d6-cda458597cf6	t
f0fbc87d-9020-46ea-b572-7f7ccc131e82	1d895be4-0c51-4fcb-9c72-7326520785a6	f
f0fbc87d-9020-46ea-b572-7f7ccc131e82	e2dabb64-0bff-4a25-876d-a421fd1d54f9	t
bbfb0c95-df74-4043-af21-ff214ec2b0a0	c6a99be1-5c93-47b2-add2-ee3648afe730	f
bbfb0c95-df74-4043-af21-ff214ec2b0a0	b6449b51-993a-45a8-9ae0-2dd84b6bb1db	t
bbfb0c95-df74-4043-af21-ff214ec2b0a0	c25849e6-0940-4ea8-8077-43f091af2a16	t
bbfb0c95-df74-4043-af21-ff214ec2b0a0	3739025a-6c5c-452d-bf07-470f5b91aa92	t
bbfb0c95-df74-4043-af21-ff214ec2b0a0	d87c24c2-e2a2-4c5c-bc01-57156f1b993b	f
bbfb0c95-df74-4043-af21-ff214ec2b0a0	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd	f
bbfb0c95-df74-4043-af21-ff214ec2b0a0	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5	t
bbfb0c95-df74-4043-af21-ff214ec2b0a0	365e0845-dce5-4776-a0e6-500d21cd3ca5	t
bbfb0c95-df74-4043-af21-ff214ec2b0a0	7e40abff-7bec-404f-8fc8-ca019be62311	f
bbfb0c95-df74-4043-af21-ff214ec2b0a0	e6307b01-1269-480e-93bf-5a01f85cd21e	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
google	bbfb0c95-df74-4043-af21-ff214ec2b0a0	111360646318490639273	vutien.dat.3601@gmail.com	\N	34433fd8-0561-4c75-a52b-1321f83f7676
google	bbfb0c95-df74-4043-af21-ff214ec2b0a0	104904084366711579900	vutien.dat.learning@gmail.com	\N	d7569e76-6493-4b5f-b95e-0636e60f3809
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
9f4a29de-04fc-4fd1-b9bd-fa6319279d8e	t	google	google	f	f	bbfb0c95-df74-4043-af21-ff214ec2b0a0	f	f	53a656d9-052d-497b-87d3-f1420742c5f6	\N	\N	f
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
9f4a29de-04fc-4fd1-b9bd-fa6319279d8e	false	hideOnLoginPage
9f4a29de-04fc-4fd1-b9bd-fa6319279d8e	504153764676-7t6evbih5fj9iplgqbdpkfinigrb2msa.apps.googleusercontent.com	clientId
9f4a29de-04fc-4fd1-b9bd-fa6319279d8e	false	acceptsPromptNoneForwardFromClient
9f4a29de-04fc-4fd1-b9bd-fa6319279d8e	false	disableUserInfo
9f4a29de-04fc-4fd1-b9bd-fa6319279d8e	false	filteredByClaim
9f4a29de-04fc-4fd1-b9bd-fa6319279d8e	IMPORT	syncMode
9f4a29de-04fc-4fd1-b9bd-fa6319279d8e	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	clientSecret
9f4a29de-04fc-4fd1-b9bd-fa6319279d8e	0	guiOrder
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
a352824c-e889-4ad3-a724-e776e5da2987	f0fbc87d-9020-46ea-b572-7f7ccc131e82	f	${role_default-roles}	default-roles-master	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N	\N
7bd1a68b-4645-46b7-a48e-19f6969efef1	f0fbc87d-9020-46ea-b572-7f7ccc131e82	f	${role_create-realm}	create-realm	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N	\N
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	f0fbc87d-9020-46ea-b572-7f7ccc131e82	f	${role_admin}	admin	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N	\N
8267804b-b26f-42b6-9eba-47c96411f819	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_create-client}	create-client	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
68aac967-ed20-4b33-bc78-607edb832afa	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_view-realm}	view-realm	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
c9bd66e5-249f-4803-b8fb-ca92019d910b	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_view-users}	view-users	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
4617c0bb-5bb4-41f1-a02f-b3b1058ab3bc	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_view-clients}	view-clients	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
dfc532ec-e161-4dd3-92bf-3d601f17625c	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_view-events}	view-events	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
cc1edbb3-3d3a-4989-a43b-b6988a260e24	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_view-identity-providers}	view-identity-providers	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
d1d60a79-3084-482c-8ef2-672e4979b215	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_view-authorization}	view-authorization	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
b0ae38c2-572d-4494-9349-7326d5168822	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_manage-realm}	manage-realm	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
b46cb817-d00c-4f9b-ac63-5ad9c8e8cf34	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_manage-users}	manage-users	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
0b526bfa-96fe-4d3d-a941-659e67111ae2	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_manage-clients}	manage-clients	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
d51321c0-9b06-47af-b1cc-0667f10f8d3c	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_manage-events}	manage-events	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
c6d1d0cc-b824-42ac-8889-1cc3217ebd83	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_manage-identity-providers}	manage-identity-providers	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
8cf6251b-b73b-4e10-9d26-6b9c82e304eb	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_manage-authorization}	manage-authorization	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
eac9f214-b153-490b-a99e-ec59f36e677d	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_query-users}	query-users	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
756c40a5-e0e8-4b36-abb2-edae0237642a	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_query-clients}	query-clients	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
d3f156ed-f75e-45fa-a319-1800d3acffee	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_query-realms}	query-realms	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
5e1abc88-c962-47e2-9588-ee4ecc22be87	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_query-groups}	query-groups	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
09e317e0-a51b-4970-b0a4-13251ac4f729	42e846a4-a827-4703-bf13-b109fd47a7de	t	${role_view-profile}	view-profile	f0fbc87d-9020-46ea-b572-7f7ccc131e82	42e846a4-a827-4703-bf13-b109fd47a7de	\N
f12c528d-c3b4-4396-ade9-b7a78c39489a	42e846a4-a827-4703-bf13-b109fd47a7de	t	${role_manage-account}	manage-account	f0fbc87d-9020-46ea-b572-7f7ccc131e82	42e846a4-a827-4703-bf13-b109fd47a7de	\N
587e6eb2-5dbe-4f7c-86bc-64c8724a9ab7	42e846a4-a827-4703-bf13-b109fd47a7de	t	${role_manage-account-links}	manage-account-links	f0fbc87d-9020-46ea-b572-7f7ccc131e82	42e846a4-a827-4703-bf13-b109fd47a7de	\N
01ac64e2-3130-4ee3-946a-bbb87cd1eafe	42e846a4-a827-4703-bf13-b109fd47a7de	t	${role_view-applications}	view-applications	f0fbc87d-9020-46ea-b572-7f7ccc131e82	42e846a4-a827-4703-bf13-b109fd47a7de	\N
195d5e69-5ce6-4a45-b236-642682c2f744	42e846a4-a827-4703-bf13-b109fd47a7de	t	${role_view-consent}	view-consent	f0fbc87d-9020-46ea-b572-7f7ccc131e82	42e846a4-a827-4703-bf13-b109fd47a7de	\N
300ad5ea-6bd9-4992-804d-9e8a9cb99295	42e846a4-a827-4703-bf13-b109fd47a7de	t	${role_manage-consent}	manage-consent	f0fbc87d-9020-46ea-b572-7f7ccc131e82	42e846a4-a827-4703-bf13-b109fd47a7de	\N
aee7442b-d371-4b4d-9778-35e10fd4cacd	42e846a4-a827-4703-bf13-b109fd47a7de	t	${role_view-groups}	view-groups	f0fbc87d-9020-46ea-b572-7f7ccc131e82	42e846a4-a827-4703-bf13-b109fd47a7de	\N
31155914-303e-4b3c-b589-29590c682ae6	42e846a4-a827-4703-bf13-b109fd47a7de	t	${role_delete-account}	delete-account	f0fbc87d-9020-46ea-b572-7f7ccc131e82	42e846a4-a827-4703-bf13-b109fd47a7de	\N
91bad00c-d7fe-4228-add6-f8ab71026c3c	dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	t	${role_read-token}	read-token	f0fbc87d-9020-46ea-b572-7f7ccc131e82	dd0ea2ed-8fa8-4295-92ef-0e146b39ba82	\N
24c012ef-6aee-49d0-bbaf-c60582284246	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	t	${role_impersonation}	impersonation	f0fbc87d-9020-46ea-b572-7f7ccc131e82	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	\N
7a13270b-36d7-4cb2-bf6b-6b6dbcedfcc5	f0fbc87d-9020-46ea-b572-7f7ccc131e82	f	${role_offline-access}	offline_access	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N	\N
476a25c6-54c0-4ac0-8dae-47f034c0b27f	f0fbc87d-9020-46ea-b572-7f7ccc131e82	f	${role_uma_authorization}	uma_authorization	f0fbc87d-9020-46ea-b572-7f7ccc131e82	\N	\N
ba014b3c-92ed-48fc-ab62-d025f714bb5f	bbfb0c95-df74-4043-af21-ff214ec2b0a0	f	${role_default-roles}	default-roles-beatbuddy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	\N	\N
f1a5b5ee-8ff5-4329-abb2-19782b8e7b56	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_create-client}	create-client	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
aa39167e-b4fc-463f-bf76-75cfffcb09cf	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_view-realm}	view-realm	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
97d55325-63ab-47b8-b734-fe96ce962747	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_view-users}	view-users	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
df4a7bf7-4ea1-4515-b24c-744d98e54efc	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_view-clients}	view-clients	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
27757cb2-bbee-4116-9194-8d16a698d52f	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_view-events}	view-events	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
d3db8514-40bd-481b-9bb9-e9c346d2728d	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_view-identity-providers}	view-identity-providers	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
8d208f7b-c2a8-4b18-8839-9d8fc8c580d8	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_view-authorization}	view-authorization	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
66fa6c81-8a48-44f6-b729-041d873a4903	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_manage-realm}	manage-realm	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
9b6fd0c5-4620-4e45-a607-a6fee68f8fcd	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_manage-users}	manage-users	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
0b8a4bf5-7777-464d-9ad6-2afe9b476000	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_manage-clients}	manage-clients	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
ea17aeb9-cdf8-4c21-803c-986cbc0381ea	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_manage-events}	manage-events	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
0204bbb3-4f8e-4527-9070-bc5b87c0feba	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_manage-identity-providers}	manage-identity-providers	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
e9e3146c-9d10-45b9-8e3d-7aabdbef8875	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_manage-authorization}	manage-authorization	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
29de3798-8fae-4370-b1f6-ba69809fd04b	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_query-users}	query-users	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
8e505167-e02a-4615-a604-390265862b54	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_query-clients}	query-clients	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
50dd7e24-d8bf-4ef9-b3f4-01a0a37374de	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_query-realms}	query-realms	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
9b183106-5f93-466b-beff-4e7996a91ed4	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_query-groups}	query-groups	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
466fa100-35b5-4e99-a4b3-e73a6732fe9a	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_realm-admin}	realm-admin	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
ca973bc8-bc53-491b-9f7f-84aa237aa39f	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_create-client}	create-client	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
5281d355-a100-42c4-865f-e189fa8e550c	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_view-realm}	view-realm	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
576cf22d-b68c-4fc8-bdd1-bcc199778407	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_view-users}	view-users	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
1647d07a-e730-402d-ac06-6a64c4ce7644	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_view-clients}	view-clients	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
0db5e2f1-bb02-40b5-8dd1-4bc572fd75ba	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_view-events}	view-events	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
da869ef6-b7a4-461c-a70d-dc0bebbfef36	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_view-identity-providers}	view-identity-providers	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
c1ed4194-2941-46c6-b320-dba00dfb7968	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_view-authorization}	view-authorization	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
0b494d55-0389-4514-b271-668feb4987dd	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_manage-realm}	manage-realm	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
b5dff861-36b4-46c3-ae33-87e891fbd46e	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_manage-users}	manage-users	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
042a1a04-499b-44ef-a1a2-bf1bda0bfc48	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_manage-clients}	manage-clients	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
44956af4-8359-4cde-8b92-8d97cbf46d59	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_manage-events}	manage-events	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
1bb40808-8c63-4ea2-a422-67be9d16a65c	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_manage-identity-providers}	manage-identity-providers	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
4a2dbbcb-fd1c-4962-a792-00cf622e58ad	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_manage-authorization}	manage-authorization	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
e0ad743e-0896-4f8e-8a04-c79a42ebf890	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_query-users}	query-users	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
c579b08f-7db5-4483-a20c-f719f9a772b5	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_query-clients}	query-clients	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
9591772f-ff2b-4e77-b257-97bb464e73e6	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_query-realms}	query-realms	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
715c14ee-20fb-4ac0-a304-b3538fcb0996	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_query-groups}	query-groups	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
b579bc80-032c-47c4-824a-3a5eb2076f27	dafc5509-1e81-45a5-bd98-6d6181a5d07b	t	${role_view-profile}	view-profile	bbfb0c95-df74-4043-af21-ff214ec2b0a0	dafc5509-1e81-45a5-bd98-6d6181a5d07b	\N
607eadc5-7ffd-4cb2-98ec-72acf42da09a	dafc5509-1e81-45a5-bd98-6d6181a5d07b	t	${role_manage-account}	manage-account	bbfb0c95-df74-4043-af21-ff214ec2b0a0	dafc5509-1e81-45a5-bd98-6d6181a5d07b	\N
dfd59ba6-b3ea-455e-acdf-331f1b8e4d15	dafc5509-1e81-45a5-bd98-6d6181a5d07b	t	${role_manage-account-links}	manage-account-links	bbfb0c95-df74-4043-af21-ff214ec2b0a0	dafc5509-1e81-45a5-bd98-6d6181a5d07b	\N
48c7e8c7-a0cb-4680-9a59-142d5b0ce5bc	dafc5509-1e81-45a5-bd98-6d6181a5d07b	t	${role_view-applications}	view-applications	bbfb0c95-df74-4043-af21-ff214ec2b0a0	dafc5509-1e81-45a5-bd98-6d6181a5d07b	\N
c187757b-0293-4117-9c7c-248a15878204	dafc5509-1e81-45a5-bd98-6d6181a5d07b	t	${role_view-consent}	view-consent	bbfb0c95-df74-4043-af21-ff214ec2b0a0	dafc5509-1e81-45a5-bd98-6d6181a5d07b	\N
b9bec2e8-1a9e-4242-ad46-7876d4eaf21e	dafc5509-1e81-45a5-bd98-6d6181a5d07b	t	${role_manage-consent}	manage-consent	bbfb0c95-df74-4043-af21-ff214ec2b0a0	dafc5509-1e81-45a5-bd98-6d6181a5d07b	\N
1d4d416b-cb76-4c23-b555-ad229a5a0c89	dafc5509-1e81-45a5-bd98-6d6181a5d07b	t	${role_view-groups}	view-groups	bbfb0c95-df74-4043-af21-ff214ec2b0a0	dafc5509-1e81-45a5-bd98-6d6181a5d07b	\N
4be1d1f9-0fcb-4e8f-bda5-adc26cf8b072	dafc5509-1e81-45a5-bd98-6d6181a5d07b	t	${role_delete-account}	delete-account	bbfb0c95-df74-4043-af21-ff214ec2b0a0	dafc5509-1e81-45a5-bd98-6d6181a5d07b	\N
bd7aba95-14ae-48c2-828b-6d781755c841	fb34e799-f88b-47c6-9de1-063a0e0f3491	t	${role_impersonation}	impersonation	f0fbc87d-9020-46ea-b572-7f7ccc131e82	fb34e799-f88b-47c6-9de1-063a0e0f3491	\N
b118ab0a-df77-4f55-bf69-79bb0bad2b87	3719c483-0a4f-4bad-a087-c0b8d8fffc65	t	${role_impersonation}	impersonation	bbfb0c95-df74-4043-af21-ff214ec2b0a0	3719c483-0a4f-4bad-a087-c0b8d8fffc65	\N
b96cbc63-8ab6-4ec8-a071-3581d817b2fe	858761b0-4802-4e35-a222-e44a0279baba	t	${role_read-token}	read-token	bbfb0c95-df74-4043-af21-ff214ec2b0a0	858761b0-4802-4e35-a222-e44a0279baba	\N
6dd58860-5a3a-43f0-840d-1663dd08a596	bbfb0c95-df74-4043-af21-ff214ec2b0a0	f	${role_offline-access}	offline_access	bbfb0c95-df74-4043-af21-ff214ec2b0a0	\N	\N
8d60a4ea-9288-4633-89fb-c0f638da0bdb	bbfb0c95-df74-4043-af21-ff214ec2b0a0	f	${role_uma_authorization}	uma_authorization	bbfb0c95-df74-4043-af21-ff214ec2b0a0	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.migration_model (id, version, update_time) FROM stdin;
lc4cj	22.0.5	1702553068
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
3ba5c321-0310-4e40-bb67-c6861136ce75	audience resolve	openid-connect	oidc-audience-resolve-mapper	c9f45c5a-c9c2-485d-978b-9b3aacdda522	\N
b7bcfd5d-82fd-4773-ac14-8bd3e4f4dc1b	locale	openid-connect	oidc-usermodel-attribute-mapper	b26e1fd0-a2d5-4381-91ea-7fd3544254eb	\N
a2154d99-5c23-4391-85b5-42f0925fb963	role list	saml	saml-role-list-mapper	\N	199b1901-d1d3-4bc6-86a4-593520815117
0184ab7e-356f-4067-8af9-f5e150a2bf74	full name	openid-connect	oidc-full-name-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
23e2edee-1bd0-419e-831d-13500fd8ac53	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
c7100439-282d-46bb-a647-bbd67408656c	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
26f88976-ad88-477c-bcd0-87f3037c02d7	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
91b5188f-6430-421d-91d8-ad6284ab600a	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
46ba4940-2fb9-4451-a4ba-72ff7f48085b	username	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
ca65216e-8865-4605-aabd-3ce2e0cc8ca6	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
edde2ffe-7b93-4ae4-b86f-1f57757ca9b2	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
03d70748-4903-427a-bb63-f17a0790286e	website	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
18ef6dc7-48fb-4faf-87e4-c28a03ae2bf9	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
68ba1894-42f8-4085-8db5-8d9512b235ea	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
08fcebc3-5619-4368-9ad0-23ffd3453b15	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
9738fba0-b78d-40a7-9294-7f1f07987b88	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
06eea1c3-2cad-4f17-bd58-c49ed688ed14	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	a0b084e2-ce1f-4596-8b2d-e6be1845967a
01b3a5ac-1699-4f3b-91c0-6c2c9d3bcd32	email	openid-connect	oidc-usermodel-attribute-mapper	\N	6ff0a578-8421-4f55-b0a7-62e9212d0223
adad3861-54fc-4947-8617-1d6c82cb02a9	email verified	openid-connect	oidc-usermodel-property-mapper	\N	6ff0a578-8421-4f55-b0a7-62e9212d0223
0e463bef-016a-48e2-96ba-7165a8cf7e17	address	openid-connect	oidc-address-mapper	\N	aa26d985-8993-4b65-83a9-d49cc8585342
4637acb3-d7f1-4e41-b841-87e24ebaa4bf	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	965df560-c79b-467a-bf22-ef030dde9fce
5074af48-125a-42a3-9979-3e570f9d4b48	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	965df560-c79b-467a-bf22-ef030dde9fce
95a23e0b-af03-4b90-8057-0e483a0e75c9	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	14b41792-e9c3-4607-a5c9-7a82c1648653
9566cf52-dc3c-48d1-8286-beb8e29da775	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	14b41792-e9c3-4607-a5c9-7a82c1648653
6613cfcb-c18c-4c81-a785-91587fefa7d1	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	14b41792-e9c3-4607-a5c9-7a82c1648653
9e872577-bde1-45e2-9d72-e59fce9667d6	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	5551baf4-77e4-4981-a6d6-cda458597cf6
92cab4a7-3f57-4476-be18-8e3224d8fa0e	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	1d895be4-0c51-4fcb-9c72-7326520785a6
e26525bf-000d-466e-9a88-901bbf5f7e96	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	1d895be4-0c51-4fcb-9c72-7326520785a6
8252278e-d279-4699-86b3-ba3d33525776	acr loa level	openid-connect	oidc-acr-mapper	\N	e2dabb64-0bff-4a25-876d-a421fd1d54f9
6a0a48ed-4224-44be-af3d-3214ef082b1b	audience resolve	openid-connect	oidc-audience-resolve-mapper	8bc25416-0142-4f4e-8a69-838bee9f6b0a	\N
9e02c993-bb4c-4b35-9ca4-86b183b24acc	role list	saml	saml-role-list-mapper	\N	b6449b51-993a-45a8-9ae0-2dd84b6bb1db
1f92b2da-d866-4f77-be4d-350f1f9aaad7	full name	openid-connect	oidc-full-name-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
cdd888fb-0469-4944-b7aa-50afd59a7814	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
6593c89a-cf56-4633-a18f-3c2b19ef6cca	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
8403134e-66da-4ca9-9f43-77b694eef031	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
8f4e003f-cf32-4b9e-8212-606714f83536	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
ca067342-5ff6-4878-a7c3-b5beca4a3437	username	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
b5f4bb8b-8421-4a95-b978-08452ac29391	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
86554371-d9fa-4d97-a271-6fc4e3a18051	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
77b5fe01-b67f-4bad-959f-46519f796d58	website	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
27287746-23b2-4eee-89e4-665d479c73b7	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
2428d214-92e2-4e9f-8039-57faaf0a487b	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
64f493e8-113c-413e-914b-df92b0865ad3	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
29274097-78fa-4fab-8a78-7fce3097b033	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
07cfd071-bb25-4a14-b70c-6034b943cfc1	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	c25849e6-0940-4ea8-8077-43f091af2a16
f1231bb8-673c-4ce4-a6bb-7b3f23c47214	email	openid-connect	oidc-usermodel-attribute-mapper	\N	3739025a-6c5c-452d-bf07-470f5b91aa92
3ca2f3d8-f4f3-471e-8980-2bc6ecfb995b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	3739025a-6c5c-452d-bf07-470f5b91aa92
76b55b94-f2d2-43d7-a919-079a0a1c3857	address	openid-connect	oidc-address-mapper	\N	d87c24c2-e2a2-4c5c-bc01-57156f1b993b
f4ffe423-8e94-4ae2-80c9-4eeb80be7694	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd
c76b7661-003a-4877-a665-45fab8cb4d34	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	f3e0c72b-b126-45fc-86ad-97e8eab0b0cd
b09d074e-6bc3-4023-878f-14fc09315611	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5
c6fcffa2-2972-48e1-83c1-2c32109d04f4	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5
3d7768fb-f9bc-4f9d-89a3-ce2e88daa9ba	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	9c4b2ec4-bccc-41b2-8003-c25d9fa00be5
8d8223ca-dfb5-4ebd-8a38-7bc67dff05f6	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	365e0845-dce5-4776-a0e6-500d21cd3ca5
361c88d9-4222-4c7b-9044-834e675cecf8	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	7e40abff-7bec-404f-8fc8-ca019be62311
1d2d0028-d799-434a-a874-1f084d13f640	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	7e40abff-7bec-404f-8fc8-ca019be62311
44da5b15-fc11-4e95-9bb0-2734d6fd0f0c	acr loa level	openid-connect	oidc-acr-mapper	\N	e6307b01-1269-480e-93bf-5a01f85cd21e
48cba610-3fa7-4a7f-a8f1-cfeacaa6d669	locale	openid-connect	oidc-usermodel-attribute-mapper	df064836-2d23-4b64-8386-52943fbdf40b	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
b7bcfd5d-82fd-4773-ac14-8bd3e4f4dc1b	true	userinfo.token.claim
b7bcfd5d-82fd-4773-ac14-8bd3e4f4dc1b	locale	user.attribute
b7bcfd5d-82fd-4773-ac14-8bd3e4f4dc1b	true	id.token.claim
b7bcfd5d-82fd-4773-ac14-8bd3e4f4dc1b	true	access.token.claim
b7bcfd5d-82fd-4773-ac14-8bd3e4f4dc1b	locale	claim.name
b7bcfd5d-82fd-4773-ac14-8bd3e4f4dc1b	String	jsonType.label
a2154d99-5c23-4391-85b5-42f0925fb963	false	single
a2154d99-5c23-4391-85b5-42f0925fb963	Basic	attribute.nameformat
a2154d99-5c23-4391-85b5-42f0925fb963	Role	attribute.name
0184ab7e-356f-4067-8af9-f5e150a2bf74	true	userinfo.token.claim
0184ab7e-356f-4067-8af9-f5e150a2bf74	true	id.token.claim
0184ab7e-356f-4067-8af9-f5e150a2bf74	true	access.token.claim
03d70748-4903-427a-bb63-f17a0790286e	true	userinfo.token.claim
03d70748-4903-427a-bb63-f17a0790286e	website	user.attribute
03d70748-4903-427a-bb63-f17a0790286e	true	id.token.claim
03d70748-4903-427a-bb63-f17a0790286e	true	access.token.claim
03d70748-4903-427a-bb63-f17a0790286e	website	claim.name
03d70748-4903-427a-bb63-f17a0790286e	String	jsonType.label
06eea1c3-2cad-4f17-bd58-c49ed688ed14	true	userinfo.token.claim
06eea1c3-2cad-4f17-bd58-c49ed688ed14	updatedAt	user.attribute
06eea1c3-2cad-4f17-bd58-c49ed688ed14	true	id.token.claim
06eea1c3-2cad-4f17-bd58-c49ed688ed14	true	access.token.claim
06eea1c3-2cad-4f17-bd58-c49ed688ed14	updated_at	claim.name
06eea1c3-2cad-4f17-bd58-c49ed688ed14	long	jsonType.label
08fcebc3-5619-4368-9ad0-23ffd3453b15	true	userinfo.token.claim
08fcebc3-5619-4368-9ad0-23ffd3453b15	zoneinfo	user.attribute
08fcebc3-5619-4368-9ad0-23ffd3453b15	true	id.token.claim
08fcebc3-5619-4368-9ad0-23ffd3453b15	true	access.token.claim
08fcebc3-5619-4368-9ad0-23ffd3453b15	zoneinfo	claim.name
08fcebc3-5619-4368-9ad0-23ffd3453b15	String	jsonType.label
18ef6dc7-48fb-4faf-87e4-c28a03ae2bf9	true	userinfo.token.claim
18ef6dc7-48fb-4faf-87e4-c28a03ae2bf9	gender	user.attribute
18ef6dc7-48fb-4faf-87e4-c28a03ae2bf9	true	id.token.claim
18ef6dc7-48fb-4faf-87e4-c28a03ae2bf9	true	access.token.claim
18ef6dc7-48fb-4faf-87e4-c28a03ae2bf9	gender	claim.name
18ef6dc7-48fb-4faf-87e4-c28a03ae2bf9	String	jsonType.label
23e2edee-1bd0-419e-831d-13500fd8ac53	true	userinfo.token.claim
23e2edee-1bd0-419e-831d-13500fd8ac53	lastName	user.attribute
23e2edee-1bd0-419e-831d-13500fd8ac53	true	id.token.claim
23e2edee-1bd0-419e-831d-13500fd8ac53	true	access.token.claim
23e2edee-1bd0-419e-831d-13500fd8ac53	family_name	claim.name
23e2edee-1bd0-419e-831d-13500fd8ac53	String	jsonType.label
26f88976-ad88-477c-bcd0-87f3037c02d7	true	userinfo.token.claim
26f88976-ad88-477c-bcd0-87f3037c02d7	middleName	user.attribute
26f88976-ad88-477c-bcd0-87f3037c02d7	true	id.token.claim
26f88976-ad88-477c-bcd0-87f3037c02d7	true	access.token.claim
26f88976-ad88-477c-bcd0-87f3037c02d7	middle_name	claim.name
26f88976-ad88-477c-bcd0-87f3037c02d7	String	jsonType.label
46ba4940-2fb9-4451-a4ba-72ff7f48085b	true	userinfo.token.claim
46ba4940-2fb9-4451-a4ba-72ff7f48085b	username	user.attribute
46ba4940-2fb9-4451-a4ba-72ff7f48085b	true	id.token.claim
46ba4940-2fb9-4451-a4ba-72ff7f48085b	true	access.token.claim
46ba4940-2fb9-4451-a4ba-72ff7f48085b	preferred_username	claim.name
46ba4940-2fb9-4451-a4ba-72ff7f48085b	String	jsonType.label
68ba1894-42f8-4085-8db5-8d9512b235ea	true	userinfo.token.claim
68ba1894-42f8-4085-8db5-8d9512b235ea	birthdate	user.attribute
68ba1894-42f8-4085-8db5-8d9512b235ea	true	id.token.claim
68ba1894-42f8-4085-8db5-8d9512b235ea	true	access.token.claim
68ba1894-42f8-4085-8db5-8d9512b235ea	birthdate	claim.name
68ba1894-42f8-4085-8db5-8d9512b235ea	String	jsonType.label
91b5188f-6430-421d-91d8-ad6284ab600a	true	userinfo.token.claim
91b5188f-6430-421d-91d8-ad6284ab600a	nickname	user.attribute
91b5188f-6430-421d-91d8-ad6284ab600a	true	id.token.claim
91b5188f-6430-421d-91d8-ad6284ab600a	true	access.token.claim
91b5188f-6430-421d-91d8-ad6284ab600a	nickname	claim.name
91b5188f-6430-421d-91d8-ad6284ab600a	String	jsonType.label
9738fba0-b78d-40a7-9294-7f1f07987b88	true	userinfo.token.claim
9738fba0-b78d-40a7-9294-7f1f07987b88	locale	user.attribute
9738fba0-b78d-40a7-9294-7f1f07987b88	true	id.token.claim
9738fba0-b78d-40a7-9294-7f1f07987b88	true	access.token.claim
9738fba0-b78d-40a7-9294-7f1f07987b88	locale	claim.name
9738fba0-b78d-40a7-9294-7f1f07987b88	String	jsonType.label
c7100439-282d-46bb-a647-bbd67408656c	true	userinfo.token.claim
c7100439-282d-46bb-a647-bbd67408656c	firstName	user.attribute
c7100439-282d-46bb-a647-bbd67408656c	true	id.token.claim
c7100439-282d-46bb-a647-bbd67408656c	true	access.token.claim
c7100439-282d-46bb-a647-bbd67408656c	given_name	claim.name
c7100439-282d-46bb-a647-bbd67408656c	String	jsonType.label
ca65216e-8865-4605-aabd-3ce2e0cc8ca6	true	userinfo.token.claim
ca65216e-8865-4605-aabd-3ce2e0cc8ca6	profile	user.attribute
ca65216e-8865-4605-aabd-3ce2e0cc8ca6	true	id.token.claim
ca65216e-8865-4605-aabd-3ce2e0cc8ca6	true	access.token.claim
ca65216e-8865-4605-aabd-3ce2e0cc8ca6	profile	claim.name
ca65216e-8865-4605-aabd-3ce2e0cc8ca6	String	jsonType.label
edde2ffe-7b93-4ae4-b86f-1f57757ca9b2	true	userinfo.token.claim
edde2ffe-7b93-4ae4-b86f-1f57757ca9b2	picture	user.attribute
edde2ffe-7b93-4ae4-b86f-1f57757ca9b2	true	id.token.claim
edde2ffe-7b93-4ae4-b86f-1f57757ca9b2	true	access.token.claim
edde2ffe-7b93-4ae4-b86f-1f57757ca9b2	picture	claim.name
edde2ffe-7b93-4ae4-b86f-1f57757ca9b2	String	jsonType.label
01b3a5ac-1699-4f3b-91c0-6c2c9d3bcd32	true	userinfo.token.claim
01b3a5ac-1699-4f3b-91c0-6c2c9d3bcd32	email	user.attribute
01b3a5ac-1699-4f3b-91c0-6c2c9d3bcd32	true	id.token.claim
01b3a5ac-1699-4f3b-91c0-6c2c9d3bcd32	true	access.token.claim
01b3a5ac-1699-4f3b-91c0-6c2c9d3bcd32	email	claim.name
01b3a5ac-1699-4f3b-91c0-6c2c9d3bcd32	String	jsonType.label
adad3861-54fc-4947-8617-1d6c82cb02a9	true	userinfo.token.claim
adad3861-54fc-4947-8617-1d6c82cb02a9	emailVerified	user.attribute
adad3861-54fc-4947-8617-1d6c82cb02a9	true	id.token.claim
adad3861-54fc-4947-8617-1d6c82cb02a9	true	access.token.claim
adad3861-54fc-4947-8617-1d6c82cb02a9	email_verified	claim.name
adad3861-54fc-4947-8617-1d6c82cb02a9	boolean	jsonType.label
0e463bef-016a-48e2-96ba-7165a8cf7e17	formatted	user.attribute.formatted
0e463bef-016a-48e2-96ba-7165a8cf7e17	country	user.attribute.country
0e463bef-016a-48e2-96ba-7165a8cf7e17	postal_code	user.attribute.postal_code
0e463bef-016a-48e2-96ba-7165a8cf7e17	true	userinfo.token.claim
0e463bef-016a-48e2-96ba-7165a8cf7e17	street	user.attribute.street
0e463bef-016a-48e2-96ba-7165a8cf7e17	true	id.token.claim
0e463bef-016a-48e2-96ba-7165a8cf7e17	region	user.attribute.region
0e463bef-016a-48e2-96ba-7165a8cf7e17	true	access.token.claim
0e463bef-016a-48e2-96ba-7165a8cf7e17	locality	user.attribute.locality
4637acb3-d7f1-4e41-b841-87e24ebaa4bf	true	userinfo.token.claim
4637acb3-d7f1-4e41-b841-87e24ebaa4bf	phoneNumber	user.attribute
4637acb3-d7f1-4e41-b841-87e24ebaa4bf	true	id.token.claim
4637acb3-d7f1-4e41-b841-87e24ebaa4bf	true	access.token.claim
4637acb3-d7f1-4e41-b841-87e24ebaa4bf	phone_number	claim.name
4637acb3-d7f1-4e41-b841-87e24ebaa4bf	String	jsonType.label
5074af48-125a-42a3-9979-3e570f9d4b48	true	userinfo.token.claim
5074af48-125a-42a3-9979-3e570f9d4b48	phoneNumberVerified	user.attribute
5074af48-125a-42a3-9979-3e570f9d4b48	true	id.token.claim
5074af48-125a-42a3-9979-3e570f9d4b48	true	access.token.claim
5074af48-125a-42a3-9979-3e570f9d4b48	phone_number_verified	claim.name
5074af48-125a-42a3-9979-3e570f9d4b48	boolean	jsonType.label
9566cf52-dc3c-48d1-8286-beb8e29da775	true	multivalued
9566cf52-dc3c-48d1-8286-beb8e29da775	foo	user.attribute
9566cf52-dc3c-48d1-8286-beb8e29da775	true	access.token.claim
9566cf52-dc3c-48d1-8286-beb8e29da775	resource_access.${client_id}.roles	claim.name
9566cf52-dc3c-48d1-8286-beb8e29da775	String	jsonType.label
95a23e0b-af03-4b90-8057-0e483a0e75c9	true	multivalued
95a23e0b-af03-4b90-8057-0e483a0e75c9	foo	user.attribute
95a23e0b-af03-4b90-8057-0e483a0e75c9	true	access.token.claim
95a23e0b-af03-4b90-8057-0e483a0e75c9	realm_access.roles	claim.name
95a23e0b-af03-4b90-8057-0e483a0e75c9	String	jsonType.label
92cab4a7-3f57-4476-be18-8e3224d8fa0e	true	userinfo.token.claim
92cab4a7-3f57-4476-be18-8e3224d8fa0e	username	user.attribute
92cab4a7-3f57-4476-be18-8e3224d8fa0e	true	id.token.claim
92cab4a7-3f57-4476-be18-8e3224d8fa0e	true	access.token.claim
92cab4a7-3f57-4476-be18-8e3224d8fa0e	upn	claim.name
92cab4a7-3f57-4476-be18-8e3224d8fa0e	String	jsonType.label
e26525bf-000d-466e-9a88-901bbf5f7e96	true	multivalued
e26525bf-000d-466e-9a88-901bbf5f7e96	foo	user.attribute
e26525bf-000d-466e-9a88-901bbf5f7e96	true	id.token.claim
e26525bf-000d-466e-9a88-901bbf5f7e96	true	access.token.claim
e26525bf-000d-466e-9a88-901bbf5f7e96	groups	claim.name
e26525bf-000d-466e-9a88-901bbf5f7e96	String	jsonType.label
8252278e-d279-4699-86b3-ba3d33525776	true	id.token.claim
8252278e-d279-4699-86b3-ba3d33525776	true	access.token.claim
9e02c993-bb4c-4b35-9ca4-86b183b24acc	false	single
9e02c993-bb4c-4b35-9ca4-86b183b24acc	Basic	attribute.nameformat
9e02c993-bb4c-4b35-9ca4-86b183b24acc	Role	attribute.name
07cfd071-bb25-4a14-b70c-6034b943cfc1	true	userinfo.token.claim
07cfd071-bb25-4a14-b70c-6034b943cfc1	updatedAt	user.attribute
07cfd071-bb25-4a14-b70c-6034b943cfc1	true	id.token.claim
07cfd071-bb25-4a14-b70c-6034b943cfc1	true	access.token.claim
07cfd071-bb25-4a14-b70c-6034b943cfc1	updated_at	claim.name
07cfd071-bb25-4a14-b70c-6034b943cfc1	long	jsonType.label
1f92b2da-d866-4f77-be4d-350f1f9aaad7	true	userinfo.token.claim
1f92b2da-d866-4f77-be4d-350f1f9aaad7	true	id.token.claim
1f92b2da-d866-4f77-be4d-350f1f9aaad7	true	access.token.claim
2428d214-92e2-4e9f-8039-57faaf0a487b	true	userinfo.token.claim
2428d214-92e2-4e9f-8039-57faaf0a487b	birthdate	user.attribute
2428d214-92e2-4e9f-8039-57faaf0a487b	true	id.token.claim
2428d214-92e2-4e9f-8039-57faaf0a487b	true	access.token.claim
2428d214-92e2-4e9f-8039-57faaf0a487b	birthdate	claim.name
2428d214-92e2-4e9f-8039-57faaf0a487b	String	jsonType.label
27287746-23b2-4eee-89e4-665d479c73b7	true	userinfo.token.claim
27287746-23b2-4eee-89e4-665d479c73b7	gender	user.attribute
27287746-23b2-4eee-89e4-665d479c73b7	true	id.token.claim
27287746-23b2-4eee-89e4-665d479c73b7	true	access.token.claim
27287746-23b2-4eee-89e4-665d479c73b7	gender	claim.name
27287746-23b2-4eee-89e4-665d479c73b7	String	jsonType.label
29274097-78fa-4fab-8a78-7fce3097b033	true	userinfo.token.claim
29274097-78fa-4fab-8a78-7fce3097b033	locale	user.attribute
29274097-78fa-4fab-8a78-7fce3097b033	true	id.token.claim
29274097-78fa-4fab-8a78-7fce3097b033	true	access.token.claim
29274097-78fa-4fab-8a78-7fce3097b033	locale	claim.name
29274097-78fa-4fab-8a78-7fce3097b033	String	jsonType.label
64f493e8-113c-413e-914b-df92b0865ad3	true	userinfo.token.claim
64f493e8-113c-413e-914b-df92b0865ad3	zoneinfo	user.attribute
64f493e8-113c-413e-914b-df92b0865ad3	true	id.token.claim
64f493e8-113c-413e-914b-df92b0865ad3	true	access.token.claim
64f493e8-113c-413e-914b-df92b0865ad3	zoneinfo	claim.name
64f493e8-113c-413e-914b-df92b0865ad3	String	jsonType.label
6593c89a-cf56-4633-a18f-3c2b19ef6cca	true	userinfo.token.claim
6593c89a-cf56-4633-a18f-3c2b19ef6cca	firstName	user.attribute
6593c89a-cf56-4633-a18f-3c2b19ef6cca	true	id.token.claim
6593c89a-cf56-4633-a18f-3c2b19ef6cca	true	access.token.claim
6593c89a-cf56-4633-a18f-3c2b19ef6cca	given_name	claim.name
6593c89a-cf56-4633-a18f-3c2b19ef6cca	String	jsonType.label
77b5fe01-b67f-4bad-959f-46519f796d58	true	userinfo.token.claim
77b5fe01-b67f-4bad-959f-46519f796d58	website	user.attribute
77b5fe01-b67f-4bad-959f-46519f796d58	true	id.token.claim
77b5fe01-b67f-4bad-959f-46519f796d58	true	access.token.claim
77b5fe01-b67f-4bad-959f-46519f796d58	website	claim.name
77b5fe01-b67f-4bad-959f-46519f796d58	String	jsonType.label
8403134e-66da-4ca9-9f43-77b694eef031	true	userinfo.token.claim
8403134e-66da-4ca9-9f43-77b694eef031	middleName	user.attribute
8403134e-66da-4ca9-9f43-77b694eef031	true	id.token.claim
8403134e-66da-4ca9-9f43-77b694eef031	true	access.token.claim
8403134e-66da-4ca9-9f43-77b694eef031	middle_name	claim.name
8403134e-66da-4ca9-9f43-77b694eef031	String	jsonType.label
86554371-d9fa-4d97-a271-6fc4e3a18051	true	userinfo.token.claim
86554371-d9fa-4d97-a271-6fc4e3a18051	picture	user.attribute
86554371-d9fa-4d97-a271-6fc4e3a18051	true	id.token.claim
86554371-d9fa-4d97-a271-6fc4e3a18051	true	access.token.claim
86554371-d9fa-4d97-a271-6fc4e3a18051	picture	claim.name
86554371-d9fa-4d97-a271-6fc4e3a18051	String	jsonType.label
8f4e003f-cf32-4b9e-8212-606714f83536	true	userinfo.token.claim
8f4e003f-cf32-4b9e-8212-606714f83536	nickname	user.attribute
8f4e003f-cf32-4b9e-8212-606714f83536	true	id.token.claim
8f4e003f-cf32-4b9e-8212-606714f83536	true	access.token.claim
8f4e003f-cf32-4b9e-8212-606714f83536	nickname	claim.name
8f4e003f-cf32-4b9e-8212-606714f83536	String	jsonType.label
b5f4bb8b-8421-4a95-b978-08452ac29391	true	userinfo.token.claim
b5f4bb8b-8421-4a95-b978-08452ac29391	profile	user.attribute
b5f4bb8b-8421-4a95-b978-08452ac29391	true	id.token.claim
b5f4bb8b-8421-4a95-b978-08452ac29391	true	access.token.claim
b5f4bb8b-8421-4a95-b978-08452ac29391	profile	claim.name
b5f4bb8b-8421-4a95-b978-08452ac29391	String	jsonType.label
ca067342-5ff6-4878-a7c3-b5beca4a3437	true	userinfo.token.claim
ca067342-5ff6-4878-a7c3-b5beca4a3437	username	user.attribute
ca067342-5ff6-4878-a7c3-b5beca4a3437	true	id.token.claim
ca067342-5ff6-4878-a7c3-b5beca4a3437	true	access.token.claim
ca067342-5ff6-4878-a7c3-b5beca4a3437	preferred_username	claim.name
ca067342-5ff6-4878-a7c3-b5beca4a3437	String	jsonType.label
cdd888fb-0469-4944-b7aa-50afd59a7814	true	userinfo.token.claim
cdd888fb-0469-4944-b7aa-50afd59a7814	lastName	user.attribute
cdd888fb-0469-4944-b7aa-50afd59a7814	true	id.token.claim
cdd888fb-0469-4944-b7aa-50afd59a7814	true	access.token.claim
cdd888fb-0469-4944-b7aa-50afd59a7814	family_name	claim.name
cdd888fb-0469-4944-b7aa-50afd59a7814	String	jsonType.label
3ca2f3d8-f4f3-471e-8980-2bc6ecfb995b	true	userinfo.token.claim
3ca2f3d8-f4f3-471e-8980-2bc6ecfb995b	emailVerified	user.attribute
3ca2f3d8-f4f3-471e-8980-2bc6ecfb995b	true	id.token.claim
3ca2f3d8-f4f3-471e-8980-2bc6ecfb995b	true	access.token.claim
3ca2f3d8-f4f3-471e-8980-2bc6ecfb995b	email_verified	claim.name
3ca2f3d8-f4f3-471e-8980-2bc6ecfb995b	boolean	jsonType.label
f1231bb8-673c-4ce4-a6bb-7b3f23c47214	true	userinfo.token.claim
f1231bb8-673c-4ce4-a6bb-7b3f23c47214	email	user.attribute
f1231bb8-673c-4ce4-a6bb-7b3f23c47214	true	id.token.claim
f1231bb8-673c-4ce4-a6bb-7b3f23c47214	true	access.token.claim
f1231bb8-673c-4ce4-a6bb-7b3f23c47214	email	claim.name
f1231bb8-673c-4ce4-a6bb-7b3f23c47214	String	jsonType.label
76b55b94-f2d2-43d7-a919-079a0a1c3857	formatted	user.attribute.formatted
76b55b94-f2d2-43d7-a919-079a0a1c3857	country	user.attribute.country
76b55b94-f2d2-43d7-a919-079a0a1c3857	postal_code	user.attribute.postal_code
76b55b94-f2d2-43d7-a919-079a0a1c3857	true	userinfo.token.claim
76b55b94-f2d2-43d7-a919-079a0a1c3857	street	user.attribute.street
76b55b94-f2d2-43d7-a919-079a0a1c3857	true	id.token.claim
76b55b94-f2d2-43d7-a919-079a0a1c3857	region	user.attribute.region
76b55b94-f2d2-43d7-a919-079a0a1c3857	true	access.token.claim
76b55b94-f2d2-43d7-a919-079a0a1c3857	locality	user.attribute.locality
c76b7661-003a-4877-a665-45fab8cb4d34	true	userinfo.token.claim
c76b7661-003a-4877-a665-45fab8cb4d34	phoneNumberVerified	user.attribute
c76b7661-003a-4877-a665-45fab8cb4d34	true	id.token.claim
c76b7661-003a-4877-a665-45fab8cb4d34	true	access.token.claim
c76b7661-003a-4877-a665-45fab8cb4d34	phone_number_verified	claim.name
c76b7661-003a-4877-a665-45fab8cb4d34	boolean	jsonType.label
f4ffe423-8e94-4ae2-80c9-4eeb80be7694	true	userinfo.token.claim
f4ffe423-8e94-4ae2-80c9-4eeb80be7694	phoneNumber	user.attribute
f4ffe423-8e94-4ae2-80c9-4eeb80be7694	true	id.token.claim
f4ffe423-8e94-4ae2-80c9-4eeb80be7694	true	access.token.claim
f4ffe423-8e94-4ae2-80c9-4eeb80be7694	phone_number	claim.name
f4ffe423-8e94-4ae2-80c9-4eeb80be7694	String	jsonType.label
b09d074e-6bc3-4023-878f-14fc09315611	true	multivalued
b09d074e-6bc3-4023-878f-14fc09315611	foo	user.attribute
b09d074e-6bc3-4023-878f-14fc09315611	true	access.token.claim
b09d074e-6bc3-4023-878f-14fc09315611	realm_access.roles	claim.name
b09d074e-6bc3-4023-878f-14fc09315611	String	jsonType.label
c6fcffa2-2972-48e1-83c1-2c32109d04f4	true	multivalued
c6fcffa2-2972-48e1-83c1-2c32109d04f4	foo	user.attribute
c6fcffa2-2972-48e1-83c1-2c32109d04f4	true	access.token.claim
c6fcffa2-2972-48e1-83c1-2c32109d04f4	resource_access.${client_id}.roles	claim.name
c6fcffa2-2972-48e1-83c1-2c32109d04f4	String	jsonType.label
1d2d0028-d799-434a-a874-1f084d13f640	true	multivalued
1d2d0028-d799-434a-a874-1f084d13f640	foo	user.attribute
1d2d0028-d799-434a-a874-1f084d13f640	true	id.token.claim
1d2d0028-d799-434a-a874-1f084d13f640	true	access.token.claim
1d2d0028-d799-434a-a874-1f084d13f640	groups	claim.name
1d2d0028-d799-434a-a874-1f084d13f640	String	jsonType.label
361c88d9-4222-4c7b-9044-834e675cecf8	true	userinfo.token.claim
361c88d9-4222-4c7b-9044-834e675cecf8	username	user.attribute
361c88d9-4222-4c7b-9044-834e675cecf8	true	id.token.claim
361c88d9-4222-4c7b-9044-834e675cecf8	true	access.token.claim
361c88d9-4222-4c7b-9044-834e675cecf8	upn	claim.name
361c88d9-4222-4c7b-9044-834e675cecf8	String	jsonType.label
44da5b15-fc11-4e95-9bb0-2734d6fd0f0c	true	id.token.claim
44da5b15-fc11-4e95-9bb0-2734d6fd0f0c	true	access.token.claim
48cba610-3fa7-4a7f-a8f1-cfeacaa6d669	true	userinfo.token.claim
48cba610-3fa7-4a7f-a8f1-cfeacaa6d669	locale	user.attribute
48cba610-3fa7-4a7f-a8f1-cfeacaa6d669	true	id.token.claim
48cba610-3fa7-4a7f-a8f1-cfeacaa6d669	true	access.token.claim
48cba610-3fa7-4a7f-a8f1-cfeacaa6d669	locale	claim.name
48cba610-3fa7-4a7f-a8f1-cfeacaa6d669	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
bbfb0c95-df74-4043-af21-ff214ec2b0a0	60	300	300	keycloak.v2	keycloak.v2	keycloak	t	f	0	keycloak	beatbuddy	0	\N	t	t	t	f	NONE	1800	36000	f	t	fb34e799-f88b-47c6-9de1-063a0e0f3491	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	59c63ad8-6bbb-4dc1-986c-6e7402520629	aa8ad4cd-b373-4981-bbd4-ea01bd2d4232	4673074d-b363-4a15-8393-7fff61d0ead8	eaf535e7-aa53-435b-b772-0a28b81b514d	a44f59d5-1b9c-4955-946c-69cdc8e66bf2	2592000	f	900	t	f	81f408ef-3afc-4fb6-b9ea-3eb0dee61201	0	f	0	0	ba014b3c-92ed-48fc-ab62-d025f714bb5f
f0fbc87d-9020-46ea-b572-7f7ccc131e82	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	NONE	1800	36000	f	f	76fb6f0f-36ae-4417-8fcb-a34afff31e6f	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	c4e0f8c2-e868-4700-9745-1f08bd4ce57e	0ba9e862-750d-4406-9fd6-9fc290a8e51c	000c38d9-7957-4b5c-aaf6-7918f9b78861	c14ea7ea-047a-484c-a6c5-6f085d73f70b	844fee80-d9a0-4abd-b9d4-9e9fc01e1c8e	2592000	f	900	t	f	9c746ada-4ae0-4a79-b665-44dd63484e59	0	f	0	0	a352824c-e889-4ad3-a724-e776e5da2987
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	f0fbc87d-9020-46ea-b572-7f7ccc131e82	
_browser_header.xContentTypeOptions	f0fbc87d-9020-46ea-b572-7f7ccc131e82	nosniff
_browser_header.referrerPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	no-referrer
_browser_header.xRobotsTag	f0fbc87d-9020-46ea-b572-7f7ccc131e82	none
_browser_header.xFrameOptions	f0fbc87d-9020-46ea-b572-7f7ccc131e82	SAMEORIGIN
_browser_header.contentSecurityPolicy	f0fbc87d-9020-46ea-b572-7f7ccc131e82	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	f0fbc87d-9020-46ea-b572-7f7ccc131e82	1; mode=block
_browser_header.strictTransportSecurity	f0fbc87d-9020-46ea-b572-7f7ccc131e82	max-age=31536000; includeSubDomains
bruteForceProtected	f0fbc87d-9020-46ea-b572-7f7ccc131e82	false
permanentLockout	f0fbc87d-9020-46ea-b572-7f7ccc131e82	false
maxFailureWaitSeconds	f0fbc87d-9020-46ea-b572-7f7ccc131e82	900
minimumQuickLoginWaitSeconds	f0fbc87d-9020-46ea-b572-7f7ccc131e82	60
waitIncrementSeconds	f0fbc87d-9020-46ea-b572-7f7ccc131e82	60
quickLoginCheckMilliSeconds	f0fbc87d-9020-46ea-b572-7f7ccc131e82	1000
maxDeltaTimeSeconds	f0fbc87d-9020-46ea-b572-7f7ccc131e82	43200
failureFactor	f0fbc87d-9020-46ea-b572-7f7ccc131e82	30
realmReusableOtpCode	f0fbc87d-9020-46ea-b572-7f7ccc131e82	false
displayName	f0fbc87d-9020-46ea-b572-7f7ccc131e82	Keycloak
displayNameHtml	f0fbc87d-9020-46ea-b572-7f7ccc131e82	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	f0fbc87d-9020-46ea-b572-7f7ccc131e82	RS256
offlineSessionMaxLifespanEnabled	f0fbc87d-9020-46ea-b572-7f7ccc131e82	false
offlineSessionMaxLifespan	f0fbc87d-9020-46ea-b572-7f7ccc131e82	5184000
realmReusableOtpCode	bbfb0c95-df74-4043-af21-ff214ec2b0a0	false
oauth2DeviceCodeLifespan	bbfb0c95-df74-4043-af21-ff214ec2b0a0	600
oauth2DevicePollingInterval	bbfb0c95-df74-4043-af21-ff214ec2b0a0	5
cibaBackchannelTokenDeliveryMode	bbfb0c95-df74-4043-af21-ff214ec2b0a0	poll
cibaExpiresIn	bbfb0c95-df74-4043-af21-ff214ec2b0a0	120
cibaInterval	bbfb0c95-df74-4043-af21-ff214ec2b0a0	5
cibaAuthRequestedUserHint	bbfb0c95-df74-4043-af21-ff214ec2b0a0	login_hint
parRequestUriLifespan	bbfb0c95-df74-4043-af21-ff214ec2b0a0	60
bruteForceProtected	bbfb0c95-df74-4043-af21-ff214ec2b0a0	false
permanentLockout	bbfb0c95-df74-4043-af21-ff214ec2b0a0	false
maxFailureWaitSeconds	bbfb0c95-df74-4043-af21-ff214ec2b0a0	900
minimumQuickLoginWaitSeconds	bbfb0c95-df74-4043-af21-ff214ec2b0a0	60
waitIncrementSeconds	bbfb0c95-df74-4043-af21-ff214ec2b0a0	60
quickLoginCheckMilliSeconds	bbfb0c95-df74-4043-af21-ff214ec2b0a0	1000
maxDeltaTimeSeconds	bbfb0c95-df74-4043-af21-ff214ec2b0a0	43200
failureFactor	bbfb0c95-df74-4043-af21-ff214ec2b0a0	30
actionTokenGeneratedByAdminLifespan	bbfb0c95-df74-4043-af21-ff214ec2b0a0	43200
actionTokenGeneratedByUserLifespan	bbfb0c95-df74-4043-af21-ff214ec2b0a0	300
clientSessionIdleTimeout	bbfb0c95-df74-4043-af21-ff214ec2b0a0	0
clientSessionMaxLifespan	bbfb0c95-df74-4043-af21-ff214ec2b0a0	0
clientOfflineSessionIdleTimeout	bbfb0c95-df74-4043-af21-ff214ec2b0a0	0
clientOfflineSessionMaxLifespan	bbfb0c95-df74-4043-af21-ff214ec2b0a0	0
defaultSignatureAlgorithm	bbfb0c95-df74-4043-af21-ff214ec2b0a0	RS256
offlineSessionMaxLifespanEnabled	bbfb0c95-df74-4043-af21-ff214ec2b0a0	false
offlineSessionMaxLifespan	bbfb0c95-df74-4043-af21-ff214ec2b0a0	5184000
webAuthnPolicyRpEntityName	bbfb0c95-df74-4043-af21-ff214ec2b0a0	keycloak
webAuthnPolicySignatureAlgorithms	bbfb0c95-df74-4043-af21-ff214ec2b0a0	ES256
webAuthnPolicyRpId	bbfb0c95-df74-4043-af21-ff214ec2b0a0	
webAuthnPolicyAttestationConveyancePreference	bbfb0c95-df74-4043-af21-ff214ec2b0a0	not specified
webAuthnPolicyAuthenticatorAttachment	bbfb0c95-df74-4043-af21-ff214ec2b0a0	not specified
webAuthnPolicyRequireResidentKey	bbfb0c95-df74-4043-af21-ff214ec2b0a0	not specified
webAuthnPolicyUserVerificationRequirement	bbfb0c95-df74-4043-af21-ff214ec2b0a0	not specified
webAuthnPolicyCreateTimeout	bbfb0c95-df74-4043-af21-ff214ec2b0a0	0
webAuthnPolicyAvoidSameAuthenticatorRegister	bbfb0c95-df74-4043-af21-ff214ec2b0a0	false
webAuthnPolicyRpEntityNamePasswordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	ES256
webAuthnPolicyRpIdPasswordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	
webAuthnPolicyAttestationConveyancePreferencePasswordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	not specified
webAuthnPolicyRequireResidentKeyPasswordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	not specified
webAuthnPolicyCreateTimeoutPasswordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	false
client-policies.profiles	bbfb0c95-df74-4043-af21-ff214ec2b0a0	{"profiles":[]}
client-policies.policies	bbfb0c95-df74-4043-af21-ff214ec2b0a0	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	bbfb0c95-df74-4043-af21-ff214ec2b0a0	
_browser_header.xContentTypeOptions	bbfb0c95-df74-4043-af21-ff214ec2b0a0	nosniff
_browser_header.referrerPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	no-referrer
_browser_header.xRobotsTag	bbfb0c95-df74-4043-af21-ff214ec2b0a0	none
_browser_header.xFrameOptions	bbfb0c95-df74-4043-af21-ff214ec2b0a0	SAMEORIGIN
_browser_header.contentSecurityPolicy	bbfb0c95-df74-4043-af21-ff214ec2b0a0	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	bbfb0c95-df74-4043-af21-ff214ec2b0a0	1; mode=block
_browser_header.strictTransportSecurity	bbfb0c95-df74-4043-af21-ff214ec2b0a0	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
f0fbc87d-9020-46ea-b572-7f7ccc131e82	jboss-logging
bbfb0c95-df74-4043-af21-ff214ec2b0a0	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	f0fbc87d-9020-46ea-b572-7f7ccc131e82
password	password	t	t	bbfb0c95-df74-4043-af21-ff214ec2b0a0
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
bbfb0c95-df74-4043-af21-ff214ec2b0a0	Beat Buddy	replyToDisplayName
bbfb0c95-df74-4043-af21-ff214ec2b0a0	true	starttls
bbfb0c95-df74-4043-af21-ff214ec2b0a0	true	auth
bbfb0c95-df74-4043-af21-ff214ec2b0a0		envelopeFrom
bbfb0c95-df74-4043-af21-ff214ec2b0a0	true	ssl
bbfb0c95-df74-4043-af21-ff214ec2b0a0	ympt ykvo ecob etvm 	password
bbfb0c95-df74-4043-af21-ff214ec2b0a0	465	port
bbfb0c95-df74-4043-af21-ff214ec2b0a0	smtp.gmail.com	host
bbfb0c95-df74-4043-af21-ff214ec2b0a0	vutien.dat.work+beatbuddy@gmail.com	replyTo
bbfb0c95-df74-4043-af21-ff214ec2b0a0	vutien.dat.work+beatbuddy@gmail.com	from
bbfb0c95-df74-4043-af21-ff214ec2b0a0	Beat Buddy	fromDisplayName
bbfb0c95-df74-4043-af21-ff214ec2b0a0	vutien.dat.work@gmail.com	user
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.redirect_uris (client_id, value) FROM stdin;
42e846a4-a827-4703-bf13-b109fd47a7de	/realms/master/account/*
c9f45c5a-c9c2-485d-978b-9b3aacdda522	/realms/master/account/*
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	/admin/master/console/*
dafc5509-1e81-45a5-bd98-6d6181a5d07b	/realms/beatbuddy/account/*
8bc25416-0142-4f4e-8a69-838bee9f6b0a	/realms/beatbuddy/account/*
df064836-2d23-4b64-8386-52943fbdf40b	/admin/beatbuddy/console/*
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
55f2c385-0f93-48e1-9b57-5e5577736c85	VERIFY_EMAIL	Verify Email	f0fbc87d-9020-46ea-b572-7f7ccc131e82	t	f	VERIFY_EMAIL	50
417b0000-9b2b-4227-8ee3-ad78038821ac	UPDATE_PROFILE	Update Profile	f0fbc87d-9020-46ea-b572-7f7ccc131e82	t	f	UPDATE_PROFILE	40
ad8ec96e-6c94-49dc-9181-d361580c1b44	CONFIGURE_TOTP	Configure OTP	f0fbc87d-9020-46ea-b572-7f7ccc131e82	t	f	CONFIGURE_TOTP	10
39b9222c-a4b0-444c-9e86-851b5c4def3f	UPDATE_PASSWORD	Update Password	f0fbc87d-9020-46ea-b572-7f7ccc131e82	t	f	UPDATE_PASSWORD	30
fce3d7d1-21e0-44e9-b443-993098b7d498	TERMS_AND_CONDITIONS	Terms and Conditions	f0fbc87d-9020-46ea-b572-7f7ccc131e82	f	f	TERMS_AND_CONDITIONS	20
1b6c762c-8e96-44c4-929c-611399f1b720	delete_account	Delete Account	f0fbc87d-9020-46ea-b572-7f7ccc131e82	f	f	delete_account	60
0fad2d39-07e4-4f94-a645-b06c7fd034dc	update_user_locale	Update User Locale	f0fbc87d-9020-46ea-b572-7f7ccc131e82	t	f	update_user_locale	1000
84f6c38e-353b-40ef-8063-2a238951fe6e	webauthn-register	Webauthn Register	f0fbc87d-9020-46ea-b572-7f7ccc131e82	t	f	webauthn-register	70
4221ca3f-c2fa-4277-83f9-73f6ad5ff46c	webauthn-register-passwordless	Webauthn Register Passwordless	f0fbc87d-9020-46ea-b572-7f7ccc131e82	t	f	webauthn-register-passwordless	80
b6575d42-ea22-4529-ac43-34299915fb53	VERIFY_EMAIL	Verify Email	bbfb0c95-df74-4043-af21-ff214ec2b0a0	t	f	VERIFY_EMAIL	50
8c6d66da-6657-4e85-936d-f120aca9c4e4	UPDATE_PROFILE	Update Profile	bbfb0c95-df74-4043-af21-ff214ec2b0a0	t	f	UPDATE_PROFILE	40
6eae8b79-7c21-48e5-8ae5-2517586b14bf	CONFIGURE_TOTP	Configure OTP	bbfb0c95-df74-4043-af21-ff214ec2b0a0	t	f	CONFIGURE_TOTP	10
08d76043-1bde-4638-9c19-dbc0d09da68e	UPDATE_PASSWORD	Update Password	bbfb0c95-df74-4043-af21-ff214ec2b0a0	t	f	UPDATE_PASSWORD	30
42058e8c-7cd8-40e5-aae0-feecc8cbed93	TERMS_AND_CONDITIONS	Terms and Conditions	bbfb0c95-df74-4043-af21-ff214ec2b0a0	f	f	TERMS_AND_CONDITIONS	20
71554b20-70e3-4229-94b1-f2efdfdc792c	delete_account	Delete Account	bbfb0c95-df74-4043-af21-ff214ec2b0a0	f	f	delete_account	60
1d5638d6-b0bd-4074-bc12-2d871da03558	update_user_locale	Update User Locale	bbfb0c95-df74-4043-af21-ff214ec2b0a0	t	f	update_user_locale	1000
181afb62-a652-4c27-af04-0a498d8c3ff0	webauthn-register	Webauthn Register	bbfb0c95-df74-4043-af21-ff214ec2b0a0	t	f	webauthn-register	70
bde2ec32-51df-4892-9484-2eb0c443ac0c	webauthn-register-passwordless	Webauthn Register Passwordless	bbfb0c95-df74-4043-af21-ff214ec2b0a0	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
c9f45c5a-c9c2-485d-978b-9b3aacdda522	aee7442b-d371-4b4d-9778-35e10fd4cacd
c9f45c5a-c9c2-485d-978b-9b3aacdda522	f12c528d-c3b4-4396-ade9-b7a78c39489a
8bc25416-0142-4f4e-8a69-838bee9f6b0a	1d4d416b-cb76-4c23-b555-ad229a5a0c89
8bc25416-0142-4f4e-8a69-838bee9f6b0a	607eadc5-7ffd-4cb2-98ec-72acf42da09a
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
952b0a1b-7c30-4041-8a0a-b86cb11200ad	vutien.dat.work@gmail.com	vutien.dat.work@gmail.com	t	t	\N	Admin	\N	f0fbc87d-9020-46ea-b572-7f7ccc131e82	admin	1702553071148	\N	0
34433fd8-0561-4c75-a52b-1321f83f7676	vutien.dat.3601@gmail.com	vutien.dat.3601@gmail.com	f	t	\N	Dat	Vu	bbfb0c95-df74-4043-af21-ff214ec2b0a0	vutien.dat.3601@gmail.com	1702553529775	\N	0
d7569e76-6493-4b5f-b95e-0636e60f3809	vutien.dat.learning@gmail.com	vutien.dat.learning@gmail.com	f	t	\N	Dat	Vu	bbfb0c95-df74-4043-af21-ff214ec2b0a0	vutien.dat.learning@gmail.com	1702553550430	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
34433fd8-0561-4c75-a52b-1321f83f7676	VERIFY_EMAIL
d7569e76-6493-4b5f-b95e-0636e60f3809	VERIFY_EMAIL
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
a352824c-e889-4ad3-a724-e776e5da2987	952b0a1b-7c30-4041-8a0a-b86cb11200ad
bcbc7ef7-20b1-4b1f-a611-a4e7c9749aca	952b0a1b-7c30-4041-8a0a-b86cb11200ad
f1a5b5ee-8ff5-4329-abb2-19782b8e7b56	952b0a1b-7c30-4041-8a0a-b86cb11200ad
aa39167e-b4fc-463f-bf76-75cfffcb09cf	952b0a1b-7c30-4041-8a0a-b86cb11200ad
97d55325-63ab-47b8-b734-fe96ce962747	952b0a1b-7c30-4041-8a0a-b86cb11200ad
df4a7bf7-4ea1-4515-b24c-744d98e54efc	952b0a1b-7c30-4041-8a0a-b86cb11200ad
27757cb2-bbee-4116-9194-8d16a698d52f	952b0a1b-7c30-4041-8a0a-b86cb11200ad
d3db8514-40bd-481b-9bb9-e9c346d2728d	952b0a1b-7c30-4041-8a0a-b86cb11200ad
8d208f7b-c2a8-4b18-8839-9d8fc8c580d8	952b0a1b-7c30-4041-8a0a-b86cb11200ad
66fa6c81-8a48-44f6-b729-041d873a4903	952b0a1b-7c30-4041-8a0a-b86cb11200ad
9b6fd0c5-4620-4e45-a607-a6fee68f8fcd	952b0a1b-7c30-4041-8a0a-b86cb11200ad
0b8a4bf5-7777-464d-9ad6-2afe9b476000	952b0a1b-7c30-4041-8a0a-b86cb11200ad
ea17aeb9-cdf8-4c21-803c-986cbc0381ea	952b0a1b-7c30-4041-8a0a-b86cb11200ad
0204bbb3-4f8e-4527-9070-bc5b87c0feba	952b0a1b-7c30-4041-8a0a-b86cb11200ad
e9e3146c-9d10-45b9-8e3d-7aabdbef8875	952b0a1b-7c30-4041-8a0a-b86cb11200ad
29de3798-8fae-4370-b1f6-ba69809fd04b	952b0a1b-7c30-4041-8a0a-b86cb11200ad
8e505167-e02a-4615-a604-390265862b54	952b0a1b-7c30-4041-8a0a-b86cb11200ad
50dd7e24-d8bf-4ef9-b3f4-01a0a37374de	952b0a1b-7c30-4041-8a0a-b86cb11200ad
9b183106-5f93-466b-beff-4e7996a91ed4	952b0a1b-7c30-4041-8a0a-b86cb11200ad
ba014b3c-92ed-48fc-ab62-d025f714bb5f	34433fd8-0561-4c75-a52b-1321f83f7676
ba014b3c-92ed-48fc-ab62-d025f714bb5f	d7569e76-6493-4b5f-b95e-0636e60f3809
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: beatbuddyauth
--

COPY public.web_origins (client_id, value) FROM stdin;
b26e1fd0-a2d5-4381-91ea-7fd3544254eb	+
df064836-2d23-4b64-8386-52943fbdf40b	+
42d54420-bf4d-4bad-8502-6df7ea7e5ddb	/*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: beatbuddyauth
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: beatbuddyauth
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--


CREATE TABLE `hydra_client` (
  `id` varchar(255) NOT NULL,
  `client_name` text NOT NULL,
  `client_secret` text NOT NULL,
  `scope` text NOT NULL,
  `owner` text NOT NULL,
  `policy_uri` text NOT NULL,
  `tos_uri` text NOT NULL,
  `client_uri` text NOT NULL,
  `logo_uri` text NOT NULL,
  `client_secret_expires_at` int NOT NULL DEFAULT '0',
  `sector_identifier_uri` text NOT NULL,
  `jwks` text NOT NULL,
  `jwks_uri` text NOT NULL,
  `token_endpoint_auth_method` varchar(25) NOT NULL DEFAULT '',
  `request_object_signing_alg` varchar(10) NOT NULL DEFAULT '',
  `userinfo_signed_response_alg` varchar(10) NOT NULL DEFAULT '',
  `subject_type` varchar(15) NOT NULL DEFAULT '',
  `pk_deprecated` int unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `frontchannel_logout_uri` text NOT NULL,
  `frontchannel_logout_session_required` tinyint(1) NOT NULL DEFAULT '0',
  `backchannel_logout_uri` text NOT NULL,
  `backchannel_logout_session_required` tinyint(1) NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `token_endpoint_auth_signing_alg` varchar(10) NOT NULL DEFAULT '',
  `authorization_code_grant_access_token_lifespan` bigint DEFAULT NULL,
  `authorization_code_grant_id_token_lifespan` bigint DEFAULT NULL,
  `authorization_code_grant_refresh_token_lifespan` bigint DEFAULT NULL,
  `client_credentials_grant_access_token_lifespan` bigint DEFAULT NULL,
  `implicit_grant_access_token_lifespan` bigint DEFAULT NULL,
  `implicit_grant_id_token_lifespan` bigint DEFAULT NULL,
  `jwt_bearer_grant_access_token_lifespan` bigint DEFAULT NULL,
  `password_grant_access_token_lifespan` bigint DEFAULT NULL,
  `password_grant_refresh_token_lifespan` bigint DEFAULT NULL,
  `refresh_token_grant_id_token_lifespan` bigint DEFAULT NULL,
  `refresh_token_grant_access_token_lifespan` bigint DEFAULT NULL,
  `refresh_token_grant_refresh_token_lifespan` bigint DEFAULT NULL,
  `pk` char(36) DEFAULT NULL,
  `registration_access_token_signature` varchar(128) NOT NULL DEFAULT '',
  `nid` char(36) NOT NULL,
  `redirect_uris` json NOT NULL,
  `grant_types` json NOT NULL,
  `response_types` json NOT NULL,
  `audience` json NOT NULL,
  `allowed_cors_origins` json NOT NULL,
  `contacts` json NOT NULL,
  `request_uris` json NOT NULL,
  `post_logout_redirect_uris` json NOT NULL DEFAULT (_utf8mb4'[]'),
  `access_token_strategy` varchar(10) NOT NULL DEFAULT '',
  `skip_consent` tinyint(1) NOT NULL DEFAULT '0',
  `skip_logout_consent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`nid`),
  UNIQUE KEY `hydra_client_id_key` (`id`,`nid`),
  KEY `pk_deprecated` (`pk_deprecated`),
  KEY `hydra_client_nid_fk_idx` (`nid`),
  CONSTRAINT `hydra_client_nid_fk_idx` FOREIGN KEY (`nid`) REFERENCES `networks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
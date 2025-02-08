CREATE TABLE `hydra_oauth2_authentication_session` (
  `id` varchar(40) NOT NULL,
  `authenticated_at` timestamp NULL DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `remember` tinyint(1) NOT NULL DEFAULT '0',
  `nid` char(36) NOT NULL,
  `identity_provider_session_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hydra_oauth2_authentication_session_sub_idx` (`subject`),
  KEY `hydra_oauth2_authentication_session_nid_fk_idx` (`nid`),
  KEY `hydra_oauth2_authentication_session_subject_nid_idx` (`subject`,`nid`),
  CONSTRAINT `hydra_oauth2_authentication_session_nid_fk_idx` FOREIGN KEY (`nid`) REFERENCES `networks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
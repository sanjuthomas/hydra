CREATE TABLE `hydra_oauth2_obfuscated_authentication_session` (
  `subject` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `subject_obfuscated` varchar(255) NOT NULL,
  `nid` char(36) NOT NULL,
  PRIMARY KEY (`subject`,`client_id`,`nid`),
  UNIQUE KEY `hydra_oauth2_obfuscated_authentication_session_so_nid_idx` (`client_id`,`subject_obfuscated`,`nid`),
  KEY `hydra_oauth2_obfuscated_authentication_session_nid_fk_idx` (`nid`),
  KEY `hydra_oauth2_obfuscated_authentication_session_client_id_fk` (`client_id`,`nid`),
  CONSTRAINT `hydra_oauth2_obfuscated_authentication_session_client_id_fk` FOREIGN KEY (`client_id`, `nid`) REFERENCES `hydra_client` (`id`, `nid`) ON DELETE CASCADE,
  CONSTRAINT `hydra_oauth2_obfuscated_authentication_session_nid_fk_idx` FOREIGN KEY (`nid`) REFERENCES `networks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
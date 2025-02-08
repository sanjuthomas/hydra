CREATE TABLE `hydra_oauth2_jti_blacklist` (
  `signature` varchar(64) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nid` char(36) NOT NULL,
  PRIMARY KEY (`signature`,`nid`),
  KEY `hydra_oauth2_jti_blacklist_nid_fk_idx` (`nid`),
  KEY `hydra_oauth2_jti_blacklist_expiry` (`expires_at`,`nid`),
  CONSTRAINT `hydra_oauth2_jti_blacklist_nid_fk_idx` FOREIGN KEY (`nid`) REFERENCES `networks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
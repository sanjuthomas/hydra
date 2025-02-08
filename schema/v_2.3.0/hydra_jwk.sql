CREATE TABLE `hydra_jwk` (
  `sid` varchar(255) NOT NULL,
  `kid` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `version` int NOT NULL DEFAULT '0',
  `keydata` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pk_deprecated` int unsigned NOT NULL AUTO_INCREMENT,
  `pk` char(36) NOT NULL,
  `nid` char(36) NOT NULL,
  PRIMARY KEY (`pk`),
  UNIQUE KEY `hydra_jwk_sid_kid_nid_key` (`sid`,`kid`,`nid`),
  KEY `pk_deprecated` (`pk_deprecated`),
  KEY `hydra_jwk_nid_sid_created_at_idx` (`nid`,`sid`,`created_at`),
  KEY `hydra_jwk_nid_sid_kid_created_at_idx` (`nid`,`sid`,`kid`,`created_at`),
  CONSTRAINT `hydra_jwk_nid_fk_idx` FOREIGN KEY (`nid`) REFERENCES `networks` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
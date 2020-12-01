CREATE TABLE `country` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `district` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `locality` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_country` smallint unsigned NOT NULL,
  `id_region` smallint unsigned NOT NULL,
  `id_district` mediumint unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_locality_district_idx` (`id_district`),
  KEY `fk_locality_region_idx` (`id_region`),
  KEY `fk_locality_country_idx` (`id_country`),
  CONSTRAINT `fk_locality_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`),
  CONSTRAINT `fk_locality_district` FOREIGN KEY (`id_district`) REFERENCES `district` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_locality_region` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `region` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `id_country` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `fk_region_country_idx` (`id_country`),
  CONSTRAINT `fk_region_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

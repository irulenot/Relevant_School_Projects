#Anthony Bilic
#20514128

CREATE DATABASE IF NOT EXISTS `TopicalBirds`;
USE `TopicalBirds`;

# USERS

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
	`tag` INTEGER NOT NULL,
	`email` VARCHAR(30) NOT NULL,
    `password` VARCHAR(30) NOT NULL,
	`sign_date` DATE NOT NULL,
    `country`VARCHAR(163) NOT NULL,
    `number` INTEGER NOT NULL,
    `mailcode` INTEGER NOT NULL,
    `street` VARCHAR(34) NOT NULL,
    `city`VARCHAR(58) NOT NULL,
    `state`VARCHAR(12) NOT NULL,
	PRIMARY KEY (`tag`)
);

DROP TABLE IF EXISTS `Watcher`;
CREATE TABLE `Watcher` (
	`tag` INTEGER NOT NULL,
    `fee` decimal(10,2),
    `bname` VARCHAR(20),
    `bsector` VARCHAR(20),
    `fdate` DATE,
    FOREIGN KEY (`tag`) REFERENCES `User`(`tag`)
);

DROP TABLE IF EXISTS `Bird`;
CREATE TABLE `Bird` (
	`tag` INTEGER NOT NULL,
    `gender` CHAR(1) NOT NULL,
	`last_name`VARCHAR(20) NOT NULL,
    `first_name`VARCHAR(20) NOT NULL,
	`income` INTEGER,
	FOREIGN KEY (`tag`) REFERENCES `User`(`tag`)
);

DROP TABLE IF EXISTS `Peacock`;
CREATE TABLE `Peacock` (
	`tag` INTEGER NOT NULL,
    FOREIGN KEY (`tag`) REFERENCES `Bird`(`tag`)
);

# MEDIA

DROP TABLE IF EXISTS `Topic`;
CREATE TABLE `Topic` (
	`id` INTEGER  NOT NULL,
	`name` VARCHAR(20),
	`description` VARCHAR(120),
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `Chrip`;
CREATE TABLE `Chirp` (
	`tag` INTEGER NOT NULL,
    `cno` INTEGER NOT NULL,
	`latitude` decimal(2,1) NOT NULL,
    `longitude` decimal(2,1) NOT NULL,
    `text` VARCHAR(120) NOT NULL,
    `date` DATE NOT NULL,
    `time` TIME NOT NULL,
    `sentiment` INTEGER,
	PRIMARY KEY (`cno`),
	FOREIGN KEY (`tag`) REFERENCES `Bird`(`tag`)
);

DROP TABLE IF EXISTS `Ad`;
CREATE TABLE `Ad` (
	`tag` INTEGER NOT NULL,
    `id` INTEGER NOT NULL,
	`caption` VARCHAR(60) NOT NULL,
	`picture` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`tag`) REFERENCES `Watcher`(`tag`)
);

# RELATIONSHIPS

DROP TABLE IF EXISTS `About`;
CREATE TABLE `About` (
	`cno` INTEGER NOT NULL,
    `id` INTEGER NOT NULL,
    FOREIGN KEY (`id`) REFERENCES `Topic`(`id`),
	FOREIGN KEY (`cno`) REFERENCES `Chirp`(`cno`)
);

DROP TABLE IF EXISTS `TopicListen`;
CREATE TABLE `TopicListen` (
	`tag` INTEGER NOT NULL,
    `id` INTEGER NOT NULL,
    FOREIGN KEY (`id`) REFERENCES `Topic`(`id`),
    FOREIGN KEY (`tag`) REFERENCES `User`(`tag`)
);

DROP TABLE IF EXISTS `Interests`;
CREATE TABLE `Interests` (
	`level` INTEGER NOT NULL,
    `tag` INTEGER NOT NULL,
	`id` INTEGER NOT NULL,
    FOREIGN KEY (`id`) REFERENCES `Topic`(`id`),
    FOREIGN KEY (`tag`) REFERENCES `User`(`tag`)
);

DROP TABLE IF EXISTS `BirdListen`;
CREATE TABLE `BirdListen` (
	`tag` INTEGER NOT NULL,
    `tag2` INTEGER NOT NULL,
    FOREIGN KEY (`tag`) REFERENCES `User`(`tag`),
	FOREIGN KEY (`tag2`) REFERENCES `Bird`(`tag`)
);

DROP TABLE IF EXISTS `Variety`;
CREATE TABLE `Variety` (
	`tag` INTEGER NOT NULL,
    `var` VARCHAR(30) NOT NULL,
	FOREIGN KEY (`tag`) REFERENCES `Peacock`(`tag`) ON DELETE CASCADE
);
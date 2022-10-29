-- SQLBook: Code
DROP TABLE tblUsers;
CREATE TABLE `tblUsers`
(
    `id`           INT          NOT NULL AUTO_INCREMENT,
    `uuid`         BINARY(16)   NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
    `onlineStatus` BOOLEAN      NOT NULL,
    `email`        VARCHAR(50)  NOT NULL,
    `lastLogin`    DATETIME     NOT NULL,
    `login`        VARCHAR(20)  NOT NULL,
    `name`         VARCHAR(15)  NOT NULL,
    `password`     VARCHAR(64)  NOT NULL,
    `patronymic`   VARCHAR(15)  NULL,
    `surname`      VARCHAR(15)  NOT NULL,
    `resumeUrl`    VARCHAR(512) NULL,
    `telephone`    VARCHAR(13)  NOT NULL,
    CONSTRAINT PK_Users PRIMARY KEY (`id`),
    CONSTRAINT Id_Uuid UNIQUE (`uuid`),
    CONSTRAINT UQ_Users_Email UNIQUE (`email`),
    CONSTRAINT UQ_Users_Telephone UNIQUE (`telephone`)
);

/*AUX*/
DELIMITER $$

CREATE PROCEDURE sp_regUser(email1 VARCHAR(50), login1 VARCHAR(20), name1 VARCHAR(15), password1 VARCHAR(20), telephone1 VARCHAR(13))
BEGIN
    INSERT INTO `tblUsers` (`onlineStatus`,`email`,`lastLogin`,`login`,`name`,`password`,`patronymic`,`surname`, `telephone`)
    VALUES (0, email1 ,NOW(), login1, name1, password1,'Побатькові','Прізвище', telephone1);
END $$

delimiter ;

DELIMITER $$
DROP TRIGGER tr_regVoteForUser;
CREATE TRIGGER tr_regVoteForUser AFTER INSERT ON `tblUsers`
    FOR EACH ROW
    BEGIN
        CALL sp_voteUser();
    end;

DELIMITER $$

CREATE PROCEDURE sp_getUserByEmail(email VARCHAR(50))
BEGIN
    SELECT * FROM `tblUsers` `u`
    WHERE `u`.`email` = email;
END $$

delimiter ;

DELIMITER $$






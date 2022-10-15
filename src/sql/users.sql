-- SQLBook: Code
#TODO: CHANGE ID ON UUID IN VOTES

CREATE TABLE `tblUsers`
(
    `id` INT NOT NULL AUTO_INCREMENT
    ,`uuid` BINARY(16) NOT NULL DEFAULT (UUID_TO_BIN(UUID()))
    ,`onlineStatus` BOOLEAN NOT NULL
    ,`email` VARCHAR(50) NOT NULL
    ,`lastLogin` DATETIME NOT NULL
    ,`login` VARCHAR(20) NOT NULL
    ,`name` VARCHAR(15) NOT NULL
    ,`password` VARCHAR(64) NOT NULL
    ,`patronymic` VARCHAR(15) NULL
    ,`surname` VARCHAR(15) NOT NULL
    ,`resumeUrl` VARCHAR(512) NULL
    ,`telephone` VARCHAR(13) NOT NULL
        ,CONSTRAINT PK_Users_Id_Uuid PRIMARY KEY (`id`, `uuid`)
        ,CONSTRAINT UQ_Users_Email UNIQUE (`email`)
        ,CONSTRAINT UQ_Users_Telephone UNIQUE (`telephone`)
        ,CONSTRAINT CHK_Users_Email CHECK (`email` REGEXP '^[a-z0-9]+@[a-z0-9]+.[a-z0-9]+$')
        ,CONSTRAINT CHK_Users_Login CHECK (`login` REGEXP '^[A-z0-9]{2,}$')
        ,CONSTRAINT CHK_Users_Telephone CHECK (`telephone` REGEXP '^\+380[0-9]{9}$')         # TODO: add country codes
        ,CONSTRAINT CHK_Users_Anthroponyms CHECK (
            REGEXP_LIKE(`name`, '^[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії'']+$', 'c')
            AND REGEXP_LIKE(`patronymic`, '^[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії'']+$', 'c')
            AND REGEXP_LIKE(`surname`, '^[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії'']+$', 'c')
        )
        ,CONSTRAINT CHK_Users_Password CHECK (
            `password` REGEXP '.{6,}'
            AND `password` REGEXP '[[:digit:]]'
            /*AND `password` REGEXP '[^[:alnum:]]'*/
            AND REGEXP_LIKE(`password`, '[[:lower:]]', 'c')
            AND REGEXP_LIKE(`password`, '[[:upper:]]', 'c')
        )
);

INSERT INTO `tblUsers` (`onlineStatus`,`email`,`lastLogin`,`login`,`name`,`password`,`patronymic`,`surname`, `telephone`)
VALUES (0,'email46@email.com',NOW(),'M20A20X','Ім''я','Аm$7klh','Побатькові','Прізвище', '380662907472');

INSERT INTO tblUsers (onlineStatus,email,lastLogin,login,name,password,patronymic,surname,telephone)
VALUES (0, ${email1},NOW(),${login1},${name1},${password1},'Побатькові', 'Прізвище',${telephone1});


DROP PROCEDURE sp_regUser;
/*AUX*/
DELIMITER $$

CREATE PROCEDURE sp_regUser(email1 VARCHAR(50), login1 VARCHAR(20), name1 VARCHAR(15), password1 VARCHAR(20), telephone1 VARCHAR(13))
BEGIN

    INSERT INTO `tblUsers` (`onlineStatus`,`email`,`lastLogin`,`login`,`name`,`password`,`patronymic`,`surname`, `telephone`)
    VALUES (0, email1 ,NOW(), login1, name1, password1,'Побатькові','Прізвище', telephone1);
END $$

delimiter ;

DELIMITER $$

CREATE PROCEDURE sp_voteUser()
    BEGIN
        
        INSERT INTO `Votes` (`UserId`)
        VALUES ((SELECT MAX(id) FROM `tblUsers`));
    END;

delimiter ;

CREATE TRIGGER tr_regVoteForUser AFTER INSERT ON `tblUsers`
    FOR EACH ROW
    BEGIN
        CALL sp_voteUser();
    end;

DROP PROCEDURE sp_getUserByEmail;

DELIMITER $$

CREATE PROCEDURE sp_getUserByEmail(email VARCHAR(50))
BEGIN
    SELECT * FROM `tblUsers` `u`
    WHERE `u`.`email` = email;
END $$

delimiter ;

DELIMITER $$

CREATE PROCEDURE sp_getUserByLogin(email VARCHAR(50), password VARCHAR(64))
BEGIN
    SELECT * FROM `tblUsers` `u`
    WHERE `u`.`email` = email AND `u`.`password` = password;
END $$

delimiter ;


-- SQLBook: Code
CREATE TABLE `tblUsers`
(
    `id` INT NOT NULL AUTO_INCREMENT
    ,`uuid` BINARY(16) NOT NULL DEFAULT (UUID_TO_BIN(UUID()))
    ,`onlineStatus` BOOLEAN NOT NULL
    ,`email` VARCHAR(50) NOT NULL
    ,`lastLogin` DATETIME NOT NULL
    ,`login` VARCHAR(20) NOT NULL
    ,`name` VARCHAR(15) NOT NULL
    ,`password` VARCHAR(20) NOT NULL
    ,`patronymic` VARCHAR(15) NOT NULL
    ,`surname` VARCHAR(15) NOT NULL
    ,`group` VARCHAR(10) NULL
    ,`resumeUrl` VARCHAR(512) NULL
    ,`telephone` VARCHAR(13) NULL
        ,CONSTRAINT PK_Users_Id_Uuid PRIMARY KEY (`id`, `uuid`)
        ,CONSTRAINT UQ_Users_Email UNIQUE (`email`)
        ,CONSTRAINT UQ_Users_Telephone UNIQUE (`telephone`)
        ,CONSTRAINT CHK_Users_Email CHECK (`email` REGEXP '^[a-z0-9]+@[a-z0-9]+.[a-z0-9]+$')
        ,CONSTRAINT CHK_Users_Group CHECK (`group` REGEXP '^[А-ЯҐІЇЄ]{2}-[0-9]{2}$')         # TODO: clarify group REGEXP
        ,CONSTRAINT CHK_Users_Login CHECK (`login` REGEXP '^[A-z0-9]{2,}$')
        ,CONSTRAINT CHK_Users_Telephone CHECK (`telephone` REGEXP '^\+380[0-9]{9}$')         # TODO: add country codes
        ,CONSTRAINT CHK_Users_Antroponyms CHECK (
            REGEXP_LIKE(`name`, '^[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії'']+$', 'c')
            AND REGEXP_LIKE(`patronymic`, '^[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії'']+$', 'c')
            AND REGEXP_LIKE(`surname`, '^[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії'']+$', 'c')
        )
        ,CONSTRAINT CHK_Users_Password CHECK (
            `password` REGEXP '.{6,}'
            AND `password` REGEXP '[[:digit:]]'
            AND `password` REGEXP '[^[:alnum:]]'
            AND REGEXP_LIKE(`password`, '[[:lower:]]', 'c')
            AND REGEXP_LIKE(`password`, '[[:upper:]]', 'c')
        )
);

INSERT INTO `tblUsers` (`onlineStatus`,`email`,`lastLogin`,`login`,`name`,`password`,`patronymic`,`surname`)
VALUES (0,'email@email.com',NOW(),'M20A20X','Ім''я','А%м7kl','Побатькові','Прізвище');

--AUX
DELIMITER $$

CREATE PROCEDURE sp_getTestById(testId INT)
BEGIN
    SELECT * FROM tblTests t
    WHERE t.id = testId;
END $$

DELIMITER ;
DROP TABLE IF EXIST `tblProjects`;
CREATE TABLE `tblProjects`(
                          `id` INT NOT NULL AUTO_INCREMENT,
                          `text` VARCHAR(2000) NOT NULL,
                          `imageUrl` VARCHAR(500) NOT NULL,
                          CONSTRAINT Projects_PK_Id PRIMARY KEY (`id`),
                          CONSTRAINT Projects_UQ_Text UNIQUE (`text`),
                          CONSTRAINT Projects_CHK_Text CHECK (REGEXP_LIKE(`text`, '[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії[:punct:][:cntrl:][:blank:]]+.', 'c')),
                          CONSTRAINT Projects_CHK_ImageUrl CHECK (`imageUrl` REGEXP '^http(s)?:\/\/[[:alnum:]]+.([[:alnum:]]+.)?[[:alpha:]]{2,3}\/\.*')
    );

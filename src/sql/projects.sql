DROP TABLE IF EXISTS `tblProjects`;
CREATE TABLE `tblProjects`(
                          `id` INT NOT NULL AUTO_INCREMENT,
                          `text` VARCHAR(1000) NOT NULL,
                          `imageUrl` VARCHAR(500) NOT NULL,
                          CONSTRAINT Projects_PK_Id PRIMARY KEY (`id`),
                          CONSTRAINT Projects_UQ_Text UNIQUE (`text`)
#                           CONSTRAINT Projects_CHK_Text CHECK (REGEXP_LIKE(`text`, '[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії[:punct:][:cntrl:][:blank:]]+.', 'c')),
#                           CONSTRAINT Projects_CHK_ImageUrl CHECK (`imageUrl` REGEXP '^http(s)?:\/\/[[:alnum:]]+.([[:alnum:]]+.)?[[:alpha:]]{2,3}\/\.*')
);
Use ig;
SELECT * FROM tblProjects;
CREATE PROCEDURE sp_PostProjects(text varchar(1000), imageUrl varchar(500))
Begin
INSERT INTO tblProjects(text, imageUrl)
VALUES (text, imageUrl);
end;
call sp_PostProjects('', '');

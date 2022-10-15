DROP TABLE IF EXISTS `tblStudy`;
CREATE TABLE `tblStudy`(
                          `id` INT NOT NULL AUTO_INCREMENT,
                          `text` VARCHAR(1000) NOT NULL,
                          `imageUrl` VARCHAR(500) NOT NULL,
                          CONSTRAINT Study_PK_Id PRIMARY KEY (`id`),
                          CONSTRAINT Study_UQ_Text UNIQUE (`text`)
#                           CONSTRAINT Study_CHK_Text CHECK (REGEXP_LIKE(`text`, '[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії[:punct:][:cntrl:][:blank:]]+.', 'c')),
#                           CONSTRAINT Study_CHK_ImageUrl CHECK (`imageUrl` REGEXP '^http(s)?:\/\/[[:alnum:]]+.([[:alnum:]]+.)?[[:alpha:]]{2,3}
);
Use ig;
SELECT * FROM tblStudy;
CREATE PROCEDURE sp_PostStudy(text varchar(1000), imageUrl varchar(500))
Begin
INSERT INTO tblStudy(text, imageUrl)
VALUES (text, imageUrl);
end;
call sp_PostStudy('', '');

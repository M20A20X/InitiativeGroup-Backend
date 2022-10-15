DROP TABLE IF EXISTS `tblNews`;
CREATE TABLE `tblNews`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(300) NOT NULL,
    `imageUrl` VARCHAR(500) NOT NULL,
        CONSTRAINT News_PK_Id PRIMARY KEY (`id`),
        CONSTRAINT News_UQ_Text UNIQUE (`text`)
#         CONSTRAINT News_CHK_Text CHECK (REGEXP_LIKE(`text`, '[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії[:punct:][:cntrl:][:blank:]]+.', 'c'))
#         CONSTRAINT News_CHK_ImageUrl CHECK (`imageUrl` REGEXP '^http(s)?:\/\/[[:alnum:]]+.([[:alnum:]]+.)?[[:alpha:]]{2,3}\/\.*')
);

Use ig;
SELECT * FROM tblNews;
CREATE PROCEDURE sp_PostNews(text varchar(300), imageUrl varchar(500))
Begin
    INSERT INTO tblNews(text, imageUrl)
        VALUES (text, imageUrl);
end;
call sp_PostNews('авс', 'bca');

# Array of main data for tests
DROP TABLE IF EXISTS `tblTests`;
CREATE TABLE `tblTests`
(
    `id` INT NOT NULL AUTO_INCREMENT
    ,`name` VARCHAR(20) NOT NULL
    ,`timeLimit` INT NOT NULL
        ,CONSTRAINT PK_Tests_Id PRIMARY KEY (`id`)
        ,CONSTRAINT UQ_Tests_Name UNIQUE (`name`)
        ,CONSTRAINT CHK_Tests_Name CHECK (REGEXP_LIKE(`name`, '^[А-ЩЬЮЯҐЄІЇ][а-щьюяґєії0-9[:punct:][:cntrl:][:blank:]]+$', 'c'))
        ,CONSTRAINT CHK_Tests_TimeLimit CHECK (`timeLimit` > 1)
);

-- AUX --
DELIMITER $$
/*
sp_getQuestionsByTestId - gets test's common data by test's id
Params:
    testId <INT>    test id
*/
DROP PROCEDURE IF EXISTS `sp_getTestById` $$
CREATE PROCEDURE `sp_getTestById`(testId INT)
BEGIN
    SELECT * FROM `tblTests` `t`
    WHERE `t`.`id` = `testId`;
END $$

/*
sp_getQuestionsByTestId - gets test's questions array by test's id
Params:
    testId <INT>    test id
*/
DROP PROCEDURE IF EXISTS `sp_getQuestionsByTestId` $$
CREATE PROCEDURE `sp_getQuestionsByTestId`(testId INT)
BEGIN
    SELECT 
        `q`.`id`
        ,`q`.`initValue`
        ,`q`.`options`
        ,`q`.`text`
        ,`qt`.`type`
        ,`pl`.`language`
    FROM (
        SELECT * FROM `tblQuestions` `qs`
        WHERE `qs`.`testId` = testId
    ) AS `q`
    INNER JOIN `tblQuestTypes` `qt` ON `qt`.`id` = `q`.`questTypeId`
    LEFT JOIN `tblProgLangs` `pl` ON `pl`.`id` = `q`.`progLangId`;
END $$

/*
sp_getQuestionsByTestId - gets HTML inputs types for question's options
*/
DROP PROCEDURE IF EXISTS `sp_getQuestTypes` $$
CREATE PROCEDURE `sp_getQuestTypes`()
BEGIN
    SELECT `type` FROM `tblQuestTypes`;
END $$

DELIMITER ;

# Array of questions for test
DROP TABLE IF EXISTS `tblQuestions`;
CREATE TABLE `tblQuestions`
(
    `id` INT NOT NULL AUTO_INCREMENT
    ,`testId` INT NOT NULL
    ,`progLangId` INT NULL
    ,`questTypeId` INT NOT NULL
    ,`text` VARCHAR(50) NOT NULL
    ,`options` VARCHAR(300) NOT NULL
    ,`initValue` VARCHAR(300) NULL
        ,CONSTRAINT PK_Questions_Id PRIMARY KEY (`id`)
        ,CONSTRAINT FK_Questions_Tests_Id FOREIGN KEY (`testId`) REFERENCES `tblTests` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
        ,CONSTRAINT FK_Questions_QuestTypes_Id FOREIGN KEY (`questTypeId`) REFERENCES `tblQuestTypes` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
        ,CONSTRAINT UQ_Questions_Text UNIQUE (`text`)
        ,CONSTRAINT FK_Questions_ProgLangs_Id FOREIGN KEY (`progLangId`) REFERENCES `tblProgLangs` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

-- AUX --

# Types of HTML inputs for questions
DROP TABLE IF EXISTS `tblQuestTypes`;
CREATE TABLE `tblQuestTypes`(
    `id` INT NOT NULL AUTO_INCREMENT
    ,`type` VARCHAR(10) NOT NULL
        ,CONSTRAINT PK_QuestTypes_Id PRIMARY KEY (`id`)
        ,CONSTRAINT UQ_QuestTypes_Type UNIQUE (`type`)
        ,CONSTRAINT CHK_QuestTypes_Type CHECK (REGEXP_LIKE(`type`, '^[a-z]+$', 'c'))
);

# Programming language names
DROP TABLE IF EXISTS `tblProgLangs`;
CREATE TABLE `tblProgLangs`(
    `id` INT NOT NULL AUTO_INCREMENT
    ,`language` VARCHAR(15) NOT NULL
        ,CONSTRAINT PK_ProgLangs_Id PRIMARY KEY (`id`)
        ,CONSTRAINT UQ_ProgLangs_Language UNIQUE (`language`)
        ,CONSTRAINT CHK_ProgLangs_Language CHECK (REGEXP_LIKE(`language`, '^[a-z+#]+$', 'c'))
);

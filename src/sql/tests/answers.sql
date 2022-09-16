DROP TABLE IF EXISTS `tblAnswers`;
CREATE TABLE `tblAnswers`
(
    `id` INT NOT NULL AUTO_INCREMENT
    ,`questionId` INT NOT NULL
    ,`regex` VARCHAR(50) NOT NULL
    ,`regexGroup` VARCHAR(20) NOT NULL
        ,CONSTRAINT PK_Answers_Id PRIMARY KEY (`id`)
        ,CONSTRAINT FK_Answers_Questions_Id FOREIGN KEY (`questionId`) REFERENCES `tblQuestions` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
        ,CONSTRAINT CHK_Answers_RegexGroup CHECK (REGEXP_LIKE(`regexGroup`, '^[A-z0-9]+$', 'c'))
);

DROP TABLE IF EXISTS `tblAnswTests`;
CREATE TABLE `tblAnswTests`
(
    `id` INT NOT NULL AUTO_INCREMENT
    ,`answerId` INT NOT NULL
        ,CONSTRAINT PK_AnswTests_Id PRIMARY KEY (`id`)
        ,CONSTRAINT FK_AnswTests_Answers_Id FOREIGN KEY (`answerId`) REFERENCES `tblAnswers` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS `tblAnswTestParams`;
CREATE TABLE `tblAnswTestParams`
(
    `id` INT NOT NULL AUTO_INCREMENT
    ,`answTestId` INT NOT NULL
    ,`args` VARCHAR(75) NOT NULL
    ,`result` VARCHAR(75) NOT NULL
        ,CONSTRAINT PK_AnswTestParams_Id PRIMARY KEY (`id`)
        ,CONSTRAINT FK_AnswTestParams_AnswTests_Id FOREIGN KEY (`answTestId`) REFERENCES `tblAnswTests` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
        ,CONSTRAINT UQ_AnswTestParams_Args UNIQUE (`args`)
        ,CONSTRAINT CHK_AnswTestParams_Args CHECK (REGEXP_LIKE(`args`, '^(([""].*[""])|([0-9]+([eE]|(\.[0-9]+))?)[[:blank:]]*,?[[:blank:]]*)+$', 'c'))
        ,CONSTRAINT CHK_AnswTestParams_Result CHECK (REGEXP_LIKE(`result`, '^(([""].*[""])|([0-9]+([eE]|(\.[0-9]+))?)[[:blank:]]*,?[[:blank:]]*)+$', 'c'))
);

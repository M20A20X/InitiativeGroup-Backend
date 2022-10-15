-- SQLBook: Code
DROP TABLE Votes;
CREATE TABLE Votes (

    `id` int NOT NULL AUTO_INCREMENT,
    `Unity` bool default(false) NOT NULL,
    `Front` bool default(false) NOT NULL,
    `Back` bool default(false) NOT NULL,
    `UserId` int NOT NULL,
    FOREIGN KEY (`UserId`) REFERENCES tblUsers (`id`),

        CONSTRAINT Votes_pk PRIMARY KEY (`id`)
         
);

DROP TABLE Cases;
CREATE TABLE Cases (
    `id` int NOT NULL AUTO_INCREMENT,
    `img` varchar(100) NOT NULL,
    `name` varchar(28) NOT NULL,
    `text` varchar(1000) NOT NULL,
    `numOfVotes` int NOT NULL,
        CONSTRAINT Cases_pk PRIMARY KEY (`id`)
);


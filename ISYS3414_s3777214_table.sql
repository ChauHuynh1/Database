CREATE DATABASE ATP_Tour;
USE ATP_Tour;

SET FOREIGN_KEY_CHECKS=0;

-- Create table Participant (Code, Name, Country) code: 2 first letter name, 3 number
CREATE TABLE Participant (
     Code VARCHAR(5),
     Name VARCHAR(200),
     Country VARCHAR(200),
     CONSTRAINT pk_Participant
     PRIMARY KEY (code),
     CHECK (code REGEXP '^[A-Z]{2}[[:digit:]]{3}$') 
                         );

-- Create table Stadium (Code, Name) 2 first letter name, 3 number
CREATE TABLE Stadium (
	 Code VARCHAR(5),
     Name VARCHAR(200),
     CONSTRAINT pk_Stadium
     PRIMARY KEY (code),
     CHECK (code REGEXP '^[A-Z]{2}[[:digit:]]{3}$') 
                     );

-- Create table Matches (Code, Phase, Start_time, Date, Stadium.code Stadium) code: 3 first letter name, 2 number
CREATE TABLE Matches (
     Code VARCHAR(5),
     Phase VARCHAR(200),
     Start_time TIME(0),
     Date DATE,
     Stadium VARCHAR(5),
     CONSTRAINT pk_Matches
     PRIMARY KEY (Code),
     CONSTRAINT fk_Matches_Stadium
     FOREIGN KEY (Stadium)
     REFERENCES Stadium (code) ON DELETE CASCADE ON UPDATE CASCADE,
     CHECK (code REGEXP '^[A-Z]{3}[[:digit:]]{2}$') 
                     );

-- Create table In_match (Matches.code Matches, Partcipant.code Participant, Score)
CREATE TABLE In_match (
     Matches VARCHAR(5),
     Participant VARCHAR(5),
     Score INT,
     CONSTRAINT fk_In_match_Matches
     FOREIGN KEY (Matches)
     REFERENCES Matches (code) ON DELETE CASCADE ON UPDATE CASCADE,
     CONSTRAINT pk_In_match
     PRIMARY KEY (Matches, Participant),
     CONSTRAINT fk_In_match_Participant
     FOREIGN KEY (Participant)
     REFERENCES Participant (code) ON DELETE CASCADE ON UPDATE CASCADE,
     CHECK (Score >= 0)
                      );

-- Create table Umpire (Code, Name) code: 2 first letter name, 3 number
CREATE TABLE Umpire (
     Code VARCHAR(5),
     Name VARCHAR(200),
     CONSTRAINT pk_Umpire
     PRIMARY KEY (code),
     CHECK (Code REGEXP '^(LI|CH)[[:digit:]]{3}$') 
                    );

-- Create table Line_umpire (Umpire.code Code, Name)
CREATE TABLE Line_umpire (
     Code VARCHAR(5),
     Name VARCHAR(200),
     CONSTRAINT pk_Line_umpire
     PRIMARY KEY (code),
     CONSTRAINT fk_Line_umpire_Umpire
     FOREIGN KEY (code)
     REFERENCES Umpire (code) ON DELETE CASCADE ON UPDATE CASCADE
                         );

-- Create table Chair_umpire (Umpire.code Code, Name)
CREATE TABLE Chair_umpire (
     Code VARCHAR(5),
     Name VARCHAR(200),
     CONSTRAINT pk_Chair_umpire
     PRIMARY KEY (code),
     CONSTRAINT fk_Chair_umpire_Umpire
     FOREIGN KEY (code)
     REFERENCES Umpire (code) ON DELETE CASCADE ON UPDATE CASCADE              
                   );

-- Create table Control (Umpire.code Umpire, Matches.code Matches)
CREATE TABLE Control (
     Umpire VARCHAR(5),
     Matches VARCHAR(5),
     CONSTRAINT fk_Control_Umpire
	 FOREIGN KEY (Umpire)
     REFERENCES Umpire (code) ON DELETE CASCADE ON UPDATE CASCADE,
     CONSTRAINT fk_Control_Matches
     FOREIGN KEY (Matches)
     REFERENCES Matches (code) ON DELETE CASCADE ON UPDATE CASCADE
                     );

-- Create table Championship (Code, Participant.code Participant, Ranking, Date) code: 2 first letter name, 3 number
CREATE TABLE Championship (
	 Code VARCHAR(5),
     Participant VARCHAR(5),
     Ranking INT,
     DATE DATE,
     CONSTRAINT pk_Championship
     PRIMARY KEY (code),
     CONSTRAINT fk_Championship_Participant
     FOREIGN KEY (Participant)
     REFERENCES Participant (code) ON DELETE CASCADE ON UPDATE CASCADE,
     CHECK (0 < Ranking < 6),
     CHECK (code REGEXP '^[A-Z]{2}[[:digit:]]{3}$') 
                          );

-- Create table Sponsorship (Code, Name)
CREATE TABLE Sponsorship (
     Code VARCHAR(5),
     Name VARCHAR(200),
     CONSTRAINT pk_Sponsorship
     PRIMARY KEY (Code),
     CHECK (code REGEXP '^[A-Z]{2}[[:digit:]]{3}$') 
                         );

-- Create table Sponsor(Sponsorship.code Sponsorship, Championship.code Championship, Amount_of_money)
CREATE TABLE Sponsor (
	 Sponsorship VARCHAR(5),
     Championship VARCHAR(5),
     Amount_of_money FLOAT,
     CONSTRAINT fk_Sponsor_Sponsorship
     FOREIGN KEY (Sponsorship)
     REFERENCES Sponsorship (code) ON DELETE CASCADE ON UPDATE CASCADE,
     CONSTRAINT fk_Sponsor_Championship
     FOREIGN KEY (Championship)
     REFERENCES Championship (code) ON DELETE CASCADE ON UPDATE CASCADE,
     CHECK (Amount_of_money > 0)
                     );

COMMIT;
SET FOREIGN_KEY_CHECKS=1;
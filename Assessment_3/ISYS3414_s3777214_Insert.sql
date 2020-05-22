USE ATP_Tour;

-- Insert into Participant (Code, Name, Country)
INSERT INTO Participant VALUES ('RF001', 'Roger Federer', 'Switzerland'),
                               ('RN002', 'Rafael Nadal', 'Spain'),
                               ('ND003', 'Novak Djokovic', 'Serbia'),
                               ('AM004', 'Andy Murray', 'United Kingdom'),
                               ('DT005', 'Dominic Thiem', 'Austria'),
                               ('PS006', 'Pete Sampras', 'United States'),
                               ('SW007', 'Stan Wawrinka', 'Switzerland'),
                               ('AZ008', 'Alexander Zverev', 'Germany');

-- Insert into Stadium (Code, Name)
INSERT INTO Stadium VALUES ('CC001', 'Centre Court'),
                           ('AA002', 'Arthur Ashe Stadium'),
                           ('CP003', 'Court Philippe Chatrier'),
                           ('IW004', 'Indian Wells Tennis Garden'),
                           ('RL005', 'Rod Laver Arena'),
                           ('QS006', 'Qizhong Stadium'),
                           ('RE007', 'Roy Emerson Arena'),
                           ('FI008', 'Foro Italico'),
                           ('RA009', 'Royal Albert Hall'),
                           ('OA010', 'The O2 Arena');

-- Insert into Matches (Code, Phase, Start_time, Date, Stadium.code Stadium)
INSERT INTO Matches VALUES ('QFA01', 'Quater Final A', '09:00', '2020-01-20', 'CC001'),
						   ('QFB02', 'Quater Final B', '09:00', '2020-01-25', 'CC001'),
                           ('QFC03', 'Quater Final C', '09:00', '2020-01-30', 'AA002'),
                           ('QFD04', 'Quater Final D', '09:00', '2020-02-05', 'AA002'),
                           
                           ('SFA01', 'Semi Final A', '10:00', '2020-03-10', 'CP003'),
                           ('SFB02', 'Semi Final B', '10:00', '2020-03-20', 'CP003'),
                           
                           ('FIN01', 'Final', '09:30', '2020-03-20', 'IW004');
                           
-- Insert into In_match (Matches.code Matches, Partcipant.code Participant, Score)
INSERT INTO In_match VALUES ('QFA01', 'RF001', 10),
							('QFA01', 'RN002', 20),
                            
							('QFB02', 'ND003', 30),
                            ('QFB02', 'AM004', 15),
                            
                            ('QFC03', 'DT005', 40),
                            ('QFC03', 'PS006', 25),
                            
                            ('QFD04', 'SW007', 25),
                            ('QFD04', 'AZ008', 10),
                            
                            ('SFA01', 'RN002', 25),
                            ('SFA01', 'ND003', 30),
                            
                            ('SFB02', 'DT005', 15),
                            ('SFB02', 'SW007', 40),
                            
                            ('FIN01', 'SW007', 12),
                            ('FIN01', 'ND003', 14);

-- Insert into Umpire (Code, Name)
INSERT INTO Umpire VALUES ('CH001', 'Ali Nili'),
                          ('CH002', 'Carlos Bernardes'),
                          ('CH003', 'Carlos Ramos'),
                          ('CH004', 'Damien Dumusois'),
                          ('CH005', 'Emmanuel Joseph'),
                          ('CH006', 'Fergus Murphy'),
                          
                          ('LI001', 'Gianluca Moscarella'),
                          ('LI002', 'James Keothavong'),
                          ('LI003', 'John Blom'),
                          ('LI004', 'Kader Nouni'),
                          ('LI005', 'Manuel Messina'),
                          ('LI006', 'Mohamed El Jennati');

-- Insert into Line_umpire (Umpire.code Code, Name)
INSERT INTO Line_umpire VALUES ('LI001', 'Gianluca Moscarella'),
                               ('LI002', 'James Keothavong'),
                               ('LI003', 'John Blom'),
                               ('LI004', 'Kader Nouni'),
                               ('LI005', 'Manuel Messina'),
                               ('LI006', 'Mohamed El Jennati');

-- Insert into Chair_umpire (Umpire.code Code, Name)
INSERT INTO Chair_umpire VALUES ('CH001', 'Ali Nili'),
                                ('CH002', 'Carlos Bernardes'),
                                ('CH003', 'Carlos Ramos'),
                                ('CH004', 'Damien Dumusois'),
                                ('CH005', 'Emmanuel Joseph'),
                                ('CH006', 'Fergus Murphy');

-- Insert into Control (Umpire.code Umpire, Matches.code Matches)
INSERT INTO Control VALUES  ('CH001', 'QFA01'),
							('LI001', 'QFA01'),
                            
							('LI001', 'QFB02'),
                            ('CH001', 'QFB02'),
                            
                            ('CH002', 'QFC03'),
                            ('LI002', 'QFC03'),
                            
                            ('CH002', 'QFD04'),
                            ('LI002', 'QFD04'),
                            
                            ('CH003', 'SFA01'),
                            ('LI003', 'SFA01'),
                            
                            ('CH003', 'SFB02'),
                            ('LI003', 'SFB02'),
                            
                            ('CH004', 'FIN01'),
                            ('LI004', 'FIN01');

-- Insert into Championship (Code, Participant.code Participant ,Ranking, Date)
INSERT INTO Championship VALUES ('FR001', 'ND003', 1, '2020-03-20'),
								('SR002', 'SW007', 2, '2020-03-20'),
                                ('TR003', 'RN002', 3, '2020-03-20'),
                                ('FR004', 'DT005', 4, '2020-03-20'),
                                ('FR005', 'PS006', 5, '2020-03-20');
                                
-- Insert into Sponsorship (Code, Name)
INSERT INTO Sponsorship VALUES ('AS001', 'Asics'),
                               ('FI002', 'Fila'),
                               ('NB003', 'New Balance'),
                               ('KS004', 'K-Swiss'),
                               ('BP005', 'BNP Paribas'),
                               ('HE006', 'Head');
                               
-- Insert into Sponsor(Sponsorship.code Sponsorship, Championship.code Championship, Amount_of_money)
INSERT INTO Sponsor VALUES ('AS001', 'FR001', 10000),
                           ('FI002', 'FR001', 10000),
                           ('NB003', 'FR001', 10000),
                           
                           ('KS004', 'SR002', 10000),
                           ('BP005', 'SR002', 10000),
                           
                           ('HE006', 'TR003', 1000),
                           ('AS001', 'TR003', 1000),
                           
                           ('FI002', 'FR004', 1000),
                           ('NB003', 'FR004', 1000),
                           
                           ('KS004', 'FR005', 1000),
                           ('BP005', 'FR005', 1000);

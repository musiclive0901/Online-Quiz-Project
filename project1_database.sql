use project1;

ALTER TABLE StudentTable MODIFY idStudent INTEGER NOT NULL AUTO_INCREMENT;

CREATE TABLE `feedbackTable` (
  `idFeedback` int NOT NULL,
  `ratingScore` int DEFAULT NULL,
  `Message` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idFeedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `questionTable` (
  `idquestionTable` int NOT NULL AUTO_INCREMENT,
  `categoryNum` int DEFAULT NULL,
  `questionNum` int DEFAULT NULL,
  `questionText` varchar(120) DEFAULT NULL,
  `optionA` varchar(120) DEFAULT NULL,
  `optionB` varchar(120) DEFAULT NULL,
  `optionC` varchar(120) DEFAULT NULL,
  `optionD` varchar(120) DEFAULT NULL,
  `correctValue` int DEFAULT NULL,
  `questionStatus` varchar(45) DEFAULT NULL,
  `answerText` varchar(45) DEFAULT NULL,
  `correctText` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idquestionTable`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `quizDetail` (
  `idquizDetail` int NOT NULL AUTO_INCREMENT,
  `timeTaken` varchar(50) DEFAULT NULL,
  `questionContext` varchar(100) DEFAULT NULL,
  `optionA` varchar(100) DEFAULT NULL,
  `optionB` varchar(100) DEFAULT NULL,
  `optionC` varchar(100) DEFAULT NULL,
  `optionD` varchar(100) DEFAULT NULL,
  `userAnswer` varchar(45) DEFAULT NULL,
  `correctAnswer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idquizDetail`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `quizResultTable` (
  `idquizResultTable` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `quizResult` varchar(45) DEFAULT NULL,
  `dateTaken` varchar(50) DEFAULT NULL,
  `categoryQuiz` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idquizResultTable`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `scoreTable` (
  `idscoreTable` int NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `score1` int DEFAULT NULL,
  `score2` int DEFAULT NULL,
  `score3` int DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`idscoreTable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `StudentTable` (
  `idStudent` int NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `phoneNum` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into StudentTable (idStudent, username, password, Name, Email)
values (1,'admin','admin','admin','admin@gmail.com');

truncate questionTable;

/* Physics questions */
insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus )
values (1,1,1,'The astronomer Copernicus publicly stated in the 1500s that Earth ',
'A	does not move.','B	revolves around the sun.','C is slowing down.','D moves in a straight line.',2, 'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(2,1,2,'Galileo found that a ball rolling down one inclined plane would roll how far up another inclined plane?',
'A	The ball would not roll up the other plane at all.','B	To nearly its original height','C To about one quarter its original height','D	To nearly twice its original height',2,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(3,1,3,'Friction is a force that always acts ',
'A	perpendicular to an objects motion.','B	opposite to an objects motion.','C	in the same direction as an objects motion.','D None of them above',2,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(4,1,4,'The law of inertia applies to ',
'A	objects at rest.', 'B	moving objects.','C	both moving and nonmoving objects.', 'D None of them above',3,'ACTIVE'); 

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(5,1,5,'How much does a 3.0-kg bag of bolts weigh?',
'A 7.2 N','B 14.4 N','C	22.8 N','D	29.4 N',4,'ACTIVE');  
  
insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(6,1,6,'A bag of sports equipment has a mass of 10.0 kilograms and a weight of',
'A	0.98 N.','B	9.8 N.','C	98 N.','D	980 N.',3,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(7,1,7,'The tendency of objects to resist a change in motion is called:',
'A Friction.','B Velocity.','C Inertia.','D Acceleration.',3, 'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(8,1,8,'If an object has twice as much mass as another, then it also has twice as much:',
'A Acceleration','B Weight','C Center of gravity','D Area',2,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(9,1,9,'Which Newton Law declare F = ma?',
'A First Newton Law','B Second Newton Law', 'C Third Newton Law', 'D All of them', 2,'ACTIVE'); 

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(10,1,10,'The tendency of objects to resist a change in motion is called:',
'A Friction.','B Velocity.','C Inertia.','D Acceleration.',3,'ACTIVE');
/*Math question */
insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(11,2,1,'x + 3 = 5. What is X?',
'A 0','B 3','C 1','D 2',4,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(12,2,2,'x * 3 = 9. What is X?',
'A 0','B 3', 'C 1','D 2',2,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(13,2,3,'x / 3 = 3. What is X?',
'A 9','B 3','C 1','D 2',1,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(14,2,4,'x + y = 3. y = 1. What is X?',
'A 9','B 3' ,'C 1','D 2',4,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(15,2,5,'x - y = 3. y = 1. What is X?',
'A 4','B 3' ,'C 1','D 2',1,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(16,2,6,'x / y = 3. y = 1. What is X?',
'A 4','B 3' ,'C 1','D 2',2,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(17,2,7,'x * y = 1. y = 1. What is X?',
'A 4','B 3' ,'C 1','D 2',3,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(18,2,8,'x + y = 1. y = 1. What is X?',
'A 4','B 3' ,'C 0','D 2',3,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(19,2,9,'x - y = 10. y = 2. What is X?',
'A 14','B 13' ,'C 12','D 8',3,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(20,2,6,'x / y = 3. y = 1. What is X?',
'A 4','B 3' ,'C 1','D 2',2,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(21,2,10,'x * y = 14. y = 2. What is X?',
'A 4','B 3' ,'C 7','D 2',3,'ACTIVE');

/*Chemistry question*/
insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(22,3,1,'Any sample of matter has mass and takes up space. because:',
'A All matter is heavy','B Matter can be a gas', 'C Matter is made up of tiny particles that have mass and take up space','D The Earth is made of matter',3,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(23,3,2,'Water drops stay together on wax paper and they don’t break apart easily because:',
'A Water molecules are small','B Water molecules are in motion', 'C Water molecules are attracted to each other','D Water molecules are wet',3,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(24,3,3,'Food coloring spreads out faster in hot water than in cold water because:',
'A The water molecules in hot water move more quickly','B The molecules in hot water are larger', 'C The food coloring molecules are small','D Hot water is less dense',1,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(25,3,4,'When you heat a sample of a solid, the particles that make up the solid:',
'A Get bigger','B Loose mass', 'C Move faster','D Slow down',3,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(26,3,5,'When you heat a sample of gas, what happens to the particles that make up the gas?',
'A The particles move faster','B The particles break apart', 'C The particles get smaller','D The particles become more dense',1,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(27,3,6,'To describe a liquid, you could say:',
'A The particles of a liquid are attracted to one another','B The particles of a liquid are in motion', 'C The particles of a liquid are able to move past one another','D All of them',4,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(28,3,7,'When a thermometer is cooled, the red liquid inside the thermometer moves down because:',
'A Cold liquids sink','B The glass of the thermometer gets cold', 'C The molecules of the liquid move slower and get a little closer together','D The red liquid is thick',3,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(29,3,8,'Protons are located in the nucleus of the atom. A proton has:',
'A No charge','B A negative charge', 'C A positive and a negative charge','D A positive charge',4,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(30,3,9,'Neutrons are in the nucleus of the atom. A neutron has:',
'A No charge','B A negative charge', 'C A positive and a negative charge','D A positive charge',1,'ACTIVE');

insert into questionTable(idquestionTable,categoryNum,questionNum,questionText,optionA,optionB,optionC,optionD,correctValue,questionStatus)
values(31,3,10,'An electron is in a region outside the nucleus. An electron',
'A No charge','B A negative charge', 'C A positive and a negative charge','D A positive charge',2,'ACTIVE');




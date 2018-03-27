#Additional Info for Node.js
#User: Admin
#Password: NodeJS-SQL

DROP database MuWi;

CREATE database MuWi;

CREATE table MuWi.tUser (UserID int NOT NULL, EMail varchar(255), Surname varchar(255), Prename varchar(255), isStudent binary, UNIQUE(UserID), PRIMARY KEY(UserID));
CREATE table MuWi.tBook (BookID int NOT NULL, Title varchar(255) NOT NULL, UserID int NOT NULL, PRIMARY KEY (BookID), FOREIGN KEY (UserID) REFERENCES tUser(UserID));
CREATE table MuWi.tChapter (ChapterID int NOT NULL, Title varchar(255) NOT NULL, BookID int NOT NULL, PRIMARY KEY (ChapterID), FOREIGN KEY (BookID) REFERENCES tBook(BookID));
CREATE table MuWi.tContent (ContentID int NOT NULL, Title varchar(255) NOT NULL, Description varchar(255), ContentType varchar(255) NOT NULL, ContentData varchar(255) NOT NULL, PRIMARY KEY (ContentID));
CREATE table MuWi.tTag (TagID int NOT NULL, Title varchar(255) NOT NULL, PRIMARY KEY (TagID));
CREATE table MuWi.tContentClassification (ContentClassificationID int NOT NULL, ContentID int NOT NULL, TagID int NOT NULL, PRIMARY KEY (ContentClassificationID), FOREIGN KEY (ContentID) REFERENCES tContent(ContentID), FOREIGN KEY (TagID) REFERENCES tTag(TagID));
CREATE table MuWi.tList (ListID int NOT NULL, ChapterID int NULL, UserID int NOT NULL, PRIMARY KEY (ListID), FOREIGN KEY (UserID) REFERENCES tUser(UserID), FOREIGN KEY (ChapterID) REFERENCES tChapter(ChapterID));
CREATE table MuWi.tContentAffiliation (ContentAffiliationID int NOT NULL, ListID int NOT NULL, ContentID int NOT NULL, PRIMARY KEY (ContentAffiliationID), FOREIGN KEY (ContentID) REFERENCES tContent(ContentID), FOREIGN KEY (ListID) REFERENCES tList(ListID));

CREATE VIEW MuWi.vContent AS (SELECT a.*, d.ChapterID, c.ListID, d.Title AS 'ChapterTitle' FROM (((MuWi.tcontent AS a INNER JOIN MuWi.tContentAffiliation AS b ON a.ContentID = b.ContentID) INNER JOIN MuWi.tlist as c ON b.ListID = c.ListID) RIGHT JOIN MuWi.tchapter as d ON c.ChapterID = d.ChapterID));
CREATE VIEW MuWi.vTagList AS (SELECT a.*, c.tagid, c.Title AS 'tagTitle' FROM ((MuWi.vContent as a INNER JOIN MuWi.tcontentclassification as b ON a.ContentID = b.ContentID) INNER JOIN MuWi.ttag as c ON b.TagID = c.tagid));

INSERT INTO MuWi.tuser (userid, email, surname, prename, isstudent) VALUES ("0", "Maria.Wolff@gmx.de", "Wolff", "Maria", 1);
INSERT INTO MuWi.tuser (userid, email, surname, prename, isstudent) VALUES ("1", "Tim.Rosenau@gmx.de", "Rosenau", "Tim", 1);
INSERT INTO MuWi.tuser (userid, email, surname, prename, isstudent) VALUES ("2", "Lucas.Thielicke@gmx.de", "Thielicke", "Lucas", 1);
INSERT INTO MuWi.tuser (userid, email, surname, prename, isstudent) VALUES ("3", "Julien.Fitzlaff@gmx.de", "Fitzlaff", "Julien", 1);
INSERT INTO MuWi.tuser (userid, email, surname, prename, isstudent) VALUES ("4", "Ricardo.Rosinski@gmx.de", "Rosinski", "Ricardo", 1);
INSERT INTO MuWi.tuser (userid, email, surname, prename, isstudent) VALUES ("5", "Gert.Faustmann@gmx.de", "Faustmann", "Gert", 0);
INSERT INTO MuWi.tuser (userid, email, surname, prename, isstudent) VALUES ("6", "Claudia.Lemke@gmx.de", "Lemke", "Claudia", 0);
INSERT INTO MuWi.tuser (userid, email, surname, prename, isstudent) VALUES ("7", "Kathrin.Kirchner@gmx.de", "Kirchner", "Kathrin", 0);

INSERT INTO MuWi.tbook (bookid, title, userid) VALUES (0, "Einführung in die Wirtschaftsinformatik I", 6);
INSERT INTO MuWi.tbook (bookid, title, userid) VALUES (1, "Einführung in die Wirtschaftsinformatik II", 6);

INSERT INTO MuWi.tchapter (chapterid, title, bookid) VALUES (0, "Einführung in das digitale Zeitalter", 0);
INSERT INTO MuWi.tchapter (chapterid, title, bookid) VALUES (1, "Mensch und Gesellschaft im digitalen Zeitalter", 0);
INSERT INTO MuWi.tchapter (chapterid, title, bookid) VALUES (2, "Infrastruktur im digitalen Zeitalter", 0);
INSERT INTO MuWi.tchapter (chapterid, title, bookid) VALUES (3, "Informationssysteme und Daten im digitalen Zeitalter", 0);
INSERT INTO MuWi.tchapter (chapterid, title, bookid) VALUES (4, "Zalando Radical Agility: Vom Online-Retailer zur Fashion Plattform", 1);
INSERT INTO MuWi.tchapter (chapterid, title, bookid) VALUES (5, "Die Dominanz von Software im digitalen Zeitalter", 1);
INSERT INTO MuWi.tchapter (chapterid, title, bookid) VALUES (6, "Für Einsteiger: Verstehen und Strukturieren von Ideen", 1);
INSERT INTO MuWi.tchapter (chapterid, title, bookid) VALUES (7, "Für Fortgeschrittene: Programmieren und Testen von Ideen", 1);

INSERT INTO MuWi.tlist (listid, chapterid, userid) VALUES (0, 0, 6);
INSERT INTO MuWi.tlist (listid, chapterid, userid) VALUES (1, 1, 6);
INSERT INTO MuWi.tlist (listid, chapterid, userid) VALUES (2, 2, 6);
INSERT INTO MuWi.tlist (listid, chapterid, userid) VALUES (3, 3, 6);
INSERT INTO MuWi.tlist (listid, chapterid, userid) VALUES (4, 4, 6);
INSERT INTO MuWi.tlist (listid, chapterid, userid) VALUES (5, 5, 6);
INSERT INTO MuWi.tlist (listid, chapterid, userid) VALUES (6, 6, 6);
INSERT INTO MuWi.tlist (listid, chapterid, userid) VALUES (7, 7, 6);

INSERT INTO MuWi.ttag (tagid, title) VALUES (0, "Digitalisierung");
INSERT INTO MuWi.ttag (tagid, title) VALUES (1, "Systems of Engagement");
INSERT INTO MuWi.ttag (tagid, title) VALUES (2, "Systems of Record");
INSERT INTO MuWi.ttag (tagid, title) VALUES (3, "Geschäftsmodelle");
INSERT INTO MuWi.ttag (tagid, title) VALUES (4, "Wertschöpfungskette");
INSERT INTO MuWi.ttag (tagid, title) VALUES (5, "Wissensmanagement");
INSERT INTO MuWi.ttag (tagid, title) VALUES (6, "Management");
INSERT INTO MuWi.ttag (tagid, title) VALUES (7, "Enterprise Ressource Planing");
INSERT INTO MuWi.ttag (tagid, title) VALUES (8, "Supply Chain Management");
INSERT INTO MuWi.ttag (tagid, title) VALUES (9, "Customer Relationship Management");
INSERT INTO MuWi.ttag (tagid, title) VALUES (10, "Unified Modeling Language");
INSERT INTO MuWi.ttag (tagid, title) VALUES (11, "Objektorientierte Programmierung");

INSERT INTO MuWi.tcontent (contentid, title, description, contenttype, contentdata) VALUES (0, "Folien Kapitel 1", "Einige spannende Informationen", "pdf", "./assets/1.pdf");
INSERT INTO MuWi.tcontent (contentid, title, description, contenttype, contentdata) VALUES (1, "Video Kapitel 1", "Einige spannende Informationen", "mp4", "./assets/2.mp4");
INSERT INTO MuWi.tcontent (contentid, title, description, contenttype, contentdata) VALUES (2, "Bild Kapitel 1", "Einige spannende Informationen", "jpg", "./assets/3.jpg");
INSERT INTO MuWi.tcontent (contentid, title, description, contenttype, contentdata) VALUES (3, "Soundtrack Kapitel 1", "Einige spannende Informationen", "mp3", "./assets/4.mp3");
INSERT INTO MuWi.tcontent (contentid, title, description, contenttype, contentdata) VALUES (4, "Zusatzinformationen Kapitel 1", "Einige spannende Informationen", "pdf", "./assets/5.pdf");
INSERT INTO MuWi.tcontent (contentid, title, description, contenttype, contentdata) VALUES (5, "Hörbuch Kapitel 1", "Einige spannende Informationen", "mp3", "./assets/6.mp3");

INSERT INTO MuWi.tcontentaffiliation (contentaffiliationid, listid, contentid) VALUES (0, 0, 0);
INSERT INTO MuWi.tcontentaffiliation (contentaffiliationid, listid, contentid) VALUES (1, 0, 1);
INSERT INTO MuWi.tcontentaffiliation (contentaffiliationid, listid, contentid) VALUES (2, 0, 2);
INSERT INTO MuWi.tcontentaffiliation (contentaffiliationid, listid, contentid) VALUES (3, 0, 3);
INSERT INTO MuWi.tcontentaffiliation (contentaffiliationid, listid, contentid) VALUES (4, 0, 4);
INSERT INTO MuWi.tcontentaffiliation (contentaffiliationid, listid, contentid) VALUES (5, 0, 5);

INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (0, 0, 1);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (1, 0, 2);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (2, 0, 3);

INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (3, 1, 3);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (4, 1, 4);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (5, 1, 5);

INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (6, 2, 7);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (7, 2, 8);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (8, 2, 9);

INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (9, 3, 1);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (10, 3, 2);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (11, 3, 3);

INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (12, 4, 4);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (13, 4, 5);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (14, 4, 6);

INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (15, 5, 0);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (16, 5, 1);
INSERT INTO MuWi.tcontentclassification (contentclassificationid, contentid, tagid) VALUES (17, 5, 2);

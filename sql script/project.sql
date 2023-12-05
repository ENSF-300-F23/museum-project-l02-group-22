DROP DATABASE IF EXISTS ART_MUSEUM;
CREATE DATABASE ART_MUSEUM;
USE ART_MUSEUM;


DROP TABLE IF EXISTS ART_OBJECT;
CREATE TABLE ART_OBJECT 
(	
	Art_ID					INT					AUTO_INCREMENT,
    Art_Title				VARCHAR(255)		NOT NULL,
    Artist_Name				VARCHAR(255),
    Type_of_Art				VARCHAR(100)		NOT NULL,
	Creation_Time			VARCHAR(100),
    Art_Description			TEXT				NOT NULL,
    Culture_of_Origin		VARCHAR(100),
    Epoch					VARCHAR(100),
   
    PRIMARY KEY (Art_ID),
    FOREIGN KEY (Artist_Name) REFERENCES ARTIST(Artist_Name)
);


INSERT INTO ART_OBJECT (Art_Title, Artist_Name, Type_of_Art, Creation_Time, Art_Description, Culture_of_Origin, Epoch)
VALUES ('Ellen Maurice (1578–1626)', 'Marcus Gheeraerts the Younger ', 'Painting', '1597', 'Potrait of Ellen Maurice', 'Welsh or English', 'Late Renaissance/Early Baroque'),
	   ('Portrait of a Man in Royal Livery', 'Hans Holbein the Younger', 'Painting', '1532–35', 'Potrait of a man', 'English', 'Renaissance'),
       ('Seated Chief (Mwanangana) Playing Sanza', 'Chokwe Artist', 'Sculpture', '19th century (before 1869)', 'Wooden sculpture of a Chokwe Chief', 'Chokwe', 'Modern'),
       ('Mangaaka Power Figure (Nkisi N’Kondi)', 'Kongo artist and nganga, Yombe group', 'Sculpture', 'Second half of the 19th century', 'Wooden sculpture of Power Figure', 'Kongo', 'Modern'),
       ('Cup with Cover', 'R W', 'Other', '1590–91', 'Cup made with combination of metalwork and silver', 'English', 'Renaissance'),
       ('Astronomicum Caesareum', 'Michael Ostendorfer', 'Other', 'May 1540', 'Book about astronomy', 'German', 'Renaissance'),
       ('', '', '', '', '', '', ''),
       ('', '', '', '', '', '', ''),
       ('', '', '', '', '', '', ''),
       ('', '', '', '', '', '', ''),


DROP TABLE IF EXISTS PAINTING;
CREATE TABLE PAINTING 
(
	Art_ID			INT,
    Paint_Type		VARCHAR(100),
    Drawn_On		VARCHAR(100),
    Style			VARCHAR(100), 
    
    PRIMARY KEY (Art_ID),
    FOREIGN KEY (Art_ID) REFERENCES ART_OBJECT(Art_ID)
);


INSERT INTO PAINTING (Art_ID, Paint_Type, Drawn_On, Style)
VALUES (, 'Oil', 'Oak', 'Potrait'),
	   (, 'Oil and Gold', 'Parchment', 'Potrait'),
       (, '', '', ''),


DROP TABLE IF EXISTS SCULPTURE;
CREATE TABLE SCULPTURE
(
	Art_ID			INT,
    Material		VARCHAR(100),
    Dimensions		VARCHAR(100),
    Weight			VARCHAR(100),
    Style			VARCHAR(100),
    
    PRIMARY KEY (Art_ID),
    FOREIGN KEY (Art_ID) REFERENCES ART_OBJECT(Art_ID)
);


INSERT INTO SCULPTURE (Art_ID, Material, Dimensions, Weight, Style)
VALUES (, 'Wood (uapaca), cloth, fiber, beads, dyes, resinous coating', '42.5 × 12.7 × 14 cm', NULL, 'Ancient'),
	   (, 'Wood, iron, resin, ceramic, plant fiber, textile, pigment', '118 × 49.5 × 39.4 cm', '24 kg', 'Ancient'),
       (, '', '', '', ''),
       (, '', '', '', ''),
       (, '', '', '', ''),
       (, '', '', '', ''),


DROP TABLE IF EXISTS OTHER;
CREATE TABLE OTHER
(
	Art_ID		INT,
    Type		VARCHAR(100),
    Style		VARCHAR(100),
    
    PRIMARY KEY (Art_ID),
    FOREIGN KEY (Art_ID) REFERENCES ART_OBJECT(Art_ID)
);


INSERT INTO OTHER (Art_ID, Type, Style)
VALUES (, 'Cup', 'Modern'),
	   (, 'Book', 'Renaissance'),
       (, '', ''),
       (, '', ''),
       (, '', ''),
       (, '', ''),


DROP TABLE IF EXISTS PERMANENT_COLLECTION;
CREATE TABLE PERMANENT_COLLECTION 
(
	Art_ID				INT,
    Date_Acquired		DATE,
    Status				VARCHAR(100),
    Cost				DECIMAL(15,2),
    
    PRIMARY KEY (Art_ID),
    FOREIGN KEY (Art_ID) REFERENCES ART_OBJECT(Art_ID)
);


INSERT INTO PERMANENT_COLLECTION (Art_ID, Date_Acquired, Status, Cost)
VALUES (),


DROP TABLE IF EXISTS BORROWED;
CREATE TABLE BORROWED
(
	Art_ID				INT,
    Collection_Name		VARCHAR(255),
    Date_Borrowed		DATE,
    Date_Returned		DATE,
    
    PRIMARY KEY (Art_ID),
    FOREIGN KEY (Art_ID) REFERENCES ART_OBJECT(Art_ID)
);


INSERT INTO BORROWED (Art_ID, Collection_Name, Date_Borrowed, Date_Returned)
VALUES (),


DROP TABLE IF EXISTS ARTIST;
CREATE TABLE ARTIST
(
    Artist_Name				VARCHAR(255)		NOT NULL,
    Date_Born  				VARCHAR(20),
    Date_Died				VARCHAR(20),
    Country_of_Origin		VARCHAR(100),
    Epoch					VARCHAR(100),
    Main_style				VARCHAR(100),
    Description				TEXT,
    
    PRIMARY KEY (Artist_Name)
);


INSERT INTO ARTIST (Artist_Name, Date_Born, Date_Died, Country_of_Origin, Epoch, Main_style, Description)
VALUES ('Marcus Gheeraerts the Younger', '1561', '1635/36', 'Bruges, Belgium', 'Baroque', 'Realism', 'Marcus Gheeraerts was a Flemish artist working at the Tudor court, described as "the most important artist of quality to work in England in large-scale between Eworth and van Dyck" He was brought to England as a child by his father Marcus Gheeraerts the Elder, also a painter.'),
	   ('Hans Holbein the Younger', '1497/98', '1543', 'Augsburg, Germany', 'Renaissance', 'Northern Renaissance ', 'Hans Holbein the Younger was a German-Swiss painter and printmaker who worked in a Northern Renaissance style, and is considered one of the greatest portraitists of the 16th century.'),
       ('Chokwe Artist', NULL, NULL, 'Central Africa', 'Modern', 'Wooden Sculpture', NULL),
       ('Kongo Artist and Nganga, Yombe Group', NULL, NULL, 'Republic of the Congo', 'Modern', 'Wooden Sculpture', NULL),
       ('R W', NULL, NULL, 'England', 'Renaissance', NULL, NULL),
       ('Michael Ostendorfer', '1490', '1559', 'Germany', 'Renaissance', 'Designing', 'Michael Ostendorfer was a German painter, graphic artist and xylographer. Stylistically, he belongs to the Danube school and probably trained with Albrecht Altdorfer.'),
       ('', '', '', '', '', '', ''),
       ('', '', '', '', '', '', ''),
       ('', '', '', '', '', '', ''),
       ('', '', '', '', '', '', ''),
       

DROP TABLE IF EXISTS EXHIBITION;
CREATE TABLE EXHIBITION
(
	Exhibition_Name		VARCHAR(255)		NOT NULL,
    Start_date			DATE,
	End_date			DATE,
	
    PRIMARY KEY (Exhibition_Name)
);


INSERT INTO EXHIBITION (Exhibition_Name, Start_date,End_date)
VALUES (),


DROP TABLE IF EXISTS COLLECTION;
CREATE TABLE COLLECTION
(
	Collection_Name		VARCHAR(255)		NOT NULL,
    Type				VARCHAR(100),
    Description			TEXT,
    Address				TEXT,
    Phone				VARCHAR(15),
    Contact_person		VARCHAR(255),
    
    PRIMARY KEY (Collection_Name)
);


INSERT INTO COLLECTION (Collection_Name, Type, Description, Address, Phone, Contact_person)
VALUES (),


DROP TABLE IF EXISTS ART_OBJECT_EXHIBITION;
CREATE TABLE ART_OBJECT_EXHIBITION 
(
    Art_ID INT,
    Exhibition_Name	 VARCHAR(255),
    
    FOREIGN KEY (Art_ID) REFERENCES ART_OBJECT(Art_ID),
    FOREIGN KEY (Exhibition_Name) REFERENCES EXHIBITION(Exhibition_Name)
);

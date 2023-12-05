DROP DATABASE IF EXISTS ART_MUSEUM;
CREATE DATABASE ART_MUSEUM;
USE ART_MUSEUM;


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
       ('Adriaen van der Spelt', '1630', '1673', 'Leiden, Netherlands', 'Baroque', 'Still Life', 'Adriaen van der Spelt, was a Dutch Golden Age flower painter.'),
       ('Frans van Mieris the Elder', '1635', '1681 ', 'Leiden, Netherlands', 'Dutch Golden Age, Baroque', 'Potrait', 'Frans van Mieris the Elder, was a Dutch Golden Age genre and portrait painter. The leading member of a Leiden family of painters, his sons Jan and Willem and his grandson Frans van Mieris the Younger were also accomplished genre painters.'),
       ('Pablo Picasso', '1881', '1973 ', 'Málaga, Spain', 'Modern', 'Still Life', 'Pablo Ruiz Picasso was a Spanish painter, sculptor, printmaker, ceramicist, and theatre designer who spent most of his adult life in France.'),
       ('Georges Braque', '1882', '1963 ', 'Argenteuil, France', 'Modern', 'Collage', 'Georges Braque was a major 20th-century French painter, collagist, draughtsman, printmaker and sculptor. His most notable contributions were in his alliance with Fauvism from 1905, and the role he played in the development of Cubism.'),
       ('Tournai', '1750', NULL, 'Belgium', 'Roccoco', 'Ceramics', 'Ceramics making company'),
       ('Lunéville', '1728', NULL, 'France', 'Roccoco', 'Ceramics', 'Ceramics making company'),
       ('Robert Pruitt', '1975 ', NULL, 'Houston, Texas, United States', 'Modern', 'Visual Art', 'Robert Pruitt is a visual artist from Houston, Texas living in New York City who is known for his figurative drawings and who also works with sculpture, photography, and animation.'),
       ('Vili', NULL, NULL, 'Kongo', NULL, 'Ancient Sculpture', NULL),
       ('Adebunmi Gbadebo', '1992', NULL, 'United States', 'Modern', 'Abstract', NULL),
       ('Unrecorded Edgefield District potter', NULL, NULL, 'United States', 'Romantic', 'Pottery', NULL),
       ('David Drake', '1801', '1870s', 'United Stated', 'Neoclassic', 'Pottery', NULL),
       ('Léonard de Vinci', '1452', '1519', 'Anchiano, Italy', 'Renaissance', 'Potrait', 'Leonardo di ser Piero da Vinci was an Italian polymath of the High Renaissance who was active as a painter, draughtsman, engineer, scientist, theorist, sculptor, and architect.'),
       ('Michelangelo di Lodovico Buonarroti Simoni', '1475', '1564', 'Caprese Michelangelo, Italy', 'Renaissance', 'Sculpting', 'Michelangelo di Lodovico Buonarroti Simoni, known mononymously as Michelangelo, was an Italian sculptor, painter, architect, and poet of the High Renaissance. Born in the Republic of Florence, his work was inspired by models from classical antiquity and had a lasting influence on Western art.'),
       ('Jakob Blanck', NULL, NULL, NULL, 'Baroque', NULL, NULL),
       ('James Northcote', '1746', '1831', 'Plymouth, United Kingdom', 'Neoclassic', 'Painting', 'James Northcote RA was a British painter.'),
       ('France Provence', NULL, NULL, NULL, NULL, NULL, NULL),
       ('Nicolas-Marie Sèvres factory', NULL, NULL, NULL, NULL, NULL, NULL);


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
    Category				VARCHAR(50),
   
    PRIMARY KEY (Art_ID),
    FOREIGN KEY (Artist_Name) REFERENCES ARTIST(Artist_Name)
);


INSERT INTO ART_OBJECT (Art_Title, Artist_Name, Type_of_Art, Creation_Time, Art_Description, Culture_of_Origin, Epoch, Category)
VALUES ('Ellen Maurice (1578–1626)', 'Marcus Gheeraerts the Younger', 'Painting', '1597', 'Potrait of Ellen Maurice', 'Welsh or English', 'Late Renaissance/Early Baroque', 'Owned'),
	   ('Portrait of a Man in Royal Livery', 'Hans Holbein the Younger', 'Painting', '1532–35', 'Potrait of a man', 'English', 'Renaissance', 'Owned'),
       ('Seated Chief (Mwanangana) Playing Sanza', 'Chokwe Artist', 'Sculpture', '19th century (before 1869)', 'Wooden sculpture of a Chokwe Chief', 'Chokwe', 'Modern', 'Owned'),
       ('Mangaaka Power Figure (Nkisi N’Kondi)', 'Kongo Artist and Nganga, Yombe Group', 'Sculpture', 'Second half of the 19th century', 'Wooden sculpture of Power Figure', 'Kongo', 'Modern', 'Owned'),
       ('Cup with Cover', 'R W', 'Other', '1590–91', 'Cup made with combination of metalwork and silver', 'English', 'Renaissance', 'Owned'),
       ('Astronomicum Caesareum', 'Michael Ostendorfer', 'Other', 'May 1540', 'Book about astronomy', 'German', 'Renaissance', 'Owned'),
       ('Trompe l’Oeil Still Life with Flower Garland and Curtain', 'Adriaen van der Spelt', 'Painting', '1658', 'Painting of flower', 'Dutch', 'Baroque', 'Owned'),
       ('Still Life with Chair Caning', 'Pablo Picasso', 'Painting', '1912', 'Still life painting', 'Spanish', 'Modern', 'Owned'),
       ('Still Life with Violin', 'Georges Braque', 'Painting', '1912', 'Still life painting', 'French', 'Modern', 'Owned'),
       ('Glass and Die', 'Pablo Picasso', 'Sculpture', '1914', 'Wooden sculpture', 'Spanish', 'Modern', 'Owned'),
       ('The Absinthe Glass', 'Pablo Picasso', 'Sculpture', '1914', 'Bronze sculpture', 'Spanish', 'Modern', 'Owned'),
       ('Coffeepot', 'Tournai', 'Other', '1780', 'Ceramic coffeepot', 'Belgian', 'Roccoco', 'Owned'),
       ('Tray', 'Lunéville', 'Other', '1760', 'Ceramic tray', 'French', 'Roccoco', 'Owned'),
       ('Birth and Rebirth and Rebirth', 'Robert Pruitt', 'Painting', '2019', 'Painting of a boy', 'American', 'Modern', 'Owned'),
       ('Power figure', 'Vili', 'Sculpture', '1850', 'Sculpture of power figure', 'Kongo', 'Romantic', 'Owned'),
       ('In Memory of Pirecie McCory, Born 1843, Died June 10 1933, In Thy Place to Stand, HFS', 'Adebunmi Gbadebo', 'Sculpture', '2022', 'Sculpture', 'American', 'Modern', 'Owned'),
       ('Face jug', 'Unrecorded Edgefield District potter', 'Other', '1867-85', 'Pottery', 'American', 'Romantic', 'Owned'),
       ('Storage jar', 'David Drake', 'Other', '1858', 'Pottery jar', 'American', 'Neoclassic', 'Owned'),
       ('Portrait de Lisa Gherardini, épouse de Francesco del Giocondo, dit La Joconde ou Monna Lisa', 'Léonard de Vinci', 'Painting', '1503', 'Famous potrait of Monalisa', 'Italian', 'Renaissance', 'Borrowed'),
       ('Esclave rebelle', 'Michelangelo di Lodovico Buonarroti Simoni', 'Sculpture', '1513', 'Sculpture of a rebellious slave', 'Italian', 'Renaissance', 'Borrowed'),
       ('Coffre des pierreries de Louis XIV', 'Jakob Blanck', 'Other', '1677', 'Chest for gems', 'French', 'Baroque', 'Borrowed'),
       ('La dévergondée en partie de débauche avec ses compagnons', 'James Northcote', 'Painting', '1796', 'Painting', 'English', 'Neoclassic', 'Borrowed'),
       ('Elément du tombeau de saint Elzéar de Sabran : trois infirmes', 'France Provence', 'Sculpture', '1373', 'Sculpture of a man', 'French', 'Medival', 'Borrowed'),
       ('Tasse du déjeuner des Portraits de la famille royale et des Vues de Neuilly : Clémentine d’Orléans', 'Nicolas-Marie Sèvres factory', 'Other', NULL, 'Cup', NULL, 'Baroque', 'Borrowed');


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
VALUES (1, 'Oil', 'Oak', 'Potrait'),
	   (2, 'Oil and Gold', 'Parchment', 'Potrait'),
       (7, 'Oil', 'Panel', 'Still Life'),
       (8, 'Oil', 'Printed oilcloth on canvas edged with rope', 'Still Life'),
       (9, 'Charcoal ', 'Cut-and-pasted printed wallpaper, selectively varnished, on laid paper', 'Still Life'),
       (14, 'Conte, charcoal pastel, and coffee wash', 'Paper', 'Potrait'),
       (19, 'Oil', 'Wood', 'Potrait'),
       (22, 'Oil', 'Canvas', 'Painting');


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
VALUES (3, 'Wood (uapaca), cloth, fiber, beads, dyes, resinous coating', '42.5 × 12.7 × 14 cm', NULL, 'Ancient'),
	   (4, 'Wood, iron, resin, ceramic, plant fiber, textile, pigment', '118 × 49.5 × 39.4 cm', '24 kg', 'Ancient'),
       (10, 'Painted wood', '23.5 × 21.9 × 4.8 cm', NULL, 'Modern'),
       (11, 'Painted bronze and perforated tin absinthe spoon', '22.5 x 12.7 x 6.4 cm', NULL, 'Modern'),
       (15, 'Wood, iron, nails, blades and fragments, and fiber cord', '103.5 × 34.9 × 25.6 cm', '18.1 kg', 'Ancient'),
       (16, 'True Blue Cemetery soil, South Carolina gold rice, human hair', '25.4 × 25.4 × 25.4 cm', '6.4 kg', 'Ancient'),
       (20, 'Marble', '215 cm', NULL, 'Modern'),
       (23, 'Marble', NULL, NULL, 'Medival');


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
VALUES (5, 'Cup', 'Modern'),
	   (6, 'Book', 'Renaissance'),
       (12, 'Coffeepot', 'Roccoco'),
       (13, 'Tray', 'Roccoco'),
       (17, 'Pottery', 'Ancient'),
       (18, 'Pottery', 'Neoclassic'),
       (21, 'Chest', 'Baroque'),
       (24, 'Cup', 'Baroque');


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
VALUES (1, '2016-02-23', 'On Display', 13757.50),
	   (2, '2016-11-09', 'On Display', 94940.94),
       (3, '2003-01-15', 'On Display', 94003.46),
       (4, '2015-09-23', 'Stored', 12306.57),
       (5, '2008-08-19', 'On Loan', 43186.76),
       (6, '2018-12-08', 'On Display', 17749.13),
       (7, '2014-05-13', 'On Loan', 15834.11),
       (8, '2006-10-24', 'Stored', 1255.04),
       (9, '2007-06-20', 'Stored', 71044.99),
       (10, '2018-01-15', 'On Loan', 10378.12),
       (11, '2012-02-08', 'On Display', 18837.73),
       (12, '2016-11-11', 'Stored', 55834.45),
       (13, '2012-07-20', 'On Loan', 88920.92),
       (14, '2016-02-23', 'Stored', 21154.15),
       (15, '2006-04-14', 'Stored', 98361.32),
       (16, '2006-06-08', 'On Loan', 97747.02),
       (17, '2010-10-01', 'On Display', 91668.53),
       (18, '2012-01-26', 'On Display', 10064.86);


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
VALUES (19, 'MASTERPIECES OF THE LOUVRE', '2015-06-15', '2016-01-10'),
	   (20, 'MASTERPIECES OF THE LOUVRE', '2016-09-12', '2017-10-05'),
       (21, 'MASTERPIECES OF THE LOUVRE', '2017-11-20', '2018-05-18'),
       (22, 'ACQUISITIONS MADE IN 2021', '2019-03-05', '2019-11-30'),
       (23, 'ACQUISITIONS MADE IN 2021', '2020-07-22', '2021-01-15'),
       (24, 'ACQUISITIONS MADE IN 2021', '2021-12-10', '2022-06-09');

       
DROP TABLE IF EXISTS EXHIBITION;
CREATE TABLE EXHIBITION
(
	Exhibition_Name		VARCHAR(255)		NOT NULL,
    Start_date			DATE,
	End_date			DATE,
	
    PRIMARY KEY (Exhibition_Name)
);


INSERT INTO EXHIBITION (Exhibition_Name, Start_date,End_date)
VALUES ('Renaissance Revival', '2022-04-15', '2022-06-30'),
	   ('Modern Art Explorations', '2021-09-01', '2021-12-15'),
	   ('Impressionist Masters', '2023-01-20', '2023-04-10'),
	   ('Sculptures of the 21st Century', '2019-11-05', '2020-02-28');


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
VALUES ('Global Artifacts', 'International', 'A collection of art and historical pieces from around the world.', '1234 International Blvd, New York, NY 10001', '555-0101', 'John Smith'),
	   ('Renaissance Classics', 'Museum', 'Featuring prominent artworks from the Renaissance period.', '4321 Museum Lane, Paris, France 75001', '555-0202', 'Claire Dubois'),
	   ('Contemporary Visions', 'Gallery', 'A collection focusing on contemporary and modern art.', '789 Art Street, Berlin, Germany 10115', '555-0303', 'Lukas Schmidt'),
	   ('Personal Treasures', 'Personal', 'A private collection of rare and valuable family heirlooms.', '2468 Heritage Rd, London, UK EC1A 1HQ', '555-0404', 'Emily Johnson');


DROP TABLE IF EXISTS ART_OBJECT_EXHIBITION;
CREATE TABLE ART_OBJECT_EXHIBITION 
(
    Art_ID INT,
    Exhibition_Name	 VARCHAR(255),
    
    FOREIGN KEY (Art_ID) REFERENCES ART_OBJECT(Art_ID),
    FOREIGN KEY (Exhibition_Name) REFERENCES EXHIBITION(Exhibition_Name)
);

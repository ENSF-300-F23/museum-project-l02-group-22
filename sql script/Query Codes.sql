USE ART_MUSEUM;


-- 1) Show tables in the database
SHOW TABLES;

-- Explanation
-- ART_OBJECT is the central table with a primary key Art_ID.
-- ARTIST, PAINTING, SCULPTURE, OTHER, PERMANENT_COLLECTION, BORROWED, EXHIBITION, COLLECTION are related tables.
-- Foreign keys link these tables to ART_OBJECT. For example, ART_OBJECT.Artist_Name references ARTIST.Artist_Name.
-- PAINTING, SCULPTURE, and OTHER have Art_ID as both primary key and foreign key, creating a one-to-one relationship with ART_OBJECT.
-- PERMANENT_COLLECTION and BORROWED tables also reference ART_OBJECT via Art_ID.
-- ART_OBJECT_EXHIBITION links ART_OBJECT and EXHIBITION tables, representing which art objects are in which exhibitions.

-- Another way: 

SELECT 
  TABLE_NAME AS 'Table', 
  COLUMN_NAME AS 'Column',
  CONSTRAINT_NAME AS 'Constraint',
  REFERENCED_TABLE_NAME AS 'Referenced Table',
  REFERENCED_COLUMN_NAME AS 'Referenced Column'
FROM 
  information_schema.KEY_COLUMN_USAGE
WHERE 
  TABLE_SCHEMA = 'ART_MUSEUM' AND
  REFERENCED_TABLE_NAME IS NOT NULL;


-- 2) Retrieve all records from the ARTIST table
SELECT * FROM ARTIST;


-- 3) Retrieve all art objects ordered by Creation_Time
SELECT * FROM ART_OBJECT ORDER BY Creation_Time;


-- 4) Retrieve artists who have paintings in the ART_OBJECT table
SELECT * FROM ARTIST WHERE Artist_Name IN (SELECT Artist_Name FROM ART_OBJECT WHERE Type_of_Art = 'Painting');


-- 5) Retrieve all art objects along with their artist's details
SELECT AO.*, A.*
FROM ART_OBJECT AO
JOIN ARTIST A ON AO.Artist_Name = A.Artist_Name;


-- 6) Update query
UPDATE PERMANENT_COLLECTION SET Status = 'On Loan' WHERE Art_ID = 1;

-- Trigger (Assuming you have a table named STATUS_CHANGE_LOG to log status changes)
DELIMITER $$
CREATE TRIGGER after_status_update
AFTER UPDATE ON PERMANENT_COLLECTION
FOR EACH ROW
BEGIN
  INSERT INTO STATUS_CHANGE_LOG (Art_ID, Old_Status, New_Status, Change_Date)
  VALUES (NEW.Art_ID, OLD.Status, NEW.Status, NOW());
END$$
DELIMITER ;


-- 7) Delete query
DELETE FROM ART_OBJECT WHERE Art_ID = 1;

-- Trigger (Assuming you have a table named DELETION_LOG to log deletions)
DELIMITER $$
CREATE TRIGGER before_art_object_delete
BEFORE DELETE ON ART_OBJECT
FOR EACH ROW
BEGIN
  INSERT INTO DELETION_LOG (Art_ID, Deletion_Date)
  VALUES (OLD.Art_ID, NOW());
END$$
DELIMITER ;






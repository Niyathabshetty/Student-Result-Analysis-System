CREATE DATABASE StudentResults;

USE StudentResults;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    class VARCHAR(20)
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50)
);

CREATE TABLE Results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

INSERT INTO Students VALUES
(1, 'Aman', '10A'),
(2, 'Riya', '10A'),
(3, 'Kiran', '10A');

INSERT INTO Subjects VALUES
(1, 'Maths'),
(2, 'Science'),
(3, 'English');

INSERT INTO Results (student_id, subject_id, marks) VALUES
(1,1,90), (1,2,85), (1,3,88),
(2,1,70), (2,2,60), (2,3,75),
(3,1,40), (3,2,35), (3,3,50);

 SELECT * FROM Students;
 SELECT * FROM Subjects;
 SELECT * FROM Results;
 
# Topper of Class

SELECT s.name, SUM(r.marks) AS total_marks
FROM Students s
JOIN Results r ON s.student_id = r.student_id
GROUP BY s.student_id
ORDER BY total_marks DESC
LIMIT 1;

# Average Marks per Subject

SELECT sub.subject_name, AVG(r.marks) AS avg_marks
FROM Subjects sub
JOIN Results r ON sub.subject_id = r.subject_id
GROUP BY sub.subject_id;

# Students Failing in Any Subject

SELECT DISTINCT s.name
FROM Students s
JOIN Results r ON s.student_id = r.student_id
WHERE r.marks < 50;
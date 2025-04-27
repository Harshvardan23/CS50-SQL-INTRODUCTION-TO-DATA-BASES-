-- Example SQL script
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Course VARCHAR(100),
    EnrollmentDate DATE
);

INSERT INTO Students (StudentID, StudentName, Course, EnrollmentDate)
VALUES (1, 'Harsh Kumar', 'Data Science', '2025-04-28');

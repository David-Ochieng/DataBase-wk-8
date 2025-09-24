-- 1. Create the database
CREATE DATABASE library_management;
USE library_management;

-- 2. Members table
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. Staff table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- 4. Categories table (e.g. Art, Science, History)
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- 5. Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- 6. Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_year YEAR NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 7. BookAuthors 
CREATE TABLE BookAuthors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 8. Copies of books
CREATE TABLE Copies (
    copy_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- 9. Loans table (tracks borrowed copies)
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    copy_id INT NOT NULL UNIQUE, -- one copy can only be on one loan at a time
    staff_id INT NOT NULL,
    loan_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (copy_id) REFERENCES Copies(copy_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);


-- Add categories
INSERT INTO Categories (category_name) VALUES ('Art'), ('Science'), ('History');

-- Add authors
INSERT INTO Authors (first_name, last_name) VALUES ('Donnel', 'Malen'), ('Isaac', 'Newton');

INSERT INTO Books (title, isbn, publication_year, category_id)
VALUES
('1984', '9780451524935', 1949, 1),    
('Principia Mathematica', '9780520088177', 1987, 2), 
('Sapiens: A Brief History of Humankind', '9780099590088', 2011, 3), 
('Pride and Prejudice', '9780141199078', 1970, 1); 

INSERT INTO BookAuthors (book_id, author_id)
VALUES
(7, 1), 
(8, 2);

-- Add copies
INSERT INTO Copies (book_id) VALUES (7), (8), (9);

-- Add members
INSERT INTO Members (first_name, last_name, email)
VALUES ('Alice', 'Wanjiru', 'alice@example.com');

-- Add staff
INSERT INTO Staff (first_name, last_name, role, email)
VALUES ('John', 'Mwangi', 'Librarian', 'john.mwangi@example.com');

-- Create a loan
INSERT INTO Loans (member_id, copy_id, staff_id, due_date)
VALUES (1, 4, 1, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY));
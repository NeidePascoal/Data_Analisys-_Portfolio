
-- CRIAÇÃO DAS TABELAS
CREATE TABLE Consultor (
    ConsultorID INT PRIMARY KEY IDENTITY,
    Nome NVARCHAR(100),
    Especialidade NVARCHAR(50),
    Idade INT,
    AnosExperiencia INT
);

CREATE TABLE EmpresaCliente (
    EmpresaID INT PRIMARY KEY IDENTITY,
    NomeEmpresa NVARCHAR(100),
    NIF NVARCHAR(9)
);

CREATE TABLE Vendedor (
    VendedorID INT PRIMARY KEY IDENTITY,
    Nome NVARCHAR(100),
    Email NVARCHAR(100),
    DataAdmissao DATE
);

CREATE TABLE Alocacao (
    AlocacaoID INT PRIMARY KEY IDENTITY,
    ConsultorID INT FOREIGN KEY REFERENCES Consultor(ConsultorID),
    EmpresaID INT FOREIGN KEY REFERENCES EmpresaCliente(EmpresaID),
    VendedorID INT FOREIGN KEY REFERENCES Vendedor(VendedorID),
    DataInicio DATE,
    DataFim DATE
);

-- INSERTS CONSULTOR
INSERT INTO Consultor (Nome, Especialidade, Idade, AnosExperiencia) VALUES
('Ana Ramos', 'Power BI', 32, 7), ('Carlos Sousa', 'C#', 29, 5), ('Beatriz Lima', 'SQL Server', 35, 10),
('Diogo Martins', 'Azure', 31, 6), ('Eva Carvalho', 'Python', 27, 3), ('Fábio Costa', 'Java', 38, 12),
('Gonçalo Pinto', 'React', 30, 5), ('Helena Ferreira', 'BI', 33, 9), ('Igor Mendes', 'Networking', 41, 15),
('Joana Nogueira', 'Scrum', 34, 8), ('Kátia Rocha', 'C++', 37, 11), ('Luís Fonseca', 'DevOps', 40, 14),
('Marta Correia', 'Excel VBA', 36, 10), ('Nuno Dias', 'Angular', 28, 4), ('Olga Cruz', 'Data Science', 30, 6),
('Pedro Almeida', 'ETL', 39, 13), ('Quintino Silva', 'SharePoint', 35, 10), ('Rita Moura', 'Access', 33, 9),
('Sofia Pires', 'Python', 26, 3), ('Tiago Neves', 'SQL', 29, 5), ('Ulisses Gomes', 'Linux', 42, 17),
('Vera Barbosa', 'RPA', 31, 6), ('Walter Costa', 'Power Apps', 38, 12), ('Xavier Torres', 'MongoDB', 30, 7),
('Yara Ferreira', 'Tableau', 34, 8), ('Zélia Rocha', 'Power Automate', 36, 9), ('Bruno Alves', 'Machine Learning', 29, 5),
('Catarina Lopes', 'Data Mining', 32, 7), ('Duarte Freitas', 'BI', 37, 11), ('Eduarda Sá', 'SAP', 33, 8),
('Francisco Rocha', 'JavaScript', 28, 4), ('Gabriela Monteiro', 'HTML/CSS', 27, 3), ('Hugo Ferreira', 'Kubernetes', 41, 14),
('Isabel Ribeiro', 'Cloud', 35, 10), ('Jorge Montez', 'Oracle', 43, 18), ('Leonor Braga', 'PostgreSQL', 39, 13),
('Márcio Silva', 'C#', 29, 5), ('Nelson Dias', 'SQL Server', 31, 6), ('Paula Rocha', 'Excel', 34, 8),
('Raquel Pinto', 'ETL', 30, 5);

-- INSERTS EMPRESAS
INSERT INTO EmpresaCliente (NomeEmpresa, NIF) VALUES
('TechNova', '500123456'), ('Infoware', '501234567'), ('ByteCorp', '502345678'), ('InovaTI', '503456789'),
('CodeWorks', '504567890'), ('DataLogic', '505678901'), ('SysTech', '506789012'), ('NetAdvance', '507890123'),
('CloudExperts', '508901234'), ('DigitalPath', '509012345');

-- INSERTS VENDEDORES
INSERT INTO Vendedor (Nome, Email, DataAdmissao) VALUES
('João Vendas', 'joao.vendas@consultora.pt', '2019-04-10'),
('Maria Comercial', 'maria.comercial@consultora.pt', '2020-06-15'),
('Carlos Negócios', 'carlos.negocios@consultora.pt', '2021-01-20'),
('Sílvia Relacional', 'silvia.relacional@consultora.pt', '2018-11-05'),
('André Parceiros', 'andre.parceiros@consultora.pt', '2022-03-01');

-- INSERTS ALOCACAO
INSERT INTO Alocacao (ConsultorID, EmpresaID, VendedorID, DataInicio, DataFim) VALUES
(1,1,1,'2024-01-10','2024-03-10'),(2,2,2,'2024-02-01','2024-04-01'),(3,3,3,'2024-03-15','2024-06-15'),
(4,4,4,'2024-01-20','2024-04-20'),(5,5,5,'2024-02-10','2024-05-10'),(6,6,1,'2024-01-05','2024-02-28'),
(7,7,2,'2024-03-01','2024-06-01'),(8,8,3,'2024-04-01','2024-07-01'),(9,9,4,'2024-05-01','2024-08-01'),
(10,10,5,'2024-06-01','2024-09-01'),(11,1,1,'2024-02-10','2024-04-10'),(12,2,2,'2024-03-05','2024-06-05'),
(13,3,3,'2024-04-15','2024-07-15'),(14,4,4,'2024-05-20','2024-08-20'),(15,5,5,'2024-06-10','2024-09-10'),
(16,6,1,'2024-07-01','2024-10-01'),(17,7,2,'2024-08-01','2024-11-01'),(18,8,3,'2024-09-01','2024-12-01'),
(19,9,4,'2024-10-01','2025-01-01'),(20,10,5,'2024-11-01','2025-02-01'),(21,1,1,'2024-02-01','2024-05-01'),
(22,2,2,'2024-03-01','2024-06-01'),(23,3,3,'2024-04-01','2024-07-01'),(24,4,4,'2024-05-01','2024-08-01'),
(25,5,5,'2024-06-01','2024-09-01'),(26,6,1,'2024-07-01','2024-10-01'),(27,7,2,'2024-08-01','2024-11-01'),
(28,8,3,'2024-09-01','2024-12-01'),(29,9,4,'2024-10-01','2025-01-01'),(30,10,5,'2024-11-01','2025-02-01');

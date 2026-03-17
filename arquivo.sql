-- Criar banco
CREATE DATABASE escola;
USE escola;

-- ========================
-- Tabela: Aluno
-- ========================
CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    cpf VARCHAR(14),
    data_nascimento DATE
);

-- ========================
-- Tabela: Professor
-- ========================
CREATE TABLE Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    cpf VARCHAR(14),
    setor VARCHAR(50)
);

-- ========================
-- Tabela: Curso
-- ========================
CREATE TABLE Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    idioma VARCHAR(50),
    nivel VARCHAR(50)
);

-- ========================
-- Tabela: Turma
-- ========================
CREATE TABLE Turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    horario VARCHAR(50),
    
    fk_id_professor INT,
    fk_id_curso INT,

    FOREIGN KEY (fk_id_professor) REFERENCES Professor(id_professor),
    FOREIGN KEY (fk_id_curso) REFERENCES Curso(id_curso)
);

-- ========================
-- Tabela: Matricula
-- ========================
CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(50),
    data_matricula DATE,

    fk_id_aluno INT,
    fk_id_turma INT,

    FOREIGN KEY (fk_id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (fk_id_turma) REFERENCES Turma(id_turma)
);

-- ========================
-- Tabela: Pagamento
-- ========================
CREATE TABLE Pagamento (
    id_pgto INT PRIMARY KEY AUTO_INCREMENT,
    data_pgto DATE,
    valor DECIMAL(10,2),
    metodo_pgto VARCHAR(50),
    status VARCHAR(50),

    fk_id_matricula INT,

    FOREIGN KEY (fk_id_matricula) REFERENCES Matricula(id_matricula)
);

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL
);

CREATE TABLE Veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    cor VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL
);

CREATE TABLE Contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_cliente INT NOT NULL,
    fk_id_funcionario INT NOT NULL,
    fk_id_veiculo INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    tipo_pagamento VARCHAR(50) NOT NULL,
    multa DECIMAL(10,2),

    FOREIGN KEY (fk_id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (fk_id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (fk_id_veiculo) REFERENCES Veiculo(id_veiculo)
);

CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_contrato INT NOT NULL UNIQUE,
    data_pagamento DATE NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    comprovante VARCHAR(100),
    juros DECIMAL(10,2),
    desconto DECIMAL(10,2),

    FOREIGN KEY (fk_id_contrato) REFERENCES Contrato(id_contrato)
);

CREATE TABLE Manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_veiculo INT NOT NULL,
    tipo_manutencao VARCHAR(50) NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    dt_inicio DATE NOT NULL,
    dt_fim DATE,
    custo DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    responsavel VARCHAR(100),

    FOREIGN KEY (fk_id_veiculo) REFERENCES Veiculo(id_veiculo)
);

INSERT INTO Cliente (nome, cpf, telefone, email, endereco, data_nascimento, data_cadastro) VALUES
('João Silva', '123.456.789-01', '(83) 99991-0001', 'joao.silva@gmail.com', 'Rua das Acácias, 120', '1995-05-10', '2024-01-10'),
('Maria Souza', '987.654.321-00', '(83) 99992-0002', 'maria.souza@hotmail.com', 'Av. Epitácio Pessoa, 450', '1998-03-15', '2024-01-12'),
('Pedro Lima', '456.789.123-55', '(83) 99993-0003', 'pedro.lima@yahoo.com', 'Rua João Pessoa, 78', '1992-07-20', '2024-01-15'),
('Ana Costa', '321.654.987-22', '(83) 99994-0004', 'ana.costa@gmail.com', 'Rua das Flores, 300', '1990-09-10', '2024-01-18'),
('Lucas Alves', '159.357.258-44', '(83) 99995-0005', 'lucas.alves@gmail.com', 'Av. Beira Rio, 890', '1999-12-01', '2024-01-20'),
('Carla Dias', '258.369.147-66', '(83) 99996-0006', 'carla.dias@gmail.com', 'Rua do Sol, 55', '1993-11-11', '2024-01-22'),
('Rafael Gomes', '369.258.147-77', '(83) 99997-0007', 'rafael.gomes@gmail.com', 'Rua das Palmeiras, 600', '1996-06-06', '2024-01-25'),
('Juliana Rocha', '741.852.963-88', '(83) 99998-0008', 'juliana.rocha@gmail.com', 'Av. Cabo Branco, 1200', '1997-02-22', '2024-01-28'),
('Bruno Martins', '852.963.741-99', '(83) 99999-0009', 'bruno.martins@gmail.com', 'Rua do Comércio, 89', '1991-08-18', '2024-02-01'),
('Fernanda Melo', '963.741.852-10', '(83) 98888-0010', 'fernanda.melo@gmail.com', 'Rua da Praia, 210', '1994-04-25', '2024-02-03');

INSERT INTO Funcionario (nome, cpf, telefone, email, cargo, salario, data_admissao) VALUES
('Carlos Mendes', '111.222.333-44', '(83) 98881-1001', 'carlos.mendes@velozcar.com', 'Atendente', 2500.00, '2023-01-10'),
('Marcos Lima', '222.333.444-55', '(83) 98882-1002', 'marcos.lima@velozcar.com', 'Gerente', 5000.00, '2022-03-15'),
('Paula Souza', '333.444.555-66', '(83) 98883-1003', 'paula.souza@velozcar.com', 'Atendente', 2600.00, '2023-05-20'),
('Renato Alves', '444.555.666-77', '(83) 98884-1004', 'renato.alves@velozcar.com', 'Supervisor', 4000.00, '2021-07-01'),
('Aline Costa', '555.666.777-88', '(83) 98885-1005', 'aline.costa@velozcar.com', 'Atendente', 2500.00, '2023-08-12'),
('Diego Rocha', '666.777.888-99', '(83) 98886-1006', 'diego.rocha@velozcar.com', 'Gerente', 5200.00, '2020-09-30'),
('Julio Santos', '777.888.999-00', '(83) 98887-1007', 'julio.santos@velozcar.com', 'Atendente', 2400.00, '2024-01-02'),
('Patricia Dias', '888.999.000-11', '(83) 98888-1008', 'patricia.dias@velozcar.com', 'Supervisor', 4100.00, '2022-11-11'),
('Fernando Melo', '999.000.111-22', '(83) 98889-1009', 'fernando.melo@velozcar.com', 'Atendente', 2550.00, '2023-06-06'),
('Claudia Gomes', '000.111.222-33', '(83) 98880-1010', 'claudia.gomes@velozcar.com', 'Atendente', 2450.00, '2024-02-02');

INSERT INTO Veiculo (modelo, marca, ano, placa, cor, status, valor_diaria) VALUES
('Onix', 'Chevrolet', 2020, 'QWE1A23', 'Preto', 'disponivel', 120.00),
('HB20', 'Hyundai', 2021, 'RTY2B34', 'Branco', 'alugado', 130.00),
('Gol', 'Volkswagen', 2019, 'UIO3C45', 'Prata', 'manutencao', 100.00),
('Corolla', 'Toyota', 2022, 'PAS4D56', 'Preto', 'disponivel', 200.00),
('Civic', 'Honda', 2021, 'DFG5E67', 'Cinza', 'alugado', 210.00),
('Argo', 'Fiat', 2020, 'GHJ6F78', 'Vermelho', 'disponivel', 110.00),
('Compass', 'Jeep', 2023, 'JKL7G89', 'Preto', 'disponivel', 250.00),
('Renegade', 'Jeep', 2022, 'ZXC8H90', 'Branco', 'manutencao', 220.00),
('Sandero', 'Renault', 2018, 'VBN9I01', 'Prata', 'disponivel', 90.00),
('Kwid', 'Renault', 2021, 'MKO0J12', 'Azul', 'alugado', 95.00);

INSERT INTO Contrato (fk_id_cliente, fk_id_funcionario, fk_id_veiculo, data_inicio, data_fim, valor_total, status, tipo_pagamento, multa) VALUES
(1,1,1,'2024-02-01','2024-02-05',480.00,'finalizado','pix',0),
(2,2,2,'2024-02-10','2024-02-15',650.00,'ativo','cartao',0),
(3,1,3,'2024-02-12','2024-02-14',200.00,'atrasado','boleto',50),
(4,3,4,'2024-02-15','2024-02-20',1000.00,'ativo','pix',0),
(5,4,5,'2024-02-18','2024-02-20',420.00,'finalizado','cartao',0),
(6,2,6,'2024-02-20','2024-02-25',550.00,'ativo','boleto',0),
(7,5,7,'2024-02-22','2024-02-24',500.00,'finalizado','pix',0),
(8,6,8,'2024-02-25','2024-02-28',660.00,'ativo','cartao',0),
(9,7,9,'2024-02-26','2024-02-28',180.00,'finalizado','pix',0),
(10,8,10,'2024-03-01','2024-03-05',380.00,'ativo','boleto',0);

INSERT INTO Pagamento (fk_id_contrato, data_pagamento, valor_pago, forma_pagamento, status, comprovante, juros, desconto) VALUES
(1,'2024-02-05',480.00,'pix','concluido','PIX123',0,0),
(2,'2024-02-15',650.00,'cartao','pendente','CARD456',0,0),
(3,'2024-02-14',250.00,'boleto','concluido','BOL789',50,0),
(4,'2024-02-20',1000.00,'pix','pendente','PIX321',0,0),
(5,'2024-02-20',420.00,'cartao','concluido','CARD654',0,0),
(6,'2024-02-25',550.00,'boleto','pendente','BOL987',0,0),
(7,'2024-02-24',500.00,'pix','concluido','PIX111',0,0),
(8,'2024-02-28',660.00,'cartao','pendente','CARD222',0,0),
(9,'2024-02-28',180.00,'pix','concluido','PIX333',0,0),
(10,'2024-03-05',380.00,'boleto','pendente','BOL444',0,0);

INSERT INTO Manutencao (fk_id_veiculo, tipo_manutencao, descricao, data_inicio, data_fim, custo, status, responsavel) VALUES
(3,'Preventiva','Troca de óleo e filtros','2024-01-10','2024-01-11',150.00,'concluido','Oficina AutoCenter JP'),
(8,'Corretiva','Troca de pastilhas de freio','2024-01-12','2024-01-14',300.00,'concluido','Oficina Nordeste'),
(1,'Preventiva','Revisão geral','2024-01-15','2024-01-16',200.00,'concluido','Concessionária Chevrolet'),
(2,'Corretiva','Reparo no motor','2024-01-17','2024-01-20',800.00,'concluido','Oficina MotorTech'),
(4,'Preventiva','Alinhamento e balanceamento','2024-01-18','2024-01-18',100.00,'concluido','Oficina RodaCerta'),
(5,'Corretiva','Troca de suspensão','2024-01-19','2024-01-22',400.00,'concluido','Oficina Suspensões BR'),
(6,'Preventiva','Troca de pneus','2024-01-20','2024-01-21',250.00,'concluido','PneuCenter'),
(7,'Corretiva','Sistema de freios','2024-01-21','2024-01-23',350.00,'concluido','Oficina FreioSeguro'),
(9,'Preventiva','Revisão completa','2024-01-22','2024-01-23',180.00,'concluido','AutoCheck'),
(10,'Corretiva','Reparo no motor','2024-01-23','2024-01-25',900.00,'concluido','MotorFix');

UPDATE Contrato
SET status = 'finalizado'
WHERE id_contrato = 2;

UPDATE Veiculo
SET status = 'disponivel'
WHERE id_veiculo = 2;

UPDATE Pagamento
SET status = 'concluido'
WHERE fk_id_contrato = 2;


SELECT DATE_FORMAT(data_cadastro, '%Y-%m') AS mes,
       COUNT(*) AS total_clientes
FROM Cliente
GROUP BY mes;

SELECT AVG(TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())) AS idade_media
FROM Cliente;


SELECT cargo,
       AVG(salario) AS media_salarial
FROM Funcionario
GROUP BY cargo;

SELECT MAX(salario) AS maior_salario
FROM Funcionario;


SELECT status,
       COUNT(*) AS total
FROM Veiculo
GROUP BY status;

SELECT AVG(valor_diaria) AS media_diaria
FROM Veiculo;


SELECT status,
       SUM(valor_total) AS faturamento
FROM Contrato
GROUP BY status;

SELECT MAX(valor_total) AS maior_aluguel
FROM Contrato;


SELECT forma_pagamento,
       SUM(valor_pago) AS total_recebido
FROM Pagamento
GROUP BY forma_pagamento;

SELECT status,
       COUNT(*) AS total
FROM Pagamento
GROUP BY status;


SELECT tipo_manutencao,
       SUM(custo) AS custo_total
FROM Manutencao
GROUP BY tipo_manutencao;

SELECT MAX(custo) AS maior_custo
FROM Manutencao;



SELECT c.id_contrato,
       cl.nome AS cliente,
       c.data_inicio,
       c.data_fim,
       c.valor_total
FROM Contrato c
INNER JOIN Cliente cl
ON c.fk_id_cliente = cl.id_cliente;


SELECT c.id_contrato,
       cl.nome AS cliente,
       v.modelo AS veiculo,
       f.nome AS funcionario,
       c.status
FROM Contrato c
INNER JOIN Cliente cl ON c.fk_id_cliente = cl.id_cliente
INNER JOIN Veiculo v ON c.fk_id_veiculo = v.id_veiculo
INNER JOIN Funcionario f ON c.fk_id_funcionario = f.id_funcionario;


SELECT v.modelo,
       m.tipo_manutencao,
       m.custo
FROM Veiculo v
LEFT JOIN Manutencao m
ON v.id_veiculo = m.fk_id_veiculo;





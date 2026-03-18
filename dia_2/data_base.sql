USE desafio;

CREATE TABLE vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cidade VARCHAR(50)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_vendedor INT,
    valor DECIMAL(10,2),
    data_venda DATE,
    FOREIGN KEY (fk_id_vendedor) REFERENCES vendedores(id_vendedor)
);

INSERT INTO vendedores (nome, cidade) VALUES
('Carlos', 'João Pessoa'),
('Ana', 'Recife'),
('Pedro', 'Natal'),
('Mariana', 'Fortaleza'),
('Lucas', 'Salvador'),
('Fernanda', 'Maceió'),
('Bruno', 'Aracaju'),
('Camila', 'Teresina'),
('Rafael', 'São Luís'),
('Juliana', 'Belém');


INSERT INTO vendas (fk_id_vendedor, valor, data_venda) VALUES
(1, 500.00, '2026-03-10'),
(2, 700.00, '2026-03-10'),
(3, 200.00, '2026-03-11'),
(4, 900.00, '2026-03-11'),
(5, 350.00, '2026-03-12'),
(6, 800.00, '2026-03-12'),
(7, 150.00, '2026-03-13'),
(8, 600.00, '2026-03-13'),
(9, 400.00, '2026-03-14'),
(10, 1000.00, '2026-03-14');

UPDATE vendas
SET valor = valor * 1.10
WHERE id_venda > 0 AND valor < 500;

SELECT *
FROM vendas
WHERE valor > 300;


SELECT fk_id_vendedor , SUM(valor) AS total_vendido
FROM vendas 
GROUP BY fk_id_vendedor;

SELECT MAX(valor) AS maior_venda
FROM vendas;

SELECT vdores.nome , SUM(valor) AS total_vendido_vendedor
FROM vendas ve
JOIN vendedores vdores ON vdores.id_vendedor = ve.fk_id_vendedor
GROUP BY vdores.nome















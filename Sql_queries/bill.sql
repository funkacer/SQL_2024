SET ROLE funka;

CREATE TABLE bill (id SERIAL, month DATE, type varchar(1), amount INTEGER);

INSERT INTO bill (month,type, amount) VALUES
(1, '2021-01-01', 'M', 2000),
(2, '2021-01-01', 'F', 1200),
(3, '2021-01-02', 'M', 3000),
(4, '2021-01-02', 'F', 1500),
(5, '2021-01-02', 'F', 2200),
(6, '2021-01-03', 'M', 1800);
-- ============================================================================
-- PARTIE 3 : INSERTION DES MACHINES - SECTEUR CARRIÈRE (2/4)
-- ============================================================================

-- CARRIÈRE - Concasseurs (6 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Concasseur à mâchoires compact', 'ROCTECH Industries', 'ROCK-JAW250', 'Carrière', 'Concasseurs', 85000.00, 420.00, 90.00, '50 t/h', '18 L/h', 650.00, 100, 0.00, 100, 2),
('Concasseur à mâchoires standard', 'ROCTECH Industries', 'ROCK-JAW400', 'Carrière', 'Concasseurs', 145000.00, 680.00, 132.00, '100 t/h', '26 L/h', 920.00, 100, 0.00, 100, 4),
('Concasseur à mâchoires lourd', 'ROCTECH Industries', 'ROCK-JAW600', 'Carrière', 'Concasseurs', 245000.00, 1050.00, 200.00, '200 t/h', '38 L/h', 1350.00, 100, 0.00, 100, 7),
('Concasseur à cône standard', 'ROCTECH Industries', 'ROCK-CONE300', 'Carrière', 'Concasseurs', 195000.00, 850.00, 160.00, '120 t/h', '30 L/h', 1050.00, 100, 0.00, 100, 5),
('Concasseur à cône haute performance', 'ROCTECH Industries', 'ROCK-CONE500', 'Carrière', 'Concasseurs', 325000.00, 1450.00, 250.00, '250 t/h', '45 L/h', 1650.00, 100, 0.00, 100, 9),
('Concasseur à percussion mobile', 'ROCTECH Industries', 'ROCK-IMPACT450', 'Carrière', 'Concasseurs', 385000.00, 1750.00, 315.00, '300 t/h', '55 L/h', 1950.00, 100, 0.00, 100, 11);

-- CARRIÈRE - Cribles (5 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Crible mobile compact', 'ROCTECH Industries', 'ROCK-SCREEN150', 'Carrière', 'Cribles', 75000.00, 380.00, 75.00, '80 t/h', '14 L/h', 520.00, 100, 0.00, 100, 2),
('Crible mobile 2 étages', 'ROCTECH Industries', 'ROCK-SCREEN250', 'Carrière', 'Cribles', 125000.00, 580.00, 110.00, '150 t/h', '20 L/h', 750.00, 100, 0.00, 100, 4),
('Crible mobile 3 étages', 'ROCTECH Industries', 'ROCK-SCREEN350', 'Carrière', 'Cribles', 185000.00, 850.00, 145.00, '250 t/h', '28 L/h', 1050.00, 100, 0.00, 100, 6),
('Crible fixe grande capacité', 'ROCTECH Industries', 'ROCK-SCREENFIX500', 'Carrière', 'Cribles', 245000.00, 1150.00, 200.00, '400 t/h', '35 L/h', 1380.00, 100, 0.00, 100, 9),
('Crible vibrant haute fréquence', 'ROCTECH Industries', 'ROCK-VIBRO600', 'Carrière', 'Cribles', 315000.00, 1450.00, 250.00, '500 t/h', '42 L/h', 1650.00, 100, 0.00, 100, 11);

-- CARRIÈRE - Pelles hydrauliques (7 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Mini-pelle 1.5 tonnes', 'EXCAVEO', 'EXC-MINI15', 'Carrière', 'Pelles hydrauliques', 28000.00, 135.00, 13.00, '0.04 m³', '3 L/h', 220.00, 100, 0.00, 100, 1),
('Mini-pelle 3 tonnes', 'EXCAVEO', 'EXC-MINI30', 'Carrière', 'Pelles hydrauliques', 42000.00, 195.00, 18.50, '0.08 m³', '4.5 L/h', 280.00, 100, 0.00, 100, 1),
('Pelle 8 tonnes', 'EXCAVEO', 'EXC-M80', 'Carrière', 'Pelles hydrauliques', 95000.00, 420.00, 45.00, '0.30 m³', '10 L/h', 520.00, 100, 0.00, 100, 2),
('Pelle 14 tonnes', 'EXCAVEO', 'EXC-M140', 'Carrière', 'Pelles hydrauliques', 145000.00, 650.00, 75.00, '0.55 m³', '16 L/h', 720.00, 100, 0.00, 100, 4),
('Pelle 22 tonnes', 'EXCAVEO', 'EXC-L220', 'Carrière', 'Pelles hydrauliques', 225000.00, 950.00, 120.00, '1.00 m³', '24 L/h', 1050.00, 100, 0.00, 100, 6),
('Pelle 35 tonnes', 'EXCAVEO', 'EXC-L350', 'Carrière', 'Pelles hydrauliques', 385000.00, 1650.00, 200.00, '1.80 m³', '38 L/h', 1650.00, 100, 0.00, 100, 9),
('Pelle 50 tonnes', 'EXCAVEO', 'EXC-XL500', 'Carrière', 'Pelles hydrauliques', 585000.00, 2450.00, 280.00, '2.50 m³', '52 L/h', 2350.00, 100, 0.00, 100, 12);

-- CARRIÈRE - Chargeuses sur pneus (7 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Chargeuse compacte', 'FOREXO', 'FOREX-C15', 'Carrière', 'Chargeuses sur pneus', 65000.00, 295.00, 55.00, '1.0 m³', '12 L/h', 420.00, 100, 0.00, 100, 1),
('Chargeuse standard 2m³', 'FOREXO', 'FOREX-S20', 'Carrière', 'Chargeuses sur pneus', 115000.00, 520.00, 95.00, '2.0 m³', '18 L/h', 650.00, 100, 0.00, 100, 3),
('Chargeuse standard 3m³', 'FOREXO', 'FOREX-S30', 'Carrière', 'Chargeuses sur pneus', 165000.00, 750.00, 130.00, '3.0 m³', '24 L/h', 850.00, 100, 0.00, 100, 5),
('Chargeuse lourde 4m³', 'FOREXO', 'FOREX-L40', 'Carrière', 'Chargeuses sur pneus', 245000.00, 1050.00, 180.00, '4.0 m³', '32 L/h', 1150.00, 100, 0.00, 100, 7),
('Chargeuse lourde 5m³', 'FOREXO', 'FOREX-L50', 'Carrière', 'Chargeuses sur pneus', 325000.00, 1450.00, 230.00, '5.0 m³', '40 L/h', 1450.00, 100, 0.00, 100, 9),
('Chargeuse très lourde 7m³', 'FOREXO', 'FOREX-XL70', 'Carrière', 'Chargeuses sur pneus', 485000.00, 2150.00, 320.00, '7.0 m³', '55 L/h', 1950.00, 100, 0.00, 100, 11),
('Chargeuse géante 10m³', 'FOREXO', 'FOREX-XXL100', 'Carrière', 'Chargeuses sur pneus', 725000.00, 3250.00, 450.00, '10.0 m³', '75 L/h', 2850.00, 100, 0.00, 100, 14);

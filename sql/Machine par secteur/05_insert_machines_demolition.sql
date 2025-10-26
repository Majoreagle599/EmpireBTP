-- ============================================================================
-- PARTIE 5 : INSERTION DES MACHINES - SECTEUR DÉMOLITION (4/4)
-- ============================================================================

-- DÉMOLITION - Citernes et cuves (3 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Citerne à eau 5000L', 'CITERNO', 'CIT-EAU5', 'Démolition', 'Citernes et cuves', 28000.00, 125.00, 180.00, '5000L eau', '28 L/100km', 320.00, 100, 0.00, 100, 1),
('Citerne à eau 10000L', 'CITERNO', 'CIT-EAU10', 'Démolition', 'Citernes et cuves', 48000.00, 220.00, 240.00, '10000L eau', '35 L/100km', 480.00, 100, 0.00, 100, 3),
('Cuve aspiration gravats 8m³', 'CITERNO', 'CIT-GRAV8', 'Démolition', 'Citernes et cuves', 75000.00, 385.00, 280.00, '8m³ gravats', '38 L/100km', 650.00, 100, 0.00, 100, 5);

-- DÉMOLITION - Pelles de démolition (5 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Pelle démolition 22 tonnes', 'DÉMOLEC', 'DEMO-P22', 'Démolition', 'Pelles de démolition', 245000.00, 1050.00, 120.00, '18m hauteur', '26 L/h', 1250.00, 100, 0.00, 100, 5),
('Pelle démolition 35 tonnes', 'DÉMOLEC', 'DEMO-P35', 'Démolition', 'Pelles de démolition', 385000.00, 1650.00, 200.00, '24m hauteur', '40 L/h', 1850.00, 100, 0.00, 100, 8),
('Pelle démolition 50 tonnes haute portée', 'DÉMOLEC', 'DEMO-P50HP', 'Démolition', 'Pelles de démolition', 585000.00, 2450.00, 280.00, '32m hauteur', '55 L/h', 2650.00, 100, 0.00, 100, 11),
('Pelle démolition 70 tonnes ultra haute', 'DÉMOLEC', 'DEMO-P70UH', 'Démolition', 'Pelles de démolition', 825000.00, 3650.00, 380.00, '42m hauteur', '75 L/h', 3650.00, 100, 0.00, 100, 14),
('Pelle démolition sur rails', 'DÉMOLEC', 'DEMO-RAIL45', 'Démolition', 'Pelles de démolition', 725000.00, 3150.00, 250.00, '28m hauteur', '48 L/h', 3250.00, 100, 0.00, 100, 12);

-- DÉMOLITION - Équipements de démolition (6 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Pince de démolition 5 tonnes', 'PERCUTO', 'PERC-PINCE5', 'Démolition', 'Équipements de démolition', 28000.00, 195.00, NULL, '5t force', NULL, 380.00, 100, 0.00, 100, 3),
('Pince de démolition 10 tonnes', 'PERCUTO', 'PERC-PINCE10', 'Démolition', 'Équipements de démolition', 48000.00, 320.00, NULL, '10t force', NULL, 580.00, 100, 0.00, 100, 5),
('Cisaille hydraulique 15 tonnes', 'PERCUTO', 'PERC-CIS15', 'Démolition', 'Équipements de démolition', 68000.00, 450.00, NULL, '15t force', NULL, 750.00, 100, 0.00, 100, 7),
('Grappin de tri 1.5m³', 'PERCUTO', 'PERC-GRAP15', 'Démolition', 'Équipements de démolition', 18000.00, 125.00, NULL, '1.5m³', NULL, 280.00, 100, 0.00, 100, 2),
('Broyeur béton 8 tonnes', 'PERCUTO', 'PERC-BROY8', 'Démolition', 'Équipements de démolition', 85000.00, 520.00, NULL, '8t force', NULL, 920.00, 100, 0.00, 100, 8),
('Pulvérisateur béton 12 tonnes', 'PERCUTO', 'PERC-PULV12', 'Démolition', 'Équipements de démolition', 125000.00, 780.00, NULL, '12t force', NULL, 1250.00, 100, 0.00, 100, 10);

-- DÉMOLITION - Engins spéciaux (6 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Robot de démolition télécommandé', 'ROBODÉMOL', 'ROBO-DEMO300', 'Démolition', 'Engins spéciaux', 95000.00, 650.00, 25.00, '300kg outil', '5 L/h', 850.00, 100, 0.00, 100, 6),
('Robot de démolition lourd', 'ROBODÉMOL', 'ROBO-DEMO800', 'Démolition', 'Engins spéciaux', 185000.00, 1250.00, 55.00, '800kg outil', '12 L/h', 1450.00, 100, 0.00, 100, 9),
('Boule de démolition 2 tonnes', 'DÉMOLEC', 'DEMO-BOULE2', 'Démolition', 'Engins spéciaux', 18000.00, 145.00, NULL, '2 tonnes', NULL, 280.00, 100, 0.00, 100, 4),
('Boule de démolition 5 tonnes', 'DÉMOLEC', 'DEMO-BOULE5', 'Démolition', 'Engins spéciaux', 38000.00, 285.00, NULL, '5 tonnes', NULL, 450.00, 100, 0.00, 100, 7),
('Marteau-piqueur hydraulique 300kg', 'PERCUTO', 'PERC-MART300', 'Démolition', 'Engins spéciaux', 12000.00, 95.00, NULL, '300kg', NULL, 220.00, 100, 0.00, 100, 2),
('Scie à béton sur rail', 'SCIACO', 'SCI-RAIL800', 'Démolition', 'Engins spéciaux', 45000.00, 350.00, 18.00, 'Ø800mm', '8 L/h', 520.00, 100, 0.00, 100, 5);

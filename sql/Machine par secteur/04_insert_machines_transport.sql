-- ============================================================================
-- PARTIE 4 : INSERTION DES MACHINES - SECTEUR TRANSPORT (3/4)
-- ============================================================================

-- TRANSPORT - Convoyeurs (8 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Convoyeur mobile 10m', 'CONVÉO', 'CONV-M10', 'Transport', 'Convoyeurs', 18000.00, 95.00, 7.50, '10m - 50t/h', '2 L/h', 180.00, 100, 0.00, 100, 1),
('Convoyeur mobile 15m', 'CONVÉO', 'CONV-M15', 'Transport', 'Convoyeurs', 28000.00, 145.00, 11.00, '15m - 80t/h', '3 L/h', 250.00, 100, 0.00, 100, 2),
('Convoyeur mobile 20m', 'CONVÉO', 'CONV-M20', 'Transport', 'Convoyeurs', 42000.00, 220.00, 15.00, '20m - 120t/h', '4 L/h', 320.00, 100, 0.00, 100, 3),
('Convoyeur mobile 30m', 'CONVÉO', 'CONV-M30', 'Transport', 'Convoyeurs', 65000.00, 350.00, 22.00, '30m - 180t/h', '6 L/h', 480.00, 100, 0.00, 100, 5),
('Convoyeur radial télescopique', 'CONVÉO', 'CONV-RADIO40', 'Transport', 'Convoyeurs', 95000.00, 520.00, 30.00, '40m - 250t/h', '8 L/h', 650.00, 100, 0.00, 100, 7),
('Convoyeur empileur 50m', 'CONVÉO', 'CONV-STACK50', 'Transport', 'Convoyeurs', 145000.00, 750.00, 45.00, '50m - 350t/h', '12 L/h', 920.00, 100, 0.00, 100, 9),
('Convoyeur sauterelle 35m', 'CONVÉO', 'CONV-SAUT35', 'Transport', 'Convoyeurs', 85000.00, 450.00, 25.00, '35m - 200t/h', '7 L/h', 580.00, 100, 0.00, 100, 6),
('Convoyeur transfert fixe 60m', 'CONVÉO', 'CONV-FIX60', 'Transport', 'Convoyeurs', 185000.00, 950.00, 55.00, '60m - 500t/h', '15 L/h', 1150.00, 100, 0.00, 100, 11);

-- TRANSPORT - Camions de chantier (8 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Camion benne 6x4 léger', 'FRETCO', 'FRET-B15', 'Transport', 'Camions de chantier', 75000.00, 295.00, 280.00, '15 tonnes', '35 L/100km', 520.00, 100, 0.00, 100, 1),
('Camion benne 6x4 standard', 'FRETCO', 'FRET-B20', 'Transport', 'Camions de chantier', 95000.00, 385.00, 320.00, '20 tonnes', '38 L/100km', 650.00, 100, 0.00, 100, 3),
('Camion benne 8x4 lourd', 'FRETCO', 'FRET-B30', 'Transport', 'Camions de chantier', 125000.00, 520.00, 380.00, '30 tonnes', '42 L/100km', 820.00, 100, 0.00, 100, 5),
('Camion semi-remorque benne', 'FRETCO', 'FRET-SEMI40', 'Transport', 'Camions de chantier', 145000.00, 680.00, 420.00, '40 tonnes', '45 L/100km', 950.00, 100, 0.00, 100, 7),
('Camion toupie béton 6m³', 'BÉTONÉO', 'BET-MIX6', 'Transport', 'Camions de chantier', 185000.00, 750.00, 300.00, '6 m³ béton', '38 L/100km', 1050.00, 100, 0.00, 100, 4),
('Camion toupie béton 8m³', 'BÉTONÉO', 'BET-MIX8', 'Transport', 'Camions de chantier', 225000.00, 920.00, 340.00, '8 m³ béton', '42 L/100km', 1250.00, 100, 0.00, 100, 6),
('Camion toupie béton 10m³', 'BÉTONÉO', 'BET-MIX10', 'Transport', 'Camions de chantier', 275000.00, 1150.00, 380.00, '10 m³ béton', '46 L/100km', 1450.00, 100, 0.00, 100, 8),
('Camion pompe à béton 32m', 'BÉTONÉO', 'BET-PUMP32', 'Transport', 'Camions de chantier', 485000.00, 2150.00, 420.00, '32m portée', '50 L/100km', 2250.00, 100, 0.00, 100, 10);

-- TRANSPORT - Semi-remorques (7 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Semi-remorque plateau standard', 'TRANSAX', 'TRANS-PLAT13', 'Transport', 'Semi-remorques', 28000.00, 125.00, NULL, '13.6m - 25t', NULL, 320.00, 100, 0.00, 100, 1),
('Semi-remorque plateau extensible', 'TRANSAX', 'TRANS-PLATEXT', 'Transport', 'Semi-remorques', 45000.00, 195.00, NULL, '20m - 30t', NULL, 450.00, 100, 0.00, 100, 3),
('Semi-remorque porte-engins 2 essieux', 'TRANSAX', 'TRANS-PE2E', 'Transport', 'Semi-remorques', 38000.00, 165.00, NULL, '8.5m - 22t', NULL, 380.00, 100, 0.00, 100, 2),
('Semi-remorque porte-engins 3 essieux', 'TRANSAX', 'TRANS-PE3E', 'Transport', 'Semi-remorques', 52000.00, 225.00, NULL, '10m - 30t', NULL, 480.00, 100, 0.00, 100, 4),
('Semi-remorque surbaissée 2 lignes', 'TRANSAX', 'TRANS-SB2L', 'Transport', 'Semi-remorques', 68000.00, 320.00, NULL, '12m - 35t', NULL, 620.00, 100, 0.00, 100, 6),
('Semi-remorque surbaissée 3 lignes', 'TRANSAX', 'TRANS-SB3L', 'Transport', 'Semi-remorques', 85000.00, 420.00, NULL, '14m - 45t', NULL, 780.00, 100, 0.00, 100, 8),
('Semi-remorque porte-char 4 essieux', 'TRANSAX', 'TRANS-PC4E', 'Transport', 'Semi-remorques', 125000.00, 650.00, NULL, '16m - 60t', NULL, 1150.00, 100, 0.00, 100, 10);

-- TRANSPORT - Dumpers (7 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Mini-dumper 1 tonne', 'DUMPEO', 'DUMP-M1', 'Transport', 'Dumpers', 8500.00, 65.00, 7.50, '1 tonne', '3 L/h', 120.00, 100, 0.00, 100, 1),
('Dumper 3 tonnes', 'DUMPEO', 'DUMP-S3', 'Transport', 'Dumpers', 18000.00, 95.00, 18.00, '3 tonnes', '6 L/h', 180.00, 100, 0.00, 100, 1),
('Dumper articulé 6 tonnes', 'DUMPEO', 'DUMP-A6', 'Transport', 'Dumpers', 85000.00, 385.00, 95.00, '6 tonnes', '14 L/h', 520.00, 100, 0.00, 100, 3),
('Dumper articulé 10 tonnes', 'DUMPEO', 'DUMP-A10', 'Transport', 'Dumpers', 145000.00, 650.00, 155.00, '10 tonnes', '22 L/h', 850.00, 100, 0.00, 100, 5),
('Dumper articulé 15 tonnes', 'DUMPEO', 'DUMP-A15', 'Transport', 'Dumpers', 225000.00, 950.00, 220.00, '15 tonnes', '32 L/h', 1250.00, 100, 0.00, 100, 7),
('Dumper rigide 30 tonnes', 'DUMPEO', 'DUMP-R30', 'Transport', 'Dumpers', 385000.00, 1650.00, 380.00, '30 tonnes', '55 L/h', 1850.00, 100, 0.00, 100, 10),
('Dumper rigide 50 tonnes', 'DUMPEO', 'DUMP-R50', 'Transport', 'Dumpers', 685000.00, 2950.00, 560.00, '50 tonnes', '85 L/h', 2850.00, 100, 0.00, 100, 13);

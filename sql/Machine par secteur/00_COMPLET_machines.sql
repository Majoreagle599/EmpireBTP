-- ============================================================================
-- FICHIER SQL COMPLET - EMPIRE BTP
-- ============================================================================
-- Description : Script SQL complet pour créer et peupler la table des machines
-- Base de données : PostgreSQL 15
-- Nombre total de machines : 100 (Voirie: 25, Carrière: 25, Transport: 30, Démolition: 20)
-- Date de création : 26 octobre 2025
-- ============================================================================

-- ============================================================================
-- ÉTAPE 1 : CRÉATION DE LA TABLE MACHINE
-- ============================================================================

-- Suppression de la table si elle existe (ATTENTION : perte de données !)
DROP TABLE IF EXISTS machine CASCADE;

-- Création de la table machine
CREATE TABLE machine (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    marque VARCHAR(100) NOT NULL,
    modele VARCHAR(100) NOT NULL,
    secteur VARCHAR(50) NOT NULL,
    categorie VARCHAR(100) NOT NULL,
    prix_achat NUMERIC(12, 2) NOT NULL,
    prix_location NUMERIC(10, 2) NOT NULL,
    puissance NUMERIC(8, 2) DEFAULT NULL,
    capacite VARCHAR(100) DEFAULT NULL,
    consommation VARCHAR(100) DEFAULT NULL,
    cout_entretien NUMERIC(10, 2) NOT NULL,
    etat INTEGER DEFAULT 100,
    usure NUMERIC(5, 2) DEFAULT 0.00,
    productivite INTEGER DEFAULT 100,
    niveau_requis INTEGER DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index pour optimiser les recherches
CREATE INDEX idx_machine_secteur ON machine(secteur);
CREATE INDEX idx_machine_categorie ON machine(categorie);
CREATE INDEX idx_machine_marque ON machine(marque);

-- Commentaires sur la table
COMMENT ON TABLE machine IS 'Table des machines disponibles dans le jeu EmpireBTP';

-- ============================================================================
-- ÉTAPE 2 : INSERTION DES MACHINES - SECTEUR VOIRIE (25 machines)
-- ============================================================================

-- VOIRIE - Finisseuses (6 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Finisseuse asphalte compacte', 'Rouveо', 'R-FINISH 180', 'Voirie', 'Finisseuses', 85000.00, 320.00, 95.00, '1.8m', '12 L/h', 450.00, 100, 0.00, 100, 1),
('Finisseuse asphalte standard', 'Rouveо', 'R-FINISH 300', 'Voirie', 'Finisseuses', 125000.00, 480.00, 115.00, '3m', '15 L/h', 580.00, 100, 0.00, 100, 3),
('Finisseuse asphalte grande largeur', 'Rouveо', 'R-FINISH 450', 'Voirie', 'Finisseuses', 185000.00, 720.00, 130.00, '4.5m', '18 L/h', 750.00, 100, 0.00, 100, 5),
('Finisseuse asphalte haute performance', 'Rouveо', 'R-FINISH 600', 'Voirie', 'Finisseuses', 245000.00, 950.00, 150.00, '6m', '22 L/h', 920.00, 100, 0.00, 100, 7),
('Finisseuse asphalte très grande largeur', 'Rouveо', 'R-FINISH 750', 'Voirie', 'Finisseuses', 315000.00, 1250.00, 175.00, '7.5m', '26 L/h', 1150.00, 100, 0.00, 100, 10),
('Finisseuse asphalte premium', 'Rouveо', 'R-FINISH 900', 'Voirie', 'Finisseuses', 385000.00, 1580.00, 200.00, '9m', '30 L/h', 1380.00, 100, 0.00, 100, 12);

-- VOIRIE - Compacteurs (7 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Compacteur monocylindre léger', 'COMPAC France', 'COMPAC-L1000', 'Voirie', 'Compacteurs', 35000.00, 145.00, 45.00, '1 tonne', '8 L/h', 280.00, 100, 0.00, 100, 1),
('Compacteur monocylindre standard', 'COMPAC France', 'COMPAC-L2000', 'Voirie', 'Compacteurs', 52000.00, 210.00, 55.00, '2 tonnes', '10 L/h', 350.00, 100, 0.00, 100, 2),
('Compacteur monocylindre lourd', 'COMPAC France', 'COMPAC-L3500', 'Voirie', 'Compacteurs', 68000.00, 285.00, 65.00, '3.5 tonnes', '12 L/h', 420.00, 100, 0.00, 100, 4),
('Compacteur tandem léger', 'COMPAC France', 'COMPAC-T1500', 'Voirie', 'Compacteurs', 48000.00, 195.00, 50.00, '1.5 tonnes', '9 L/h', 320.00, 100, 0.00, 100, 2),
('Compacteur tandem standard', 'COMPAC France', 'COMPAC-T3000', 'Voirie', 'Compacteurs', 72000.00, 295.00, 70.00, '3 tonnes', '13 L/h', 450.00, 100, 0.00, 100, 4),
('Compacteur tandem lourd', 'COMPAC France', 'COMPAC-T5000', 'Voirie', 'Compacteurs', 95000.00, 395.00, 85.00, '5 tonnes', '16 L/h', 580.00, 100, 0.00, 100, 6),
('Compacteur à pneus', 'COMPAC France', 'COMPAC-P8000', 'Voirie', 'Compacteurs', 145000.00, 580.00, 110.00, '8 tonnes', '20 L/h', 720.00, 100, 0.00, 100, 8);

-- VOIRIE - Fraiseuses (6 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Fraiseuse à froid compacte', 'SURFACO', 'SURF-F350', 'Voirie', 'Fraiseuses', 125000.00, 520.00, 250.00, '35cm', '28 L/h', 850.00, 100, 0.00, 100, 3),
('Fraiseuse à froid standard', 'SURFACO', 'SURF-F500', 'Voirie', 'Fraiseuses', 185000.00, 750.00, 320.00, '50cm', '35 L/h', 1050.00, 100, 0.00, 100, 5),
('Fraiseuse à froid grande largeur', 'SURFACO', 'SURF-F1000', 'Voirie', 'Fraiseuses', 285000.00, 1150.00, 450.00, '1m', '45 L/h', 1350.00, 100, 0.00, 100, 7),
('Fraiseuse à froid très grande largeur', 'SURFACO', 'SURF-F2000', 'Voirie', 'Fraiseuses', 485000.00, 1950.00, 560.00, '2m', '58 L/h', 1850.00, 100, 0.00, 100, 10),
('Fraiseuse recycleur', 'SURFACO', 'SURF-R2200', 'Voirie', 'Fraiseuses', 725000.00, 2950.00, 450.00, '2.2m', '52 L/h', 2250.00, 100, 0.00, 100, 12),
('Stabilisatrice de sol', 'SURFACO', 'SURF-STAB2500', 'Voirie', 'Fraiseuses', 625000.00, 2580.00, 380.00, '2.5m', '48 L/h', 2050.00, 100, 0.00, 100, 11);

-- VOIRIE - Traceuses (6 machines)
INSERT INTO machine (nom, marque, modele, secteur, categorie, prix_achat, prix_location, puissance, capacite, consommation, cout_entretien, etat, usure, productivite, niveau_requis) VALUES
('Traceuse manuelle', 'TRACÉO', 'TRACE-M50', 'Voirie', 'Traceuses', 3500.00, 45.00, NULL, '50L peinture', NULL, 85.00, 100, 0.00, 100, 1),
('Traceuse autopropulsée', 'TRACÉO', 'TRACE-A100', 'Voirie', 'Traceuses', 12000.00, 125.00, 5.00, '100L peinture', '2 L/h', 150.00, 100, 0.00, 100, 1),
('Traceuse routière standard', 'TRACÉO', 'TRACE-R200', 'Voirie', 'Traceuses', 28000.00, 285.00, 25.00, '200L peinture', '5 L/h', 280.00, 100, 0.00, 100, 3),
('Traceuse routière multi-lignes', 'TRACÉO', 'TRACE-R350', 'Voirie', 'Traceuses', 45000.00, 420.00, 35.00, '350L peinture', '7 L/h', 380.00, 100, 0.00, 100, 5),
('Traceuse autoroute thermoplastique', 'TRACÉO', 'TRACE-T500', 'Voirie', 'Traceuses', 95000.00, 850.00, 65.00, '500L thermo', '12 L/h', 650.00, 100, 0.00, 100, 8),
('Traceuse autoroute haute performance', 'TRACÉO', 'TRACE-T800', 'Voirie', 'Traceuses', 145000.00, 1250.00, 85.00, '800L thermo', '16 L/h', 920.00, 100, 0.00, 100, 10);

-- ============================================================================
-- ÉTAPE 3 : INSERTION DES MACHINES - SECTEUR CARRIÈRE (25 machines)
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

-- ============================================================================
-- ÉTAPE 4 : INSERTION DES MACHINES - SECTEUR TRANSPORT (30 machines)
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

-- ============================================================================
-- ÉTAPE 5 : INSERTION DES MACHINES - SECTEUR DÉMOLITION (20 machines)
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

-- ============================================================================
-- VÉRIFICATION FINALE
-- ============================================================================

-- Vérifier le nombre total de machines insérées
SELECT COUNT(*) as total_machines FROM machine;

-- Vérifier la répartition par secteur
SELECT secteur, COUNT(*) as nombre FROM machine GROUP BY secteur ORDER BY secteur;

-- Vérifier la répartition par marque
SELECT marque, COUNT(*) as nombre FROM machine GROUP BY marque ORDER BY marque;

-- ============================================================================
-- FIN DU SCRIPT
-- ============================================================================

-- ============================================================================
-- PARTIE 2 : INSERTION DES MACHINES - SECTEUR VOIRIE (1/4)
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

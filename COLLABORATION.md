# Guide de Collaboration - EmpireBTP

## Workflow Git recommandé

### 1. Avant de commencer à travailler
```bash
git pull origin main
```

### 2. Créer une branche pour une fonctionnalité spécifique (optionnel)
```bash
git checkout -b feature/nom-de-la-fonctionnalite
```

### 3. Faire ses commits régulièrement
```bash
git add .
git commit -m "Description claire du changement"
```

### 4. Pousser sur main (ou merger sa branche feature)
```bash
# Si travail direct sur main :
git push origin main

# Si branche feature :
git checkout main
git merge feature/nom-de-la-fonctionnalite
git push origin main
git branch -d feature/nom-de-la-fonctionnalite
```

### 5. Coordination avec votre collaborateur
- Communiquer sur les modifications importantes
- Faire des pulls fréquents pour éviter les gros conflits
- Utiliser des messages de commit descriptifs

## Bonnes pratiques

- **Toujours** faire un `git pull` avant de commencer à travailler
- Utiliser des messages de commit clairs et descriptifs
- Tester son code avant de pousser
- Communiquer avec son collaborateur sur les modifications importantes
- En cas de doute, créer une branche temporaire

## Structure des branches
- `main` : branche principale unique pour tout le monde
- `feature/nom-fonctionnalite` : branches temporaires pour développer une nouvelle fonctionnalité
- `fix/nom-bug` : branches temporaires pour corriger un bug
- `hotfix/nom-correction` : branches temporaires pour des corrections urgentes

## Workflow simplifié avec une branche principale

### Organisation du travail
- **Tout le monde** travaille sur la branche `main`
- **Pull régulier** pour récupérer les modifications de l'autre
- **Commits fréquents** avec des messages clairs
- **Coordination** pour éviter les conflits

### Workflow quotidien
1. **Avant de commencer** : toujours faire un pull
   ```bash
   git pull origin main
   ```
2. **Travailler** sur vos modifications
3. **Committer** régulièrement
   ```bash
   git add .
   git commit -m "Description du changement"
   ```
4. **Pousser** vos modifications
   ```bash
   git push origin main
   ```

### En cas de conflit
Si votre push est rejeté :
```bash
git pull origin main
# Résoudre les conflits si nécessaire
git add .
git commit -m "Résolution des conflits"
git push origin main
```

## Messages de commit recommandés
- `feat: ajouter authentification utilisateur`
- `fix: corriger erreur validation formulaire`
- `style: améliorer CSS page d'accueil`
- `refactor: restructurer entité User`
- `docs: mettre à jour README`
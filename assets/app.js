import './bootstrap.js';

// Import Bootstrap CSS
import 'bootstrap/dist/css/bootstrap.min.css';

// Import Bootstrap JavaScript
import 'bootstrap';

// Import Popper.js (required by Bootstrap)
import '@popperjs/core';

/*
 * Welcome to your app's main JavaScript file!
 *
 * This file will be included onto the page via the importmap() Twig function,
 * which should already be in your base.html.twig.
 */
import './styles/app.css';
import './styles/turbo-progress.css'; // Style pour la barre Turbo

console.log('This log comes from assets/app.js - welcome to AssetMapper! 🎉');

// Optimisation Turbo: événements de chargement
document.addEventListener('turbo:load', function() {
    console.log('⚡ Page chargée via Turbo');
    initializeToggleButtons();
    initializeBackToTop();
});

document.addEventListener('turbo:before-cache', function() {
    // Nettoyer les éléments avant mise en cache
    document.querySelectorAll('.alert-dismissible').forEach(el => el.remove());
});

// Gestion des boutons "Voir plus/moins" pour les updates et roadmap
function initializeToggleButtons() {
    // Bouton updates
    const btnUpdates = document.querySelector('.btn-toggle-updates');
    if (btnUpdates) {
        const targetUpdates = document.querySelector('#oldUpdates');
        if (targetUpdates) {
            targetUpdates.addEventListener('show.bs.collapse', function() {
                btnUpdates.querySelector('.toggle-text-more').classList.add('d-none');
                btnUpdates.querySelector('.toggle-text-less').classList.remove('d-none');
            });
            targetUpdates.addEventListener('hide.bs.collapse', function() {
                btnUpdates.querySelector('.toggle-text-more').classList.remove('d-none');
                btnUpdates.querySelector('.toggle-text-less').classList.add('d-none');
            });
        }
    }

    // Bouton roadmap
    const btnRoadmap = document.querySelector('.btn-toggle-roadmap');
    if (btnRoadmap) {
        const targetRoadmap = document.querySelector('#futureRoadmap');
        if (targetRoadmap) {
            targetRoadmap.addEventListener('show.bs.collapse', function() {
                btnRoadmap.querySelector('.toggle-text-more').classList.add('d-none');
                btnRoadmap.querySelector('.toggle-text-less').classList.remove('d-none');
            });
            targetRoadmap.addEventListener('hide.bs.collapse', function() {
                btnRoadmap.querySelector('.toggle-text-more').classList.remove('d-none');
                btnRoadmap.querySelector('.toggle-text-less').classList.add('d-none');
            });
        }
    }
}

// Fonction pour soumettre une suggestion
function submitSuggestion() {
    const title = document.getElementById('suggestTitle').value;
    const category = document.getElementById('suggestCategory').value;
    const description = document.getElementById('suggestDescription').value;
    const email = document.getElementById('suggestEmail').value;

    if (!title || !category || !description) {
        alert('⚠️ Veuillez remplir tous les champs obligatoires');
        return;
    }

    // Pour l'instant, on simule l'envoi (vous pouvez ajouter un vrai backend plus tard)
    console.log('Suggestion envoyée:', { title, category, description, email });

    // Fermer le modal
    const modal = bootstrap.Modal.getInstance(document.getElementById('suggestModal'));
    modal.hide();

    // Créer une alerte de succès
    const alertDiv = document.createElement('div');
    alertDiv.className = 'alert alert-success alert-dismissible fade show container mt-3';
    alertDiv.setAttribute('role', 'alert');
    alertDiv.innerHTML = `
        ✅ Merci pour votre suggestion ! Nous l'étudierons attentivement.
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;
    
    const mainContent = document.querySelector('main');
    const firstChild = mainContent.querySelector('#main-content') || mainContent.firstElementChild;
    if (firstChild) {
        mainContent.insertBefore(alertDiv, firstChild);
    } else {
        mainContent.appendChild(alertDiv);
    }

    // Réinitialiser le formulaire
    document.getElementById('suggestForm').reset();

    // Supprimer l'alerte après 5 secondes
    setTimeout(() => {
        alertDiv.remove();
    }, 5000);
}

// Rendre la fonction accessible globalement
window.submitSuggestion = submitSuggestion;

// Initialisation du bouton retour en haut
function initializeBackToTop() {
    const backToTopBtn = document.getElementById('backToTop');
    
    if (backToTopBtn && !backToTopBtn.dataset.initialized) {
        backToTopBtn.dataset.initialized = 'true';
        
        // Afficher/masquer le bouton selon le scroll
        window.addEventListener('scroll', function() {
            if (window.scrollY > 300) {
                backToTopBtn.classList.add('show');
            } else {
                backToTopBtn.classList.remove('show');
            }
        });
        
        // Retour en haut au clic
        backToTopBtn.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
}

// Initialisation au premier chargement (sans Turbo)
document.addEventListener('DOMContentLoaded', function() {
    initializeBackToTop();
});

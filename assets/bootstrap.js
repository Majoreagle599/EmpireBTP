import { startStimulusApp } from '@symfony/stimulus-bridge';
import * as Turbo from '@hotwired/turbo';

// Configuration Turbo optimisée pour performance (nouvelle API)
Turbo.config.drive.progressBarDelay = 100; // Affiche la barre après 100ms seulement
Turbo.config.forms.confirm = (message) => window.confirm(message);

// Désactiver Turbo pour les formulaires lourds
document.addEventListener('turbo:before-fetch-request', (event) => {
    const element = event.target;
    if (element.hasAttribute('data-turbo-disable')) {
        event.preventDefault();
    }
});

const app = startStimulusApp();
// register any custom, 3rd party controllers here
// app.register('some_controller_name', SomeImportedController);

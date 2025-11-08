% Réalisé par : JDIRA siham & ABOUTABIT Basma 

function varargout = memoire(varargin)
% MEMOIRE - Jeu de mémoire avec interface graphique (GUIDE)
% Le jeu de mémoire classique consiste à retourner deux cartes à la fois parmi un ensemble de cartes face cachée
% pour retrouver des paires identiques.
% Lorsqu’une paire est trouvée, les cartes restent visibles, sinon elles sont retournées face cachée à nouveau. 
% L’objectif est de retrouver toutes les paires le plus rapidement possible.
% Un chronomètre intégré mesure le temps total mis pour terminer le jeu.
% Dans notre cas, nous allons jouer avec 16 cartes, composées des nombres de 1 à 8
% Ce programme lance un petit jeu de mémoire où l'utilisateur doit retrouver
% les paires de cartes identiques en cliquant sur des boutons.

% Initialisation des paramètres de l'interface
etat_GUI = struct('gui_Name', mfilename, ...
                  'gui_Singleton', 1, ...
                  'gui_OpeningFcn', @memoire_Ouverture, ...
                  'gui_OutputFcn', @memoire_Sortie, ...
                  'gui_LayoutFcn', [], ...
                  'gui_Callback', []);

% Si une fonction callback est appelée directement
if nargin && ischar(varargin{1})
    etat_GUI.gui_Callback = str2func(varargin{1});
end

% Lancer l'interface graphique
if nargout
    [varargout{1:nargout}] = gui_mainfcn(etat_GUI, varargin{:});
else
    gui_mainfcn(etat_GUI, varargin{:});
end
end

% Fonction appelée au lancement du jeu
function memoire_Ouverture(hObject, eventdata, handles, varargin)
% Cette fonction initialise les variables et prépare le jeu

handles.output = hObject; % Enregistrer le handle principal

% Créer un tableau de 16 cartes, 8 nombres doublés
cartes_temp = [1:8 1:8];

% Mélanger les cartes de manière aléatoire
melange = zeros(1, 16);      % Tableau vide pour cartes mélangées
indices_pris = zeros(1, 16); % Pour vérifier quelles cartes ont été prises

for i = 1:16
    idx = randi([1, 16]);         % Choisir un indice aléatoire
    while indices_pris(idx) == 1  % Si indice déjà utilisé, en choisir un autre
        idx = randi([1, 16]);
    end
    melange(i) = cartes_temp(idx); % Placer la carte mélangée
    indices_pris(idx) = 1;          % Marquer l'indice comme pris
end

handles.cartes = melange;       % Stocker l'ordre des cartes mélangées
handles.revelees = zeros(1, 16); % Toutes les cartes sont cachées au départ
handles.clics = [];              % Pas encore de cartes cliquées

guidata(hObject, handles);       % Sauvegarder les données dans l'interface
maj_boutons(handles);            % Mettre à jour l'affichage des boutons

tic; % Démarrer un chronomètre pour mesurer le temps de jeu
end

% Fonction appelée à la fermeture ou sortie
function varargout = memoire_Sortie(hObject, eventdata, handles)
varargout{1} = handles.output; % Retourner la sortie de la GUI
end

% Met à jour l'affichage des boutons en fonction des cartes révélées
function maj_boutons(handles)
for i = 1:16
    bouton = handles.(['pushbutton' num2str(i)]); % Sélectionner le bouton i
    if handles.revelees(i) % Si la carte est révélée
        set(bouton, 'String', num2str(handles.cartes(i))); % Afficher son numéro
    else
        set(bouton, 'String', ''); % Sinon, cacher le contenu (bouton vide)
    end
end
end

% Fonction appelée quand une carte est cliquée
function clic_carte(hObject, eventdata, handles, indice)
% Empêcher d'ouvrir une carte déjà visible
if handles.revelees(indice)
    return; % Ignorer le clic si carte déjà visible
end

% Révéler la carte cliquée et enregistrer son indice
handles.revelees(indice) = 1;
handles.clics = [handles.clics indice];
maj_boutons(handles);        % Actualiser l'affichage pour montrer la carte
guidata(hObject, handles);   % Sauvegarder les données mises à jour

% Quand deux cartes sont retournées
if numel(handles.clics) == 2
    pause(0.5); % Pause courte pour que l'utilisateur voie les deux cartes

    % Si les cartes ne sont pas identiques
    if handles.cartes(handles.clics(1)) ~= handles.cartes(handles.clics(2))
        % Les cacher à nouveau
        handles.revelees(handles.clics) = 0;
    end

    % Réinitialiser la liste des clics pour le prochain tour
    handles.clics = [];
    guidata(hObject, handles); % Sauvegarder les changements
    maj_boutons(handles);      % Mettre à jour l'affichage
end

% Vérifier si toutes les cartes sont révélées (fin du jeu)
if all(handles.revelees)
    temps_total = toc; % Récupérer le temps écoulé
    msgbox(sprintf('Félicitations ! Vous avez terminé en %.2f secondes.', temps_total), ...
           'Terminé', 'modal'); % Afficher un message de victoire
end

end

% Fonctions pour chaque bouton (16 boutons, un pour chaque carte)
function pushbutton1_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 1)
end
function pushbutton2_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 2)
end
function pushbutton3_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 3)
end
function pushbutton4_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 4)
end
function pushbutton5_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 5)
end
function pushbutton6_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 6)
end
function pushbutton7_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 7)
end
function pushbutton8_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 8)
end
function pushbutton9_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 9)
end
function pushbutton10_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 10)
end
function pushbutton11_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 11)
end
function pushbutton12_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 12)
end
function pushbutton13_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 13)
end
function pushbutton14_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 14)
end
function pushbutton15_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 15)
end
function pushbutton16_Callback(hObject, eventdata, handles)
clic_carte(hObject, eventdata, handles, 16)
end
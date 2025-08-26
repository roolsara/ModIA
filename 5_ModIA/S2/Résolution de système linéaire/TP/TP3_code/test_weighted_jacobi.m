close all;
clear all;

% Paramètres de base
N = 64;
h = 1/N;
A = getMatrixA(N);
rhsf = zeros(N-1,1);
j = 1:N-1;
k = 48; % Choisir le k-ième vecteur propre

% Calcul des vecteurs propres
%[V, ~] = eigs(A);
%um = V(:,k);
um = sin(j/N*k*pi);

% Listes des valeurs de omega et m à tester
omega_list = [0.1, 2/3, 1];  % À compléter selon besoin
m_list = [10, 50, 100];          % À compléter selon besoin

% Taille du subplot
num_rows = length(m_list); % m en lignes
num_cols = length(omega_list); % omega en colonnes

% Création des subplots
figure;
x = h:h:1-h; % Discrétisation de l'espace

for i = 1:num_rows
    for j = 1:num_cols
        m = m_list(i);
        omega = omega_list(j);
        
        % Appliquer la méthode de Jacobi pondérée
        ump1 = weighted_jacobi(A, um', rhsf, omega, m);
        
        % Création du subplot
        subplot(num_rows, num_cols, (i-1)*num_cols + j);
        plot(x, um, 'b', x, ump1, 'r');
        legend('um', 'ump1');
        title(sprintf('w = %.2f, m = %d', omega, m));
        xlabel('x');
        ylabel('Solution');
    end
end

sgtitle('Damping effect of weighted Jacobi method'); % Titre global

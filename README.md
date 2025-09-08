# ModIA
This repository gathers my courses, practical assignments, and projects from the ModIA double degree program between INSA and ENSEEIHT, completed during my 4th and 5th year of studies. It contains what I managed to save along the way.
The main topics covered include:
- Applied mathematics and computational sciences: statistics, optimization, finite element modeling, scientific computing.
- Artificial intelligence and machine learning: supervised and unsupervised learning, deep learning, neural networks, generative models, physics-informed neural networks (PINNs).
- Industrial applications and explainability: data assimilation, metamodeling, trustworthy AI, high-dimensional data analysis.

Enjoy!

# Few projects
## Weibull process & reliability
This project explores the Weibull distribution and its use in reliability analysis. We studied the theoretical properties of the Weibull process, demonstrated existing formulas for parameter estimation and confidence intervals, and applied the model to Boeing aircraft data on air conditioning system failures. The analysis highlights different system lifecycle phases (burn-in, operational, and wear-out) and evaluates the impact of repairs on reliability.

→ 5_ModIA/S1/Projet_WeibullPPi-Bekkare-Besbes-Rool

## Movie genre prediction & recommendation with explainable AI (Dockerized)
This project provides a web-based system for movie genre prediction and recommendation, combining deep learning, natural language processing, and explainable AI. The project includes several features: it can predict a movie’s genre (e.g., comedy, horror, action) directly from its poster, and it provides movie recommendations either based on poster similarity or on plot descriptions, where users can query by movie title. The project integrates explainable AI methods such as LIME, Occlusion, and Integrated Gradients, allowing users to understand how predictions are made. For plot-based recommendations, the user can choose between multiple embedding techniques such as GloVe, DistilBERT, Bag-of-Words, or TF-IDF. The features are all exposed through a Flash API and an interactive Gradio interface. To keep the repository lightweight, model weights and embeddings are stored on Google Drive and automatically downloaded at runtime. The application is containerized with Docker ensuring an easy deployment.

→ 5_ModIA/S2/AI_Frameworks_Project

## Spoken language classification with deep learning
This project focuses on spoken language classification using deep learning. We built a custom dataset from YouTube extracts and recordings, transformed audio into spectrograms, and trained models such as LeNet, ResNet18, VGG16, and ViT. Despite limited data, we reached ~24% accuracy and confirmed the difficulty of distinguishing closely related languages (e.g., French vs. Quebecois).

→ 5_ModIA/S1/HDDL/Projet_classification_audio

## Molecular energy prediction 
This project focuses on predicting the atomization energy of small organic molecules using machine learning while ensuring compliance with physical constraints such as translation, rotation, and permutation invariance. The dataset is a subset of QM7-X, containing molecular structures with atomic positions, charges, and corresponding energies. After preprocessing the data into structured representations, we explored different molecular descriptors, including Coulomb matrices, solid harmonic scattering transforms, and geometric features, to capture both structural and physicochemical information. Several machine learning models, such as linear regression, random forests, and neural networks, were trained and evaluated using the Root Mean Square Error (RMSE) metric to assess prediction accuracy.

→ 5_ModIA/S2/Apprentissage sous contrainte physique/Projet_molecule_kaggle

## Audio command recognition for drones
This project targets recognition of drone voice commands from audio recordings. Data is preprocessed and dimensionality is reduced using FFT + PCA or STFT. Various classification methods are explored, including multiclass regression, kernel-based SVMs, ensemble methods (bagging, random forest, AdaBoost, gradient boosting), and neural networks (single-layer perceptron, MLP, CNN) implemented in PyTorch. Each model is evaluated to understand its behavior and performance relative to the data, enabling selection of the most effective approach.

→ 4_ModIA/Machine learning/Projet_fil_rouge_Besbes_Rool

## Honorable mentions
- **Image classification and bias in deep learning:** This project applies deep learning (AlexNet and ResNet34) to classify images from the ImageNet dataset and then studies how introducing artificial bias into training data can significantly affect model performance, using the DI metric to quantify bias.

→ 4_ModIA/Machine learning/Projet_kaggle

- **LDA classification of interstellar medium simulations:** The aim of this lab was to classify simulations of the interstellar medium using Linear Discriminant Analysis. Various statistical estimators were employed, including the empirical mean, the empirical autocovariance matrix, and the power spectrum. The performance of each method was evaluated and compared.

→ 5_ModIA/S2/Apprentissage sous contrainte physique/LDA_Fourier/Projet

- **Overall design of an aircraft:** This project applied surrogate modeling and robust optimization to efficiently design aircraft that minimize maximum takeoff weight under uncertainty while maintaining reliability and performance.

→ 5_ModIA/S2/Metamodelisation_2
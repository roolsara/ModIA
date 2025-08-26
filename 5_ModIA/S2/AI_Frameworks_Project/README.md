# AI_Frameworks_Project

## Lien vers les poids du réseau

https://drive.google.com/file/d/1Pe46Rd62Alfu_m6rtOcX5ERN5ymBh6CI/view?usp=sharing

## Annoy index, image & vector

poster database with the embeddings: https://drive.google.com/file/d/1Pu9kshWJkGxUGZsILWubM1kxBQGoeDnz/view?usp=sharing
text description embeddings: https://drive.google.com/file/d/11yb7n-0AWo64EMbRsgb7O9rlus_r3NYl/view?usp=drive_link
annoy index for distilbert embeddings: https://drive.google.com/file/d/1xpiB3dcP9G7W2SR5PEGhpVFnKu2ksQwU/view?usp=drive_link
annoy index for glove embeddings: https://drive.google.com/file/d/1w_A6FUIXdeGaotPEL6_hfAqNui0XsT8D/view?usp=drive_link
annoy index for BoW embeddings: https://drive.google.com/file/d/1v3_vab2ndgZo7aVnyFTMU5GX-sQNGPFA/view?usp=drive_link
annoy index for tfidf embeddings: https://drive.google.com/file/d/1h7q7bgg38BKQ9GyBCiptrmU7JQElTNkI/view?usp=drive_link

## Commandes pour utiliser docker

**afficher les images**  
sudo docker ps

**pour aller dans l'image**  
sudo docker exec -it docker_id /bin/sh  

**pour effacer tous les dockers et le cache**  
sudo docker system prune -a  

**pour lancer les images**  
sudo docker compose up  

**pour arrêter les images**  
sudo docker compose down  

**pour build le docker à partir d'un seul dockerfile**  
sudo docker build -t api_image -f Dockerfile-api . 

Pour faire un merge : 

1. Se placer sur la branche main : git checkout main
2. Màj main : git pull origin main
3. Fusionner branch dans main : git merge branch
4. Gestion des conflits, si conflit : Commit : git add . puis git commit -m "message"
6. Pousser les modifs sur le dépôt existant : git push origin main



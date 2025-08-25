# edition_attribut_GAN
Code permettant de modifier des attributs d'une image à l'aide d'un styleGAN

## Pré requis

Python 3.6

Il faut les packages python suivants :
os,re,typing,tqdm,click,pandas,numpy,PIL.Image,torch,matplotlib.pyplot

Le code est compatibles avec les versions :
  Pytorch : 2.3.0
  Cuda : 12.1

Il faut également cloner dans ce dossier le dépôt suivant : https://github.com/NVlabs/stylegan3 

## Base de données

Pour nos entrainements, nous avons utiliser une base de données pré-existante, que vous pouvez télécharger à l'adresse :
https://drive.google.com/drive/folders/1aXVc-q2ER7A9aACSwml5Wyw5ZgrgPq52

Placez ensuite les deux fichiers .npy dans le dossier data/train/.

## Modèles pré-entrainés

Vous pouvez trouver un classifier pré-entrainé et plusieurs transformeurs (pour différents attributs) à l'adresse :
https://drive.google.com/drive/folders/1uU-E2kNO6Gx1211kkhAlghszNOB1JhKe

Pour utiliser ces modèles, téléchargez les puis mettez les dans le dossier pretrained_models. Rendez-vous ensuite à la fin du fichier Projet_VF.ipynb pour les utiliser.

## Sources et remerciements
Nous remercions les créateurs des gits et articles suivants, qui ont été utile à notre travail :

#### Github :
https://github.com/NVlabs/stylegan3 
https://github.com/InterDigitalInc/latent-transformer 
https://github.com/eladrich/pixel2style2pixel 
https://github.com/csxmli2016/w-plus-adapter 

#### Articles :
- Yao, X., Newson, A., Gousseau, Y., & Hellier, P.. A Latent Transformer for Disentangled Face Editing in Images and Videos. LTCI, Télécom Paris, Institut Polytechnique de Paris, France & InterDigital R&I, 975 avenue des Champs Blancs, Cesson-Sévigné, France
- Abdal, R., Qin, Y., & Wonka, P.. Image2StyleGAN: How to Embed Images Into the StyleGAN Latent Space? KAUST.
- Shen, Y., Gu, J., Tang, X., & Zhou, B.. Interpreting the Latent Space of GANs for Semantic Face Editing. The Chinese University of Hong Kong & The Chinese University of Hong Kong, Shenzhen.

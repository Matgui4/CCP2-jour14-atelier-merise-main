# Merise

La méthode Merise permet de modéliser et concevoir des systèmes d'informations comme ... des bases de données.

L'objectif de cet atelier est donc de réviser cette méthode __made in France__ qui va vous permettre de passer d'un simple dictionnaire de données à une base de données SQL.

## Avant tout, un petit rappel sur les cardinalités

![Exemple de MCD](./docs/MCD.svg)

Sur ce MCD, voici comment nous allons lire les cardinalités :

- Une entité Post peut être associée à 0,N entité(s) Comment (Donc entre 0 et une infinité).
- Une entité Comment doit être associée à 1,1 entité Post (Donc forcément une et une seule).

Ce type d'association/relation se nomme **"One To Many"** ! J'ai d'un côté une entité qui ne pourra être associée qu'à une seule autre entité et de l'autre une entité qui pourra être associéé à une multitude d'autres entités.

Ce type d'association est "facile" à gérer puisque vous avez simplement à **rajouter une clé étrangère sur votre MLD du côté de l'entité faible** (celle du côté du x,**1**).

D'autres types de relations son plus complexes à gérer comme le **"Many To Many"** qui nécessite l'utilisation d'une **table intermédiaire (appelée aussi table pivot)** qui fera le lien entre les clés primaires d'une table et celles d'une autre.

Si votre MCD est structuré comme attendu, votre MLD pourrait bien vous indiquer ce genre de table à créer !

## Règles pour vos MLD, MPD et votre future BDD

Les clés primaires doivent forcément s'appeler `id`.

Les clés étrangères doivent respecter la convention de nommage `{nom_table_singulier}_id`. Si ma clé étrangère fait référence à une entrée dans la table `orders`, j'aurai donc `order_id`.

## C'est parti !

Tout commence par un dictionnaire de données orienté métier (accessible à tous et pas orienté technique).

Vous allez avoir à disposition toutes les informations nécessaires dans ce dictionnaire afin d'établir :

- le MCD
- le MLD
- le MPD
- le dictionnaire de données orienté technique

Le but ici est de modéliser une base de données qui pourra servir sur un site e-commerce composé des entités suivantes :

**User**

Un utilisateur peut passer des commandes (Order).

| Nom        | Type                 | Taille | Description                                   |
|------------|----------------------|--------|-----------------------------------------------|
| num_user   | entier non signé     |        | Numéro permettant d'identifier un utilisateur |
| name       | chaîne de caractères | 100    | Nom complet de l'utilisateur                  |
| password   | chaîne de caractères | 255    | Mot de passe de l'utilisateur                  |
| created_at | date                 |        | Date de création             |
| updated_at | date                 |        | Date de mise à jour          |

**Product**

Un produit peut faire partie de zéro à une infinité de commandes et tout ça **en quantité variable**.

| Nom         | Type                 | Taille | Description                               |
|-------------|----------------------|--------|-------------------------------------------|
| num_product | entier non signé     |        | Numéro permettant d'identifier un produit |
| name        | chaîne de caractères | 100    | Nom du produit                            |
| quantity        | entier non signé | 100    | Stock actuel pour le produit                            |
| status        | entier non signé | 100    | Statut du produit (0 = archivé/hors-ligne, 1 = en ligne). Un produit ne doit pas pouvoir être supprimé dès lors qu'il fait partie d'une commande. Si on souhaite le retirer de la vente, on l'archivera.                            |
| created_at  | date                 |        | Date de création                          |
| updated_at  | date                 |        | Date de mise à jour                       |

**Category**

Une catégorie peut être associée à une quantité infinie de produit. Les produits sont libres de ne pas être liés à une catégorie.

| Nom        | Type                 | Taille | Description                                  |
|------------|----------------------|--------|----------------------------------------------|
| num_category   | entier non signé     |        | Numéro permettant d'identifier une catégorie |
| name       | chaîne de caractères | 100    | Nom de la catégorie                          |
| created_at | date                 |        | Date de création                             |
| updated_at | date                 |        | Date de mise à jour                          |

**Tag**

Les étiquettes permettent de filtrer avec précision un produit.

Par exemple, si un produit se trouve dans la catégorie "Livre", on pourrait lui accoler les étiquettes "Magie" et "Sorcier" histoire de pouvoir filtrer les lectures de grande qualité ! ⚡

| Nom        | Type                 | Taille | Description                                |
|------------|----------------------|--------|--------------------------------------------|
| num_tag    | entier non signé     |        | Numéro permettant d'identifier l'étiquette |
| name       | chaîne de caractères | 100    | Nom de l'étiquette                         |
| created_at | date                 |        | Date de création                           |
| updated_at | date                 |        | Date de mise à jour                        |

**Order**

Les commandes seront composées de potentiellement plusieurs produits **en quantités variables**.

Pour la relation/association qu'il y aura entre les entités Product et Order, vous pourriez avoir besoin d'une relation porteuse (relation contenant des propriétés/attributs comme une entité) qui pourra s'écrire sous cette forme sur [mocodo.net](https://mocodo.net/) :

```mocodo
Nom_relation, XX Entité1, XX Entité2: propriété1, propriété2
⬆️ Identique relation/association classique excepté qu'on rajoute ":" à la fin pour lister des propriétés
```

| Nom        | Type             | Taille | Description                                 |
|------------|------------------|--------|---------------------------------------------|
| num_order  | entier non signé |        | Numéro permettant d'identifier une commande |
| num_invoice  | chaîne de caractères |  100  | Numéro de facture (une fois la commande validée) |
| status  | chaîne de caractères |        | Etat de la commande ('En panier', 'En cours de traitement' (une fois validé par l'utilisateur), 'Validé', 'En cours de livraison' et 'Livré') |
| created_at | date             |        | Date de création                            |
| updated_at | date             |        | Date de mise à jour                         |

## Dictionnaire de données en amont de la modélisation

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


## Evolution du dictionnaire de données après le MPD

Users :

|Nom|Type|Taille|Description|
|-|-|-|-|
|id|BIGINT UNSIGNED|-|id de l'article|
|name|VARCHAR|100|Nom de l'utilisateur|
|password|VARCHAR|255|Mot de passe|
|created_at|TIMESTAMP|-|Date de création|
|updated_at|TIMESTAMP|-|Date de mise à jour|

Product :

|Nom|Type|Longueur|Description|
|-|-|-|-|
|id|BIGINT UNSIGNED|-|id du produit|
|name|VARCHAR|100|Nom du produit|
|quantity|VARCHAR|100|Quantité|
|status|VARCHAR|100|Statut du produit (0 = archivé/hors-ligne, 1 = en ligne). Un produit ne doit pas pouvoir être supprimé dès lors qu'il fait partie d'une commande. Si on souhaite le retirer de la vente, on l'archivera.  |
|created_at|TIMESTAMP|-|Date de création|
|updated_at|TIMESTAMP|-|Date de mise à jour|
|num_order|FOREIGN KEY|BIGINT UNSIGNED|-|id prenant comme reference users id|

Tags :

|Nom|Type|Taille|Description|
|-|-|-|-|
|id|BIGINT UNSIGNED|-|id de l'article|
|name|VARCHAR|100|Numéro permettant d'identifier l'étiquette|
|password|VARCHAR|255|Mot de passe|
|created_at|TIMESTAMP|-|Date de création|
|updated_at|TIMESTAMP|-|Date de mise à jour|

Orders :

|Nom|Type|Taille|Description|
|-|-|-|-|
|id|BIGINT UNSIGNED|-|id de l'article|
|name|VARCHAR|100|Nom de l'utilisateur|
|XX_Entite_1_propriete1|INT|100|Entité 1|
|XX_Entite_2_propriete1|INT|100|Entité 2|
|num_invoice|VARCHAR|100|Numéro de facture (une fois la commande validée)|
|status|TEXT||Etat de la commande ('En panier', 'En cours de traitement' (une fois validé par l'utilisateur), 'Validé', 'En cours de livraison' et 'Livré')|
|created_at|TIMESTAMP|-|Date de création|
|updated_at|TIMESTAMP|-|Date de mise à jour|

Categories :

|Nom|Type|Taille|Description|
|-|-|-|-|
|id|BIGINT UNSIGNED|-|id de l'article|
|name|VARCHAR|100|Nom de l'utilisateur|
|created_at|TIMESTAMP|-|Date de création|
|updated_at|TIMESTAMP|-|Date de mise à jour|

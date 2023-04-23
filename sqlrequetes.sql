1
SELECT nom_lieu FROM lieu
WHERE nom_lieu LIKE "%um"
2
SELECT DISTINCT COUNT(personnage.nom_personnage), personnage.id_lieu, lieu.nom_lieu FROM personnage
INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu
GROUP BY id_lieu
ORDER BY COUNT(nom_personnage) DESC


3
SELECT DISTINCT personnage.nom_personnage, personnage.id_lieu, personnage.id_specialite, personnage.adresse_personnage, lieu.nom_lieu, specialite.nom_specialite FROM personnage
INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu
INNER JOIN specialite ON personnage.id_specialite = specialite.id_specialite
ORDER BY nom_lieu


SELECT DISTINCT personnage.nom_personnage, personnage.id_lieu, personnage.id_specialite, personnage.adresse_personnage, lieu.nom_lieu, specialite.nom_specialite FROM personnage
INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu
INNER JOIN specialite ON personnage.id_specialite = specialite.id_specialite
ORDER BY nom_personnage

4
SELECT DISTINCT specialite.nom_specialite, COUNT(personnage.nom_personnage) FROM specialite
INNER JOIN personnage ON specialite.id_specialite = personnage.id_lieu
GROUP BY specialite.id_specialite
ORDER BY  COUNT(personnage.nom_personnage) DESC

5
SELECT bataille.id_bataille, bataille.nom_bataille, bataille.date_bataille, DATE_FORMAT(bataille.date_bataille, "%d/%m/-%y") AS "DateDeBataille", lieu.nom_lieu FROM bataille
INNER JOIN lieu ON bataille.id_bataille = lieu.id_lieu
ORDER BY YEAR(bataille.date_bataille) ASC, MONTH(bataille.date_bataille) DESC, DAY(bataille.date_bataille) DESC

6
SELECT potion.nom_potion, SUM(ingredient.cout_ingredient * composer.qte) AS "Total" FROM potion
INNER JOIN composer ON potion.id_potion = composer.id_potion
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient
GROUP BY composer.id_potion 

7
SELECT potion.nom_potion, ingredient.nom_ingredient, ingredient.cout_ingredient, composer.qte FROM ingredient  
INNER JOIN composer ON ingredient.id_ingredient = composer.id_ingredient
INNER JOIN potion ON composer.id_potion = potion.id_potion
WHERE potion.nom_potion = "Santé"

8
SELECT MAX(prendre_casque.qte), personnage.nom_personnage FROM bataille
INNER JOIN prendre_casque ON bataille.id_bataille = prendre_casque.id_bataille
INNER JOIN personnage ON prendre_casque.id_personnage = personnage.id_personnage
WHERE bataille.nom_bataille = "Bataille du village gaulois"
GROUP BY personnage.id_personnage

9
SELECT MAX(boire.dose_boire), personnage.nom_personnage FROM personnage
INNER JOIN boire ON personnage.id_personnage = boire.id_personnage
GROUP BY personnage.id_personnage
ORDER BY MAX(boire.dose_boire) DESC

10
SELECT bataille.nom_bataille, MAX(prendre_casque.qte) FROM prendre_casque
INNER JOIN bataille ON prendre_casque.id_bataille = bataille.id_bataille
GROUP BY bataille.id_bataille
LIMIT 1 
11
SELECT  type_casque.id_type_casque , SUM(casque.cout_casque) AS "Somme casques", type_casque.nom_type_casque FROM casque
INNER JOIN type_casque ON casque.id_type_casque = type_casque.id_type_casque
GROUP BY type_casque.id_type_casque
ORDER BY SUM(casque.cout_casque) DESC

12
SELECT potion.nom_potion FROM potion 
INNER JOIN composer ON potion.id_potion = composer.id_potion
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom_ingredient = "Poisson frais"

13
SELECT DISTINCT lieu.nom_lieu, COUNT(personnage.id_lieu) AS "Count" FROM lieu
INNER JOIN personnage ON lieu.id_lieu = personnage.id_lieu
GROUP BY personnage.id_lieu
ORDER BY COUNT(personnage.id_lieu) DESC
LIMIT 1, 2


SELECT * FROM (SELECT lieu.nom_lieu, COUNT(personnage.id_lieu) AS "num"   FROM lieu
INNER JOIN personnage ON lieu.id_lieu = personnage.id_lieu
GROUP BY personnage.id_lieu
ORDER BY COUNT(personnage.id_lieu) DESC) AS s

14
SELECT personnage.nom_personnage, boire.dose_boire  FROM personnage 
LEFT JOIN boire ON personnage.id_personnage = boire.id_personnage
WHERE boire.id_personnage IS NULL

15
SELECT personnage.nom_personnage FROM personnage 
INNER JOIN autoriser_boire ON personnage.id_personnage = autoriser_boire.id_personnage
WHERE autoriser_boire.id_potion != 1

__________________________________



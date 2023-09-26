SELECT count(*) AS "Total des ventes d'appartements S1 2020" FROM vente
INNER JOIN bien ON vente.Id_bien = bien.Id_bien
WHERE Type_local = "appartement";

SELECT Nom_region, count(*) AS "Total des ventes" FROM vente
INNER JOIN bien on vente.id_bien = bien.Id_bien
INNER JOIN commune on bien.Id_commune = commune.Id_commune
INNER JOIN region on commune.Code_region = region.Code_region
WHERE Type_local = "appartement"
GROUP BY Nom_region;


SELECT Total_piece, count(*) AS "Ventes totales", 
ROUND(count(*)*100/(SELECT count(*) FROM vente 
INNER JOIN bien on vente.id_bien = bien.Id_bien
WHERE Type_local = "appartement"),2) AS "% ventes totales"
FROM vente 
INNER JOIN bien on vente.id_bien = bien.Id_bien
WHERE Type_local = "appartement"
GROUP BY Total_piece;

SELECT Nom_departement, ROUND(AVG(Prix_m2)) AS "Prix moyen du m²" FROM vente 
INNER JOIN bien on vente.id_bien = bien.Id_bien
INNER JOIN commune on bien.Id_commune = commune.Id_commune
INNER JOIN departement on commune.Code_departement = departement.Code_departement
GROUP BY Nom_departement
ORDER BY AVG(Prix_m2) DESC limit 10;

SELECT Nom_region, ROUND(AVG(Prix_m2)) AS "Prix moyen du m²" FROM vente 
INNER JOIN bien on vente.id_bien = bien.Id_bien
INNER JOIN commune on bien.Id_commune = commune.Id_commune
INNER JOIN region on commune.Code_region = region.Code_region
WHERE Type_local = "Maison" AND Nom_region = "Ile-de-France"
GROUP BY Nom_region;

SELECT Valeur AS "Prix de vente", Surface_carrez AS "Surface en m²", Nom_region FROM vente
INNER JOIN bien on vente.id_bien = bien.Id_bien
INNER JOIN commune on bien.Id_commune = commune.Id_commune
INNER JOIN region on commune.Code_region = region.Code_region
WHERE Type_local = "appartement" AND valeur IS NOT NULL
ORDER BY valeur DESC LIMIT 10;


SELECT 
	SUM(CASE WHEN date BETWEEN "2020-01-02" AND "2020-03-31" THEN 1 ELSE 0 END) AS "Ventes T1 2020", 
	SUM(CASE WHEN date BETWEEN "2020-04-01" AND "2020-06-30" THEN 1 ELSE 0 END) AS "Ventes T2 2020",
	((SELECT SUM(CASE WHEN date BETWEEN "2020-04-01" AND "2020-06-30" THEN 1 ELSE 0 END)
		/ SUM(CASE WHEN date BETWEEN "2020-01-02" AND "2020-03-31" THEN 1 ELSE 0 END)) -1)*100 
	AS "% Evolution des ventes entre le T1 et T2 2020"
FROM vente;

SELECT Nom_region, ROUND(AVG(Prix_m2)) AS "Moyenne des Prix m²"  FROM vente
INNER JOIN bien on vente.id_bien = bien.Id_bien
INNER JOIN commune on bien.Id_commune = commune.Id_commune
INNER JOIN region on commune.Code_region = region.Code_region
WHERE Total_piece >=4 AND Type_local LIKE "appartement"
GROUP BY Nom_region
ORDER BY AVG(Prix_m2) DESC;

SELECT Nom_commune, count(*) AS "Nombre de ventes T1 2020" FROM vente 
INNER JOIN bien on vente.id_bien = bien.Id_bien
INNER JOIN commune on bien.Id_commune = commune.Id_commune
WHERE date BETWEEN "2020-01-02" AND "2020-03-31"
GROUP BY Nom_commune
HAVING count(*) >50;


SELECT 
	ROUND(AVG (CASE WHEN Type_local = "appartement"AND Total_piece = 2 THEN Prix_m2 END)) AS "Moyenne prix/m² 2 pièces",
	ROUND(AVG (CASE WHEN Type_local = "appartement"AND Total_piece = 3 THEN Prix_m2 END)) "Moyenne prix/m² 3 pièces",
	(ROUND (AVG (CASE WHEN Type_local = "appartement"AND Total_piece = 3 THEN Prix_m2 END)
    / AVG (CASE WHEN Type_local = "appartement"AND Total_piece = 2 THEN Prix_m2 END),2) -1)*100
		AS "Différence de prix au m² 3 pièces vs 2 pièces en %" 	
FROM 
	vente 
	INNER JOIN bien on vente.id_bien = bien.Id_bien;


	

SELECT Nom_commune, Nom_departement, ROUND(AVG(valeur)) AS "Valeurs foncières moyenne"
FROM vente
INNER JOIN bien on vente.id_bien = bien.Id_bien
INNER JOIN commune on bien.Id_commune = commune.Id_commune
INNER JOIN departement on commune.Code_departement = departement.Code_departement
WHERE Nom_departement IN ("Alpes-Maritimes", "Bouches-du-Rhone", "Gironde", "Nord", "Rhone")
GROUP BY Nom_commune
ORDER BY AVG(valeur) DESC
LIMIT 3;

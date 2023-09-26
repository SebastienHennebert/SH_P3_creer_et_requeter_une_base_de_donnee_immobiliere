(SELECT Nom_commune, Nom_departement, ROUND(AVG(valeur)) AS "Valeurs foncières moyennes" FROM vente
INNER JOIN bien ON vente.Id_bien = bien.Id_bien
INNER JOIN Commune ON bien.Id_commune = commune.Id_commune
INNER JOIN departement ON commune.Code_departement = departement.Code_departement
WHERE Nom_departement = "Alpes-Maritimes"
GROUP BY Nom_commune 
ORDER BY valeur DESC LIMIT 3)
UNION
(SELECT Nom_commune, Nom_departement, ROUND(AVG(valeur)) AS "Valeurs foncières moyennes" FROM vente
INNER JOIN bien ON vente.Id_bien = bien.Id_bien
INNER JOIN Commune ON bien.Id_commune = commune.Id_commune
INNER JOIN departement ON commune.Code_departement = departement.Code_departement
WHERE Nom_departement = "Bouches-du-Rhone"
GROUP BY Nom_commune 
ORDER BY valeur DESC LIMIT 3)
UNION
(SELECT Nom_commune, Nom_departement, ROUND(AVG(valeur)) AS "Valeurs foncières moyennes" FROM vente
INNER JOIN bien ON vente.Id_bien = bien.Id_bien
INNER JOIN Commune ON bien.Id_commune = commune.Id_commune
INNER JOIN departement ON commune.Code_departement = departement.Code_departement
WHERE Nom_departement = "Gironde"
GROUP BY Nom_commune 
ORDER BY valeur DESC LIMIT 3)
UNION
(SELECT Nom_commune, Nom_departement, ROUND(AVG(valeur)) AS "Valeurs foncières moyennes" FROM vente
INNER JOIN bien ON vente.Id_bien = bien.Id_bien
INNER JOIN Commune ON bien.Id_commune = commune.Id_commune
INNER JOIN departement ON commune.Code_departement = departement.Code_departement
WHERE Nom_departement = "Nord"
GROUP BY Nom_commune 
ORDER BY valeur DESC LIMIT 3)
UNION
(SELECT Nom_commune, Nom_departement, ROUND(AVG(valeur)) AS "Valeurs foncières moyennes" FROM vente
INNER JOIN bien ON vente.Id_bien = bien.Id_bien
INNER JOIN Commune ON bien.Id_commune = commune.Id_commune
INNER JOIN departement ON commune.Code_departement = departement.Code_departement
WHERE Nom_departement = "Rhone"
GROUP BY Nom_commune 
ORDER BY valeur DESC LIMIT 3);
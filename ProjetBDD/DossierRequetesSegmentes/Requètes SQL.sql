
-- Select Employe du magasin n°7 qui ont une Prime de + de 1000 euros --

declare @t1 datetime
declare @t2 datetime
set @t1 = getdate()

SELECT P.Nom 'Nom_Employe', P.Prenom 'Prenom_Employe', P.Contrat, Pr.Montant 'Montant en €'
FROM Personnel P, Prime Pr
WHERE P.ID_EMPLOYE = Pr.ID_EMPLOYE
AND Pr.Montant > 1000
AND P.ID_MAGASIN = 7

set @t2 = getdate()

print 'temps de réponse : ' + RTRIM(CONVERT(varchar(20), datediff(ms,@t1,@t2))) + ' millisecondes'

-- Select Adresse complète des Fournisseurs de "potatoes" /!\ Marche pas --

declare @t1 datetime
declare @t2 datetime
set @t1 = getdate()


SELECT F.Nom, F.Adresse, F.Ville, F.Code_Postal
FROM Fournisseur F
WHERE F.ID_PRODUIT = 261

SELECT Nom, ID_PRODUIT
FROM Produit WHERE Nom LIKE '%Potatoes%'

set @t2 = getdate()

print 'temps de réponse : ' + RTRIM(CONVERT(varchar(20), datediff(ms,@t1,@t2))) + ' millisecondes'


-- Select Absence injustifie des Employe des magasins n°7-8-9 (Nbr_Jour => Decroissant) --

declare @t1 datetime
declare @t2 datetime
set @t1 = getdate()

SELECT A.Date_DebutAbsence_Conge, A.Nbr_Jour, A.Justifie, P.Nom 'Nom_Employe', P.Prenom 'Prenom_Employe', P.Contrat, P.ID_MAGASIN
FROM Personnel P, Absence_Conge A, Personnel_Absence PA
WHERE A.ID_ABSENCE = PA.ID_ABSENCE and P.ID_EMPLOYE = PA.ID_EMPLOYE
and A.Justifie like 'N' and P.ID_MAGASIN in (7,8,9)
Order by ID_MAGASIN ASC, Nbr_Jour DESC

set @t2 = getdate()

print 'temps de réponse : ' + RTRIM(CONVERT(varchar(20), datediff(ms,@t1,@t2))) + ' millisecondes'

-- Select Nom prenom Client qui ont pris + de 3 * Produit en Janvier 2020 --

declare @t1 datetime
declare @t2 datetime
set @t1 = getdate()

SELECT Cl.Nom, Cl.Prenom, Fd.NbrProduit, F.Date_Facture
From Client Cl, Facture_detail Fd, Facture F
Where F.ID_CLIENT = Cl.ID_CLIENT and Fd.ID_FACTURE = F.ID_FACTURE
and Fd.NbrProduit > 3 and Date_Facture like '1%' and Date_Facture like '%20'
Order by NbrProduit ASC

set @t2 = getdate()

print 'temps de réponse : ' + RTRIM(CONVERT(varchar(20), datediff(ms,@t1,@t2))) + ' millisecondes'

-- Select Employe et id_magasin qui ont une formation de moins de 10 heures en management  --

declare @t1 datetime
declare @t2 datetime
set @t1 = getdate()

SELECT P.Nom, P.Prenom, P.ID_MAGASIN 'Num Magasin', F.Date_Formation, F.Duree_Formation_Heure, F.Type_Formation
FROM Personnel P, Formation F, Personnel_Formation PF
WHERE PF.ID_EMPLOYE = P.ID_EMPLOYE and PF.ID_FORMATION = F.ID_FORMATION
and F.Type_Formation like 'Management' and F.Duree_Formation_Heure < 10
Order by ID_MAGASIN ASC, Duree_Formation_Heure ASC

set @t2 = getdate()

print 'temps de réponse : ' + RTRIM(CONVERT(varchar(20), datediff(ms,@t1,@t2))) + ' millisecondes'

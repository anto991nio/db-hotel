
/* 1.Seleziona tutti gli ospiti che sono stati identificati con la carta di identità */

SELECT * 
FROM ospiti 
WHERE document_type LIKE "CI";

/* 2.Seleziona tutti gli ospiti che sono nati dopo il 1988 */

SELECT * 
FROM ospiti
WHERE YEAR(date_of_birth) > 1988;


/* 3.Seleziona tutti gli ospiti che hanno più di 20anni (al momento dell’esecuzione della query) */

SELECT * 
FROM ospiti 
WHERE YEAR(`created_at`)-YEAR(`date_of_birth`) > 20;

/* 4.Seleziona tutti gli ospiti il cui nome inizia con la D */
SELECT * 
FROM ospiti 
WHERE `name` LIKE "D%";

/* 5.Calcola il totale incassato degli ordini accepted */

SELECT SUM(`price`) 
FROM pagamenti 
WHERE `status` = "accepted";

/* 6.Qual è il prezzo massimo pagato? */

SELECT MAX(price)
FROM pagamenti;

/* 7.Seleziona gli ospiti riconosciuti con patente e nati nel 1975 */

SELECT * 
FROM `ospiti` 
WHERE `document_type`="Driver License"
  AND  YEAR(`date_of_birth`) = 1975;

/*   8.Quanti paganti sono anche ospiti? */

SELECT COUNT(*) 
FROM `paganti` 
WHERE `ospite_id`<> "NULL"

/* 9.Quanti posti letto ha l’hotel in totale? */

SELECT SUM(`beds`)
FROM `stanze`;


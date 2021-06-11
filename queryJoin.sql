/* 1.Come si chiamano gli ospiti che hanno fatto più di due prenotazioni? ERRATO*/

SELECT COUNT(`ospite_id`),`ospite_id`, `ospiti`.`name`
FROM `prenotazioni_has_ospiti`
INNER JOIN `ospiti`
ON `ospite_id`= `ospiti`.`id`
GROUP BY `ospite_id`
HAVING COUNT(`ospite_id`) > 2;

/* 2.Stampare tutti gli ospiti per ogni prenotazione */
SELECT `ospiti`.`name`,`ospiti`.`lastname`,`prenotazione_id`
FROM `prenotazioni_has_ospiti`
INNER JOIN `ospiti`
ON `prenotazioni_has_ospiti`.`ospite_id`= `ospiti`.`id`

/* 3.Stampare Nome, Cognome, Prezzo e Pagante per tutteleprenotazioni fatte a Maggio 2018 */

SELECT `prenotazioni`.`created_at` ,`prenotazioni_has_ospiti`.`ospite_id`,`ospiti`.`name`,`ospiti`.`lastname`,`pagamenti`.`price`,`pagamenti`.`pagante_id`
FROM `prenotazioni_has_ospiti` 
INNER JOIN `prenotazioni`
   ON `prenotazioni_has_ospiti`.`prenotazione_id`=`prenotazioni`.`id`
INNER JOIN `ospiti`
    ON `prenotazioni_has_ospiti`.`ospite_id`=`ospiti`.`id`
INNER JOIN `pagamenti`
 	ON `prenotazioni_has_ospiti`.`prenotazione_id`=`pagamenti`.`prenotazione_id`
WHERE YEAR(`prenotazioni`.`created_at`) = "2018"
  AND MONTH(`prenotazioni`.`created_at`)= "5"

/* 4.Fai la somma di tutti i prezzi delle prenotazioniper le stanze delprimo piano */
SELECT SUM(`pagamenti`.`price`) 
FROM `prenotazioni` 
INNER JOIN `stanze`
ON `stanze`.`id`= `prenotazioni`.`stanza_id`
INNER JOIN `pagamenti`
ON `prenotazioni`.`id`= `pagamenti`.`prenotazione_id`
WHERE `stanze`.`floor`=1

/* 5.Prendi i dati di fatturazione per la prenotazionecon id=7 */

SELECT `name`,`lastname`,`address`
FROM `paganti`
INNER JOIN `pagamenti`
ON `pagamenti`.`pagante_id`= `paganti`.`id`
WHERE `pagamenti`.`prenotazione_id`= 7

/* 6.Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate)*/
SELECT `stanza_id`,`stanze`.`room_number`
FROM `prenotazioni`
RIGHT JOIN `stanze`
   ON `prenotazioni`.`stanza_id`= `stanze`.`id`
WHERE `prenotazioni`.`stanza_id` IS NULL
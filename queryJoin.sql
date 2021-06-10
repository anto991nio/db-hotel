/* 1.Come si chiamano gli ospiti che hanno fatto più di due prenotazioni? ERRATO*/

SELECT COUNT(`ospite_id`),`ospite_id`, `ospiti`.`name`
FROM `prenotazioni_has_ospiti`
INNER JOIN `ospiti`
ON `ospite_id`= `ospiti`.`id`
GROUP BY `ospite_id`


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


/* 6.Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate)*/
SELECT `stanza_id`,`stanze`.`room_number`
FROM `prenotazioni`
RIGHT JOIN `stanze`
   ON `prenotazioni`.`stanza_id`= `stanze`.`id`
WHERE `prenotazioni`.`stanza_id` IS NULL
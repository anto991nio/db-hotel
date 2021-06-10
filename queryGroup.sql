/* 1.Conta gli ospiti raggruppandoli per anno di nascita */
SELECT COUNT(`name`),YEAR(`date_of_birth`)
FROM `ospiti` 
GROUP BY YEAR(`date_of_birth`)
ORDER BY COUNT(`name`) DESC;

/* 2.Somma i prezzi dei pagamenti raggruppandoli per status */
SELECT SUM(`price`),`status`
FROM `pagamenti` 
GROUP BY `status`;

/* 3.Conta quante volte è stata prenotata ogni stanza */
SELECT COUNT(`stanza_id`),`stanza_id`
FROM `prenotazioni` 
GROUP BY `stanza_id`
ORDER BY COUNT(`stanza_id`)

/* 4.Fai una analisi per vedere se ci sono ore in cui leprenotazioni sonopiù frequenti */
SELECT COUNT(`created_at`),HOUR(`created_at`)
FROM `prenotazioni` 
GROUP BY HOUR(`created_at`)
ORDER BY COUNT(`created_at`);

/* 5.Quante prenotazioni ha fatto l’ospite che ha fattopiùprenotazioni? (quante, non chi!) */
SELECT COUNT(`ospite_id`) , `ospite_id`
FROM `prenotazioni_has_ospiti` 
GROUP BY `ospite_id`
ORDER BY COUNT(`ospite_id`) DESC
LIMIT 1;



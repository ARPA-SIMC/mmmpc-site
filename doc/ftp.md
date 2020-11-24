## Accesso ai dati tramite ftp

I dati prodotti dalle catene operative LAMI sono scaricabili
attraverso il protocollo ftp, nelle modalità in uso da tempo per LAMI,
collegandosi al server ftp.meteo.cineca.it con username e password
assegnati a ciascun Ente.

### Dati in tempo reale

La nuova procedura operativa a 5 km sul Mediterraneo denominata
[cosmo-5M](cosmo-5M.md) è disponibile in uno o più dei path seguenti (il
path esatto dipende dai permessi del singolo utente):

-   `/PROD/??-med_lm5`, `/PROD/??-ita_lm5`
-   `/reg/PROD/??-med_lm5`, `/reg/PROD/??-ita_lm5`
-   `/ugm/PROD/??-med_lm5`, `/ugm/PROD/??-ita_lm5`
-   `/smr/PROD/??-med_lm5`, `/smr/PROD/??-ita_lm5`

Il contenuto è lo stesso per tutti gli utenti, al momento. I caratteri
`??` indicano l'ora del run, quindi `00` o `12`, ciascuna cartella
contiene i file grib prodotti con cadenza oraria su due aree.

Le cartelle sopra indicate contengono dati su due diverse aree *med* e
*ita*, descritte nella pagina specifica della procedura
[cosmo-5M](cosmo-5M.md).

La corsa previsionale bigiornaliera a 2,2 km di passo di griglia e 48
ore di orizzonte temporale denominata [cosmo-2I](cosmo-2I.md) (che
sostituisce il tradizionale COSMO-I2 a 2,8 km) è disponibile nelle
cartelle (il path esatto dipende dai permessi del singolo utente):

-   `/PROD/??-light_lm2.2`
-   `/reg/PROD/??-light_lm2.2`
-   `/ugm/PROD/??-light_lm2.2`
-   `/smr/PROD/??-light_lm2.2`

Con significato dei simboli come sopra. Queste cartelle contengono una
selezione "alleggerita" dei campi del modello su tutta l'area di
integrazione.

### Recupero corse pregresse

Nel caso in cui vengano effettuati dei recuperi di corse pregresse che
per qualche motivo non sono andate a buon fine nei tempi operativi,
l'ultima corsa recuperata è normalmente scaricabile nella cartella
`REC` con le relative sottocartelle, strutturate in maniera analoga a
ciò che si trova sotto `PROD`.

In questi casi viene normalmente inviata una comunicazione alla lista
di distribuzione lm-USR.

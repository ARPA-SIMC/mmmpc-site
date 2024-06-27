## Accesso ai dati tramite arkiweb

I dati prodotti dalle catene operative LAMI sono scaricabili
attraverso arkiweb, l'interfaccia web al software di archiviazione di
dati meteorologici
[arkimet](https://github.com/ARPA-SIMC/arkimet). Arkiweb permette
l'accesso sia interattivo che automatizzato da script usando il
comando [curl](https://curl.haxx.se).

In entrambi i casi l'accesso avviene autenticandosi con le stesse
credenziali già in uso per l'accesso [ftp](ftp.md) del cineca
all'indirizzo ftp.meteo.cineca.it.

I dati in arkimet/arkiweb sono raggruppati per *dataset* omogenei
dove, tipicamente, un dataset è associato ad una configurazione
specifica di una corsa modellistica.

### Accesso interattivo

Dalla [pagina arkiweb di accesso](https://lami.ext.cineca.it/arkiweb) è
possibile selezionare il dataset (o anche più di uno) che interessa tra
quelli autorizzati (premere eventualmente *toggle disallowed datasets*
per nascondere quelli non autorizzati), quindi premere *load selected
datasets* per passare alla schermata successiva.

La seconda schermata permette di scegliere i dati di interesse
attivando i vari filtri disponibili, tipicamente reftime (data e ora
di partenza della previsione o di effettuazone dell'osservazione),
level (livello verticale), product (variabile fisica), non selezionare
niente in una sezione equivale a dire *seleziona tutto*. Man mano che
vengono attivati dei filtri, nella parte superiore della pagina si
compone automaticamente la stringa di richiesta che può essere
utilizzata per un accesso automatizzato da script. Quando il filtro
della richiesta è pronto si può premere *load summary* per passare
alla schermata successiva.

Nella schermata *choose a postprocessor* è possibile attivare un
metodo di postelaborazione, al momento per i dati grib LAMI non sono
stati attivati moduli di postelaborazione, quindi, senza selezionare
nessuna opzione, premere direttamente *download the selected data* che
fa scaricare i dati richiesti in formato grib.

### Accesso da script

Una volta noti il dataset desiderato e la stringa di filtro che
seleziona i dati desiderati, componibile anche in maniera interattiva
come mostrato nella sezione precedente, l'accesso ai dati con *curl*
può essere effettuato nella seguente maniera (assumendo di voler
estrarre i dati di temperatura e vento dal dataset cosmo_5M_itr):

```sh
curl -sgG \
 --data-urlencode "datasets[]=cosmo_5M_itr" \
 --data-urlencode "query=reftime:=yesterday 00:00; product: GRIB1,80,2,11 or GRIB1,80,2,33 or GRIB1,80,2,34;" \
 https://<user>:<password>@lami.ext.cineca.it/services/arkiweb/data
```

Per l'accesso ai dataset dei profili verticali simulati, ad esempio
[icon_2I_fcast_vprof](icon_2I_fcast.md), che sono archiviati in formato bufr, si
consiglia il postprocessing json, che si attiva da script come
nell'esempio seguente:

```sh
curl -sgG \
 --data-urlencode "datasets[]=cosmo_5M_vprof" \
 --data-urlencode "query=reftime:=yesterday 00:00;" \
 --data-urlencode "postprocess=json -f dbajson" \
 https://<user>:<password>@lami.ext.cineca.it/services/arkiweb/data
```

Per una maggiore sicurezza si consiglia di non inserire username e
password nell'url come nell'esempio ma conservarli in un file nascosto
`$HOME/.netrc` e utilizzare l'opzione di curl `-n` (vedere man curl
per maggiori informazioni).

Prima di scaricare i dati in maniera regolare e automatizzata, è
opportuno accertarsi che siano già tutti disponibili, per evitare di
scaricare blocchi di dati parziali.

### Segnalazione di disponibilità dei dati

#### Via web API specifica

È disponibile una web API per verificare l'avvenuta importazione dei
dataset:

##### `check`

```sh
curl -s \
 https://<user>:<password>@lami.ext.cineca.it/cgi-bin/imports/check/icon_2I_fcast/2024062700
```

restituisce una risposta `1` in plain-text se è già stato importato il
reference time per il dataset specificati, `0` altrimenti (anche in
caso di dataset insesistente).

##### `checklast`

```sh
curl -s \
 https://<user>:<password>@lami.ext.cineca.it/cgi-bin/imports/checklast/icon_2I_fcast
```

restituisce in plain-text, formato `YYYYmmddHHMM` il reference time
dell'ultima corsa importata per il dataset specificato.

In entrambi i casi, per corse modellistiche che popolano diversi
dataset (es. `icon_2I_fcast` e `icon_2I_fcast_vprof`) c'è un unico
segnale con il nome del dataset più breve.

#### Via arkiweb

In alternativa all'uso della web API specifica, è sempre possibile
controllare se i dati sono disponibili accedendo al servizio arkiweb
`fields` invece che al servizio `data`. Questo servizio restituisce un
riassunto in formato json del risultato della richiesta, incluso il
numero di messaggi grib che soddisfano la richiesta al momento:

```sh
curl -sgG \
 --data-urlencode "datasets[]=cosmo_5M_itr" \
 --data-urlencode "query=reftime:=yesterday 00:00; product: GRIB1,80,2,11 or GRIB1,80,2,33 or GRIB1,80,2,34;" \
 https://<user>:<password>@lami.ext.cineca.it/services/arkiweb/fields | \
 python -c 'import sys,json; print json.load(sys.stdin)["stats"]["c"]'
```

Se il numero ottenuto è inferiore a quello atteso significa che il
dataset non è ancora completo; per conoscere il numero atteso si può
effettuare la richiesta sui dati del giorno precedente.


## Profili verticali

Questa pagina documenta il formato dei profili verticali contenuti sia
nei dataset con suffisso `_vprof`, contenenti una serie di profili su
punti richiesti dagli utenti per generare dei *radiosondaggi
simulati*, che in quelli con suffisso `_cross`, che sono profili
verticali disposti su linee tali da formare diverse cross-section di
interesse meteorologico sul territorio italiano. Il formato in
entrambi i casi è identico, cambia solo la destinazione d'uso dei
dati.

I profili sono archiviati nativamente in formato BUFR; il template
usato per questi dati BUFR è un template locale definito dal software
[DB-All.e](https://github.com/ARPA-SIMC/dballe), quindi difficilmente
decodificabile con altri software generici per BUFR, si consiglia
pertanto, in fase di estrazione da [arkiweb](arkiweb.md), di attivare
nella terza schermata il plugin di elaborazione **json** (variante
Dballe JSON), in modo da ottenere i dati nel formato json che è
decodificabile con librerie diffuse in vari linguaggi di
programmazione. Ai seguenti link è possibile approfondire i dettagli
del [formato
json](https://doc.rmap.cc/rmap_rfc/rfc.html#json)
specifico utilizzato per questi dati e le tabelle per
l'[interpretazione dei
metadati](https://doc.rmap.cc/rmap_rfc/rfc.html#data-model-dati-e-metadati).

Attenzione, il contenuto del dataset è sperimentale e destinato a
subire variazioni, saranno probabilmente aggiunte nuove variabili ai
livelli verticali nonché i livelli di 2 e 10 metri sulla superficie
per temperatura e vento rispettivamente.

### Decodifica dei profili

Si riporta qui una bozza di programma python per la decodifica dei
profili in formato json:

```python
import sys
import json
import datetime

proflist = []
for l in sys.stdin.readlines():
    proflist.append(json.loads(l))

# Ogni elemento della lista proflist contiene ora un profilo verticale
# decodificato da json in un dizionario python
# ciclo sui profili
for prof in proflist:
    t=[]; p=[]; z=[]
    # ciclo sui livelli
    # estraggo temperatura, pressione e altezza (ottengo liste)
    for l in prof['data'][0:-1]:
        if l.get("level") is not None: # controllo che non e' anagrafica
            t.append(l['vars']['B12101']['v'])
            p.append(l['vars']['B10004']['v'])
            z.append(l['vars']['B10007']['v'])
    # data di validita'
    date = prof['date']
    # data di validita' come oggetto python
    pdate = datetime.datetime.strptime(prof['date'], "%Y-%m-%dT%H:%M:%SZ")
    # coordinate in 10^5 gradi
    lon = prof['lon']
    lat = prof['lat']
    # coordinate reali in gradi
    rlon = float(prof['lon'])/1.E5
    rlat = float(prof['lat'])/1.E5
```

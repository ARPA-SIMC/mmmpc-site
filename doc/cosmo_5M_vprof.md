## Dataset cosmo_5M_vprof

Il dataset arkimet cosmo_5M_vprof contiene contiene i profili
verticali (i cosiddetti *radiosondaggi simulati*) prodotti dalla
procedura operativa [cosmo-5M](cosmo-5M). Al momento contiene una
serie di profili su punti su cui venivano precedentemente prodotti i
profili in formato testuale per diversi utenti, eventuali richieste di
ulteriori profili possono essere indirizzate ad Arpae Emilia Romagna.

I profili sono archiviati nativamente in formato BUFR; il template
usato per questi dati BUFR è un template locale definito dal software
[DB-All.e](https://github.com/ARPA-SIMC/dballe), quindi difficilmente
decodificabile con altri software generici per BUFR, si consiglia
pertanto, in fase di estrazione da [arkiweb](arkiweb), di attivare
nella terza schermata il plugin di elaborazione **json** (variante
Dballe JSON), in modo da ottenere i dati nel formato json che è
decodificabile con librerie diffuse in vari linguaggi di
programmazione. Ai seguenti link è possibile approfondire i dettagli
del [formato
json](http://www.raspibo.org/wiki/index.php/Gruppo_Meteo/RFC-rmap#Formati)
specifico utilizzato per questi dati e le tabelle per
l'[interpretazione dei
metadati](http://www.raspibo.org/wiki/index.php/Gruppo_Meteo/RFC-rmap#Dati_e_Metadati).

Attenzione, il contenuto del dataset è sperimentale e destinato a
subire variazioni, saranno probabilmente aggiunte nuove variabili ai
livelli verticali nonché i livelli di 2 e 10 metri sulla superficie
per temperatura e vento rispettivamente.

### Decodifica dei profili

Si riporta qui una bozza di programma python per la decodifica dei
profili in formato json:

```
import json
fp = open("profilo.json")
vp = []
for l in fp.readlines():
    vp.append(json.loads(l))
fp.close()

# Ogni elemento della lista vp contiene ora un profilo verticale
# ciclo sui profili
for p in vp:
# estraggo temperatura, pressione e altezza
    t = [l['vars']['B12101']['v'] for l in p['data'][0:-1]]
    p = [l['vars']['B10004']['v'] for l in p['data'][0:-1]]
    z = [l['vars']['B10007']['v'] for l in p['data'][0:-1]]
# data di validità
    date = p['date']
# coordinate in 10^5 gradi
    lon = p['lon']
    lat = p['lat']
```


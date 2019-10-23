## COSMO a 5km sul Mediterraneo

La procedura operativa cosmo-5M è l'implementazione del modello COSMO su
un'area che copre tutto il territorio del Mediterraneo con un passo di
griglia di 5km. Le condizioni iniziali sono fornite dal sistema di
analisi ETKF del Servizio Meteorologico dell’Aeronautica militare,
mentre le condizioni al contorno provengono dal modello IFS di ECMWF.

Il modello gira due volte al giorno, 00 e 12 UTC, ed effettua previsioni
per un orizzonte temporale di 72 ore. I dati sono disponibili con
cadenza oraria su tre aree distinte:

### Area *med*

È l'area di integrazione completa di cosmo-5M; il dataset scaricabile
via [ftp](ftp) su quest'area include tutti i campi ritenuti utili per
l'interfacciamento con modelli di onde e circolazione marina, come
vento e flussi superficiali, più un insieme limitato di campi utili per
scopi di sala previsione, principalmente per una visualizzazione della
situazione sinottica.

Su [arkiweb](arkiweb), per quest'area, sono invece disponibili tutti i
dati superficiali e in quota ai livelli nativi, ma non i dati a
livelli isobarici.

### Area *ita*

È un'area che compre il territorio nazionale completo, analoga all'area
di integrazione della procedura precedente cosmo-I7; il dataset
scaricabile su quest'area include dati a livelli superficiali o quasi
superficiali (inclusi quindi dati a 2 e 10 metri sulla superficie e dati
pseudo-superficiali quali altezza dello zero termico, nuvolosità
alta/media/bassa, ecc.) più una serie di dati in quota a livelli
isobarici. L'assortimento dei campi è stato scelto in base alle esigenze
tipiche di sala previsione e preparazione di prodotti derivati che non
richiedano i livelli tridimensionali originali del modello.

Al momento i dati su quest'area sono disponibili solo via
[ftp](ftp), a regime si conta di renderli disponibili anche
via [arkiweb](arkiweb).

### Area *itr*

È un'area che compre il territorio nazionale ridotto, disponibile solo
via [arkiweb](arkiweb), vedere la descrizione nella pagina relativa al
corrispondente dataset [cosmo_5M_itr](cosmo_5M_itr).


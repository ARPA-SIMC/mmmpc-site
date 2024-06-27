ICON a 2,2km sull'Italia
-------------------------

La procedura operativa icon-2I è l'implementazione del modello ICON
su un'area che copre tutto il territorio nazionale con un passo di
griglia di 2,2km circa.

La procedura consiste di quattro fasi:

- assimilazione dati quasi-continua con il sistema di analisi di
  ensemble LETKF/Kenda, le analisi sono effettuate a intervalli di 1
  ora (00, 01, 02 UTC etc.)
- previsione a brevissimo termine effettuata a cadenza trioraria (03,
  06, 09 UTC etc. escluse le ore 00 e 12), con un orizzonte temporale
  di 24 ore (denominata anche RUC, Rapidly Updating Cycle)
- previsione a breve termine effettuata alle 00 e 12 UTC, con un
  orizzonte temporale di 72 ore.
- previsione di ensemble a breve termine effettuata alle 21 UTC, con
  un orizzonte temporale di 51 ore e 20 membri, questa previsione
  utilizza le analisi perturbate del sistema di analisi di ensemble.

Le condizioni al contorno provengono dal modello IFS di ECMWF, sia
deterministico (hires) che ensemble.

Il sistema di assimilazione LETKF/Kenda utilizza osservazioni
superficiali (SYNOP, SHIP, BUOY), radiosondaggi (TEMP) e osservazioni
puntuali da aerei di linea (AMDAR, AIREP, ACARS) fornite dal Servizio
Meteorologico dell’Aeronautica Militare. Esso utilizza inoltre anche i
volumi tridimensionali dei radar nazionali forniti dal Dipartimento di
Protezione Civile.

Le corse di ensemble effettuate durante la fase di assimilazione, così
come le corse di previsione, relativamente alle sole prime ore di
integrazione, assimilano i dati di stima di precipitazione da radar
con il metodo del Latent Heat Nudging; i dati di precipitazione
stimata sono derivati dal mosaico radar nazionale del Dipartimento di
Protezione Civile.

I dati delle quattro suindicate fasi di icon-2I sono disponibili con
cadenza oraria su tutta l'area di integrazione via
[arkiweb](arkiweb.md), vedere la descrizione nelle pagine relativa ai
dataset [icon_2I_assim](icon_2I_assim.md),
[icon_2I_fcast](icon_2I_fcast.md), [icon_2I_fcruc](icon_2I_fcruc.md) e
[icon_2I_fcens](icon_2I_fcens.md).

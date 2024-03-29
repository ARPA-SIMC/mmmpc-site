COSMO a 2,2km sull'Italia
-------------------------

La procedura operativa cosmo-2I è l'implementazione del modello COSMO
su un'area che copre tutto il territorio nazionale con un passo di
griglia di 2,2km.

La procedura consiste di quattro fasi:

- assimilazione dati quasi-continua con il sistema di analisi di
  ensemble LETKF/Kenda, le analisi sono effettuate a intervalli di 1
  ora (00, 01, 02 UTC etc.)
- previsione a brevissimo termine effettuate a cadenza trioraria (00,
  03, 06 UTC etc.), con un orizzonte temporale di 18 ore (denominate
  anche RUC, Rapidly Updating Cycle)
- previsione a breve termine effettuate alle 00 e 12 UTC, con un
  orizzonte temporale di 48 ore, queste previsioni vengono eseguite
  dopo le corrispondenti previsioni RUC utilizzando condizioni al
  contorno più recenti.
- previsione di ensemble a breve termine effettuate alle 21 UTC, con
  un orizzonte temporale di 51 ore e 20 membri, queste previsioni
  utilizzano le analisi perturbate del sistema di analisi di ensemble.

Le condizioni al contorno provengono dal modello COSMO-ME-EPS a 7 km
del Servizio Meteorologico dell'Aeronautica Militare per la fase di
analisi e di previsione di ensemble e da [cosmo-5M](cosmo-5M.md) per le
fasi di previsione.

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

I dati delle tre suindicate fasi di cosmo-2I sono disponibili con
cadenza oraria su tutta l'area di integrazione via [arkiweb](arkiweb.md),
vedere la descrizione nelle pagine relativa ai dataset
[cosmo_2I_assim](cosmo_2I_assim.md), [cosmo_2I_fcruc](cosmo_2I_fcruc.md),
[cosmo_2I_fcast](cosmo_2I_fcast.md) e [cosmo_2I_fcens](cosmo_2I_fcens.md). I
dati delle corse a breve termine (+48 ore) sono disponibili anche via
[ftp](ftp). I dati di stima di precipitazione radar del mosaico
nazionale, interpolati sulla griglia di cosmo-2I, sono disponibili nel
dataset [cosmo_2I_radar](cosmo_2I_radar.md).

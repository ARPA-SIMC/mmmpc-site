## Dataset di backup

I dataset [arkiweb](arkiweb.md) popolati da dati ottenuti da corse
gestite direttamente dal personale Cineca (tutti i dataset `cosmo_5M*`
nonché `cosmo_2I_fcast`) hanno un corrispondente dataset di backup con
stesso nome e suffisso `_backup` alimentato da una corsa analoga a
quella principale ma eseguita sul sistema di calcolo di backup.

Questi dataset sono anch'essi regolarmente alimentati e possono essere
utilizzati nel caso in cui i corrispondenti dataset principali non
contengono i dati del giorno.

Si consiglia di interrogare i dataset di backup solo nei casi in cui
non si trovino i dati dei dataset principali almeno mezz'ora dopo
l'ora a cui sono solitamente disponibili.

L'elenco completo dei dataset di backup è:
[cosmo_5M_backup](cosmo_5M.md), [cosmo_5M_itr_backup](cosmo_5M_itr.md),
[cosmo_5M_vprof_backup](cosmo_5M_vprof.md) e
[cosmo_2I_fcast_backup](cosmo_2I_fcast.md).

Le caratteristiche tecniche e il contenuto informativo dei dataset di
backup non differiscono in nessun modo da quelle dei corrispondenti
dataset principali. Tuttavia, per una singola corsa modellistica, è
opprtuno non mescolare i dati dei dataset principale e backup per
evitare inconsistenze, specie nei campi cumulati, in quanto piccole
differenze nelle previsioni effettuate su sistemi diversi sono
inevitabili.

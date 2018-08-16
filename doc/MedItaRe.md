## MedItaRe

La procedura operativa denominata MedItaRe effettua la previsione
dello stato del mare con il modello di onde marine Swan una volta al
giorno, alle 00 UTC, con un orizzonte temporale di 72 ore, su diverse
aree:

- area Med, copre tutto il Mare Mediterraneo con un passo di griglia
  di 0.25 gradi, i dati sono disponibili nel dataset
  [swanmed](swanmed)

- area Ita, copre i mari italiani con un passo di griglia di 1/12 di
  grado, i dati sono disponibili nel dataset [swanita](swanita)

- aree regionali, copre i mari di alcune regioni con un passo di
  griglia di 1/60 di grado, le aree coperte, con relativi dataset,
  sono: Campania [swancam](swanre), Emilia-Romagna
  [swanemr](swanre), Sud Italia [swansud](swanre), Toscana
  [swantos](swanre).

Le condizioni al contorno atmosferiche sono fornite dalla corsa
modellistica [cosmo-5M](cosmo-5M).

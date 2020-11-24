## Dataset cosmo_2I_fcens

Il dataset arkimet cosmo_2I_fcens contiene i dati prodotti dalla
procedura operativa [cosmo-2I](cosmo-2I.md) durante la corsa giornaliera
di previsione di ensemble a breve termine (+51 ore).

Trattandosi di una procedura implementata di recente, i dati sono
disponibili solo in formato grib2.

Il dataset comprende sia i dati dei singoli membri dell'ensemble,
selezionabili con la chiave arkimet `proddef:GRIB:pf=<n>` con `<n>`
pari al numero del membro, sia le probabilità, calcolate su tutto
l'ensemble, di superamento di alcune soglie predefinite per la
precipitazione cumulata. Le probabilità sono ancora sperimentali e
hanno una codifica che potrebbe variare nel futuro.


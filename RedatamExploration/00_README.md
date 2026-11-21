# Cuatro nuevos cultivos: maíz, arroz con cáscara, trigo y yuca

Estado: DELIVERED — AWAITING HUMAN APPROVAL. PENDING HUMAN ACCEPTANCE. Sin publicación.

C04 continúa la instrucción «ok, aprobado, sigue con los siguientes productos!». C02 está aceptado y congelado; su aceptación no cambia los11 FAIL históricos. C03, reservado a1976, no se ejecutó. Se reutiliza la arquitectura y los mismos campos del piloto para un lote de cuatro productos; no se amplía a todo el censo.

## Abrir y descargar

- [HTML con seis cultivos](../Agro2013/index.html?topic=crops#explore): conserva papa, camote y las86 variables anteriores; añade cuatro productos, máximo2 decimales visuales y separadores de miles.
- [Base combinada de seis cultivos](crop_all_wide.csv):339 filas,7 identificadores y660 métricas (300 analíticas y360 diagnósticas).
- [Diccionario combinado con código por variable](crop_all_variable_dictionary.csv) y [tabla larga combinada](crop_all_long.csv):30.510 filas.
- [Base del nuevo lote](crop_national_wide.csv), [diccionario del nuevo lote](crop_national_variable_dictionary.csv) y [tabla larga del lote](crop_national_long.csv):440 métricas y20.340 filas largas.
- [AREALIST municipal crudo](national_results/p11_crop_national.csv) y [departamental crudo](national_results/p12_crop_department.csv).
- [Programa municipal ejecutado](Programs/p11_crop_national.spc) y [programa departamental ejecutado](Programs/p12_crop_department.spc).
- [Controles departamentales](crop_national_department_controls.csv), [totales por selección](crop_national_totals.csv) y [contraste con totalizador](crop_national_totalizer_comparison.csv).

Los CSV limpios usan coma; los AREALIST originales usan punto y coma. Importar códigos como texto para conservar ceros iniciales. Los CSV conservan seis decimales de salida nativa cuando corresponden; el HTML solo redondea la presentación. El diccionario combinado distingue source_contract y enlaza las recetas históricas C02 sin alterar ese contrato.

## Universo y reglas

Códigos exactos:01122000 Maíz;01132000 Arroz con cáscara;01112000 Trigo;01592000 Yuca. Verificados en ambos codificadores nativos. No incluir semillas, maíz berza, trigo forrajero ni fruto/hoja de yuca. No homologar por nombres similares ni fabricar códigos.

Invierno2012: CULTINV.S4_P23_3. Verano2012/2013: CULTVER.S4_P24_4 (riego/producción) yS4_P24_4_1 (uso del suelo), siempre separados. Son superficies sembradas en hectáreas, no toneladas ni plantas. Riego1/2/9 y otros/especiales separados; estos códigos no identifican tecnologías de riego. Geografía censal:339 códigos compuestos de seis posiciones, no MUN aislado.

Cada UPA puede tener varios registros de cultivo. UPA únicas se cuentan jerárquicamente dentro de cada filtro, con diagnóstico de área positiva. No sumar UPA de riegos/cultivos/campañas como una unión. No sumar ambos campos estivales ni las campañas como superficie física única. Valores fuera de rango, missing/no aplicable y ceros se distinguen; sin registros se conserva conteo0 y superficie nula.

El mapa conserva la correspondencia operativa a geometría2015 usada en C02; no demuestra igualdad de límites censales2013/2015. La suma nacional es suma municipal; el control independiente se ejecuta por departamento, no un tercer AREALIST nacional.

## Totales crudos del nuevo lote — selección de todos los riegos

| Cultivo | Campaña | Campo | Ha válidas | UPA con registros | Registros | Municipios con registros |
|---|---|---|---:|---:|---:|---:|
| Maíz | invierno2012 | sembrada | 69293.411288 | 5369 | 5552 | 116 |
| Maíz | verano2012_2013 | riego_produccion | 391687.534074 | 264762 | 382521 | 298 |
| Maíz | verano2012_2013 | uso_suelo | 390667.908065 | 264762 | 382521 | 298 |
| Arroz con cáscara | invierno2012 | sembrada | 742.455994 | 403 | 403 | 48 |
| Arroz con cáscara | verano2012_2013 | riego_produccion | 181531.127097 | 44238 | 45458 | 118 |
| Arroz con cáscara | verano2012_2013 | uso_suelo | 181497.026263 | 44238 | 45458 | 118 |
| Trigo | invierno2012 | sembrada | 67261.943491 | 995 | 1235 | 42 |
| Trigo | verano2012_2013 | riego_produccion | 61598.319387 | 102032 | 125143 | 250 |
| Trigo | verano2012_2013 | uso_suelo | 61491.099156 | 102032 | 125143 | 250 |
| Yuca | invierno2012 | sembrada | 4809.516762 | 1805 | 1820 | 85 |
| Yuca | verano2012_2013 | riego_produccion | 24082.416554 | 39568 | 40231 | 154 |
| Yuca | verano2012_2013 | uso_suelo | 24029.019127 | 39568 | 40231 | 154 |

## Validación y limitaciones

Se ejecutaron51153 controles: 51141 PASS y12 FAIL. Integridad/identificación/conteos:PASS. Resultado estadístico global:FAIL. Estados de observación:{'SIN_REGISTROS': 15158, 'OBSERVADO': 5182}.
De3978 comparaciones municipio→departamento,12 quedan fuera de los criterios, con máxima diferencia absoluta0.000034ha. Conteos:igualdad exacta. Superficies departamentales:0.5e-6ha*(nmunicipios+1); particiones y promoción alternativa:3e-6ha. Los criterios se fijaron antes de consultar y no se ampliaron para obtener PASS. No se ajustan cifras. Causas numéricas pendientes no se atribuyen automáticamente a redondeo.
Contraste diagnóstico con totalizador:4444 comparaciones; estados{'DISCREPANCIA': 277, 'DENTRO_TOL_1E_6_HA': 3766, 'SIN_AREA_REDATAM': 401}; máxima diferencia comparable0.00000862500003743ha. Solo etiquetas exactas de los cuatro cultivos y campañas23/24. Los codificadores detallados son distintos: no constituye concordancia oficial ni validación independiente integral. Datos inexistentes no se sustituyen por ceros.

Detalle de comprobaciones fallidas:

- municipal_to_direct_department: `('01', 'F8A0M4', '-0.000016', '0.0000150')`.
- municipal_to_direct_department: `('01', 'F8A1M4', '-0.000016', '0.0000150')`.
- municipal_to_direct_department: `('03', 'F6A0M4', '-0.000032', '0.0000240')`.
- municipal_to_direct_department: `('03', 'F6A1M4', '-0.000031', '0.0000240')`.
- municipal_to_direct_department: `('03', 'F8A0M4', '-0.000030', '0.0000240')`.
- municipal_to_direct_department: `('03', 'F8A1M4', '-0.000031', '0.0000240')`.
- municipal_to_direct_department: `('03', 'CHECKA', '-0.000034', '0.0000240')`.
- municipal_to_direct_department: `('06', 'F27A1M4', '-0.000007', '0.0000060')`.
- municipal_to_direct_department: `('08', 'F36A0M4', '-0.000012', '0.0000100')`.
- municipal_to_direct_department: `('08', 'F36A1M4', '-0.000012', '0.0000100')`.
- municipal_to_direct_department: `('08', 'F38A0M4', '-0.000012', '0.0000100')`.
- municipal_to_direct_department: `('08', 'F38A1M4', '-0.000012', '0.0000100')`.

## Ejecución, integridad y reproducción

Motor oficial instalado RedProcess7.3.4.2, mismas definiciones REAL DECIMALS6/INTEGER de C02, selección ALL. Los388 archivos asociados fueron copiados a C04/WorkBase y verificados contra el manifiesto de fuentes. Originals Inputs y contrato C02 congelado permanecen en lectura. No se exportan registros individuales.

- p11_crop_national: 338.20s; exportación completa/estable=True; cierre normal verificado=False; exit_code=1. SHA256 de resultado:`e56dfed39a013db14cceac10eb180d94a43c330e6065f5054c6c032662636ee9`.
- p12_crop_department: 344.08s; exportación completa/estable=True; cierre normal verificado=False; exit_code=1. SHA256 de resultado:`f021eebf18f61a319df1842f3386e8394b2531afe18d634f09aa7b8ef496cf32`.

La terminación afecta solo al PID propio, después de seis lecturas completas e idénticas separadas2s. La exportación y la validez estadística se comprueban por separado del cierre del proceso. Si el motor queda abierto y es terminado, no se reporta salida normal.

Código guardado: Contracts/bootstrap_contract04.py documenta derivaciones desde C02; Evidence/RedatamExploration/Code contiene prepare_crops.py, run_crop_national.py, analyze_crop_national.py, compare_crop_national.py yreport_delivery.py. Evidence/Code contiene build_crop_dashboard.py yvalidate_dashboard.py. No volver a ejecutar bootstrap ni consultas con las mismas rutas; el ejecutor rechaza sobrescritura. Usar nombres versionados para reintentos.

Verificación sin nuevas consultas:
```powershell
python -B Outputs/Contract_04/Evidence/RedatamExploration/Code/verify_delivery.py
python -B Outputs/Contract_04/Evidence/Code/validate_dashboard.py
```

Para reconstruir la presentación: build_crop_dashboard.py. El analizador devuelve error si quedan FAIL científicos; no cambiar umbrales para silenciarlo. El visor solo integra cuando identificación, conteos e integridad pasan y presenta pendientes de conciliación explícitos. PENDING HUMAN ACCEPTANCE; no publicación.

## Verificación final de la presentación

Se comprobaron90 selecciones por idioma ×339 municipios, totales, valores nulos, mensajes de conciliación, descarga SVG y enlaces locales. Formato de miles y máximo2 decimales verificado. Escritorio1440px y móvil390/768px sin desbordamiento; revisión visual de mapas de escritorio/móvil realizada. Las86 variables y papa/camote anteriores conservan sus valores. Todos los archivos del manifiesto congelado C02 mantienen sus hashes. PASS de interfaz no cambia los FAIL estadísticos.

## Inventario completo de productos solicitado

Inventario solicitado: lista completa de580 nombres observados en12 grupos, con buscador, estado de los6 cultivos del visor yCSV. Codificador declarado deCULTVER:1.984 entradas; descarga de15.828 entradas nativas de8 campos, preservando códigos por entidad. No se confunden categorías declaradas con registros observados, ni productos con usos de tierra. Sin nuevas consultas ni cambios a cifras. Interfaz del catálogo verificada en escritorio/móvil; C04 sigue pendiente de aceptación. [Abrir lista completa](catalogo_productos.html).

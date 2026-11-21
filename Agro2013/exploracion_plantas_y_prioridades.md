Versión ampliada C04: seis cultivos. Métodos, programas y resultados actuales: ../RedatamExploration/00_README.md. El texto siguiente conserva la documentación original C02.

# Exploración de plantas y próximos productos

Se inspeccionaron 380,113 filas no vacías del totalizador, 26 columnas y 339 códigos municipales. Se observaron 795 códigos de cultivo/uso; los códigos no equivalen automáticamente a especies botánicas. El catálogo descargable conserva nombres, grupos y campaña. No se produjeron conteos de plantas a partir de hectáreas ni de registros.

## Qué contiene la fuente

`totalizador.xlsx / Totalizador` conserva departamento, provincia, municipio, comunidad, regiones agroproductivas, producto y código, grupo, superficie con/sin riego, superficie total, superficie efectiva y cantidad cosechada en quintales. Campañas observadas: {'24': 211920, '28': 106333, '27': 21313, '23': 10996, '26': 29551}. Tipos: {'I': 185007, 'S2': 4290, 'OT': 106331, 'T': 13801, 'CM': 20838, 'AA': 10244, 'S3': 1016, 'PP': 6628, 'CP': 28836, 'AP': 3000, 'S4': 122}. El diccionario distingue 23 invierno, 24 verano, 25 semillas, 26 pastos, 27 forestales y 28 otros usos. Los cultivos asociados (AA/AP/PP), sucesivos (S2/S3/S4) y variados (T) impiden sumar superficies sin revisar doble conteo. La columna de superficie efectiva requiere una definición adicional explícita. Campos numéricos vacíos: {}; negativos: {}. Diferencias con riego + sin riego frente a total: 157190, con umbral diagnóstico de 1e-8 ha, no una corrección.

`CULTFRU.S4_P29D` sí ofrece número de plantas de frutales dispersos en el diccionario Redatam. `CULTMED.S4_P30_1` identifica especies medicinales; no se identificó allí una variable de número de plantas. Los catálogos de miles de códigos son posibilidades de respuesta, no especies observadas. No se han validado ni decodificado los registros individuales y sus punteros UPA.

## Prioridades propuestas

1. **Cultivos por municipio y campaña:** hectáreas con/sin riego y producción por cultivo en quintales. Fuente tabular disponible; revisar clave, filas repetidas, cultivos asociados/sucesivos y superficie efectiva. Mantener invierno2012 separado de verano2012-2013. Convertir quintales a toneladas solo después de verificar la equivalencia de esta distribución.
2. **Uso de tierras y riego:** los agregados municipales ya contienen superficies agrícolas, ganaderas, forestales, barbecho y descanso. Definir componentes disjuntos; no sumar `sup`, `sup_total` y sus subtotales.
3. **Número de frutales dispersos por especie:** coincide con el interés por existencias vegetales. Requiere lectura Redatam validada o perfiles equivalentes. No equivale a superficie frutícola ni a todos los árboles del municipio.
4. **Maquinaria e infraestructura:** tractores, equipos, silos/pirwas, secadoras e invernaderos tienen campos municipales. Conteo de equipos distinto de UPA propietarias o usuarias.
5. **Producción y prácticas pecuarias:** leche del día anterior, sanidad, destino de producción y miel son candidatos; conservar períodos y unidades diferentes de existencias animales.
6. **Agua, energía, asistencia, crédito y trabajo:** metadatos presentes. Para tasas se requiere universo elegible; respuestas múltiples no forman particiones. Crédito/asistencia pueden referirse a tres años; miel a doce meses. Trabajo familiar8+ no es población general.
7. **Plantas medicinales y productos forestales:** presencia de especies, recolección y uso; distinguir registros/especies/UPA, volumen cosechado y árboles. No prometer stock vegetal donde no hay pregunta cuantitativa.

Estas prioridades son propuestas de productos posteriores. Este contrato entrega exploración y viabilidad, no produce automáticamente esos indicadores. Evidencia: `../../Evidence/plants_exploration.json`, `redatam_dictionary.json` y `extractions.json`; fuentes bibliográficas: crop_totalizer y cna2013_local.

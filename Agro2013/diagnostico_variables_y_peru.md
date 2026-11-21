# Variables y comparación con Perú

Se leyó el diccionario peruano previamente identificado: 225 variables, 29 módulos, censos de población/vivienda2007 y2017. Copia preservada y SHA256 en Evidence/peru_source.json. No constituye una fuente agrícola peruana: las menciones de actividad agropecuaria describen trabajo de personas, no conteos de animales, plantas o UPA. No existe una concordancia agrícola bilateral validada en el material inspeccionado.

La arquitectura numerador/denominador es reutilizable. Comparar stock animal requiere una fuente agropecuaria peruana con especie, edad, sistema granja/corral, fecha de referencia y cobertura territorial equivalentes. Comparar cultivos requiere códigos, campaña, cultivo asociado, superficie y equivalencia de quintal. Una etiqueta común no establece equivalencia.

Los 94 campos municipales bolivianos fueron inventariados en catalogo_plantas_y_otras_variables.csv junto con el totalizador y los metadatos Redatam. Actividad principal suma personas familiares8+ (universo restringido); no representa empleo municipal general. `vbp_x_upa` es una media que no se suma; requiere ponderación y denominador comprobados. UPA, productor, hogar y vivienda no son intercambiables.

Servicios y vivienda: agua de riego/consumo animal y energía productiva no equivalen a agua potable o electricidad doméstica. Los agregados marginales no permiten contar personas expuestas a una característica de vivienda. No se multiplican viviendas por tamaño familiar supuesto. Haría falta enlace válido persona-hogar-vivienda y universos compatibles; el diagnóstico C01 preservado no autoriza trasladar esos vínculos al CNA2013.

Se excluyen tasas por UPA propietarias de cada especie porque el agregado municipal seleccionado no contiene esos denominadores. Se admite cabezas/todas las UPA con etiqueta explícita; no es tamaño promedio del hato de propietarios. Se excluye animales/familiares8+ por incompatibilidad de universos. La normalización humana2013 se entrega separada y estimada según Contract02, sin equivalencia automática con Perú. Referencias: peru_dictionary, cna2013_local, cna2013_report, c02_method.

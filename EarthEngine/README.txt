Bolivia: 339 municipios — geometría de referencia 2015

Archivo para Earth Engine: bolivia339_2015.zip
Contiene un único Shapefile con .shp, .shx, .dbf, .prj y .cpg.
Sistema: EPSG:4326, longitud/latitud; texto UTF-8.

Carga: Earth Engine Code Editor > Assets > NEW > Shape files. Seleccionar el ZIP y asignar el Asset ID. No se ha realizado ninguna carga externa.
Documentación: https://developers.google.com/earth-engine/guides/table_upload

Campos:
asdf_id: identificador original del mapa GeoBolivia/geo4bolivia.
mun_code: código de referencia del enlace territorial (texto de seis dígitos).
cna_code: código municipal del CNA2013 (texto de seis dígitos).
municipio, depto, provincia: nombres de la correspondencia censal.
map_name: nombre conservado de la geometría original.
map_year=2015: año de referencia de la geometría.
census_yr=2013: año de referencia de los identificadores censales.

Los límites se conservan exactamente; no se reprocesaron ni repararon polígonos. No se afirma identidad territorial exacta entre 2013 y 2015. Esta exportación contiene límites e identificadores, no los indicadores agropecuarios.

Validación: 339 geometrías válidas, sin vacíos; claves únicas; códigos con ceros iniciales y atributos preservados; igualdad geométrica tras leer de nuevo el ZIP.
Código: ../FullExpansion/../../Evidence/FullExpansion/Code/build_earthengine_shape.py

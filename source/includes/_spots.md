# DataSuite

## Obtener API Key DataSuite

```python
import requests
import json

url = "cuenta.megatime.cl/api/auth/key"

payload = json.dumps({
  "email": "user@example.com",
  "password": "**********"
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.json())


```

```shell
curl --location --request POST 'cuenta.megatime.cl/api/auth/key' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "user@example.com",
    "password": "**********"
}'
```

```javascript
var request = require("request");
var options = {
  method: "POST",
  url: "cuenta.megatime.cl/api/auth/key",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    email: "user@example.com",
    password: "**********",
  }),
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "key": "0x71e1db8n090am63ca69606c4slb8b6ta"
}
```

Retorna key que permite el acceso al API del clasificador.

### Llamada HTTP

`POST cuenta.megatime.cl/api/auth/key`

### Parámetros Body

| Nombre   | Tipo   | Descripción                                  | Requerido |
| -------- | ------ | -------------------------------------------- | --------- |
| email    | String | Correo asociado a credencial de Megatime     | Sí        |
| password | String | Contraseña asociado a credencial de Megatime | Sí        |

### Atributos Respuesta

| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| key    | String  | Llave de acceso a API    |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener Pauta

```python
import requests

url = "datasuite.megatime.cl/spots?include=1&media=1,2,3,4,5&start_date=10-03-2021&end_date=10-03-2021&brands=1,2,3,4,5&companies=1,2,3,4,5&industries=1,2,3,4,5&sub_industries=1,2,3,4,5&products=1,2,3,4,5&categories=1,2,3,4,5&qualities=1,2,3,4,5&creative_agencies=1,2,3,4,5&media_agencies=1,2,3,4,5&group=1&target=1"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/spots?include=0&media=1,2,3,4,5&start_date=10-03-2021&end_date=10-03-2021&brands=1,2,3,4,5&companies=1,2,3,4,5&industries=1,2,3,4,5&sub_industries=1,2,3,4,5&products=1,2,3,4,5&categories=1,2,3,4,5&qualities=1,2,3,4,5&creative_agencies=1,2,3,4,5&media_agencies=1,2,3,4,5&group=1&target=1' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/spots?include=1&media=1,2,3,4,5&start_date=10-03-2021&end_date=10-03-2021&brands=1,2,3,4,5&companies=1,2,3,4,5&industries=1,2,3,4,5&sub_industries=1,2,3,4,5&products=1,2,3,4,5&categories=1,2,3,4,5&qualities=1,2,3,4,5&creative_agencies=1,2,3,4,5&media_agencies=1,2,3,4,5&group=1&target=1",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 737301110,
      "media": "TV Abierta",
      "media_id": 1,
      "date": "2021-03-10",
      "support_id": 1007,
      "support": "TVN",
      "weekday": "Jueves",
      "supplement": "SIN SUPLEMENTO",
      "supplement_id": 0,
      "advertisement": "FALABELLA,CMR ALIANZA DUNKIN,MARZO 40% DCTO.D DUNKIN APP",
      "advertisement_id": 567008,
      "quality": "VIDEO COLOR",
      "quality_short": "VC",
      "hour": "14:58:14",
      "real_duration": 20,
      "page": 0,
      "size": 0,
      "module": "",
      "element": "DESCONOCIDO",
      "element_id": 0,
      "investment": 4200000,
      "brad_id": 4986,
      "brand": "CMR FALABELLA",
      "product_id": 325170,
      "product": "FALABELLA,CMR ALIANZA DUNKIN",
      "company_id": 173,
      "company": "FALABELLA",
      "industry_id": 102,
      "industry": "TARJETAS DE CREDITO",
      "sub_industry_id": 10270,
      "sub_industry": "TARJETA DE CREDITO GRANDES TIENDAS",
      "universal_id": 383878,
      "universal_program_id": 80137,
      "ad_supplier_id": 0,
      "ad_supplier": "",
      "megatime_hour": 14,
      "channel_KANTAR": 4,
      "e_type_media": 1,
      "section": "SIN SECCION",
      "section_id": 0,
      "normal_duration": 20,
      "ad_group_location": 3,
      "ad_group_spot_location": 10,
      "ad_group_quantity": 13,
      "schedule_id": 3,
      "schedule": "Tarde",
      "media_agency": "IPG MEDIABRANDS CHILE",
      "media_agency_id": 516,
      "creative_agency": "IMAGINA",
      "creative_agency_id": 684,
      "category": "MERCADO FINANCIERO Y SEGUROS",
      "category_id": 10,
      "ad_first_appearance": "2021-03-01",
      "failure": "s/f",
      "failure_id": 0,
      "is_sponsor": true,
      "location": "",
      "location_id": 0,
      "program": "24 TARDE",
      "program_id": 1007078435,
      "centimeter": 0,
      "columns": 0,
      "impressions": 0,
      "station_id": 0,
      "station": "SIN ESTACION",
      "code": "",
      "banner_URL": "",
      "internet_campaign": "",
      "rating": 2.3094840049743652,
      "options": [
        {
          "classifier": {
            "ID": 22,
            "name": "Beneficio "
          },
          "values": [
            {
              "ID": 61,
              "name": "Club"
            },
            {
              "ID": 65,
              "name": "Alianzaa"
            }
          ]
        },
        {
          "classifier": {
            "ID": 32,
            "name": "BU"
          },
          "values": [
            {
              "ID": 174,
              "name": "CORPORATE"
            }
          ]
        }
      ]
    }
  ]
}
```

> Ejemplo de retorno en formato JSON con error:

```json
{
  "ok": false,
  "error": "\"value\" must contain at least one of [brands, companies, industries, sub_industries, products, group]"
}
```

Retorna una lista de spots asociados a los filtros que se indique.

### Llamada HTTP

`GET datasuite.megatime.cl/spots`

### Parámetros URL

| Nombre            | Tipo    | Descripción                                                                 | Requerido |
| ----------------- | ------- | --------------------------------------------------------------------------- | --------- |
| include           | Integer | <b>(Por defecto: 0)</b> 0 incluir Avisos y PNTs, 1 solo Avisos, 2 solo PNTs | No        |
| media             | Array   | Lista de ID de Medios                                                       | Si        |
| start_date        | String  | Fecha de formato DD-MM-YYYY                                                 | Si        |
| end_date          | String  | Fecha de formato DD-MM-YYYY                                                 | Si        |
| brands            | Array   | Lista de ID de Marcas                                                       | No        |
| companies         | Array   | Lista de ID de Empresas                                                     | No        |
| industries        | Array   | Lista de ID de Rubros                                                       | No        |
| sub_industries    | Array   | Lista de ID de Sub-Rubros                                                   | No        |
| products          | Array   | Lista de ID de Productos                                                    | No        |
| categories        | Array   | Lista de ID de Categorias                                                   | No        |
| qualities         | Array   | Lista de ID de Calidades                                                    | No        |
| creative_agencies | Array   | Lista de ID de Agencias Creativas                                           | No        |
| media_agencies    | Array   | Lista de ID de Agencias de Medios                                           | No        |
| group             | Integer | ID Grupo                                                                    | No        |
| target            | Integer | ID Grupo Objetivo Rating                                                    | No        |

<aside class="warning-yellow">
Debe existir al menos un parámetro de los siguientes, para que los demas sean opcionales: 
<b>brands, companies, industries, sub_industries, products, categories, qualities, creative_agencies, media_agencies, group.</b>
</aside>

<aside class="warning-yellow">
Para <b>start_date y end_date</b>  existe un máximo de 31 dias
</aside>

### Atributos Respuesta

| Nombre | Tipo    | Descripción                |
| ------ | ------- | -------------------------- |
| ok     | Boolean | Verificador de respuesta   |
| result | Array   | Lista de objetos tipo Spot |

### Atributos Spot

| Nombre                 | Tipo    | Descripción                                                                                                                                                        |
| ---------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| ID                     | Integer | Identificador de Spot                                                                                                                                              |
| media                  | String  | Nombre del Medio donde fue encontrado                                                                                                                              |
| media_id               | Integer | ID Medio                                                                                                                                                           |
| date                   | String  | Fecha de aparición, en formato YYYY-MM-DD                                                                                                                          |
| support_id             | Integer | ID Soporte                                                                                                                                                         |
| support                | String  | Soporte                                                                                                                                                            |
| weekday                | String  | Día de la semana de su aparición                                                                                                                                   |
| supplement             | String  | Suplemento (Prensa)                                                                                                                                                |
| supplement_id          | Integer | ID Suplemento                                                                                                                                                      |
| advertisement          | String  | Aviso asocicado                                                                                                                                                    |
| advertisement_id       | Integer | ID Aviso                                                                                                                                                           |
| quality                | String  | Calidad del emisor                                                                                                                                                 |
| quality_short          | String  | Calidad abreviada                                                                                                                                                  |
| hour                   | String  | Hora de aparición en formato HH:MM:SS                                                                                                                              |
| real_duration          | Integer | Duración real de la aparición                                                                                                                                      |
| page                   | Integer | En caso de ser publicidad en papel, indica el número de la pagina                                                                                                  |
| size                   | Integer | En caso de ser publicidad en papel, indica el tamaño físico de la página                                                                                           |
| module                 | String  | En caso de ser publicidad en papel, indica el tipo de hoja                                                                                                         |
| element                | String  | En caso de publicidad vial, indica el elemento donde esta montada la publicidad                                                                                    |
| element_id             | Integer | ID Elemento                                                                                                                                                        |
| investment             | Integer | Inversión                                                                                                                                                          |
| brand_id               | Integer | ID Marca                                                                                                                                                           |
| brand                  | String  | Marca asociada al producto                                                                                                                                         |
| product_id             | Integer | ID Producto                                                                                                                                                        |
| product                | String  | Nombre del Producto asignado al aviso                                                                                                                              |
| company_id             | Integer | ID Empresa                                                                                                                                                         |
| company                | String  | Nombre de la Empresa asignada al aviso                                                                                                                             |
| industry_id            | Integer | ID Rubro                                                                                                                                                           |
| industry               | String  | Nombre del Rubro asignado al aviso                                                                                                                                 |
| sub_industry_id        | Integer | ID Sub-Rubro                                                                                                                                                       |
| sub_industry           | String  | Nombre del Sub-Rubro asignado al Rubro                                                                                                                             |
| universal_id           | Integer | Código universal                                                                                                                                                   |
| universal_program_id   | Integer | Código de programa universal                                                                                                                                       |
| ad_supplier_id         | Integer | ID Suplemento                                                                                                                                                      |
| ad_supplier            | String  | En caso de ser publicidad en papel, indica el nombre del suplemento                                                                                                |
| megatime_hour          | Integer | Hora megatime (Dias de 26 horas)                                                                                                                                   |
| channel_KANTAR         | Integer | ID Soporte de la empresa Time                                                                                                                                      |
| e_type_media           | Integer | ID Megatime para identificar el area de la verificacion                                                                                                            |
| section                | String  | En caso de ser publicidad en papel, indica en que sección de la página se encuentra                                                                                |
| section_id             | Integer | ID Sección                                                                                                                                                         |
| normal_duration        | Integer | Duración normal del aviso                                                                                                                                          |
| ad_group_location      | Integer | En caso de publicidad televisiva o radial, indica el número de la tanda publicitaria                                                                               |
| ad_group_spot_location | Integer | En caso de publicidad televisiva o radial, indica la posición en la tanda publicitaria                                                                             |
| ad_group_quantity      | Integer | En caso de publicidad televisiva o radial, indica la cantidad de spots en la tanda publicitaria                                                                    |
| schedule_id            | Integer | En caso de publicidad televisiva, indica el id el Horario                                                                                                          |
| schedule               | Integer | En caso de publicidad televisiva, descripción del Horario                                                                                                          |
| media_agency           | String  | Nombre de la Agencia de medios                                                                                                                                     |
| media_agency_id        | Integer | ID Agrencia de medios                                                                                                                                              |
| creative_agency        | String  | Nombre de la Agencia creativa                                                                                                                                      |
| creative_agency_id     | Integer | ID Agencia creativa                                                                                                                                                |
| category               | String  | Indica la categoria del Rubro                                                                                                                                      |
| category_id            | Integer | ID Categoria                                                                                                                                                       |
| ad_first_appearance    | String  | Primera aparición del aviso, en formato YYYY-MM-DD                                                                                                                 |
| failure                | String  | Descripción de falla                                                                                                                                               |
| failure_id             | Integer | ID Falla                                                                                                                                                           |
| is_sponsor             | String  | Indica si es auspicio                                                                                                                                              |
| location               | String  | En caso de Via pública, indica la dirección. En caso de Metro, indica el lugar donde se encuentra dentro de la estación                                            |
| location_id            | Integer | ID Ubicación                                                                                                                                                       |
| program                | String  | Para publicidad televisiva y radial indica el nombre del Programa                                                                                                  |
| program_id             | Integer | ID Programa                                                                                                                                                        |
| centimeter             | Integer | En caso de ser publicidad en papel, indica los centimetros que abarca                                                                                              |
| columns                | Integer | En caso de ser publicidad en papel, indica el número de columnas                                                                                                   |
| impressions            | Integer | En caso de ser publicidad en papel, indica el número de impresiones                                                                                                |
| station_id             | Integer | ID Estación de Metro                                                                                                                                               |
| station                | String  | En caso de publicidad en Metro, indica el nombre de la Estación                                                                                                    |
| code                   | String  | Codigo interno para identificación de multimedia                                                                                                                   |
| banner_URL             | String  | En caso de publicidad de Internet, indica la url del banner                                                                                                        |
| internet_campaign      | String  | En caso de publicidad de Internet, indica indica el nombre de su campaña                                                |
| rating                 | Float   | <b>(Opcional)</b> Solo se devuelve en caso de entregar un parámetro `target`. Indica el rating para el grupo objetivo                                              |
| options                | Array   | <b>(Opcional)</b> Solo se devuelve en caso de entregar un parámetro `group`. Lista de objetos `Clasificación`, indica las clasificacion y sus respectivas opciones |

### Atributos Clasificación

| Nombre     | Tipo   | Descripción                                                                                                                            |
| ---------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------- |
| classifier | Object | Objeto tipo `Clasificador`                                                                                                             |
| values     | Array  | Lista de objetos tipo `Opción` que pertenecen a `Clasificador`. Esto representa todas las opciones que se le asignar a un clasificador |

### Atributos Clasificación

| Nombre | Tipo    | Descripción         |
| ------ | ------- | ------------------- |
| ID     | Integer | ID Clasificador     |
| name   | String  | Nombre Clasificador |

### Atributos Opción

| Nombre | Tipo    | Descripción   |
| ------ | ------- | ------------- |
| ID     | Integer | ID Opción     |
| name   | String  | Nombre Opción |

## Obtener Verificador

```python
import requests

url = "datasuite.megatime.cl/verifier?media=1,2,3,4,5&start_date=10-03-2021&end_date=10-03-2021"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/verifier?media=1,2,3,4,5&start_date=10-03-2021&end_date=10-03-2021' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/verifier?media=1,2,3,4,5&start_date=10-03-2021&end_date=10-03-2021",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 737301110,
      "media": "TV Abierta",
      "media_id": 1,
      "date": "2021-03-10",
      "support_id": 1007,
      "support": "TVN",
      "weekday": "Jueves",
      "supplement": "SIN SUPLEMENTO",
      "supplement_id": 0,
      "advertisement": "FALABELLA,CMR ALIANZA DUNKIN,MARZO 40% DCTO.D DUNKIN APP",
      "advertisement_id": 567008,
      "quality": "VIDEO COLOR",
      "quality_short": "VC",
      "hour": "14:58:14",
      "real_duration": 20,
      "page": 0,
      "size": 0,
      "module": "",
      "element": "DESCONOCIDO",
      "element_id": 0,
      "investment": 4200000,
      "brad_id": 4986,
      "brand": "CMR FALABELLA",
      "product_id": 325170,
      "product": "FALABELLA,CMR ALIANZA DUNKIN",
      "company_id": 173,
      "company": "FALABELLA",
      "industry_id": 102,
      "industry": "TARJETAS DE CREDITO",
      "sub_industry_id": 10270,
      "sub_industry": "TARJETA DE CREDITO GRANDES TIENDAS",
      "universal_id": 383878,
      "universal_program_id": 80137,
      "ad_supplier_id": 0,
      "ad_supplier": "",
      "megatime_hour": 14,
      "channel_KANTAR": 4,
      "e_type_media": 1,
      "section": "SIN SECCION",
      "section_id": 0,
      "normal_duration": 20,
      "ad_group_location": 3,
      "ad_group_spot_location": 10,
      "ad_group_quantity": 13,
      "schedule_id": 3,
      "schedule": "Tarde",
      "media_agency": "IPG MEDIABRANDS CHILE",
      "media_agency_id": 516,
      "creative_agency": "IMAGINA",
      "creative_agency_id": 684,
      "category": "MERCADO FINANCIERO Y SEGUROS",
      "category_id": 10,
      "ad_first_appearance": "2021-03-01",
      "failure": "s/f",
      "failure_id": 0,
      "is_sponsor": true,
      "location": "",
      "location_id": 0,
      "program": "24 TARDE",
      "program_id": 1007078435,
      "centimeter": 0,
      "columns": 0,
      "impressions": 0,
      "station_id": 0,
      "station": "SIN ESTACION",
      "code": "",
      "banner_URL": "",
      "internet_campaign": ""
    }
  ]
}
```

> Ejemplo de retorno en formato JSON con error:

```json
{
  "ok": false,
  "error": "\"end_date\" is required"
}
```

Retorna una lista con todos los spots del día o intervalo indicado.

### Llamada HTTP

`GET datasuite.megatime.cl/verifier`

### Parámetros URL

| Nombre     | Tipo   | Descripción                 | Requerido |
| ---------- | ------ | --------------------------- | --------- |
| media      | Array  | Lista de ID de Medios       | Si        |
| start_date | String | Fecha de formato DD-MM-YYYY | Si        |
| end_date   | String | Fecha de formato DD-MM-YYYY | Si        |

<aside class="warning-yellow">
El intervalo de <b>start_date y end_date</b> tiene como máximo 31 dias 
</aside>

### Atributos Respuesta

| Nombre | Tipo    | Descripción                       |
| ------ | ------- | --------------------------------- |
| ok     | Boolean | Verificador de respuesta          |
| result | Array   | Lista de objetos tipo Verificador |

### Atributos Verificador

| Nombre                 | Tipo    | Descripción                                                                                                             |
| ---------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------- |
| ID                     | Integer | Identificador de Spot                                                                                                   |
| media                  | String  | Nombre del Medio donde fue encontrado                                                                                   |
| media_id               | Integer | ID Medio                                                                                                                |
| date                   | String  | Fecha de aparición, en formato YYYY-MM-DD                                                                               |
| support_id             | Integer | ID Soporte                                                                                                              |
| support                | String  | Soporte                                                                                                                 |
| weekday                | String  | Día de la semana de su aparición                                                                                        |
| supplement             | String  | Suplemento (Prensa)                                                                                                     |
| supplement_id          | Integer | ID Suplemento                                                                                                           |
| advertisement          | String  | Aviso asocicado                                                                                                         |
| advertisement_id       | Integer | ID Aviso                                                                                                                |
| quality                | String  | Calidad del emisor                                                                                                      |
| quality_short          | String  | Calidad abreviada                                                                                                       |
| hour                   | String  | Hora de aparición en formato HH:MM:SS                                                                                   |
| real_duration          | Integer | Duración real de la aparición                                                                                           |
| page                   | Integer | En caso de ser publicidad en papel, indica el número de la pagina                                                       |
| size                   | Integer | En caso de ser publicidad en papel, indica el tamaño físico de la página                                                |
| module                 | String  | En caso de ser publicidad en papel, indica el tipo de hoja                                                              |
| element                | String  | En caso de publicidad vial, indica el elemento donde esta montada la publicidad                                         |
| element_id             | Integer | ID Elemento                                                                                                             |
| investment             | Integer | Inversión                                                                                                               |
| brand_id               | Integer | ID Marca                                                                                                                |
| brand                  | String  | Marca asociada al producto                                                                                              |
| product_id             | Integer | ID Producto                                                                                                             |
| product                | String  | Nombre del Producto asignado al aviso                                                                                   |
| company_id             | Integer | ID Empresa                                                                                                              |
| company                | String  | Nombre de la Empresa asignada al aviso                                                                                  |
| industry_id            | Integer | ID Rubro                                                                                                                |
| industry               | String  | Nombre del Rubro asignado al aviso                                                                                      |
| sub_industry_id        | Integer | ID Sub-Rubro                                                                                                            |
| sub_industry           | String  | Nombre del Sub-Rubro asignado al Rubro                                                                                  |
| universal_id           | Integer | Código universal                                                                                                        |
| universal_program_id   | Integer | Código de programa universal                                                                                            |
| ad_supplier_id         | Integer | ID Suplemento                                                                                                           |
| ad_supplier            | String  | En caso de ser publicidad en papel, indica el nombre del suplemento                                                     |
| megatime_hour          | Integer | Hora megatime (Dias de 26 horas)                                                                                        |
| channel_KANTAR         | Integer | ID Soporte de la empresa Time                                                                                           |
| e_type_media           | Integer | ID Megatime para identificar el area de la verificacion                                                                 |
| section                | String  | En caso de ser publicidad en papel, indica en que sección de la página se encuentra                                     |
| section_id             | Integer | ID Sección                                                                                                              |
| normal_duration        | Integer | Duración normal del aviso                                                                                               |
| ad_group_location      | Integer | En caso de publicidad televisiva o radial, indica el número de la tanda publicitaria                                    |
| ad_group_spot_location | Integer | En caso de publicidad televisiva o radial, indica la posición en la tanda publicitaria                                  |
| ad_group_quantity      | Integer | En caso de publicidad televisiva o radial, indica la cantidad de spots en la tanda publicitaria                         |
| schedule_id            | Integer | En caso de publicidad televisiva, indica el id el Horario                                                               |
| schedule               | Integer | En caso de publicidad televisiva, descripción del Horario                                                               |
| media_agency           | String  | Nombre de la Agencia de medios                                                                                          |
| media_agency_id        | Integer | ID Agrencia de medios                                                                                                   |
| creative_agency        | String  | Nombre de la Agencia creativa                                                                                           |
| creative_agency_id     | Integer | ID Agencia creativa                                                                                                     |
| category               | String  | Indica la categoria del Rubro                                                                                           |
| category_id            | Integer | ID Categoria                                                                                                            |
| ad_first_appearance    | String  | Primera aparición del aviso, en formato YYYY-MM-DD                                                                      |
| failure                | String  | Descripción de falla                                                                                                    |
| failure_id             | Integer | ID Falla                                                                                                                |
| is_sponsor             | Boolean | Indica si es auspicio                                                                                                   |
| location               | String  | En caso de Via pública, indica la dirección. En caso de Metro, indica el lugar donde se encuentra dentro de la estación |
| location_id            | Integer | ID Ubicación                                                                                                            |
| program                | String  | Para publicidad televisiva y radial indica el nombre del Programa                                                       |
| program_id             | Integer | ID Programa                                                                                                             |
| centimeter             | Integer | En caso de ser publicidad en papel, indica los centimetros que abarca                                                   |
| columns                | Integer | En caso de ser publicidad en papel, indica el número de columnas                                                        |
| impressions            | Integer | En caso de ser publicidad en papel, indica el número de impresiones                                                     |
| station_id             | Integer | ID Estación de Metro                                                                                                    |
| station                | String  | En caso de publicidad en Metro, indica el nombre de la Estación                                                         |
| code                   | String  | Codigo interno para identificación de multimedia                                                                        |
| banner_URL             | String  | En caso de publicidad de Internet, indica la url del banner                                                             |
| internet_campaign      | String  | En caso de publicidad de Internet, indica indica el nombre de su campaña                                                |

## Obtener Avisos con actividad

```python
import requests

url = "datasuite.megatime.cl/advertisement?media=1,2,3,4,5,6,7,8&start_date=01-10-2021&end_date=31-10-2021&industries=1,2,3,4,5&brands=1,2,3,4,5&companies=1,2,3,4,5&sub_industries=1,2,3,4,5&products=1,2,3,4,5&group=1"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/advertisement?media=1,2,3,4,5,6,7,8&start_date=01-10-2021&end_date=31-10-2021&industries=1,2,3,4,5&brands=1,2,3,4,5&companies=1,2,3,4,5&sub_industries=1,2,3,4,5&products=1,2,3,4,5&group=1' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/advertisement?media=1,2,3,4,5,6,7,8&start_date=01-10-2021&end_date=31-10-2021&industries=1,2,3,4,5&brands=1,2,3,4,5&companies=1,2,3,4,5&sub_industries=1,2,3,4,5&products=1,2,3,4,5&group=1",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "media_id": 2,
      "media": "Prensa",
      "id": 1868567,
      "description": "ED,BAZAR ED,CYBERMONDAY,YA COMENZO,DEL 04 AL 06 DE OCTUBRE,(ED)",
      "first_appearance": "2021-10-04",
      "industry": "FERIAS Y EXPOSICIONES",
      "industry_id": 202,
      "sub_industry": "FERIA COMERCIAL",
      "sub_industry_id": 1483,
      "company": "MILANO EDITORES",
      "company_id": 2712,
      "brand": "ED",
      "brand_id": 7426,
      "product": "ED,BAZAR ED,CYBERMONDAY",
      "product_id": 321910
    }
  ]
}
```

Retorna una lista con todos los Avisos con actividad

### Llamada HTTP

`GET datasuite.megatime.cl/advertisement`

### Parámetros URL

| Nombre         | Tipo    | Descripción                 | Requerido |
| -------------- | ------- | --------------------------- | --------- |
| media          | Array   | Lista de ID de Medios       | Si        |
| start_date     | String  | Fecha de formato DD-MM-YYYY | Si        |
| end_date       | String  | Fecha de formato DD-MM-YYYY | Si        |
| brands         | Array   | Lista de ID de Marcas       | No        |
| companies      | Array   | Lista de ID de Empresas     | No        |
| industries     | Array   | Lista de ID de Rubros       | No        |
| sub_industries | Array   | Lista de ID de Sub-Rubros   | No        |
| products       | Array   | Lista de ID de Productos    | No        |
| group          | Integer | ID Grupo                    | No        |

### Atributos Respuesta

| Nombre | Tipo    | Descripción                   |
| ------ | ------- | ----------------------------- |
| ok     | Boolean | Verificador de respuesta      |
| result | Array   | Lista de objetos tipo `Aviso` |

### Atributos Aviso

| Nombre           | Tipo    | Descripción                            |
| ---------------- | ------- | -------------------------------------- |
| ID               | Integer | Identificador de Aviso                 |
| media            | String  | Nombre del Medio donde fue encontrado  |
| media_id         | Integer | ID Medio                               |
| description      | String  | Descripción Aviso                      |
| first_appearance | String  | Fecha de primera aparición             |
| industry         | String  | Nombre del Rubro asignado al aviso     |
| industry_id      | Integer | ID Rubro                               |
| sub_industry     | String  | Nombre SubRubro                        |
| sub_industry_id  | Integer | ID SubRubro                            |
| company          | String  | Nombre de la Empresa asignada al aviso |
| company_id       | Integer | ID Empresa                             |
| brand            | String  | Marca asociada al producto             |
| brand_id         | Integer | ID Marca                               |
| product          | String  | Nombre del Producto asignado al aviso  |
| product_id       | Integer | ID Producto                            |

| sub_industry_id | Integer | ID Sub-Rubro |
| sub_industry | String | Nombre del Sub-Rubro asignado al Rubro |

## Obtener Medios

```python
import requests

url = "datasuite.megatime.cl/filters/media"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/media' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/media",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 1,
      "name": "TV Abierta"
    }
  ]
}
```

Retorna una lista con todos los Medios.

### Llamada HTTP

`GET datasuite.megatime.cl/filters/media`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                   |
| ------ | ------- | ----------------------------- |
| ok     | Boolean | Verificador de respuesta      |
| result | Array   | Lista de objetos tipo `Medio` |

### Atributos Medio

| Nombre | Tipo    | Descripción |
| ------ | ------- | ----------- |
| ID     | Integer | ID          |
| name   | String  | Nombre      |

## Obtener Marcas

```python
import requests

url = "datasuite.megatime.cl/filters/brands"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/brands' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/brands",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 1,
      "name": "TARGET,SOFTWARE"
    }
  ]
}
```

Retorna una lista con todas las marcas

### Llamada HTTP

`GET datasuite.megatime.cl/filters/brands`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                 |
| ------ | ------- | --------------------------- |
| ok     | Boolean | Verificador de respuesta    |
| result | Array   | Lista de objetos tipo Marca |

### Atributos Marca

| Nombre | Tipo    | Descripción |
| ------ | ------- | ----------- |
| ID     | Integer | ID          |
| name   | String  | Nombre      |

## Obtener Empresas

```python
import requests

url = "datasuite.megatime.cl/filters/companies"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/companies' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/companies",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 28911,
      "name": "SALMONES MULTIEXPORT LTDA"
    }
  ]
}
```

Retorna una lista con todas las Empresas

### Llamada HTTP

`GET datasuite.megatime.cl/filters/companies`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                     |
| ------ | ------- | ------------------------------- |
| ok     | Boolean | Verificador de respuesta        |
| result | Array   | Lista de objetos tipo `Empresa` |

### Atributos Empresa

| Nombre | Tipo    | Descripción |
| ------ | ------- | ----------- |
| ID     | Integer | ID          |
| name   | String  | Nombre      |

## Obtener Rubros

```python
import requests

url = "datasuite.megatime.cl/filters/industries"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/industries' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/industries",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 1,
      "name": "PRODUCTOS PARA LA AGRICULTURA"
    }
  ]
}
```

Retorna una lista con todos los Rubros

### Llamada HTTP

`GET datasuite.megatime.cl/filters/industries`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                   |
| ------ | ------- | ----------------------------- |
| ok     | Boolean | Verificador de respuesta      |
| result | Array   | Lista de objetos tipo `Rubro` |

### Atributos Rubro

| Nombre | Tipo    | Descripción |
| ------ | ------- | ----------- |
| ID     | Integer | ID          |
| name   | String  | Nombre      |

## Obtener Sub-Rubros

```python
import requests

url = "datasuite.megatime.cl/filters/sub_industries"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/sub_industries' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/sub_industries",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 1,
      "name": "AVENA",
      "industry_id": 17
    }
  ]
}
```

Retorna una lista con todos los Sub-Rubros

### Llamada HTTP

`GET datasuite.megatime.cl/filters/sub_industries`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                       |
| ------ | ------- | --------------------------------- |
| ok     | Boolean | Verificador de respuesta          |
| result | Array   | Lista de objetos tipo `Sub-Rubro` |

### Atributos Sub-Rubro

| Nombre      | Tipo    | Descripción       |
| ----------- | ------- | ----------------- |
| ID          | Integer | ID                |
| name        | String  | Nombre            |
| industry_id | String  | ID Rubro asociado |

## Obtener Productos

```python
import requests

url = "datasuite.megatime.cl/filters/products"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/products' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/products",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 1,
      "name": "DEYCO,CONSERVAS",
      "company_id": 70,
      "brand_id": 6748,
      "sub_industry_id": 10130
    }
  ]
}
```

Retorna una lista con todos los Productos

### Llamada HTTP

`GET datasuite.megatime.cl/filters/products`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                      |
| ------ | ------- | -------------------------------- |
| ok     | Boolean | Verificador de respuesta         |
| result | Array   | Lista de objetos tipo `Producto` |

### Atributos Producto

| Nombre          | Tipo    | Descripción           |
| --------------- | ------- | --------------------- |
| ID              | Integer | ID                    |
| name            | String  | Nombre                |
| company_id      | Integer | ID Empresa asociada   |
| brand_id        | Integer | ID Marca asociada     |
| sub_industry_id | String  | ID Sub-Rubro asociado |

## Obtener Categorias

```python
import requests

url = "datasuite.megatime.cl/filters/categories"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/categories' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/categories",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 1,
      "name": "AGROPECUARIO"
    }
  ]
}
```

Retorna una lista con todas las Categorias

### Llamada HTTP

`GET datasuite.megatime.cl/filters/categories`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                        |
| ------ | ------- | ---------------------------------- |
| ok     | Boolean | Verificador de respuesta           |
| result | Array   | Lista de objetos tipo `Catergoria` |

### Atributos Categoria

| Nombre | Tipo    | Descripción |
| ------ | ------- | ----------- |
| ID     | Integer | ID          |
| name   | String  | Nombre      |

## Obtener Calidades

```python
import requests

url = "datasuite.megatime.cl/filters/qualities"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/qualities' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/qualities",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 11,
      "name": "VIDEO COLOR",
      "short": "VC",
      "media_id": 1
    }
  ]
}
```

Retorna una lista con todas las Calidades

### Llamada HTTP

`GET datasuite.megatime.cl/filters/qualities`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                     |
| ------ | ------- | ------------------------------- |
| ok     | Boolean | Verificador de respuesta        |
| result | Array   | Lista de objetos tipo `Calidad` |

### Atributos Calidad

| Nombre   | Tipo    | Descripción |
| -------- | ------- | ----------- |
| ID       | Integer | ID          |
| name     | String  | Nombre      |
| short    | String  | Abreviación |
| medio_id | String  | ID Medio    |

## Obtener Agencias Creativas

```python
import requests

url = "datasuite.megatime.cl/filters/creativeagencies"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/creativeagencies' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/creativeagencies",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 1,
      "name": "BBDO",
      "short": "BBDO"
    }
  ]
}
```

Retorna una lista con todas las Agencias Creativas

### Llamada HTTP

`GET datasuite.megatime.cl/filters/creativeagencies`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                              |
| ------ | ------- | ---------------------------------------- |
| ok     | Boolean | Verificador de respuesta                 |
| result | Array   | Lista de objetos tipo `Agencia Creativa` |

### Atributos Agencias Creativa

| Nombre | Tipo    | Descripción |
| ------ | ------- | ----------- |
| ID     | Integer | ID          |
| name   | String  | Nombre      |
| short  | String  | Abreviación |

## Obtener Agencias de Medios

```python
import requests

url = "datasuite.megatime.cl/filters/mediaagencies"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/mediaagencies' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/mediaagencies",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 1,
      "name": "BBDO",
      "short": "BBDO"
    }
  ]
}
```

Retorna una lista con todas las Agencias de Medios

### Llamada HTTP

`GET datasuite.megatime.cl/filters/mediaagencies`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                               |
| ------ | ------- | ----------------------------------------- |
| ok     | Boolean | Verificador de respuesta                  |
| result | Array   | Lista de objetos tipo `Agencia de Medios` |

### Atributos Agencias de Medios

| Nombre | Tipo    | Descripción |
| ------ | ------- | ----------- |
| ID     | Integer | ID          |
| name   | String  | Nombre      |
| short  | String  | Abreviación |

## Obtener Grupos personalizados

```python
import requests

url = "datasuite.megatime.cl/filters/groups"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/groups' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/groups",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 3,
      "name": "Bancos",
      "obs": ""
    }
  ]
}
```

Retorna una lista con todos los Grupos personalizados por el cliente

### Llamada HTTP

`GET datasuite.megatime.cl/filters/groups`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                   |
| ------ | ------- | ----------------------------- |
| ok     | Boolean | Verificador de respuesta      |
| result | Array   | Lista de objetos tipo `Grupo` |

### Atributos Grupo

| Nombre | Tipo    | Descripción |
| ------ | ------- | ----------- |
| ID     | Integer | ID          |
| name   | String  | Nombre      |
| obs    | String  | Observación |

## Crear Grupo personalizado

```python
import requests
import json

url = "datasuite.megatime.cl/filters/groups"

payload = json.dumps({
  "name": "Test nuevo grupo",
  "obs": "Observacion",
  "brands": [
    24,
    42
  ]
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request POST 'datasuite.megatime.cl/filters/groups' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Test New Group",
    "obs": "Observacion",
    "brands": [24,42]
}'
```

```javascript
var request = require("request");
var options = {
  method: "POST",
  url: "datasuite.megatime.cl/filters/groups",
  headers: {
    Authorization: "SECRET_API_KEY",
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    name: "Test New Group",
    obs: "Observacion",
    brands: [24, 42],
  }),
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "ID": 64,
  "message": "Grupo creado correctamente"
}
```

Request para crear un nuevo Grupo Personalizado, responde con el ID del nuevo grupo.

Para asignar `Clasificadores y Opciones`, debe dirigirse a [clasificador.megatime.cl](https://clasificador.megatime.cl)

### Llamada HTTP

`POST datasuite.megatime.cl/filters/groups`

### Párametros Body

| Nombre | Tipo   | Descripción                                        | Requerido |
| ------ | ------ | -------------------------------------------------- | --------- |
| name   | String | Nombre de grupo                                    | Si        |
| obs    | String | Observación                                        | No        |
| brands | Array  | Lista de IDs de marcas para asignar al nuevo grupo | Si        |

### Atributos Respuesta

| Nombre  | Tipo    | Descripción              |
| ------- | ------- | ------------------------ |
| ok      | Boolean | Verificador de respuesta |
| ID      | Integer | ID grupo creado          |
| message | String  | Mensaje de estado        |

## Obtener Grupos Objetivos Rating

`GET datasuite.megatime.cl/filters/targets`

```python
import requests

url = "datasuite.megatime.cl/filters/targets"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/targets' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/targets",
  headers: {
    Authorization: "SECRET_API_KEY",
  },
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
  "ok": true,
  "result": [
    {
      "ID": 16,
      "name": "DDC ABCD\r\n"
    }
  ]
}
```

Retorna una lista con todos los Grupos Objetivos Rating

### Llamada HTTP

`GET datasuite.megatime.cl/filters/targets`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                                   |
| ------ | ------- | --------------------------------------------- |
| ok     | Boolean | Verificador de respuesta                      |
| result | Array   | Lista de objetos tipo `Grupo Objetivo Rating` |

### Atributos Grupo Objetivo Rating

| Nombre | Tipo    | Descripción |
| ------ | ------- | ----------- |
| ID     | Integer | ID          |
| name   | String  | Nombre      |

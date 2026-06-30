# DataSuite

DataSuite es la API de Megatime para consultar pauta publicitaria, avisos, filtros y datos relacionados.

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
  "key": "71e1db8n090am63ca69606c4slb8b6ta"
}
```

Retorna key que permite el acceso a la API.

### Llamada HTTP

<span style="color: rgb(170, 117, 28);"> **POST**</span> `cuenta.megatime.cl/api/auth/key`

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

url = "datasuite.megatime.cl/v2/spots?media=1&date=10-03-2021&brands=1,2,3,4,5&companies=1,2,3,4,5&industries=1,2,3,4,5&sub_industries=1,2,3,4,5&products=1,2,3,4,5&categories=1,2,3,4,5&qualities=1,2,3,4,5&creative_agencies=1,2,3,4,5&media_agencies=1,2,3,4,5&supports=1,2,3,4,5&group=1"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/v2/spots?media=1&date=10-03-2021&brands=1,2,3,4,5&companies=1,2,3,4,5&industries=1,2,3,4,5&sub_industries=1,2,3,4,5&products=1,2,3,4,5&categories=1,2,3,4,5&qualities=1,2,3,4,5&creative_agencies=1,2,3,4,5&media_agencies=1,2,3,4,5&supports=1,2,3,4,5&group=1' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/v2/spots?media=1&date=10-03-2021&brands=1,2,3,4,5&companies=1,2,3,4,5&industries=1,2,3,4,5&sub_industries=1,2,3,4,5&products=1,2,3,4,5&categories=1,2,3,4,5&qualities=1,2,3,4,5&creative_agencies=1,2,3,4,5&media_agencies=1,2,3,4,5&supports=1,2,3,4,5&group=1",
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
      "media_id": 1,
      "media": "TV Abierta",
      "date": "02-02-2022",
      "hour": 15,
      "minute": 31,
      "second": 35,
      "weekday": "Jueves",
      "daypart": "Tarde",
      "program_id": 83052,
      "program_name": "MEA CULPA CLASICOS",
      "schedule_id": 1001,
      "schedule_name": "Tarde",
      "ad_first_appearance": "10-01-2022",
      "support_id": 1007,
      "support": "TVN",
      "advertisement_id": 597715,
      "advertisement": "LIDER,SUPERMERCADO,MUJER,COMPRANDO,PARRILLEANDO",
      "product_id": 98833,
      "product": "LIDER,SUPERMERCADO",
      "brand_id": 14000,
      "brand": "LIDER",
      "company_id": 47484,
      "company": "WALMART CHILE",
      "sub_industry_id": 5973,
      "sub_industry": "SUPERMERCADO",
      "industry_id": 222,
      "industry": "SUPER E HIPERMERCADOS",
      "category_id": 21,
      "category": "COMERCIO DETALLISTA",
      "quality_id": 11,
      "quality": "VIDEO COLOR",
      "duration": 21,
      "ad_duration": 21,
      "value": 2867059,
      "public_value": 1879488,
      "universal_id": 0,
      "universal_program_id": 83052,
      "ad_supplier": "",
      "ad_group_location": 7,
      "ad_group_spot_location": 14,
      "ad_group_quantity": 16,
      "failure": "s/f",
      "is_sponsor": false,
      "program": "MEA CULPA CLASICOS",
      "event": "Apoyo",
      "event_id": "A",
      "press_centimeter": 0,
      "press_column": 0,
      "press_page": 0,
      "press_size": 0,
      "press_module": "",
      "press_supplement_id": 0,
      "press_supplement": "",
      "press_section_id": 0,
      "press_section": "",
      "vp_location_id": 0,
      "vp_element_id": 0,
      "commune_id": 0,
      "commune": "",
      "ooh_element": "DESCONOCIDO",
      "ooh_station": "",
      "ooh_location": "",
      "metro_location_id": 0,
      "metro_element_id": 0,
      "station_id": 0,
      "internet_banner_id": 0,
      "internet_impressions": 0,
      "internet_campaign": "",
      "campaign_id": 0,
      "internet_device": "",
      "internet_impact": "0",
      "media_agency_id": 454,
      "media_agency": "OMG",
      "creative_agency_id": 1,
      "creative_agency": "BBDO",
      "uuid": "0x6c5de827c6dc28e1e5056e8d5e7f79d9"
    }
  ]
}
```

Retorna una lista de avisajes para una fecha y medio específico.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/v2/spots`

### Parámetros URL

| Nombre            | Tipo    | Descripción                                                                      | Requerido |
| ----------------- | ------- | -------------------------------------------------------------------------------- | --------- |
| include           | Integer | <b>(Por defecto: 0)</b> 0 incluir Avisos y PNTs, 1 solo Avisos, 2 solo PNTs, 3 Todos los eventos | No        |
| media             | Integer | ID de Medio                                                                      | Si        |
| date              | String  | Fecha de formato dd-mm-yyyy                                                      | Si        |
| brands            | Array   | Lista de ID de Marcas                                                            | No        |
| companies         | Array   | Lista de ID de Empresas                                                          | No        |
| industries        | Array   | Lista de ID de Rubros                                                            | No        |
| sub_industries    | Array   | Lista de ID de Sub-Rubros                                                        | No        |
| products          | Array   | Lista de ID de Productos                                                         | No        |
| categories        | Array   | Lista de ID de Categorias                                                        | No        |
| qualities         | Array   | Lista de ID de Calidades                                                         | No        |
| creative_agencies | Array   | Lista de ID de Agencias Creativas                                                | No        |
| media_agencies    | Array   | Lista de ID de Agencias de Medios                                                | No        |
| supports          | Array   | Lista de ID de Soportes                                                          | No        |
| group             | Integer | ID Grupo                                                                         | No        |

### Atributos Respuesta

| Nombre | Tipo    | Descripción                |
| ------ | ------- | -------------------------- |
| ok     | Boolean | Verificador de respuesta   |
| result | Array   | Lista de objetos tipo Spot |

### Nuevos Atributos Spot

Atributos adicionales del spot:

| Nombre                 | Tipo    | Descripción                                                     |
| ---------------------- | ------- | --------------------------------------------------------------- |
| program_id             | Integer | ID del programa (TV/Cable/Radio)                               |
| program_name           | String  | Nombre del programa (TV/Cable)                                 |
| schedule_id            | Integer | ID del horario (TV/Cable)                                      |
| schedule_name          | String  | Nombre del horario/franja (TV/Cable)                           |
| event_id               | String  | ID del evento (A=Aviso, U=Auspicio)                            |
| vp_location_id         | Integer | ID ubicación vía pública                                       |
| vp_element_id          | Integer | ID elemento vía pública                                        |
| commune_id             | Integer | ID comuna (vía pública)                                        |
| commune                | String  | Nombre comuna (vía pública)                                    |
| metro_location_id      | Integer | ID ubicación metro                                             |
| metro_element_id       | Integer | ID elemento metro                                              |
| station_id             | Integer | ID estación (metro)                                            |
| internet_banner_id     | Integer | ID banner (internet)                                           |
| campaign_id            | Integer | ID campaña (internet)                                          |

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
      "product_id": 321910,
      "spot_uuid": "0xebf0e4909cc81815f05c114998db7f28"
    }
  ]
}
```

Retorna una lista con todos los Avisos con actividad

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/advertisement`

### Parámetros URL

| Nombre         | Tipo    | Descripción                 | Requerido |
| -------------- | ------- | --------------------------- | --------- |
| media          | Array   | Lista de ID de Medios       | Si        |
| start_date     | String  | Fecha de formato dd-mm-yyyy | Si        |
| end_date       | String  | Fecha de formato dd-mm-yyyy | Si        |
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
| sub_industry_id  | Integer | ID Sub-Rubro                           |
| sub_industry     | String  | Nombre del Sub-Rubro asignado al Rubro |
| spot_uuid        | String  | Identificador único del Avisaje        |

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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/media`

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

url = "datasuite.megatime.cl/filters/brands?start_date=02-04-2022&end_date=08-06-2022&media=1,2,3&industries=1,2,3&sub_industries=1,2,3&companies=1,2,3&categories=1,2,3"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/brands?start_date=02-04-2022&end_date=08-06-2022&media=1,2,3&industries=1,2,3&sub_industries=1,2,3&companies=1,2,3&categories=1,2,3' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/brands?start_date=02-04-2022&end_date=08-06-2022&media=1,2,3&industries=1,2,3&sub_industries=1,2,3&companies=1,2,3&categories=1,2,3",
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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/brands`

<aside class="notice">
Todos los Parámetros URL son opcionales, pero si se quiere utilizar alguno, <strong>start_date</strong> y <strong>end_date</strong> son requeridos.
</aside>

### Parámetros URL

| Nombre         | Tipo   | Descripción                 |
| -------------- | ------ | --------------------------- |
| start_date     | String | Fecha de formato dd-mm-yyyy |
| end_date       | String | Fecha de formato dd-mm-yyyy |
| industries     | Array  | Lista de ID de Rubros       |
| media          | Array  | Lista de ID de Medios       |
| sub_industries | Array  | Lista de ID de Sub-Rubros   |
| companies      | Array  | Lista de ID de Empresas     |
| categories     | Array  | Lista de ID de Categorias   |

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

url = "datasuite.megatime.cl/filters/companies?start_date=01-03-2022&end_date=07-06-2022&media=1,2,3&industries=1,2,3&sub_industries=1,2,3&categories=1,2,3"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/companies?start_date=01-03-2022&end_date=07-06-2022&media=1,2,3&industries=1,2,3&sub_industries=1,2,3&categories=1,2,3' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/companies?start_date=01-03-2022&end_date=07-06-2022&media=1,2,3&industries=1,2,3&sub_industries=1,2,3&categories=1,2,3",
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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/companies`

<aside class="notice">
Todos los Parámetros URL son opcionales, pero si se quiere utilizar alguno, <strong>start_date</strong> y <strong>end_date</strong> son requeridos.
</aside>

### Parámetros URL

| Nombre         | Tipo   | Descripción                 |
| -------------- | ------ | --------------------------- |
| start_date     | String | Fecha de formato dd-mm-yyyy |
| end_date       | String | Fecha de formato dd-mm-yyyy |
| industries     | Array  | Lista de ID de Rubros       |
| media          | Array  | Lista de ID de Medios       |
| sub_industries | Array  | Lista de ID de Sub-Rubros   |
| categories     | Array  | Lista de ID de Categorias   |

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

url = "datasuite.megatime.cl/filters/industries?start_date=01-04-2022&end_date=07-06-2022&categories=1,2,3&media=1,2,3"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/industries?start_date=01-04-2022&end_date=07-06-2022&categories=1,2,3&media=1,2,3' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/industries?start_date=01-04-2022&end_date=07-06-2022&categories=1,2,3&media=1,2,3",
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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/industries`

<aside class="notice">
Todos los Parámetros URL son opcionales, pero si se quiere utilizar alguno, <strong>start_date</strong> y <strong>end_date</strong> son requeridos.
</aside>

### Parámetros URL

| Nombre     | Tipo   | Descripción                 |
| ---------- | ------ | --------------------------- |
| start_date | String | Fecha de formato dd-mm-yyyy |
| end_date   | String | Fecha de formato dd-mm-yyyy |
| media      | Array  | Lista de ID de Medios       |
| categories | Array  | Lista de ID de Categorias   |

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

url = "datasuite.megatime.cl/filters/subindustries?start_date=01-04-2022&end_date=07-06-2022&categories=1,2,3&media=1,2,3&companies=1,2,3"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/subindustries?start_date=01-04-2022&end_date=07-06-2022&categories=1,2,3&media=1,2,3&companies=1,2,3' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/subindustries?start_date=01-04-2022&end_date=07-06-2022&categories=1,2,3&media=1,2,3&companies=1,2,3",
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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/subindustries`

<aside class="notice">
Todos los Parámetros URL son opcionales, pero si se quiere utilizar alguno, <strong>start_date</strong> y <strong>end_date</strong> son requeridos.
</aside>

### Parámetros URL

| Nombre     | Tipo   | Descripción                 |
| ---------- | ------ | --------------------------- |
| start_date | String | Fecha de formato dd-mm-yyyy |
| end_date   | String | Fecha de formato dd-mm-yyyy |
| media      | Array  | Lista de ID de Medios       |
| categories | Array  | Lista de ID de Categorias   |
| companies  | Arrat  | Lista de ID de Empresas     |

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

url = "datasuite.megatime.cl/filters/products?brands=1,2,3&media=1,2,3&start_date=01-01-2021&end_date=12-07-2022&companies=1,2,3&sub_industries=1,2,3&categories=1,2,3&industries=1,2,3"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/products?brands=1,2,3&media=1,2,3&start_date=01-01-2021&end_date=12-07-2022&companies=1,2,3&sub_industries=1,2,3&categories=1,2,3&industries=1,2,3' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/products?brands=1,2,3&media=1,2,3&start_date=01-01-2021&end_date=12-07-2022&companies=1,2,3&sub_industries=1,2,3&categories=1,2,3&industries=1,2,3",
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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/products`

<aside class="notice">
Todos los Parámetros URL son opcionales, pero si se quiere utilizar alguno, <strong>start_date</strong> y <strong>end_date</strong> son requeridos.
</aside>

### Parámetros URL

| Nombre         | Tipo   | Descripción                 |
| -------------- | ------ | --------------------------- |
| start_date     | String | Fecha de formato dd-mm-yyyy |
| end_date       | String | Fecha de formato dd-mm-yyyy |
| industries     | Array  | Lista de ID de Rubros       |
| media          | Array  | Lista de ID de Medios       |
| sub_industries | Array  | Lista de ID de Sub-Rubros   |
| categories     | Array  | Lista de ID de Categorias   |
| companies      | Array  | Lista de ID de Empresas     |
| brands         | Array  | Lista de ID de Marcas       |

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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/categories`

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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/qualities`

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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/creativeagencies`

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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/mediaagencies`

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

## Obtener Soportes

```python
import requests

url = "datasuite.megatime.cl/filters/supports"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/filters/supports' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/filters/supports",
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
      "short": "BBDO",
      "media_id": 1
    }
  ]
}
```

Retorna una lista con todas las Agencias de Medios

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/supports`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                      |
| ------ | ------- | -------------------------------- |
| ok     | Boolean | Verificador de respuesta         |
| result | Array   | Lista de objetos tipo `Soportes` |

### Atributos Agencias de Medios

| Nombre   | Tipo    | Descripción |
| -------- | ------- | ----------- |
| ID       | Integer | ID          |
| name     | String  | Nombre      |
| short    | String  | Abreviación |
| media_id | String  | ID Medio    |

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

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/filters/groups`

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

<span style="color: rgb(170, 117, 28);"> **POST**</span> `datasuite.megatime.cl/filters/groups`

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

## Obtener Registro Cargas

```python
import requests

url = "datasuite.megatime.cl/v2/spots/loads?date=17-02-2022T16:41:10:240&media=1,6"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'datasuite.megatime.cl/v2/spots/loads?date=17-02-2022T16:41:10:240&media=1,6' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "datasuite.megatime.cl/v2/spots/loads?date=17-02-2022T16:41:10:240&media=1,6",
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
      "media_id": 1,
      "date": "17-03-2022",
      "rows": 7345,
      "upload_datetime": "18-03-2022T09:08:58:387"
    },
    {
      "media_id": 6,
      "date": "22-01-2021",
      "rows": 21830,
      "upload_datetime": "17-03-2022T22:22:58:750"
    }
  ]
}
```

Retorna una lista de las últimas publicaciones de registros con fecha y medio

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `datasuite.megatime.cl/v2/spots/loads`

### Parámetros URL

| Nombre | Requerido | Descripción                                                                                                                          |
| ------ | --------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| date   | No        | Filtro de Fecha-Tiempo en formato dd-mm-yyyyThh:mi:ss:mmm. Permite mostrar sólo publicaciones de cargas mayores a la fecha ingresada |
| media  | No        | Lista de ID de Medios                                                                                                                |

### Atributos Respuesta

| Nombre | Tipo    | Descripción                   |
| ------ | ------- | ----------------------------- |
| ok     | Boolean | Verificador de respuesta      |
| result | Array   | Lista de objetos tipo `Carga` |

### Atributos Carga

| Nombre          | Tipo    | Descripción                                                         |
| --------------- | ------- | ------------------------------------------------------------------- |
| medio_id        | Integer | ID del medio                                                        |
| date            | String  | Fecha del día publicado en formato dd-mm-yyyy                       |
| rows            | Integer | Cantidad de registros en fecha - medio                              |
| upload_datetime | String  | Fecha de publicación de la carga en formato dd-mm-yyyyThh:mi:ss:mmm |
# Spot Data

## Obtener Pauta

```python
import requests
import json

url = "spots.megatime.cl"

payload = json.dumps({
  "include": 0,
  "media": [ 1, 2, 3, 4 ],
  "startDate": "10-03-2021",
  "endDate": "10-03-2021",
  "brands": [ 1, 2, 3, 4 ],
  "companies": [ 1, 2, 3, 4 ],
  "industries": [ 1, 2, 3, 4 ],
  "subIndustries": [ 1, 2, 3, 4 ],
  "products": [ 1, 2, 3, 4 ],
  "group": 60,
  "target": 20
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```


```shell
curl --location --request POST 'spots.megatime.cl' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "include": 0,
    "media": [1,2,3,4],
    "startDate": "10-03-2021",
    "endDate": "10-03-2021",
    "brands": [1,2,3,4],
    "companies": [1,2,3,4],
    "industries": [ 1, 2, 3, 4 ],
    "subIndustries": [1,2,3,4],
    "products": [1,2,3,4],
    "group": 60,
    "target": 20
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'spots.megatime.cl',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "include": 0,
    "media": [ 1, 2, 3, 4 ],
    "startDate": "10-03-2021",
    "endDate": "10-03-2021",
    "brands": [ 1, 2, 3, 4 ],
    "companies": [ 1, 2, 3, 4 ],
    "industries": [ 1, 2, 3, 4 ],
    "subIndustries": [ 1, 2, 3, 4 ],
    "products": [ 1, 2, 3, 4 ],
    "group": 60,
    "target": 20
  })

};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

> Ejemplo de retorno en formato JSON:

```json
{
   "ok":true,
   "result":[
      {
         "ID":737301110,
         "media":"TV Abierta",
         "media_id":1,
         "date":"2021-03-10T00:00:00.000Z",
         "support_id":1007,
         "support":"TVN",
         "weekday":"Jueves",
         "supplement":"SIN SUPLEMENTO",
         "supplement_id":0,
         "advertisement":"FALABELLA,CMR ALIANZA DUNKIN,MARZO 40% DCTO.D DUNKIN APP",
         "advertisement_id":567008,
         "quality":"VIDEO COLOR",
         "quality_short":"VC",
         "hour":"14:58:14",
         "real_duration":20,
         "page":0,
         "size":0,
         "module":"",
         "element":"DESCONOCIDO",
         "element_id":0,
         "investment":4200000,
         "brad_id":4986,
         "brand":"CMR FALABELLA",
         "product_id":325170,
         "product":"FALABELLA,CMR ALIANZA DUNKIN",
         "company_id":173,
         "company":"FALABELLA",
         "industry_id":102,
         "industry":"TARJETAS DE CREDITO",
         "sub_industry_id":10270,
         "sub_industry":"TARJETA DE CREDITO GRANDES TIENDAS",
         "universal_id":383878,
         "universal_program_id":80137,
         "ad_supplier_id":0,
         "ad_supplier":"",
         "megatime_hour":14,
         "chanel_TIME":4,
         "e_type_media":1,
         "section":"SIN SECCION",
         "section_id":0,
         "normal_duration":20,
         "round_number":3,
         "round_location":10,
         "spots_in_round":13,
         "schedule_id":3,
         "schedule":"Tarde",
         "media_agency":"IPG MEDIABRANDS CHILE",
         "media_agency_id":516,
         "creative_agency":"IMAGINA",
         "creative_agency_id":684,
         "category":"MERCADO FINANCIERO Y SEGUROS",
         "category_id":10,
         "first_apparition":"2021-03-01T00:00:00.000Z",
         "failure":"s/f",
         "failure_id":0,
         "auspice":"",
         "location":"",
         "location_id":0,
         "program":"24 TARDE",
         "program_id":1007078435,
         "centimeter":0,
         "columns":0,
         "impressions":0,
         "station_id":0,
         "station":"SIN ESTACION",
         "code":"",
         "banner_URL":"",
         "rating":2.3094840049743652,
         "options":[
            {
               "classifier":{
                  "ID":22,
                  "name":"Beneficio "
               },
               "values":[
                  {
                     "ID":61,
                     "name":"Club"
                  },
                  {
                     "ID":65,
                     "name":"Alianzaa"
                  }
               ]
            },
            {
               "classifier":{
                  "ID":32,
                  "name":"BU"
               },
               "values":[
                  {
                     "ID":174,
                     "name":"CORPORATE"
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
   "error": "\"value\" must contain at least one of [brands, companies, industries, subIndustries, products, group]"
}
```

Retorna una lista de spots asociados a los filtros que se indique.

### Llamada HTTP

`POST spots.megatime.cl`


### Parámetros Body
| Nombre   | Tipo   | Descripción                                  | Requerido |
| -------- | ------ | -------------------------------------------- | --------- |
| inclute | Integer | Correo asociado a credencial de Megatime | Sí |
| media | Array | Lista de ID de Medios | Si |
| startDate | String | Fecha de formato DD-MM-YYYY | Si |
| endDate | String | Fecha de formato DD-MM-YYYY | Si |
| brands | Array | Lista de ID de Marcas | No |
| companies | Array | Lista de ID de Empresas | No |
| industries | Array | Lista de ID de Rubros | No |
| subIndustries | Array | Lista de ID de Sub-Rubros | No |
| products | Array | Lista de ID de Productos | No |
| group | Integer | ID grupo clasificador | No |
| target | Integer | ID grupo objectivo | No |

Debe exisiir al menos un parametro de los siguientes, para que los demas sean opcionales: `brands, companies, industries, subIndustries, products, group`

Para `startDate y endDate` existe un máximo de 31 dias

### Atributos Respuesta

| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo Spot |


### Atributos Spot

| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ID | Integer | Identificador de Spot |
| media | String | Nombre del Medio donde fue encontrado |
| media_id | Integer | ID Medio |
| date | String | Fecha de aparición, en formato YYYY-MM-DD |
| support_id | Integer | ID Soporte |
| support | String | Soporte |
| weekday | String | Dia de la semana de su aparición |
| supplement | String | Suplemento (Prensa) |
| supplement_id | Integer | ID Suplemento |
| advertisement | String | Aviso asocicado |
| advertisement_id | Integer | ID Aviso |
| quality | String | Calidad del emisor |
| quality_short | String | Calidad abreviada |
| hour | String | Hora de aparición en formato HH:MM:SS |
| real_duration | Integer | Duración real de la aparición |
| page | Integer | En caso de ser publicidad en papel, indica el numero de la pagina |
| size | Integer | En caso de ser publicidad en papel, indica el tamaño físico de la página |
| module | String | En caso de ser publicidad en papel, indica el tipo de hoja |
| element | String | En caso de publicidad vial, indica el elemento donde esta montada la publicidad |
| element_id | Integer | ID Elemento |
| investment | Integer | Inversión |
| brand_id | Integer | ID Marca |
| brand | String | Marca asociada al producto |
| product_id | Integer | ID Producto |
| product | String | Nombre del Producto asignado al aviso |
| company_id | Integer | ID Empresa |
| company | String | Nombre de la Empresa asignada al aviso |
| industry_id | Integer | ID Rubro |
| industry | String | Nombre del Rubro asignado al aviso |
| sub_industry_id | Integer | ID Sub-Rubro |
| sub_industry | String | Nombre del Sub-Rubro asignado al Rubro |
| universal_id | Integer | Código universal |
| universal_program_id | Integer | Código de programa universal |
| ad_supplier_id | Integer | ID Suplemento |
| ad_supplier | String | En caso de ser publicidad en papel, indica el nombre del suplemento |
| megatime_hour | Integer | Hora megatime (Dias de 26 horas) |
| chanel_TIME | Integer | ID Soporte de la empresa Time  |
| e_type_media | Integer | ID Megatime para diferenciar tipo de avisos |
| section | String | En caso de ser publicidad en papel, indica en que sección de la página se encuentra |
| section_id | Integer | ID Sección |
| normal_duration | Integer | Duración normal del aviso |
| round_number | Integer | En caso de publicidad televisiva o radial, indica el numero de la tanda publicitaria |
| round_location | Integer | En caso de publicidad televisiva o radial, indica la posición en la tanda publicitaria |
| spots_in_round | Integer | En caso de publicidad televisiva o radial, indica la cantidad de spot en la tanda publicitaria |
| schedule_id | Integer | En caso de publicidad televisiva, indica el id el Horario  |
| schedule | Integer | En caso de publicidad televisiva, descripcion del Horario |
| media_agency | String | Nombre de la Agencia de medios |
| media_agency_id | Integer | ID Agrencia de medios |
| creative_agency | String | Nombre de la Agencia creativa |
| creative_agency_id | Integer | ID Agencia creativa |
| category | String | Indica la categoria del Rubro |
| category_id | Integer | ID Categoria |
| first_apparition | String | Primera aparición del aviso, en formato YYYY-MM-DD |
| failure | String | Descripción de falla |
| failure_id | Integer | ID Falla |
| auspice | String | 'X' en caso de ser un auspicio  |
| location | String | En caso de Via pública, indica la dirección. En caso de Metro, indica el lugar donde se encuentra dentro de la estación |
| location_id | Integer | ID Ubicación |
| program | String | Para publicidad televisiva y radial indica el nombre del Programa |
| program_id | Integer | ID Programa |
| centimeter | Integer | En caso de ser publicidad en papel, indica los centimetros que abarca  |
| columns | Integer | En caso de ser publicidad en papel, indica el número de columnas |
| impressions | Integer | En caso de ser publicidad en papel, indica el numero de impresiones |
| station_id | Integer | ID Estación de Metro |
| station | String | En caso de publicidad en Metro, indica el nombre de la Estación |
| code | String | Codigo interno para identificación de multimedia |
| banner_URL | String | En caso de publicidad de Internet, indica la url del banner |
| rating | Float | (Opcional) Solo se devuelve en caso de entregar un parámetro `target`. Indica el rating para el grupo objetivo |
| options | Array | (Opcional) Solo se devuelve en caso de entregar un parámetro `group`. Lista de objetos `Clasificación`, indica las clasificacion y sus respectivas opciones|


### Atributos Clasificación

| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| classifier | Object | Objeto tipo `Clasificador` |
| values | Array | Lista de objetos tipo `Opción` que pertenecen a `Clasificador`. Esto representa todas las opciones que se le asignar a un clasificador |


### Atributos Clasificación

| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ID | Integer | ID Clasificador |
| name | String | Nombre Clasificador |


### Atributos Opción

| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ID | Integer | ID Opción |
| name | String | Nombre Opción |


## Obtener Verificador


```python
import requests
import json

url = "spots.megatime.cl/verifier"

payload = json.dumps({
  "media": [ 1, 2, 3, 4, 5, 6, 7, 8 ],
  "startDate": "10-03-2021",
  "endDate": "11-03-2021"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```


```shell
curl --location --request POST 'spots.megatime.cl/verifier' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "media": [1,2,3,4,5,6,7,8],
    "startDate": "10-03-2021",
    "endDate": "11-03-2021"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'spots.megatime.cl/verifier',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "media": [ 1, 2, 3, 4, 5, 6, 7, 8 ],
    "startDate": "10-03-2021",
    "endDate": "11-03-2021"
  })

};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});

```


> Ejemplo de retorno en formato JSON:

```json
{
   "ok":true,
   "result":[
      {
         "ID":737413335,
         "media":"TV Paga",
         "media_id":6,
         "date":"2021-03-11T00:00:00.000Z",
         "support_id":6250,
         "support":"TCM ",
         "weekday":"Viernes",
         "supplement":"SIN SUPLEMENTO",
         "supplement_id":0,
         "advertisement":"AVISO NO DEFINIDO",
         "advertisement_id":0,
         "quality":"",
         "quality_short":"ND",
         "hour":"26:00:01",
         "real_duration":0,
         "page":0,
         "size":0,
         "module":"",
         "element":"DESCONOCIDO",
         "element_id":0,
         "investment":0,
         "brand_id":0,
         "brand":"MARCA PENDIENTE",
         "product_id":0,
         "product":"PRODUCTO NO DEFINIDO",
         "company_id":0,
         "company":"EMPRESA NO DEFINIDA",
         "industry_id":0,
         "industry":"{DESCONOCIDO}",
         "sub_industry_id":0,
         "sub_industry":"{DESCONOCIDO}",
         "universal_id":0,
         "universal_program_id":0,
         "ad_supplier_id":0,
         "ad_supplier":"",
         "megatime_hour":26,
         "chanel_TIME":135,
         "e_type_media":1,
         "section":"SIN SECCION",
         "section_id":0,
         "normal_duration":0,
         "round_number":0,
         "round_location":0,
         "spots_in_round":0,
         "schedule_id":6,
         "schedule":"Trasnoche",
         "media_agency":"DIRECTOS (MEDIA)",
         "media_agency_id":353,
         "creative_agency":"DIRECTOS",
         "creative_agency_id":353,
         "category":"{DESCONOCIDO}",
         "category_id":0,
         "first_apparition":"1980-01-01T00:00:00.000Z",
         "failure":"s/f",
         "failure_id":0,
         "auspice":"",
         "location":"",
         "location_id":0,
         "program":"BLOQUE 65",
         "program_id":250075166,
         "centimeter":0,
         "columns":0,
         "impressions":0,
         "station_id":0,
         "station":"SIN ESTACION",
         "code":"",
         "banner_URL":""
      }
   ]
}
```

> Ejemplo de retorno en formato JSON con error:

```json
{
    "ok": false,
    "error": "\"value\" must contain at least one of [date, startDate, endDate]"
}
```

Retorna una lista con todos los spots del dia o intervalo indicado. 

### Llamada HTTP

`POST spots.megatime.cl/verifier`


### Parámetros Body
| Nombre   | Tipo   | Descripción                                  | Requerido |
| -------- | ------ | -------------------------------------------- | --------- |
| media | Array | Lista de ID de Medios | Si |
| startDate | String | Fecha de formato DD-MM-YYYY | Si |
| endDate | String | Fecha de formato DD-MM-YYYY | Si |
| date | String | Fecha de formato DD-MM-YYYY | Si |


Si se decea un intervalo de tiempo debe ingresar `startDate y endDate` (máximo 31 dias), si desea un dia ingrese solamente `date`


### Atributos Respuesta

| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo Spot (sin los atributos opcionales)|

## Obtener Medios

```python
import requests

url = "spots.megatime.cl/filters/media"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request GET 'spots.megatime.cl/filters/media' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'spots.megatime.cl/filters/media',
  'headers': {
    'Authorization': 'SECRET_API_KEY'
  }
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

Retorna una lista con todos los medios disponibles.

### Llamada HTTP

`GET spots.megatime.cl/filters/media`

### Atributos Respuesta
| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo `Filter`|


### Atributos Filter

| Nombre | Tipo | Descripción |
| -------- | ------ | -------------------------------------------- | --------- |
| ID | Integer | ID |
| name | String | Nombre |


## Obtener Marcas
```python
import requests

url = "spots.megatime.cl/filters/brands"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'spots.megatime.cl/filters/brands' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'spots.megatime.cl/filters/brands',
  'headers': {
    'Authorization': 'SECRET_API_KEY'
  }
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

`GET spots.megatime.cl/filters/brands`

### Atributos Respuesta
| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo `Filter`|



## Obtener Empresas

```python
import requests

url = "spots.megatime.cl/filters/companies"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'spots.megatime.cl/filters/companies' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'spots.megatime.cl/filters/companies',
  'headers': {
    'Authorization': 'SECRET_API_KEY'
  }
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

`GET spots.megatime.cl/filters/companies`

### Atributos Respuesta
| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo `Filter`|



## Obtener Rubros

```python
import requests

url = "spots.megatime.cl/filters/industries"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'spots.megatime.cl/filters/industries' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'spots.megatime.cl/filters/industries',
  'headers': {
    'Authorization': 'SECRET_API_KEY'
  }
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

`GET spots.megatime.cl/filters/industries`

### Atributos Respuesta
| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo `Filter`|



## Obtener Sub-Rubros

```python
import requests

url = "spots.megatime.cl/filters/subIndustries"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'spots.megatime.cl/filters/subIndustries' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'spots.megatime.cl/filters/subIndustries',
  'headers': {
    'Authorization': 'SECRET_API_KEY'
  }
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

`GET spots.megatime.cl/filters/subIndustries`

### Atributos Respuesta
| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo `FilterSubIndustry`|


### Atributos FilterSubIndustry 

| Nombre | Tipo | Descripción |
| -------- | ------ | -------------------------------------------- | --------- |
| ID | Integer | ID |
| name | String | Nombre |
| industry_id | String | ID Rubro asociado |


## Obtener Productos

```python
import requests

url = "spots.megatime.cl/filters/products"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'spots.megatime.cl/filters/products' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'spots.megatime.cl/filters/products',
  'headers': {
    'Authorization': 'SECRET_API_KEY'
  }
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

`GET spots.megatime.cl/filters/products`

### Atributos Respuesta
| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo `FilterProduct`|


### Atributos FilterProduct 

| Nombre | Tipo | Descripción |
| -------- | ------ | -------------------------------------------- | --------- |
| ID | Integer | ID |
| name | String | Nombre |
| company_id | Integer | ID Empresa asociada |
| brand_id | Integer | ID Marca asociada |
| sub_industry_id | String | ID Sub-Rubro asociado |


## Obtener Grupos Clasificadores

```python
import requests

url = "spots.megatime.cl/filters/groups" 

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'spots.megatime.cl/filters/groups' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'spots.megatime.cl/filters/groups',
  'headers': {
    'Authorization': 'SECRET_API_KEY'
  }
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

Retorna una lista con todos los Grupos Clasificadores

### Llamada HTTP

`GET spots.megatime.cl/filters/groups` 

### Atributos Respuesta
| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo `FilterClassifierGroups`|


### Atributos FilterClassifierGroups 

| Nombre | Tipo | Descripción |
| -------- | ------ | -------------------------------------------- | --------- |
| ID | Integer | ID |
| name | String | Nombre |
| obs | String | Obsercación |


## Obtener Grupos Objetivos
`GET spots.megatime.cl/filters/targets`


```python
import requests

url = "spots.megatime.cl/filters/targets" 

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'spots.megatime.cl/filters/targets' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'spots.megatime.cl/filters/targets',
  'headers': {
    'Authorization': 'SECRET_API_KEY'
  }
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

Retorna una lista con todos los Grupos Objetivos

### Llamada HTTP

`GET spots.megatime.cl/filters/targets` 

### Atributos Respuesta
| Nombre | Tipo    | Descripción              |
| ------ | ------- | ------------------------ |
| ok     | Boolean | Verificador de respuesta |
| result    | Array  | Lista de objetos tipo `Filter`|


La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
  En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key. </aside>



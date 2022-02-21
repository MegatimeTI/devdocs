# Radio Regional

## Obtener API Key Usuario

```python
import requests
import json

url = "https://cuenta.megatime.cl/api/auth/key"

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
curl --location --request POST 'https://cuenta.megatime.cl/api/auth/key' \
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
  url: "https://cuenta.megatime.cl/api/auth/key",
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
    "key": "SECRET_API_KEY",
}
```

Retorna key del usuario, para tener acceso a las consultas de radios regionales.

### Llamada HTTP

<span style="color: rgb(170, 117, 28);"> **POST**</span> ` https://cuenta.megatime.cl/api/auth/key`

### Parámetros Body

| Nombre   | Tipo   | Descripción                                  | Requerido |
| -------- | ------ | -------------------------------------------- | --------- |
| email | String | Correo asociado a credencial de Megatime     | Sí        |
| password | String | Contraseña asociada a credencial de Megatime | Sí        |

### Atributos Respuesta

| Nombre     | Tipo    | Descripción                |
| ---------- | ------- | ------------------------   |
| ok         | Boolean | Verificador de respuesta   |
| key        | String  | Llave de acceso a API      |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener Agencias_Creativas

```python
import requests
import json

url = "radioregional.megatime.cl/api/finder/creative-agencies"

payload = json.dumps({
  "name": "example"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request GET 'radioregional.megatime.cl/api/finder/creative-agencies' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name":"example"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'radioregional.megatime.cl/api/finder/creative-agencies',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "name": "example"
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
    "ok": true,
    "agencies": [
        {
            "id": 345,
            "name": "SUTIL NAZCA SAATCHI Y SAATCHI"
        },
        {
            "id": 879,
            "name": "XYZ JAAPOH PUBLICIDAD"
        }
    ]
}
```

Retorna las agencias creativas y su respectivo id. Se puede adjuntar una 'frase' para filtrar los resultados.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span>  `https://radioregional.megatime.cl/api/finder/creative-agencies`

### Parametros URL

| Nombre     | Tipo    | Descripción                          | Requerido |
| ---------- | ------- | --------------------------------     | --------- |
| name       | String  | Cadena de texto para filtrar por nombre  | No |


### Atributos Respuesta

| Nombre     | Tipo    | Descripción                          |
| ---------- | ------- | --------------------------------     |
| ok         | Boolean | Verificador de respuesta             |
| agencies   | Array   | Lista de objetos de tipo **Agencies** |

### Atributos Agencia_creativas

| Nombre      | Tipo    | Descripción                                   |
| ----------- | ------- | ----------------------------------------------|
| ID          | Integer | Identificador de la agencia creativa          |
| name        | String  | Nombre de la agencia creativa                 |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener Agencias_de_medios

```python
import requests
import json

url = "radioregional.megatime.cl/api/finder/media-agencies"

payload = json.dumps({
  "name": "example"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request GET 'radioregional.megatime.cl/api/finder/media-agencies' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "example"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'radioregional.megatime.cl/api/finder/media-agencies',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "name": "`example`"
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
    "ok": true,
    "agencies": [
        {
            "id": 675,
            "name": "12 PUBLICIDAD (MEDIA)"
        },
        {
            "id": 978,
            "name": "A.P. PUBLICIDAD (MEDIA)"
        }
    ]
}
```

Retorna las agencias de medios y su respectivo id. Se debe adjuntar una 'frase' para filtrar los resultados.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `https://radioregional.megatime.cl/api/finder/media-agencies`

### Parametros URL

| Nombre     | Tipo    | Descripción                                | Requerido |
| ---------- | ------- | ---------------------------------------    | -------- |
| name         | String |  Cadena de texto para filtrar por nombre  | No |

### Atributos Respuesta

| Nombre     | Tipo    | Descripción                             | 
| ---------- | ------- | --------------------------------------- | 
| ok         | Boolean | Verificador de respuesta                |
| agencies   | Array   | Lista de objetos de tipo **Agencies**   |

### Atributos Agencias de medios

| Nombre            | Tipo    | Descripción                                 |
| ----------------- | ------- | --------------------------------------------|
| ID                | Integer | Identificador de la agencia de medio        |
| name            | String  | Nombre de la agencia de medio               |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener_Empresas

```python
import requests
import json

url = "radioregional.megatime.cl/api/finder/companies"

payload = json.dumps({
  "name": "example"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request GET 'radioregional.megatime.cl/api/finder/companies' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "example"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'radioregional.megatime.cl/api/finder/companies',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "name": "example"
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
    "ok": true,
    "companies": [
        {
            "id": 45672,
            "name": "AARATI,JOYAS"
        },
        {
            "id": 12387,
            "name": "ACEROLAIS,JOYAS"
        },
        {
            "id": 976453,
            "name": "ACUARIO JOYAS"
        }
    ]
}
```

Retorna las empresas y su respectivo id. Se debe adjuntar una 'frase' para filtrar los resultados.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `https://radioregional.megatime.cl/api/finder/companies`


### Parametros URL

| Nombre     | Tipo    | Descripción                                | Requerido |
| ---------- | ------- | ---------------------------------------    | --------  |
| name         | String |  Cadena de texto para filtrar por nombre  | No        |

### Atributos Respuesta

| Nombre        | Tipo    | Descripción                                        |
| ----------    | ------- | -------------------------------------------------- |
| ok            | Boolean | Verificador de respuesta                           |
| companies      | Array   | Lista de objetos de tipo **Companies**              |

### Atributos Empresas

| Nombre        | Tipo    | Descripción                              |
| ------------- | ------- | ---------------------------------------- |
| ID            | Integer | Identificador de la empresa              |
| name          | String  | Nombre de la empresa                     |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>


## Obtener_Radios

```python
import requests

url = "radioregional.megatime.cl/api/finder/radios"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'radioregional.megatime.cl/api/finder/radios' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'radioregional.megatime.cl/api/finder/radios',
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
    "radios": [
        {
            "id": 3453,
            "nombre": "ACONCAGUA",
        },
        {
            "id": 9867,
            "nombre": "AGUA MARINA",
        },
    ]
}
```

Retorna las radios y su respectivo id.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `https://radioregional.megatime.cl/api/finder/radios`

### Atributos Respuesta

| Nombre        | Tipo    | Descripción                                        |
| ----------    | ------- | -------------------------------------------------- |
| ok            | Boolean | Verificador de respuesta                           |
| radios        | Array   | Lista de objetos de tipo **Radio**                 |

### Atributos Radio

| Nombre        | Tipo    | Descripción                                       |
| ------------- | ------- | ------------------------------------------------- |
| ID            | Integer | Identificador de la radio                         |
| name          | String  | Nombre de la radio                                |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>


## Obtener detalle de una Campaña 

```python
import requests

url = "radioregional.megatime.cl/api/campaign/3554"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'radioregional.megatime.cl/api/campagin/3554' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'radioregional.megatime.cl/api/campaign/3554',
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
    "id": "3554",
    "external_id": 0,
    "name": "Example ",
    "company": "Example",
    "media_agency": "GROUPM (MEDIA)",
    "creative_agency": "DIRECTOS",
    "start_date": "03-01-2022",
    "end_date": "31-01-2022",
    "radios": [
        {
            "radio_id": 3453,
            "name": "VALPARAISO",
            "dates": [
                {
                    "day": "20220103",
                    "quantity": 3,
                    "completed": 0,
                    "quantity_found": 0
                },
                {
                    "day": "20220104",
                    "quantity": 3,
                    "completed": 0,
                    "quantity_found": 0
                }
            ]
        }
    ],
    "audios": [
        {
            "index": 0,
            "id": 3126,
            "name": "example_name.mp3",
            "source": "https://radioregional.megatime.cl/api/audios/3126",
            "createAt": "2022-01-04T17:50:14.810Z"
        },
        {
            "index": 1,
            "id": 3127,
            "name": "example_name.mp3",
            "source": "https://radioregional.megatime.cl/api/audios/3127",
            "createAt": "2022-01-04T17:50:15.437Z"
        }
    ],
    "ok": true
}
```

Retorna los detalles de una campaña. La busqueda se realiza mediante el ID de la campaña que se desea buscar.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `https://radioregional.megatime.cl/api/campagin/{campaign_ID}`

### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                                     |
| ----------           | -------     | --------------------------------------------------              |
| id                   | Integer     | Identificador de la campaña                                     |
| external_id          | Integer     | Identificador externo creado por el usuario                     |
| name                 | String      | Nombre de la campaña                                            |
| company              | String      | Nombre de la empresa                                            |
| media_agency         | String      | Nombre de la agencia de medios                                  |
| creative_agency      | String      | Nombre de la agencia creativa                                   |
| start_date           | String      | Fecha de inicio de la campaña en formato DD-MM-YYYY             |
| end_date             | String      | Fecha de termino de la campaña en formato DD-MM-YYYY          |
| radios               | Array       | Lista de objetos de tipo **radios**                             |
| audios               | Array       | Lista de objetos de tipo **audios**                             |
| ok                   | Boolean     | Verificador de respuesta                                        |


### Atributos Radios

| Nombre        | Tipo    | Descripción                                                 |
| ------------- | ------- | ----------------------------------------------------------- |
| radio_id      | Integer | Identificador de la radio                                   |
| name          | String  | Nombre de la radio                                          |
| dates         | Array   | Lista de objetos de tipo **dates**                          |


### Atributos Dates

| Nombre             | Tipo     | Descripción                                                       |
| -------------      | -------  | -----------------------------------------------------------       |
| day                | String   | Fecha en la que se contabilizo los avisajes en formato YYYYMMDD   |
| quantity           | Integer  | Cantidad de avisajes esperados en esa fecha                       |
| completed          | Integer  | Verificador de avisajes, si es "1" fue completado en su totalidad, si es "0" no fue completado  |
| quantity_found     | Integer  | Cantidad de avisajes detectados                  |

### Atributos Audios

| Nombre        | Tipo    | Descripción                                                         |
| ------------- | ------- | -----------------------------------------------------------         |
| index         | Integer | Identificador del audio dentro de la campaña                        |
| id            | Integer | Identificador del audio                                             |
| name          | String  | Nombre original del audio                                           |
| source        | String  | Link para acceso al audio                                           |
| createAt      | String  | Fecha en la que se subió el audio en formato YYYY-MM-DD HH-MM-DD    |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>


## Inyectar Pauta a una Campaña

```python
import requests
import json

url = "radioregional.megatime.cl/campaign/add/details"

payload = json.dumps({
  "campaign_id": "7558",
  "details": [
    {
      "radio_id": "6446",
      "dates": [
        {
          "day": "18-01-2022",
          "quantity": "3"
        },
        {
          "day": "19-01-2022",
          "quantity": "4"
        },
        {
          "day": "20-01-2022",
          "quantity": "5"
        }
      ]
    },
    {
      "radio_id": "9644",
      "dates": [
        {
          "day": "18-01-2022",
          "quantity": "3"
        },
        {
          "day": "19-01-2022",
          "quantity": "4"
        },
        {
          "day": "20-01-2022",
          "quantity": "5"
        }
      ]
    }
  ]
})
headers = {
  'Authorization': '62cc57e4e86381c3c254a2b4b6464545',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request POST 'radioregional.megatime.cl/campaign/add/details' \
--header 'Authorization: 62cc57e4e86381c3c254a2b4b8882673' \
--header 'Content-Type: application/json' \
--data-raw '{
    "campaign_id": "6446",
    "details": [
        {
            "radio_id": "9449",
            "dates": [
                {
                    "day": "18-01-2022",
                    "quantity": "3"
                },
                {
                    "day": "19-01-2022",
                    "quantity": "4"
                },
                {
                    "day": "20-01-2022",
                    "quantity": "5"
                }
            ]
        },
            {
            "radio_id": "9445",
            "dates": [
                {
                    "day": "18-01-2022",
                    "quantity": "3"
                },
                {
                    "day": "19-01-2022",
                    "quantity": "4"
                },
                {
                    "day": "20-01-2022",
                    "quantity": "5"
                }
            ]
        }]
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'radioregional.megatime.cl/campaign/add/details',
  'headers': {
    'Authorization': '62cc57e4e86381c3c254a2b4b',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "campaign_id": "3343",
    "details": [
      {
        "radio_id": "7208",
        "dates": [
          {
            "day": "18-01-2022",
            "quantity": "3"
          },
          {
            "day": "19-01-2022",
            "quantity": "4"
          },
          {
            "day": "20-01-2022",
            "quantity": "5"
          }
        ]
      },
      {
        "radio_id": "4434",
        "dates": [
          {
            "day": "18-01-2022",
            "quantity": "3"
          },
          {
            "day": "19-01-2022",
            "quantity": "4"
          },
          {
            "day": "20-01-2022",
            "quantity": "5"
          }
        ]
      }
    ]
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
  "ok": true,
  "message": "Pautas ingresadas correctamente"
}
```

Inyecta pauta a una campaña creada previamente.

### Llamada HTTP

<span style="color: rgb(170, 117, 28);"> **POST**</span> `https://radioregional.megatime.cl/api/campagin/add/details`

### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                                     |
| ----------           | -------     | --------------------------------------------------              |
| campaign_id          | Integer     | Identificador de la campaña                                     |
| details              | Array       | Lista de objetos de tipo **details**                            |



### Atributos Details

| Nombre        | Tipo    | Descripción                                                 |
| ------------- | ------- | ----------------------------------------------------------- |
| radio_id      | Integer | Identificador de la radio                                   |
| dates         | Array   | Lista de objetos de tipo **dates**                          |


### Atributos Dates

| Nombre             | Tipo     | Descripción                                                       |
| -------------      | -------  | -----------------------------------------------------------       |
| day                | String   | Fecha en la que se contabilizo los avisajes en formato YYYYMMDD   |
| quantity           | Integer  | Cantidad de avisajes esperados en esa fecha                       |


La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>



## Obtener Campañas en un rango de fechas

```python
import requests

url = "radioregional.megatime.cl/api/campaign/search/?start_date=12-11-2021&end_date=12-01-2022"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)


```

```shell
curl --location --request GET 'radioregional.megatime.cl/api/campaign/search/?start_date=12-11-2021&end_date=12-01-2022' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'radioregional.megatime.cl/api/campaign/search/?start_date=12-11-2021&end_date=12-01-2022',
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
    "campaigns": [
        {
            "campaign_id": 4456,
            "campaign": "BANCO ESTADO CUENTA RUT MIGRACION ENERO",
            "company": "BANCO ESTADO",
            "media_agency": "GROUPM (MEDIA)",
            "creative_agency": "DIRECTOS",
            "creation_date": "2022-01-19 13:00:26",
            "start_date": "19-01-2022",
            "end_date": "31-01-2022",
            "external_id": 0,
            "audios": [
                {
                    "audio_id": 7556,
                    "audio": "example_name.mp3",
                    "campaign_id": 9668,
                }
            ]
        },
        {
            "campaign_id": 4457,
            "campaign": "BANCO CHILE DRONES",
            "company": "BANCO CHILE",
            "media_agency": "OMG",
            "creative_agency": "DIRECTOS",
            "creation_date": "2022-01-19 12:58:07",
            "start_date": "17-01-2022",
            "end_date": "22-01-2022",
            "external_id": 0,
            "audios": [
                {
                    "audio_id": 77476,
                    "audio": "example_name.mp3",
                    "campaign_id": 5567,
                }
            ]
        }
}
```

Retorna una lista de campañas en base a un rango de fecha.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `https://radioregional.megatime.cl/api/campaign/search?start_date={DD-MM-YYYY}&end_date={DD-MM-
YYYY}`


### Parametros URL

| Nombre     | Tipo    | Descripción                                           | Requerido |
| ---------- | ------- | ---------------------------------------               | --------  |
| start_date | String  |  Fecha de inicio de la campaña en formato DD-MM-YYYY  | Si        |
| end_date   | String  |  Fecha de termino de la campaña en formato DD-MM-YYYY | Si        |

### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| ok                   | Integer     | Verificador de respuesta                                   |
| campaigns            | Array       | Lista de objetos de tipo **campaigns**                     |

### Atributos Campaigns

| Nombre            | Tipo    | Descripción                                                   |
| -------------     | ------- | -----------------------------------------------------------   |
| campaign_id       | Integer | Identificador de la campaña                                   |
| external_id       | Integer | Identificador externo de la campaña                           |
| campaign          | String  | Nombre de la campaña                                          |
| company           | String  | Nombre de la empresa                                          |
| media_agency      | String  | Nombre de la agencias de medios                               |
| creative_agency   | String  | Nombre de la agencia creativa                                 |
| start_date        | String  | Fecha de inicio de la campaña en formato DD-MM-YYYY           |
| end_date          | String  | Fecha de termino de la campaña en formato DD-MM-YYYY          |
| external_id       | Integer | Identificador externo                                         |
| audios            | Array   | Lista de objetos de tipo **audios**                           |

### Atributos Audios

| Nombre               | Tipo        | Descripción                         |
| ----------           | -------     | ------------------------------------|
| audio_id             | Integer     | Identificador del audio             |
| audio                | String      | Nombre del audio                    |
| campaign_id          | Integer     | Identificador de la campaña         |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>


## Crear Campaña

```python
import requests
import json

url = "radioregional.megatime.cl/api/campaign/add"

payload = json.dumps({
  "name": "ExampleCampaña",
  "company": "Example Empresa",
  "media_agency": "Example Ag medio",
  "creative_agency": "Example Ag creativa"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request POST 'radioregional.megatime.cl/api/campaign/add' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name": "ExampleCampaña",
  "company": "Example Empresa",
  "media_agency": "Example Ag medio",
  "creative_agency": "Example Ag creativa"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'radioregional.megatime.cl/api/campaign/add',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "name": "ExampleCampaña",
    "company": "Example Empresa",
    "media_agency": "Example Ag medio",
    "creative_agency": "Example Ag creativa"
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
    "ok": true,
    "campaign_id": 3334,
    "message": "Campaña ingresada correctamente."
}
```

Crea una nueva campaña.

### Llamada HTTP

<span style="color: rgb(170, 117, 28);"> **POST**</span> `https://radioregional.megatime.cl/api/campaign/add`

### Parametros Body

| Nombre               | Tipo        | Descripción                                  | Requerido |
| ----------           | -------     | ---------------------------------------------| --------- |
| name                 | String      | Nombre de la campaña a crear                 | Si |
| company              | String      | Nombre de la empresa                         | Si |
| media_agency         | String      | Nombre de la agencia de medios               | Si |
| creative_agency      | String      | Nombre de la agencia creativa                | Si |

### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                    |
| ----------           | -------     | -----------------------------------------------|
| ok                   | Boolean     | Verificador de respuesta                       |
| campaign_id          | Integer     | Identificador de la nueva campaña generada     |
| message              | String      | Mensaje de estado                              |


La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>


## Editar Campaña

```python
import requests
import json

url = "radioregional.megatime.cl/api/campaign/edit"

payload = json.dumps({
    "id": 9987,
    "name": "Example Name",
    "company":"Example Name",
    "media_agency":"Example Name",
    "creative_agency":"Example Name",
    "start_date": "2022-01-18",
    "end_date": "2022-01-25"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request POST 'radioregional.megatime.cl/api/campaign/edit' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "id": 9987,
    "name": "Example Name",
    "company":"Example Name",
    "media_agency":"Example Name",
    "creative_agency":"Example Name",
    "start_date": "2022-01-18",
    "end_date": "2022-01-25"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'radioregional.megatime.cl/api/campaign/edit',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "id": 9987,
    "name": "Example Name",
    "company":"Example Name",
    "media_agency":"Example Name",
    "creative_agency":"Example Name",
    "start_date": "2022-01-18",
    "end_date": "2022-01-25"
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
    "ok": true,
    "campaign_id": 9987,
    "message": "Cambios guardados correctamente."
}
```

Edita una campaña.

### Llamada HTTP

<span style="color: rgb(170, 117, 28);"> **POST**</span> `https://radioregional.megatime.cl/api/campaign/edit`

### Parametros Body

| Nombre               | Tipo        | Descripción                            | Requerido |
| ----------           | -------     | ---------------------------------------| --------- |
| id                   | Integer     | Identificador de la campaña            | Si |
| nombre               | String      | Nombre del plan a crear                | Si |
| empresa_nombre       | String      | Nombre de la empresa asociada          | Si |
| agmedio_nombre       | String      | Nombre de la agencia de medios         | Si |
| agcreativa_nombre    | String      | Nombre de la agencia creativa          | Si |

### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                     |
| ----------           | -------     | ------------------------------------------------|
| ok                   | Boolean     | Verificador de respuesta                        |
| campaign_id          | Integer     | Identificador de la nueva campaña generada      |
| message              | String      | Mensaje de estado                               |


La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener URL audio inyectado

```python
import requests

url = "https://radioregional.megatime.cl/api/audios/file/3345"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request GET 'https://radioregional.megatime.cl/api/audios/file/3345' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://radioregional.megatime.cl/api/audios/file/3345',
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
    "audio_url": "https://s3.amazonaws.com/radioregional.megatime.cl/user-audios/audio_1111.mp3"
}
```


Obtener un audio inyectado según su ID.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `https://radioregional.megatime.cl/api/audios/file/{audio_id}`

### Parametros URL

| Nombre      | Tipo        | Descripción                   |
| ----------  | -------     | ------------------------------|
| audio_id    | Integer     | Identificador del audio       |


### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                     |
| ----------           | -------     | ------------------------------------------------|
| audio_url            | String      | URL de audio inyectado                          |


La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>


## Inyectar audio a un plan

```python
import requests

url = "https://radioregional.megatime.cl/api/campaign/upload/audio/{path_audio}"

payload={}
files=[
  ('audio',('file_example_MP3_700KB.mp3',open('/{path_audio}/file_example_MP3_700KB.mp3','rb'),'audio/mpeg'))
]
headers = {
  'Authorization': '62cc57e4e86381c3c254a2b4b8882673'
}

response = requests.request("POST", url, headers=headers, data=payload, files=files)

print(response.text)

```

```shell
curl --location --request POST 'https://radioregional.megatime.cl/api/campaign/upload/audio/{campaign_id}' \
--header 'Authorization: SECRET_API_KEY' \
--form 'audio=@"/{path_audio}/file_example_MP3_700KB.mp3"'
```

```javascript
var request = require('request');
var fs = require('fs');
var options = {
  'method': 'POST',
  'url': 'https://radioregional.megatime.cl/api/campaign/upload/audio/{campaign_id}',
  'headers': {
    'Authorization': 'SECRET_API_KEY'
  },
  formData: {
    'audio': {
      'value': fs.createReadStream('/{path_audio}/file_example_MP3_700KB.mp3'),
      'options': {
        'filename': 'file_example_MP3_700KB.mp3',
        'contentType': null
      }
    }
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
    "campaign_id": 2234,
    "message": "Cambios guardados correctamente."
}
```

Subir audio a un plan.

### Llamada HTTP

<span style="color: rgb(170, 117, 28);"> **POST**</span> `https://radioregional.megatime.cl/api/upload/audio/{campaign_id}`

### Parametros URL

| Nombre          | Tipo        | Descripción                     |
| ----------      | -------     | --------------------------------|
| campaign_id     | Integer     | Identificador de la campaña     |


### Atributos Respuesta

| Nombre         | Tipo        | Descripción                                      |
| ----------     | -------     | -------------------------------------------------|
| ok             | Boolean     | Verificador de respuesta                         |
| campaign_id    | Integer     | Identificador de la nueva campaña generada       |
| message        | String      | Mensaje de estado                                |


La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>



## Obtener Avisajes

```python
import requests

url = "https://radioregional.megatime.cl/api/spots?start_date=30-09-2021&end_date=27-12-2021&campaign_id={campaign_id}"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request GET 'https://radioregional.megatime.cl/api/spots?start_date=30-09-2021&end_date=27-12-2021&campaign_id={campaign_id}' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://radioregional.megatime.cl/api/spots?start_date=30-09-2021&end_date=27-12-2021&campaign_id={campaign_id}',
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
    "start_date": "30-11-2021",
    "end_date": "27-12-2021",
    "spots": [
{
            "ID": 111111,
            "audio_id": 1111,
            "audio": "example.mp3",
            "date": "19-02-2022",
            "hour": 29,
            "minute": 57,
            "second": 17,
            "duration": 30,
            "radio_id": 7062,
            "company": "HUGHESNET",
            "company_id": 73004,
            "product": "HUGHESNET,INTERNET SATELITAL",
            "advertisement": "HUGHESNET,INTERNET SATELITAL,CON HUGHESNET DONDE VEAS EL CIE",
            "product_id": 306312,
            "category": "INTERNET",
            "brand": "HUGHESNET",
            "brand_id": 120705,
            "industry": "PROVEEDORES",
            "industry_id": 404,
            "sub_industry": "PROVEEDOR DE ACCESO",
            "sub_industry_id": 6313,
            "campaign_id": 2118
        },
        {
            "ID": 11111,
            "audio_id": 1111,
            "audio": "example.mp3",
            "date": "19-02-2022",
            "hour": 23,
            "minute": 1,
            "second": 37,
            "duration": 24,
            "radio_id": 7160,
            "company": "MOVISTAR",
            "company_id": 1870,
            "product": "MOVISTAR,EMPRESAS,FIBRA",
            "advertisement": "MOVISTAR,EMPRESAS,PLAN FIBRA 600 MEGAS SIMETRICO POR SOLO",
            "product_id": 320249,
            "category": "SERVICIOS AL CONSUMIDOR",
            "brand": "MOVISTAR",
            "brand_id": 81824,
            "industry": "TELEFONIA",
            "industry_id": 405,
            "sub_industry": "SERVICIO DE TELEFONIA MOVIL",
            "sub_industry_id": 6271,
            "campaign_id": 2238
        },
    ]
}
```

Obtener los avisajes de una campaña en especifico, o de todos las campañas de un cliente en un rango de tiempo especifico.

### Llamada HTTP

<span style="color: rgb(170, 117, 28);"> **POST**</span> `https://radioregional.megatime.cl/api/spots?start_date={DD-MM-YYYY}&end_date={DD-MM-YYYY}&campaign_id={campaign_id}`

### Parametros URL

| Nombre               | Tipo        | Descripción                                         | Requerido |
| ----------           | -------     | --------------------------------------------------  |-----------|
| start_date           | String      | Fecha de inicio en formato DD-MM-YYYY               |    Si     |
| end_date             | String      | Fecha de termino en formato DD-MM-YYYY              |    Si     |
| campaign_id          | Integer     | Identificador de la campaña                         |    No     |


### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                  |
| ----------           | -------     | ---------------------------------------------|
| ok                   | Boolean     | Verificador de respuesta                     |
| start_date           | String      | Fecha de inicio en formato DD-MM-YYYY        |
| end_date             | String      | Fecha de inicio en formato DD-MM-YYYY        |
| spots                | Array       | Lista de objetos de tipo **spots**           |

### Atributos Spots

| Nombre            | Tipo    | Descripción                                                 |
| -------------     | ------- | ----------------------------------------------------------- |
| id                | Integer | Identificador del plan                                      |
| date              | String  | Fecha del avisaje en formato DD-MM-YYYY                     |
| hour              | Integer | Hora del avisaje en formato 24Horas                         |
| minute            | Integer | Minuto del avisaje                                          |
| second            | Integer | Segundo del avisaje                                         |
| duration          | Integer | Duracion del avisaje en segundos                            |
| support           | Integer | Identificador del soporte                                   |
| company           | String  | Nombre de la empresa                                        |
| company_id        | Integer | Identificador de la empresa                                 |
| product           | String  | Nombre del producto                                         |
| advertisement     | String  | Descripcion del producto                                    |
| product_id        | Integer | Identificador del producto                                  |
| brand             | String  | Nombre de la marca                                          |
| brand_id          | Integer | Identificador de la marca                                   |
| industry          | String  | Nombre del rubro                                            |
| industry_id       | Integer | Identificador del rubro                                     |
| sub_industry      | String  | Nombre del sub-rubro                                        |
| sub_industry_id   | Integer | Identificador del sub-rubro                                 |
| campaign_id       | Integer | Identificador de la campaña                                 |


La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>
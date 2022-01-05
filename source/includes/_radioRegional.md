# Radio Regional

## Obtener API Key Usuario

```python
import requests
import json

url = "http://radioregional.megatime.cl/api/auth/getApikey"

payload = json.dumps({
  "username": "user@example.com",
  "password": "**********"
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.json())


```

```shell
curl --location --request POST 'http://radioregional.megatime.cl/api/auth/getApikey' \
--header 'Content-Type: application/json' \
--data-raw '{
    "username": "user@example.com",
    "password": "**********"
}'
```

```javascript
var request = require("request");
var options = {
  method: "POST",
  url: "http://radioregional.megatime.cl/api/auth/getApikey",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    username: "user@example.com",
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
    "error": false,
    "apiKey": "SECRET_API_KEY",
    "cliente_id": 1
}
```

Retorna key del usuario, para tener acceso a las consultas de radios regionales.

### Llamada HTTP

`POST http://radioregional.megatime.cl/api/auth/getApikey`

### Parámetros Body

| Nombre   | Tipo   | Descripción                                  | Requerido |
| -------- | ------ | -------------------------------------------- | --------- |
| username | String | Correo asociado a credencial de Megatime     | Sí        |
| password | String | Contraseña asociado a credencial de Megatime | Sí        |

### Atributos Respuesta

| Nombre     | Tipo    | Descripción                               |
| ---------- | ------- | ------------------------                  |
| ok         | Boolean | Verificador de respuesta                  |
| key        | String  | Llave de acceso a API                     |
| cliente_id | Integer | Id del cliente al que pertenece el correo |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener Agencias Creativas

```python
import requests
import json

url = "radioregional.megatime.cl/api/finder/agencias/creativas"

payload = json.dumps({
  "nombre": "{filter_string}"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request POST 'radioregional.megatime.cl/api/finder/agencias/creativas' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "nombre":"{filter_string}"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'radioregional.megatime.cl/api/finder/agencias/creativas',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "nombre": "${filter_string}"
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
    "agencias": [
        {
            "id": 240,
            "nombre": "GOYA COMUNICACIONES"
        },
        {
            "id": 391,
            "nombre": "OLAYA Y VERGARA"
        },
        {
            "id": 690,
            "nombre": "PLAYA"
        },
        {
            "id": 734,
            "nombre": "RAYA"
        },
        {
            "id": 342,
            "nombre": "YANETT PUBLICIDAD"
        }
    ]
}
```

Retorna las agencias creativas y su respectivo id. Se puede adjuntar una 'frase' para filtrar los resultados.

### Llamada HTTP

`POST radioregional.megatime.cl/api/finder/agencias/creativas`

### Atributos Respuesta

| Nombre     | Tipo    | Descripción                          |
| ---------- | ------- | --------------------------------     |
| ok         | Boolean | Verificador de respuesta             |
| agencias   | Array   | Lista de objetos de tipo **Agencia** |

### Atributos Agencia creativas

| Nombre      | Tipo    | Descripción                                                |
| ----------- | ------- | ---------------------------------------------------------- |
| ID          | Integer | Identificador de la agencia creativa                       |
| nombre      | String  | Nombre de la agencia creativa                              |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener Agencias de medios

```python
import requests
import json

url = "radioregional.megatime.cl/api/finder/agencias/medios"

payload = json.dumps({
  "nombre": "{filter_string}"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request POST 'radioregional.megatime.cl/api/finder/agencias/medios' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "nombre": "{filter_string}"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'radioregional.megatime.cl/api/finder/agencias/medios',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "nombre": "{filter_string}"
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
    "agencias": [
        {
            "id": 240,
            "nombre": "GOYA COMUNICACIONES (MEDIA)"
        },
        {
            "id": 391,
            "nombre": "OLAYA Y VERGARA (MEDIA)"
        },
        {
            "id": 342,
            "nombre": "YANETT PUBLICIDAD (MEDIA)"
        }
    ]
}
```

Retorna las agencias de medios y su respectivo id. Se debe adjuntar una 'frase' para filtrar los resultados.

### Llamada HTTP

`POST radioregional.megatime.cl/api/finder/agencias/medios`

### Atributos Respuesta

| Nombre     | Tipo    | Descripción                             |
| ---------- | ------- | --------------------------------------- |
| ok         | Boolean | Verificador de respuesta                |
| agencias   | Array   | Lista de objetos de tipo **Agencias**   |

### Atributos Agencias de medios

| Nombre            | Tipo    | Descripción                                                     |
| ----------------- | ------- | --------------------------------------------------------------- |
| ID                | Integer | Identificador de la agencia de medio                            |
| nombre            | String  | Nombre de la agencia de medio                                   |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener Empresas

```python
import requests
import json

url = "radioregional.megatime.cl/api/finder/empresas"

payload = json.dumps({
  "nombre": "{filter_string}"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request POST 'radioregional.megatime.cl/api/finder/empresas' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "nombre": "{filter_string}"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'radioregional.megatime.cl/api/finder/empresas',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "nombre": "{filter_string}"
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
    "empresas": [
        {
            "id": 49189,
            "nombre": "AARATI,JOYAS"
        },
        {
            "id": 50149,
            "nombre": "ACEROLAIS,JOYAS"
        }
    ]
}
```

Retorna las empresas y su respectivo id. Se debe adjuntar una 'frase' para filtrar los resultados.

### Llamada HTTP

`POST radioregional.megatime.cl/api/finder/empresas`

### Atributos Respuesta

| Nombre        | Tipo    | Descripción                                        |
| ----------    | ------- | -------------------------------------------------- |
| ok            | Boolean | Verificador de respuesta                           |
| empresas      | Array   | Lista de objetos de tipo **Empresas**              |

### Atributos Empresas

| Nombre        | Tipo    | Descripción                              |
| ------------- | ------- | ---------------------------------------- |
| ID            | Integer | Identificador de la empresa              |
| nombre        | String  | Nombre de la empresa                     |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>


## Obtener Radios

```python
import requests

url = "radioregional.megatime.cl/api/finder/radios"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request POST 'radioregional.megatime.cl/api/finder/radios' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
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
            "id": 7208,
            "nombre": "ACONCAGUA",
            "prtg_id": 2312,
            "url": ""
        },
        {
            "id": 7063,
            "nombre": "AGUA MARINA",
            "prtg_id": 2619,
            "url": ""
        },
    ]
}
```

Retorna las radios y su respectivo id.

### Llamada HTTP

`POST radioregional.megatime.cl/api/finder/empresas`

### Atributos Respuesta

| Nombre        | Tipo    | Descripción                                        |
| ----------    | ------- | -------------------------------------------------- |
| ok            | Boolean | Verificador de respuesta                           |
| radios        | Array   | Lista de objetos de tipo **Radio**                 |

### Atributos Radio

| Nombre        | Tipo    | Descripción                                       |
| ------------- | ------- | ------------------------------------------------- |
| ID            | Integer | Identificador de la radio                         |
| nombre        | String  | Nombre de la radio                                |
| prtg_id       | Integer | Identificador del soporte /POR TERMINAR/          |

La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>


## Obtener Campaña mediante ID

```python
import requests

url = "radioregional.megatime.cl/api/planes/{campaign_id}"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
```

```shell
curl --location --request GET 'radioregional.megatime.cl/api/planes/{campaign_id}' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'radioregional.megatime.cl/api/planes/{campaign_id}',
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
    "id": "3098",
    "external_id": 0,
    "nombre": "MOVISTAR FIBRA Example ",
    "empresa_id": 0,
    "empresa_nombre": "MOVISTAR Example",
    "agmedio_id": 577,
    "agmedio_nombre": "MEDIA GROUP",
    "agcreativa_id": 953,
    "agcreativa_nombre": "DIRECTOS",
    "fecha_inicio": "2021-12-23T00:00:00.000Z",
    "fecha_termino": "2021-12-31T00:00:00.000Z",
    "radios": [
        {
            "radio_id": 9881,
            "nombre": "EXQUISITA",
            "fechas": [
                {
                    "dia": "20211224",
                    "cantidad": 4,
                    "completado": 0,
                    "cantidadEncontrada": 3
                },
                {
                    "dia": "20211225",
                    "cantidad": 4,
                    "completado": 1,
                    "cantidadEncontrada": 4
                },
            ]
        },
        ]
    ,
    "audios": [
        {
            "index": 0,
            "id": 5690,
            "name": "nombre_audio.mp3",
            "source": "https://radioregional.megatime.cl/api/audios/{id_audio}",
            "createAt": "2021-12-21T12:43:19.550Z"
        }
    ],
    "ok": true
}
```

Retorna los detalles de una campaña. La busqueda se realiza mediante el ID de la campaña que se desea buscar.

### Llamada HTTP

`GET radioregional.megatime.cl/api/planes/{campaign_id}`

### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                                     |
| ----------           | -------     | --------------------------------------------------              |
| id                   | Integer     | Identificador de la campaña                                     |
| external_id          | Integer     | Identificador externo creado por el usuario                     |
| nombre               | String      | Nombre de la campaña                                            |
| empresa_id           | Integer     | Identificador de la empresa                                     |
| empresa_nombre       | String      | Nombre de la empresa                                            |
| agmedio_id           | Integer     | Identificador de la agencia de medios                           |
| agmedio_nombre       | String      | Nombre de la agencia de medios                                  |
| agcreativa_id        | Integer     | Identificador de la agencia creativa                            |
| agcreativa_nombre    | String      | Nombre de la agencia creativa                                   |
| fecha_inicio         | String      | Fecha de inicio de la campaña en formato YYYY-MM-DD HH-MM-SS    |
| fecha_termino        | String      | Fecha de termino de la campaña en formato  YYYY-MM-DD HH-MM-SS  |
| radios               | Array       | Lista de objetos de tipo **radios**                             |
| audios               | Array       | Lista de objetos de tipo **audios**                             |
| ok                   | Boolean     | Verificador de respuesta                                        |


### Atributos Radios

| Nombre        | Tipo    | Descripción                                                 |
| ------------- | ------- | ----------------------------------------------------------- |
| radio_id      | Integer | Identificador de la radio                                   |
| nombre        | String  | Nombre de la radio                                          |
| fechas        | Array   | Lista de objetos de tipo **fechas**                         |


### Atributos Fechas

| Nombre             | Tipo     | Descripción                                                       |
| -------------      | -------  | -----------------------------------------------------------       |
| dia                | String   | Fecha en la que se contabilizo los avisajes en formato YYYYMMDD   |
| cantidad           | Integer  | Cantidad de avisajes esperados en esa fecha                       |
| completado         | Integer  | Numero verificador de avisajes, si es "1" fue completado en su totalidad, si es "0" no fue completado  |
| cantidadEncontrada | Integer  | Cantidad de avisajes detectados                  |

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


## Obtener Campañas

```python
import requests
import json

url = "radioregional.megatime.cl/api/planes/"

payload = json.dumps({
  "year": "YYYY",
  "month": "MM"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request POST 'radioregional.megatime.cl/api/planes/' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "year": "YYYY",
    "month": "MM"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'radioregional.megatime.cl/api/planes/',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "year": "YYYY",
    "month": "MM"
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
    "planes": [
        {
            "id": {campaign_id},
            "external_id": 0,
            "nombre": "HUGHESNET",
            "empresa_nombre": "IMS CHILE",
            "agmedio_nombre": "DIRECTOS",
            "agcreativa_nombre": "DIRECTOS",
            "fecha_inicio": "2021-04-26T00:00:00.000Z",
            "fecha_termino": "2021-12-23T00:00:00.000Z",
            "cantidad_audios": 4
        },
        {
            "id": {campaign_id},
            "external_id": 0,
            "nombre": "UNIMARC",
            "empresa_nombre": "UNIMARC",
            "agmedio_nombre": "HAVAS",
            "agcreativa_nombre": "DIRECTOS",
            "fecha_inicio": "2021-06-02T00:00:00.000Z",
            "fecha_termino": "2022-01-01T00:00:00.000Z",
            "cantidad_audios": 93
        },
    ]
}
```

Retorna una lista de campañas en base a un rango de fecha.

### Llamada HTTP

`POST radioregional.megatime.cl/api/planes`

### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| ok                   | Integer     | Verificador de respuesta                                   |
| planes               | Array       | Lista de objetos de tipo **planes**                        |

### Atributos Planes

| Nombre            | Tipo    | Descripción                                                   |
| -------------     | ------- | -----------------------------------------------------------   |
| id                | Integer | Identificador de la campaña                                   |
| external_id       | Integer | Identificador externo de la campaña                           |
| nombre            | String  | Nombre de la campaña                                          |
| empresa_nombre    | String  | Nombre de la empresa                                          |
| agmedio_nombre    | String  | Nombre de la agencias de medios                               |
| agcreativa_nombre | String  | Nombre de la agencia creativa                                 |
| fecha_inicio      | String  | Fecha de inicio de la campaña en formato YYYY-MM-DD HH-MM-SS  |
| fecha_termino     | String  | Fecha de termino de la campaña en formato YYYY-MM-DD HH-MM-SS |
| cantidad_audios   | Integer | Cantidad de audios subidos a la campaña                       |

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

url = "radioregional.megatime.cl/api/planes/add"

payload = json.dumps({
  "nombre": "ExampleCampaña",
  "empresa_nombre": "Example Empresa",
  "agmedio_nombre": "Example Ag medio",
  "agcreativa_nombre": "Example Ag creativa"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request POST 'radioregional.megatime.cl/api/planes/add' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "nombre": "ExampleCampaña",
    "empresa_nombre":"Example Empresa",
    "agmedio_nombre":"Example Ag medio",
    "agcreativa_nombre":"Example Ag creativa"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'radioregional.megatime.cl/api/planes/add',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "nombre": "ExampleCampaña",
    "empresa_nombre": "Example Empresa",
    "agmedio_nombre": "Example Ag medio",
    "agcreativa_nombre": "Example Ag creativa"
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
    "planes": [
        {
            "id": {campaign_id},
            "external_id": 0,
            "nombre": "HUGHESNET",
            "empresa_nombre": "IMS CHILE",
            "agmedio_nombre": "DIRECTOS",
            "agcreativa_nombre": "DIRECTOS",
            "fecha_inicio": "2021-04-26T00:00:00.000Z",
            "fecha_termino": "2021-12-23T00:00:00.000Z",
            "cantidad_audios": 4
        },
        {
            "id": {campaign_id},
            "external_id": 0,
            "nombre": "UNIMARC",
            "empresa_nombre": "UNIMARC",
            "agmedio_nombre": "HAVAS",
            "agcreativa_nombre": "DIRECTOS",
            "fecha_inicio": "2021-06-02T00:00:00.000Z",
            "fecha_termino": "2022-01-01T00:00:00.000Z",
            "cantidad_audios": 93
        },
    ]
}
```

Crea una nueva campaña.

### Llamada HTTP

`POST radioregional.megatime.cl/api/planes/add`

### Parametros Body

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| nombre               | String      | Nombre de la campaña a crear                               |
| empresa_nombre       | String      | Nombre de la empresa                                       |
| agmedio_nombre       | String      | Nombre de la agencia de medios                             |
| agcreativa_nombre    | String      | Nombre de la agencia creativa                              |

### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| ok                   | Boolean     | Verificador de respuesta                                   |
| campaign_id          | Integer     | Identificador de la nueva campaña generada                 |
| message              | String      | Mensaje de estado                                          |


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

url = "radioregional.megatime.cl/api/planes/edit"

payload = json.dumps({
  "id": {campaign_id},
  "nombre": "ExampleCampaña",
  "empresa_nombre": "Example empresa",
  "agmedio_nombre": "Example Ag medios",
  "agcreativa_nombre": "Example Ag creativa"
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request POST 'radioregional.megatime.cl/api/planes/edit' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "id":{campaign_id},
    "nombre":"ExamplePlan",
    "empresa_nombre":"Example Empresa",
    "agmedio_nombre":"Example Ag medio",
    "agcreativa_nombre":"Example Ag creativa"
}'
```

```javascript
var request = require('request');
var options = {
  'method': 'POST',
  'url': 'radioregional.megatime.cl/api/planes/edit',
  'headers': {
    'Authorization': 'SECRET_API_KEY',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    "id": {campaign_id},
    "nombre": "ExamplePlan",
    "empresa_nombre": "Example Empresa",
    "agmedio_nombre": "Example Ag medio",
    "agcreativa_nombre": "Example Ag creativa"
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
    "campaign_id": {campaign_id},
    "message": "Cambios guardados correctamente."
}
```

Edita una campaña.

### Llamada HTTP

`POST radioregional.megatime.cl/api/planes/add`

### Parametros Body

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| id                   | Integer     | Identificador de la campaña                                |
| nombre               | String      | Nombre del plan a crear                                    |
| empresa_nombre       | String      | Nombre de la empresa asociada                              |
| agmedio_nombre       | String      | Nombre de la agencia de medios                             |
| agcreativa_nombre    | String      | Nombre de la agencia creativa                              |

### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| ok                   | Boolean     | Verificador de respuesta                                   |
| campaign_id          | Integer     | Identificador de la nueva campaña generada                 |
| message              | String      | Mensaje de estado                                          |


La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener Url de un audio

```python
import requests

url = "https://radioregional.megatime.cl/api/audios/{audio_id}"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)

```

```shell
curl --location --request GET 'https://radioregional.megatime.cl/api/audios/{audio_id}' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require('request');
var options = {
  'method': 'GET',
  'url': 'https://radioregional.megatime.cl/api/audios/{audio_id}',
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
    "campaign_id": {campaign_id},
    "message": "Cambios guardados correctamente."
}
```

Subir audio a un plan.

### Llamada HTTP

`GET https://radioregional.megatime.cl/api/audios/{audio_id}`

### Parametros URL

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| audio_id             | Integer     | Identificador del audio                                    |


### Atributos Respuesta

Redireccion a url donde se puede reproducir el audio.


La API espera que todas las llamadas estén autenticadas con la Api key
en el Authorization header:

`Authorization: SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>


## Inyectar audio a un plan

```python
import requests

url = "https://radioregional.megatime.cl/api/planes/upload/audio/{path_audio}"

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
curl --location --request POST 'https://radioregional.megatime.cl/api/planes/upload/audio/{campaign_id}' \
--header 'Authorization: SECRET_API_KEY' \
--form 'audio=@"/{path_audio}/file_example_MP3_700KB.mp3"'
```

```javascript
var request = require('request');
var fs = require('fs');
var options = {
  'method': 'POST',
  'url': 'https://radioregional.megatime.cl/api/planes/upload/audio/{campaign_id}',
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
    "campaign_id": {campaign_id},
    "message": "Cambios guardados correctamente."
}
```

Subir audio a un plan.

### Llamada HTTP

`POST radioregional.megatime.cl/api/upload/audio/{campaign_id}`

### Parametros URL

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| campaign_id          | Integer     | Identificador de la campaña                                |


### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| ok                   | Boolean     | Verificador de respuesta                                   |
| campaign_id          | Integer     | Identificador de la nueva campaña generada                 |
| message              | String      | Mensaje de estado                                          |


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
            "ID": {spot_id},
            "date": "2021-12-27T00:00:00.000Z",
            "hour": 18,
            "minute": 57,
            "second": 36,
            "duration": 30,
            "support": 10123,
            "company": "MOVISTAR",
            "company_id": 1870,
            "product": "MOVISTAR,FIBRA MOVISTAR",
            "advertisement": "MOVISTAR,FIBRA MOVISTAR,TENEMOS EL MEJOR INTERNET HOGAR",
            "product_id": 303603,
            "brand": "MOVISTAR",
            "brand_id": 81824,
            "industry": "TELEFONIA",
            "industry_id": 405,
            "sub_industry": "SERVICIO DE TRANSMISION DE LA INFORMACION",
            "sub_industry_id": 6355,
            "campaign_id": {campaign_id}
        },
        {
            "ID": {spot_id},
            "date": "2021-12-27T00:00:00.000Z",
            "hour": 18,
            "minute": 33,
            "second": 42,
            "duration": 30,
            "support": 10117,
            "company": "MOVISTAR",
            "company_id": 1870,
            "product": "MOVISTAR,FIBRA MOVISTAR",
            "advertisement": "MOVISTAR,FIBRA MOVISTAR,TENEMOS EL MEJOR INTERNET HOGAR",
            "product_id": 303603,
            "brand": "MOVISTAR",
            "brand_id": 81824,
            "industry": "TELEFONIA",
            "industry_id": 405,
            "sub_industry": "SERVICIO DE TRANSMISION DE LA INFORMACION",
            "sub_industry_id": 6355,
            "campaign_id": {campaign_id}
        }
    ]
}
```

Obtener los avisajes de una campaña en especifico, o de todos las campañas de un cliente en un rango de tiempo especifico.

### Llamada HTTP

`POST https://radioregional.megatime.cl/api/spots?start_date={DD-MM-YYYY}&end_date={DD-MM-YYYY}&campaign_id={campaign_id}`

### Parametros URL

| Nombre               | Tipo        | Descripción                                         | Requerido |
| ----------           | -------     | --------------------------------------------------  |-----------|
| start_date           | String      | Fecha de inicio en formato DD-MM-YYYY               |    Si     |
| end_date             | String      | Fecha de termino en formato DD-MM-YYYY              |    Si     |
| campaign_id          | Integer     | Identificador de la campaña                         |    No     |


### Atributos Respuesta

| Nombre               | Tipo        | Descripción                                                |
| ----------           | -------     | --------------------------------------------------         |
| ok                   | Boolean     | Verificador de respuesta                                   |
| start_date           | String      | Fecha de inicio en formato DD-MM-YYYY                      |
| end_date             | String      | Fecha de inicio en formato DD-MM-YYYY                      |
| spots                | Array       | Lista de objetos de tipo **spots**                         |

### Atributos Spots

| Nombre            | Tipo    | Descripción                                                 |
| -------------     | ------- | ----------------------------------------------------------- |
| id                | Integer | Identificador del plan                                      |
| date              | String  | Fecha del avisaje en formato YYYY-MM-DD 00:00:00            |
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
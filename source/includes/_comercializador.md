# Comercializador

## Obtener API Key

```python
iimport requests
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

Retorna key que permite el acceso al API.

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

## Inserción Spots

Insertar spots para su posterior asignación del comercializador en data Megatime

```shell
curl --location --request POST 'comercializador.megatime.cl/api/spots' \
--header 'Authorization: SECRET_API_KEY' \
--header 'Content-Type: application/json' \
--data-raw '{
    "data": [{
        "date_supplier": "2022-01-23",
        "time_supplier": "25:56:49",
        "date": "2022-01-23",
        "time": "25:56:58",
        "support_id": 6013,
        "advertisement_id": 598610,
        "is_match": true
    }, {
        "date_supplier": "2022-03-03",
        "time_supplier": "18:12:35",
        "date": "2022-03-03",
        "time": "18:12:44",
        "support_id": 6001,
        "advertisement_id": 601035,
        "is_match": true
    }]
}'
```

```python
import requests
import json

url = "comercializador.megatime.cl/api/spots"

payload = json.dumps({
  "data": [
    {
      "date_supplier": "2022-01-23",
      "time_supplier": "25:56:49",
      "date": "2022-01-23",
      "time": "25:56:58",
      "support_id": 6013,
      "advertisement_id": 598610,
      "is_match": True
    },
    {
      "date_supplier": "2022-03-03",
      "time_supplier": "18:12:35",
      "date": "2022-03-03",
      "time": "18:12:44",
      "support_id": 6001,
      "advertisement_id": 601035,
      "is_match": True
    }
  ]
})
headers = {
  'Authorization': 'SECRET_API_KEY',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

```javascript
var request = require("request");
var options = {
  method: "POST",
  url: "comercializador.megatime.cl/api/spots",
  headers: {
    Authorization: "SECRET_API_KEY",
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    data: [
      {
        date_supplier: "2022-01-23",
        time_supplier: "25:56:49",
        date: "2022-01-23",
        time: "25:56:58",
        support_id: 6013,
        advertisement_id: 598610,
        is_match: true,
      },
      {
        date_supplier: "2022-03-03",
        time_supplier: "18:12:35",
        date: "2022-03-03",
        time: "18:12:44",
        support_id: 6001,
        advertisement_id: 601035,
        is_match: true,
      },
    ],
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
  "message": "2 spots inserted"
}
```

### Llamada HTTP

<span style="color: rgb(170, 117, 28);">**POST**</span> `https://comercializador.megatime.cl/api/spots`

### Parametros Body

| Nombre | Tipo  | Descripción                  | Requerido |
| ------ | ----- | ---------------------------- | --------- |
| data   | Array | Lista de objetos tipo `Spot` | Si        |

### Atributos Spot

| Nombre           | Tipo    | Descripción                                                                                                        | Requerido |
| ---------------- | ------- | ------------------------------------------------------------------------------------------------------------------ | --------- |
| date_supplier    | String  | Fecha exhibición del spot por Comercializador en formato YYYY-MM-DD                                                | Si        |
| time_supplier    | String  | Tiempo exhibición del spot por Comercializador en formato HH:MM:SS                                                 | Si        |
| date             | String  | Fecha exhibición del spot publicado por Megatime en formato YYYY-MM-DD. Debe ir con valor null en caso de no match | No        |
| time             | String  | Tiempo exhibición del spot publicado por Megatime en formato HH:MM:SS. Debe ir con valor null en caso de no match  | No        |
| support_id       | Integer | ID del soporte / canal de exhibición                                                                               | Si        |
| advertisement_id | Integer | ID del aviso exhibido                                                                                              | Si        |
| is_match         | Boolean | Indicador si spot inyectado contiene correlación con spot megatime                                                 | Si        |

### Atributos Respuesta

| Nombre  | Tipo    | Descripción                                                              |
| ------- | ------- | ------------------------------------------------------------------------ |
| ok      | Boolean | Verificador de respuesta                                                 |
| message | String  | Mensaje de estado indicando cuantos spots se insertaron en caso de éxito |

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

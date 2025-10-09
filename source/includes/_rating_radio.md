# Rating Radio

## Autenticación

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

Para usar la API, primero necesitas obtener tu API Key desde DataSuite.

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

## Crear Rating

```python
import requests

url = "https://ratingradio.megatime.cl/api/ratings"
headers = {
    "Content-Type": "application/json",
    "API-Key": "71e1db8n090am63ca69606c4slb8b6ta"
}

# Ejemplo básico (un rating)
data = {
    "date_month": 202412,
    "radio_id": 101,
    "time_slot_id": 5,
    "dow_id": 2,
    "target_id": 15,
    "value": 12.5
}

response = requests.post(url, json=data, headers=headers)
print(response.json())
```

```shell
# Ejemplo básico (un rating)
curl -X POST https://ratingradio.megatime.cl/api/ratings \
  -H "Content-Type: application/json" \
  -H "API-Key: 71e1db8n090am63ca69606c4slb8b6ta" \
  -d '{
    "date_month": 202412,
    "radio_id": 101,
    "time_slot_id": 5,
    "dow_id": 2,
    "target_id": 15,
    "value": 12.5
  }'

# Ejemplo múltiple (varios ratings)
curl -X POST https://ratingradio.megatime.cl/api/ratings \
  -H "Content-Type: application/json" \
  -H "API-Key: 71e1db8n090am63ca69606c4slb8b6ta" \
  -d '[
    {
      "date_month": 202412,
      "radio_id": 101,
      "time_slot_id": 5,
      "dow_id": 2,
      "target_id": 15,
      "value": 12.5
    },
    {
      "date_month": 202412,
      "radio_id": 102,
      "time_slot_id": 5,
      "dow_id": 2,
      "target_id": 15,
      "value": 8.3
    }
  ]'
```

```javascript
const axios = require('axios');

// Ejemplo básico (un rating)
async function createRating() {
  try {
    const response = await axios.post('https://ratingradio.megatime.cl/api/ratings', {
      date_month: 202412,
      radio_id: 101,
      time_slot_id: 5,
      dow_id: 2,
      target_id: 15,
      value: 12.5
    }, {
      headers: {
        'Content-Type': 'application/json',
        'API-Key': '71e1db8n090am63ca69606c4slb8b6ta'
      }
    });
    
    console.log('Rating creado:', response.data);
  } catch (error) {
    console.error('Error:', error.response.data);
  }
}

// Ejemplo múltiple (varios ratings)
async function createMultipleRatings() {
  const ratings = [
    {
      date_month: 202412,
      radio_id: 101,
      time_slot_id: 5,
      dow_id: 2,
      target_id: 15,
      value: 12.5
    },
    {
      date_month: 202412,
      radio_id: 102,
      time_slot_id: 5,
      dow_id: 2,
      target_id: 15,
      value: 8.3
    }
  ];

  try {
    const response = await axios.post('https://ratingradio.megatime.cl/api/ratings', ratings, {
      headers: {
        'Content-Type': 'application/json',
        'API-Key': '71e1db8n090am63ca69606c4slb8b6ta'
      }
    });
    
    console.log('Ratings creados:', response.data);
  } catch (error) {
    console.error('Error:', error.response.data);
  }
}
```

> Respuesta exitosa:

```json
{
  "ok": true,
  "message": "1 rating(s) created successfully"
}
```

> Respuestas de error:

```json
{
  "ok": false,
  "message": "Invalid API key"
}
```

```json
{
  "ok": false,
  "message": "All fields are required: date_month, radio_id, time_slot_id, dow_id, target_id, value"
}
```

```json
{
  "ok": false,
  "message": "FechaMes must be in YYYYMM format (e.g., 202412)"
}
```

Crea uno o múltiples ratings de radio.

### Llamada HTTP

<span style="color: rgb(170, 117, 28);"> **POST**</span> `https://ratingradio.megatime.cl/api/ratings`

### Campos requeridos

| Campo         | Tipo   | Descripción                           | Ejemplo |
| ------------- | ------ | ------------------------------------- | ------- |
| date_month    | number | Fecha en formato YYYYMM               | 202412  |
| radio_id      | number | ID de la radio                        | 101     |
| time_slot_id  | number | ID del bloque horario                 | 5       |
| dow_id        | number | ID del día (1=Lunes, 7=Domingo)      | 2       |
| target_id     | number | ID del target demográfico             | 15      |
| value         | number | Valor del rating                      | 12.5    |

<aside class="notice">
Los ratings se crean exitosamente con código de respuesta HTTP 201. Asegúrate de que todos los campos requeridos estén presentes en tu solicitud.
</aside>

## Health Check

```python
import requests

response = requests.get('https://ratingradio.megatime.cl/health')
print(response.json())
```

```shell
curl https://ratingradio.megatime.cl/health
```

```javascript
const response = await fetch('https://ratingradio.megatime.cl/health');
const data = await response.json();
console.log(data);
```

> Respuesta:

```json
{
  "ok": true,
  "message": "Service is healthy",
  "timestamp": "2024-01-15T10:30:00.000Z"
}
```

Verificar estado del servicio. No requiere autenticación.

### Llamada HTTP

<span style="color: rgb(46, 125, 50);"> **GET**</span> `https://ratingradio.megatime.cl/health`
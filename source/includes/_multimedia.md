# Multimedia

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
  "key": "0x48e1db8n090am63ca69606c4slb8b6ta"
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

La API espera que las llamadas estén autenticadas con la Api key en la url con el parámetro `key`

`?key=SECRET_API_KEY`

<aside class="notice">
En cada ejemplo de la documentación debes reemplazar <code>SECRET_API_KEY</code> con tu API key.
</aside>

## Obtener Multimedia

Retorna multimedia de un aviso.

### Llamada HTTP

```python
import requests

url = "multimedia.megatime.cl/file/spot/0xea3e07b0ef1e6e698af73db5ce37da8d?key=SECRET_API_KEY"

payload={}
headers = {}

response = requests.request("GET", url, headers=headers, data=payload)

print(response)

```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "multimedia.megatime.cl/file/spot/0xea3e07b0ef1e6e698af73db5ce37da8d?key=SECRET_API_KEY",
  headers: {},
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  console.log(response.body);
});
```

```shell
curl --location --request GET 'multimedia.megatime.cl/file/spot/0xea3e07b0ef1e6e698af73db5ce37da8d?key=SECRET_API_KEY'
```

> Retorno de multimedia Video, Audio o Imagen

`GET multimedia.megatime.cl/file/spot/{codigo}`

La variable `codigo` corresponde al código único de cada avisaje.

<aside class="success">
En forma alternativa, se puede usar la variable <code>TagMultimedia</code> que es proporcionada como columna en SP del Verificador Diario. Es equivalente a la composición <code>spot/{codigo}</code>.
<br>
<br>
Luego la llamada a la API queda: <code>GET multimedia.megatime.cl/file/{TagMultimedia}</code>

</aside>

### Parámetros URL

| Nombre    | Requerido | Valores                        | Descripción                     |
| --------- | --------- | ------------------------------ | ------------------------------- |
| thumbnail | No        | `true` ó `false` (por defecto) | Retorna thumbnail de multimedia |

### Medios soportados

- TV Abierta
- TV Paga
- Prensa
- Revista
- Radio
- Vía Pública
- Metro

# Clasificador

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

Retorna key que permite el acceso al API del clasificador.

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

## Obtener Grupos

```python
import requests

url = "clasificador.megatime.cl/api/groups"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.json())

```

```shell
curl --location --request GET 'clasificador.megatime.cl/api/groups' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "clasificador.megatime.cl/api/groups",
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
  "data": [
    {
      "ID": 3,
      "name": "Bancos",
      "obs": "Los bancos para cliente ...",
      "brands": [
        {
          "ID": 2392,
          "name": "BANCO DE CHILE"
        },
        {
          "ID": 2432,
          "name": "SANTANDER"
        },
        {
          "ID": 2608,
          "name": "BCI"
        }
      ],
      "classifiers": [
        {
          "ID": 2,
          "name": "Productos"
        },
        {
          "ID": 17,
          "name": "Seguros"
        }
      ]
    },
    {
      "ID": 8,
      "name": "Automóviles de lujo",
      "obs": "Incluye marcas de ...",
      "brands": [
        {
          "ID": 2985,
          "name": "BMW"
        },
        {
          "ID": 9130,
          "name": "FERRARI"
        },
        {
          "ID": 83348,
          "name": "MASERATI"
        }
      ],
      "classifiers": [
        {
          "ID": 18,
          "name": "Rubro"
        },
        {
          "ID": 19,
          "name": "Marcas"
        }
      ]
    }
  ]
}
```

Retorna todos los grupos.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `clasificador.megatime.cl/api/groups`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                      |
| ------ | ------- | -------------------------------- |
| ok     | Boolean | Verificador de respuesta         |
| data   | Array   | Lista de objetos de tipo `Grupo` |

### Atributos Grupo

| Nombre      | Tipo    | Descripción                                                |
| ----------- | ------- | ---------------------------------------------------------- |
| ID          | Integer | Identificador del grupo                                    |
| name        | String  | Nombre del grupo                                           |
| obs         | String  | Observacion del grupo                                      |
| brands      | Array   | Lista de objetos de tipo `Marca` asociados al grupo        |
| classifiers | Array   | Lista de objetos de tipo `Clasificador` asociados al grupo |

### Atributos Marca

| Nombre | Tipo    | Descripción               |
| ------ | ------- | ------------------------- |
| ID     | Integer | Identificador de la marca |
| name   | String  | Nombre de la marca        |

### Atributos Clasificador

| Nombre | Tipo    | Descripción                    |
| ------ | ------- | ------------------------------ |
| ID     | Integer | Identificador del clasificador |
| name   | String  | Nombre del clasificador        |

## Obtener Clasificadores

```python
import requests

url = "clasificador.megatime.cl/api/classifiers"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.json())
```

```shell
curl --location --request GET 'clasificador.megatime.cl/api/classifiers' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "clasificador.megatime.cl/api/classifiers",
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
    "data": [
        {
            "ID": 2,
            "name": "Productos",
            "obs": "Carnes, papel, etc.",
            "multipleSelection": true,
            "options": [
                {
                    "ID": 12,
                    "name": "Arroz"
                },
                {
                    "ID": 15,
                    "name": "Café"
                },
                {
                    "ID": 6,
                    "name": "Carnes"
                },
                {
                    "ID": 7,
                    "name": "Papel"
                }
            ]
        },
        {
            "ID": 4,
            "name": "Forma de pago",
            "obs": "Tarjetas, transferencias, puntos, etc.",
            "multipleSelection": true,
            "options": [
                {
                    "ID": 19,
                    "name": "Efectivo"
                },
                {
                    "ID": 11,
                    "name": "Pago App"
                }
                {
                    "ID": 9,
                    "name": "Tarjetas credito"
                }
            ]
        }
    ]
}

```

Retorna todos los clasificadores.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `clasificador.megatime.cl/api/classifiers`

### Atributos Respuesta

| Nombre | Tipo    | Descripción                             |
| ------ | ------- | --------------------------------------- |
| ok     | Boolean | Verificador de respuesta                |
| data   | Array   | Lista de objetos de tipo `Clasificador` |

### Atributos Clasificador

| Nombre            | Tipo    | Descripción                                                     |
| ----------------- | ------- | --------------------------------------------------------------- |
| ID                | Integer | Identificador del clasificador                                  |
| name              | String  | Nombre del clasificador                                         |
| obs               | String  | Observación del clasificador                                    |
| multipleSelection | Boolean | Es un clasificador que permite múltiples opciones seleccionadas |
| options           | Array   | Lista de objetos de tipo `Opción` asociadas al clasificador     |

### Atributos Opción

| Nombre | Tipo    | Descripción                |
| ------ | ------- | -------------------------- |
| ID     | Integer | Identificador de la opción |
| name   | String  | Nombre de la opción        |

## Obtener Avisos por Grupo

```python
import requests

url = "clasificador.megatime.cl/api/ads/group/10?start_date=13-09-2021&end_date=13-10-2021"

payload={}
headers = {
  'Authorization': 'SECRET_API_KEY'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.json())
```

```shell
curl --location --request GET 'clasificador.megatime.cl/api/ads/group/10?start_date=13-09-2021&end_date=13-10-2021' \
--header 'Authorization: SECRET_API_KEY'
```

```javascript
var request = require("request");
var options = {
  method: "GET",
  url: "clasificador.megatime.cl/api/ads/group/10?start_date=13-09-2021&end_date=13-10-2021",
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
  "group": "Supermercados",
  "start_date": "13-09-2021",
  "end_date": "13-10-2021",
  "data": [
    {
      "ID": 270366,
      "description": "TOTTUS,PRECIAZOS,SON PRECIOS BAJOS TODOS LOS DIAS POR TODO",
      "media": "Radio",
      "appeared_date": "19/04/2021",
      "industry": "SUPER E HIPERMERCADOS",
      "company": "TOTTUS",
      "brand": "TOTTUS",
      "product": "TOTTUS,PRECIAZOS",
      "status": "COMPLETADO",
      "options": [
        {
          "classifier": {
            "ID": 4,
            "name": "Forma de pago"
          },
          "values": [
            {
              "ID": 58,
              "name": "Tarjeta de Tienda"
            }
          ]
        },
        {
          "classifier": {
            "ID": 21,
            "name": "Marcas Supermercados"
          },
          "values": [
            {
              "ID": 51,
              "name": "Cristal"
            },
            {
              "ID": 52,
              "name": "Colun"
            }
          ]
        },
        {
          "classifier": {
            "ID": 2,
            "name": "Productos"
          },
          "values": [
            {
              "ID": 18,
              "name": "Alcoholes"
            }
          ]
        }
      ]
    },
    {
      "ID": 585673,
      "description": "JUMBO,FELIZ 18,SOBRECOSTILLA-HUACHALOMO $5890-TJ",
      "media": "TV Abierta",
      "appeared_date": "13/09/2021",
      "industry": "SUPER E HIPERMERCADOS",
      "company": "JUMBO",
      "brand": "JUMBO",
      "product": "JUMBO,FELIZ 18",
      "status": "PENDIENTE",
      "options": [
        {
          "classifier": {
            "ID": 4,
            "name": "Forma de pago"
          },
          "values": []
        },
        {
          "classifier": {
            "ID": 21,
            "name": "Marcas Supermercados"
          },
          "values": []
        },
        {
          "classifier": {
            "ID": 2,
            "name": "Productos"
          },
          "values": []
        }
      ]
    }
  ]
}
```

Retorna todos los avisos con sus datos y opciones que tuvieron alguna actividad en cierto periodo en base al Grupo seleccionado.

### Llamada HTTP

<span style="color: rgb(33, 120, 52);"> **GET**</span> `clasificador.megatime.cl/api/ads/group/{groupID}`

La variable `groupID` corresponde al ID del Grupo clasificador el cual contiene los filtros de marcas y clasificadores.

### Parámetros URL

| Nombre     | Requerido | Descripción                                        |
| ---------- | --------- | -------------------------------------------------- |
| start_date | Sí        | Fecha inicial de la búsqueda en formato dd-mm-yyyy |
| end_date   | Sí        | Fecha final de la búsqueda en formato dd-mm-yyyy   |

### Atributos Respuesta

| Nombre     | Tipo    | Descripción                                        |
| ---------- | ------- | -------------------------------------------------- |
| ok         | Boolean | Verificador de respuesta                           |
| group      | String  | Nombre del grupo seleccionado                      |
| start_date | Date    | Fecha inicial de la búsqueda en formato dd-mm-yyyy |
| end_date   | Date    | Fecha final de la búsqueda en formato dd-mm-yyyy   |
| data       | String  | Lista de objetos de tipo `Aviso`                   |

### Atributos Aviso por Grupo

| Nombre        | Tipo    | Descripción                                                                                                                           |
| ------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| ID            | Integer | Identificador del aviso                                                                                                               |
| description   | String  | Descripción del aviso                                                                                                                 |
| media         | String  | Nombre de los medios en donde aparece el aviso                                                                                        |
| appeared_date | Date    | Fecha donde aparece el aviso por primera vez                                                                                          |
| industry      | String  | Nombre del Rubro asignado al aviso                                                                                                    |
| company       | String  | Nombre de la Empresa asignada al aviso                                                                                                |
| brand         | String  | Nombre de la Marca asignada al aviso                                                                                                  |
| product       | String  | Nombre del Producto asignado al aviso                                                                                                 |
| status        | String  | `Estado` del aviso según el grupo elegido                                                                                             |
| options       | Array   | Lista de objetos de tipo `Opción-Clasificador` que muestra opciones asignadas al aviso según cada clasificador del grupo seleccionado |

### Atributos Opción-Clasificador

| Nombre     | Tipo   | Descripción                                                                        |
| ---------- | ------ | ---------------------------------------------------------------------------------- |
| classifier | Objeto | Objeto que representa clasificador del grupo con `ID` y `name`                     |
| values     | Array  | Listado de objetos de tipo `Opción` que representa las opciones asginadas al aviso |

### Atributos Opción

| Nombre | Tipo    | Descripción                |
| ------ | ------- | -------------------------- |
| ID     | Integer | Identificador de la opción |
| name   | String  | Nombre de la opción        |

### Estados del Aviso

| Nombre     | Descripción                        |
| ---------- | ---------------------------------- |
| Pendiente  | No tiene asginada ninguna opción   |
| Incompleto | Tiene asignada algunas opciones    |
| Completado | Tiene asginada todas las opciones  |
| No Aplica  | Todas sus opciones son 'No Aplica' |

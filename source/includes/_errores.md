# Errores

Nuestras API REST utilizan los siguientes códigos de error:

| Código | Nombre                | Descripción                                                                   |
| ------ | --------------------- | ----------------------------------------------------------------------------- |
| 400    | Bad Request           | Tu consulta es inválida.                                                      |
| 401    | Unauthorized          | Tu API key es inválida.                                                       |
| 403    | Forbidden             | La data consultada se encuentra oculta sólo para administradores.             |
| 404    | Not Found             | La data especificada a consultar no se encuentra.                             |
| 429    | Too Many Requests     | Estás haciendo muchas consultas seguidas.                                     |
| 500    | Internal Server Error | Tuvimos un problema con nuestros servidores. Por favor intenta más tarde.     |
| 503    | Service Unavailable   | Nos encontramos temporalmente fuera de servicio. Por favor intenta más tarde. |

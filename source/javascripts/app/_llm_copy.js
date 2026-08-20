// Boton "Copy for LLMs": copia al portapapeles el contexto completo de un
// endpoint (descripcion, parametros, respuesta, errores y ejemplo) en Markdown,
// listo para pegar en un modelo de lenguaje.
//
// El contenido lo genera lib/llm_snippets.rb en tiempo de build y viaja en el
// atributo data-llm codificado en base64, para no romper el HTML con comillas
// ni saltos de linea.

function decodificarBase64Utf8(cadena) {
  var binaria = window.atob(cadena);
  var bytes = new Uint8Array(binaria.length);
  for (var i = 0; i < binaria.length; i++) {
    bytes[i] = binaria.charCodeAt(i);
  }
  if (window.TextDecoder) {
    return new TextDecoder('utf-8').decode(bytes);
  }
  return decodeURIComponent(escape(binaria));
}

function copiarTexto(texto) {
  if (navigator.clipboard && navigator.clipboard.writeText) {
    return navigator.clipboard.writeText(texto);
  }
  // Respaldo para navegadores sin Clipboard API o servido por http
  var area = document.createElement('textarea');
  area.value = texto;
  area.setAttribute('readonly', '');
  area.style.position = 'absolute';
  area.style.left = '-9999px';
  document.body.appendChild(area);
  area.select();
  document.execCommand('copy');
  document.body.removeChild(area);
  return Promise.resolve();
}

function setupLlmCopy() {
  $('.llm-copy').on('click', function (evento) {
    evento.preventDefault();
    evento.stopPropagation();

    var boton = this;
    var original = boton.getAttribute('data-etiqueta') || boton.textContent;
    boton.setAttribute('data-etiqueta', original);

    var contenido;
    try {
      contenido = decodificarBase64Utf8(boton.getAttribute('data-llm'));
    } catch (error) {
      boton.textContent = 'Error';
      window.setTimeout(function () { boton.textContent = original; }, 2000);
      return;
    }

    copiarTexto(contenido).then(function () {
      boton.textContent = 'Copiado';
      boton.classList.add('llm-copy--ok');
      window.setTimeout(function () {
        boton.textContent = original;
        boton.classList.remove('llm-copy--ok');
      }, 1800);
    }).catch(function () {
      boton.textContent = 'Error';
      window.setTimeout(function () { boton.textContent = original; }, 2000);
    });
  });
}

require 'nokogiri'
require 'base64'

# Genera, para cada endpoint (cada <h2> de la pagina), un fragmento en Markdown
# autocontenido pensado para pegarle a un LLM: descripcion, llamada HTTP,
# parametros, atributos de respuesta, errores y ejemplo de retorno.
#
# El fragmento se extrae del HTML ya renderizado y no del Markdown de origen.
# Eso evita depender del orden de los archivos incluidos y de las secciones
# comentadas, y garantiza que lo copiado sea exactamente lo que se ve en la pagina.

PREAMBULO = <<~TXT.freeze
  <!-- Contexto de API generado desde la documentacion de Megatime.
       Pegar completo en un LLM para que pueda construir la llamada. -->
TXT

# Lenguajes de ejemplo que se conservan. Se descartan python y javascript para
# que el fragmento no repita tres veces la misma llamada: con cURL alcanza para
# que un LLM entienda metodo, ruta, cabeceras y parametros.
LENGUAJES_UTILES = %w[shell json].freeze

def inject_llm_buttons(page_content, etiqueta: 'Copy for LLMs')
  doc = Nokogiri::HTML::DocumentFragment.parse(page_content)

  doc.css('h2').each do |h2|
    markdown = seccion_a_markdown(h2)
    next if markdown.strip.empty?

    titulo = h2.text.strip
    cuerpo = +"# #{titulo}\n\n"
    cuerpo << "Autenticacion: todas las llamadas requieren la cabecera "
    cuerpo << "`Authorization` con la API Key del cliente.\n\n"
    cuerpo << markdown

    boton = Nokogiri::XML::Node.new('button', h2.document)
    boton['class'] = 'llm-copy'
    boton['type'] = 'button'
    boton['title'] = "Copiar el contexto de #{titulo} para pegarlo en un LLM"
    boton['data-llm'] = Base64.strict_encode64(PREAMBULO + cuerpo)
    boton.content = etiqueta
    h2.add_child(boton)
  end

  doc.to_html
end

# Recorre los hermanos del h2 hasta el proximo h2 y los convierte a Markdown.
def seccion_a_markdown(h2)
  partes = []
  nodo = h2.next_element

  while nodo && nodo.name != 'h2'
    partes << nodo_a_markdown(nodo)
    nodo = nodo.next_element
  end

  partes.reject { |p| p.nil? || p.strip.empty? }.join("\n\n")
end

def nodo_a_markdown(nodo)
  case nodo.name
  when 'h3' then "## #{nodo.text.strip}"
  when 'h4' then "### #{nodo.text.strip}"
  when 'p'  then texto_plano(nodo)
  when 'aside' then aside_a_markdown(nodo)
  when 'table' then tabla_a_markdown(nodo)
  when 'pre' then bloque_de_codigo(nodo)
  when 'ul', 'ol' then lista_a_markdown(nodo)
  when 'blockquote' then texto_plano(nodo)
  else texto_plano(nodo)
  end
end

def texto_plano(nodo)
  nodo.text.gsub(/\s+/, ' ').strip
end

def aside_a_markdown(nodo)
  tipo = nodo['class'].to_s.include?('warning') ? 'ATENCION' : 'NOTA'
  "> **#{tipo}:** #{texto_plano(nodo)}"
end

def tabla_a_markdown(tabla)
  encabezados = tabla.css('thead th').map { |th| texto_plano(th) }
  filas = tabla.css('tbody tr').map { |tr| tr.css('td').map { |td| texto_plano(td) } }
  return '' if encabezados.empty? && filas.empty?

  encabezados = filas.first.map { '' } if encabezados.empty?

  salida = +"| #{encabezados.join(' | ')} |\n"
  salida << "| #{encabezados.map { '---' }.join(' | ')} |\n"
  filas.each { |celdas| salida << "| #{celdas.join(' | ')} |\n" }
  salida.rstrip
end

def bloque_de_codigo(pre)
  lenguaje = pre['class'].to_s.split(/\s+/).reject { |c| c == 'highlight' }.first.to_s
  return '' unless lenguaje.empty? || LENGUAJES_UTILES.include?(lenguaje)

  "```#{lenguaje}\n#{pre.text.rstrip}\n```"
end

def lista_a_markdown(lista)
  lista.css('> li').map { |li| "- #{texto_plano(li)}" }.join("\n")
end

texto = "Eu estudo no Av. Eng. Eusébio Stevaux, 823 - Santo Amaro, São Paulo - SP, 04696-000 e estou cursando computer science. Nao vou fazer a pos no Av. Eng. Seu Jergio Stevaux, 823, Sala A101 - Santo Amaro, São Paulo - SP, 04696-000 porque nao tienes e o erick eh bonito"


def retorna_detalhes_endereco str

  partes = str.match(/^(?<tipo>(aeroporto|aero|alameda|al|área|área|avenida|av|campo|campo|chácara|ch|colônia|col|condomínio|cond|conjunto|conj|distrito|dist|esplanada|esp|estação|est|estrada|estr|favela|favela|fazenda|fz|feira|feira|jardim|jd|ladeira|ld|lago|lgo|lagoa|lga|largo|lgo|loteamento|lot|morro|mro|núcleo|núc|parque|pq|passarela|pass|pátio|pt|praça|pç|quadra|qd|recanto|rec|residencial|res|rodovia|rod|rua|r|setor|set|sítio|sit|travessa|tv|trecho|tr|trevo|trv|vale|vl|vereda|ver|via|via|viaduto|viad|viela|vl|vila|vl)\.?) (?<logradouro>[a-z. \u00C0-\u00FF]+), (?<numero>[\d]+)(, (?<complemento>[a-z\.\- \u00C0-\u00FF \d]+))? - (?<bairro>[a-z\. \u00C0-\u00FF \d]+), (?<cidade>[a-z \u00C0-\u00FF]+) - (?<estado>(AC|AL|AP|AM|BA|CE|DF|ES|GO|MA|MT|MS|MG|PA|PB|PR|PE|PI|RJ|RN|RS|RO|RR|SC|SP|SE|TO)), (?<cep>\d{5}-?\d{3})$/i)

  return partes
end

def identifica_enderecos str
  resultado = str.gsub(/ (aeroporto|aero|alameda|al|área|área|avenida|av|campo|campo|chácara|ch|colônia|col|condomínio|cond|conjunto|conj|distrito|dist|esplanada|esp|estação|est|estrada|estr|favela|favela|fazenda|fz|feira|feira|jardim|jd|ladeira|ld|lago|lgo|lagoa|lga|largo|lgo|loteamento|lot|morro|mro|núcleo|núc|parque|pq|passarela|pass|pátio|pt|praça|pç|quadra|qd|recanto|rec|residencial|res|rodovia|rod|rua|r|setor|set|sítio|sit|travessa|tv|trecho|tr|trevo|trv|vale|vl|vereda|ver|via|via|viaduto|viad|viela|vl|vila|vl)\.? [a-z. \u00C0-\u00FF]+, [\d]+(, [a-z\.\- \u00C0-\u00FF \d]+)? - [a-z\. \u00C0-\u00FF \d]+, [a-z \u00C0-\u00FF]+ - (AC|AL|AP|AM|BA|CE|DF|ES|GO|MA|MT|MS|MG|PA|PB|PR|PE|PI|RJ|RN|RS|RO|RR|SC|SP|SE|TO), \d{5}-?\d{3} /i)

  puts "Quantidade de enderecos localizados no texto: #{resultado.count}\n\n"

  puts "Endereços: "
  resultado.each_with_index do |item, index|
    partes = retorna_detalhes_endereco item.strip

    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    puts "#{index + 1}: \nEndereço: #{item.strip}

Detalhes:

Tipo: #{partes[:tipo]}
Logradouro: #{partes[:logradouro]}
Número: #{partes[:numero]}
Complemento: #{partes[:complemento]}
Bairro: #{partes[:bairro]}
Cidade: #{partes[:cidade]}
Estado: #{partes[:estado]}
CEP: #{partes[:cep]}"
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
  end

end

identifica_enderecos texto

(:a)Listagem de todos os cursos, contendo o seu guid e nome;:)
(:<root>{
  for $x in collection('edc')//curso
  return
    <elem>
      {$x/guid}
      {$x/nome}
    </elem>
}
</root>:)

(:b)Os detalhes de um dado curso, contendo o nome, codigo, grau e local;:)
(:<root>{
  let $guid := "15"
  for $x in collection('edc')//curso[guid = $guid]
  return
    ($x/guid, $x/nome, $x/grau, $x/local)
}
</root>:)

(:c) Os departamentos onde é lecionado um dado curso;:)
(:<root>{
  let $elem := collection('edc')//curso[guid = "15"]
    for $y in $elem/departamentos
      return
      <elem>
        {$y/departamento}
      </elem>
}
</root>:)

(:d) As áreas científicas a que pertence um dado curso;:)
(:<root>{
  let $elem := collection('edc')//curso[guid = "15"]
    for $y in $elem/areascientificas
      return
      <elem>
        {$y/areacientifica}
      </elem>
}
</root>:)

(:e) Listagem de cursos por departamento;:)
(:<root>{
  for $y in collection('edc')//curso where $y/departamentos/departamento = "Departamento de Matemática"
    return
    <elem>
      {$y/nome}
    </elem>
}
</root>:)

(:f) Listagem de cursos por área científica;:)
(:<root>{
  for $y in collection('edc')//curso where $y/areascientificas/areacientifica = "Informática"
    return
    <elem>
      {$y/nome}
    </elem>
}
</root>:)

(:g) Listagem de cursos por local;:)
(:<root>{
  for $y in collection('edc')//curso where $y[matches(local, "Aveiro")]
    return
    <elem>
      {$y/nome}
    </elem>
}
</root>:)

(:h) Listagem de departamentos;:)

(:h) Listagem de departamentos;:)
(:<root>{
  for $y in distinct-values(collection('edc')//curso/departamentos/departamento)
  return
    <elem>
      {$y}
    </elem>
}
</root>:)

(:i) Listagem de areas cientificas;:)
(:<root>{
  for $y in distinct-values(collection('edc')//curso/areascientificas/areacientifica)
  return
    <elem>
      {$y}
    </elem>
}
</root>:)

(:j) Listagem de locais;:)
<root>{
  for $y in distinct-values(collection('edc')//curso/local)
  return
    <elem>
      {$y}
    </elem>
}
</root>
let nome = "Steve"
var sobrenome: String? = "Wozniak"


print("\(nome) \(sobrenome ?? "Wozniak")")


if let sobreNome = sobrenome {
    print ("\(nome) \(sobreNome)")
}


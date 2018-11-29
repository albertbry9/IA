# Crear una gramatica
from nltk import CFG

grammar = CFG.fromstring("""
  S -> S 'b' S | S 'c' S | a
""")

print('La gramatica:', grammar)
print('Inicio =>', grammar.start())
print('Productiones =>')

# Mostrar las producciones de la gramatica
print(grammar.productions())

print('Cobertura de palabras ingresadas a la gramatica:')

try:
    grammar.check_coverage(['a','dog'])    
    print("Todas las palabras estan cubiertas")
except:
    print("Error")

try:
    print(grammar.check_coverage(['a','toy']))
except:
    print("Algunas palabras no estan cubiertas")

# Quick sort

## Beskrivning
Tar en array med tal som input och ger en ny array som output, där arrayen är sorterad i storleksordning. Funktionen följer algoritmen för **Quick Sort**.

## Testning
Du kan testa din kod med bifogat rake-test. Men du måste även öva på att göra egna testkörningar med hjälp av `irb` och funktionsanrop i `main.rb`.

## Exempel
```` ruby
quick_sort([17, 1, 8, 2]) #=> [1, 2, 8, 17]
quick_sort([-2, -17, 5, 3]) #=> [-17, -2, 3, 5]
````

## Restriktioner
Skriv funktionen utan inbyggda sorteringsmetoder i Ruby, till exempel `.sort`. Funktionen ska följa algoritmen för Selection sort. På länken nedan kan du läsa mer om algoritmen.

### Tips och länkar
* [Wikipedia: Quick Sort](https://sv.wikipedia.org/wiki/Quicksort)
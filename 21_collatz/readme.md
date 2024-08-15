# Collatz

## Beskrivning

Collatz problem är ett olöst problem inom talteorin. 

Problemet kallas även för bland annat Collatz förmodan, Ulam-förmodan och 3n+1-förmodan.[1] Lothar Collatz formulerade problemet under sin tid som student.

Problemet utgår från en räknelek som börjar med ett positivt heltal n. 

Nästa steg är att dela n med två om det är jämnt, eller multiplicera det med tre och addera ett om det är udda. 

Sedan upprepas detta steg med talet som erhölls genom uträkningen till dess att resultatet blir ett. Detta kan skrivas som en talföljd. Collatz problem är att avgöra om man, oavsett vilket tal man börjar med, kan nå talet ett.

Skriv en funktion som tar ett positivt heltal som input, och returnerar **antalet värden** som input-variabeln har haft när resultatet blir 1.

ex:
````ruby
collatz(1) #=> 1
collatz(2) #=> 2
````



### Tips och länkar

* [Wikipedia: Collatz Conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture)

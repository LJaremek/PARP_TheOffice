## Praca z językiem Haskell
### Uruchamianie gry
```
ghci
:l Main.hs
start
```
### Rozwijanie programu (to jest w materiałach z Moodle)
1. W katalogu roboczym utwórz plik tekstowy o rozszerzeniu .hs (np.
   main.hs ) z kodem, np.:
```
x = 5
increment n = n + 1
main = print (increment x)
```
2. Przejdź do katalogu roboczego i uruchom środowisko GHCi:
```
   ubuntu@primary:~$ cd ~/Home/PARP
   ubuntu@primary:~/Home/PARP$ ghci
   Prelude>
```
3. Wczytaj plik z kodem:
```
Prelude> :l main.hs
*Main>
```
4. Sprawdź działanie definiowanych funkcji i akcji:
``` 
*Main> x
5
*Main> increment 0
1
*Main> main
6
```
5. Możesz edytować plik źródłowy. Po zapisaniu zmian wykonaj polecenie:
```   
*Main> :r
```
6. Zatrzymaj środowisko GHCi poleceniem:
```
*Main> :q
```
## Uruchomienie skończonego programu
   Skończony program możesz:
1. Uruchomić przy użyciu interpretera:
```  
ubuntu@primary:~/Home/PARP$ runhaskell main.hs
```
2. Skompilować (plik musi posiadać akcję main ) i uruchomić otrzymaną
   wersję binarną :
```
ubuntu@primary:~/Home/PARP$ ghc main.hs -O2 -o myprog
ubuntu@primary:~/Home/PARP$ ./myprog
```
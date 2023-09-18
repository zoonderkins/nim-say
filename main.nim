# main.nim

import std/strutils
import ./animals
import ./weather
import ./cowsay

proc readInput(prompt: string): string =
  echo prompt
  var input: string
  if not readLine(stdin, input):
    echo "Failed to read the input"
  else:
    input = input.strip()
    try:
      discard parseFloat(input)
      echo "Error: Input must be a string"
    except ValueError:
      return input

var message: string = readInput("Please enter a message: ")

var animalStr:string = readInput("Please choose an animal (cow/sheep/whale): ")

var eyeStyleStr:string = readInput("Please choose an eye style (normal/dead/greedy/paranoid): ")

var city:string = readInput("Please enter a city: ")

let animalKind =
  if animalStr.strip().toLowerAscii() == "sheep":
    AnimalKind.sheep
  elif animalStr.strip().toLowerAscii() == "whale":
    AnimalKind.whale
  else:
    AnimalKind.cow

let eyeStyle =
  if eyeStyleStr.strip().toLowerAscii() == "dead":
    EyeStyle.dead
  elif eyeStyleStr.strip().toLowerAscii() == "greedy":
    EyeStyle.greedy
  elif eyeStyleStr.strip().toLowerAscii() == "paranoid":
    EyeStyle.paranoid
  else:
    EyeStyle.normal

if city.len == 0:
  city = fetchCity()

let weatherInfo = fetchWeather(city.strip())

echo weatherInfo

echo cowsay(message.strip(), animalKind, eyeStyle) & "\n" & weatherInfo
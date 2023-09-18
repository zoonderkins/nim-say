# cowsay.nim

import std/strutils
import ./animals

proc cowsay*(msg: string, animal: AnimalKind, eyeStyle: EyeStyle): string =
  var lines: seq[string]
  let maxLineWidth = 40
  let msgLen = msg.len

  if msgLen <= maxLineWidth:
    lines = @[msg]
  else:
    lines = msg.splitLines()

  result = " "
  for i in 0..<maxLineWidth + 2:
    result.add("_")
  result.add("\n")

  for i, line in lines:
    if i == 0:
      result.add("/ " & line & " \\\n")
    elif i == lines.len - 1:
      result.add("\\ " & line & " /\n")
    else:
      result.add("| " & line & " |\n")

  result.add(" ")
  for i in 0..<maxLineWidth + 2:
    result.add("-")
  result.add("\n")

  result.add(getAnimalArt(animal, eyeStyle))

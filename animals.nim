# animals.nim

type
  AnimalKind* = enum
    cow, sheep, whale

  EyeStyle* = enum
    normal, dead, greedy, paranoid

proc getAnimalArt*(animal: AnimalKind, eyeStyle: EyeStyle): string =
  var eyes: string
  case eyeStyle
  of EyeStyle.normal:
    eyes = "oo"
  of EyeStyle.dead:
    eyes = "XX"
  of EyeStyle.greedy:
    eyes = "$$"
  of EyeStyle.paranoid:
    eyes = "@@"

  case animal
  of AnimalKind.cow:
    return """
        \\   ^__^
         \\  (""" & eyes & """)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||
      """
  of AnimalKind.sheep:
    return """
        \\   @__@
         \\  (""" & eyes & """)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||
      """
  of AnimalKind.whale:
    return """
       \\
        \\
         \\
                '-.
      .---._     \\ .--'
    /       `-..__)  ,-'
   |    """ & eyes[0] & """           /
    --.__,   .__.,`
     `-.___'._\\_.'
    """

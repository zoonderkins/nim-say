# weather.nim

import std/httpclient

proc fetchCity*(): string =
  var client = newHttpClient()
  try:
    let cityResponse = client.getContent("http://ifconfig.co/city")
    echo "City: ", cityResponse
    if cityResponse.len > 0:
      return cityResponse
    else:
      return "Taipei" # default city
  except Exception as e:
    echo "An error occurred while fetching the city: ", e.msg
    return "Taipei" # default city in case of an error
  finally:
    client.close()

proc fetchWeather*(city: string): string =
  var client = newHttpClient()
  try:
    let weatherResponse = client.getContent("https://wttr.in/" & city & "?format=3")
    if weatherResponse.len > 0:
      return weatherResponse
    else:
      return "Weather info not available"
  except Exception as e:
    echo "An error occurred while fetching the weather: ", e.msg
    return "Weather info not available"
  finally:
    client.close()

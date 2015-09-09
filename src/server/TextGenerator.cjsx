randomInRange = (min, max) ->
  min + Math.random() * (max - min)

capitalizeFirstLetter = (string) ->
  string.charAt(0).toUpperCase() + string.slice(1)

class TextGenerator
  constructor: () ->
    @vowels = 'aeiou'
    @consonants = 'klmnpstwj'

  genFrame: (index, alphabet) ->
    # Index must be integer
    index = Math.round(index)
    result = [];

    loop
      radix = alphabet.length
      remainder = index % radix
      result.push(alphabet[remainder])
      if (index - remainder > 0)
        index = (index - remainder) / radix
      else
        break

    return result

  genWord: (index) ->
    vframe = @genFrame(index, @vowels);
    cframe = @genFrame(index, @consonants);
    result = (cframe[i] + vframe[i] for i in [0 .. cframe.length - 1])
    return result.join('')

  genSentence: (length, min = 0, max = 250) ->
    result = (@genWord(randomInRange(min, max)) for i in [1 .. length])
    return capitalizeFirstLetter(result.join(' ') + '.')

  genText: (length, min = 0, max = 10) ->
    result = (@genSentence(randomInRange(min, max)) for i in [1 .. length])
    return result.join(' ')

twibber.textGenerator = new TextGenerator

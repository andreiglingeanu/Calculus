Wolfram.appid = "K2T5TH-VAQ4Y3P5AH"

class Solver
  def initialize(query)
    @response = Wolfram.fetch(query)
    @interesed_in = {
      :input               => /input/i,
      :result              => /result/i,
      :indefinite_integral => /^indefinite integral/i,
      :definite_integral   => /^definite integral/i,
      :derivative          => /derivative/i,
      :root                => /root (?!plot)/i,
      :approximation       => /approximation/i,
      :solution            => /solution/i,
      :dimensions          => /dimensions/i,
      :determinant         => /determinant/i
    }

    @translations = {
      :input               => "Date de intrare",
      :result              => "Rezultat",
      :indefinite_integral => "Integrala indefinită",
      :definite_integral   => "Integrala definită",
      :derivative          => "Derivata",
      :root                => "Zeroul",
      :approximation       => "Aproximarea",
      :solution            => "Soluție",
      :dimensions          => "Dimensiuni",
      :determinant         => "Determinant"
    }
  end

  def responses
    pods = {}
    @interesed_in.map do |interes, regex|
      @response.pods.map do |pod|
        pods[interes] = pod if pod.to_s =~ regex
      end
    end
    pods
  end

  def plaintext
    plaintexts = {}
    responses.map do |interes, response|
      plaintexts[interes] =
        { plaintext: response.plaintext, translation: @translations[interes]}
    end
    plaintexts
  end

  def imgs
    imgs = {}
    responses.map do |interes, response|
      imgs[interes] =
        { img: response.img["src"], translation: @translations[interes]}
    end
    imgs
  end

  def all
    all = {}
    responses.map do |interes, response|
      all[interes] = { 
        img: response.img["src"],
        translation: @translations[interes],
        plaintext: response.plaintext
      }
    end
    all
  end
end

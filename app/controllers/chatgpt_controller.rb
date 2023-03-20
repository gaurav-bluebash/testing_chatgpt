class ChatgptController < ApplicationController
  skip_before_action :verify_authenticity_token

	def generate
    client = OpenAI::Client.new(access_token: "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")
    response = client.chat(
    parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: "#{params["search"]} + only html code using inline css"}],
    })
    response = response["choices"][0]["message"]["content"]
    file = Tempfile.new([[*'a'..'z',*'A'..'Z'].shuffle[0..6].join,'.html'])
    file.write(response)
    file.rewind
    # system("google-chrome #{file.path}")
    debugger
    render json: {content: response, file: file.path}
	end

  def suggest
    response = HTTParty.get("http://suggestqueries.google.com/complete/search?output=firefox&hl=en&q=#{params["search"]}")
    render json: JSON.parse(response).second
  end

end
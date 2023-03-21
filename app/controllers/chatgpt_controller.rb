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
    # system("google-chrome #{file.path}") #For open the file in new chrome tab
    render json: {content: response, file: file.path}
	end

  def suggest
    response = HTTParty.get("http://suggestqueries.google.com/complete/search?output=firefox&hl=en&q=#{params["search"]}")
    render json: JSON.parse(response).second
  end

end
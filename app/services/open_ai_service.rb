class OpenAiService

  include HTTParty
  
  base_uri('https://api.openai.com/v1')
  
  def initialize
  
    @headers = { "Authorization" => "Bearer #{ENV['OPENAI_API_KEY']}", "Content-Type" => "application/json" } 
  
  end
  
  def generate_text(prompt)
  
    body = { model: "gpt-3.5-turbo", messages: [{ role: "user", content: prompt }], max_tokens: 100 }.to_json
    
    self.class.post("/chat/completions", headers: @headers, body: body) 
  end
  
end
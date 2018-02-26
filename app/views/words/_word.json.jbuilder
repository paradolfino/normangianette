json.extract! word, :eng_si, :nor_si, :created_at, :updated_at, word.phrases
json.extract! phrase
json.url word_url(word, format: :html)
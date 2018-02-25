json.extract! word, :eng_si, :nor_si, :created_at, :updated_at
json.extract! @phrase, :english
json.url word_url(word, format: :html)
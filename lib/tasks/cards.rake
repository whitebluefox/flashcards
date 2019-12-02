require 'open-uri'

namespace :cards do
  desc 'parsing and fill in database'
  task :parsing => :environment do
    puts 'Parsing started'
    doc = Nokogiri::HTML(open('https://sanstv.ru/english_words'),nil,'UTF-8')

    doc.css('tbody tr').each do |tr|
      tr_html = Nokogiri::HTML(tr.to_s)
      original_text = tr_html.css('a')[1].content
      translated_text = tr_html.css('td')[5].content

      Card.create(original_text: original_text,
                  translated_text: translated_text)

      print '.'
    end

    puts '\nParsing finished'
  end
end

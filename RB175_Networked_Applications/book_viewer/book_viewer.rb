require "sinatra"
require "sinatra/reloader"

before do
  @contents = File.readlines("data/toc.txt")
end

helpers do
  def in_paragraphs(text)
    paragraphs = text.split(/\n\n/).map.with_index do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end
    paragraphs.join
  end

  def each_chapter
    @contents.each_with_index do |chapter, index|
      number = index + 1
      text = File.read("data/chp#{number}.txt")
      yield chapter, number, text
    end
  end

  def search_content(query)
    results = []

    each_chapter do |chapter, number, text|
      matches = {}
      text.split("\n\n").each_with_index do |paragraph, index|
        matches[index] = paragraph if paragraph.include?(query)
      end
      results << { chapter: chapter, number: number, paragraphs: matches } if matches.any?
    end
    results
  end

  def highlight(paragraph, query)
    paragraph.gsub(query, "<strong>#{query}</strong>")
  end
end

not_found do
  redirect "/"
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  redirect "/" unless (1..@contents.size).cover?(number)

  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/search" do
  @results = search_content(params[:query]) if params[:query]
  erb :search
end

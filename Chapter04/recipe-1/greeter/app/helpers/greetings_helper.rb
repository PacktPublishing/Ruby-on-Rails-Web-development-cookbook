module GreetingsHelper
  def markdown_to_html(markdown)
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    parser.render(markdown)
  end
end

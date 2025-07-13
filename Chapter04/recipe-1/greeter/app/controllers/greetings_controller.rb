class GreetingsController < ApplicationController
  def show
    @user = "Abbot Johnson"
    @balance = 42.5
    @quote = "Stay hungry, stay foolish."

    markdown = <<~MARKDOWN
      # The Beauty of Ruby
      
      **Ruby is a language designed for humans.** Its creator, Yukihiro "Matz" Matsumoto, famously said he wanted a language that made programmers happy. That spirit lives on. Ruby feels more like writing poetry than code. Its syntax flows naturally, making it easy to express ideas clearly and elegantly. You don’t wrestle with Ruby—you dance with it.
      
      *What sets Ruby apart is its focus on clarity and intention.* It's not obsessed with speed or verbosity. Instead, Ruby emphasizes developer joy. It encourages you to write code that mirrors your thought process, making your intentions obvious not just to the computer, but to fellow humans. In a world where complexity grows quickly, Ruby insists on keeping the human at the center.
      
      __Underneath its simplicity lies depth.__ Ruby doesn’t force you to think like a machine. It invites you to shape the machine around your thinking. That’s why it continues to attract thoughtful, passionate developers. Ruby may not always be the loudest voice in the room, but its quiet elegance continues to inspire those who value clarity, kindness, and craftsmanship in their work.
    MARKDOWN

    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @article = parser.render(markdown)
  end
end

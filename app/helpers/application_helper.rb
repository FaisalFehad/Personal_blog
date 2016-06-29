module ApplicationHelper
def markdown(content)
  renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      no_images: true }

    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end

module TemplateHelpers

  def home
    <<-HTML
<a href="/" class="ink-button blue">
  Mergeți la pagina principală.
  <i class="icon-home"></i>
</a>
    HTML
  end

  def search_bar
    <<-HTML
<div class="search">
  <form action="/query" method="get" class="">
    <input autofocus class="highlight" type="text" placeholder="Tapați" name="q" id="q">
    <span class="icon-search"></span>
  </form>
</div>
    HTML
  end

end

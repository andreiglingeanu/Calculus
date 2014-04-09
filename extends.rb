class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
end

module Kernel

  def home
    <<-HTML
<a href="/" class="ink-button blue">
  Mergeți la pagina principală.
  <i class="icon-home"></i>
</a>
    HTML
  end

end

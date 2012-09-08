class MenuTabBuilder < TabsOnRails::Tabs::Builder
  def open_tabs(options = {})
    @context.tag("ul", options, open = true)
  end

  def close_tabs(options = {})
    "</ul>".html_safe
  end

  def tab_for(tab, name, options, item_options = {})
    item_options[:class] = (current_tab?(tab) ? 'active' : '')
    @context.content_tag(:li, item_options) do
      if item_options.has_key? :icon
        @context.link_to(options, item_options) do
          @context.content_tag(:i, '', :class => item_options[:icon]) + 
          name
        end
      else
        @context.link_to(name, options)
      end
    end
  end
end
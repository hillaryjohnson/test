class NextLinkRenderer < WillPaginate::LinkRenderer

    def to_html
        links = []
    
        if @collection.next_page && @collection.next_page != current_page
          links.push page_link(@collection.next_page, 'next')
        end
    
        links.join @options[:separator]
    end

  private
  
  

 
    def page_link(page, classname)
      @template.link_to @options[:next_label], url_for(page), :rel => rel_value(page), :class => classname
    end

end
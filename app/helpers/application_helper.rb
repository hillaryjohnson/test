# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
def image_button_to(name, options = {}, html_options = {})
  html_options = html_options.stringify_keys
  convert_boolean_attributes!(html_options, %w( disabled ))

  method_tag = ''
  if (method = html_options.delete('method')) && %w{put delete}.include?(method.to_s)
    method_tag = tag('input', :type => 'hidden', :name => '_method', :value => method.to_s)
  end

  form_method = method.to_s == 'get' ? 'get' : 'post'

  request_token_tag = ''
  if form_method == 'post' && protect_against_forgery?
    request_token_tag = tag(:input, :type => "hidden", :name => request_forgery_protection_token.to_s, :value => form_authenticity_token)
  end

  if confirm = html_options.delete("confirm")
    html_options["onclick"] = "return #{confirm_javascript_function(confirm)};"
  end

  url = options.is_a?(String) ? options : self.url_for(options)
  name ||= url

  html_options.merge!("type" => "submit") unless html_options.has_key?("type")
  html_options.merge!("value" => name)


  "<form method=\"#{form_method}\" action=\"#{escape_once url}\" class=\"button-to\"><div>" +
    method_tag + tag("input", html_options) + request_token_tag + "</div></form>"
end

def show_flash_message(options={})
    html = content_tag(:div, flash.collect{ |key,msg| content_tag(:div, msg, :class => key) }, :id => 'flash-message')
    if options.key?(:fade)
      html << content_tag(:script, "setTimeout(\"new Effect.Fade('flash-message');\",#{options[:fade]*1000})", :type => 'text/javascript')
    end
    html
  end


  

end

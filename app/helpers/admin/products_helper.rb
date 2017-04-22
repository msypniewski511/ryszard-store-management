module Admin::ProductsHelper
  def naglowek(path, caption, ses_type, status_on_of)
  	if ses_type == 1
  	  if status_on_of == session[:typ] then
  	  	link_to(image_tag('buttonDown_On.png'), path, remote: true)
  	  else
  	  	link_to(image_tag('buttonDown_Off.png'), path, remote: true)
  	  end
      #link_to caption, path, remote: true
    else
      link_to(image_tag(status_on_of == session[:typ] ? 'buttonUp_On.png' : 'buttonUp_Off.png'), path, remote: true)
      #link_to caption, path, remote: true
    end
  end
end

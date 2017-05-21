module ApplicationHelper
  def add_product_link(text, product)
  	link_to text, {url: {controller: 'cart',
  		action: 'add',
  		id: product}, remote: true},
  		{title: 'Add to Cart',
  			href: url_for(controller: "cart", action: 'add',
  				id: product)}
  end

  def add_product_button(text, product)
  	button_to text, cart_add_path(id: product.id), remote: true, 
  	  title: 'Add to Cart'
  end
end

module UsuariosHelper
  # Returns the Gravatar for the given usuario.
   def gravatar_for(usuario)
     gravatar_id = Digest::MD5::hexdigest(usuario.usuario.downcase)
     gravatar_url = "http://xpages.info/XPagesHome.nsf/developer_head.png"
     image_tag(gravatar_url, alt: usuario.usuario, class: "gravatar")
   end
end

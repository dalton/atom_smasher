Rails.application.routes.draw do

  mount AtomSmasher::Engine => "/atom_smasher"
end

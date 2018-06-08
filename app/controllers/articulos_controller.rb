class ArticulosController < ApplicationController
  before_action :authenticate_autor!, except: [:index, :show]
  before_action :correct_autor, only: [:edit, :update, :destroy]
  def new
    @articulo = current_autor.articulos.build
    @boton = "Crear"
  end

  def index
    @articulos = Articulo.all.order("created_at DESC")
  end

  def create
      @articulo = current_autor.articulos.build(articulo_params)
      if @articulo.save
        redirect_to @articulo
      else
        render 'new'
      end

  end

  def edit
    @articulo = Articulo.find(params[:id])
    @boton = "Modificar"
  end

  def update
    @articulo = Articulo.find(params[:id])
    if @articulo.update(articulo_params)
      flash[:notice] = "Artículo modificado correctamente"
      redirect_to @articulo
    else
      render 'edit'
    end
  end

  def show
    @articulo = Articulo.find(params[:id])
  end

  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy
    flash[:notice] = "Artículo eliminado correctamente"
    redirect_to articulos_path
  end

  private
  def articulo_params
    params.require(:articulo).permit(:titulo, :contenido)
  end
  def correct_autor
    @articulo = current_autor.articulos.find_by(id: params[:id])
    redirect_to articulos_path, notice: "No estás autorizado para editar este artículo" if @articulo.nil?
  end
end

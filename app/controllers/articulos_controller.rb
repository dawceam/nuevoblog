class ArticulosController < ApplicationController
  def new
    @articulo = Articulo.new
    @boton = "Crear"
  end

  def index
    @articulos = Articulo.all.order("created_at DESC")
  end

  def create
      @articulo = Articulo.new(articulo_params)
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
end

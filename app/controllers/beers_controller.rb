class BeersController < ApplicationController
  def index
    page = params[:page].to_i
    limit = 5

    if params[:limit]
      limit = params[:limit].to_i
    end

    if page > 0
			offset = (page * limit)
    end

    @beers = Beer.all.offset(offset).limit(limit)
    @count = Beer.count

    render json: { ct: @count, data: @beers }

    rescue => e
      logger.info e
      render json: { message: e }, status: :bad_request
  end

  def show
    @beer = Beer.find(params[:id])
    render json: @beer

    rescue => e
      logger.info e
      render json: { message: 'beer not found' }, status: :not_found
  end

  def create
    @beer = Beer.new(
      name: params[:name],
      description: params[:description],
      category: params[:category],
      image_url: params[:image_url],
    )

    if @beer.save
      render json: @beer, status: :created
    else
      render json: @beer.errors, status: :unprocessable_entity
    end

    rescue => e
      logger.info e
      render json: { message: e }, status: :bad_request
  end

  def update
    @beer = Beer.find(params[:id])

    if params[:name]
      @beer.name = params[:name]
    end
    if params[:description]
      @beer.description = params[:description]
    end
    if params[:category]
      @beer.category = params[:category]
    end
    if params[:image_url]
      @beer.image_url = params[:image_url]
    end

    if @beer.save
      render json: @beer, status: :ok
    else
      render json: @beer.errors, status: :unprocessable_entity
    end

    rescue => e
      logger.info e
      render json: { message: e }, status: :bad_request
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    render json: { message: 'ok' }, status: :ok

    rescue => e
      logger.info e
      render json: { message: e }, status: :bad_request
  end

end
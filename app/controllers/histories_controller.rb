class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[index new show create]
  # before_action :scrapes, only: %i[create]

  def index
    @histories = History.all
  end

  def new
    @history = current_user.histories.build
    @categories = Category.all
    @category = Category.new
    @category_details = CategoryDetail.all
  end

  def create
    @history = current_user.histories.build(history_params)
    if @history.save
      @history_detail = @history.history_detail.create(item_list)
      if @history_detail.create
        redirect_to history_path(@history), notice: '保存できました'
      else
        flash.now[:error] = '保存に失敗しました'
      end
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def show
    @history = History.find(params[:id])
    # @history_detail = HistoryDetail.find_by(params[:history_id])

    @history_details = HistoryDetail.where(history_id: @history.id)
    income = current_user.income_id
    family = current_user.family_id
    @deduction = DeductionList.find_by(income_id: income, family_id: family)
  end

  private
  def history_params
    params.require(:history).permit(:category_id)
  end

  # def category_list
  #   @category_detail_list = CategoryDetail.where(category_id: params[:history][:category_id])
  # end

  # def history_detail_params
  #   params.require(:history_detail).permit(:link, :name, :city, :price, :description, :picture_image_path, :review_image_path)
  # end


  def item_list
    require 'nokogiri'
    require 'open-uri'
    require 'json'
    
    url = 'https://www.satofull.jp/products/list.php?cat=' + Category.find(@history.category_id).satofull_id
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end
  
    doc = Nokogiri::HTML.parse(html, nil, charset)
    nodes = doc.xpath('//ul[@class="ItemList"]')
  
    array = []
    lists = []
  
    nodes.css('a').first(5).each do |node|
      link = 'https://www.satofull.jp' + node[:href]
      name = node.css('.ItemList__name').text
      city = node.css('.ItemList__city').text
      price = node.css('.ItemList__price>span').text.delete(',').to_i
      description = node.css('.ItemList__description').text
      picture_image_path = 'https://www.satofull.jp' + node.css('.ItemList__picture>img').attribute('src')
      review_image_path = 'https://www.satofull.jp' + node.css('.ItemList__review>img').attribute('src')
      array << [link, name, city, price,description, picture_image_path, review_image_path]
    end
    array.each do |t|
      item = HistoryDetail.new
      item.history_id = @history.id
      item.link = t[0]
      item.name = t[1]
      item.city = t[2]
      item.price = t[3]
      item.description = t[4]
      item.picture_image_path = t[5]
      item.review_image_path = t[6]
      item.save
    end
  end
end

    # array.shuffle.each do |t|
    #   lists << t.first(4)
    #   lists.each do |list|
    #     item = HistoryDetail.new
    #     item.history_id = @history.id
    #     item.link = list[0]
    #     item.name = list[1]
    #     item.city = list[2]
    #     item.price = list[3]
    #     item.description = list[4]
    #     item.picture_image_path = list[5]
    #     item.review_image_path = list[6]
    #     item.save
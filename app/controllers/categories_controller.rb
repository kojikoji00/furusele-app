class CategoriesController < ApplicationController

  def new
    @categories = Category.all
    gon.category_details = CategoryDetail.all
    income = current_user.income_id
    family = current_user.family_id
    @deduction = DeductionList.find_by(income_id: income, family_id: family)
    # @category_details = CategoryDetail.where(category_id: params[:category_id])
    # binding.pry
    # @category = Category.new
    # @category_detail = @category.category_details.new
  end

  def create
    # category = Category.new(category_params)
    # @category = Category.find(category.id)
    # @category_details = CategoryDetrail.where(category_id: params[:category_id])
    binding.pry
    @category_detail = Category_detail.new(id: params[:id])
    render json: @category_detail

    require 'nokogiri'
    require 'open-uri'
    require 'json'
    url = 'https://www.satofull.jp/products/list.php?cat=' + @category_detail.satofull_id
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end
  
    doc = Nokogiri::HTML.parse(html, nil, charset)
    nodes = doc.xpath('//ul[@class="ItemList"]')
  
    array = []

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
    @history = current_user.histories.create
    array.each do |t|
      item = @history.history_detail.new
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
    redirect_to history_path(@history)
  end

  private
  # def category_params
  #   params.require(:category).permit(:id, :satofull_id)
  # end

  # def category_detail_params
  #   params.require(:category_detail).permit(:id, :category_id)
  # end
end
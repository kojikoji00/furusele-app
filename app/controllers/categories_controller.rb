class CategoriesController < ApplicationController

  # def index
  #   @categories = Category.all
  # end

  def new
    @category = Category.new
    @categories = Category.all
    # @category_detail = CategoryDetails.new
    @category_details = CategoryDetail.all
  end

  def create
    @category = Category.new(category_params)
    redirect_to category_path(@category)
  end
    # @category_detail = Category_detail.build(item_list)
    # category_detail = CategoryDetail.new(category_detail_params)

  def show
    @category = Category.find(params[:id])
    @category_detail = @category.category_details.new(item_list)
    # @category_details = CategoryDetail.where(category_id: @category.id)
    income = current_user.income_id
    family = current_user.family_id
    @deduction = DeductionList.find_by(income_id: income, family_id: family)
  end

  private
  def category_params
    params.require(:category).permit(:id)
  end
  def category_detail_params
    params.require(:category_detail).permit(:category_id)
  end

  def item_list
    require 'nokogiri'
    require 'open-uri'
    require 'json'
    url = 'https://www.satofull.jp/products/list.php?cat=' + @category.satofull_id
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
    # @item = array
  end
end
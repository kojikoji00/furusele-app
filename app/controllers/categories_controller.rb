class CategoriesController < ApplicationController

  def new
    @categories = Category.all
    gon.category_details = CategoryDetail.all
    # income = current_user.income_id
    # family = current_user.family_id
    # @deduction = DeductionList.find_by(income_id: income, family_id: family)
  end

  def create
    if user_signed_in?
      income = current_user.income_id
      family = current_user.family_id
      @deduction = DeductionList.find_by(income_id: income, family_id: family)
    end
    category_first = Category.new(id: params[:category_id_first])
    @category_first = Category.where(id: category_first.id).first
    category_second = Category.new(id: params[:category_id_second])
    @category_second = Category.where(id: category_second.id).first
    category_third = Category.new(id: params[:category_id_third])
    @category_third = Category.where(id: category_third.id).first
    category_detail_first = CategoryDetail.new(id: params[:category_detail_id_first])
    @category_detail_first = CategoryDetail.where(id: category_detail_first.id).first
    category_detail_second = CategoryDetail.new(id: params[:category_detail_id_second])
    @category_detail_second = CategoryDetail.where(id: category_detail_second.id).first
    category_detail_third = CategoryDetail.new(id: params[:category_detail_id_third])
    @category_detail_third = CategoryDetail.where(id: category_detail_third.id).first


    # スクレイピングの実行
    if category_select_first.blank? && category_select_second.blank? && category_select_third.blank?
      flash.now[:error] = 'カテゴリーを１つ以上選択してください'
      render :new
    else
      require 'nokogiri'
      require 'open-uri'
      require 'json'
      if user_signed_in?

        url = 'https://www.satofull.jp/products/list.php?cat=' + category_select_first + category_select_second + category_select_third + '&pri=' +@deduction.deduction_id.to_s
      else
        url = 'https://www.satofull.jp/products/list.php?cat=' + category_select_first
      end
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
  end
    # else
        # @history = current_user.histories.create
        # array.each do |t|
          # item = @history.history_detail.new
          # item.history_id = @history.id
        #   item.link = t[0]
        #   item.name = t[1]
        #   item.city = t[2]
        #   item.price = t[3]
        #   item.description = t[4]
        #   item.picture_image_path = t[5]
        #   item.review_image_path = t[6]
        # end
        # redirect_to 
  
  def category_select_first
    if @category_detail_first.nil?
      if @category_first.nil?
        ""
      else
        @category_first.satofull_id + ','
      end
    else
      @category_detail_first.satofull_id + ','
    end
  end
  def category_select_second
    if @category_detail_second.nil?
      if @category_second.nil?
        ""
      else
        @category_second.satofull_id + ','
      end
    else
      @category_detail_second.satofull_id + ','
    end
  end
  def category_select_third
    if @category_detail_third.nil?
      if @category_third.nil?
        ""
      else
        @category_third.satofull_id
      end
    else
      @category_detail_third.satofull_id
    end
  end
  # private
  # def category_params
  #   params.require(:category).permit(:id, :satofull_id)
  # end

  # def category_detail_params
  #   params.require(:category_detail).permit(:id, :category_id)
  # end
end
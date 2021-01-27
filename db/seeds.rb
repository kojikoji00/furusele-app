# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

categories_csv = CSV.readlines("db/categories.csv")
categories_csv.shift
categories_csv.each do |row|
  Category.create(id: row[0], name: row[1], satofull_id: row[2])
end

category_details_csv = CSV.readlines("db/category_details.csv")
category_details_csv.shift
category_details_csv.each do |detail_row|
  CategoryDetail.create(id: detail_row[0], name: detail_row[1], category_id: detail_row[2], satofull_id: detail_row[3])
end


#!/usr/bin/env ruby
# encoding: UTF-8

# Read "20130103-postasi_stevilke.html" and do cleanup.
# Write file postne_stevilke.yml

require "bundler/setup"
require 'nokogiri'
require 'csv'
require 'pry'
# binding.pry

html_file = File.open "../data/20130103-postasi_stevilke.html"
doc = Nokogiri::HTML html_file, nil, 'utf-8'

csv = CSV.open("../data/20130103-postasi_stevilke.csv", "wb") do |csv|
  doc.xpath("//div[@class='faqdiv2']/ul").each_with_index do |ul,i|
    post_code, town, more = ul.children.map(&:content).map(&:strip)
    csv << [post_code, town, more, "Slovenija"] unless i == 0
  end
end

html_file.close

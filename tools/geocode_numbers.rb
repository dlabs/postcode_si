#!/usr/bin/env ruby
# encoding: UTF-8

require 'bundler/setup'
require 'oj'
require 'csv'
require 'net/http'
require 'uri'

csv = CSV.open("../data/20130103-postasi_stevilke.csv","rb:utf-8")
out_csv = CSV.open("../data/20130103-stevilke_final.csv", "wb")

csv.each_with_index do |row,i|
    address = URI.escape row.map(&:strip).join("+")
    uri = URI("http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=#{address}")
  
    # break if i == 3
  
    response = Net::HTTP.get_response(uri) 
    unless response.is_a?(Net::HTTPSuccess)
      puts "#{address}"
      next
    end
    
    oj = Oj.load response.body
    
    unless oj["status"] == "OK"
      puts "#{address}"
      next
    end
    
    # lat, lng
    location = oj["results"].first["geometry"]["location"].values rescue [nil,nil]
    out_csv << row.push(location).flatten
    sleep 1
end

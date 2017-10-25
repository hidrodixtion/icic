require "icic/version"
require 'mini_magick'
require 'fileutils'
require 'json'
require 'tty-prompt'

module Icic
  class DrawableGenerator
	  def self.runPrompt()
	    prompt = TTY::Prompt.new

	    options = {}
	    options[:input] = prompt.ask('Original icon?', required: true)
	    options[:platform] = prompt.select('Platform?', %w(ios android))

	    original_name = File.basename(options[:input], ".*")
	    original_dir = File.dirname options[:input]
	    
	    name = prompt.ask("Output filename? (press enter to use input's filename)") do |a|
	      a.modify :trim
	    end

	    options[:name] = (name == nil || name.empty?) ? original_name : name

	    output = prompt.ask("Output folder? (press enter to use input's parent folder)") do |a|
	      a.modify :trim
	    end

	    options[:output] = (output == nil || output.empty?) ? original_dir : output

	    # p options 
	    (options[:platform] == 'ios') ? generate_ios(options) : generate_android(options)
	  end

	  # GENERATE IOS ICONS
	  def self.generate_ios(options)
	    contents_json = {
	        images: [],
	        info: {
	            version: 1,
	            author: 'xcode'
	        }
	    }
	    dirname = "#{options[:output]}/#{options[:name]}.imageset"
	    FileUtils.makedirs dirname
	    arr = ['', '2x', '3x']
	    arr.each do |res|
	      img = MiniMagick::Image.open(options[:input])
	      img.format 'png'

	      case res
	        when ''
	          img.resize '29x29'
	        when '2x'
	          img.resize '58x58'
	        when '3x'
	          img.resize '87x87'
	        else
	          break
	      end

	      imageobj = {
	          idiom: 'universal',
	          filename: (res == '' ? "#{options[:name]}.png" : "#{options[:name]}_#{res}.png"),
	          scale: res == '' ? '1x' : res
	      }

	      filepath = "#{dirname}/#{imageobj[:filename]}"
	      img.write filepath

	      contents_json[:images] << imageobj
	    end
	    File.open("#{dirname}/Contents.json", 'w') do |file|
	      file.write(JSON.pretty_generate(contents_json))
	    end

	    puts "\n"
	    puts "SUCCESS! Assets generated at #{options[:output]}/#{options[:name]}.imageset"
	  end

	  # GENERATE ANDROID ICONS
	  def self.generate_android(options)
	    arr = %w(mdpi hdpi xhdpi xxhdpi xxxhdpi)
	    arr.each do |res|
	      img = MiniMagick::Image.open(options[:input])
	      img.format 'png'

	      case res
	        when 'mdpi'
	          img.resize '24x24'
	        when 'hdpi'
	          img.resize '36x36'
	        when 'xhdpi'
	          img.resize '48x48'
	        when 'xxhdpi'
	          img.resize '72x72'
	        when 'xxxhdpi'
	          img.resize '96x96'
	        else
	          break
	      end

	      # p "output: #{options[:output]}/drawable-#{res}/#{options[:name]}.png"
	      FileUtils.makedirs "#{options[:output]}/res/drawable-#{res}/"
	      img.write "#{options[:output]}/res/drawable-#{res}/#{options[:name]}.png"
	    end

	    puts "\n"
	    puts "SUCCESS! Assets generated at #{options[:output]}/res"
	  end
	end
end

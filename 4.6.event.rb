
# def event(description)
#   puts "ALERT: #{descripion}" if yield
# end
# load 'events.rb'

# event "常に発生するイベント" do
#   true
# end

# event "絶対に発生しないイベント" do
#   false
# end

# def  monthly_sales
#   110
# end

# target_sales = 100

# event "月間売り上げが驚くほど高い" do
#   monthly_sales > target_sales
# end

# event "月間売り上げが底なしに低い" do
#   monthly_sales < target_sales
# end


setup do
  puts '空の高さを設定'
  @sky_height = 100
end

setup do
  puts '山の高さを設定'
  @mountains_height = 200
end

event '空が落ちてくる' do
  @sky_height < 300
end

event '空が近づいている' do
  @sky_height < @mountains_height
end

event 'もうダメだ....手遅れになってしまった...' do
  @sky_height < 0
end


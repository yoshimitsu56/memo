require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  title = gets.chomp
  
  puts "・メモしたい内容を記入してください"
  puts "・完了したらCtrl+Dを押します"
  contents = readlines(chomp: true)
  
  CSV.open("#{title}.csv","w")do |csv|
    csv << contents
  end

elsif memo_type == 2
  puts "・編集したいファイル名を拡張子を除いて入力してください"
  title = gets.chomp

  puts "・追記したい内容を記入してください"
  puts CSV.read("#{title}.csv")
  addContents = readlines(chomp: true)
  
  CSV.open("#{title}.csv","a")do |csv|
    csv << addContents
  end
  
else 
  puts "1か2を入力してください"
end
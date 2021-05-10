require 'digest'

ENCRYPTION_METHODS = %w[MD5 SHA1].freeze

puts 'Введите слово или фразу для шифрования:'
user_input = STDIN.gets.chomp

puts 'Каким способом зашифровать:'
ENCRYPTION_METHODS.each.with_index(1) { |method, index| puts "#{index}. #{method}" }

user_option = STDIN.gets.chomp

until %w[1 2].include?(user_option)
  puts 'Вы ввели неверное значение'
  user_option = STDIN.gets.chomp
end

puts 'Вот что получилось:'
if user_option == '1'
  puts Digest::MD5.hexdigest user_input
else
  puts Digest::SHA1.hexdigest user_input
end

require 'digest'

ENCRYPTION_METHODS = %w[MD5 SHA1 SHA2].freeze

puts 'Введите слово или фразу для шифрования:'
user_input = STDIN.gets.chomp

puts 'Каким способом зашифровать:'
ENCRYPTION_METHODS.each.with_index(1) { |method, index| puts "#{index}. #{method}" }

user_option = STDIN.gets.chomp.to_i

until (1..ENCRYPTION_METHODS.count).include?(user_option)
  puts 'Вы ввели неверное значение'
  user_option = STDIN.gets.chomp.to_i
end

puts 'Вот что получилось:'
hash = case user_option
       when 1
         Digest::MD5.hexdigest user_input
       when 2
         Digest::SHA1.hexdigest user_input
       else
         Digest::SHA2.hexdigest user_input
       end

puts hash

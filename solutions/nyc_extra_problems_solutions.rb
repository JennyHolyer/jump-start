# chunk an array into nested arrays of length n
def chunk(arr, n)
  chunk = []
  results = []
  arr.each do |el|
    if chunk.length == n
      results << chunk
      chunk = []
    end
    chunk << el
  end

  results << chunk
end

puts "---------chunk-------"
puts chunk([1, 8, 9, 4, "hey", "there"], 2) == [[1, 8], [9, 4], ["hey", "there"]]
puts chunk([10, 9, 8, 7, 6, 5, 4], 3) == [[10, 9, 8], [7, 6, 5], [4]]

# Translate into pig-latin! First consonants go to the end of a word. End with "ay"
def pig_latin(sentence)
  sentence.split.map { |word| latinify(word) }.join(" ")
end

def latinify(word)
  vowels = "aeiou".chars
  until vowels.include?(word[0].downcase)
    word = word[1..-1] + word[0]
  end
  word + "ay"
end

puts "---------pig latin-------"
puts pig_latin("i speak pig latin") == "iay eakspay igpay atinlay"
puts pig_latin("throw me an aardvark") == "owthray emay anay aardvarkay"

# Remove the nth letter of the string
def remove_nth_letter(str, n)
  str[0...n] + str[n + 1..-1]
end

puts "---------remove nth letter-------"
puts remove_nth_letter("helloworld", 5) == "helloorld"
puts remove_nth_letter("helloworld", -3) == "hellowold"

# Boolean function: check if  shortstr is a substring of longstr
def substring?(longstr, shortstr)
  length = shortstr.length
  letters = longstr.chars
  letters.each_with_index do |letter, i|
    return true if letters[i...i + length].join == shortstr
  end
  false
end

puts "---------substring-------"
puts substring?("thisisaverylongstring", "sisa") == true
puts substring?("thisisaverylongstring", "ting") == false
puts substring?("whatifikeptontypingforever", "ik") == true

# count the number of times that two adjacent numbers in an array add up to n.
# You cannot reuse a number. So count_adjacent_sums([1, 5, 1], 6) => 1

def count_adjacent_sums(arr, n)
  count = 0
  (1...arr.length).each do |i|
    num = arr[i]
    if num + arr[i - 1] == n && num != arr[i - 2]
      count += 1
    end
  end

  count
end

puts "---------count adjacent sums-------"
puts count_adjacent_sums([7, 2, 4, 6, 8, 10], 7) == 0
puts count_adjacent_sums([6, 7, 11, 2, 5, 10, 3], 13) == 3
puts count_adjacent_sums([1, 9, 1, 8, 2, 10], 10) == 2

# update the older inventory with the newer inventory. Add any new items to the
# hash and replace the values for items that already exist.

def inventory_hash(older, newer)
  newer.each do |key, val|
    older[key] = val
  end
  older
end

puts "---------inventory hash-------"
march = {rubies: 10, emeralds: 14, diamonds: 2}
april = {emeralds: 27, moonstones: 5}
puts inventory_hash(march, april) == {rubies: 10, emeralds: 27, diamonds: 2, moonstones: 5}

# Now, alphabetical order matters in your inventory. Insert new inventory items into
# your array in the appropriate place
def inventory_array(older, newer)
  newer.each do |item|
    name, quantity = item
    older.reject! { |olditem| olditem[0] == name }
    older << item
  end

  older.sort { |item_a, item_b| item_a[0] <=> item_b[0] }
end

puts "---------inventory array-------"
march_arr = [['diamonds', 2], ['emeralds', 14], ['rubies', 10]]
april_arr = [['emeralds', 27], ['moonstones', 5]]
puts inventory_array(march_arr, april_arr) == [['diamonds', 2], ['emeralds', 27], ['moonstones', 5], ['rubies', 10]]

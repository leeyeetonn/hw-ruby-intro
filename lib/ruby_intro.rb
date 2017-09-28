# When done, submit this entire file to the autograder.

# Part 1

def sum arr
    return 0 if arr.length == 0
    res = 0
    arr.each {
	|num|
        res += num
    }
    res
end

def max_2_sum arr
    return 0 if arr.length == 0
    return arr[0] if arr.length == 1
    num1 = arr.max
    arr.delete_at(arr.index(num1))
    num2 = arr.max
    return num1 + num2
end

def sum_to_n? arr, n
    return false if arr.length == 0
    # add the biggest element to the 2nd biggest
    # if < n, false
    return false if max_2_sum(arr.last(2))  < n
    # sort array to run algo
    sorted = arr.sort
    # 2 index sliding depending on the sum
    start = 0
    ending = arr.length - 1
    while true 
        # the 2 index meet, no way to have a sum == n
        return false if start == ending
        # the sum is too small, need a bigger left bound
        if sorted[start] + sorted[ending] < n
            start += 1
        # the sum == n, found the pair, return true
        elsif sorted[start] + sorted[ending] == n
            return true
        else    # the sum is too big, need a smaller right bound
            ending -= 1
        end
    end
end

# Part 2

def hello(name)
    return "Hello, " + name
end

def starts_with_consonant? s
    # empty string
    return false if s.length == 0
    # get the first char in string in lowercase
    first = s.downcase.chr
    # if did not find a match from a to z, not an alpha
    return false if first.match(/[a-z]/).nil?
    # if not consonant, false
    return false if first == "a" || first == "e" || first == "i" || first == "o" || first == "u"
    true
end

def binary_multiple_of_4? s
    return false if s.length == 0
    num = 0
    char_arr = s.chars
    char_arr.each_with_index {
        |c, ind|
        # not a valid binary number
        return false if c.match(/[0-1]/).nil?
        # if the digit is 1, calc the corresponding num
        if c.to_i == 1
           num += 2 ** (char_arr.length - ind - 1)
        end
    }
    return true if num % 4 == 0
    false 
end

# Part 3

class BookInStock
    attr_accessor :isbn
    attr_accessor :price
    def initialize (isbn, price)
        raise ArgumentError if isbn.length == 0 || price <= 0
        @isbn = isbn
        @price = price 
    end 
    def price_as_string
        price_2f = "%.2f" % @price
        "\$#{price_2f}"
    end
end

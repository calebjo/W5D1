class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    prc = Proc.new {|k, v| self << [k, v] }
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end

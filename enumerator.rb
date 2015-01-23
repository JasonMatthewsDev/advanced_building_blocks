module Enumerable

	def my_each
		self.length.times { |i| yield(self[i]) } if self.is_a? Array
		self.length.times { |i| yield(self.keys[i], self.values[i]) } if self.is_a? Hash

		self
	end

	def my_each_with_index
		self.length.times { |i| yield(self[i], i) } if self.is_a? Array
		self.length.times { |i| yield(self.keys[i], self.values[i], i) } if self.is_a? Hash

		self
	end

	def my_select
		if self.is_a? Array
			arr = []
			self.my_each_with_index { |item, index| arr.push(self[index]) if yield(item) }
			return arr
		elsif self.is_a? Hash
			arr = {}
			self.my_each { |key, val| arr[key] = val if yield(key, val) }
			return arr
		end

		self
	end

	def my_all?
		if self.is_a? Array
			self.my_select { |i| yield(i) } == self ? (return true) : (return false)
		elsif self.is_a? Hash
			self.my_select { |k, v| yield(k, v) } == self ? (return true) : (return false)
		end

		self
	end

	def my_any?
		if self.is_a? Array
			self.my_select { |i| yield(i) }.empty? ? (return false) : (return true)
		elsif self.is_a? Hash
			self.my_select { |k, v| yield(k, v) }.empty? ? (return false) : (return true)
		end

		self
	end

	def my_none?
		if self.is_a? Array
			return !self.any? { |i| yield(i) }
		elsif self.is_a? Hash
			return !self.any? { |k, v| yield(k, v) }
		end

		self
	end


	def my_count
		if self.is_a? Array
			return self.my_select { |i| yield(i) }.length
		elsif self.is_a? Hash
			return self.my_select { |k, v| yield(k, v) }.length
		end

		self
	end

	def my_map()
		if self.is_a? Array
			ret = []
			self.my_each { |i| ret.push(yield(i)) }
			return ret
		elsif self.is_a? Hash
			ret = {}
			self.my_each { |k, v| ret[k] = yield(k, v) }
			return ret
		end
	end	

	def my_inject(p = nil)
		p = self[0] if !p
		
		self.my_each_with_index { |i, n| p = yield(p, i) unless (p == self[0] && n == 0) }
		
		p
	end

end

def multiply_els(array)
	array.my_inject {|tot, i| tot *= i}
end
#remove

array = (1..25).to_a
hash = {key1: 1, key2: 2, key3: 3, key4: 4, key5: 5}
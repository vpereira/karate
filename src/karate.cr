require "./karate/*"

class Karate
    getter :sorted_array

    @sorted_array : Array(Int32)
    @default_range : Range(Int32, Int32)

    def initialize(array)
      @empty_range = (0..-1)
      @sorted_array = array.sort
      @default_range = (0..(@sorted_array.size-1))
    end

    def chop(guess)
      search_range = @default_range
      while search_range.size > 0
         mdx = 0
         mdx = middle_of_range(search_range)
         middle_item = @sorted_array[mdx]
         if guess == middle_item
           return mdx
         elsif guess < middle_item
           search_range = left_range(mdx)
         else
           search_range = right_range(mdx, search_range.max)
         end
      end
     -1 # not found
    end

   def middle_of_range(range = @default_range)
     if range.size>0
       range.min + (range.max-range.min) / 2
     else
       -1 # never gonna happen
     end
   end

   def left_range(excluded_index = middle_of_range())
     excluded_index ? 0..(excluded_index-1) : @empty_range
   end

   def right_range(excluded_index = middle_of_range(), max = @default_range.max)
     excluded_index ? (excluded_index+1)..max : @empty_range
   end

end

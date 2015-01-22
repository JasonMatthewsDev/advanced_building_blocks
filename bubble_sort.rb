def bubble_sort(arr)
    itt = 0
    
    begin
        sorted = true
        itt += 1
        (arr.length - itt).times do |i|
            if arr[i] > arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted = false
            end
        end
        arr
    end while !sorted
    arr
end

def bubble_sort_by(arr)
    itt = 0
    
    begin
        sorted = true
        itt += 1
        (arr.length - itt).times do |i|
            if yield(arr[i], arr[i+1]) < 0
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted = false
            end
        end
        arr
    end while !sorted
    arr
end

bubble_sort([4,3,78,2,0,2])

bubble_sort_by(["hi","hello","hey"]) do |left,right|
    right.length - left.length
end

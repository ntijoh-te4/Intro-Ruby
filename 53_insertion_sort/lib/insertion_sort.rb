def insertion_sort(array)
    unsorted_array = Array.new(array)
    sorted_array = [unsorted_array.delete_at(0)]
    while unsorted_array.length > 0
        element_to_insert = unsorted_array.delete_at(0)
        insertion_index = index_for_insertion(sorted_array, element_to_insert)
        sorted_array.insert(insertion_index, element_to_insert)
    end
    return sorted_array
end

def index_for_insertion(sorted_array, element)
    tested_index = sorted_array.length - 1
    while tested_index >= 0
        if element >= sorted_array[tested_index]
            return tested_index + 1
        end
    tested_index -= 1
    end
    return 0
end
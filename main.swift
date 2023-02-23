func radixSort(arr: [Int]) -> [Int] {
    var result = arr
    let base = 10
    var digit = 1
    var done = false
    
    func rsorted(_ nums: [Int]) -> (Bool, [Int]) {
        var lastDigit = true
        var result: [Int] = []
        var aux: [[Int]] = Array(repeating: [], count: base)
        
        for num in nums {
            if (num / digit) > 0 { lastDigit = false }
            aux[(num / digit) % base].append(num)
        }
        
        for nums in aux {
            for num in nums {
                result.append(num)
            }
        }
        
        return (lastDigit, result)
    }
    
    while !done {
        (done, result) = rsorted(result)
        digit *= base
    }
    
    return result
}
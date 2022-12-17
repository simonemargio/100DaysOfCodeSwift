var aYear =  Int(readLine()!)!

func isLeap(year: Int) {
    
    var leap = "NO"
    
    //IF divisible by 4 with no remainders.
    if year % 4 == 0 {
        leap = "YES"
        //Is leap year, unless:
    }
    if year % 100 == 0 {
        leap = "NO"
        //Is not leap year, unless:
    }
    if year % 400 == 0 {
        leap = "YES"
        //Is leap year.
    }
    
    print(leap)
}
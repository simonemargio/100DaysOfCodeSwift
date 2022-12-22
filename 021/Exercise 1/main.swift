func isOdd(n: Int) -> Bool {
  if n % 2 == 0 {
    return false
  }
  return true
}

let numberIsOdd = isOdd(n: 54)
print(numberIsOdd)
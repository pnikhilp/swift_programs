
let single = ["","one","two","three","four","five","six","seven","eight","nine"]
let dbl = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
let tenmulty = ["","","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety"]
let tpower = ["hundred","thousand","lakh","million"]


func oneToNine(number:Int)->String{
    let num = number
    var word = " "
    word = single[num]
    return word
}
func tenToNineteen(number:Int)->String{
    let num = number
    var word = " "
    word = dbl[num%10]
    return word
    
}
func twentyTon(number:Int)->String{
    let num = number
    var word = " "
    if num%10 == 0{
        word = tenmulty[num/10]
    }
    word = tenmulty[num/10]+" "+oneToNine(number: num%10)
    return word
    
}

func hundred(number:Int)->String{
    let num = number
    let n = num%100
    var word = " "
    word = oneToNine(number: num/100)+" "+tpower[0]+" "+oneToNine(number: num%10)
    if n/10 == 1{
        word = oneToNine(number: num/100)+" "+tpower[0]+" "+tenToNineteen(number: num%100)
    }
    if n/10 > 1{
         word = oneToNine(number: num/100)+" "+tpower[0]+" "+twentyTon(number: num%100)
    }
    return word
}

func thousand(number:Int)->String{
    let num = number
    let n = num%1000
    var word = " "
 
      word = oneToNine(number: num/1000)+" "+tpower[1]+" "+hundred(number: n)
 if n < 100{
    
    if n < 99{
        word = oneToNine(number: num/1000)+" "+tpower[1]+" "+twentyTon(number: n)
    }
    if n < 20{
        word = oneToNine(number: num/1000)+" "+tpower[1]+" "+tenToNineteen(number: n)
    }
    if n < 10{
        word = oneToNine(number: num/1000)+" "+tpower[1]+" "+oneToNine(number: n)
     }
    
    }
    
    return word
}

func tenthousand(number:Int)->String{
    let num = number
    let n = num%1000
    var word = " "
     word = tenToNineteen(number: num/1000)+"thousand"+hundred(number: n)
    return word
}


func numberToWord(number:Int)->String{
    
    var word = " "

    let num = number
   
    switch num {
    case 0:
        word = "zero"
    case 1...9:
        word = oneToNine(number: num)
    case 10...19:
        word = tenToNineteen(number: num)
    case 20...99:
        word = twentyTon(number: num)
    case 100...999:
        word = hundred(number: num)
    case 1000...9999:
        word = thousand(number: num)
   case 10000...99999:
        word = tenthousand(number: num)
    default:
        word = "Enter number between 0 and 100000"
    }
  
    return word

}

print(numberToWord(number: 1000))
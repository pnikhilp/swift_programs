

let single = ["","one","two","three","four","five","six","seven","eight","nine"]
let dbl = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
let tenmulty = ["","","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety"]
let tpower = ["hundred","thousand","lakh","million"]


func oneToNine(number:Int)->String{ //Convert number between 1 - 9
    let num = number
    var word = " "
    word = single[num]
    return word
}
func tenToNineteen(number:Int)->String{ //Convert number between 10 - 19
    let num = number
    var word = " "
    word = dbl[num%10]
    return word
    
}
func twentyTon(number:Int)->String{  //Convert number between 20 - 99
    let num = number
    var word = " "
    if num%10 == 0{
        word = tenmulty[num/10]
    }
    word = tenmulty[num/10]+" "+oneToNine(number: num%10)
    return word
    
}

func hundred(number:Int)->String{  //Convert number between 100 - 999
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

func thousand(number:Int)->String{  //Convert number between 1000 - 9999
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

func tenthousand(number:Int)->String{   //Convert number between 10000 - 99999
    let num = number
    let n = num%1000
    var word = " "
    
    if num/1000 >= 20{
        switch n {
        case 100...999:
            word = twentyTon(number: num/1000)+" thousand "+hundred(number: n)
        case 20...99:
            word = twentyTon(number: num/1000)+" thousand "+twentyTon(number: n)
        case 10...19:
            word = twentyTon(number: num/1000)+" thousand "+tenToNineteen(number: n)
        default:
            word = twentyTon(number: num/1000)+" thousand "+oneToNine(number: n)
        }
    }
    if num/1000 < 20{
        switch n {
        case 100...999:
            word = tenToNineteen(number: num/1000)+" thousand "+hundred(number: n)
        case 20...99:
            word = tenToNineteen(number: num/1000)+" thousand "+twentyTon(number: n)
        case 10...19:
            word = tenToNineteen(number: num/1000)+" thousand "+tenToNineteen(number: n)
        default:
            word = tenToNineteen(number: num/1000)+" thousand "+oneToNine(number: n)
            
        }
    }
    return word
}

func largenumber(number: Int)->String{  //Convert number between 100000 - 1000000
    let r = number%10000
    let p = number/10000
    let q = p%10
      let num = number
      let n = num/100000
      var word = " "
   
    if n < 10{
      word = oneToNine(number: n)+" "+tpower[2]+" "+tenthousand(number: num%100000)
        if q == 0{
        switch r {
        case 0:
            word = "one "+tpower[2]
        case 1000...9999:
            word = oneToNine(number: n)+" "+tpower[2]+" "+thousand(number: r)
        case 100...999:
            word = oneToNine(number: n)+" "+tpower[2]+" "+hundred(number: r)
        case 20...99:
            word = oneToNine(number: n)+" "+tpower[2]+" "+twentyTon(number: r)
        case 10...19:
            word = oneToNine(number: n)+" "+tpower[2]+" "+tenToNineteen(number: r)
        case 1...9:
            word = oneToNine(number: n)+" "+tpower[2]+" "+oneToNine(number: r)
        default:
            word = ""
        }
     }

    }
    else{
        word = "one million"
    }
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
    case 100000...1000000:
        word = largenumber(number: num)
    default:
        word = "Enter number between 0 and 1000000"
    }
  
    return word

}

print(numberToWord(number:152481))

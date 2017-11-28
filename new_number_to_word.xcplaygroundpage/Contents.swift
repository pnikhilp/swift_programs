
let single = ["","one","two","three","four","five","six","seven","eight","nine"]
let dbl = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
let tenmulty = ["","","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety"]
let tpower = ["hundred","thousand","lakh"]

func tenton(number:Int)->String{ //Function to convert between 0 and 99
    let num = number
    let div = num/10
    var word = " "
    
    if div == 0{ //Convert number between 0 and 9
        
        let rem = num % 10
        word = single[rem]
        if number == 0{
            word = "zero"
        }
    }
    
    if div == 1{  //Convert number between 10 and 19
        let rem = num % 10
        word = dbl[rem]
    }
    
    if div != 0 && div != 1 && div < 10{ //Convert number between 20 and 99
        
        let rem = num % 10
        
        if rem != 0 {
            word = tenmulty[div]+" "+single[rem]
        }else{
            word = tenmulty[div]
        }
        
    }
    
    return word
}

func hundred(number:Int)->String{  //Function to convert between 100 and 999
    
    var word = " "
    let num = number
    let div = num / 10
    var h = div
    h /= 10
    let s = div%10
    
    if s == 1{
        let sr = num%10
        word = single[h]+" "+tpower[0]+" and "+dbl[sr]
    }else{
        
        let newnum = number
        
        var m = newnum/10
        let r = newnum%10
        m %= 10
        
        if m == 0 && r != 0{
            word = single[h]+" "+tpower[0]+" and "+single[r]
            
        }else{
            
            let rem = newnum % 10
            
            switch rem {
            case 0:
                var f = newnum % 100
                f /= 10
                word = single[h]+" "+tenmulty[f]
                
            case 1,2,3,4,5,6,7,8,9:
                var f = newnum % 100
                f /= 10
                word = single[h]+" "+tenmulty[f]+" "+single[rem]
                
            default:
                word = single[h]+" "+tpower[0]+" "+single[rem]
            }
            
        }
        
        if newnum%100 == 0{
            word = single[h]+" "+tpower[0]
        }
    }
    return word
}


func numberToWord(number:Int)->String{
    
    let num = number
    var word = " "
    
    let div = num / 10
    
    word = tenton(number: num)

    if div >= 10 && div < 100{  //Number between 100 and 999
        word = hundred(number: num)
    }
    
    if div >= 100 && div < 1000{  //Number greater than or 1000
        
        let th = num/1000
        let rh = num%1000
        let first = num/100
        let second = num/10
        
        if first%10 == 0{
            word = single[th]+" "+tpower[1]+" and "+tenton(number:rh)
            if second%10 == 0{
                word = single[th]+" "+tpower[1]+" "+single[rh]
            }
            
        }else{
            
            if num%1000 == 0{
                word = single[th]+" "+tpower[1]
            }
            else{
                word = single[th]+" "+tpower[1]+" "+hundred(number: num%1000)
            }
        }
        if rh == 0{
            word = single[th]+" "+tpower[1]
        }
    }
    
    
    if div >= 1000{

        let th = num/1000
        let fnum = num/1000
        
        if num/1000 == 0 {
            word = tenton(number: fnum)+" "+tpower[1]
            
        }else{
            if num%10000 == 0{
                word = tenton(number:th)+" "+tpower[1]
            }
            word = tenton(number: fnum)+" "+tpower[1]+" "+hundred(number: num%1000)
        }
        if num%1000 < 100{
            word = tenton(number:th)+" "+tpower[1]+" "+tenton(number: num%1000)
            if num%10 == 0{
                word = tenton(number:th)+" "+tpower[1]
            }
        }
    }
    if div > 10000{
        word = single[1]+" "+tpower[2]
    }
    return word
}

print(numberToWord(number:2001))

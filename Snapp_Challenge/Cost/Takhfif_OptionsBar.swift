

import SwiftUI

struct Takhfif_OptionsBar : View {
    
    @State var showCodeTextField: Bool = false
    @State var isDisabled: Bool = true
    

    
    
    @EnvironmentObject var data: Datas

    var body: some View {
        ZStack{
            Rectangle()
            .foregroundColor(.gray)
            VStack{
        HStack{
            Button(action: {
                
                
            }){
                Text(verbatim: "گزینه ها")
                .foregroundColor(.green)
                .bold()
            }
            Divider()
            Spacer()
            Text(verbatim: "ریال")
                .foregroundColor(.gray)
            Text(verbatim: "\(self.data.Cost)".convertEngNumToPersianNum())
            .animation(.spring())
            .foregroundColor(.black)
            Spacer()
            Divider()
            Button(action: {
                self.showCodeTextField.toggle()
                self.data.check.toggle()
                
            }){
                Text(verbatim: "کد تخفیف؟")
                    .foregroundColor(.green)
                .bold()
            }
        }.padding()
            
            if self.showCodeTextField {
            
            HStack {
                Button(action: {
                   
                    self.showCodeTextField = false
                    
                    if !self.data.codeDidUsed {
                    self.data.off -= 0.3
                    
                    }
                    self.data.code = ""
                    self.data.codeDidUsed = true
                    self.data.check.toggle()
                }){
                    Text(verbatim: "ثبت")
                    .foregroundColor(.green)
                    .bold()
                }.disabled(self.data.code.isEmpty)
                
                
                
                Spacer()
                
//                TextField("کد تخفیف را وارد کنید", text: self.$data.code)
                CustomTextField(text: self.$data.code, isFirstResponder: self.data.check)
                
                
                
                
                Spacer()
                
                
                

                    Image("Scan",bundle: nil)
                        .renderingMode(.original)
                    .frame(width: Length(60), height: Length(60))
                    
                
                
            }.foregroundColor(.gray)
            .padding()
            .frame(width: UIScreen.main.bounds.width, height: 40)
                .offset(y: -20)
                
                
            }
            }
            
        
    }.frame(width: UIScreen.main.bounds.width, height: 40)
    }
}


extension String {
    func convertEngNumToPersianNum()->String{
        let format = NumberFormatter()
        format.locale = Locale(identifier: "fa_IR")
        let number =   format.number(from: self)
        
        let faNumber = format.string(from: number!)
        return faNumber!
        
    }
    func convertToPersian()-> String {
        let numbersDictionary : Dictionary = ["0" : "۰","1" : "۱", "2" : "۲", "3" : "۳", "4" : "۴", "5" : "۵", "6" : "۶", "7" : "۷", "8" : "۸", "9" : "۹"]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        
        return str
    }
}



#if DEBUG
struct Takhfif_OptionsBar_Previews : PreviewProvider {
    static var previews: some View {
        Takhfif_OptionsBar()
        .environmentObject(Datas())
        .environment(\.colorScheme, .dark)

    }
}
#endif

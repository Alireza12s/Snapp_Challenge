import SwiftUI

struct TravelCostPage : View {
    @EnvironmentObject var data: Datas
    var onDismiss: () -> Void
    
    
    
    var body: some View {
        VStack{
        if !data.check {
            MapView()
            CostBottom()
        
        } else {
            MapView()
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
                Spacer()
                Divider()
                Button(action: {
                    self.data.check = true
                    
                }){
                    Text(verbatim: "کد تخفیف؟")
                        .foregroundColor(.green)
                    .bold()
                }
            }.padding()
            .frame(height: 50)
            
                        HStack {
                            Button(action: {
                               
                                
                                if !self.data.codeDidUsed {
                                self.data.off -= 0.3
                                
                                }
                                self.data.code = ""
                                self.data.codeDidUsed = true
                                self.data.check = false
                            }){
                                Text(verbatim: "ثبت")
                                .foregroundColor(.green)
                                .bold()
                            }.disabled(self.data.code.isEmpty)
                            
                            
                            
                            Spacer()
                            
            //                TextField("کد تخفیف را وارد کنید", text: self.$data.code)
                            CustomTextField(text: self.$data.code, isFirstResponder: true)
                            
                            
                            
                            
                            
                            
                            Spacer()
                            
                            
                            

                                Image("Scan",bundle: nil)
                                    .renderingMode(.original)
                                .frame(width: Length(60), height: Length(60))
                                
                            
                            
                        }.foregroundColor(.gray)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width, height: 40)
                            .offset(y: -20)
                            
            Spacer()
        }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarItems(leading: TopBar3(onDismiss: .constant(self.onDismiss)))
    }
}



#if DEBUG
struct TravelCostPage_Previews : PreviewProvider {
    static var previews: some View {
        TravelCostPage(onDismiss: {})
            .environmentObject(Datas())
        .environment(\.colorScheme, .dark)
    }
}
#endif



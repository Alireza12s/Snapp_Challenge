import SwiftUI

struct SelectKindBar : View {
    
    @EnvironmentObject var data: Datas
    
    @State var color1: Color
    @State var color2: Color
    @State var color3: Color
    @State var color4: Color
    
    
    var body: some View {
        
        VStack {
            
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height: 150)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        
                        
                        Button(action: {
                            self.data.Cost = 145000
                            self.data.Cost = Int(Double(self.data.Cost) * self.data.off)
                            self.color1 = Color.black
                            self.color2 = Color.gray
                            self.color3 = Color.gray
                            self.color4 = Color.gray
                            self.data.travelType = "درخواست اسنپ اکو"
                        }){
                            VStack{
                                Image("be_sarfe", bundle: nil)
                                    .renderingMode(.original)
                                    .frame(width: Length(75), height: Length(75))
                                    .clipShape(Circle()).overlay(Circle()
                                        .stroke(color1, lineWidth: Length(3)))
                                
                                
                                Text(verbatim: "به صرفه و فوری")
                                    .bold()
                                    .foregroundColor(color1)
                                
                                
                            }
                        }
                        Spacer(minLength: 30)
                        Button(action: {
                            self.data.Cost = 135000
                            self.data.Cost = Int(Double(self.data.Cost) * self.data.off)
                            self.color1 = Color.gray
                            self.color2 = Color.black
                            self.color3 = Color.gray
                            self.color4 = Color.gray
                            self.data.travelType = "درخواست اسنپ رز"
                        }){
                            VStack{
                                Image("Vije_Banouan", bundle: nil)
                                    .renderingMode(.original)
                                    .frame(width: Length(75), height: Length(75)) .clipShape(Circle()).overlay(Circle().stroke(color2, lineWidth: Length(3)))
                                
                                Text(verbatim: "ویژه بانوان")
                                    .bold()
                                    .foregroundColor(color2)
                            }
                        }
                        
                        Spacer(minLength: 30)
                        Button(action:{
                            self.data.Cost = 65000
                            self.data.Cost = Int(Double(self.data.Cost) * self.data.off)
                            self.color1 = Color.gray
                            self.color2 = Color.gray
                            self.color3 = Color.black
                            self.color4 = Color.gray
                            self.data.travelType = "وارد کردن جزئیات"
                        }){
                            VStack{
                                Image("motor_marsoolat", bundle: nil)
                                    .renderingMode(.original)
                                    .frame(width: Length(75), height: Length(75)).clipShape(Circle()).overlay(Circle().stroke(color3, lineWidth: Length(3)))
                                
                                
                                VStack(alignment: .leading) {
                                    Text(verbatim: "موتور ویژه")
                                        .bold()
                                        .foregroundColor(color3)
                                    Text(verbatim: "مرسولات")
                                        .bold()
                                        .foregroundColor(color3).offset(x: 5)
                                    
                                }
                                
                                
                                
                                
                                
                                
                            }
                        }.offset(y: 12)
                        
                        Spacer(minLength: 30)
                        Button(action: {
                            self.data.Cost = 9500
                            self.data.Cost = Int(Double(self.data.Cost) * self.data.off)
                            self.color1 = Color.gray
                            self.color2 = Color.gray
                            self.color3 = Color.gray
                            self.color4 = Color.black
                            self.data.travelType = "درخواست اسنپ بایک"
                        }){
                            VStack{
                                Image("Motor_mosafer", bundle: nil)
                                    .renderingMode(.original)
                                    .frame(width: 75, height: 75) .clipShape(Circle()).overlay(Circle().stroke(color4, lineWidth: Length(3)))
                                Text(verbatim: "موتور ویژه مسافر")
                                    .bold()
                                    .foregroundColor(color4)
                                
                                
                            }
                        }
                    }.offset(y: -10)
                }
            }
        }.frame(width: UIScreen.main.bounds.width, height: 180)
    }
}



#if DEBUG
struct SelectKindBar_Previews : PreviewProvider {
    static var previews: some View {
        SelectKindBar(color1: Color.black,color2: Color.gray,color3:  Color.gray, color4: Color.gray)
            .environmentObject(Datas())
    }
}
#endif

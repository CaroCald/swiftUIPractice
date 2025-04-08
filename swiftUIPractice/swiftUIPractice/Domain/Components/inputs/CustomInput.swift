import SwiftUI

struct CustomTextField: View {
    let icon: String
    let placeHolder: String
    @Binding var text: String
    
    @State private var width = CGFloat.zero
    @State private var labelWidth = CGFloat.zero
  
        var body: some View {
            HStack {
                Image(systemName: icon)  // Ensure the icon is displayed here
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
                    .frame(width: 24, height: 24)
                    .padding(EdgeInsets.init(
                        top: 0, leading: 10, bottom: 0, trailing: 0
                    ))// Icon size
                
           
                
                TextField(text: $text, axis: .horizontal, label: {
                    Text(placeHolder)
                        .foregroundColor(.white)
                })
                .foregroundColor(.white)
                    .foregroundColor(.white)
                    .font(GilroyFont(isBold: true, size: 20))
                    .keyboardType(.emailAddress) // Change to .emailAddress for email input
                    .padding(EdgeInsets(top: 15, leading: 8, bottom: 15, trailing: 8))
                   
            }
            .background {
                ZStack {
                    // Border
                    RoundedRectangle(cornerRadius: 5)
                        .trim(from: 0, to: 0.55)
                        .stroke(.gray, lineWidth: 1)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .trim(from: 0.565 + (0.44 * (labelWidth / width)), to: 1)
                        .stroke(.gray, lineWidth: 1)
                    
                   
                }
            }
            
        }
    }



func GilroyFont(isBold: Bool = false, size: CGFloat) -> Font {
    if isBold {
        return Font.custom("Gilroy-ExtraBold", size: size)
    } else {
        return Font.custom("Gilroy-Light", size: size)
    }
}

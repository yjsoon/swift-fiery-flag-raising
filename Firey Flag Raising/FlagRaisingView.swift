import SwiftUI

struct FlagRaisingView: View {
    
    @Binding var flagOffset: Double
    @Binding var flag: Flag
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: -10) {
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: 15)
                
                Text(flag.emoji)
                    .font(.system(size: 100))
                    .offset(x: 0, y: CGFloat(flagOffset))
            }
            
            Button("Raise Flag") {
                flagOffset -= 10
            }
            .padding()
            
            Button("Reset") {
                flagOffset = 20
            }
            .padding()
        }
    }
}

struct FlagRaisingView_Previews: PreviewProvider {
    static var previews: some View {
        FlagRaisingView(flagOffset: .constant(20.0), flag: .constant(Flag(emoji: "🇸🇬", description: "Singapore")))
    }
}

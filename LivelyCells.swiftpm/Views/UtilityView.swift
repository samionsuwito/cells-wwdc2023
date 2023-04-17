import SwiftUI

import SwiftUI

struct CodeView: View {
    var codeText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                Text("CODE EXAMPLE")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.bottom, 10)
            Text(codeText)
                .font(.system(.body, design: .monospaced))
                .foregroundColor(.purple)
                .padding(.all, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}

struct OutlineText: View {
    let text: String
    let width: CGFloat
    let color: Color
    
    var body: some View {
        ZStack{
            ZStack {
                Text(text).offset(x: width, y: width)
                Text(text).offset(x: width, y: -width)
                Text(text).offset(x: -width, y: width)
                Text(text).offset(x: -width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

import SwiftUI

struct Chapter4: View {
    var body: some View {
        VStack {
            Text("Chapter 4")
                .font(.largeTitle)
                .bold()
            
            Text("Conclusion")
                .font(.headline)
                .foregroundColor(.gray)
            
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.accentColor)
                .frame(height: 2)
                .padding(.bottom, 15)
                .padding(.horizontal, 20)
            
            ScrollView{
                VStack(alignment: .leading,spacing: 20){
                    Text("This concludes LivelyCells, a dive into Cellular Automata. I hope you've learned about the importance and applications of Cellular Automata and can share my appreciation for how cool it is!")
                    
                    Text("""
References:
• https://en.wikipedia.org/wiki/Cellular_automaton
• https://en.wikipedia.org/wiki/Elementary_cellular_automaton
• https://conwaylife.com/wiki/Category:Patterns
• https://link.aps.org/doi/10.1103/PhysRevLett.69.1629
• https://www.wolframscience.com/nks/
• http://www.roguebasin.com/index.php?title=Cellular_Automata_Method_for_Generating_Random_Cave-Like_Levels
""")
                    
                }
            }
        }
    }
}

struct Chapter4_Previews: PreviewProvider {
    static var previews: some View {
        Chapter4()
    }
}

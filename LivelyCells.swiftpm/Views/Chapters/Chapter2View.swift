import SwiftUI
import SpriteKit

struct Chapter2 : View {
    @State var rulesStates:[Bool] = [true,true,true,true,true,true,true,true]
    @State var ruleName: String = "255"
    @State var initialState: [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true]
    @State var started = false
    
    var rule110scene: SKScene {
        let scene = Rule110()
        scene.size = CGSize(width: 278, height: 278)
        scene.scaleMode = .fill
        return scene
    }
    
    var elementScene = Elementary()
    
    var scene: SKScene {
        let scene = elementScene
        scene.size = CGSize(width: 278, height: 278)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        VStack {
            Group{
                Text("Chapter 2")
                    .font(.largeTitle)
                    .bold()
                
                Text("1D Cellular Automata")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(.accentColor)
                    .frame(height: 2)
                    .padding(.bottom, 15)
                    .padding(.horizontal, 20)    
            }
            ScrollView{
                VStack(alignment: .leading, spacing: 20) {
                    Group{
                        Text("""
Although One-Dimensional Cellular Automata is a whole dimension less than the Game of Life, it can still be as interesting or even more for how in depth they can be in such a limited dimension.

This will mainly go over **Elementary Cellular Automata** which is a 1D Cellular Automata where each cell can only have two states, on or off.

In addition the only neighbours it considers is the cells directly to the left and right of it.

We often draw these Cellular Automata using a time-space diagram where each row down is the next iteration of the cellular automation.
""")
                        .font(.body)
                        
                        HStack{
                            Spacer()
                            if started{
                                SpriteView(scene: rule110scene)
                                    .frame(width: 278, height: 278)
                                    .transformEffect(.init(scaleX: 1, y: -1))
                                    .transformEffect(.init(translationX: 0, y: 278))
                            } else {
                                Button(action: {
                                    started = true
                                }, label: {
                                    Text("Start Simulation")
                                    .frame(width: 278, height: 278)
                                    .font(.title)
                                    .bold()
                                })
                                .buttonStyle(.borderedProminent)
                            }
                            
                            Spacer()
                        }
                        Group{
                            HStack{
                                Rectangle()
                                    .cornerRadius(10)
                                    .foregroundColor(.secondary)
                                    .frame(width: 3,height:.infinity)
                                Text("The image above is Rule 110. It iterates infinitely, so it actually goes past the bottom of the image. This was popularized by Stephen Wolfram in *A New Kind of Science* (2002). It was proven to be **Turing Complete** by Mathew Cook meaning that it can simulate any computing program.")
                                    .padding(10)
                            }
                            .background(.quaternary)
                            .cornerRadius(4)
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(.secondary)
                                .frame(height: 2)
                        }
                    }
                    
                    //                    Rules Section
                    Group{
                        Text("Rule Naming")
                            .font(.title)
                            .bold()
                            .frame(maxWidth:.infinity,alignment: .center)                  
                        Text("""
If you noticed, the picture above was called Rule 110. The naming of these rules are based on how there are 256 rule possibilities, leading to them being listed from 0 to 255 inclusive. It's named converting a binary number to decimal with the binary number being determined by whether a cell being on for a certain configuration of neighbours leads to a cell being on or off. This is called the **Wolfram Code**.

The following images represents the configuration of neighbours with the top three squares representing the original square and its two neighbours and the square below represents the state the new square will be afterwards.

You can click on the following images to see how the name changes based on the rule.
""")
                        Text("Rules")
                            .font(.title)
                            .frame(maxWidth:.infinity,alignment: .center)
                        VStack{
                            HStack{
                                Spacer()
                                Button(action: {
                                    rulesStates[0] = !rulesStates[0]
                                    evaluateName()
                                }, label: {
                                    Canvas { context, size in
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 10, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 44, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 78, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        if rulesStates[0]{
                                            context.fill(
                                                Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                with: .color(.black)
                                            )} else {
                                                context.stroke(
                                                    Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                    with: .color(.black),
                                                    lineWidth: 2
                                                )}
                                        
                                    }
                                    .frame(width: 118, height: 84)
                                })
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                                )
                                Button(action: {
                                    rulesStates[1] = !rulesStates[1]
                                    evaluateName()
                                }, label: {
                                    Canvas { context, size in
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 10, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 44, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 78, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth: 2
                                        )
                                        if rulesStates[1]{
                                            context.fill(
                                                Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                with: .color(.black)
                                            )} else {
                                                context.stroke(
                                                    Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                    with: .color(.black),
                                                    lineWidth: 2
                                                )}
                                    }
                                    .frame(width: 118, height: 84)
                                })
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                                )
                                Button(action: {
                                    rulesStates[2] = !rulesStates[2]
                                    evaluateName()
                                }, label: {
                                    Canvas { context, size in
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 10, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 44, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth: 2
                                        )
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 78, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        if rulesStates[2]{
                                            context.fill(
                                                Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                with: .color(.black)
                                            )} else {
                                                context.stroke(
                                                    Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                    with: .color(.black),
                                                    lineWidth: 2
                                                )}
                                    }
                                    .frame(width: 118, height: 84)
                                })
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                                )
                                Button(action: {
                                    rulesStates[3] = !rulesStates[3]
                                    evaluateName()
                                }, label: {
                                    Canvas { context, size in
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 10, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 44, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                            ,lineWidth: 2
                                        )
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 78, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth:2 
                                        )
                                        if rulesStates[3]{
                                            context.fill(
                                                Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                with: .color(.black)
                                            )} else {
                                                context.stroke(
                                                    Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                    with: .color(.black),
                                                    lineWidth: 2
                                                )}
                                    }
                                    .frame(width: 118, height: 84)
                                })
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                                )
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Button(action: {
                                    rulesStates[4] = !rulesStates[4]
                                    evaluateName()
                                }, label: {
                                    Canvas { context, size in
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 10, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth:2
                                        )
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 44, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 78, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        if rulesStates[4]{
                                            context.fill(
                                                Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                with: .color(.black)
                                            )} else {
                                                context.stroke(
                                                    Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                    with: .color(.black),
                                                    lineWidth: 2
                                                )}
                                    }
                                    .frame(width: 118, height: 84)
                                })
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                                )
                                Button(action: {
                                    rulesStates[5] = !rulesStates[5]
                                    evaluateName()
                                }, label: {
                                    Canvas { context, size in
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 10, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth:2
                                        )
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 44, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 78, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth: 2
                                        )
                                        if rulesStates[5]{
                                            context.fill(
                                                Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                with: .color(.black)
                                            )} else {
                                                context.stroke(
                                                    Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                    with: .color(.black),
                                                    lineWidth: 2
                                                )}
                                    }
                                    .frame(width: 118, height: 84)
                                })
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                                )
                                Button(action: {
                                    rulesStates[6] = !rulesStates[6]
                                    evaluateName()
                                }, label: {
                                    Canvas { context, size in
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 10, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth:2
                                        )
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 44, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth: 2
                                        )
                                        context.fill(
                                            Path(roundedRect: CGRect(x: 78, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                        )
                                        if rulesStates[6]{
                                            context.fill(
                                                Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                with: .color(.black)
                                            )} else {
                                                context.stroke(
                                                    Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                    with: .color(.black),
                                                    lineWidth: 2
                                                )}
                                    }
                                    .frame(width: 118, height: 84)
                                })
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                                )
                                Button(action: {
                                    rulesStates[7] = !rulesStates[7]
                                    evaluateName()
                                }, label: {
                                    Canvas { context, size in
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 10, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth:2
                                        )
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 44, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black)
                                            ,lineWidth: 2
                                        )
                                        context.stroke(
                                            Path(roundedRect: CGRect(x: 78, y: 10, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                            with: .color(.black),
                                            lineWidth:2 
                                        )
                                        if rulesStates[7]{
                                            context.fill(
                                                Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                with: .color(.black)
                                            )} else {
                                                context.stroke(
                                                    Path(roundedRect: CGRect(x: 44, y: 44, width: 30, height: 30), cornerRadius: 5, style: .circular),
                                                    with: .color(.black),
                                                    lineWidth: 2
                                                )}
                                    }
                                    .frame(width: 118, height: 84)
                                })
                                .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                                )
                                Spacer()
                            }
                        }
                    }
                    
                    Text("Rule \(ruleName)")
                        .font(.title)
                        .frame(maxWidth:.infinity,alignment: .center)
                    
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(.secondary)
                        .frame(height: 2)
                    //                    Rules
                    Group{
                        Text("Classes")
                            .font(.title)
                            .bold()
                            .frame(maxWidth:.infinity,alignment: .center)
                        
                        Text("""
In Elementary Cellular Automata, we can classify each Cellular Automata to the four **Wolfram Classes**:

• **Class 1**: The Cellular Automata converges to the same final state no matter the intial state. An example of this would be Rule 0 which leads to nothing as the Rule states no configuration will turn it on.
• **Class 2**: The Cellular Automata converges to a stable state where a pattern repeats.
• **Class 3**: The Cellular Automata seems to be absolutely random with no pattern.
• **Class 4**: The Cellular Automata has a mxiture of pattern and randomness like Rule 110 above.
 
""")
                    }
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(.secondary)
                        .frame(height: 2)
                    
                }
                Text("Further Exploration")
                    .font(.title)
                    .bold()
                    .frame(maxWidth:.infinity,alignment: .center)
                Text("Visit Chapter 2.5 to explore more Elementary Cellular Automata")
            }
            .padding(.horizontal, 20)
        }
    }
    
    func evaluateName() {
        var binaryString = ""
        for i in 0...7{
            if rulesStates[i]{
                binaryString.append("1")
            } else{
                binaryString.append("0")
            }
        }
        var newRule = Int(binaryString,radix: 2)!
        ruleName = String(newRule)
    }
}

class Rule110: SKScene{
    var cellStates: [[Bool]] = []
    var cells: [[SKShapeNode]] = []
//    supposed grid size limit before nothing else changes? look into coregrpahics l8r
    var gridSize = 139
    override func didMove(to view: SKView) {
        var firstCellRow: [Bool] = []
        for _ in 0...gridSize-1{
            firstCellRow.append(false)
        }
        firstCellRow.append(true)
        cellStates.append(firstCellRow)
        for i in 1...gridSize{
            var newCellRow: [Bool] = []
            for j in 0...gridSize{
                newCellRow.append(calculateNeighbours(row: i, cell: j))
            }
            cellStates.append(newCellRow)
        }
        
        for i in 0...gridSize {
            var cellRow: [SKShapeNode] = []
            for j in 0...gridSize {
                let cell = SKShapeNode(rect: CGRect(x: (2*j-2), y: 2*i, width: 2, height: 2))
                if cellStates[i][j] {
                    cell.fillColor = .black
                }else {
                    cell.fillColor = .white
                }
                cell.lineWidth = 0 // somehow prevents antialiasing blur
                addChild(cell)
                cellRow.append(cell)
            }
            cells.append(cellRow)
        }
    }
    
    func calculateNeighbours(row:Int,cell:Int) -> Bool{
        var left: Bool = false
        var right: Bool = false
        var center: Bool = false
        if cell == 0{
            left = false
        } else if cell == gridSize{
            right = false
        } else{
            left = cellStates[row-1][cell-1]
            right = cellStates[row-1][cell+1]
        }
        center = cellStates[row-1][cell]
//        Rules for rule110
        if left && center && right {
            return false
        }
        if left && center && !right {
            return true
        }
        if left && !center && right {
            return true
        }
        if left && !center && !right {
            return false
        }
        if !left && center && right {
            return true
        }
        if !left && center && !right{
            return true
        }
        if !left && !center && right {
            return true
        }
        if !left && !center && !right {
            return false
        }
        return false
    }
}

struct Chapter2_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2()
    }
}

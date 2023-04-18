import SwiftUI
import SpriteKit

struct Chapter25 : View {
    @State var rulesStates:[Bool] = [true,true,true,true,true,true,true,true]
    @State var ruleName: String = "255"
    @State var initialState: [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true]
    @State var started = false
    
    var elementScene = Elementary()
    
    var scene: SKScene {
        let scene = elementScene
        scene.size = CGSize(width: 278, height: 278)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        VStack{
            Text("Chapter 2.5")
                .font(.largeTitle)
                .bold()
            
            Text("Elementary Cellular Automata Explorer")
                .font(.headline)
                .foregroundColor(.gray)
            
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.accentColor)
                .frame(height: 2)
                .padding(.bottom, 15)
                .padding(.horizontal, 20)   
            ScrollView{
                Group{
                    Text("Explore")
                        .font(.title)
                        .bold()
                        .frame(maxWidth:.infinity,alignment: .center)
                    
                    Text("Explore and find your own patterns. Create your own Elementary Cellular Automata by setting the rules and the initial states. Some interesting rules to try are: Rule 30, 90, 110 and 184.")
                    
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
                        Text("Rule \(ruleName)")
                            .font(.title)
                            .frame(maxWidth:.infinity,alignment: .center)
                            .padding(.bottom,20)
                    }
                }
                Group{
                    Text("Initial State")
                        .font(.title)
                        .frame(maxWidth:.infinity,alignment: .center)
                    Text("Press the cells below to setup the initial state")
                        .frame(maxWidth:.infinity,alignment: .center)
                    
                    HStack{
                        Spacer()
                        ForEach(0..<20){ i in
                            Button(action: {
                                initialState[i] = !initialState[i]
                            }, label: {
                                if initialState[i]{
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .strokeBorder(Color.black,lineWidth:2)
                                        .background(RoundedRectangle(cornerRadius:10,style:.continuous).foregroundColor(.black))
                                }else {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .stroke(Color.black,lineWidth:2)
                                        .background(RoundedRectangle(cornerRadius:10,style:.continuous).foregroundColor(.white))
                                }     
                            })
                            .frame(width: 30, height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.white)
                                    .shadow(color: .black, radius: 2.5, x: 0, y: 0)
                            )
                        }
                        Spacer()
                        
                    }
                    HStack{
                        Spacer()
                        Button(action: {
                            elementScene.setRules(newRules: rulesStates)
                            elementScene.create(initial: initialState)
                            started = true
                        }, label: {
                            Text("Create")
                                .font(.title)
                        }) 
                        Spacer()
                    }
                    .buttonStyle(.borderedProminent)
                    HStack{
                        Spacer()
                        if started{
                            SpriteView(scene: scene)
                                .frame(width: 278, height: 278)
                                .transformEffect(.init(scaleX: 1, y: -1))
                                .transformEffect(.init(translationX: 0, y: 278))
                                .shadow(color: .black, radius: 4, x: 0, y: 0)
                        } 
                        Spacer()
                    }
                    .padding(15)
                }
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

class Elementary: SKScene{
    var rules: [Bool] = [true,true,true,true,true,true,true,true]
    var cellStates: [[Bool]] = []
    var cells: [[SKShapeNode]] = []
    var gridSize = 139
    
    func setRules(newRules:[Bool]){
        rules = newRules
    }
    
    func create(initial:[Bool]) {
        cellStates = []
        cells = []
        self.removeAllChildren()
        var firstCellRow: [Bool] = []
        for _ in 0...gridSize-20{
            firstCellRow.append(false)
        }
        firstCellRow += initial
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
            return rules[0]
        }
        if left && center && !right {
            return rules[1]
        }
        if left && !center && right {
            return rules[2]
        }
        if left && !center && !right {
            return rules[3]
        }
        if !left && center && right {
            return rules[4]
        }
        if !left && center && !right{
            return rules[5]
        }
        if !left && !center && right {
            return rules[6]
        }
        if !left && !center && !right {
            return rules[7]
        }
        return false
    }
}

struct Chapter25_Previews: PreviewProvider {
    static var previews: some View {
        Chapter25()
    }
}

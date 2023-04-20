import SwiftUI
import SpriteKit

struct Chapter35: View {
    @State var started = false
    @State var colorScheme = true
    
    var conway = Conway()
    
    var scene: SKScene{
        let scene = conway
        scene.size = CGSize(width: 600, height: 600)
        scene.scaleMode = .fill
        scene.loaded = !scene.loaded
        return scene
    }

    var darkConway = DarkConway()
    
    var darkScene: SKScene {
        let scene = darkConway
        scene.size = CGSize(width: 600, height: 600)
        scene.scaleMode = .fill
        scene.loaded = !scene.loaded
        return scene
    }
    
    var body: some View {
        VStack{
            Text("Chapter 3.5")
                .font(.largeTitle)
                .bold()
            
            Text("Conway's Game of Life")
                .font(.headline)
                .foregroundColor(.gray)
            
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.accentColor)
                .frame(height: 2)
                .padding(.bottom, 15)
                .padding(.horizontal, 20)
            ScrollView{
                Text("Explore in this interactive version of Conway's Game Of Life")
                HStack{
                    Spacer()
                    if started{
                        HStack{
                            if colorScheme{
                                SpriteView(scene: scene)
                                    .frame(width: 600, height: 600)
                            } else {
                                SpriteView(scene:darkScene)
                                    .frame(width: 600, height: 600)
                            }
                            VStack{
                                Button(action: {
                                    conway.loaded = !conway.loaded
                                    darkConway.loaded = !darkConway.loaded
                                }, label: {
                                    Text("Pause/Resume")
                                })
                                .buttonStyle(.borderedProminent)
                                
                                Button(action: {
                                    conway.reset()
                                    darkConway.reset()
                                }, label: {
                                    Text("Reset")
                                })
                                .buttonStyle(.borderedProminent)
                                
                                Button(action: {
                                    colorScheme = !colorScheme
                                }, label: {
                                    Text("Switch Color")
                                })
                                .buttonStyle(.borderedProminent)
                            }
                        }
                    } else{
                        Button(action: {
                            started = true
                            conway.start()
                            darkConway.start()
                            conway.loaded = false
                            darkConway.loaded = false
                        }, label: {
                            Text("Start Simulation \n Click Here")
                                .frame(width: 390, height: 390)
                                .font(.title)
                                .bold() 
                        })
                        .buttonStyle(.borderedProminent)
                    }
                    Spacer()
                }
            }
        }
    }
}

class Conway: SKScene {
    var cellSize: Int = 14
    var cellStates: [[Bool]] = [] 
    var cells: [[SKShapeNode]] = []
    var interval = 0
    var framesPerUpdate = 10
    var strokeWidth: CGFloat = 1.5
    var loaded = false
    var normalStart = true
    var cellWidth = 40
    var cellHeight = 40
    
    func pause(){
        loaded = false
    }
    
    func reset() {
        var newCellStates: [[Bool]] = []
        for i in 0...cellWidth {
            var newCellRow: [Bool] = []
            for j in 0...cellHeight { 
                newCellRow.append(false)
            }
            newCellStates.append(newCellRow)
        }
        cellStates = newCellStates
        for i in 0...cellWidth {
            for j in 0...cellHeight {
                if cellStates[i][j]{
                    cells[i][j].fillColor = .black
                } else {
                    cells[i][j].fillColor = .white
                }
            }
        }
    }
    
    func start(){
        normalStart = false
        self.backgroundColor = .white
        for i in 0...cellWidth{
            var cellStateRow: [Bool] = []
            var cellRow: [SKShapeNode] = []
            for j in 0...cellHeight {
                let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                cell.strokeColor = .black
                cell.lineWidth = CGFloat(strokeWidth)
                //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                cell.fillColor = .white
                cellStateRow.append(false)
                cellRow.append(cell)
                addChild(cell)
            }
            cells.append(cellRow)
            cellStates.append(cellStateRow)
        }
    }    
    
    override func didMove(to view: SKView) {
        if normalStart{
            self.backgroundColor = .white
            for i in 0...cellWidth{
                var cellStateRow: [Bool] = []
                var cellRow: [SKShapeNode] = []
                for j in 0...cellHeight {
                    let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                    cell.strokeColor = .black
                    cell.lineWidth = CGFloat(strokeWidth)
                    //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                    cell.fillColor = .white
                    cellStateRow.append(false)
                    cellRow.append(cell)
                    addChild(cell)
                }
                cells.append(cellRow)
                cellStates.append(cellStateRow)
            }
        } 
        onSimulation()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        //        make sure that didMove finishes running first
        if loaded {
            if interval == (framesPerUpdate - 1) {
                var newCellStates: [[Bool]] = []
                for i in 0...cellWidth {
                    var newCellRow: [Bool] = []
                    for j in 0...cellHeight {
                        let neighbours = calculateNeighbours(x: i, y: j)
                        if cellStates[i][j] && !(neighbours == 2 || neighbours == 3)  {
                            newCellRow.append(false)
                        } else if !cellStates[i][j] && neighbours == 3 {
                            newCellRow.append(true)
                        } else {
                            newCellRow.append(cellStates[i][j])
                        }
                    }
                    newCellStates.append(newCellRow)
                }
                cellStates = newCellStates
                for i in 0...cellWidth {
                    for j in 0...cellHeight {
                        if cellStates[i][j]{
                            cells[i][j].fillColor = .black
                            cells[i][j].name = "1"
                        } else {
                            cells[i][j].fillColor = .white
                            cells[i][j].name = "\(i),\(j)"
                        }
                    }
                }
                interval = 0
            }
            interval += 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!    
        let touchLocation = touch.location(in:self)
        let touchedNode = self.nodes(at:touchLocation)[0]
        for i in 0...cellWidth {
            for j in 0...cellHeight {
                if touchedNode.name == "\(i),\(j)" {
                    if cellStates[i][j]{
                        cells[i][j].fillColor = .white
                        cellStates[i][j] = false
                    } else {
                        cells[i][j].fillColor = .black
                        cellStates[i][j] = true   
                    }
                    return
                }
            }
        }
    }
    
    func calculateNeighbours(x:Int, y:Int) -> Int {
        var neighbours = 0
        let neighbourList = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
        for entry in neighbourList{
            var neighbourX = x + entry[0]
            var neighbourY = y + entry[1]
            switch neighbourX {
            case -1:
                neighbourX = cellWidth
            case cellWidth + 1:
                neighbourX = 0
            default:
                break
            }
            
            switch neighbourY {
            case -1:
                neighbourY = cellHeight
            case cellHeight + 1:
                neighbourY = 0
            default:
                break
            }
            if cellStates[neighbourX][neighbourY]{
                neighbours += 1
            }
        }
        return neighbours
    }
    
    func onCell(x:Int,y:Int){
        cellStates[x][y] = true
        cells[x][y].fillColor = .black
    }
    
    func onSimulation(){
        loaded = true
    }   
}

class DarkConway: SKScene {
    var cellSize: Int = 14
    var cellStates: [[Bool]] = [] 
    var cells: [[SKShapeNode]] = []
    var interval = 0
    var framesPerUpdate = 10
    var strokeWidth: CGFloat = 1.5
    var loaded = false
    var normalStart = true
    var cellWidth = 40
    var cellHeight = 40
    
    func pause(){
        loaded = false
    }
    
    func reset() {
        var newCellStates: [[Bool]] = []
        for i in 0...cellWidth {
            var newCellRow: [Bool] = []
            for j in 0...cellHeight { 
                newCellRow.append(false)
            }
            newCellStates.append(newCellRow)
        }
        cellStates = newCellStates
        for i in 0...cellWidth {
            for j in 0...cellHeight {
                if cellStates[i][j]{
                    cells[i][j].fillColor = .green
                } else {
                    cells[i][j].fillColor = .black
                }
            }
        }
    }
    
    func start(){
        normalStart = false
        self.backgroundColor = .black
        for i in 0...cellWidth{
            var cellStateRow: [Bool] = []
            var cellRow: [SKShapeNode] = []
            for j in 0...cellHeight {
                let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                cell.strokeColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
                cell.lineWidth = CGFloat(strokeWidth)
                //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                cell.fillColor = .black
                cellStateRow.append(false)
                cellRow.append(cell)
                addChild(cell)
            }
            cells.append(cellRow)
            cellStates.append(cellStateRow)
        }
    }    
    
    override func didMove(to view: SKView) {
        if normalStart{
            self.backgroundColor = .black
            for i in 0...cellWidth{
                var cellStateRow: [Bool] = []
                var cellRow: [SKShapeNode] = []
                for j in 0...cellHeight {
                    let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                    cell.strokeColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
                    cell.lineWidth = CGFloat(strokeWidth)
                    //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                    cell.fillColor = .black
                    cellStateRow.append(false)
                    cellRow.append(cell)
                    addChild(cell)
                }
                cells.append(cellRow)
                cellStates.append(cellStateRow)
            }
        } 
        onSimulation()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        //        make sure that didMove finishes running first
        if loaded {
            if interval == (framesPerUpdate - 1) {
                var newCellStates: [[Bool]] = []
                for i in 0...cellWidth {
                    var newCellRow: [Bool] = []
                    for j in 0...cellHeight {
                        let neighbours = calculateNeighbours(x: i, y: j)
                        if cellStates[i][j] && !(neighbours == 2 || neighbours == 3)  {
                            newCellRow.append(false)
                        } else if !cellStates[i][j] && neighbours == 3 {
                            newCellRow.append(true)
                        } else {
                            newCellRow.append(cellStates[i][j])
                        }
                    }
                    newCellStates.append(newCellRow)
                }
                cellStates = newCellStates
                for i in 0...cellWidth {
                    for j in 0...cellHeight {
                        if cellStates[i][j]{
                            cells[i][j].fillColor = .green
                            cells[i][j].name = "\(i),\(j)"
                        } else {
                            cells[i][j].fillColor = .black
                            cells[i][j].name = "\(i),\(j)"
                        }
                    }
                }
                interval = 0
            }
            interval += 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!    
        let touchLocation = touch.location(in:self)
        let touchedNode = self.nodes(at:touchLocation)[0]
        for i in 0...cellWidth {
            for j in 0...cellHeight {
                if touchedNode.name == "\(i),\(j)" {
                    if cellStates[i][j]{
                        cells[i][j].fillColor = .black
                        cellStates[i][j] = false
                    } else {
                        cells[i][j].fillColor = .green
                        cellStates[i][j] = true   
                    }
                    return
                }
            }
        }
    }
    
    func calculateNeighbours(x:Int, y:Int) -> Int {
        var neighbours = 0
        let neighbourList = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
        for entry in neighbourList{
            var neighbourX = x + entry[0]
            var neighbourY = y + entry[1]
            switch neighbourX {
            case -1:
                neighbourX = cellWidth
            case cellWidth + 1:
                neighbourX = 0
            default:
                break
            }
            
            switch neighbourY {
            case -1:
                neighbourY = cellHeight
            case cellHeight + 1:
                neighbourY = 0
            default:
                break
            }
            if cellStates[neighbourX][neighbourY]{
                neighbours += 1
            }
        }
        return neighbours
    }
    
    func onCell(x:Int,y:Int){
        cellStates[x][y] = true
        cells[x][y].fillColor = .green
    }
    
    func onSimulation(){
        loaded = true
    }   
}

struct Chapter35_Previews: PreviewProvider {
    static var previews: some View {
        Chapter35()
    }
}

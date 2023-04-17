import SwiftUI
import SpriteKit

//class MenuScene: SKScene{
//    var cellSize = 20
//    var cellStates: [[Bool]] = [] 
//    var cells: [[SKShapeNode]] = []
//    var interval = 0
//    var framesPerUpdate = 2
//    var strokeWidth: CGFloat = 3
//    var loaded = false
//    
//    override func didMove(to view: SKView) {
//        for i in 0...100{
//            var cellStateRow: [Bool] = []
//            var cellRow: [SKShapeNode] = []
//            for j in 0...100 {
//                let cell = SKShapeNode(rect: CGRect(x: cellSize*j, y: cellSize*i, width: cellSize, height: cellSize))
//                cell.strokeColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1)
//                cell.lineWidth = strokeWidth
//                if Bool.random(){
//                    //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//                    cell.fillColor = .black
//                    cellStateRow.append(false)
//                } else {
//                    //                    cell.fillColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
//                    cell.fillColor = .green
//                    cellStateRow.append(true)
//                }
//                cellRow.append(cell)
//                addChild(cell)
//            }
//            cells.append(cellRow)
//            cellStates.append(cellStateRow)
//        }
//        loaded = true
//    }
//    
//    override func update(_ currentTime: TimeInterval) {
//        //        if interval == (framesPerUpdate - 1) {
//        //        make sure that didMove finishes running first
//        if loaded {
//            var newCellStates: [[Bool]] = []
//            for i in 0...100 {
//                var newCellRow: [Bool] = []
//                for j in 0...100 {
//                    let neighbours = calculateNeighbours(x: i, y: j)
//                    if cellStates[i][j] && !(neighbours == 2 || neighbours == 3)  {
//                        newCellRow.append(false)
//                    } else if !cellStates[i][j] && neighbours == 3 {
//                        newCellRow.append(true)
//                    } else {
//                        newCellRow.append(cellStates[i][j])
//                    }
//                }
//                newCellStates.append(newCellRow)
//            }
//            cellStates = newCellStates
//            for i in 0...100 {
//                for j in 0...100 {
//                    if cellStates[i][j]{
//                        cells[i][j].fillColor = .green
//                    } else {
//                        cells[i][j].fillColor = .black
//                    }
//                }
//            }
//            //            interval = 0
//            //        }
//            //        interval += 1
//        }
//    }
//    
//    func calculateNeighbours(x:Int, y:Int) -> Int {
//        var neighbours = 0
//        let neighbourList = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
//        for entry in neighbourList{
//            var neighbourX = x + entry[0]
//            var neighbourY = y + entry[1]
//            switch neighbourX {
//            case -1:
//                neighbourX = 100
//            case 101:
//                neighbourX = 0
//            default:
//                break
//            }
//            
//            switch neighbourY {
//            case -1:
//                neighbourY = 100
//            case 101:
//                neighbourY = 0
//            default:
//                break
//            }
//            if cellStates[neighbourX][neighbourY]{
//                neighbours += 1
//            }
//        }
//        return neighbours
//    }
//}

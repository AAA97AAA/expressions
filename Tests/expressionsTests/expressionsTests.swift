import XCTest
import LogicKit
@testable import expressions

class expressionsTests: XCTestCase {

    // func testToNumber() {
    //     let expected : Term = List.cons (Value (5), List.cons (Value (1), List.empty))
    //     XCTAssert (toNumber (51).equals (expected), "toNumber is incorrect")
    // }
    // func testAdd() {
    //      let v = Variable(named: "v")
    //      let a = 0
    //      let b = 2
    //      let goal = eval_add(toNumber(a), toNumber(b) , v)
    //      let expected = toNumber(a+b)
    //      print("-------------")
    //      print("expected: \(expected) ")
    //      for sub in solve(goal) {
    //          let r = sub.reified()
    //          print("got: \(r[v]) ")
    //          XCTAssert(r[v].equals(expected), "This shit failed")
    //      }
    //    }
      func testReverse() {
           let v = Variable(named: "v")
           let depart = toNumber(366);
           let goal = reverse (depart,v)
           let expected = toNumber(663)
           print("-------------")
           print("expected: \(expected) ")
           for sub in solve(goal) {
               let r = sub.reified()
               print("got: \(r[v]) ")
               XCTAssert(r[v].equals(expected), "This shit failed")
       }
    
         }

    func testAddNumber() {
         let result = Variable(named: "v")
         let lhs = 786;
         let rhs = 987;
         //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
         let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
         let expected = toNumber(lhs + rhs)
         print("-------------")
         print("expected: \(expected) ")
         for sub in solve(goal) {
             let r = sub.reified()
             print("got: \(r[result]) ")
             XCTAssert(r[result].equals(expected), "This shit failed")
         }

       }

       func testSubtractNumber() {
            let result = Variable(named: "v")
            // doit je faire val abs? si lun est plus grand que l'autre, fait la sub de linverse

            let lhs = 1000;
            let rhs = 80;
            let goal = eval_sub(toNumber(lhs), toNumber(rhs), result)
            let expected = toNumber(lhs - rhs)
            print("-------------")
            print("expected: \(expected) ")
            for sub in solve(goal) {
                let r = sub.reified()
                print("got: \(r[result]) ")
                XCTAssert(r[result].equals(expected), "This shit failed")
            }

          }
    func testMultiply(){
        let result = Variable(named: "answer")
        let lhs = 50;
        let rhs = 2;
        let goal = eval_mult(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs * rhs)
        print("--------------")
        print("expected: \(expected) ")
        for sub in solve(goal) {
            let r = sub.reified()
            print("got: \(r[result]) ")
            XCTAssert(r[result].equals(expected), "This shit failed")
        }
    }
    /* func testDivision(){
        let result = Variable(named: "answer")
        let lhs = 20;
        let rhs = 2;
        let goal = eval_div(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs / rhs)
        print("--------------")
        print("expected: \(expected) ")
        for sub in solve(goal) {
            let r = sub.reified()
            print("got: \(r[result]) ")
            XCTAssert(r[result].equals(expected), "This shit failed")
        }
        print("fin du test")
    }
  
    */
    
    func testEqual() {
         let v = Variable(named: "v")
         let goal = evalEqual (toNumber(2), toNumber(2))
         for sub in solve(goal){
             let r = sub.reified()
             XCTAssert(r[v].equals(t), "the numbers are equal")
             }
        }

    static var allTests : [(String, (expressionsTests) -> () throws -> Void)] {
        return [

        ]
    }

}

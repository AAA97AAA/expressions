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
           for sub in solve(goal) {
               let r = sub.reified()
               XCTAssert(r[v].equals(expected), "Reverse 1 test fails")
            break
       }

         }

    func testReverse2() {
        let v = Variable(named: "v")
        let depart = toNumber(102);
        let goal = reverse (depart,v)
        let expected = toNumber(201)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "Reverse 2 test fails")
            break
        }

    }


    func testReverse3() {
        let v = Variable(named: "v")
        let depart = toNumber(661);
        let goal = reverse (depart,v)
        let expected = toNumber(166)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "Reverse 3 test fails")
            break
        }

    }


    func testReverse4() {
        let v = Variable(named: "v")
        let depart = toNumber(1024);
        let goal = reverse (depart,v)
        let expected = toNumber(4201)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "Reverse 4 test fails")
            break
        }

    }

//
//    func testReverse5() {
//        let v = Variable(named: "v")
//        let depart = toNumber(2048);
//        let goal = reverse (depart,v)
//        let expected = toNumber(8402)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[v].equals(expected), "Reverse 5 test fails")
//            break
//        }
//
//    }
//
//    func testReverse6() {
//        let v = Variable(named: "v")
//        let depart = toNumber(4096);
//        let goal = reverse (depart,v)
//        let expected = toNumber(6904)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[v].equals(expected), "Reverse 6 test fails")
//            break
//        }
//
//    }
//
//    func testReverse7() {
//        let v = Variable(named: "v")
//        let depart = toNumber(12345);
//        let goal = reverse (depart,v)
//        let expected = toNumber(54321)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[v].equals(expected), "Reverse 7 test fails")
//            break
//        }
//
//    }
//
//
//    func testReverse8() {
//        let v = Variable(named: "v")
//        let depart = toNumber(101013);
//        let goal = reverse (depart,v)
//        let expected = toNumber(310101)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[v].equals(expected), "Reverse 8 test fails")
//            break
//        }
//
//    }
//
//    func testReverse9() {
//        let v = Variable(named: "v")
//        let depart = toNumber(1997);
//        let goal = reverse (depart,v)
//        let expected = toNumber(7991)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[v].equals(expected), "Reverse 9 test fails")
//            break
//        }
//
//    }
//
//    func testReverse10() {
//        let v = Variable(named: "v")
//        let depart = toNumber(9);
//        let goal = reverse (depart,v)
//        let expected = toNumber(9)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[v].equals(expected), "Reverse 10 test fails")
//            break
//        }
//
//    }

    // addition
    func testAddNumber() {
         let result = Variable(named: "v")
         let lhs = 786;
         let rhs = 987;
         //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
         let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
         let expected = toNumber(lhs + rhs)
         for sub in solve(goal) {
             let r = sub.reified()
             XCTAssert(r[result].equals(expected), "Add test fails")
             break
        }

       }

    func testAddNumber2() {
        let result = Variable(named: "v")
        let lhs = 512;
        let rhs = 256;
        //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
        let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs + rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "Add test 2 fails")
            break
        }

    }

    func testAddNumber3() {
        let result = Variable(named: "v")
        let lhs = 1024;
        let rhs = 2048;
        //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
        let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs + rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "Add test 3 fails")
            break
        }

    }

    func testAddNumber4() {
        let result = Variable(named: "v")
        let lhs = 259;
        let rhs = 241;
        //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
        let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs + rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "Add test 4 fails")
            break
        }

    }

//    func testAddNumber5() {
//        let result = Variable(named: "v")
//        let lhs = 100001;
//        let rhs = 2560;
//        //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
//        let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
//        let expected = toNumber(lhs + rhs)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[result].equals(expected), "Add test 5 fails")
//            break
//        }
//
//    }
//
//    func testAddNumber6() {
//        let result = Variable(named: "v")
//        let lhs = 863;
//        let rhs = 6473;
//        //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
//        let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
//        let expected = toNumber(lhs + rhs)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[result].equals(expected), "Add test 6 fails")
//            break
//        }
//
//    }
//
//    func testAddNumber7() {
//        let result = Variable(named: "v")
//        let lhs = 1357;
//        let rhs = 795;
//        //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
//        let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
//        let expected = toNumber(lhs + rhs)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[result].equals(expected), "Add test 7 fails")
//            break
//        }
//
//    }
//
//    func testAddNumber8() {
//        let result = Variable(named: "v")
//        let lhs = 2727;
//        let rhs = 2727;
//        //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
//        let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
//        let expected = toNumber(lhs + rhs)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[result].equals(expected), "Add test 8 fails")
//            break
//        }
//
//    }
//
//    func testAddNumber9() {
//        let result = Variable(named: "v")
//        let lhs = 6997;
//        let rhs = 9797;
//        //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
//        let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
//        let expected = toNumber(lhs + rhs)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[result].equals(expected), "Add test 9 fails")
//            break
//        }
//
//    }
//
//    func testAddNumber10() {
//        let result = Variable(named: "v")
//        let lhs = 262626;
//        let rhs = 42;
//        //let goal = addNumber(toNumber(lhs),result, toNumber(rhs))
//        let goal = eval_add (toNumber(lhs), toNumber(rhs), result)
//        let expected = toNumber(lhs + rhs)
//        for sub in solve(goal) {
//            let r = sub.reified()
//            XCTAssert(r[result].equals(expected), "Add test 10 fails")
//            break
//        }
//
//    }

        // soustraction
       func testSubtractNumber() {
            let result = Variable(named: "v")
            // doit je faire val abs? si lun est plus grand que l'autre, fait la sub de linverse

            let lhs = 1000;
            let rhs = 80;
            let goal = eval_sub(toNumber(lhs), toNumber(rhs), result)
            let expected = toNumber(lhs - rhs)
            for sub in solve(goal) {
                let r = sub.reified()
                XCTAssert(r[result].equals(expected), "subtract  1 test fails")
                break
            }

          }

    func testSubtractNumber2() {
        let result = Variable(named: "v")
        // doit je faire val abs? si lun est plus grand que l'autre, fait la sub de linverse

        let lhs = 986;
        let rhs = 86;
        let goal = eval_sub(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs - rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "subtract 2 test fails")
            break
        }

    }

    func testSubtractNumber3() {
        let result = Variable(named: "v")
        // doit je faire val abs? si lun est plus grand que l'autre, fait la sub de linverse

        let lhs = 1997;
        let rhs = 42;
        let goal = eval_sub(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs - rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "subtract 3 test fails")
            break
        }

    }

    // multiplication

    func testMultiply(){
        let result = Variable(named: "answer")
        let lhs = 50;
        let rhs = 2;
        let goal = eval_mult(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs * rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "multiplication test echec")
            break
        }
    }

    func testMultiply2(){
        let result = Variable(named: "answer")
        let lhs = 27;
        let rhs = 4;
        let goal = eval_mult(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs * rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "multiplication 2 test echec")
            break
        }
    }

    func testMultiply3(){
        let result = Variable(named: "answer")
        let lhs = 12;
        let rhs = 1;
        let goal = eval_mult(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs * rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "multiplication 3 test echec")
            break
        }
    }

    // DIVISION

    func testDivision(){
        let result = Variable(named: "answer")
        let lhs = 42;
        let rhs = 2;
        let goal = eval_div(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs / rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "DIVISION 1 ECHEC")
            break
        }

    }

    func testDivision2(){
        let result = Variable(named: "answer")
        let lhs = 27;
        let rhs = 3;
        let goal = eval_div(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs / rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "DIVISION 2 ECHEC")
            break
        }

    }

    func testDivision3(){
        let result = Variable(named: "answer")
        let lhs = 42;
        let rhs = 2;
        let goal = eval_div(toNumber(lhs), toNumber(rhs), result)
        let expected = toNumber(lhs / rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "DIVISION 3 ECHEC")
            break
        }

    }

    // evalArithmetic
        // chaque test inclus plusieurs test (on fait des multiplication d'additions, etc...
    func testevalArithmetic1(){
        let result = Variable(named: "answer")
        let lhs = 42;
        let rhs = 2;
        let rhs2 = 3;
        let goal = evalArithmetic(input: add(divide(toNumber(lhs), toNumber(rhs)), toNumber(rhs2)), output: result)
        let expected = toNumber(lhs / rhs + rhs2)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "ARITHMETIQUE 1 ECHEC")
            break
        }

    }
    func testevalArithmetic2(){
        let result = Variable(named: "answer")
        let lhs = 256;
        let rhs = 256;
        let lhs2 = 20;
        let rhs2 = 10;
        let goal = evalArithmetic(input: add(subtract(toNumber(lhs), toNumber(rhs)), multiply(toNumber(lhs2), toNumber(rhs2))), output: result)
        let expected = toNumber((lhs - rhs) + (lhs * rhs))
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "ARITHMETIQUE 2 ECHEC")
            break
        }

    }

    func testevalArithmetic3(){
        let result = Variable(named: "answer")
        let lhs = 999;
        let rhs = 1;
        let goal = evalArithmetic(input: add(toNumber(lhs), toNumber(rhs)), output: result)
        let expected = toNumber(lhs + rhs)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "ARITHMETIQUE 3 ECHEC")
            break
        }

    }

    func testevalArithmetic4(){
        let result = Variable(named: "answer")
        let lhs = 42;
        let rhs = 2;
        let rhs2 = 2;
        let goal = evalArithmetic(input: subtract(add(toNumber(lhs), toNumber(rhs)), toNumber(rhs2)), output: result)
        let expected = toNumber(lhs + rhs - rhs2)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "ARITHMETIQUE 4 ECHEC")
            break
        }

    }

    func testevalArithmetic5(){
        let result = Variable(named: "answer")
        let lhs = 420;
        let rhs = 410;
        let rhs2 = 5;
        let goal = evalArithmetic(input: subtract(add(toNumber(lhs), toNumber(rhs)), toNumber(rhs2)), output: result)
        let expected = toNumber(lhs + rhs - rhs2)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "ARITHMETIQUE 5 ECHEC")
            break
        }

    }

    func testevalArithmetic6(){
        let result = Variable(named: "answer")
        let lhs = 42;
        let rhs = 2;
        let rhs2 = 2;
        let goal = evalArithmetic(input: subtract(multiply(toNumber(lhs), toNumber(rhs)), toNumber(rhs2)), output: result)
        let expected = toNumber(lhs * rhs - rhs2)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "ARITHMETIQUE 6 ECHEC")
            break
        }

    }

    // Booleens
    func testevalBool1(){
        let result = Variable(named: "answer")
        let goal = evalBoolean(input: or(f, or(t, f) ) , output: result)
        let expected = t
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "BOOL 1 ECHEC")
            break
        }

    }

    func testevalBool2(){
        let result = Variable(named: "answer")
        let goal = evalBoolean(input: or(f, and(t, f) ) , output: result)
        let expected = f
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "BOOL 2 ECHEC")
            break
        }

    }

    func testevalBool3(){
        let result = Variable(named: "answer")
        let goal = evalBoolean(input: not(implies(t, f) ) , output: result)
        let expected = t
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[result].equals(expected), "BOOL 3 ECHEC")
            break
        }

    }
        // comparison
       func testComparaisons1 () {
           let result = Variable (named: "v")
           let goal   = evalComparison (input: equal (toNumber (42), toNumber (42)), output: result)
           for sub in solve (goal) {
               XCTAssert (sub.reified () [result].equals (t), "Comparaisons 1 fails")
               break
           }
       }

       func testComparaisons2 () {
           let result = Variable (named: "v")
           let goal   = evalComparison (input: lessthan(toNumber (42), toNumber (42)), output: result)
           for sub in solve (goal) {
               XCTAssert (sub.reified () [result].equals (f), "Comparaisons 2 fails")
               break
           }
       }

       func testComparaisons3 () {
           let result = Variable (named: "v")
           let goal   = evalComparison (input: lessequal(toNumber (42), toNumber (42)), output: result)
           for sub in solve (goal) {
               XCTAssert (sub.reified () [result].equals (t), "Comparaisons 3 fails")
               break
           }
       }

       func testComparaisons4 () {
           let result = Variable (named: "v")
           let goal   = evalComparison (input: greaterthan(toNumber (42), toNumber (42)), output: result)
           for sub in solve (goal) {
               XCTAssert (sub.reified () [result].equals (f), "Comparaisons 4 fails")
               break
           }
       }

       func testComparaisons5 () {
           let result = Variable (named: "v")
           let goal   = evalComparison (input: greaterequal(toNumber (42), toNumber (42)), output: result)
           for sub in solve (goal) {
               XCTAssert (sub.reified () [result].equals (t), "Comparaisons 5 fails")
               break
           }
       }

       func testComparaisons6 () {
           let result = Variable (named: "v")
           let goal   = evalComparison (input: notequal(toNumber (42), toNumber (42)), output: result)
           for sub in solve (goal) {
               XCTAssert (sub.reified () [result].equals (f), "Comparaisons 6 fails")
               break
           }
       }





    //
//    // Test Alban
//    // eval evalArithmetic
//      func testOfficialAddition_1 () {
//            let result = Variable (named: "v")
//            let goal   = evalArithmetic (input: add (toNumber(999), toNumber(0)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (toNumber (999+0)), "official addition 1 fails")
//                  break
//                }
//          }
//    func testOfficialAddition_2 () {
//            let result = Variable (named: "v")
//            let goal   = evalArithmetic (input: add (toNumber(999), toNumber(999)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (toNumber (999+999)), "official addition 2 fails")
//                  break
//                }
//          }
//
//      func testOfficialSubtraction_1 () {
//            let result = Variable (named: "v")
//            let goal   = evalArithmetic (input: subtract (toNumber(20), toNumber(9)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (toNumber (20-9)), "official subtraction 1 fails")
//                  break
//                }
//          }
//
//      func testOfficialSubtraction_2 () {
//            let result = Variable (named: "v")
//            let goal   = evalArithmetic (input: subtract (toNumber(10), toNumber(0)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (toNumber (10-0)), "official subtraction 2 fails")
//                  break
//                }
//          }
//
//    func testOfficialMultiplication_1 () {
//            let result = Variable (named: "v")
//            let goal   = evalArithmetic (input: multiply (toNumber(19), toNumber(0)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (toNumber (19*0)), "official multiplication 1 fails")
//                  break
//                }
//     }
//
//      func testOfficialMultiplication_2 () {
//            let result = Variable (named: "v")
//            let goal   = evalArithmetic (input: multiply (toNumber(19), toNumber(1)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (toNumber (19*1)), "official multiplication 2 fails")
//                  break
//                }
//          }
//
//      func testOfficialMultiplication_3 () {
//            let result = Variable (named: "v")
//            let goal   = evalArithmetic (input: multiply (toNumber(19), toNumber(9)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (toNumber (19*9)), "official multiplication 3 fails")
//                  break
//                }
//          }
//
//      func testOfficialDivision_1 () {
//            let result = Variable (named: "v")
//            let goal   = evalArithmetic (input: divide (toNumber(5), toNumber(1)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (toNumber (5/1)), "official division fails")
//                  break
//                }
//          }
//    // evalBool
//      func testOfficialConjunction_1 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: and (t, and (t, t)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (t), "official conjunction fails")
//                  break
//                }
//          }
//
//      func testOfficialConjunction_2 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: and (t, and (t, f)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (f), "official conjunction fails")
//                  break
//                }
//          }
//
//      func testOfficialConjunction_3 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: and (and (f, t), t), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (f), "official conjunction fails")
//                  break
//            }
//          }
//
//    func testOfficialDisjunction_1 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: or (f, or (t, f)), output: result)
//            for sub in solve (goal) {
//              XCTAssert (sub.reified () [result].equals (t), "official disjunction fails")
//                  break
//                }
//          }
//
//      func testOfficialDisjunction_2 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: or (f, or (f, f)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (f), "official disjunction fails")
//                  break
//                }
//          }
//
//      func testOfficialDisjunction_3 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: or (or (f, f), f), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (f), "official disjunction fails")
//                  break
//                }
//          }
//    // MODIFICATION APPORTE , OR(T, F) > T DONC SA NEGATION FALSE
//
//      func testOfficialNegation_1 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: not (or (t, f)), output: result)
//            for sub in solve (goal) {
//              XCTAssert (sub.reified () [result].equals (f), "official negation fails")
//                  break
//                }
//          }
//
//    // NEGATION DE FALSE = TRUE
//    func testOfficialNegation_2 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: not (and (t, f)), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (t), "official negation fails")
//                  break
//                }
//          }
//
//      func testOfficialImplication_1 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: implies (f, f), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (t), "official implication fails")
//                  break
//                }
//          }
//
//      func testOfficialImplication_2 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: implies (t, t), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (t), "official implication fails")
//                  break
//                }
//          }
//
//      func testOfficialImplication_3 () {
//            let result = Variable (named: "v")
//            let goal   = evalBoolean (input: implies (t, f), output: result)
//            for sub in solve (goal) {
//                  XCTAssert (sub.reified () [result].equals (f), "official implication fails")
//                  break
//                }
//          }
//    // evalComparison
//
//    func testOfficialEquality_1 () {
//        let result = Variable (named: "v")
//        let goal   = evalComparison (input: equal (toNumber (42), toNumber (42)), output: result)
//        for sub in solve (goal) {
//            XCTAssert (sub.reified () [result].equals (t), "official equality fails")
//            break
//        }
//    }
//
//    func testOfficialEquality_2 () {
//        let result = Variable (named: "v")
//        let goal   = evalComparison (input: equal (toNumber (42), toNumber (51)), output: result)
//        for sub in solve (goal) {
//            XCTAssert (sub.reified () [result].equals (f), "official equality fails")
//            break
//        }
//    }
//
//    func testOfficialInequality_1 () {
//        let result = Variable (named: "v")
//        let goal   = evalComparison (input: notequal (toNumber (42), toNumber (42)), output: result)
//        for sub in solve (goal) {
//            XCTAssert (sub.reified () [result].equals (f), "official inequality fails")
//            break
//        }
//    }
//
//    func testOfficialInequality_2 () {
//        let result = Variable (named: "v")
//        let goal   = evalComparison (input: notequal (toNumber (42), toNumber (51)), output: result)
//        for sub in solve (goal) {
//            XCTAssert (sub.reified () [result].equals (t), "official inequality fails")
//            break
//        }
//    }
//
//     func testOfficialGreaterthan_1 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: greaterthan (toNumber (51), toNumber (42)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (t), "official greater than comparison fails")
//     break
//     }
//     }
//
//     func testOfficialGreaterthan_2 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: greaterthan (toNumber (42), toNumber (42)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (f), "official greater than comparison fails")
//     break
//     }
//     }
//
//     func testOfficialGreaterthan_3 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: greaterthan (toNumber (42), toNumber (51)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (f), "official greater than comparison fails")
//     break
//     }
//     }
//
//     func testOfficialGreaterequal_1 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: greaterequal (toNumber (51), toNumber (42)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (t), "official greater or equal comparison fails")
//     break
//     }
//     }
//
//     func testOfficialGreaterequal_2 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: greaterequal (toNumber (42), toNumber (42)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (t), "official greater or equal comparison fails")
//     break
//     }
//     }
//
//     func testOfficialGreaterequal_3 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: greaterequal (toNumber (42), toNumber (51)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (f), "official greater or equal comparison fails")
//     break
//     }
//     }
//
//     func testOfficialLessthan_1 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: lessthan (toNumber (51), toNumber (42)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (f), "official less than comparison fails")
//     break
//     }
//     }
//
//     func testOfficialLessthan_2 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: lessthan (toNumber (42), toNumber (42)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (f), "official less than comparison fails")
//     break
//     }
//     }
//
//     func testOfficialLessthan_3 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: lessthan (toNumber (42), toNumber (51)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (t), "official less than comparison fails")
//     break
//     }
//     }
//
//     func testOfficialLessequal_1 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: lessequal (toNumber (51), toNumber (42)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (f), "official less or equal comparison fails")
//     break
//     }
//     }
//
//     func testOfficialLessequal_2 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: lessequal (toNumber (42), toNumber (42)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (t), "official less or equal comparison fails")
//     break
//     }
//     }
//
//     func testOfficialLessequal_3 () {
//     let result = Variable (named: "v")
//     let goal   = evalComparison (input: lessequal (toNumber (42), toNumber (51)), output: result)
//     for sub in solve (goal) {
//     XCTAssert (sub.reified () [result].equals (t), "official less or equal comparison fails")
//     break
//     }
//     }



    static var allTests : [(String, (expressionsTests) -> () throws -> Void)] {
        return [
            // TEST ASLAM

            ("testReverse1"                 , testReverse),

//            // TEST ALBAN
//            ("testOfficialAddition_1"       , testOfficialAddition_1),
//            ("testOfficialAddition_2"       , testOfficialAddition_2),
//            ("testOfficialSubtraction_1"    , testOfficialSubtraction_1),
//            ("testOfficialSubtraction_2"    , testOfficialSubtraction_2),
//            // ("testOfficialSubtraction_3"    , testOfficialSubtraction_3),
//            ("testOfficialMultiplication_1" , testOfficialMultiplication_1),
//            ("testOfficialMultiplication_2" , testOfficialMultiplication_2),
//            ("testOfficialMultiplication_3" , testOfficialMultiplication_3),
//            ("testOfficialDivision_1"       , testOfficialDivision_1),
//            // ("testOfficialDivision_2"       , testOfficialDivision_2),
//            // ("testOfficialDivision_3"       , testOfficialDivision_3),
//            ("testOfficialConjunction_1"    , testOfficialConjunction_1),
//            ("testOfficialConjunction_2"    , testOfficialConjunction_2),
//            ("testOfficialConjunction_3"    , testOfficialConjunction_3),
//            ("testOfficialDisjunction_1"    , testOfficialDisjunction_1),
//            ("testOfficialDisjunction_2"    , testOfficialDisjunction_2),
//            ("testOfficialDisjunction_3"    , testOfficialDisjunction_3),
//            ("testOfficialNegation_1"       , testOfficialNegation_1),
//            ("testOfficialNegation_2"       , testOfficialNegation_2),
//            ("testOfficialImplication_1"    , testOfficialImplication_1),
//            ("testOfficialImplication_2"    , testOfficialImplication_2),
//            ("testOfficialImplication_3"    , testOfficialImplication_3),
//
//
//            ("testOfficialEquality_1"       , testOfficialEquality_1),
//            ("testOfficialEquality_2"       , testOfficialEquality_2),
//            ("testOfficialInequality_1"     , testOfficialInequality_1),
//            ("testOfficialInequality_2"     , testOfficialInequality_2),
//            ("testOfficialGreaterthan_1"    , testOfficialGreaterthan_1),
//            ("testOfficialGreaterthan_2"    , testOfficialGreaterthan_2),
//            ("testOfficialGreaterthan_3"    , testOfficialGreaterthan_3),
//            ("testOfficialGreaterequal_1"   , testOfficialGreaterequal_1),
//            ("testOfficialGreaterequal_2"   , testOfficialGreaterequal_2),
//            ("testOfficialGreaterequal_3"   , testOfficialGreaterequal_3),
//            ("testOfficialLessthan_1"       , testOfficialLessthan_1),
//            ("testOfficialLessthan_2"       , testOfficialLessthan_2),
//            ("testOfficialLessthan_3"       , testOfficialLessthan_3),
//            ("testOfficialLessequal_1"      , testOfficialLessequal_1),
//            ("testOfficialLessequal_2"      , testOfficialLessequal_2),
//            ("testOfficialLessequal_3"      , testOfficialLessequal_3),


        ]
    }

}

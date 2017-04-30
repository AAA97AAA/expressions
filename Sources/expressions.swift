import LogicKit

// Numbers:

let d0 = Value (0)
let d1 = Value (1)
let d2 = Value (2)
let d3 = Value (3)
let d4 = Value (4)
let d5 = Value (5)
let d6 = Value (6)
let d7 = Value (7)
let d8 = Value (8)
let d9 = Value (9)

func toNumber (_ n : Int) -> Term {
    var result = List.empty
    for char in String (n).characters.reversed () {
        switch char {
        case "0":
            result = List.cons (d0, result)
        case "1":
            result = List.cons (d1, result)
        case "2":
            result = List.cons (d2, result)
        case "3":
            result = List.cons (d3, result)
        case "4":
            result = List.cons (d4, result)
        case "5":
            result = List.cons (d5, result)
        case "6":
            result = List.cons (d6, result)
        case "7":
            result = List.cons (d7, result)
        case "8":
            result = List.cons (d8, result)
        case "9":
            result = List.cons (d9, result)
        default:
            assert (false)
        }
    }
    return result
}



// Arithmetic:

// les choses simples (syntaxe abstraite puis semantique)//


      // addition
      // a, b in N
      // ----------
      // a + b in N
      ////
      // a -N-> a_v, b -N-> b_v
      // ----------------------
      // a + b -> a_v +N b_v
      func add(_ lhs: Term, _ rhs: Term) -> Map {
        return [
            "op"  : Value ("+"),
            "lhs" : lhs,
            "rhs" : rhs,
        ]
      }

      // a, b in N
      // ----------------------
      // a - b in N
      ////
      // a -N-> a_v, b -N-> b_v, a>= b
      // ----------------------
      // a + b -> a_v -N b_v
      func subtract (_ lhs: Term, _ rhs: Term) -> Map {
          return [
              "op"  : Value ("-"),
              "lhs" : lhs,
              "rhs" : rhs,
          ]
      }

      // a, b in N
      // ---------
      // a * b in N
      ////
      // a -N-> a_v, b -N-> b_v
      // ----------------------
      // a * b -> a_v *N b_v
      func multiply (_ lhs: Term, _ rhs: Term) -> Map {
          return [
              "op"  : Value ("*"),
              "lhs" : lhs,
              "rhs" : rhs,
          ]
      }

      // a, b, k in N
      // ---------------------
      // a/b in N
      ////
      // a -N-> a_v, b -N-> b_v, a_v = k * b_v
      // ----------------------
      // a / b -> a_v /N b_v
      func divide (_ lhs: Term, _ rhs: Term) -> Map {
          return [
              "op"  : Value ("/"),
              "lhs" : lhs,
              "rhs" : rhs,
          ]
      }
// les choses compliqués

/* ADDITIONS */

// fonction qui nous permet d'additionner deux chiffres

func addDigit(_ lhs: Term, _ rhs: Term, _ result: Term, _ rest: Term)-> Goal{
  return  (lhs === d0 && result === rhs && rest === d0) ||
          (rhs === d0 && result === lhs && rest === d0) ||
              // lhs = 1
          ((lhs === d1) && (rhs === d1) && (result === d2) && (rest === d0)) ||
          ((lhs === d1) && (rhs === d2) && (result === d3) && (rest === d0)) ||
          ((lhs === d1) && (rhs === d3) && (result === d4) && (rest === d0)) ||
          ((lhs === d1) && (rhs === d4) && (result === d5) && (rest === d0)) ||
          ((lhs === d1) && (rhs === d5) && (result === d6) && (rest === d0)) ||
          ((lhs === d1) && (rhs === d6) && (result === d7) && (rest === d0)) ||
          ((lhs === d1) && (rhs === d7) && (result === d8) && (rest === d0)) ||
          ((lhs === d1) && (rhs === d8) && (result === d9) && (rest === d0)) ||
          ((lhs === d1) && (rhs === d9) && (result === d0) && (rest === d1)) ||
            // lhs = 2
          ((lhs === d2) && (rhs === d1) && (result === d3) && (rest === d0)) ||
          ((lhs === d2) && (rhs === d2) && (result === d4) && (rest === d0)) ||
          ((lhs === d2) && (rhs === d3) && (result === d5) && (rest === d0)) ||
          ((lhs === d2) && (rhs === d4) && (result === d6) && (rest === d0)) ||
          ((lhs === d2) && (rhs === d5) && (result === d7) && (rest === d0)) ||
          ((lhs === d2) && (rhs === d6) && (result === d8) && (rest === d0)) ||
          ((lhs === d2) && (rhs === d7) && (result === d9) && (rest === d0)) ||
          ((lhs === d2) && (rhs === d8) && (result === d0) && (rest === d1)) ||
          ((lhs === d2) && (rhs === d9) && (result === d1) && (rest === d1)) ||
            // lhs = 3
          ((lhs === d3) && (rhs === d1) && (result === d4) && (rest === d0)) ||
          ((lhs === d3) && (rhs === d2) && (result === d5) && (rest === d0)) ||
          ((lhs === d3) && (rhs === d3) && (result === d6) && (rest === d0)) ||
          ((lhs === d3) && (rhs === d4) && (result === d7) && (rest === d0)) ||
          ((lhs === d3) && (rhs === d5) && (result === d8) && (rest === d0)) ||
          ((lhs === d3) && (rhs === d6) && (result === d9) && (rest === d0)) ||
          ((lhs === d3) && (rhs === d7) && (result === d0) && (rest === d1)) ||
          ((lhs === d3) && (rhs === d8) && (result === d1) && (rest === d1)) ||
          ((lhs === d3) && (rhs === d9) && (result === d2) && (rest === d1)) ||
            // lhs = 4
          ((lhs === d4) && (rhs === d1) && (result === d5) && (rest === d0)) ||
          ((lhs === d4) && (rhs === d2) && (result === d6) && (rest === d0)) ||
          ((lhs === d4) && (rhs === d3) && (result === d7) && (rest === d0)) ||
          ((lhs === d4) && (rhs === d4) && (result === d8) && (rest === d0)) ||
          ((lhs === d4) && (rhs === d5) && (result === d9) && (rest === d0)) ||
          ((lhs === d4) && (rhs === d6) && (result === d0) && (rest === d1)) ||
          ((lhs === d4) && (rhs === d7) && (result === d1) && (rest === d1)) ||
          ((lhs === d4) && (rhs === d8) && (result === d2) && (rest === d1)) ||
          ((lhs === d4) && (rhs === d9) && (result === d3) && (rest === d1)) ||
              //lhs = 5
          ((lhs === d5) && (rhs === d0) && (result === d5) && (rest === d0)) ||
          ((lhs === d5) && (rhs === d1) && (result === d6) && (rest === d0)) ||
          ((lhs === d5) && (rhs === d2) && (result === d7) && (rest === d0)) ||
          ((lhs === d5) && (rhs === d3) && (result === d8) && (rest === d0)) ||
          ((lhs === d5) && (rhs === d4) && (result === d9) && (rest === d0)) ||
          ((lhs === d5) && (rhs === d5) && (result === d0) && (rest === d1)) ||
          ((lhs === d5) && (rhs === d6) && (result === d1) && (rest === d1)) ||
          ((lhs === d5) && (rhs === d7) && (result === d2) && (rest === d1)) ||
          ((lhs === d5) && (rhs === d8) && (result === d3) && (rest === d1)) ||
          ((lhs === d5) && (rhs === d9) && (result === d4) && (rest === d1)) ||
          // lhs = 6
          ((lhs === d6) && (rhs === d0) && (result === d6) && (rest === d0)) ||
          ((lhs === d6) && (rhs === d1) && (result === d7) && (rest === d0)) ||
          ((lhs === d6) && (rhs === d2) && (result === d8) && (rest === d0)) ||
          ((lhs === d6) && (rhs === d3) && (result === d9) && (rest === d0)) ||
          ((lhs === d6) && (rhs === d4) && (result === d0) && (rest === d1)) ||
          ((lhs === d6) && (rhs === d5) && (result === d1) && (rest === d1)) ||
          ((lhs === d6) && (rhs === d6) && (result === d2) && (rest === d1)) ||
          ((lhs === d6) && (rhs === d7) && (result === d3) && (rest === d1)) ||
          ((lhs === d6) && (rhs === d8) && (result === d4) && (rest === d1)) ||
          ((lhs === d6) && (rhs === d9) && (result === d5) && (rest === d1)) ||
          // lhs = 7
          ((lhs === d7) && (rhs === d0) && (result === d7) && (rest === d0)) ||
          ((lhs === d7) && (rhs === d1) && (result === d8) && (rest === d0)) ||
          ((lhs === d7) && (rhs === d2) && (result === d9) && (rest === d0)) ||
          ((lhs === d7) && (rhs === d3) && (result === d0) && (rest === d1)) ||
          ((lhs === d7) && (rhs === d4) && (result === d1) && (rest === d1)) ||
          ((lhs === d7) && (rhs === d5) && (result === d2) && (rest === d1)) ||
          ((lhs === d7) && (rhs === d6) && (result === d3) && (rest === d1)) ||
          ((lhs === d7) && (rhs === d7) && (result === d4) && (rest === d1)) ||
          ((lhs === d7) && (rhs === d8) && (result === d5) && (rest === d1)) ||
          ((lhs === d7) && (rhs === d9) && (result === d6) && (rest === d1)) ||
          // lhs = 8
          ((lhs === d8) && (rhs === d0) && (result === d8) && (rest === d0)) ||
          ((lhs === d8) && (rhs === d1) && (result === d9) && (rest === d0)) ||
          ((lhs === d8) && (rhs === d2) && (result === d0) && (rest === d1)) ||
          ((lhs === d8) && (rhs === d3) && (result === d1) && (rest === d1)) ||
          ((lhs === d8) && (rhs === d4) && (result === d2) && (rest === d1)) ||
          ((lhs === d8) && (rhs === d5) && (result === d3) && (rest === d1)) ||
          ((lhs === d8) && (rhs === d6) && (result === d4) && (rest === d1)) ||
          ((lhs === d8) && (rhs === d7) && (result === d5) && (rest === d1)) ||
          ((lhs === d8) && (rhs === d8) && (result === d6) && (rest === d1)) ||
          ((lhs === d8) && (rhs === d9) && (result === d7) && (rest === d1)) ||
          // lhs = 9
          ((lhs === d9) && (rhs === d0) && (result === d9) && (rest === d0)) ||
          ((lhs === d9) && (rhs === d1) && (result === d0) && (rest === d1)) ||
          ((lhs === d9) && (rhs === d2) && (result === d1) && (rest === d1)) ||
          ((lhs === d9) && (rhs === d3) && (result === d2) && (rest === d1)) ||
          ((lhs === d9) && (rhs === d4) && (result === d3) && (rest === d1)) ||
          ((lhs === d9) && (rhs === d5) && (result === d4) && (rest === d1)) ||
          ((lhs === d9) && (rhs === d6) && (result === d5) && (rest === d1)) ||
          ((lhs === d9) && (rhs === d7) && (result === d6) && (rest === d1)) ||
          ((lhs === d9) && (rhs === d8) && (result === d7) && (rest === d1)) ||
          ((lhs === d9) && (rhs === d9) && (result === d8) && (rest === d1))
// en collaboration avec Petrik Binko (les 5 premiers)
}

// deux fonctions qui nous permettent d'inverser une liste
func reverseAcc(_ depart: Term, _ acc: Term, _ reversed: Term)->Goal {
    return ((depart === List.empty) && (reversed === acc)) || delayed(
        freshn { t in
        let head = t ["head"]
        let tail = t ["tail"]
        return  depart === List.cons(head, tail) &&
                reverseAcc(tail, List.cons(head, acc), reversed)
    })
}

func reverse (_ depart: Term, _ reversed: Term) -> Goal{
  return reverseAcc(depart, List.empty, reversed)
}



// fonction qui ajoute deux nombres (avec les listes renversées)


// a, b in N
// -----------
// a + b in N
func addNumber(_ lhs: Term, _ rhs: Term, _ result : Term) -> Goal{
  return delayed(
    // case de base
    // ici tu nous a montré qu'il fallait mettre les deux cas de bases mais est ce qu'il
    // ne suffirait pas d'en mettre un car LogicKit est assez intelligent pour trouver tout
    // les cas et donc ici, il en trouverait deux? (eg: 36 + 7, il trouve deux resultats et
    // il suffit d'enlever une ligne   )
    // mais si on résonne ainsi, il devrait trouver deux resultats pour tout les tests
    // or ce n'est pas le cas (eg: 36 + 2)
    freshn { v in
        let tail = v ["tail"]
        let head = v ["head"]
        let tailn = v ["tailn"]
        let headn = v ["headn"]
        return
            (lhs === List.empty && rhs === List.cons(head, tail) && result === rhs) ||
            (rhs === List.empty && lhs === List.cons(headn, tailn) && result === lhs) ||
            (lhs === List.empty && rhs === List.empty && result === List.empty)
        } ||
    // autres cas
    freshn { t in
        let lhead = t ["lhead"]
        let ltail = t ["ltail"]
        let rhead = t ["rhead"]
        let rtail = t ["rtail"]
        let resHead = t ["resHead"]
        let resTail = t ["resTail"]
        let resultatAvantAjoutRetenue = t ["resultatAvantAjoutRetenue"]

        return
           lhs === List.cons(lhead,ltail) &&
           rhs === List.cons(rhead,rtail) &&
           result === List.cons(resHead,resTail)  &&
            // s'il n'y a pas de retenue:
            // addDigit a comme retenue d0, alors on ajoute les deux head et on met le resultat dans
            // le resHead, et on fait récursivement le calcul sur le reste de la liste (les tails)
            (((addDigit(lhead, rhead, resHead, d0)) && addNumber(ltail, rtail, resTail)) ||
            // s'il y a une retenue
            // alors la retenue dans addDigit vaut 1
            // donc on fait le calcul normal sans tenir compte de la retenue qu'on rajoute  1 après
            (addDigit(lhead, rhead, resHead, d1) && addNumber(ltail, rtail, resultatAvantAjoutRetenue) && addNumber(resultatAvantAjoutRetenue, toNumber(1), resTail)))

    })
   }

// fonction qui prend en entrée deux listes de nombres, et qui calcule le resultat dans la troisème liste
  // il inverse les listes et appelle addNumber qui nous retourne la liste inversé
  // que nous ré-inversions pour avoir le resultat
func eval_add (_ lhs: Term, _ rhs: Term, _ result : Term) -> Goal {
   return delayed(
     freshn { t in
       let reversed_lhs = t ["reversed_lhs"]
       let reversed_rhs = t ["reversed_rhs"]
       let resultat_reversed = t["resultat_reversed"]
       //
       return (reverse(lhs, reversed_lhs) && reverse(rhs, reversed_rhs) &&
               addNumber(reversed_lhs, reversed_rhs, resultat_reversed) &&
               reverse(resultat_reversed, result))

     } )
}


/* SOUSTRACTION */
/* PB */

func eval_sub(_ lhs: Term, _ rhs: Term, _ result: Term)-> Goal{
    return
      delayed(
        freshn { t in
          let tail = t ["tail"]
          let head = t ["head"]
           let reversed_lhs = t ["reversed_lhs"]
           let reversed_rhs = t ["reversed_rhs"]
           let resultat_reversed = t["resultat_reversed"]
          return
            // On procède comme pour eval add, mais le resultat se trouve dans le premier parametre
             reverse(lhs, reversed_lhs) && reverse(rhs, reversed_rhs) &&
             addNumber(resultat_reversed , reversed_rhs, reversed_lhs) &&
             reverse(resultat_reversed, result) && result === List.cons(head, tail) &&
                // On vérifie que le premier element n'est pas un zero: sinon, il ne va pas fonctionner avec le XCTAssert
            ((head === d9) || (head === d8) || (head === d7) || (head === d6)  ||  (head === d5) || (head === d4) || (head === d3) || (head === d2) || (head === d1))



        }
      )


    // a + b = c pour faire une addition
    // ici b est le resultat donc on fait c - a
    //

  }


/* Multiplication */


func eval_mult(_ lhs: Term, _ rhs: Term, _ result : Term) -> Goal {
    return
        freshn { v in
            let tail = v ["tail"]
            let head = v ["head"]
            let tailn = v ["tailn"]
            let headn = v ["headn"]
            return
                (lhs === toNumber(0) && rhs === List.cons(head, tail) && result === lhs) ||
                (rhs === toNumber(0) && lhs === List.cons(headn, tailn) && result === rhs) ||
                (lhs === result && rhs === toNumber(1)) ||
                (rhs === result && lhs === toNumber(1))
    } ||
    
      delayed( freshn{ t in
        // let resInterm = t ["resInterm"]
        let encoreAjouter = t ["encoreAjouter"]
        //let decrement = t["decrement"]
        let temp = t ["temp"]
        return
          (
          // mutltiplier par n revient a l'ajouter n fois
          eval_sub(rhs, toNumber(1), encoreAjouter) &&
          eval_mult(lhs, encoreAjouter, temp) &&
          eval_add(temp, lhs, result)


      )
    })

}


/* Division */

func eval_div(_ lhs: Term, _ rhs: Term, _ result: Term) -> Goal {
    return (lhs === rhs && result === toNumber(1)) || (rhs === List.empty && result === List.empty) ||
        delayed(        freshn { k in
            let tail = k ["tail"]
            let head = k ["head"]
            return
                // diviser c'est comme multiplier: a/b = c =>  a = b*c
                (eval_mult(result, rhs, lhs) && (result === List.cons(head, tail)) &&
                    // On vérifie que le premier element n'est pas un zero: sinon, il ne va pas fonctionner avec le XCTAssert
                    ((head === d9) || (head === d8) || (head === d7) || (head === d6)  ||  (head === d5) || (head === d4) || (head === d3) || (head === d2) || (head === d1)) )
            
            
            
            
    }) &&
    eval_mult(rhs, result, lhs)
}






// Booleans:
//
// ---------
// t in Booleans
////
//
// ---------
// f in Booleans

let t = Value (true)
let f = Value (false)

// b in B
// ------------
// not (b) in B
////
// b => f
// ------------
// not(b) => t
////
// b => t
// ------------
// not(b) => f
func not (_ t : Term) -> Map {
  return [
    "op": Value ("not"),
    "what": t,
  ]
}

// l, r in B
// ------------
// l and r in B
////
// l -B-> l_v, r -B-> r_v,  (l_v, r_v) == true
// ------------
// l and r => t
////
// l -B-> l_v, r -B-> r_v,  l_v == false , r_v == true
// ------------
// l and r => f
////
// l -B-> l_v, r -B-> r_v,  l_v == false , r_v == false
// ------------
// l and r => f
////
// l -B-> l_v, r -B-> r_v,  l_v == true , r_v == false
// ------------
// l and r => f

func and (_ lhs : Term, _ rhs : Term) -> Map {
  return [
    "op": Value ("and"),
    "lhs": lhs,
    "rhs": rhs,
  ]
}

// l, r in B
// -----------
// l or r in B
////
// l -B-> l_v, r -B-> r_v,  l_v == false , r_v == false
// ------------
// l or r => f
////
// l -B-> l_v, r -B-> r_v,  l_v == true
// ------------
// l or r => f
////
// l -B-> l_v, r -B-> r_v,  r_v == true
// ------------
// l or r => f
////
//
// ------------
//
func or (_ lhs : Term, _ rhs : Term) -> Map {
  return [
    "op": Value ("or"),
    "lhs": lhs,
    "rhs": rhs,
  ]
}

// l, r, ans in B
// ----------------
// l implies r: ans in B
////
// l -B-> l_v, r -B-> r_v,  r_v == true, ans == true
// ------------
// l implies r: ans in B
////
// l -B-> l_v, r -B-> r_v,  l_v == true , r_v == false, ans == false
// ------------
// l implies r: ans in B
////
// l -B-> l_v, r -B-> r_v,  l_v == false , r_v == false, ans == true
// ------------
// l implies r: ans in B

func implies (_ lhs : Term, _ rhs : Term) -> Map {
  return [
    "op": Value ("implies"),
    "lhs": lhs,
    "rhs": rhs,
  ]
}









// Comparisons:

// l, r in N
// ----------
// l < r in B
////
// l -N-> l_v, r -N-> r_v
// -----------------------
// l < r => l_v < r_v
func lessthan (_ lhs: Term, _ rhs: Term) -> Map {
    return [
            "op": Value ("<"),
            "lhs": lhs,
            "rhs": rhs,
            ]
}



// l, r in N
// ----------
// l <= r in B
////
// l -N-> l_v, r -N-> r_v
// -----------------------
// l <= r => l_v <=N r_v
func lessequal (_ lhs: Term, _ rhs: Term) -> Map {
    return [
            "op": Value ("<="),
            "lhs": lhs,
            "rhs": rhs,
            ]
}

// l, r in N
// ----------
// l > r in B
////
// l -N-> l_v, r -N-> r_v
// -----------------------
// l > r => l_v >N r_v
func greaterthan (_ lhs: Term, _ rhs: Term) -> Map {
    return [
            "op": Value (">"),
            "lhs": lhs,
            "rhs": rhs,
            ]
}

// l, r in N
// ----------
// l >= r in B
////
// l -N-> l_v, r -N-> r_v
// -----------------------
// l >= r => l_v >=N r_v
func greaterequal (_ lhs: Term, _ rhs: Term) -> Map {
    return [
            "op": Value (">="),
            "lhs": lhs,
            "rhs": rhs,
            ]
}

// l, r in N
// ----------
// l == r in B
////
// l -N-> l_v, r -N-> r_v
// -----------------------
// l == r => l_v ==N r_v
func equal (_ lhs: Term, _ rhs: Term) -> Map {
    return [
            "op": Value ("=="),
            "lhs": lhs,
            "rhs": rhs,
            ]
}

// l, r in N
// ----------
// l >= r in B
////
// l -N-> l_v, r -N-> r_v
// -----------------------
// l >= r => l_v >= r_v
func notequal (_ lhs: Term, _ rhs: Term) -> Map {
    return [
            "op": Value ("!="),
            "lhs": lhs,
            "rhs": rhs,
            ]
}

// Comparisons Evaluation:

func evalLessthan( _ lhs: Term, _ rhs: Term) -> Goal{
    return
        freshn{ a in
            let lhead = a["lhead"]
            let ltail = a["ltail"]
            let rhead = a["rhead"]
            let rtail = a["rtail"]
    
            return
                    (lhs === List.cons(lhead, ltail)) &&
                    (rhs === List.cons(rhead, rtail)) &&
                    lessthanvalue(lhead, rhead) &&
                    (equal(ltail, rtail))
    }
}

func evalLessequal( _ lhs: Term, _ rhs: Term) -> Goal{
    return
        freshn{ a in
            let lhead = a["lhead"]
            let ltail = a["ltail"]
            let rhead = a["rhead"]
            let rtail = a["rtail"]
            
            return
                    (lhs === List.cons(lhead, ltail)) &&
                    (rhs === List.cons(rhead, rtail)) &&
                    lessequalvalue(lhead, rhead) &&
                    (equal(ltail, rtail))
            
            
            
    }

}

func evalGreaterthan( _ lhs: Term, _ rhs: Term) -> Goal{
    return
        freshn{ a in
            let lhead = a["lhead"]
            let ltail = a["ltail"]
            let rhead = a["rhead"]
            let rtail = a["rtail"]
            
            return
                    (lhs === List.cons(lhead, ltail)) &&
                    (rhs === List.cons(rhead, rtail)) &&
                    greaterthanvalue(lhead, rhead) &&
                    (equal(ltail, rtail))
            
            
    }

}


func evalGreaterequal( _ lhs: Term, _ rhs: Term) -> Goal{
    return
        freshn{ a in
            let lhead = a["lhead"]
            let ltail = a["ltail"]
            let rhead = a["rhead"]
            let rtail = a["rtail"]
            
            return
                    (lhs === List.cons(lhead, ltail)) &&
                    (rhs === List.cons(rhead, rtail)) &&
                    greaterequalvalue(lhead, rhead) &&
                    (equal(ltail, rtail))
            
            
            
    }

}
 



func notequal( _ lhs: Term, _ rhs: Term) -> Goal{
    return
        freshn{ a in
            let lhead = a["lhead"]
            let ltail = a["ltail"]
            let rhead = a["rhead"]
            let rtail = a["rtail"]
            
            return
                    (lhs === List.cons(lhead, ltail)) &&
                    (rhs === List.cons(rhead, rtail)) &&
                    differentvalue(lhead, rhead) &&
                    (equal(ltail, rtail))

            
            
    }

}




func evalEqual( _ lhs: Term, _ rhs: Term) -> Goal{
    return
        freshn{ a in
            let lhead = a["lhead"]
            let ltail = a["ltail"]
            let rhead = a["rhead"]
            let rtail = a["rtail"]
            
            return
                (lhs === List.cons(lhead, ltail)) &&
                (rhs === List.cons(rhead, rtail)) &&
                samevalue(lhead, rhead) &&
                (equal(ltail, rtail))
            
            
            
    }

}

// fonction de Comparisons des nombres:

// prend deux chiffres en entrée et vérifie s'ils sont égaux ou non
func samevalue(_ lhs: Term, _ rhs: Term) -> Goal {
    var sol: Goal = (t === f)// tant que ce n'est pas vraie, c'est faux
    
    for i in 0...9{
        // on genère le code qui nous permet de vérifier si lhs est egal a rhs
        sol = sol || (lhs === Value(i) && rhs === Value(i))
    }
    return sol
    
}
// prend deux valeurs en paramètres et retourne le goal qui affirme que ces 2 nombres sont différents
func differentvalue(_ lhs: Term, _ rhs: Term) -> Goal {
    var sol: Goal = (t === f)// tant que ce n'est pas vraie, c'est faux
    
    for i in 0...9{
        for j in 0...9{
            if i != j{
                // on genère le code qui nous permet de vérifier si lhs est egal a rhs
                sol = sol || (lhs === Value(i) && rhs === Value(j))
            }}}
    return sol
    
}

func greaterthanvalue(_ lhs: Term, _ rhs: Term) -> Goal {
    var sol: Goal = (t === f)// tant que ce n'est pas vraie, c'est faux
    
    for i in 0...9{
        for j in 0...9{
            if i > j{
                // on genère le code qui nous permet de vérifier si lhs est egal a rhs
                sol = sol || (lhs === Value(i) && rhs === Value(j))
            }}}
    return sol
    
}
func greaterequalvalue(_ lhs: Term, _ rhs: Term) -> Goal {
    var sol: Goal = (t === f)// tant que ce n'est pas vraie, c'est faux
    
    for i in 0...9{
        for j in 0...9{
            if i >= j{
                // on genère le code qui nous permet de vérifier si lhs est egal a rhs
                sol = sol || (lhs === Value(i) && rhs === Value(j))
            }}}
    return sol
    
}

func lessequalvalue(_ lhs: Term, _ rhs: Term) -> Goal {
    var sol: Goal = (t === f)// tant que ce n'est pas vraie, c'est faux
    
    for i in 0...9{
        for j in 0...9{
            if i <= j{
                // on genère le code qui nous permet de vérifier si lhs est egal a rhs
                sol = sol || (lhs === Value(i) && rhs === Value(j))
            }}}
    return sol
    
}

func lessthanvalue(_ lhs: Term, _ rhs: Term) -> Goal {
    var sol: Goal = (t === f)// tant que ce n'est pas vraie, c'est faux
    
    for i in 0...9{
        for j in 0...9{
            if i < j{
                // on genère le code qui nous permet de vérifier si lhs est egal a rhs
                sol = sol || (lhs === Value(i) && rhs === Value(j))
            }}}
    return sol
    
}



// Evaluation:

func evalArithmetic (input: Term, output: Term) -> Goal {
    assert (false)
}

func evalBoolean (_ input: Term, _ output: Term) -> Goal {
    return
        delayed(
            // si l'entrée et la sortie sont True (ils ont été évalués), on renvoie true
            (input === t && output === t) ||
            // idem pour false
            (input === f && output === f) ||
                
            // Si c'est un not
                
                freshn{ v in
                    // On prend les deux elements
                    let what = v["what"]
                    // on les évalue
                    let what_v = v["what_v"]
                
                    // decomposition
                    return input === not(what) &&
                        // evaluation (ici si what est une autre expression, il sera bien traité)
                        evalBoolean(what, what_v) &&
                        // on donne le resultat
                        (   // false renvoie true
                            (what_v === f && output === t) ||
                            // true renvoie false
                            (what_v === t && output === f)
                            
                    )
            
                }   ||
                
                // Si c'est un and
                
                freshn{ v in
                    // On prend les deux elements
                    let lhs = v["lhs"]
                    let rhs = v["rhs"]
                    // on les évalue
                    let lhs_v = v["lhs_v"]
                    let rhs_v = v["rhs_v"]
                    // decomposition
                    return input === and(lhs, rhs) &&
                        // evaluation (ici si lhs est une autre expression, il sera bien traité, de même pour rhs et pour toutes les rappels de evalBoolean ci-dessous)
                        evalBoolean(lhs, lhs_v) &&
                        evalBoolean(rhs, rhs_v) &&
                        // on donne le resultat
                        (   // si l'un des deux est false, le resultat est false
                            (lhs_v === f && output === f) ||
                                (rhs_v === f && output === f) ||
                                // si les deux sont True, alors AND est True
                                (lhs === t && rhs === t && output === t)
                    )
                    
                } ||
                
                // Si c'est un "or"
                
                freshn{ v in
                    // On prend les deux elements
                    let lhs = v["lhs"]
                    let rhs = v["rhs"]
                    // on les évalue
                    let lhs_v = v["lhs_v"]
                    let rhs_v = v["rhs_v"]
                    // decomposition
                    return input === or(lhs, rhs) &&
                        // evaluation
                        evalBoolean(lhs, lhs_v) &&
                        evalBoolean(rhs, rhs_v) &&
                        // on donne le resultat
                        (   // si l'un des deux est false, le resultat est l'évaluation du second element
                            (lhs_v === f && output === rhs_v) ||
                                (rhs_v === f && output === lhs_v) ||
                                // si les deux sont True, alors "OR" est True
                                (lhs === t && rhs === t && output === t)
                    )
                    
                } ||
                
                // Si c'est un implies
                
                freshn{ v in
                    // On prend les deux elements
                    let lhs = v["lhs"]
                    let rhs = v["rhs"]
                    // on les évalue
                    let lhs_v = v["lhs_v"]
                    let rhs_v = v["rhs_v"]
                    // decomposition
                    return input === or(lhs, rhs) &&
                        // evaluation
                        evalBoolean(lhs, lhs_v) &&
                        evalBoolean(rhs, rhs_v) &&
                        // on donne le resultat
                        (       // True implique true : true
                            (lhs === t && rhs === t && output === t) ||
                                // false implique false: true
                                (lhs === f && rhs === f && output === t) ||
                                // false implique true: true
                                (lhs === f && rhs === t && output === t) ||
                                // true implique false: false
                                (lhs === t && rhs === f && output === f)
                    )
                    
            }
            
            
            

        )
}



func evalComparison (input: Term, output: Term) -> Goal {
    return
        delayed(
           (input === t && output === t) ||
            (input === f && output === f) ||
            
            // lessthan
            freshn{ v in
            let lhs = v["lhs"]
            let rhs = v["rhs"]

            // decomposition
            return
                // lessthan
                (input === lessthan(lhs, rhs)  && ((lessthanvalue(lhs, rhs) && output === t) || greaterequal(lhs, rhs) === f)) ||
                
                // lessequal
                (input === lessequal(lhs, rhs)  && ((lessequalvalue(lhs, rhs) && output === t) || greaterthan(lhs, rhs) === f)) ||
                
                // greaterthan
                (input === greaterthan(lhs, rhs)  && ((greaterthanvalue(lhs, rhs) && output === t) || lessequal(lhs, rhs) === f)) ||
                
                // greaterequal
                (input === greaterequal(lhs, rhs)  && ((greaterequalvalue(lhs, rhs) && output === t) || lessethanqual(lhs, rhs) === f))  ||
                
                
                // equal
                (input === equal(lhs, rhs)  && ((samevalue(lhs, rhs) && output === t) || differentvalue(lhs, rhs) === f)) ||
                
                // notequal
                (input === notequal(lhs, rhs)  && ((differentvalue(lhs, rhs) && output === t) || samevalue(lhs, rhs) === f))
                

            }

            
        )
}


// Main evaluation:

func eval (input: Term, output: Term) -> Goal {
    assert (false)
}

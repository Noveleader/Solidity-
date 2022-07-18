/*
var ourArray = [1,2,3,4,5,6,7,8,9,10];
console.log(ourArray.length);
console.log(ourArray[0]);
var myStr = "Hello World";
console.log(myStr.length);
myStr[0] = "J";
console.log(myStr);
myStr = "Jello World";

Strings are immutable therefore the above line will not work

console.log(myStr);

But arrays can be modified 

ourArray[0] = "J";
console.log(ourArray);

Pushing an element into the array this will append 11 at the end of our array

ourArray.push(11);
console.log(ourArray); // ['J',2,3,4,5,6,7,8,9,10,11]

Pop will remove the last element from the arrays

ourArray.pop();
console.log(ourArray); // ['J',2,3,4,5,6,7,8,9,10]

Shift will remove the first element from the array

ourArray.shift();
console.log(ourArray); // [2,3,4,5,6,7,8,9,10]

Unshift will add an element to the beginning of the arrays

ourArray.unshift(1);
console.log(ourArray); // [1,2,3,4,5,6,7,8,9,10]

var myList = [["cereal", 3], ["milk", 2], ["bananas", 3], ["juice", 2], ["eggs", 2]];
*/
//Making of function 
function ourReusableFunction(){
    console.log("Heyya!");
}
ourReusableFunction(); //Heyya!

function resusableFunction(){
    console.log("Hii, World");
}
resusableFunction(); //Hii, World

function ourFunctionwithArgs(a, b){
    console.log(a-b); //Directly printing in the terminal using console.log()
}
ourFunctionwithArgs(10,5); //This will output 5

function functionWithArgs(a, b){
    return a+b; //using a return statement
}
console.log(functionWithArgs(10,5)); //This will output 15

// Declaring a global variable which is any variable outside of the function and in the main code
var myGlobal = 10;

// Even the variable in a function can be global if it is declared as global or there's no var

function fun1(){
    oopsGlobal = 5; //This is a global variable as no var is declared
}

function fun2(){
    var output = "";
    if (typeof myGlobal != "undefined") {
        output += "myGlobal: " + myGlobal + "\n";
    }

    if (typeof oopsGlobal != "undefined") {
        output += "oopsGlobal: " + oopsGlobal;
    }

    console.log(output); // myGlobal: 10 oopsGlobal: 5
    
}
fun1(); // Need to call this function so the global variable oopsGlobal is defined
fun2();

//Variable declared in the function are accessed only in the function

var outerWear = "T-Shirt";
function myOutfit(){
    var outerWear = "sweater";
    return outerWear;
}
// same variables name of the function will be used and override the global variable
console.log(myOutfit()); //sweater

// OuterWear is still T-Shirt
console.log(outerWear); //T-Shirt

//using a return keyword 
function minusSeven(num){
    return num - 7;
}

console.log(minusSeven(10)); //3

function timesFive(num){
    return num * 5;
}

console.log(timesFive(5)); //25

//Function need not to return anything 

var sum = 0
function addThree(){
    sum += 3;
}

function addfive(){
    sum += 5;
}

console.log(addThree()); //undefined
console.log(addfive()); //undefined
console.log(sum); //8

//We can store the return value of a function in a different variable

// To convert an array to a readable string we use JSON.stringify() and hence we can concatenate it with a string 

function nextInLine(arr, item){
    arr.push(item);
    return arr.shift();
}
var testArr = [1,2,3,4,5];
console.log("Before : " + JSON.stringify(testArr)); // [1,2,3,4,5]
// console.log("Before : " + testArr); [1,2,3,4,5] This line works but we can't concatenate a string and array so we use JSON.stringify() instead
// console.log(testArr) [1,2,3,4,5]

console.log(nextInLine(testArr, 6)); // 1
console.log("After : " + JSON.stringify(testArr)); // [2,3,4,5,6]

// BOOLEAN VALUES
// Boolean values are true or false values

function welcomeToBooleans(){
    return true; //It could also be false 
}

//If statements
function ourTrueOrFalse(isItTrue){
    if(isItTrue){
        return "Yes, it's true";
    }
    return "No, it's false";
}

function trueOrFalse(wasThatTrue){
    if(wasThatTrue){
        return "Yes, that was true";
    }
    return "No, that was false";
}

console.log(trueOrFalse(true)); //Yes, that was true
console.log(trueOrFalse(false)); //No, that was false

// Comparision Operator 
// == is equal to

function testEqual(val){
    if(val == 12){
        return "Equal";
    }
    return "Not Equal";
}

console.log(testEqual(12)); //Equal
console.log(testEqual(11)); //Not Equal

//Strict Equality Operator
// === is strictly equal to

/*
3===3 //true
3==="3" //false
Simply it doesn't do the type conversion
*/

function testStrict(val){
    if(val === 7){
        return "Equal";
    }
    return "Not Equal";
}

console.log(testStrict(7)); //Equal
console.log(testStrict('7')); //Not Equal

//Inequality Operator
// != is not equal to

function testNotEqual(val){
    if(val != 100){
        return "Not Equal";
    }
    return "Equal";
}
console.log(testNotEqual(10)); //Not Equal

// Comparision with Strict Inequality Operator
// !== is not strictly equal to

function testStrictNotEqual(val){
    if(val !== 100){
        return "Not Equal";
    }
    return "Equal";
}

console.log(testStrictNotEqual('100')); //Not Equal

//Comparison with the logical operator 
// && is and
// || is or
// <, >, <=, >= are less than, greater than, less than or equal to, greater than or equal to

//Else statements

function testElse(val){
    var result = "";
    if(val > 10){
        result = "Bigger than 10";
    }
    else{
        result = "Smaller than 10";
    }

    return result;
}

console.log(testElse(7)); //Smaller than 10
console.log(testElse(11)); //Bigger than 10

//Else if statements

function testElseIf(val){
    if(val > 10){
        return "Greater than 10";
    }
    else if(val < 5){
        return "Smaller than 5";
    }
    else{
        return "Between 5 and 10";
    }
}

testElseIf(3); //Smaller than 5
testElseIf(11); //Greater than 10
testElseIf(7); //Between 5 and 10

/*
Write chained if/else if statements to fulfill the follwing conditions

num<5 - return "Tiny"
num<10 - return "Small"
num<15 - return "Medium"
num<20 - return "Large"
num>=20 - return "Huge"

*/

function testChained(val){
    if(val < 5){
        return "Tiny";
    }
    else if(val < 10){
        return "Small";
    }
    else if(val < 15){
        return "Medium";
    }
    else if(val < 20){
        return "Large";
    }
    else{
        return "Huge";
    }
}

console.log(testChained(3)); //Tiny
console.log(testChained(7)); //Small
console.log(testChained(11)); //Medium
console.log(testChained(16)); //Large
console.log(testChained(21)); //Huge

// GOLF CODE
/*
Strokes          Return
1                "Hole in one"
<=par-2           "Eagle"
par-1            "Birdie"
par              "Par"
par+1            "Bogey"
par+2            "Double Bogey"
>par+2           "Go Home!"
*/
var names = ["Hole-in-one!", "Eagle", "Birdie", "Par", "Bogey", "Double Bogey", "Go Home"];
function golfScore(par, strokes){
    if(strokes == 1){
        return names[0];
    }

    else if(strokes <= par - 2){
        return names[1];
    }

    else if(strokes == par - 1){
        return names[2];
    }

    else if(strokes == par){
        return names[3];
    }

    else if(strokes == par + 1){
        return names[4];
    }

    else if(strokes == par + 2){
        return names[5];
    }

    else{
        return names[6];
    }
}

// SWITCH STATEMENTS
// Switch statements are used to replace if/else if/else statements
// Switch statements are more efficient than if/else if/else statements
// Switch statements are more readable
// Switch statements are more versatile
// Switch statements can be used to replace multiple if/else if/else statements

function caseInSwitch(val){
    var answer = "";
    switch(val){
        case 1:
            answer = "alpha";
            break; //break is used to stop the execution of the code after the case is matched
        case 2:
            answer = "beta";
            break;
        case 3:
            answer = "gamma";
            break;
        case 4:
            answer = "delta";
            break;
    }
    return answer;
}

console.log(caseInSwitch(1)); //alpha
console.log(caseInSwitch(2)); //beta
console.log(caseInSwitch(3)); //gamma
console.log(caseInSwitch(4)); //delta

function switchOfStuff(val){
    var answer = "";
    switch(val){
        case "a":
            answer = "apple";
            break;
        case "b":
            answer = "bird";
            break;
        case "c":
            answer = "cat";
            break;
        default:
            answer = "stuff"; //default value returns when cases doesn't match
    }
    return answer;
}

console.log(switchOfStuff("a")); //apple
console.log(switchOfStuff("b")); //bird
console.log(switchOfStuff("c")); //cat
console.log(switchOfStuff("d")); //stuff


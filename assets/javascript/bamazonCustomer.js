var inquirer = require('inquirer');
var mysql = require("mysql");

var connection = mysql.createConnection({
    host:"localhost",

    port:3306,
    user:"root",
    password: "12345678"
});

function inputValid(value) {
    var integer = Number.isInteger(parseFloat(value));
    var sign = Math.sogn(value);

    if (integer && sign === 1 ) {
        return true;
    }
    else{
        return "Number needs to be a whole number"
    }
}

function userPrompt(){
    inquirer.prompt([
        {
            type: "input",
            name: "item_id",
            message: "Enter the ID of the item you would like to purchase.",
            validate: inputValid,
            filter: Number
        },
        {
            type: "input",
            name: "item_id",
            message: "How many of this item do you need?",
            validate: inputValid,
            filter: Number
        }

    ]).then(function(input) {
        var item = input.item_id;
        var quantity = input.quantity;

        var queryStr = "SELECT * FROM bam_products WHERE ?";

        connection.query(queryStr, {item_id: item}, function(err, data) {
            if(err) throw err;

            if (data.length === 0) {
                console.log("This ID is not located in our database");
                displayInventory();
            }
            else {
                var productData = data[0];

            if (quantity => productData.stock_quantity){
                    console.log("Item located")

                    var updateQueryStr = "UPDATE products SET stock_quantity =" + (productData.stock_quantity - quantity) + "WHERE item_id = " + item;

                    connection.query(updateQueryStr, function (err, data) {
                        if (err) throw err;
                        console.log("Order is succesfully placed, Thank you come again")

                        connection.end();

                    })
                    console.log("This item is unfortunately out of stock at the moment")

                    displayInventory();
                }
            }
        })
    })
}

function displayInventory() {
    queryStr = "SELECT * FROM products";

    connection.query(queryStr, function(err, data) {
        if(err) throw err;
        console.log("Current product inventory");

        var StrOutput = "";
        for (var i = 0; i < data.length; i++) {
            StrOutput = "";
            StrOutput += "Item ID: " + data[i].item_id + " // ";
            StrOutput += "Product: " + data[i].product_name + "  // ";
            StrOutput =+ "Department: " + data[i].department_name + "  // ";
            StrOutput += "Price: $" + data[i].price;

            console.log(StrOutput);
        }

        console.log("----------------------------");

        userPrompt();
    })
}

function runStore() {
    displayInventory();
}

runStore()
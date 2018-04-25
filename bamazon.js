var inquirer = require("inquirer");
var mysql = require("mysql");

var connection = mysql.createConnection({
	host: "localhost",
	port: 3306,

	// Your username
	user: 'guest',

	// Your password
	password: 'password',
	database: 'bamazon'
});

//initialize the mysql connection
connection.connect(function (error) {
	if (error) throw error;
	console.log("Connected as id " + connection.threadId);
	var questionStart = false;
	var query = connection.query("SELECT * FROM products", function(error, results) {
		for(i = 0; i < results.length; i++){
		console.log("\nProduct ID: " + results[i].item_id + "\nProduct: " + results[i].product_name + "\nPrice: " + results[i].price + "\n--------------------------");
		if(i === results.length - 1){questionStart = true};
		};
	});
	function userInput(){
		inquirer.prompt([
		{
			name: "productID",
			message: "What is the ID of the product you want?"
		}, {
			name: "amount",
			message: "How many would you like to purchase?"
		}]).then(function(answer){		
				if (error) throw error;

				var query = connection.query("SELECT * FROM products WHERE item_id=" + answer.productID, function(error, results) {
					//console.log(results);
					if(answer.amount > results[0].stock){
						console.log("insufficient stock, order is unfulfilled.");
					}else{
						var totalPrice = results[0].price * answer.amount;
						var amountRemaining = results[0].stock - answer.amount;
						console.log("The total price is: " + totalPrice);
						//update the SQL database with the new stock.
						connection.query("UPDATE products SET stock=" + amountRemaining + " WHERE item_id=" + answer.productID, function(){
							console.log("order fulfilled");
							connection.end();
						})
					}
				});
		});
	}
	userInput();
	
});
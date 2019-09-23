# Onlime Shop
This a simple project that represents online shop build with CodeIgniter for Back-End, AngularJS for Front-End and MySQL Database.
The database stores products and information about them (such as their name, price, description etc.).
The products are separated by categories (which are also stored in the database).

### Installation:
To run the application, you need to complete the following steps:
* **Insert the data into your database:** in the root of this repository is stored file named `export.sql`.
Go ahead and run it on your MySQL Server to insert the data.
* **Configure and run the Back-End server:** navigate and open `server/application/config/database.php`.
There are a few options you need to configure which are at the bottom of the file.
The most important of them are the `username` and the `password`. 
Go ahead and fill yours. 
After that you should be ready to fire the server.
There are a few ways to do that.
For example you can use the following command in the command prompt in the `server` directory:<br />
`server -S localhost:7878`<br />
Of course your hostname may be different. 
You can use any free port you like.
* **Configure and run the Front-End:** the only thing you need to configure here is to "tell" the Front-End what is the host and the port (if such) of the Back-End server.
You can do that by open `client/app/app.js`. 
Somewhere in the beginning of the file you should see a definition of constant called `CONFIG`.
It has one property: the host of the Back-End server.
After that you only need to navigate back to the `client` directory, open command prompt and run the following command:
`npm start`. The application will download its modules and if everything is fine it should run.

### Project description:
The application is really simple and contains several pages:
* Home page: contains list of every product in the database, its name, price and picture. 
On the left side the list of categories is displayed. 
Actually the categories are always displayed and will always stay.
There is also a Search bar on the top of the screen.
* Products for selected category: by clicking on a category on the left side, only the products in that category will be displayed on the right side of the screen.
There is the same Search bar on the top of the screen again.
* Product page: after selecting and clicking on a product, the 'Product page' appears.
It shows additional information about the product and also an opportunity for viewing the full size of the image and to add the item in the shopping cart.
* Shopping cart page: it shows the selected products and calculates the total price.
There is opportunity for removing a single item from the shopping cart or removing all items (empty shopping cart).
Or you can just continue to the next page
* Confirm order: this page reminds the user about the final price. 
Also he/she needs to provide some information, such as Name, Address, Phone Number and Email.
These fields are validated which means the name cannot contains nothing but letters and whitespaces, the phone number and the email should be valid etc.
If any of the fields is empty or invalid, the system won't let the user to press the 'Submit' button.

*Additional*: the Back-End server makes validation for every request.
For example: if the Client requests data for a product by giving its ID, the server check if a product with the given ID is registered in the database.
If not it responds to the Client telling him that the requested product was not found. The same thing is done with requesting products for a category with given category ID, removing product from the shopping cart with given product ID etc.




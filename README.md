**DoggieWalker** is a project to teach web development. This project includes a simple web app with an in-depth tutorial (this file) to walk you through it and learn web development. You can see the app here: http://doggie-walker.herokuapp.com/. 

![](http://i.imgur.com/rDNkszO.png)

Info about this project can be found at the end of this file.

If you want to learn programming the good way, let's get to it. 

##  Setup 

Before you begin, understand that installation and setup is often one of the hardest and most frustrating parts. This is true even for experienced developers. So don't despair - take it slowly and know that everyone is evetually successful. If you pass this part successfully, the rest will be smooth sailing. 

1. Learn to open your terminal. (spotlight->'terminal' on Mac, WinKey+R->'cmd' on Windows.)
2. Install Ruby and Sublime Text on your computer. You do this by googling "install Ruby" entering any of the links, and following the instructions. 
21. If you can, try to install Mongo on your computer. Mongo is a database which helps us save data. You can start doggieWalker without Mongo, but you'll need it later on. 
5. Download this project by downloading the zip file at https://github.com/SellaRafaeli/DoggieWalker/archive/master.zip, extracting the contents, and changing the folder name to `doggieWalker`.
(If you know git, you can simply `git clone git@github.com:SellaRafaeli/DoggieWalker.git`)
55. Install 'bundler' by typing `gem install bundler`.
6. Install Ruby software libraries we depend on by running `bundle install`. 
7. Run the server by running `ruby app.rb -p 9393`. 
9. In your browser, browse to http://localhost:9393/ and make sure you see the TODO list manager. 
10. Congratulations - we are up and running. 

## Running the app
As you just saw, you run the app by typing the following in your terminal. 

````$ ruby app.rb -p 9393````

You can 'kill' the server by typing 'Ctrl-C' in the terminal, and restart it by entering 'ruby app.rb -p 9393' again in the terminal. Try it. 

## Play around 

Play around with the app in your browser - there's not that much to do. Add a task with a name & description, remove the task, hey presto.

## View the source code

The app's code is in the doggieWalker directory (this project). It's just a few short text files. Go through each file and understand each file's role. We'll be changing these files and learning how they define our app. Make sure you can edit these files with some text editor, such as Notepad or Notepad++ or Sublime Text. You can download each of these from the web. 

DoggieWalker is the name of this project. Sinatra is the name of the *framework* we are using. 

## Edit the source code

We'll go through the files and make modifications to the files. After we change a file and save it, we'll go back to our web page (http://localhost:9393) in the browser and reload the page. We'll see how the changes we make to the text files affect the app. 

## Level 1 - Basic modifications to HTML and Ruby

We will start with the file 'view.erb' which contains the HTML, which is what is displayed in our browser. After each step, reload the page and make sure you understand the effect of the changes made. Make sure you read the directions before executing them.

1. Change the main title ("Welcome to Sinatra TODO List Manager") to include your name ("Welcome to Moshe's TODO Manager"). Refresh the page and see the text change.
11. 
4. Notice the title contains a link, as is defined between two `<a>` tags: `<a href="/">Sinatra TODO List Manager.</a>`. Change the link in the title so that the entire title will be part of the link. Anything between `<a>` and `</a>` is a link; The link is defined to point to whatever is defined by the `href` attribute - make the link point to `https://google.com`. 
5. On the `<body>` tag, note the text `class='body-style'`. This refers to the style defined in `style.css` by the same name (`body-style`), which defines the background-color and other attributes. Try changing the background-color defined in `body-style` to a different color (say, red). See it change. Now on the `body` tag, change the class name to something else, such as `class='body-style-2'`. Note that now the tag references a style definition that does not exist; Go into `styles.css` and  change 'body-styles' to 'body-styles-2' to see that when they match again, the styles will reapply. 
6. Check out the the form to submit new tasks. Within `view.erb`, this form is found within the `<form>` tags. Observe the "action" attribute of the form - this tells the form "where" (in the server) to send new tasks that are submitted. Change the action value from '/add' to '/add-a-task' and observe how the functionality of adding a new task is broken. Go to app.rb and update the 'post /add' to 'post /add-a-task' and note how functionality has been restored. Note the correlation between the form's "method=post action='/add'" and the handler in app.rb ("post /add"). 
7. Change the "placeholders" attributes' values in the 'input' and 'textarea' and see them change in the view after reloading.
8. Change the names of the parameters in the input and textarea. (From 'name=task_name' and 'name=task_description' to something else.) Note the functionality break; go to the handler on the server ('/post add' or 'post /add-a-task') and change the parameters there accordingly.
9. Remove the 'erb: tasks_list'. Notice how the the "tasks_list" is now missing. Return it.
901. Note the line `<link rel="stylesheet" type="text/css" href="style.css">`. This line tells the view to include a stylesheet (which is a file to definte the graphic design/styles of the page) called "style.css". Note we have that file; look at it. Now, within the tag, change the reference to the stylesheet in the HTML from 'style.css' to 'mystyle.css', ending up with the line: `<link rel="stylesheet" type="text/css" href="mystyle.css">`. Reload the page and see that now the style fails to load; notice the design breaks. Now change the name of the file `style.css` to `mystyle.css` so the reference is correct again. Reload the page and see that the design is re-applied. 
91. Within tasks_list.erb, change the title 'tasks' to 'my tasks'. Note how that part of the view changes. 
10. Change the 'erb: tasks_list' to reference a separate file (e.g. 'erb: my_tasks_list').  Note the app now crashes (missing reference to sub-view). Change the name of the file (tasks_list.erb) accordingly (e.g. to 'my_tasks_list.erb') and see the change reflect accordingly. 

## Level 2 - Basic ERB 

1. You've understood by now that the file 'view.erb' is the view that is displayed in the browser. What causes this? It is caused by the command `erb :view`. Test this by changing the rendered view to 'main_view' (i.e. change "erb :view" to "erb :main_view"). See that the site now breaks. Rename the file 'view.erb' to 'main_view.erb' to fix it.
2. Notice 'view_tasks' is called from each route handler (e.g. "get '/'") in order to return the view. Remember that in Ruby, the last expression in a function is implicitly the returned value, even if no 'return' is written. Thus within the 'view_tasks' function, the result of 'erb :views' (which is the rendered 'view.erb' HTML contents) is the value returned to the client (the browser).  
3. So, what is "erb", exactly? 
  * "erb" is a function that calls a '.erb' file, passes it some 'local' values, and results in a rendered HTML view. In our case we call ':view' (view.erb) and pass it some local values - in this case a hash with some tasks ($tasks.find.to_a). 
  * In Ruby, when we pass arguments to a function, the parentheses are optional. So 'print(123)' is the same as 'print 123'. 
  * So, in our "erb" call, we are effectively calling "erb :view, locals: {tasks: $tasks.find.to_a}". 
  ** The first argument is the symbol ':view' (If symbols are new to you, for now let's just say they're like strings but start with a ":".)
  ** The second argument is a hash. In Ruby, if the last argument of a function called is a hash, the hash brackets are optional. So 'print({a:1})' is the same as print(a:1). In our case, the last argument is hash containing a key called 'locals', whose value itself is a hash. To sum up: "erb :view, locals: {tasks: $tasks.find.to_a}" == "erb(:view, {locals: {tasks: $tasks.find.to_a}}". 
  ** Test this out by replacing the 'erb :view...' line with the equivalent expressed in the above line so you understand it. 
4. We are passing 'erb' local values to be rendered. In this case we are passing it all the tasks already entered, in the form of an array. (We'll see in a moment how we get these values). For now just note that we do this - we get the array of existing tasks ($tasks.find.to_a) and pass it into locals. Where are these tasks used in the view? We'll get back to that in a second.
5. The view we are *rendering* is 'view.erb'. ERB stands for 'embedded Ruby', which means HTML that contains content generated by dynamic Ruby code. Let's add some injected Ruby code - the best way to explain. Within the top welcome message, just before the word 'Welcome', add the following code: "<%= 5*6 %>". If all went well, when you refresh the page you should see '30' just before the word 'Welcome'. What just happened?
6. In short, the way 'erb' files work is that they 'run' the HTML. Whenever they encounter a block starting with "<%=" and ending with "%>", they run the block as Ruby code, and *inject* the end result of the block (in this case, 30) as a string into the HTML. This way we get an ability to inject dynamic content into the HTML. Let's see a more practical example. 
7. Just after the welcome message, add the following: `<h2><%= Time.now %></h2>`. Run the page, and see the subtitle now with the current time. This content will change evey time we run the page (try it!), allowing us to inject *dynamic* content into our HTML page. Pretty cool? Fa-shizzle.  
8. Using this dynamic erb ability, we can also use control-flows, such as deciding which content to display. For example, right below the 'welcome' message, add the following:
````
<% if 1 > 2 %>
"hello"
<% else %>
"hola"
<% end %>
````
Run the page and see that 'hola' is displayed, and not 'hello'. Do you understand why? Take your time to slowly run through this concept. Try replacing '1 > 2' with '2 > 1' to see the results. 

## Level 3 - Advanced ERB

1. Now we're moving into more advanced topics, and we'll learn about 'params' - the parameters whih the browser passes to the server when making a request. Instead of the above code with 'hola' and 'hello', add the following code right below the welcome message. 
 ````
<% if params[:num].to_i > 10 %>
"You entered a number greater than 10"
<% else %>
"Less than 10"
<% end %>
````
Run the page, and you should see "Less than 10". What just happened here? Well, first of all let's learn by example. Rerun the page, but this time append "?num=20" to the URL, for a final URL of something like "localhost:9393?num=20". You should see the 'greater than' message, this time. Why? 

Well, whenever the browser makes a request to the server, it passes 'parameters' into a variable called 'params'. When making a request from the URL (this is called a GET request), the parameters are the keys and values specified after the "?" in the URL. For example calling the URL "http://google.com?name=joe&age=30" passes the parameters 'name' with a value of 'joe' and 'age' with a value of 30. (This is true in any website, anywhere.) So when we pass the parameter 'num' with a value of 10, the erb knows which code to execute. (When we pass nothing, the value of params[:num] is 'nil', which is turned into 0 by 'to_i'.)

Let's inspect the params by modifying the above code into the following:
````
<%= params %> 
````
We will now see the params outputted into our view. Try it by passing any arbitrary params, e.g. see what happens when you hit the URL 'localhost:9393?weapon=nunchuks' - you see the *parameters hash* outputted into the view. (Remember that Ruby hashes have various syntaxes, including {"key" => "value"}.)

This has been a massive step, including various steps. Make sure you understand the following topics:
* Params hash
* ERB injecting dynamic content into HTML ("<%= Time.now %>")
* ERB control flows ("<% if 1 >2 ... %>")

2. Let's go back to our `views.erb` file. Right at the end, before the closing `</body>` tag, we notice we call yet another `erb` function, to display `tasks_list`. This mechanism is often referred to as using `partials`, in the sense that we separate our view into separate pieces. It mostly makes for better code management. In this case, we dynamically inject the `erb` call, as we have just seen. We also pass on our tasks variable, so we can use it in the `tasks_list` partial. Let us explore that partial - observe `tasks_list.erb`.

3. Within `tasks_list.erb` we see several advanced erb control flows:
* A condition on whether or not to display the whole thing (`if tasks.any?`). This determines whether the bottom block is displayed -- if there are no tasks, it isn't (try it yourself).
* An *iteration* through the tasks (`<% tasks.to_a.each do |task| %>`... `<% end %>`), which outputs for each task dynamic content, including injecting the `<%= task['name'] %>`. 
* Give special attention to how the task name is injected twice - once for display, and once for the link for deletion. Let's dig deeper into this one. 

4. Create a task called 'buy_milk'. Observe how, as expected, a task with that name was created and displayed. (Go through the erb file of task_list and make sure you understand how each HTML element was created). Hover over the 'delete' link of that task to see the link it points to: '/delete?name=buy_milk'. Let's examine this link. What will happen if we press it?

5. Entering a URL - such as '/delete?name=buy_milk' - triggers a GET request to the server for that URL ('/delete') with the params hash ({name: buy_milk}). In Sinatra this is handled by the appropriate route handler -- in this case get '/delete'. In `app.rb` we observe we have exactly this route. What will happen if we call this route? We can see the order of events within '/delete' - we will call "$tasks.remove", instructing the DB to delete the task with the 'name' whose value is in params[:name]. In other words, if we call '/delete?name=buy_milk', we will call 'remove' on the task with the 'name' of 'buy_milk'. Thus, the dynamic link created by `tasks_list.erb` matches the route that deletes the appropriate link when invoked. 

## Level 4 - tux console

We will now learn how to use Ruby's interactive shell. 

1. In your terminal, enter 'irb'. This should display something like `2.2.0 :001 >` - a Ruby prompt. This program is an interactive Ruby ("irb") shell (also referred to sometimes as a *console*). You can run Ruby commands here in order to practice Ruby syntax and semantics. Try your favorite Ruby tutorial online to practice Ruby with this shell. When you're done, leave irb by typing 'exit'. 

2. After mastering 'irb', wouldn't it be cool if we cool run the console within the context of our app? Well, we can, using Sinatra's *tux* ability. Run the following code in your console: `tux -c app.rb'. This should open a familiar '>>' prompt. We are within the context of our server and can run various commands. We'll come back to this later, but for now let's try a few basic ones:
* `$tasks.count`. This command returns the number of tasks saved to the system. Try adding and removing tasks and running this line, and see how it updates accordingly. 
* `$tasks.find.to_a`. This command returns all the tasks in the system as an array of hashes, each hash representing one task. There might be some stuff here you are unfamiliar with - don't worry about it yet. 
* A command to *delete* all the existing tasks: `$tasks.remove`. You might notice this command is similar to the command we have under the "get '/delete'" route handler in app.rb. Indeed, the only difference is that in "get '/delete'" we pass $tasks.remove parameters - we pass it the hash {name: params[:name]}. (Remember, the brackets are implied because it's the last argument.)

We'll come back to tux later. 

## Level 5 - The HTTP request/response cycle 

1. Let's review once again the "request-response" cycle. The way the web works is that a *client* (in our case a web browser, but it could also be a mobile app) sends a *request* to a *server*. The 'server' is just some computer program running on some computer, somewhere. While we develop the server is a program on our own computer, but the servers serving up your favorite websites are just the same - except on someone else's computer. These requests are generally *HTTP* requests (yep, that's the same HTTP you may know from URLs). 

2. In the most common case, responses are HTML pages. However, this does not have to be the case. What else can we return if not HTML pages? Well, we can also just return a string. Like "hello". Let's do that, by creating our own first route. In 'app.rb', add a new route handler by adding the following code just below the "get '/delete'" handler: 
````

get '/hello' do
  "hello"
end

````

What does this code do? Well, it adds a handler for the '/hello' route and returns the string 'hello' when invoked. Let's invoke it by calling localhost:9393/hello with our browser. We should see the response in our browser - the simple string 'hello'. This route did not return an HTML page, it just returned a string. 

## Level 6 - our own functions 

1. Let's add our custom function. Just below the 'view_tasks' function, let's add our custom function - plus2. 

````

def plus2(x)
  x+2
end

````

This is a simple function that returns its input, plus 2. (Remember, the 'return' is implied). Now let's add a route that uses it, at the end of app.rb. 

````

get '/plus2' do
  num = params[:num].to_i
  plus2(num).to_s
end

````

Do you understand what this function does? It receives a parameter called 'x' from the params hash, turns it "to and integer" using .to_i, assigns that value ot the variable 'num', calls 'plus2' on that num, turns the result back into a string by calling '.to_s' on it, and returns the value to whoever made the request (the browser). Test it out by calling localhost:9393/plus2?num=10 and verifying the result is indeed 12. Cool - we just declared our first function and used our own route to call it. 

## Level 7 - debugging with breakpoints 

Sometimes things break. Suppose we made a mistake when defining the functino 'plus2' and instead of 12 got back the value of 11. How shall we debug it? What we can do is enter a *breakpoint* to stop the execution at any point and inspect what's going on. For this example we'll be using a gem called *pry*. 

1. Within the handler for the route '/plus2' which we just defined, on the first line (above 'num = ...'), add the line `binding.pry`, so that the full route handler now looks like this: 

get '/plus2' do
  binding.pry
  num = params[:num].to_i
  plus2(num).to_s
end

"Binding.pry" tells the server to stop on that line, if it reaches it. 

Now once again from the browser call localhost:9393/plus2?num=10. You'll notice the request *hangs*, as in it's stuck. If we flip back to the terminal, we should see the server has 'stopped' on the line where we wrote 'binding.pry'. 

![](http://i.imgur.com/q8f018N.png)

We also see the lines around us and a familiar prompt -- this is again an interactive Ruby prompt, except we are both in the context of the app, and in the context of the request itself. We can now inspect what's happening. For example, we can enter and see the 'params' object (by typing 'params' in the prompt and pressing 'enter') - {"num"=>"10"}. We can also inspect the 'request' object to understand it better. We can move forward one step at a time, or execute arbitrary code. For example, we can run:
* `num = params[:num].to_i` (and see the result)
* `plus2(num).to_s` (and see the result)

This is a powerful mechanism for inspecting the request as it happens. 

## Intermission

If you've reached this point, you've passed the basics of (web) development. From now on, we're going to go gradually into deeper stuff. It's important to have a good grasp of the basics, so we recommend you re-do all of the above steps once more - repetition is a greaet way of internalizing concepts, and make sure you do indeed internalize each step you perform and understand it. 

Also, give yourself a pat on the back; you've earned it. 

## Level 8 Mongo (and Databases)

A "Database" is a program that helps us save information to the computer's disk. This information persists even if the program running it (like our app) is turned off, or if the computer itself is turned off. In our case, the database helps us manage our tasks. The database we use is called 'Mongo' (or 'MongoDB'), and it's on of the leading databases in the world. 

Mongo is a 'NoSQL' database - it saves 'documents'. So for example, in our database (in Mongo) we might have 3 'documents', each representing a task. Each 'document' has fields and each field has a value. In this example, the first document might have the field 'name' with the value of 'Buy milk' and a description of 'Go the store and buy a jug of milk.' 

We might represent this document as follows:

````
{
  name: 'Buy milk',
  description: 'Go the store and buy a jug of milk.' 
}
````

In addition, each object will have a unique 'id' field. So a full document in MongoDB might look something like: 

````

{
  _id: '9038409138',
  name: 'Buy milk',
  description: 'Go the store and buy a jug of milk.' 
}

````

Awesomeness. 

* The database (or simply 'Mongo') is divided into 'collections' of documents. For example one collection might be a collection of 'tasks'. We can see this in the `setup.rb` file, in the line `$tasks = $mongo.collection('tasks')`. 
* Mongo allows us to interact with the data in various ways. One common **use-case** might be to ask for a specific task from the DB, so we can view its details. We might ask for that task by its id, or by its name. Other use cases might be to ask the DB 'how many tasks do we have?', or to ask to it remove a specific task. 

## Level 9 Interacting with the DB (Mongo) via Tux

Using tux, we can interact with the DB and learn a great lot about its working. Let's open up tux again (tux -c app.rb). We saw our `collection` of tasks is defined by `$tasks`. Thus we can run `$tasks.count` and see the number of tasks in the DB. Try adding and removing tasks via the web interface, and see how this number changes. Experiment with the following commands:
* `$tasks.remove` - remove all the tasks from the DB
* `$tasks.remove({name: 'hello'})` - remove the task with the attribute 'name' with the value 'hello'. 
* `$tasks.find.to_a` - this finds all the tasks, and lists them as an array of documents. 
* `$tasks.insert({name: 'buy milk', description: 'buy 3 bottles of milk'})` 
* `$tasks.find_one({name: 'buy milk'})`

Since the app and the console reflect the same DB, any changes you make in one will be reflected in the other. 

## Level 10 - the Gemfile

The Gemfile - which is a file called `Gemfile` - is a file that contains a list of external Ruby projects (referred to as `gems`.) that we use. In our case we have `gems` for Sinatra, Mongo, Tux, and more. Most Ruby projects have a gemfile - this is part of the beauty of open source; other people (often private individuals) create `gems` and publish them to the world for free. In turn, we can then install these gems and use their functionality in our project for free. Gems are installed using the command `bundle install` (which in turn invokes a gem called `Bundler`, which we previously installed). Running `bundle install` creates a file called `Gemfile.lock`. The Gemfile.lock represents a resolved lists of the dependency tree of the gems - for now, you should not worry about understanding this too deeply. 

Let's try adding another gem. We'll be adding the 'colorize' gem, which helps us print colored output in the Ruby shell (or in tux). First, let's observe our situation before installing the gem. 

Open `irb` (by typing that command in the terminal). As you remember, `irb` (short for Interactive Ruby) is a Ruby shell - it allows us to execute Ruby commands (unrelated to our web app). In `irb`, try running `"foo".red`. This is invoking the 'red' method on the string "foo", which will probably result in an error. You can also repeat this process in 'tux'. 

Now, add the `colorize` gem by adding the line `gem 'colorize'` to the Gemfile and running `bundle install` in the terminal. Ensure the output of the `bundle install` instruction includes an indication that 'colorize' has been installed. If this has worked, retrying the command `"foo".red` will result in a nice print-out of 'foo' - in red color. Hooray, we've installed and used our first gem. 

## Level 11 'Requiring' files in Ruby

Ruby codes generally flows one-line-after-the-other. In order to organize Ruby code into files, the command 'require' calls other files. We can see this for example in the file `app.rb` when we call `require './setup'` - this "calls" the file `setup.rb` and executes all the lines in `setup.rb` before resuming execution within `app.rb`. 

## Level 12 - Client-Server 

Now that we've gotten some "practical experience", let's discuss some theory and terminology, the core concepts of Web Development. Make sure you understand each of the following points. Like many complex topics, this is best understood holistically, so you might need to understand all the points in order to understand any of the points. 

* A *server* is a computer program that answers requests. In our case, our Ruby app answers requests from the browser, and it's our server.
* A *client* is a computer program that asks for things (makes requests from) a server. In our case, the browser makes requests to the Ruby app, and it's our client. 

So, our app is divided into two parts. One part is a client (written in HTML and CSS, and later JavaScript) which is run by the browser, and makes requests to the server, which is written in Ruby. The client is often referred to as Front-End, while the server is often referred to as Back-end. Clients and Servers on the web generally communicate via HTTP requests and responses, which are long text messages they send each other. 

This is a huge topic in of itself, but as an example, when you enter "www.google.com/maps" into your web browser, that executes an HTTP request for the resource "/maps" to the server at "www.google.com". The server (which might be written in Java, Ruby, C, Python, or another language) interprets the request and returns some result to the FE (Front-End), which is run by the browser. As we can see, the browser both knows how to execute HTTP requests as well as display and run the contents returned by the Back-End. 

* The web generally follows a *client-server* model. A server is a process (which is basically a "computer program") which sits and waits for *requests*

For further reading on this subject, study up on HTTP messages. 

## Level 13 - JavaScript 

As we've learned, Ruby code runs in a *process* in the back-end, creating a server that can respond to web requests and interact with the DB. In the Front-End, we can display HTML and CSS content. We will now touch upon the third major realm in the front-end: JavaScript.

JavaScript is a programming language which can be executed in the browser. Whereas HTML defines the content and CSS defines the graphic design, JavaScript can be added to a web page to add front-end *behaviour*. We will learn by example. 

### Dev Tools and Console 

Using Chrome, open your browser's dev tools by right-clicking anywhere on the page and choosing 'Inspect Element'. This exposes the browser's dev tools, an extremely powerful tool for debugging the client. Choose the 'console' tab. This exposes a JavaScript console, similar to Ruby's `irb`. Try a few practice JavaScript commands:

* `x = 10`
* `y = 20`
* `x+y`

You get the idea. 

Now, notably, JavaScript can interact with the elements in the page (in the HTML document). For example, we can execute the following command: 

* `elem = document.getElementById("welcomeMsg")`. The result is the HTML element itself. We can now inspect it by calling, for example, `elem.textContent`. Even more excitingly, we can modify the contents, by calling, say, `elem.textContent = 'My New Title'`. Exciting! 

Let's make that something useful by running the following lines:

````

elem = document.getElementById("welcomeMsg");
name = prompt("What is your name?");
msg  = "Hi, "+name+"!";
elem.textContent = msg;

````

Cool. Now's wrap all of this stuff up in a function (still in the console):

````

function changeTitle() {
  elem = document.getElementById("welcomeMsg");
  name = prompt("What is your name?");
  msg  = "Hi, "+name+"!";
  elem.textContent = msg;  
}

````

This declares a function, which we can now run and again, by calling `changeTitle()`.

Great. We've seen how we can use the dev tools to play around with JavaScript. Now let's put some minimal JS (JavaScript) in the web page itself. 

### JS in the webpage

In the file view.erb, add the following snippet just before the closing `</head>` tag: 

````

<script>
  function changeTitle() {
    elem = document.getElementById("welcomeMsg");
    name = prompt("What is your name?");
    msg  = "Hi, "+name+"!";
    elem.textContent = msg;  
  }  
</script>

````

This defines a JavaScript function that is available in the HTML page. Now let's add a button to enable invoking it. 

After the `<h1>`, within the first `<section>`, add the following: `<button onclick='changeTitle()'>Change Title</button>`. Now try running the page and changing the title a few times. Go over the code we entered and make sure you understand exactly what it does. To test yourself, remove the button and the function and add them again manually (without copying them).

Awesome, you have just had your first brief introduction to JavaScript. JavaScript is one of the world's leading programming language, and is effectively the only language in all browsers. Hence, in many ways it is "the language of the Internet", or at least the FE. There is MUCH to learn about JS (some people have an entire career in it), and this has been a taste to start. 

## Addendums 

#### Verifying Installations of Ruby and Mongo

* Ruby is a programming language. Verify Ruby is installed by running `irb` in your terminal. You should see a `ruby prompt` that looks something like `2.2.1 :001 >`. We'll learn more about this later. Type 'exit' in the prompt to close it. 
* Mongo is a database. Verify Mongo is installed by running `mongo` in your terminal. You should see a `mongo prompt` that looks something like `>`. We'll learn more about this later. Type 'exit' in the prompt to close it.`

## About DoggieWalker

The concept behind DoggieWalker is to give an aspiring web developer a complete web-app which is minimal enough that s/he can walk through and understand (with the help of this tutorial) every single line in the app, as well as the underlying technical principles of modern web development. 

Guided by a working app and the tutorial, the novice developer can tweak each and every part of the application and gradually modify it, thereby learning the ins and out of dynamic web development quickly while getting both immediate feedback and gratification. 

Comments, suggestions, help or requests for hands-on lessons may be addressed to sella.rafaeli@gmail.com.
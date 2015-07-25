A tiny web app for a TODO list meant for learning purposes, to demonstrate the basics of web development. Releaseed under a general BSD license.

![](http://wecanbeaoriginal.com/blog/wp-content/uploads/2010/11/Terrier.jpg)

# Prerequisites 

You should have preliminary understanding of web development ("what is HTML", "what is a variable"). You should have Ruby and Mongo and bundler installed. If you know basic, basic Ruby - that would help. This is best administered with the help of a knowledgable coach / mentor, but can be learned alone too, 

# Run the app
You run the app via 

````$ shotgun app.rb````

Play around with it - there's not much to do. Add a task with a name & description, remove the task, hey presto. Go through each file (there are 4 code files, 1 list of packages, and this file) and understand each file's role. We'll be changing these files. 


# Learn by doing stuff and reading 

## Level 1 - Basic modifications to HTML and Ruby

1. Change the app header to include your name ("Welcome to Joe's TODO Manager").
2. Change the reference to the stylesheet in the HTML from 'style.css' to 'mystyle.css'. See the style fail to load and notice the design break; now change the file's name accordingly to 'mystyle.css' and the design re-applied. 
3. Change the title to include your name.
4. Change the title link such that the entire title will be part of the link.
5. Change the reference to class='rounded-corners' to 'soft-corners'. Note the loss of rounded corners on that section. Change the class name in the style.css and note the return of the round corners. Search the entire project to see if anywhere else has been affected by the change. 
6. Observe the form to submit new tasks. Observe the action of the form. Change the action from '/add' to '/add-a-task' and observe how the functionality of adding a new task is broken. Go to app.rb and update the 'post /add' to 'post /add-a-task' and note how functionality has been restored. Note the correlation between the form's "method=post action='/add'" and the handler in app.rb ("post /add"). 
7. Change the placeholders in the 'input' and 'textarea'. 
8. Change the names of the parameters in the input and textarea. (From 'name=name' and 'name=description' to someting else.) Note the functionality break; go to the handler on the server ('/post add' or 'post /add-a-task') and change the parameters there accordingly.
9. Remove the 'erb: tasks_list'. Notice how the the "tasks_list" is now missing. Return it.
91. Within tasks_list.erb, change the title 'tasks' to 'my tasks'. Note how that part of the view changes. 
10. Change the 'erb: tasks_list' to reference a separate file (e.g. 'erb: my_tasks_list').  Note the app now crashes (missing reference to sub-view). Change the name of the file (tasks_list.erb) accordingly (e.g. to 'my_tasks_list.erb') and see the change reflect accordingly. 

## Level 2 - Basic ERB 

1. You've understood by now that the file 'view.erb' is the view that is displayed in the browser. What causes this? It is caused by the command `erb :view`. Test this by changing the rendered view to 'main_view' (i.e. change "erb :view" to "erb :main_view"). See that the site now breaks. Rename the file 'view.erb' to 'main_view.erb' to fix it.
2. Notice 'view_tasks' is called from each route handler (e.g. "get '/'") in order to return the view. Remember that in Ruby, the last expression in a function is implicitly the returned value, even if no 'return' is written. Thus within the 'view_tasks' function, the result of 'erb :views' (which is the rendered 'view.erb' HTML contents) is the value returned to the client (the browser).  
3. 
  * "erb" is a function that calls a '.erb' file, passes it some 'local' values, and results in a rendered HTML view. In our case we call ':view' (view.erb) and pass it some local values - in this case a hash with some tasks ($tasks.find.to_a). 
  * You'll notice that in Ruby, when we pass arguments to a function, the parentheses are optional. So 'print(123)' is the same as 'print 123'. 
  * So, in our "erb" call, we are effectively calling "erb(:view, locals: {tasks: $tasks.find.to_a})". 
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

2. So, back to our `views.erb` file. Right at the end, before the closing `</body>` tag, we notice we call yet another `erb` function, to display `tasks_list`. This mechanism is often referred to as using `partials`, in the sense that we separate our view into separate pieces. It mostly makes for better code management. In this case, we dynamically inject the `erb` call, as we have just seen. We also pass on our tasks variable, so we can use it in the `tasks_list` partial. Let us explore that partial - observe `tasks_list.erb`.

3. Within `tasks_list.erb` we see several advanced erb control flows:
* A condition on whether or not to display the whole thing (`if tasks.any?`). This determines whether the bottom block is displayed -- if there are no tasks, it isn't (try it yourself).
* An *iteration* through the tasks (`<% tasks.to_a.each do |task| %>`... `<% end %>`), which outputs for each task dynamic content, including injecting the `<%= task['name'] %>`. 
* Give special attention to how the task name is injected twice - once for display, and once for the link for deletion. Let's dig deeper into this one. 

4. Create a task called 'buy_milk'. Observe how, as expected, a task with that name was created and displayed. (Go through the erb file of task_list and make sure you understand how each HTML element was created). Hover over the 'delete' link of that task to see the link it points to: '/delete?name=buy_milk'. Let's examine this link. What will happen if we press it?

5. Entering a URL - such as '/delete?name=buy_milk' - trigger a GET request to the server for that URL ('/delete') with the params hash ({name: buy_milk}). In Sinatra this is handled by the appropriate route handler -- in this case get '/delete'. In `app.rb` we observe we have exactly this route. What will happen if we call this route? We can see the order of events within '/delete' - we will call "$tasks.remove", instructing the DB to delete the task with the 'name' whose value is in params[:name]. In other words, if we call '/delete?name=buy_milk', we will call 'remove' on the task with the 'name' of 'buy_milk'. Thus, the dynamic link created by `tasks_list.erb` matches the route that deletes the appropriate link when invoked. 

## Future lessons (stuff you should know but we haven't covered)
* Using a breakpoint by entering "binding.pry" anywhere in the application.
* Understanding Mongo 
* 'requiring' files 
* running 'tux' (tux -c app.rb)
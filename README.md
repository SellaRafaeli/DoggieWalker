This is a minimalistic yet complete web-app for a TODO list meant for learning purposes, to demonstrate the basics of web development. 

# Prerequisites 

You should have preliminary understanding of web development ("what is HTML", "what is a variable"). You should have Ruby and Mongo installed. 

# Run the app
You run the app via 

````$ shotgun app.rb````

Play around with it - there's not much to do. Add a task with a name & description, remove the task, hey presto. Go through each file (there are 4 code files, 1 list of packages, and this file) and understand each file's role. We'll be changing these files. 


# Learn by changing 

## Level 1

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

## Level 2 
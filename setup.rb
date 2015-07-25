set :views, Proc.new { File.join(root, "/") }
set :public_folder, '/'

#db
$mongo = Mongo::MongoClient.from_uri('mongodb://localhost:27017').db('rails_girls')
$tasks = $mongo.collection('tasks')

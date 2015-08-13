set :views, Proc.new { File.join(root, "/") }
set :public_folder, Proc.new { File.join(root, "/") }

#db
DB_NAME= ENV["MONGOLAB_DBNAME"] || ('doggie-walker')
DB_URI = ENV["MONGOLAB_URI"] || 'mongodb://localhost:27017'

$mongo = Mongo::MongoClient.from_uri(DB_URI).db(DB_NAME)
$tasks = $mongo.collection('tasks')
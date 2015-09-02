set :views, Proc.new { File.join(root, "/") }
set :public_folder, Proc.new { File.join(root, "/") }

#db
DB_NAME= ENV["MONGOLAB_DBNAME"] || ('doggie-walker')
DB_URI = ENV["MONGOLAB_URI"] || 'mongodb://localhost:27017'

begin #mongo mock
  $tasks = Mongo::MongoClient.from_uri(DB_URI+"z").db(DB_NAME).collection('tasks')
rescue => e
  puts "Using a mock for Mongo."  
  $docs = {}; $tasks = Object.new

  def $tasks.find
    $docs.values.compact
  end

  def $tasks.insert(doc) 
    $docs[doc[:name]] = doc; 
  end

  def $tasks.remove(doc)
    doc ? $docs[doc[:name]] = nil : $docs = {} #remove all       
  end
end 




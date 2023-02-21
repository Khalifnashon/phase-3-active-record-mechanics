# o code along with these examples, first, run bundle install to set up the necessary gems. Then, run:

#  ruby active_record.rb
# This will enter you into a Pry session where you can try out the methods listed below.

# Note: If you run into an error with the sqlite3 gem, try using gem pristine sqlite3 to restore the gem.

# The Student class is inheriting a whole bunch of new methodsLinks to an external site. from the ActiveRecord::Base class. Let's look at a few of them and try them out!

# .column_names
# Retrieve a list of all the columns in the table:

# Student.column_names
# #=> [:id, :name]
# .create
# Create a new Student entry in the database:

# Student.create(name: 'Jon')
# # INSERT INTO students (name) VALUES ('Jon')
# # => #<Student:0x00007f985d0638b0 id: 1, name: "Jon">
# You'll also see a log of the SQL that Active Record is writing for us, just like we did in our own ORMs!

# .all
# Return all the records from the students table as instances of the Student class:

# Student.all
# # SELECT "students".* FROM "students"
# # => [#<Student:0x00007f985d0638b0 id: 1, name: "Jon">]
# .find
# Retrieve a Student from the database by id:

# Student.find(1)
# # SELECT "students".* FROM "students" WHERE "students"."id" = 1 LIMIT 1
# # => #<Student:0x00007f985d0638b0 id: 1, name: "Jon">
# .find_by
# Find by any attribute, such as name:

# Student.find_by(name: 'Jon')
# # SELECT "students".* FROM "students" WHERE "students"."name" = 'Jon' LIMIT 1
# # => #<Student:0x00007f985d0638b0 id: 1, name: "Jon">
# attr_accessors
# You can get or set attributes of an instance of Student once you've retrieved it:

# student = Student.find_by(name: 'Jon')
# student.name
# #=> 'Jon'

# student.name = 'Steve'

# student.name
# #=> 'Steve'
# #save
# And then save those changes to the database:

# student = Student.find_by(name: 'Jon')
# student.name = 'Steve'
# student.save
# # UPDATE "students" SET "name" = "Steve" WHERE "students"."id" = 1
# Note that our Student class doesn't have any methods defined for #name either. Nor does it make use of Ruby's built-in attr_accessor method:

# class Student < ActiveRecord::Base
# end
# All of the methods we've seen are coming from ActiveRecord::Base; we have access to them because we're following the convention of singular class names and plural table names.
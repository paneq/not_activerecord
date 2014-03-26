# NotActiveRecord

Clearly express the boundaries of your AR objects for other programmers.

Just because your object has `user_id` does not mean it needs to
know anything about `user` at all.

## Installation

Add this line to your application's `Gemfile`:

    gem 'not_activerecord'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install not_activerecord

## Usage

```ruby
class LessonProgressLevel < ActiveRecord::Base
  extend NotActiveRecord

  does_not_belong_to :student
  does_not_belong_to :lesson
  does_not_belong_to :training
end


class MyClass < ActiveRecord::Base
  extend NotActiveRecord

  does_not_belong_to :user
  does_not_have_many :users
  does_not_have_one  :user
  does_not_have_and_belong_to_many :users
end

MyClass.new.user # gives you nice and warming exception :)
```

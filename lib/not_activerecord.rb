require "not_activerecord/version"

module NotActiveRecord
  Error = Class.new(StandardError)

  %w(
    does_not_belong_to
    does_not_have_many
    does_not_have_one
    does_not_have_and_belong_to_many

    does_not_have_or_belong_to_many

    does_not_has_many
    does_not_has_one
    does_not_has_and_belongs_to_many
  ).each do |does_not|
    define_method(does_not) do |*args|
      args.each do |method_name|
        define_method(method_name) do
          raise Error.new("You tried to called method ##{method_name} but one of
the developers decided that you should not cross this boundary of your
application/database. This object behavior is supposed to work without calling
requested associated object. You should also be able to instantiate and test it
properly without calling ##{method_name}. If you don't agree, go ahead and discuss
this issue with your coworker. Maybe you are trying to implement something that is
a responsibility of higher level layer that has access to :#{method_name} and this
(#{inspect}) object at the same time.

TLDR: Someone went through a lot to tell you that your probably should not be doing
      what you are doing. Respect it :)

Example:

class Order < ActiveRecord::Base
  has_many :order_lines
end

class OrderLine < ActiveRecord::Base
  does_not_belong_to :order
end

Order is an Aggregate (http://martinfowler.com/bliki/DDD_Aggregate.html)
and OrderLine should never call #order or know which order it belongs to
(even though it has order_id for database reasons). If your usecase
requires the knowledge of :order_line and :order at the same time, write a
method for it in Order class instead of writing it in OrderLine.")
        end
      end
    end
  end
end

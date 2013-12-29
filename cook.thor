class Cook < Thor
  include Thor::Actions

  def self.source_root
    'templates'
  end

  desc "fry FOOD", "sear something in a pan"
  method_option :greasy,
    :type => :boolean,
    :desc => 'call your cardiologist',
    :default => true
  def fry(food)
    description = options[:greasy] ? 'greasy' : 'lean'
    puts "Frying up some #{description} #{food} for you!"
  end

  desc "menu", "write up a menu"
  method_option :meal, :type => :string
  method_option :dishes, :type => :array
  def menu
    template(
      "menu.txt.tt",
      "target/#{options[:meal]}_menu.txt"
    )
  end
end

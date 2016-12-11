require 'test_helper'

class ListTest < ActiveSupport::TestCase
	
  # test "the truth" do
  #   assert true
  # end

  test "sin nombre" do
	  list = List.new()
	  assert_not list.save, "se guardo, error"
  end
  test "con nombre" do
	  list = List.new(name: "hola mundo")
	  assert list.save, "no se guardo"
  end
  test "Con nombre que cause un conflicto de unicidad de los slugs." do
    list = List.new(name: "hola    / uno /     rails")
    assert list.save, "no se guardo"
  end

end
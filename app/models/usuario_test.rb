require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  def setup
    @usuario = Usuario.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @usuario.valid?
  end

  test "usuario should be present" do
  @usuario.usuario = "     "
  assert_not @usuario.valid?
end

  test "senha should be present" do
    @usuario.senha = "     "
    assert_not @usuario.valid?
  end

  test "name should not be too long" do
  @usuario.usuario = "a" * 15
  assert_not @usuario.valid?
end

test "email should not be too long" do
  @usuario.senha = "a" * 256
  assert_not @usuario.valid?
end
end

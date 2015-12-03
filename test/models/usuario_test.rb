require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  def setup
    @usuario = Usuario.new(usuario: "Example", password: "foobar", password_confirmation: "foobar")
  end

  test "password should be present (nonblank)" do
  @usuario.password = @usuario.password_confirmation = " " * 6
  assert_not @usuario.valid?
  end

  test "password should have a minimum length" do
   @usuario.password = "a" * 5
   assert_not @usuario.valid?
 end

  test "usuario should be present" do
  @usuario.usuario = "     "
  assert_not @usuario.valid?
end

  test "usuario should not be too long" do
  @usuario.usuario = "a" * 16
  assert_not @usuario.valid?
end

test "email should not be too long" do
  @usuario.password = "a" * 256
  assert_not @usuario.valid?
end

test "usuarios should be unique" do
   duplicate_usuario = @usuario.dup
   duplicate_usuario.usuario = @usuario.usuario.upcase

   @usuario.save
   assert_not duplicate_usuario.valid?
 end

end

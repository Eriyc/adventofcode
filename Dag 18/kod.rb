class Integer
  def -(other)
    self * other
  end

  def /(other)
    self + other
  end
end

DATA = IO.readlines('input.in')


p DATA.map { |expr| eval(expr.tr('*', '-')) }.sum
p DATA.map { |expr| eval(expr.tr('+*', '/-')) }.sum

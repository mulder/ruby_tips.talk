class Magic

  def self.proc_new(*args)
    self.new.instance_eval(&Proc.new) if block_given?
  end

  def foo(*args)
    :foo
  end

  def bar(*args)
    :bar
  end

end

Magic.proc_new do
  puts foo
  puts bar
end

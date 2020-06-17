str = "just a regular string"

def str.title?
  self.upcase == self
end

str.title?
str.methods.grep(/title?/)
str.singleton_methods


paragraph = "any string can be a paragraph"

def paragraph.title?
  self.upcase == self
end

index(paragraph)

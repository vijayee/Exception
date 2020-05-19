class val Exception
  let message: String
  let method: String
  let fileName: String
  let line: USize
  let position: USize
  new val create(message': String, loc: SourceLoc val = __loc) =>
    message = message'
    fileName = loc.file()
    line = loc.line()
    position = loc.pos()
    method = loc.method_name()
  fun apply() ? =>
    error
  fun string(): String iso^ =>
     (recover String(fileName.size()
      + line.string().size()
      + position.string().size()
      + message.size()
      + method.size()
      + 9)
      end)
     .> append(message)
     .> append(" -- ")
     .> append(method)
     .> append(", ")
     .> append(fileName)
     .> append(":")
     .> append(line.string())
     .> append(":")
     .> append(position.string())

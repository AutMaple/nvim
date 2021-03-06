local status_ok, surround = pcall(require, "surround")

if not status_ok then
  return
end

surround.setup(
  {
    mapping_style = "surround",
    pairs = {
      nestable = {
        b = {"(", ")"},
        s = {"[", "]"},
        B = {"{", "}"},
        a = {"<", ">"}
      },
      linear = {
        q = {"'", "'"},
        t = {"`", "`"},
        d = {'"', '"'}
      }
    }
  }
)

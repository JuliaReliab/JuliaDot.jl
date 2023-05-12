
export draw
export drawfile

using PyCall

const PydotPlus = PyNULL()

struct DrawResult
    content
end

function __init__()
    copy!(PydotPlus, pyimport_conda("pydotplus", "pydotplus"))
end

function Base.show(io::IO, ::MIME"image/png", c::DrawResult)
    write(io, c.content)
end

function Base.write(io::IO, c::DrawResult)
    write(io, c.content)
end

function draw(data)
    graph = PydotPlus.graph_from_dot_data(data)
    DrawResult(Vector{UInt8}(graph.create_png()))
end

function drawfile(x)
    data = open(x) do f
        read(f, String)
    end
    draw(data)
end

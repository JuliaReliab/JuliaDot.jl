
export draw

using PyCall
using Conda
Conda.add("python-graphviz", channel="conda-forge")
Conda.add("pydotplus", channel="conda-forge")

const PydotPlus = PyNULL()

function __init__()
    copy!(PydotPlus, pyimport_conda("pydotplus", "pydotplus"))
end

function draw(dot_data)
    graph = PydotPlus.graph_from_dot_data(dot_data)
    graph.progs = Dict("dot" => "$(Conda.BINDIR)/dot")
    display("image/png", Vector{UInt8}(graph.create_png()))
end


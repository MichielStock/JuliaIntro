### A Pluto.jl notebook ###
# v0.14.8

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 00666752-d752-11eb-3723-75e624a6aef8
using Plots, DifferentialEquations, DrWatson, PlutoUI

# ╔═╡ 931d3024-75e7-45fc-bcd9-094a90e331d4
Markdown.parse("[Lotka-Volterra equations](https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations)")

# ╔═╡ 0746aaaf-c322-4ad3-b969-94e1b3978be7
begin
	K  = 1000.
	α = 1.1
	β = .4
	δ = 0.4
	γ = 0.1
	tend = 50.0
end

# ╔═╡ dcbd2cbc-45b4-488c-a328-482fc57381f4
function preypred!(du, (🐛, 🐞), p, t)
	# unpack the parameters
	α, β, δ, γ = p
	# define the set of ordinary differential equations
	du[1] = α * 🐛 * (1.0 - 🐛 / K) - β * 🐛 * 🐞
	du[2] = - δ * 🐞 + γ * 🐛 * 🐞
end

# ╔═╡ 47c648aa-0989-4d70-ad4a-0ed85a6555d8
# set the initial conditions
🐛₀, 🐞₀ = (10.0, 10.0)

# ╔═╡ 14255aa3-1a4e-4759-a500-f789bfb64303
# solve the ODE
prob = ODEProblem(
	preypred!, # the function that defines the (set of) ODE(s)
	[🐛₀, 🐞₀], # the initial conditions
	(0.0, tend), # the start and end time of the simulation
	(α, β, δ, γ) # some additional parameters
)

# ╔═╡ 5e59e273-f4c2-4bc4-a128-18689af7d12f
# solve the problem using the standard Runge-Kutta method
sol = solve(prob, RK4())

# ╔═╡ 0b118ef9-cd48-484a-8c03-402a42d2f804
plot(sol)

# ╔═╡ c855bfb0-0cbd-461f-9297-efe95fd84f9d
begin
	🐛0_ui = @bind 🐛0 PlutoUI.Slider(10:1.:20)
	🐞0_ui = @bind 🐞0 PlutoUI.Slider(5:1.:10)
	α_ui = @bind αui PlutoUI.Slider(0.9:0.1:1.5)
	β_ui = @bind βui PlutoUI.Slider(0.2:0.1:0.8)
	δ_ui = @bind δui PlutoUI.Slider(0.2:0.1:0.8)
	γ_ui = @bind γui PlutoUI.Slider(0.2:0.1:0.8)
	
	md"""
	Same equations, but with sliders 
	
	🐛₀ $🐛0_ui
	
	🐞₀ $🐞0_ui
	
	α $α_ui
	
	β $β_ui
	
	δ $δ_ui
	
	γ $γ_ui
	"""
end


# ╔═╡ 5308958a-181d-4583-b8a8-3ea3d8c95cf0
plot(solve(ODEProblem(preypred!, [🐛0, 🐞0], (0.0, tend), (αui, βui, δui, γui)), RK4()))

# ╔═╡ 8c2b52bf-528d-4893-b1e4-01dde48dd120
md"""Use some DrWatson functions to make the saving and solving a bit more easier"""

# ╔═╡ f1e1fc11-a23a-4204-8fda-ea9e7d479318
"""
a function to simulate the predator-prey model and save the results
"""
function simpredprey(d::Dict)
	# unpacking a dictionary into variables
    @unpack 🐛₀, 🐞₀, tend, α, β, δ, γ = d
	# same as before: solving the ODE system
	prob = ODEProblem(preypred!, [🐛₀, 🐞₀],(0.0, tend), (α, β, δ, γ))
	sol = solve(prob, RK4())
	# generating an output Dict of all things we want to save
	output = merge(Dict("u" => hcat(sol.u...), "t" => sol.t), d)
	# the actual saving of the simulation results
	# note that the name is generated from all results. 
	# DrWatson will ignore the u and t variables because they are vectors
	# variable names such as int, float and string will be used for the name.
    @tagsave(
		datadir("sims", "predprey", savename(output, "bson")),
		output;
    )
end

# ╔═╡ 7126d0b3-912e-4b1c-8c7d-279ac9cd74e7


# ╔═╡ d31bc368-3dd9-4dbf-b2d0-badfc086bfe6
md"""
Let's do some scenario analysis!
"""

# ╔═╡ 6b342801-1faf-4fb7-a7ac-2e26732f93b2
allparams = Dict(
    "🐛₀" => [10., 100., 1000.], # it is inside vector. It is expanded.
	"🐞₀" => 10., # keep this constant for all scenarios
    "tend" => 50.,
	"α" => 1.1,
	"β" => 0.4,
	"δ" => 0.4,
	"γ" => [0.1, 0.2],
)

# ╔═╡ f8e0cec0-478b-429a-aec8-96c0eb44b725
md"""
using dict_list, let us expand the scenarios to generate all parameter combinations
"""

# ╔═╡ 76220a32-5beb-4d04-a48b-618b2f91519e
dicts = dict_list(allparams)

# ╔═╡ 72d9e8d1-7d90-477d-bf1b-64d9cc5c5779
# run simulations!
map(simpredprey, dicts);

# ╔═╡ 9e8b9d9e-a807-4ca9-a905-f30562ac727f
md"""
What simulations did I already run?
"""

# ╔═╡ 838a70f6-c223-4045-bcec-a214e99dfa10
readdir(datadir("sims", "predprey"))

# ╔═╡ 27b67f5e-eb64-4046-92c2-2a0dfe575ec4
firstsim = readdir(datadir("sims", "predprey"))[1]

# ╔═╡ 0464542e-65a7-4b8a-9aad-9e04a8200430
md"""
Loading a simulation from disk.

Look at all the things that were saved ! Additional git info, what script was used to generate the output, etc.
"""

# ╔═╡ f259eed3-ae29-4ef3-bb79-6b03d032a145
wload(datadir("sims", "predprey", firstsim))

# ╔═╡ Cell order:
# ╠═00666752-d752-11eb-3723-75e624a6aef8
# ╟─931d3024-75e7-45fc-bcd9-094a90e331d4
# ╠═0746aaaf-c322-4ad3-b969-94e1b3978be7
# ╠═dcbd2cbc-45b4-488c-a328-482fc57381f4
# ╠═47c648aa-0989-4d70-ad4a-0ed85a6555d8
# ╠═14255aa3-1a4e-4759-a500-f789bfb64303
# ╠═5e59e273-f4c2-4bc4-a128-18689af7d12f
# ╠═0b118ef9-cd48-484a-8c03-402a42d2f804
# ╠═c855bfb0-0cbd-461f-9297-efe95fd84f9d
# ╠═5308958a-181d-4583-b8a8-3ea3d8c95cf0
# ╠═8c2b52bf-528d-4893-b1e4-01dde48dd120
# ╠═f1e1fc11-a23a-4204-8fda-ea9e7d479318
# ╠═7126d0b3-912e-4b1c-8c7d-279ac9cd74e7
# ╠═d31bc368-3dd9-4dbf-b2d0-badfc086bfe6
# ╠═6b342801-1faf-4fb7-a7ac-2e26732f93b2
# ╠═f8e0cec0-478b-429a-aec8-96c0eb44b725
# ╠═76220a32-5beb-4d04-a48b-618b2f91519e
# ╠═72d9e8d1-7d90-477d-bf1b-64d9cc5c5779
# ╠═9e8b9d9e-a807-4ca9-a905-f30562ac727f
# ╠═838a70f6-c223-4045-bcec-a214e99dfa10
# ╠═27b67f5e-eb64-4046-92c2-2a0dfe575ec4
# ╠═0464542e-65a7-4b8a-9aad-9e04a8200430
# ╠═f259eed3-ae29-4ef3-bb79-6b03d032a145

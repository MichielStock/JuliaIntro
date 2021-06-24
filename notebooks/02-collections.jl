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

# ╔═╡ fbde6364-4f30-11eb-1ece-712293996c04
using Colors: RGB

# ╔═╡ 486457d8-4f37-11eb-306c-57d650508136
using Images

# ╔═╡ 7308bc54-e6cd-11ea-0eab-83f7535edf25
# edit the code below to set your name and UGent username

student = (name = "Jimmy Janssen", email = "Jimmy.Janssen@UGent.be");

# press the ▶ button in the bottom right of this cell to run your edits
# or use Shift+Enter

# you might need to wait until all other cells in this notebook have completed running. 
# scroll down the page to see what's up

# ╔═╡ cdff6730-e785-11ea-2546-4969521b33a7
begin 
	using PlutoUI;
	md"""
	Submission by: **_$(student.name)_**
	"""
end

# ╔═╡ a2181260-e6cd-11ea-2a69-8d9d31d1ef0e
md"""
# Notebook 2: Collections
"""

# ╔═╡ 2222fe0c-4c1d-11eb-1e63-f1dbc90a813c
md"""In programming, a collection is a class used to represent a set of similar data type items as a single unit. These unit classes are used for grouping and managing related objects. A collection has an underlying data structure that is used for efficient data manipulation and storage. 
	
	[Techopedia.com](https://www.techopedia.com/definition/25317/collection)"""

# ╔═╡ 44542690-4c1d-11eb-2eea-49f28ed7fd90
md"""
## 1. Arrays

Let us start with `Array`'s. It is very similar to lists in Python, though it can have more than one dimension. An `Array` is defined as follows,


"""

# ╔═╡ 8f8c7b44-4c1d-11eb-0cd8-3bb82c75c086
A = []            # empty array

# ╔═╡ b0420f36-5a71-11eb-01f1-f16b115f5895
md"Note that the element type is `Any`, since the compiler has no idea what we would store in `A`!"

# ╔═╡ a0c22de6-4c1d-11eb-34a2-aff57cfd22a1
X = [1, 3, -5, 7] # array of integers

# ╔═╡ a81d1f22-4c1d-11eb-1b76-2929f30565bf
md"### Indexing and slicing"

# ╔═╡ bb79bf28-4c1d-11eb-35bf-379ac0cd16b6
md"Let's start by eating the frog. Julia uses [1-based indexing](https://docs.google.com/document/d/11ZKaR0a6hvc6xmYLfmslAAPnkVRSZFGz5GZYRNmxmsQ/edit)..."

# ╔═╡ eaf59a7e-4c1d-11eb-2db3-fd7f995db3e4
names = ["Arthur", "Ford", "Zaphod", "Marvin", "Trillian", "Eddie"]

# ╔═╡ efa60284-4c1d-11eb-1c08-09993363e4a8
names[0]        # this does not work, sorry Pythonista's

# ╔═╡ efa6f180-4c1d-11eb-1ab0-3d1ca0b4bc57
names[1]        # hell yeah!

# ╔═╡ efb6718c-4c1d-11eb-0dff-e55e6a676e39
names[end]      # last element

# ╔═╡ efb69e46-4c1d-11eb-1ce7-ed428db8ff44
names[end-1]    # second to last element

# ╔═╡ 0a02b730-4c1e-11eb-1e8a-872dcfc8ab81
md"Slicing arrays is intuitive,"

# ╔═╡ 15035dee-4c1e-11eb-123f-a961fdd48445
names[3:6]

# ╔═╡ 1960de28-4c1e-11eb-1c84-ffe0cbaac940
md"and slicing with assignment too."

# ╔═╡ 4db9d648-4c1e-11eb-1063-e78c78ef5c4b
names[end-1:end] = ["Slartibartfast", "The Whale and the Bowl of Petunias"]

# ╔═╡ 4fb1a53e-4c1e-11eb-381b-1f86a5ed97a1
names

# ╔═╡ 619fd3bc-5a72-11eb-22f7-49ff5486e0fa
md"What the first index again? And how to access the last element? If you forgot, just use `first` and `last`:"

# ╔═╡ 7e460c3e-5a72-11eb-0c52-cf9583c70759
first(names), last(names)

# ╔═╡ 354fa70c-5a74-11eb-31fc-ad21a845d3b0
md"Pluto might not execute the lines of code in order. As you are changing `names` later on, the results might be a bit unexpected."

# ╔═╡ 56f5f21e-4c1e-11eb-004e-f19aa9029b01
md"### Types and arrays"

# ╔═╡ 79e0f212-4c1e-11eb-0d64-87308d762180
md"Julia arrays can be of mixed type."

# ╔═╡ 86dcfb26-4c1e-11eb-347f-ffbd8b396f09
Y = [42, "Universe", []]

# ╔═╡ 8a0e3e36-4c1e-11eb-0ec0-d19fdc3c89d8
md"The type of the array changes depending on the elements that make up the array. With `Any` being the most general type. Working with such general objects is not efficient though. In practice, your code will become as slow as Python."

# ╔═╡ 90d3dc80-4c1e-11eb-2a11-3fe581f0b5f7
typeof(Y)

# ╔═╡ 996ba666-4c1e-11eb-3c5c-4bf8673de6bc
X

# ╔═╡ 90d369a8-4c1e-11eb-3c16-c5fb02bdf3bb
typeof(X)

# ╔═╡ f247382c-4c1e-11eb-229c-efe48b7a4d7f
md"When the elements of the arrays are mixed, the type is promoted to the closest common ancestor. For `Y` this is `Any`.  But an array of an integer and a float becomes an..."

# ╔═╡ fd06f130-4c1e-11eb-37cf-03af9372ae45
B = [1.1, 1]

# ╔═╡ 00237b9a-4c1f-11eb-3b19-73c0b8e4cbed
typeof(B)

# ╔═╡ 0425e980-4c1f-11eb-2477-e35a924b8018
eltype(B)   # gives the type of the elements

# ╔═╡ 069cccc4-4c1f-11eb-39b3-b94136c1b468
md"... array of floats." 

# ╔═╡ 0fd48034-4c1f-11eb-06a9-0d7353b2a0d6
md"""
Julia allows the flexibility of having mixed types, though this will hinder performance, as the compiler can no longer optimize for the type. If you process an array of `Any`'s, your code will be as slow as Python.

To create an array of a particular type, just use `Type[]`.

"""

# ╔═╡ 2262e4fc-4c1f-11eb-07b8-0b9732b93d86
Float64[1, 2, 3]

# ╔═╡ 3d0107c4-4c1f-11eb-1b5b-ed954348d0aa
md"""### Initialisation
Arrays can be initialised in all the classic, very Pythonesque ways.


"""

# ╔═╡ 4b3317da-4c1f-11eb-19d5-03570c4d65df


# ╔═╡ 503c9da0-4c1f-11eb-292a-db7b8ce9f458


# ╔═╡ 503d455c-4c1f-11eb-3af2-8f200db1fd30


# ╔═╡ 504d8aca-4c1f-11eb-3600-d77038b0f2bc


# ╔═╡ 505874a8-4c1f-11eb-1132-3bbba81ae1db


# ╔═╡ 5071c430-4c1f-11eb-226b-634abae6082f


# ╔═╡ c2ccb916-5a72-11eb-16d9-15283727d6cf


# ╔═╡ 52a8a6ec-4c1f-11eb-386c-a99ef05b41b0
md"Often it is better to provide a specific type for initialization. For numeric elements `Float64` is the default."

# ╔═╡ 507254b0-4c1f-11eb-2b2c-8bc88e58e0b3
zeros(Int8, 5)

# ╔═╡ 27b18866-4c22-11eb-22da-656ca8a4c01d
md"### Comprehensions and list-like operations"

# ╔═╡ 387c3e70-4c22-11eb-37e4-bb6c36600074
md"Comprehensions are a concise and powerful way to construct arrays and are very loved by the Python community."

# ╔═╡ 3da23eb8-4c22-11eb-1ec4-c350d615322f
Z = [1, 2, 3, 4, 5, 6, 8, 9, 8, 6, 5, 4, 3, 2, 1]

# ╔═╡ 3f5436d2-4c22-11eb-342a-35b7a29ef146
dZ = [Z[i-1] - 2Z[i] + Z[i+1] for i=2:length(Z)-1] # central difference

# ╔═╡ 63fea2f6-4c22-11eb-0802-37fd7653cdb5
md"""General $N$-dimensional arrays can be constructed using the following syntax:

```julia
[ F(x,y,...) for x=rx, y=ry, ... ]
```

Note that this is similar to using set notation. For example:

```julia
[i * j for i in 1:4, j in 1:5]
```


"""

# ╔═╡ 10267fee-5a73-11eb-2947-279f6be1a3fe
md"We can also use logic to specify which elements to include."

# ╔═╡ 27051614-5a73-11eb-1d22-35ec8ebc1fd8
[i^2 for i in 1:20 if isodd(i)]  # squares of the odd integers below 20

# ╔═╡ a5f17ccc-4c22-11eb-2cb8-7b130e1e811f
md"Arrays behave like a stack. So pushing, appending and popping are valid operations. Elements can be added to the back of the array, (*Pushing and appending*)"

# ╔═╡ f1b481f4-4c22-11eb-39b7-39ffdd5bbccc
push!(names, "Eddie") # add a single element

# ╔═╡ f61fc4b0-4c22-11eb-30b3-154ed1aa43bd
append!(names, ["Sam", "Gerard"]) # add an array

# ╔═╡ fcbeda22-4c22-11eb-2d35-a356b98bbc46
md""" "Eddie" was appended as the final element of the Array along with "Sam" and "Gerard". Remember, a "!" is used to indicate an in-place function. `pop()` is used to return and remove the final element of an array"""

# ╔═╡ 3516a722-4c23-11eb-3ee7-fb8d582c8ce0
md"Removing the last element or first element (*popping*)"

# ╔═╡ 08bb725e-4c23-11eb-3338-03370f49dd11
pop!(names)

# ╔═╡ 0cfc84ca-4c23-11eb-124b-5397430fd203
names

# ╔═╡ 4fbecdfe-4c23-11eb-0da7-5945a49c3a2a
popfirst!(names)

# ╔═╡ 562b751e-4c23-11eb-2b8f-73f710bf3520
names

# ╔═╡ 5ed7284a-4c23-11eb-1451-0ff763f52bc7
md"## 2. Matrices"

# ╔═╡ 0186eab2-4c24-11eb-0ff6-d7f8af343647
md"Let's add a dimension and go to 2D Arrays, matrices. It is all quite straightforward,"

# ╔═╡ 097e96e8-4c24-11eb-24c4-31f4d23d3238
P = [0 1 1; 2 3 5; 8 13 21; 34 55 89]

# ╔═╡ 028be3bc-661f-11eb-251e-73abd3abb9fe
size(P)

# ╔═╡ 08e5589e-661f-11eb-262a-dd917f77f56b
size(P, 1)  # size first dimention

# ╔═╡ 0b9bad58-4c24-11eb-26a8-1d04d7b2be61
P[3,2]  # indexing

# ╔═╡ 0b9d0bf8-4c24-11eb-2beb-0763c66e6a20
P[1,:]  # slicing

# ╔═╡ b9a9a730-5a73-11eb-0d17-7bf1aa935697
md"You  will likely not be surprised that most functions just work for two (or more) dimensions:"

# ╔═╡ d4405d8c-5a73-11eb-21f7-37c4d7ac537b
ones(4, 5)

# ╔═╡ da5edf54-5a73-11eb-26ff-2f6af8adceed
fill(0.5, 8, 2)

# ╔═╡ def334c0-5a73-11eb-3006-e7437155cdef
rand(Bool, 3, 3)

# ╔═╡ 25d53e6c-4c24-11eb-02a2-a71d4b2a7974
md"It is important to know that arrays and other collections are copied by reference."

# ╔═╡ 6191c72e-4c24-11eb-21bb-a59e880a3573
with_terminal() do
	println(); println()
    P = [0 1 1; 2 3 5; 8 13 21; 34 55 89]
	@show R = P
	@show P
	@show P[1, 1] = 42
	println()
	@show R
end

# ╔═╡ 07220d0a-4c4a-11eb-0ae3-298cf03a0bf6
md"`deepcopy()` can be used to make a fully dereferenced object."

# ╔═╡ 26f6f852-4c4a-11eb-3a5c-e7d788713ab8
md"""### Concatenation
Arrays can be constructed and also concatenated using the following functions,
"""

# ╔═╡ 54b81ed8-4c4a-11eb-1d47-99d5823f2ab1
I = [0 1 1; 2 3 5; 8 13 21; 34 55 89]

# ╔═╡ 56fd77e2-4c4a-11eb-1ab1-4793cd9b220c
W = rand(4,3)

# ╔═╡ 56ff198a-4c4a-11eb-1604-8f08c9cf868c
cat(I, W, dims=2)                # concatenation along a specified dimension

# ╔═╡ 57226e44-4c4a-11eb-26fd-fbd6f993bb72
cat(I, W, dims=1) == vcat(I, W) == [I; W]   # vertical concatenation

# ╔═╡ 57327ab4-4c4a-11eb-219f-f70dd02f170c
cat(I, W, dims=2) == hcat(I, W) == [I W]   # horizontal concatenation

# ╔═╡ 969bc7a0-4c4a-11eb-3db6-892f68020468
md"Note that `;` is an operator to use `vcat`, e.g."

# ╔═╡ a8eba678-4c4a-11eb-2866-1135e65bc4df
[zeros(2, 2) ones(2, 1); ones(1, 3)]

# ╔═╡ afd0b9a6-4c4a-11eb-270b-133ddc3e753b
md"This simplified syntax can lead to strange behaviour. Explain the following difference."

# ╔═╡ b4de01c4-4c4a-11eb-3b0b-275ec9ddf5bf
[1  2-3]

# ╔═╡ b76b87e0-4c4a-11eb-3b21-f1365960fdd0
[1 2 -3]

# ╔═╡ be174110-4c4a-11eb-05cf-17e2527dfad8
md"Sometimes, `vcat` and `hcat` are better used to make the code unambiguous..."

# ╔═╡ cad05c2a-4c4a-11eb-0c89-13cddd2aa35f
md"By default, the `*` operator is used for matrix multiplication"

# ╔═╡ d43ae2ee-4c4a-11eb-281a-b353dc1de640
E = [2 4 3; 3 1 5]

# ╔═╡ d5f77750-4c4a-11eb-0624-11ca5cc2a84e
R = [ 3 10; 4 1 ;7 1]

# ╔═╡ d5fa6276-4c4a-11eb-068e-b114e33e5d8f
E * R

# ╔═╡ 45e86286-4c4b-11eb-1516-0140dc69ab58
md"### Element-wise operations"

# ╔═╡ ee779c1a-4c4a-11eb-1894-d743aeff7f44
md"""This is the Julian way since functions act on the objects, and element-wise operations are done with "dot" operations. For every function or binary operation like `^` there is a "dot" operation `.^` to perform element-by-element exponentiation on arrays."""

# ╔═╡ 0697987c-4c4b-11eb-3052-df54b72dec52
T = [10 10 10; 20 20 20]

# ╔═╡ 14bceb32-4c4b-11eb-06b2-5190f7ebb9c2
T.^2

# ╔═╡ 1ace7720-4c4b-11eb-0338-37e7a7227a68
md"""Under the hood, Julia is looping over the elements of `Y`. So a sequence of dot-operations is fused into a single loop."""

# ╔═╡ 2146ac4c-4c4b-11eb-288f-edb3eacff0eb
T.^2 .+ cos.(T)

# ╔═╡ 28f5c018-4c4b-11eb-3530-8b592f2abeda
md"""
Did you notice that dot-operations are also applicable to functions, even user-defined functions? As programmers, we are by lazy by definition and all these dots are a lot of work. The `@.` macro does this for us.
"""

# ╔═╡ 32351fb8-4c4b-11eb-058b-5bb348e8dfb7
T.^2 .+ cos.(T) == @. T^2 + cos(T)

# ╔═╡ be557eda-64a3-11eb-1562-35ad48531ebd


# ╔═╡ eed4faca-4c1f-11eb-3e6c-b342b48080eb
md""" ### Intermezzo: Colors.jl and Images.jl

As has been mentioned before, everything has a type. We also know that functions can behave differently for each type. With this in mind, let us look at two interesting packages. *Colors.jl* and *Images.jl*
"""

# ╔═╡ 42254aa6-4f37-11eb-001b-f78d5383e36f
RGB(0.5,0.2,0.1)

# ╔═╡ 0977a54e-4f31-11eb-148c-1d44be4f6853
md"*Colors.jl* provides a wide array of functions for dealing with color. This includes conversion between colorspaces, measuring distance between colors, simulating color blindness, parsing colors, and generating color scales for graphics."

# ╔═╡ 4c21ed0e-4f37-11eb-0a90-3120e1ee7936
url = "https://i.imgur.com/BJWoNPg.jpg"

# ╔═╡ 5686c59e-4f37-11eb-21d5-47bdbcf75805
download(url, "bluebird.jpg") # download to a local file

# ╔═╡ a5dc2904-4f37-11eb-24c1-d7837c8bd487
img = load("bluebird.jpg")

# ╔═╡ cf3ec91e-4f37-11eb-0706-e9f726532654
typeof(img)

# ╔═╡ d7d1b940-4f37-11eb-3f74-9dbe02774e54
eltype(img)

# ╔═╡ f90725be-4f37-11eb-1905-e99a65ad3e07
size(img)

# ╔═╡ dd781738-4f37-11eb-09fb-b7f3390a49b2
md"So an image is basically a two-dimensional array of Colors. Which means it can be processed just like any other array."

# ╔═╡ ab395348-4f39-11eb-0a3c-1d8af3b6442e
sqr_img = img[1:1500, 201:1700]

# ╔═╡ 7acaf008-4f3a-11eb-17c2-dfaa1e9f2ce7
md"Because of this type system, a lot of interesting feature work out of the box."

# ╔═╡ 8ce0ab98-4f3a-11eb-37b2-dd7dda63ad5f
md"""
☼ 
$(@bind brightness html"<input type=range min=0.0 max=300.0>")
☾
"""

# ╔═╡ ac62d6e0-5a74-11eb-1538-09d157738257
brightness

# ╔═╡ d73eba40-4f3a-11eb-0aa8-617fc22d5ca3
img[1:1500, 201:1700] ./ (brightness/100)

# ╔═╡ 21db9766-64a4-11eb-3ec1-4956431e7a09


# ╔═╡ 5064c592-4c4b-11eb-0dee-5186caf2b1f6
md"### Higher dimensional arrays"

# ╔═╡ 598980b8-4c4b-11eb-0c5b-b7064b189e97
md"Matrices can be generalized to multiple dimensions."

# ╔═╡ 5fcfb5dc-4c4b-11eb-0be6-e7f66ea1839e
H = rand(3, 3, 3)

# ╔═╡ bf6b9fc4-5a74-11eb-2676-bda580c65877
md"That is all there is to see about matrices, feel free to create arrays of any dimension."

# ╔═╡ 6e7d5a94-4c4b-11eb-3e2d-353177d6bca5
md"### Ranges"

# ╔═╡ 79129c92-4c4b-11eb-28f6-633aedabd990
md"The colon operator `:` can be used to construct unit ranges, e.g., from 1 to 20:"

# ╔═╡ 7f693b34-4c4b-11eb-134d-af855593f45e
ur = 1:20

# ╔═╡ 83939d80-4c4b-11eb-3dc8-1b559c61a43b
md"Or by increasing in steps:"

# ╔═╡ 884b0d4a-4c4b-11eb-1d39-5f67ba9e92fe
str = 1:3:20

# ╔═╡ 9483861e-4c4b-11eb-156b-2501ef2c54d0
md"Similar to the `range` function in Python, the object that is created is not an array, but an iterator. This is actually the term used in Python. Julia has many different types and structs, which behave a particular way. Types of `UnitRange` only store the beginning and end value (and stepsize in the case of `StepRange`). But functions are overloaded such that it acts as an array. This can really improve the execution speed since the conversion from `Range` to explicit array is only performed where it is necessary and avoids copying large matrices from function to function."

# ╔═╡ 9fd1be0a-4c4b-11eb-299b-f7f0d8797f71
with_terminal() do
	for i in ur
	  println(i)
	end
end

# ╔═╡ a2104d08-4c4b-11eb-0ccc-b588e99a2057
str[3]

# ╔═╡ a214405c-4c4b-11eb-118b-b7ec852f9257
length(str)

# ╔═╡ a806a9dc-4c4b-11eb-1101-6f75be7a610c
md"All values can be obtained using `collect`:"

# ╔═╡ af514422-4c4b-11eb-1cfe-cba6029ec52f
collect(str)

# ╔═╡ b3035158-4c4b-11eb-1b8d-1fc4070fa132
md"Such implicit objects can be processed much smarter than naive structures. Compare! (You might need to run the lines of code again as not to measure compile time."

# ╔═╡ c4575438-4c4b-11eb-1da2-97acca3f3e99
@elapsed sum((i for i in 1:100_000_000))

# ╔═╡ 0a26ad38-5a75-11eb-0424-4d26aa905de5
md"Note that we use round brackets to create our own iterator, where every element is processed one by one by `sum`."

# ╔═╡ c64e66c8-4c4b-11eb-1686-8fa64d8b2505
@elapsed sum(1:100_000_000)   

# ╔═╡ 3a6c466a-5a75-11eb-07e2-ffbf9ec3ffe4
sum(1:100_000_000) == sum((i for i in 1:100_000_000))

# ╔═╡ 03d82c7a-4c58-11eb-0071-bb9ea16bfbb3
md"`StepRange` and `UnitRange` also work with floats."

# ╔═╡ 0bec2d28-4c58-11eb-0a51-95bf50bbfd79
0:0.1:10

# ╔═╡ 6aa73154-661f-11eb-2b88-578eb2dd2ec2
(0:1:100) / 10  # equivalent

# ╔═╡ ae6064e6-64a4-11eb-24b5-0b0b848aa2d6


# ╔═╡ 0fd08728-4c58-11eb-1b71-c9710d398fab
md"## 3. Other collections"

# ╔═╡ 2c6097f4-4c58-11eb-0807-d5d8cbfbd62c
md"Some of the other collections include tuples, dictionaries, and others."

# ╔═╡ 9505a4d4-4c58-11eb-1e2e-0d080437fa23
md"### Tuples"

# ╔═╡ 23dac6cc-4c58-11eb-2c66-f1f79db08536
tupleware = ("tuple", "ware") # tuples

# ╔═╡ 4f80f0a8-4c58-11eb-3679-c186c61c5a14
md"A tuple is an array with a fixed size. It is not possible to perform operations that change the size of a tuple."

# ╔═╡ 6d496b44-4c58-11eb-33b6-5b4d6315b6ea
pop!(tupleware)

# ╔═╡ 56e8f6b4-5a75-11eb-3eeb-ffec491be69c
md"In contrast to arrays however, the types at positions should not be the same, since the compiler will create a new type for every combination!"

# ╔═╡ 8245e46e-5a75-11eb-2d0a-27ef6a1f2492
mixedtuple = (9, "nine")

# ╔═╡ 942b88b4-5a75-11eb-3e7b-4534bf4a7b12
typeof(mixedtuple)

# ╔═╡ 7bc7bdf4-4c58-11eb-1fd8-376ac6da5ab2
md"Indexing and slicing is the same as arrays,"

# ╔═╡ 74d97654-4c58-11eb-344b-8d6df24323d5
tupleware[end]

# ╔═╡ 9bb1e83a-5a75-11eb-0fcc-59f6cc50bf6a
md"One can also define named tuples where the fields have names."

# ╔═╡ bcd5696a-5a75-11eb-0ec1-f116216aa682
namedtuple = (trainer="Ash", pokemon="Pikachu")

# ╔═╡ d74ff724-5a75-11eb-39a1-a963cd64948b
namedtuple[:trainer]

# ╔═╡ dd8978a4-5a75-11eb-287e-03e4272b6f2c
namedtuple[1]  # but indexing still works

# ╔═╡ 9cecd9a6-4c58-11eb-22dc-33cd2559d815
md"### Dictionaries"

# ╔═╡ c6d236da-4c58-11eb-2714-3f5c43583a3d
md"A dictionary is a collection that stores a set of values with their corresponding keys internally for faster data retrieval. The operation of finding the value associated with a key is called lookup or indexing. [Techopedia.com](https://www.techopedia.com/definition/10263/dictionary-c)"

# ╔═╡ 3253ab74-4c58-11eb-178e-83ea8aba9c8f
scores = Dict("humans" => 2, "vogons" => 1) # dictionaries

# ╔═╡ 32593936-4c58-11eb-174c-0bb20d93dde5
scores["humans"]

# ╔═╡ fcfb511c-5a75-11eb-2181-33d147ab1806
scores["mice"] = 3  # adding a key

# ╔═╡ 1882840a-5a76-11eb-3392-81c2915487f5
scores

# ╔═╡ 3fc787d6-5a76-11eb-06e9-5378d27ce011
delete!(scores, "humans")  # removing a key, earth was destroyed

# ╔═╡ ebb09172-4c58-11eb-1cc9-91193c57677d
md"## 4. Exercises"

# ╔═╡ 824849ba-022f-4891-93dc-cc1d1be411ac
md"""
### Riemann sum

Integrating for dummies. Compute the Riemann sum **without** making use of a for-loop.

Riemann approximates the integration of a function in the interval [a, b],
		
$$\int_a^b f(x)\, dx \approx \sum_{i=1}^n f(x_i) \,\Delta x$$

which is the sum of the function $f(x)$ evaluated over an array of x-values in the interval [a,b] multiplied by the $\Delta x$ which is,
		
$$\Delta x = \cfrac{(b-a)}{n}$$

Complete the function `riemannsum(f, a, b,; n=100)` where the arguments are the function to integrate (f) the boundaries of the interval a, b and the number of bins with a default value of 100, n.
"""

# ╔═╡ ee9069e2-63a7-11eb-12b9-97ae270506f4
md"Hint: Remember, `.` is not only used for decimals..."

# ╔═╡ dedeb380-1075-432a-88d5-2ca172aaa2f7
md"Hint: What does sum(f, x) do?"

# ╔═╡ 3de1f1aa-58bd-11eb-2ffc-0de292b13840
function riemannsum(f, a, b; n=100)
    missing
end

# ╔═╡ 5f47cdf0-58be-11eb-1bca-a3d0941b9bea
begin 
	integral1 = missing #...
	integral2 = missing #...
end;

# ╔═╡ c1e377c4-64a4-11eb-3e7f-b163cb465057
md"""Estimate pi through Monte Carlo sampling. Do this by simulating throwing `n` pebbles in the [-1, 1] x [-1, 1] square and track the fraction that land in the unit square. Complete the function `estimatepi` below."""

# ╔═╡ dc6a4870-64a4-11eb-328f-41e5dbcd0a3b


# ╔═╡ cb20fffe-58cf-11eb-1b65-49699f2d3699
function estimatepi(n)
	missing
end

# ╔═╡ 41b19e20-4d0f-11eb-1c3c-572cc5243d99


# ╔═╡ 00121c4e-64a5-11eb-2993-61c695c4e6a1


# ╔═╡ 16ec4ee4-64a5-11eb-26f3-15313b8b5acb


# ╔═╡ 2e7973b6-4d0f-11eb-107c-cdaf349428c0
md""" ## 5. References

- [Julia Documentation](https://juliadocs.github.io/Julia-Cheat-Sheet/)
- [Introduction to Julia UCI data science initiative](http://ucidatascienceinitiative.github.io/IntroToJulia/)
- [Month of Julia](https://github.com/DataWookie/MonthOfJulia)
- [Why I love Julia, Next Journal](https://nextjournal.com/kolia/why-i-love-julia)

"""

# ╔═╡ Cell order:
# ╟─cdff6730-e785-11ea-2546-4969521b33a7
# ╠═7308bc54-e6cd-11ea-0eab-83f7535edf25
# ╟─a2181260-e6cd-11ea-2a69-8d9d31d1ef0e
# ╟─2222fe0c-4c1d-11eb-1e63-f1dbc90a813c
# ╟─44542690-4c1d-11eb-2eea-49f28ed7fd90
# ╠═8f8c7b44-4c1d-11eb-0cd8-3bb82c75c086
# ╟─b0420f36-5a71-11eb-01f1-f16b115f5895
# ╠═a0c22de6-4c1d-11eb-34a2-aff57cfd22a1
# ╟─a81d1f22-4c1d-11eb-1b76-2929f30565bf
# ╟─bb79bf28-4c1d-11eb-35bf-379ac0cd16b6
# ╠═eaf59a7e-4c1d-11eb-2db3-fd7f995db3e4
# ╠═efa60284-4c1d-11eb-1c08-09993363e4a8
# ╠═efa6f180-4c1d-11eb-1ab0-3d1ca0b4bc57
# ╠═efb6718c-4c1d-11eb-0dff-e55e6a676e39
# ╠═efb69e46-4c1d-11eb-1ce7-ed428db8ff44
# ╟─0a02b730-4c1e-11eb-1e8a-872dcfc8ab81
# ╠═15035dee-4c1e-11eb-123f-a961fdd48445
# ╟─1960de28-4c1e-11eb-1c84-ffe0cbaac940
# ╠═4db9d648-4c1e-11eb-1063-e78c78ef5c4b
# ╠═4fb1a53e-4c1e-11eb-381b-1f86a5ed97a1
# ╟─619fd3bc-5a72-11eb-22f7-49ff5486e0fa
# ╠═7e460c3e-5a72-11eb-0c52-cf9583c70759
# ╟─354fa70c-5a74-11eb-31fc-ad21a845d3b0
# ╟─56f5f21e-4c1e-11eb-004e-f19aa9029b01
# ╟─79e0f212-4c1e-11eb-0d64-87308d762180
# ╠═86dcfb26-4c1e-11eb-347f-ffbd8b396f09
# ╟─8a0e3e36-4c1e-11eb-0ec0-d19fdc3c89d8
# ╠═90d3dc80-4c1e-11eb-2a11-3fe581f0b5f7
# ╠═996ba666-4c1e-11eb-3c5c-4bf8673de6bc
# ╠═90d369a8-4c1e-11eb-3c16-c5fb02bdf3bb
# ╟─f247382c-4c1e-11eb-229c-efe48b7a4d7f
# ╠═fd06f130-4c1e-11eb-37cf-03af9372ae45
# ╠═00237b9a-4c1f-11eb-3b19-73c0b8e4cbed
# ╠═0425e980-4c1f-11eb-2477-e35a924b8018
# ╟─069cccc4-4c1f-11eb-39b3-b94136c1b468
# ╟─0fd48034-4c1f-11eb-06a9-0d7353b2a0d6
# ╠═2262e4fc-4c1f-11eb-07b8-0b9732b93d86
# ╟─3d0107c4-4c1f-11eb-1b5b-ed954348d0aa
# ╠═4b3317da-4c1f-11eb-19d5-03570c4d65df
# ╠═503c9da0-4c1f-11eb-292a-db7b8ce9f458
# ╠═503d455c-4c1f-11eb-3af2-8f200db1fd30
# ╠═504d8aca-4c1f-11eb-3600-d77038b0f2bc
# ╠═505874a8-4c1f-11eb-1132-3bbba81ae1db
# ╠═5071c430-4c1f-11eb-226b-634abae6082f
# ╠═c2ccb916-5a72-11eb-16d9-15283727d6cf
# ╟─52a8a6ec-4c1f-11eb-386c-a99ef05b41b0
# ╠═507254b0-4c1f-11eb-2b2c-8bc88e58e0b3
# ╟─27b18866-4c22-11eb-22da-656ca8a4c01d
# ╟─387c3e70-4c22-11eb-37e4-bb6c36600074
# ╠═3da23eb8-4c22-11eb-1ec4-c350d615322f
# ╠═3f5436d2-4c22-11eb-342a-35b7a29ef146
# ╟─63fea2f6-4c22-11eb-0802-37fd7653cdb5
# ╟─10267fee-5a73-11eb-2947-279f6be1a3fe
# ╠═27051614-5a73-11eb-1d22-35ec8ebc1fd8
# ╟─a5f17ccc-4c22-11eb-2cb8-7b130e1e811f
# ╠═f1b481f4-4c22-11eb-39b7-39ffdd5bbccc
# ╠═f61fc4b0-4c22-11eb-30b3-154ed1aa43bd
# ╟─fcbeda22-4c22-11eb-2d35-a356b98bbc46
# ╟─3516a722-4c23-11eb-3ee7-fb8d582c8ce0
# ╠═08bb725e-4c23-11eb-3338-03370f49dd11
# ╠═0cfc84ca-4c23-11eb-124b-5397430fd203
# ╠═4fbecdfe-4c23-11eb-0da7-5945a49c3a2a
# ╠═562b751e-4c23-11eb-2b8f-73f710bf3520
# ╟─5ed7284a-4c23-11eb-1451-0ff763f52bc7
# ╟─0186eab2-4c24-11eb-0ff6-d7f8af343647
# ╠═097e96e8-4c24-11eb-24c4-31f4d23d3238
# ╠═028be3bc-661f-11eb-251e-73abd3abb9fe
# ╠═08e5589e-661f-11eb-262a-dd917f77f56b
# ╠═0b9bad58-4c24-11eb-26a8-1d04d7b2be61
# ╠═0b9d0bf8-4c24-11eb-2beb-0763c66e6a20
# ╟─b9a9a730-5a73-11eb-0d17-7bf1aa935697
# ╠═d4405d8c-5a73-11eb-21f7-37c4d7ac537b
# ╠═da5edf54-5a73-11eb-26ff-2f6af8adceed
# ╠═def334c0-5a73-11eb-3006-e7437155cdef
# ╟─25d53e6c-4c24-11eb-02a2-a71d4b2a7974
# ╠═6191c72e-4c24-11eb-21bb-a59e880a3573
# ╟─07220d0a-4c4a-11eb-0ae3-298cf03a0bf6
# ╟─26f6f852-4c4a-11eb-3a5c-e7d788713ab8
# ╠═54b81ed8-4c4a-11eb-1d47-99d5823f2ab1
# ╠═56fd77e2-4c4a-11eb-1ab1-4793cd9b220c
# ╠═56ff198a-4c4a-11eb-1604-8f08c9cf868c
# ╠═57226e44-4c4a-11eb-26fd-fbd6f993bb72
# ╠═57327ab4-4c4a-11eb-219f-f70dd02f170c
# ╟─969bc7a0-4c4a-11eb-3db6-892f68020468
# ╠═a8eba678-4c4a-11eb-2866-1135e65bc4df
# ╟─afd0b9a6-4c4a-11eb-270b-133ddc3e753b
# ╠═b4de01c4-4c4a-11eb-3b0b-275ec9ddf5bf
# ╠═b76b87e0-4c4a-11eb-3b21-f1365960fdd0
# ╟─be174110-4c4a-11eb-05cf-17e2527dfad8
# ╟─cad05c2a-4c4a-11eb-0c89-13cddd2aa35f
# ╠═d43ae2ee-4c4a-11eb-281a-b353dc1de640
# ╠═d5f77750-4c4a-11eb-0624-11ca5cc2a84e
# ╠═d5fa6276-4c4a-11eb-068e-b114e33e5d8f
# ╟─45e86286-4c4b-11eb-1516-0140dc69ab58
# ╟─ee779c1a-4c4a-11eb-1894-d743aeff7f44
# ╠═0697987c-4c4b-11eb-3052-df54b72dec52
# ╠═14bceb32-4c4b-11eb-06b2-5190f7ebb9c2
# ╟─1ace7720-4c4b-11eb-0338-37e7a7227a68
# ╠═2146ac4c-4c4b-11eb-288f-edb3eacff0eb
# ╟─28f5c018-4c4b-11eb-3530-8b592f2abeda
# ╠═32351fb8-4c4b-11eb-058b-5bb348e8dfb7
# ╟─be557eda-64a3-11eb-1562-35ad48531ebd
# ╟─eed4faca-4c1f-11eb-3e6c-b342b48080eb
# ╠═fbde6364-4f30-11eb-1ece-712293996c04
# ╠═42254aa6-4f37-11eb-001b-f78d5383e36f
# ╟─0977a54e-4f31-11eb-148c-1d44be4f6853
# ╠═486457d8-4f37-11eb-306c-57d650508136
# ╠═4c21ed0e-4f37-11eb-0a90-3120e1ee7936
# ╠═5686c59e-4f37-11eb-21d5-47bdbcf75805
# ╠═a5dc2904-4f37-11eb-24c1-d7837c8bd487
# ╠═cf3ec91e-4f37-11eb-0706-e9f726532654
# ╠═d7d1b940-4f37-11eb-3f74-9dbe02774e54
# ╠═f90725be-4f37-11eb-1905-e99a65ad3e07
# ╟─dd781738-4f37-11eb-09fb-b7f3390a49b2
# ╠═ab395348-4f39-11eb-0a3c-1d8af3b6442e
# ╟─7acaf008-4f3a-11eb-17c2-dfaa1e9f2ce7
# ╟─8ce0ab98-4f3a-11eb-37b2-dd7dda63ad5f
# ╠═ac62d6e0-5a74-11eb-1538-09d157738257
# ╠═d73eba40-4f3a-11eb-0aa8-617fc22d5ca3
# ╟─21db9766-64a4-11eb-3ec1-4956431e7a09
# ╟─5064c592-4c4b-11eb-0dee-5186caf2b1f6
# ╟─598980b8-4c4b-11eb-0c5b-b7064b189e97
# ╠═5fcfb5dc-4c4b-11eb-0be6-e7f66ea1839e
# ╟─bf6b9fc4-5a74-11eb-2676-bda580c65877
# ╟─6e7d5a94-4c4b-11eb-3e2d-353177d6bca5
# ╟─79129c92-4c4b-11eb-28f6-633aedabd990
# ╠═7f693b34-4c4b-11eb-134d-af855593f45e
# ╟─83939d80-4c4b-11eb-3dc8-1b559c61a43b
# ╠═884b0d4a-4c4b-11eb-1d39-5f67ba9e92fe
# ╟─9483861e-4c4b-11eb-156b-2501ef2c54d0
# ╠═9fd1be0a-4c4b-11eb-299b-f7f0d8797f71
# ╠═a2104d08-4c4b-11eb-0ccc-b588e99a2057
# ╠═a214405c-4c4b-11eb-118b-b7ec852f9257
# ╟─a806a9dc-4c4b-11eb-1101-6f75be7a610c
# ╠═af514422-4c4b-11eb-1cfe-cba6029ec52f
# ╟─b3035158-4c4b-11eb-1b8d-1fc4070fa132
# ╠═c4575438-4c4b-11eb-1da2-97acca3f3e99
# ╟─0a26ad38-5a75-11eb-0424-4d26aa905de5
# ╠═c64e66c8-4c4b-11eb-1686-8fa64d8b2505
# ╠═3a6c466a-5a75-11eb-07e2-ffbf9ec3ffe4
# ╟─03d82c7a-4c58-11eb-0071-bb9ea16bfbb3
# ╠═0bec2d28-4c58-11eb-0a51-95bf50bbfd79
# ╠═6aa73154-661f-11eb-2b88-578eb2dd2ec2
# ╟─ae6064e6-64a4-11eb-24b5-0b0b848aa2d6
# ╟─0fd08728-4c58-11eb-1b71-c9710d398fab
# ╟─2c6097f4-4c58-11eb-0807-d5d8cbfbd62c
# ╟─9505a4d4-4c58-11eb-1e2e-0d080437fa23
# ╠═23dac6cc-4c58-11eb-2c66-f1f79db08536
# ╟─4f80f0a8-4c58-11eb-3679-c186c61c5a14
# ╠═6d496b44-4c58-11eb-33b6-5b4d6315b6ea
# ╟─56e8f6b4-5a75-11eb-3eeb-ffec491be69c
# ╠═8245e46e-5a75-11eb-2d0a-27ef6a1f2492
# ╠═942b88b4-5a75-11eb-3e7b-4534bf4a7b12
# ╟─7bc7bdf4-4c58-11eb-1fd8-376ac6da5ab2
# ╠═74d97654-4c58-11eb-344b-8d6df24323d5
# ╟─9bb1e83a-5a75-11eb-0fcc-59f6cc50bf6a
# ╠═bcd5696a-5a75-11eb-0ec1-f116216aa682
# ╠═d74ff724-5a75-11eb-39a1-a963cd64948b
# ╠═dd8978a4-5a75-11eb-287e-03e4272b6f2c
# ╟─9cecd9a6-4c58-11eb-22dc-33cd2559d815
# ╟─c6d236da-4c58-11eb-2714-3f5c43583a3d
# ╠═3253ab74-4c58-11eb-178e-83ea8aba9c8f
# ╠═32593936-4c58-11eb-174c-0bb20d93dde5
# ╠═fcfb511c-5a75-11eb-2181-33d147ab1806
# ╠═1882840a-5a76-11eb-3392-81c2915487f5
# ╠═3fc787d6-5a76-11eb-06e9-5378d27ce011
# ╟─ebb09172-4c58-11eb-1cc9-91193c57677d
# ╟─824849ba-022f-4891-93dc-cc1d1be411ac
# ╟─ee9069e2-63a7-11eb-12b9-97ae270506f4
# ╠═dedeb380-1075-432a-88d5-2ca172aaa2f7
# ╠═3de1f1aa-58bd-11eb-2ffc-0de292b13840
# ╠═5f47cdf0-58be-11eb-1bca-a3d0941b9bea
# ╟─c1e377c4-64a4-11eb-3e7f-b163cb465057
# ╟─dc6a4870-64a4-11eb-328f-41e5dbcd0a3b
# ╠═cb20fffe-58cf-11eb-1b65-49699f2d3699
# ╟─41b19e20-4d0f-11eb-1c3c-572cc5243d99
# ╟─00121c4e-64a5-11eb-2993-61c695c4e6a1
# ╟─16ec4ee4-64a5-11eb-26f3-15313b8b5acb
# ╟─2e7973b6-4d0f-11eb-107c-cdaf349428c0

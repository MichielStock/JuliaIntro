### A Pluto.jl notebook ###
# v0.14.8

using Markdown
using InteractiveUtils

# ╔═╡ bf1385da-4ac2-11eb-3992-41abac921370
using Plots

# ╔═╡ e97e5984-4ab9-11eb-3efb-9f54c6c307dd
# edit the code below to set your name and UGent username

student = (name = "Jenke Janssen", email = "Jenke.Janssen@UGent.be");

# press the ▶ button in the bottom right of this cell to run your edits
# or use Shift+Enter

# you might need to wait until all other cells in this notebook have completed running. 
# scroll down the page to see what's up

# ╔═╡ f089cbaa-4ab9-11eb-09d1-05f49911487f
begin
	using PlutoUI;	
	md"""

	Submission by: **_$(student.name)_**
	"""
end

# ╔═╡ fd21a9fa-4ab9-11eb-05e9-0d0963826b9f
md"""
# Notebook 1: Getting up and running

First of all, welcome to the course, **$(student[:name])**! We hope you enjoy the ride.
""" 

# ╔═╡ 0f47f5b2-4aba-11eb-2e5a-b10407e3f928


# ╔═╡ 23d3c9cc-4abd-11eb-0cb0-21673effee6c
md"""## 1. The basics
*From zero to newbie.*
"""

# ╔═╡ 62c3b076-4ab7-11eb-0cf2-25cdf7d2540d
md"""
Let's get started with the basics. Some mathematical operations, """

# ╔═╡ 7bf5bdbe-4ab7-11eb-0d4b-c116e02cb9d9
1 + 2       # adding integers

# ╔═╡ 83306610-4ab7-11eb-3eb5-55a465e0abb9
1.0 + 2.0   # adding floats

# ╔═╡ 3fa0a15c-5008-11eb-13b5-a91b02c1eb2d
1 + 2.0     # adding a float to an integer...

# ╔═╡ 83311b8a-4ab7-11eb-0067-e57ceabdfe9d
2 / 4       # standard division

# ╔═╡ 833dbc66-4ab7-11eb-216d-f9900f95deb8
div(2, 4)   # Computes 2/4 truncated to an integer

# ╔═╡ 8342c042-4ab7-11eb-2136-497fc9e1b9c4
2 ÷ 4       # looks nices but exactly the same!

# ╔═╡ 834d4cbc-4ab7-11eb-1f1a-df05b0c00d66
7 % 3       # get the remainder of the integer division

# ╔═╡ 8360ffac-4ab7-11eb-1162-f7a536eb0765
35 \ 7      # inverse division

# ╔═╡ 8365cb3e-4ab7-11eb-05c0-85f51cc9b018
1 // 3      # fractions, gives result as a rational

# ╔═╡ 8370eaf0-4ab7-11eb-1cd3-dfeec9341c4b
1//2 + 1//4

# ╔═╡ 50bb93e6-5a6c-11eb-0a6c-d5d749857771
2.0 + 3.0im  # complex numbers

# ╔═╡ 8383f104-4ab7-11eb-38a5-33e59b1591f6
'c'        # characters (unicode)

# ╔═╡ 8387934a-4ab7-11eb-11b2-471b08d87b31
:symbol    # symbols, mostly used for macros

# ╔═╡ 8bab2e50-5a6c-11eb-3c5f-a9f811483814
:ζ         # any LaTeX symbol

# ╔═╡ 9d2708ca-5a6c-11eb-1c0f-473f0e2b5363
:🎉        # or Unicode emoji

# ╔═╡ 8c14cb9a-4ab7-11eb-0666-b1d4aca00f97
md"variable assignment"

# ╔═╡ 93b5a126-4ab7-11eb-2f67-290ed869d44a
x = 2

# ╔═╡ 353efeea-6492-11eb-3d09-353d4dae491a
md"In the Pluto notebook environment you are currently working in, it is not possible to define the same variable in two cells. However, this is not standard Julia behaviour. You can see that redefining a variable is possible,"

# ╔═╡ 92f57780-6492-11eb-1264-bbef04a8ae99
begin
	variable1 = 2.0
	variable1 = 4.0
end;

# ╔═╡ a17ebeba-6492-11eb-07ba-f516a990affc
variable1

# ╔═╡ 3055711a-6493-11eb-252b-7f5d99115551
md"""
```julia
begin
 statement1
 statement2
end
```

Enable to wrap multiple statements, since only single-line statements are allowed in this notebook environment.

"""

# ╔═╡ 962ae6d2-4ab7-11eb-14a2-c76a2221f544
τ = 1 / 37  # unicode variable names are allowed

# ╔═╡ 98d48302-4ab7-11eb-2397-710d0ae425f7
md"""

unicode! In most Julia editing environments, unicode math symbols can be typed when starting with a '\' and hitting '[TAB]'.

"""

# ╔═╡ acb3b57a-661c-11eb-2c6a-99793a47ff29
md"""Unsure what the LaTeX name for a symbol is or how to type an emoiji? Just copy-paste it in the REPL with a `?` at the beginning, e.g., `?ζ` and it will tell you how to type it."""

# ╔═╡ cee8a766-4ab7-11eb-2bc7-898df2c9b1ff
# type \alpha  and <TAB>

# ╔═╡ e2c5b558-4ab7-11eb-09be-b354fc56cc6e
md"Operators are overrated."

# ╔═╡ ec754104-4ab7-11eb-2a44-557e4304dd43
5x         # This works

# ╔═╡ f23a2d2a-4ab7-11eb-1e26-bb2d1d19829f
md"But strings are quite essential,"

# ╔═╡ fa836e88-4ab7-11eb-0ba6-5fc7372f32ab
mystery = "life, the universe and everything"

# ╔═╡ 0138ef46-4ab8-11eb-1813-55594927d661
md"and string interpolation is performed with `$`."

# ╔═╡ 0b73d66a-4ab8-11eb-06e9-bbe95285a69f
"The answer to $mystery is $(3*2*7)"

# ╔═╡ 6b6eb954-4ab8-11eb-17f9-ef3445d359a3
md"""
Printing can be done with `println()` but in this notebook environment this does not seem to do much.
"""

# ╔═╡ 94e3eb74-4ab8-11eb-1b27-573dd2f02b1d
println("The answer to $mystery is $(3*2*7)")

# ╔═╡ 7592f8a2-4ac0-11eb-375c-61c915380eeb
md"... but take a look at the terminal window."

# ╔═╡ 97b7f7d8-61aa-11eb-2bf6-739bd5f2e941
md"So the [Stdout](https://www.computerhope.com/jargon/s/stdout.htm) is printed to the terminal window and not the notebooks. We can use the @terminal macro of our own making to circumvent this. More on macros tomorrow! What you need to know now is that the macro @terminal does some additional processing to the statement is proceeds."

# ╔═╡ dcf78e38-61a7-11eb-1ac8-9927f5dca4f2
with_terminal() do
	println("The answer to $mystery is $(3*2*7)")
end

# ╔═╡ abf00a78-4ab8-11eb-1063-1bf4905ca250
md"""
repetitions of strings can be done using the operators `*` and `^`.
This use of `*` and `^` makes sense by analogy with multiplication and exponentiation. Just as `4^3` is equivalent to `4*4*4`, we expect `"Spam"^3` to be the same as `"Spam"*"Spam"*"Spam"`, and it is.
"""

# ╔═╡ be220a48-4ab8-11eb-1cd4-db99cd9db066
breakfast = "eggs"

# ╔═╡ cadaf948-4ab8-11eb-3110-259768055e85
abetterbreakfast = "SPAM"

# ╔═╡ cadb506e-4ab8-11eb-23ed-2d5f88fd30b0
breakfast * abetterbreakfast

# ╔═╡ caf56346-4ab8-11eb-38f5-41336c5b45a7
breakfast * abetterbreakfast^3 * breakfast

# ╔═╡ 046133a8-4ab9-11eb-0591-9de27d85bbca
md"""
Lots of handy `String`-operations are available in the standard library of Julia:
"""

# ╔═╡ 0c8bc7f0-4ab9-11eb-1c73-b7ec002c4155
uppercase("Sometimes I feel like shouting.")

# ╔═╡ 0f8a311e-4ab9-11eb-1b64-cd62b65c49bf
findfirst("a", "banana")

# ╔═╡ 0f8a5e94-4ab9-11eb-170b-cfec74d6ebbc
findfirst("na", "banana")

# ╔═╡ 0f96fdd6-4ab9-11eb-0e33-2719394a66ba
findnext("na", "banana", 4)  # start looking from position 4 onwards

# ╔═╡ 1f255304-4ab9-11eb-34f1-270fd5a95256
md"Unlike `Strings`, a `Char` value represents a single character and is surrounded by single quotes."

# ╔═╡ 34a18900-4ab9-11eb-17a0-1168dd9d06f9
'x'

# ╔═╡ 39a0a328-4ab9-11eb-0f37-6717095b56aa
md"
The operator `∈` (\in [TAB]) is a boolean operator that takes a character and a string and returns `true` if the first appears in the second:"

# ╔═╡ 4749f268-4ab9-11eb-15a7-579437e0bd20
'a' ∈ "banana"

# ╔═╡ 5a9bbbe6-4aba-11eb-3652-43eb7891f437


# ╔═╡ a69ead46-4abc-11eb-3d1d-eb1c73f65150
md"All binary arithmetic and bitwise operators have an updating version that assigns the result of the operation back into the left operand. The updating version of the binary operator is formed by placing a, `=`, immediately after the operator."

# ╔═╡ b482b998-4abc-11eb-36da-379010485bfa
let         # the `let`-environment creates a local workspace, x will only exist here.
	x = 1   # inplace update of x
	x += 2  # inplace update of x
	x += 2
end

# ╔═╡ 07b103ae-4abd-11eb-311b-278d1e033642
md"Similarly to Matlab, when using the REPL, Julia will print the result of every statement by default. To suppress this behavious, just end the statement with a semicolon."

# ╔═╡ 15f8b7fe-4abd-11eb-2777-8fc8bf9d342e
a = 10;  # not printed...

# ╔═╡ efae58fa-5008-11eb-32fe-c3ae588d14f2
a  # ...but still defined

# ╔═╡ 18f99e46-4abd-11eb-20a8-859cb1b12fe3
b = 20

# ╔═╡ 3a7954da-4abd-11eb-3c5b-858054b4d06b
md"""## 2. Logical statements

*From zero to one.*
"""


# ╔═╡ 8b17d538-4abd-11eb-0543-ab95c9548d6f
md"""**Boolean operators**

Julia uses `true` and `false` for Boolean variables.
"""

# ╔═╡ 29d34e64-5009-11eb-3301-f729150e17b2
I💖Julia = true 

# ╔═╡ 91a9d1a0-4abd-11eb-3337-71983f32b6ae
!true

# ╔═╡ 942d4202-4abd-11eb-1f01-dfe3df40a5b7
!false

# ╔═╡ 942dae0e-4abd-11eb-20a2-37d9c9882ba8
1 == 1

# ╔═╡ 943d9850-4abd-11eb-1cbc-a1bef988c910
2 == 1

# ╔═╡ 943de2ce-4abd-11eb-2410-31382ae9c74f
1 != 1

# ╔═╡ 9460c03c-4abd-11eb-0d60-4d8aeb5b0c1d
2 != 1

# ╔═╡ 946161f4-4abd-11eb-0ec5-df225dc140d0
1 < 10

# ╔═╡ 947d143a-4abd-11eb-067d-dff955c90407
1 > 10

# ╔═╡ 947fea8e-4abd-11eb-1d6a-2bc540f7a50e
2 <= 2  # or 2 ≤ 2  (\le<TAB>)

# ╔═╡ 948eff10-4abd-11eb-36d0-5183e882a9e2
2 >= 2  # or 2 ≥ 2  (\ge<TAB>)

# ╔═╡ 948f5032-4abd-11eb-3d1c-7da4cb64521c
# Comparisons can be chained
1 < 2 < 3

# ╔═╡ 94b520e6-4abd-11eb-3161-addf3b0e4f24
2 < 3 < 2

# ╔═╡ 94b78322-4abd-11eb-3006-454548efd164
# Logical operators
true && true

# ╔═╡ 94d28c80-4abd-11eb-08c0-717207e4c682
true || false

# ╔═╡ 9fe6e1a2-4abd-11eb-0c39-458ce94265c0
md"Likewise, we have the Boolean logic operators `&&` (AND), `||` (OR) and `⊻` (XOR, exclusive or)."

# ╔═╡ ae26ab9e-4abd-11eb-3270-33558dbdf663
true && true

# ╔═╡ b08dc886-4abd-11eb-1807-096a7e6fd6f9
true && false

# ╔═╡ b08e3a28-4abd-11eb-258a-a5a93b4b882c
true || false

# ╔═╡ b0a8dfe0-4abd-11eb-167d-2fc3974c7c92
false || false

# ╔═╡ b0a97e00-4abd-11eb-371c-e138aea17bb6
true ⊻ false

# ╔═╡ b0ccc252-4abd-11eb-048b-4bec3750bbf1
true ⊻ true

# ╔═╡ 60b066d8-5009-11eb-3b4c-8b8fa2f4831d
md"""
Chaining logic operators is frequently done in Julia as a short alternative for an `if` statement. The idea is if you use an `&&` statement, the second part is only evaluated if the first part is true! The inverse is true for `||`, where the second part is only evaluated if the first part is false."""

# ╔═╡ b8b7c0f6-5009-11eb-1eb7-0be723a88863
let
	x = 12
	(x > 10) && (x -= 5)  # I am evaluated!
	(x > 4) || (x *= 2)   # I am not... 
	x
end

# ╔═╡ 1c22b880-4abf-11eb-3f18-756c1198ccad
md"## 3. Control flow"

# ╔═╡ 37086212-4abf-11eb-3ec9-7f8dae57121e
md"The `if`, `else`, `elseif`-statement is instrumental to any programming language./ Note that control flow is ended with an `end` statement. In constrast to Python, tabs are only for clarity but do not impact functionality."

# ╔═╡ 489421d8-4abf-11eb-0d5e-fd779cc918a1
if 4 > 3
  'A'
elseif 3 > 4
  'B'
else
  'C'
end

# ╔═╡ 6736dafe-4abf-11eb-1fce-0716d2b7f4a8
md"""
Julia allows for some very condense control flow structures.
y = `condition` ? `valueiftrue` : `valueiffalse`
"""

# ╔═╡ c4c09393-c146-409a-a022-4a6da6fa7caf
md"Complete the clip function: $\max(0, \min(1, x))$ for a given $x$, **without** making use of the functions `min` and `max`."

# ╔═╡ 0c693c24-4ac0-11eb-2329-c743dcc5039d
clip(x) = missing

# ╔═╡ 035a53ba-4ac1-11eb-3c34-b50a803b7b7d
if !ismissing(clip(3))
	md"Oh yeah! 🎉 You defined your first function in Julia. More on this later."
end

# ╔═╡ 2a5fca7c-4ac0-11eb-33a3-23d972ca27b8
md"## 4. Looping"

# ╔═╡ 3896642a-4ac0-11eb-2c7c-4f376ab82217
characters = ["Harry", "Ron", "Hermione"]

# ╔═╡ 3ef3faf8-4ac0-11eb-1965-fd23413e29f3
with_terminal() do
	for char in characters
	  println("Character $char")
	end
end

# ╔═╡ 3916f50e-661d-11eb-0829-cb3821836fdf
md"We can use `enumerate` to generate an iterator of tuples containing the index and the values of an iterator."

# ╔═╡ 4118016e-4ac0-11eb-18bf-5de326782c87
with_terminal() do
	for (i, char) in enumerate(characters)
	  println("$i. $char")
	end
end

# ╔═╡ 4119fbca-4ac0-11eb-1ea9-0bdd324214c5
pets = ["Hedwig", "Pig", "Crookhanks"]

# ╔═╡ 5ebe25c0-661d-11eb-389b-3d81570f7cf0
md"`zip` binds two or more iterators and yield tuples of the pairs."

# ╔═╡ 4139bf3c-4ac0-11eb-2b63-77a513149351
with_terminal() do
	for (char, pet) in zip(characters, pets)
	  println("$char has $pet as a pet")
	end
end

# ╔═╡ a1d4127c-4ac0-11eb-116f-79c6ee58f524
md"Strings can also be looped"

# ╔═╡ a93b28e6-4ac0-11eb-074f-a7b64f43a194
getme = "a shrubbery"

# ╔═╡ ac35b796-4ac0-11eb-3bc5-5ff4350d5452
with_terminal() do
	for letter in getme  # or, equivalently, use `∈` instead of `in` to look like a mathematician!
	  println("$letter")
	end
end

# ╔═╡ b18e55ae-4ac0-11eb-1455-21b83b7c61d5
with_terminal() do 
	n = 16757676187786;
	steps = 0
	while n > 1
	  println(n)
	  steps = steps +1
	  if iseven(n)
		n = div(n, 2)
	  else
		n = 3n + 1
	  end
	end
	n, steps
end

# ╔═╡ ec4190a8-4ac0-11eb-0421-398f063775bb
md"(Mathematical note: [they got closer to cracking this one](https://www.quantamagazine.org/mathematician-terence-tao-and-the-collatz-conjecture-20191211/?mc_cid=a3adbffb9f&mc_eid=41ed2fca13).)"

# ╔═╡ 7dce10be-500c-11eb-12cf-43f6989aae91
md"A useful trick when working with loops is using `break` and `continue` statements. If a `break` is encountered, the loop will immediately be exited. A `continue` statement will only skip the rest of the current iteration but will not halt the loop."

# ╔═╡ bafbe0ea-500c-11eb-10be-75d1738d42a2
let
	i = 1
	while true  # infinite loop
		if i^2 ≥ 231
			break
		end
		i += 1
	end
	i  # first integer with a square larger than 231
end

# ╔═╡ 2033383e-500d-11eb-3aea-cdc1e90dad2c
let
	s = 0
	for i in 1:100
		!isodd(i) && continue
		s += i
	end
	s # sum of all odd numbers between 1 and 100
end

# ╔═╡ fdb67aba-4ac0-11eb-1d4a-c354de54baa9
md"""## 5. Functions
Julia puts the fun in functions. User-defined functions can be declared as follows,
"""

# ╔═╡ 28f47a24-4ac1-11eb-271f-6b4de7311db3
function square(x)
  result = x * x
  return result
end

# ╔═╡ 47338c78-4ac1-11eb-04d6-35c2361eaea6
md"A more condensed version of of `square(x)`."

# ╔═╡ 463689b0-4ac1-11eb-1b0f-b7a239011c5c
s(x) = x * x

# ╔═╡ 52bfff04-4ac1-11eb-1216-25eedd9184c3
md"Passing an array to a function that takes a single element as argument takes a special syntax. By putting a `.` before the brackets, the function is executed on all the elements of the Array. More on this in **part2: collections**."

# ╔═╡ 61846dae-4ac1-11eb-389a-4fbe3f6145b1
s([1, 2, 3, 4, 5])   # Multiplication is not defined for Arrays

# ╔═╡ 6321ae1a-4ac1-11eb-04cb-33e939694874
s.([1, 2, 3, 4, 5])  # This is an elements-wise execution of s()

# ╔═╡ 3eda5d12-5a6e-11eb-3264-9925907c85b5
md"Maybe you are of the opinion that squaring a vector should automatically involve squaring the elements, or you might want to concatenate strings using `+`. Tomorrow we will learn to 'overload' functions to induce specific behaviour for specific datatypes!"

# ╔═╡ 7b874424-4ac1-11eb-2d4e-0b4607559b8f
md"""Keyword arguments are defined using a semicolon in the back signature and a default value can be assigned. "Keywords" assigned before a semicolon (`;`) are default values but their keywords are not ignored."""

# ╔═╡ 86defe2a-4ac1-11eb-3c01-c5e671877212
safelog(x, offset=0.1; base=10) = log(x + offset) / log(base)

# ╔═╡ 886512de-4ac1-11eb-00e1-73292ec23277
safelog(0)

# ╔═╡ 88678820-4ac1-11eb-272e-0df61e418900
safelog(0, 0.01)

# ╔═╡ 888dee1e-4ac1-11eb-264d-cd4a4f30f498
safelog(0, 0.01, base=2)

# ╔═╡ 8acb086c-4ac1-11eb-1715-756fde34b38f
md"""When functions have a variable number of arguments, one can use the *slurping* `...` operator to denote a variable number of arguments. The argument will be treated as a collection. For example"""

# ╔═╡ 944e1aaa-4ac1-11eb-0e23-41b1c5d0e889
function mymean(X...)
  m = 0.0
  for x in X
	m += x
  end
  return m / length(X)
end

# ╔═╡ 9d4e11be-4ac1-11eb-1fa0-13f1fe60c3bc
mymean(1, 3, 5)

# ╔═╡ 9d514ef6-4ac1-11eb-25fc-ffaa2dcc9b02
mymean(1, 3, 5, 7)

# ╔═╡ a0781222-4ac1-11eb-3425-d9b9603487f3
md"Similarly, the *splatting* operator can be used to split a collection into its individual elements."

# ╔═╡ a6b95d62-4ac1-11eb-0c93-7fa0f6a120d5
c = [1.0, 3.0, 5.0];

# ╔═╡ ab006064-4ac1-11eb-32be-6557b8d45f32
mymean(c...)

# ╔═╡ b0603566-4ac1-11eb-17bc-3b63cd2aa1e9
md"""When unsure of what a function does, in the REPL the documentation can be viewed by adding a "?" in front of the function. Here, in the Pluto environment, put the cursor in the function of interest and open the documentation tab (look on your right)."""

# ╔═╡ beafce06-4ac1-11eb-2431-1ffeba45716b
sort

# ╔═╡ ec487488-4ac1-11eb-1be3-a93e41f78bf3
md"""
For a lot of standard Julia functions a in-place version is defined. In-place means that the function changes one of the input arguments of the function. As an example, `sort()` sorts and returns the array passed as argument, it does not change the original array. In contrast, `sort!()` is the inplace version of sort and directly sorts the array passed as argument.
"""

# ╔═╡ f88fee6c-4ac1-11eb-1671-43493122f061
my_unsorted_list = [4, 5, 9, 7, 1, 9]

# ╔═╡ fa759f92-4ac1-11eb-0d72-1f9d6d38a831
sort(my_unsorted_list)

# ╔═╡ fa7ba458-4ac1-11eb-2ca1-59ff3c032b26
my_unsorted_list

# ╔═╡ fa9b3266-4ac1-11eb-153a-87c6a1124890
sort!(my_unsorted_list)

# ╔═╡ fa9d43b2-4ac1-11eb-33fc-a37503cedabf
my_unsorted_list

# ╔═╡ 0dbe0c34-500e-11eb-2633-67d8dc6b24c8
md"""
Functions are first-class and work just like any other variable! For example, you can give a function as an input in another function. 

In some cases, you might want to define an **anonymous function**, without given them a name:"""

# ╔═╡ 900da226-500e-11eb-3f1c-5582ed0cf749
afun = x -> 2x^2 - 2x + 4

# ╔═╡ b24bee9a-500e-11eb-2130-45b78bbebdec
afun(4)  # can be used as a regular function

# ╔═╡ c8cf6520-500e-11eb-2dd3-4507a3994a83
md"""
A particular powerful tool is creating a **pipeline**, i.e., using the output of a previous function as input of the next one. This can be done using the `|>` syntax."""

# ╔═╡ 19402512-500f-11eb-3ea7-c3d1c52025d6
π/4 |> sin |> inv 

# ╔═╡ 6dc0eaae-500f-11eb-3051-37d870366201
md"The `.` syntax also works here and it is often useful to combine with anonymous functions."

# ╔═╡ 8b57c506-500f-11eb-3114-55785eb593a7
1:1000 .|> (x->x^2) .|> inv |> sum |> (x->6x) |> sqrt  # poor man's pi

# ╔═╡ fd171e0e-4ac1-11eb-09ea-337d17500149
md"Specific functions can be generated if you have more information on the input type.
This is called multiple dispatch.

The `::` operator attaches type annotations to expressions and variables.

How does the documentation for the function square look like after you executed the cell below?"

# ╔═╡ 10e71260-4ac2-11eb-1069-55613ee7df0a
function square(x::Float64)
  println("using function with floats")
  result = x * x
  return result
end

# ╔═╡ 3e433ab4-4ac1-11eb-2178-53b7220fa9ab
square(2)

# ╔═╡ 46112c44-4ac1-11eb-2ad8-030406c7cf67
square(2.0)

# ╔═╡ 461489fa-4ac1-11eb-0596-1d3bedb61778
square("ni")   # the multiplication of strings is defined as a concatenation

# ╔═╡ 1c0230f8-4ac2-11eb-32aa-e7a4b2ae9cff
with_terminal() do
	square(4) #... nothing is printed, obviously
end

# ╔═╡ 226417c2-4ac2-11eb-2914-196461e2b40e
with_terminal() do
	square(4.)
end

# ╔═╡ 3daf4fa6-4ac2-11eb-0541-b98c2e97dfe4
md"More about types in the next section!"

# ╔═╡ a777f624-4f2f-11eb-0595-432ea5115a2d
md"## Intermezzo: Types"

# ╔═╡ abb7bf4e-4f2f-11eb-1dde-abf1cb0fb8b4
 md"""All Julia objects, both those already defined as well as those you might make yourself, have a type. The type system is the secret sauce, allowing Julia to be fast because code can be specialized for a particular combination of types. It is also supremely useful in conjunction with *multiple dispatch*, in which functions work differently depending on which types you feed into them. In one of the exercises at the end of this notebook you will get a taster of how multiple dispatch can be used. A function behaviour changes depending on the type of the arguments. Day 2 will mainly focus on the type system, so in what follows, a concise introduction is given to types."""

# ╔═╡ b63533e8-4f2f-11eb-3811-5f43fcaa2a9e
begin
	number = 42
	str = "mice"
	n = 0.9
	A = [1 2; 3 4]
end;

# ╔═╡ b730b7b8-4f2f-11eb-3216-613c6100fb9c
typeof(number)

# ╔═╡ b99eb16c-4f2f-11eb-0f1e-5d2b1244689f
typeof(str)

# ╔═╡ bc67fc50-4f2f-11eb-2209-bf35df0e8c27
typeof(n)

# ╔═╡ bf40274a-4f2f-11eb-0086-d3502f67161b
typeof(A)

# ╔═╡ c48e035c-4f2f-11eb-12c7-576aadca7511
md"**multiple dispatch**"

# ╔═╡ c8435740-4f2f-11eb-3046-3d45d5e0e805
md"Multiple dispatch is a concept where the behaviour of a function can be specified differently according to the type of the input arguments. Let's us look at an example,"

# ╔═╡ cacb7254-4f2f-11eb-1daa-1bc04678835c
begin 
	translate(xy::Array) = xy .+ [1 3]
	translate(s::String) = Markdown.parse("[Ctrl + click here](https://translate.google.com/?sl=en&tl=nl&text=$(s)&op=translate)")
	translate(anything::Any) = "I'm lost in translation..."
end

# ╔═╡ cc48bc9a-4f2f-11eb-134c-71bd8a944943
translate(1.0)

# ╔═╡ d9f28c04-4f2f-11eb-0255-1965fb8f07b5
translate([0.0 0.0])

# ╔═╡ dc1dbe90-4f2f-11eb-05ce-c1fe46ae14dd
translate("Hi how are you?")

# ╔═╡ de48a3f6-4f2f-11eb-314b-493546c37a21
 md"A great deal of time will be spend on the julia's time system in day 2. So do not worry if this still feels vague. Just **remember** that all objects have a type and the behaviour of a function can vary depending on the type of the input arguments."

# ╔═╡ 6da71180-4ac2-11eb-1cac-410bd1cce70c
md"""## 6. Macros
Macros provide a method to include generated code in the final body of a program. It is a way of generating a new output expression, given an unevaluated input expression. When your Julia program runs, it first parses and evaluates the macro, and the processed code produced by the macro is eventually evaluated like an ordinary expression.

Some nifty basic macros are `@time` and `@show`. `@time` prints the cpu time and memory allocations of an expression.
"""

# ╔═╡ 85b96ff0-4ac2-11eb-077f-cf4aad8a3c24
with_terminal() do 
	@time square(10)
end

# ╔═╡ a11c2898-4ac2-11eb-24d3-6f8060b5fd65
md"""The `@show` macro is often useful for debugging purposes. It displays both the expression to be evaluated and its result, finally returning the value of the result."""

# ╔═╡ a686e67e-4ac2-11eb-228e-23524a3ddc59
with_terminal() do 
	@show 1 + 1
end

# ╔═╡ d50cced2-500d-11eb-2dcc-21fc50825f43
md"We will provide more examples tomorrow!"

# ╔═╡ ad156892-4ac2-11eb-3634-a3783231e5a1
md"""## 7. Plotting

Quite essential for scientific programming is the visualisation of the results. `Plots` is the Julia package that handles a lot of the visualisation. `rand(10)`, returns an array of 10 random floats between 0 and 1.
"""

# ╔═╡ d779956a-4ac2-11eb-39de-4b3cecace452
md"""When loading in a package for the first time Julia will have to precompile this package, hence this step can take some time."""

# ╔═╡ c7d2a048-4ac2-11eb-3902-b7c8505096ae
begin 
	plot(1:10, rand(10), label="first")
	plot!(1:10, rand(10), label="second") # adding to current figure using plot!

	scatter!([1:10], randn(10), label="scatter")

	xlabel!("x")
	ylabel!("f(x)")
	title!("My pretty Julia plot")
end

# ╔═╡ cf35b2b2-4ac2-11eb-1ae6-5d3c108210df
plot(0:0.1:10, x -> sin(x) / x, xlabel="x", ylabel="sin(x)/x", color=:red, marker=:square, legend=:none) 
# notice the use of a symbol as an argument !

# ╔═╡ d1010f88-4ac2-11eb-0fa9-0902fef0cf9f
contour(-5:0.1:5, -10:0.1:10, (x, y) -> 3x^2-4y^2 + x*y/6)

# ╔═╡ 0e63d722-4ac3-11eb-3740-d31b47a77912
md"""### 8. Exercises"""

# ╔═╡ 900c4cb6-d594-4de1-a93f-f890377dad5f
md"""
Implement Stirling's approximation of a factorial:

$$n!\sim {\sqrt {2\pi n}}\left({\frac {n}{e}}\right)^{n},$$
"""

# ╔═╡ a3969292-57ff-11eb-059b-e9e931a30dc1
stirling(n) = missing

# ╔═╡ adb47b64-5af8-11eb-1b32-57cbe5d47200
md"Make a plot of this function, comparing with `factorial`."

# ╔═╡ b1af96ea-5af8-11eb-0d08-f59a4c2b686c


# ╔═╡ b4118bfa-5af8-11eb-0aca-cddef8e191ee


# ╔═╡ e2583a06-6479-11eb-091b-8be70024930d


# ╔═╡ c4d03faa-647d-11eb-3a84-d7b2d53e4720


# ╔═╡ c42f69f6-647d-11eb-143b-2f0ab33616e7


# ╔═╡ 8ab56dcc-6489-11eb-16a4-b7d12003ed99


# ╔═╡ 0507186a-647a-11eb-07cf-ebf32bdff5b0


# ╔═╡ 27af863f-3150-4906-922b-aa96d845e03b


# ╔═╡ Cell order:
# ╠═f089cbaa-4ab9-11eb-09d1-05f49911487f
# ╠═e97e5984-4ab9-11eb-3efb-9f54c6c307dd
# ╟─fd21a9fa-4ab9-11eb-05e9-0d0963826b9f
# ╠═0f47f5b2-4aba-11eb-2e5a-b10407e3f928
# ╟─23d3c9cc-4abd-11eb-0cb0-21673effee6c
# ╟─62c3b076-4ab7-11eb-0cf2-25cdf7d2540d
# ╠═7bf5bdbe-4ab7-11eb-0d4b-c116e02cb9d9
# ╠═83306610-4ab7-11eb-3eb5-55a465e0abb9
# ╠═3fa0a15c-5008-11eb-13b5-a91b02c1eb2d
# ╠═83311b8a-4ab7-11eb-0067-e57ceabdfe9d
# ╠═833dbc66-4ab7-11eb-216d-f9900f95deb8
# ╠═8342c042-4ab7-11eb-2136-497fc9e1b9c4
# ╠═834d4cbc-4ab7-11eb-1f1a-df05b0c00d66
# ╠═8360ffac-4ab7-11eb-1162-f7a536eb0765
# ╠═8365cb3e-4ab7-11eb-05c0-85f51cc9b018
# ╠═8370eaf0-4ab7-11eb-1cd3-dfeec9341c4b
# ╠═50bb93e6-5a6c-11eb-0a6c-d5d749857771
# ╠═8383f104-4ab7-11eb-38a5-33e59b1591f6
# ╠═8387934a-4ab7-11eb-11b2-471b08d87b31
# ╠═8bab2e50-5a6c-11eb-3c5f-a9f811483814
# ╠═9d2708ca-5a6c-11eb-1c0f-473f0e2b5363
# ╟─8c14cb9a-4ab7-11eb-0666-b1d4aca00f97
# ╠═93b5a126-4ab7-11eb-2f67-290ed869d44a
# ╟─353efeea-6492-11eb-3d09-353d4dae491a
# ╠═92f57780-6492-11eb-1264-bbef04a8ae99
# ╠═a17ebeba-6492-11eb-07ba-f516a990affc
# ╟─3055711a-6493-11eb-252b-7f5d99115551
# ╠═962ae6d2-4ab7-11eb-14a2-c76a2221f544
# ╟─98d48302-4ab7-11eb-2397-710d0ae425f7
# ╟─acb3b57a-661c-11eb-2c6a-99793a47ff29
# ╠═cee8a766-4ab7-11eb-2bc7-898df2c9b1ff
# ╟─e2c5b558-4ab7-11eb-09be-b354fc56cc6e
# ╠═ec754104-4ab7-11eb-2a44-557e4304dd43
# ╟─f23a2d2a-4ab7-11eb-1e26-bb2d1d19829f
# ╠═fa836e88-4ab7-11eb-0ba6-5fc7372f32ab
# ╟─0138ef46-4ab8-11eb-1813-55594927d661
# ╠═0b73d66a-4ab8-11eb-06e9-bbe95285a69f
# ╟─6b6eb954-4ab8-11eb-17f9-ef3445d359a3
# ╠═94e3eb74-4ab8-11eb-1b27-573dd2f02b1d
# ╟─7592f8a2-4ac0-11eb-375c-61c915380eeb
# ╟─97b7f7d8-61aa-11eb-2bf6-739bd5f2e941
# ╠═dcf78e38-61a7-11eb-1ac8-9927f5dca4f2
# ╟─abf00a78-4ab8-11eb-1063-1bf4905ca250
# ╠═be220a48-4ab8-11eb-1cd4-db99cd9db066
# ╠═cadaf948-4ab8-11eb-3110-259768055e85
# ╠═cadb506e-4ab8-11eb-23ed-2d5f88fd30b0
# ╠═caf56346-4ab8-11eb-38f5-41336c5b45a7
# ╟─046133a8-4ab9-11eb-0591-9de27d85bbca
# ╠═0c8bc7f0-4ab9-11eb-1c73-b7ec002c4155
# ╠═0f8a311e-4ab9-11eb-1b64-cd62b65c49bf
# ╠═0f8a5e94-4ab9-11eb-170b-cfec74d6ebbc
# ╠═0f96fdd6-4ab9-11eb-0e33-2719394a66ba
# ╟─1f255304-4ab9-11eb-34f1-270fd5a95256
# ╠═34a18900-4ab9-11eb-17a0-1168dd9d06f9
# ╟─39a0a328-4ab9-11eb-0f37-6717095b56aa
# ╠═4749f268-4ab9-11eb-15a7-579437e0bd20
# ╟─5a9bbbe6-4aba-11eb-3652-43eb7891f437
# ╟─a69ead46-4abc-11eb-3d1d-eb1c73f65150
# ╠═b482b998-4abc-11eb-36da-379010485bfa
# ╟─07b103ae-4abd-11eb-311b-278d1e033642
# ╠═15f8b7fe-4abd-11eb-2777-8fc8bf9d342e
# ╠═efae58fa-5008-11eb-32fe-c3ae588d14f2
# ╠═18f99e46-4abd-11eb-20a8-859cb1b12fe3
# ╟─3a7954da-4abd-11eb-3c5b-858054b4d06b
# ╟─8b17d538-4abd-11eb-0543-ab95c9548d6f
# ╠═29d34e64-5009-11eb-3301-f729150e17b2
# ╠═91a9d1a0-4abd-11eb-3337-71983f32b6ae
# ╠═942d4202-4abd-11eb-1f01-dfe3df40a5b7
# ╠═942dae0e-4abd-11eb-20a2-37d9c9882ba8
# ╠═943d9850-4abd-11eb-1cbc-a1bef988c910
# ╠═943de2ce-4abd-11eb-2410-31382ae9c74f
# ╠═9460c03c-4abd-11eb-0d60-4d8aeb5b0c1d
# ╠═946161f4-4abd-11eb-0ec5-df225dc140d0
# ╠═947d143a-4abd-11eb-067d-dff955c90407
# ╠═947fea8e-4abd-11eb-1d6a-2bc540f7a50e
# ╠═948eff10-4abd-11eb-36d0-5183e882a9e2
# ╠═948f5032-4abd-11eb-3d1c-7da4cb64521c
# ╠═94b520e6-4abd-11eb-3161-addf3b0e4f24
# ╠═94b78322-4abd-11eb-3006-454548efd164
# ╠═94d28c80-4abd-11eb-08c0-717207e4c682
# ╟─9fe6e1a2-4abd-11eb-0c39-458ce94265c0
# ╠═ae26ab9e-4abd-11eb-3270-33558dbdf663
# ╠═b08dc886-4abd-11eb-1807-096a7e6fd6f9
# ╠═b08e3a28-4abd-11eb-258a-a5a93b4b882c
# ╠═b0a8dfe0-4abd-11eb-167d-2fc3974c7c92
# ╠═b0a97e00-4abd-11eb-371c-e138aea17bb6
# ╠═b0ccc252-4abd-11eb-048b-4bec3750bbf1
# ╟─60b066d8-5009-11eb-3b4c-8b8fa2f4831d
# ╠═b8b7c0f6-5009-11eb-1eb7-0be723a88863
# ╟─1c22b880-4abf-11eb-3f18-756c1198ccad
# ╟─37086212-4abf-11eb-3ec9-7f8dae57121e
# ╠═489421d8-4abf-11eb-0d5e-fd779cc918a1
# ╟─6736dafe-4abf-11eb-1fce-0716d2b7f4a8
# ╟─c4c09393-c146-409a-a022-4a6da6fa7caf
# ╠═0c693c24-4ac0-11eb-2329-c743dcc5039d
# ╟─035a53ba-4ac1-11eb-3c34-b50a803b7b7d
# ╟─2a5fca7c-4ac0-11eb-33a3-23d972ca27b8
# ╠═3896642a-4ac0-11eb-2c7c-4f376ab82217
# ╠═3ef3faf8-4ac0-11eb-1965-fd23413e29f3
# ╟─3916f50e-661d-11eb-0829-cb3821836fdf
# ╠═4118016e-4ac0-11eb-18bf-5de326782c87
# ╠═4119fbca-4ac0-11eb-1ea9-0bdd324214c5
# ╟─5ebe25c0-661d-11eb-389b-3d81570f7cf0
# ╠═4139bf3c-4ac0-11eb-2b63-77a513149351
# ╟─a1d4127c-4ac0-11eb-116f-79c6ee58f524
# ╠═a93b28e6-4ac0-11eb-074f-a7b64f43a194
# ╠═ac35b796-4ac0-11eb-3bc5-5ff4350d5452
# ╠═b18e55ae-4ac0-11eb-1455-21b83b7c61d5
# ╟─ec4190a8-4ac0-11eb-0421-398f063775bb
# ╟─7dce10be-500c-11eb-12cf-43f6989aae91
# ╠═bafbe0ea-500c-11eb-10be-75d1738d42a2
# ╠═2033383e-500d-11eb-3aea-cdc1e90dad2c
# ╟─fdb67aba-4ac0-11eb-1d4a-c354de54baa9
# ╠═28f47a24-4ac1-11eb-271f-6b4de7311db3
# ╠═3e433ab4-4ac1-11eb-2178-53b7220fa9ab
# ╠═46112c44-4ac1-11eb-2ad8-030406c7cf67
# ╠═461489fa-4ac1-11eb-0596-1d3bedb61778
# ╟─47338c78-4ac1-11eb-04d6-35c2361eaea6
# ╠═463689b0-4ac1-11eb-1b0f-b7a239011c5c
# ╟─52bfff04-4ac1-11eb-1216-25eedd9184c3
# ╠═61846dae-4ac1-11eb-389a-4fbe3f6145b1
# ╠═6321ae1a-4ac1-11eb-04cb-33e939694874
# ╟─3eda5d12-5a6e-11eb-3264-9925907c85b5
# ╟─7b874424-4ac1-11eb-2d4e-0b4607559b8f
# ╠═86defe2a-4ac1-11eb-3c01-c5e671877212
# ╠═886512de-4ac1-11eb-00e1-73292ec23277
# ╠═88678820-4ac1-11eb-272e-0df61e418900
# ╠═888dee1e-4ac1-11eb-264d-cd4a4f30f498
# ╟─8acb086c-4ac1-11eb-1715-756fde34b38f
# ╠═944e1aaa-4ac1-11eb-0e23-41b1c5d0e889
# ╠═9d4e11be-4ac1-11eb-1fa0-13f1fe60c3bc
# ╠═9d514ef6-4ac1-11eb-25fc-ffaa2dcc9b02
# ╟─a0781222-4ac1-11eb-3425-d9b9603487f3
# ╠═a6b95d62-4ac1-11eb-0c93-7fa0f6a120d5
# ╠═ab006064-4ac1-11eb-32be-6557b8d45f32
# ╟─b0603566-4ac1-11eb-17bc-3b63cd2aa1e9
# ╠═beafce06-4ac1-11eb-2431-1ffeba45716b
# ╟─ec487488-4ac1-11eb-1be3-a93e41f78bf3
# ╠═f88fee6c-4ac1-11eb-1671-43493122f061
# ╠═fa759f92-4ac1-11eb-0d72-1f9d6d38a831
# ╠═fa7ba458-4ac1-11eb-2ca1-59ff3c032b26
# ╠═fa9b3266-4ac1-11eb-153a-87c6a1124890
# ╠═fa9d43b2-4ac1-11eb-33fc-a37503cedabf
# ╟─0dbe0c34-500e-11eb-2633-67d8dc6b24c8
# ╠═900da226-500e-11eb-3f1c-5582ed0cf749
# ╠═b24bee9a-500e-11eb-2130-45b78bbebdec
# ╟─c8cf6520-500e-11eb-2dd3-4507a3994a83
# ╠═19402512-500f-11eb-3ea7-c3d1c52025d6
# ╟─6dc0eaae-500f-11eb-3051-37d870366201
# ╠═8b57c506-500f-11eb-3114-55785eb593a7
# ╟─fd171e0e-4ac1-11eb-09ea-337d17500149
# ╠═10e71260-4ac2-11eb-1069-55613ee7df0a
# ╠═1c0230f8-4ac2-11eb-32aa-e7a4b2ae9cff
# ╠═226417c2-4ac2-11eb-2914-196461e2b40e
# ╟─3daf4fa6-4ac2-11eb-0541-b98c2e97dfe4
# ╟─a777f624-4f2f-11eb-0595-432ea5115a2d
# ╟─abb7bf4e-4f2f-11eb-1dde-abf1cb0fb8b4
# ╠═b63533e8-4f2f-11eb-3811-5f43fcaa2a9e
# ╠═b730b7b8-4f2f-11eb-3216-613c6100fb9c
# ╠═b99eb16c-4f2f-11eb-0f1e-5d2b1244689f
# ╠═bc67fc50-4f2f-11eb-2209-bf35df0e8c27
# ╠═bf40274a-4f2f-11eb-0086-d3502f67161b
# ╟─c48e035c-4f2f-11eb-12c7-576aadca7511
# ╟─c8435740-4f2f-11eb-3046-3d45d5e0e805
# ╠═cacb7254-4f2f-11eb-1daa-1bc04678835c
# ╠═cc48bc9a-4f2f-11eb-134c-71bd8a944943
# ╠═d9f28c04-4f2f-11eb-0255-1965fb8f07b5
# ╠═dc1dbe90-4f2f-11eb-05ce-c1fe46ae14dd
# ╟─de48a3f6-4f2f-11eb-314b-493546c37a21
# ╟─6da71180-4ac2-11eb-1cac-410bd1cce70c
# ╠═85b96ff0-4ac2-11eb-077f-cf4aad8a3c24
# ╟─a11c2898-4ac2-11eb-24d3-6f8060b5fd65
# ╠═a686e67e-4ac2-11eb-228e-23524a3ddc59
# ╟─d50cced2-500d-11eb-2dcc-21fc50825f43
# ╟─ad156892-4ac2-11eb-3634-a3783231e5a1
# ╠═bf1385da-4ac2-11eb-3992-41abac921370
# ╟─d779956a-4ac2-11eb-39de-4b3cecace452
# ╠═c7d2a048-4ac2-11eb-3902-b7c8505096ae
# ╠═cf35b2b2-4ac2-11eb-1ae6-5d3c108210df
# ╠═d1010f88-4ac2-11eb-0fa9-0902fef0cf9f
# ╟─0e63d722-4ac3-11eb-3740-d31b47a77912
# ╟─900c4cb6-d594-4de1-a93f-f890377dad5f
# ╠═a3969292-57ff-11eb-059b-e9e931a30dc1
# ╟─adb47b64-5af8-11eb-1b32-57cbe5d47200
# ╠═b1af96ea-5af8-11eb-0d08-f59a4c2b686c
# ╠═b4118bfa-5af8-11eb-0aca-cddef8e191ee
# ╟─e2583a06-6479-11eb-091b-8be70024930d
# ╠═c4d03faa-647d-11eb-3a84-d7b2d53e4720
# ╟─c42f69f6-647d-11eb-143b-2f0ab33616e7
# ╠═8ab56dcc-6489-11eb-16a4-b7d12003ed99
# ╟─0507186a-647a-11eb-07cf-ebf32bdff5b0
# ╠═27af863f-3150-4906-922b-aa96d845e03b

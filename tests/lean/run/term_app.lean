inductive term
| const : string → term
| app   : string → list term → term

/- TODO(Leo): remove after we fix bug in lemma generator. -/
set_option eqn_compiler.lemmas false

mutual def num_consts, num_consts_lst
with num_consts : term → nat
| (term.const n)  := 1
| (term.app n ts) := num_consts_lst ts
with num_consts_lst : list term → nat
| []      := 0
| (t::ts) := num_consts t + num_consts_lst ts

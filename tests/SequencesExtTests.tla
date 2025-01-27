------------------------- MODULE SequencesExtTests -------------------------
EXTENDS Sequences, SequencesExt, Naturals, TLC, FiniteSets

ASSUME(ToSet(<<>>) = {})
ASSUME(ToSet(<<1>>) = {1})
ASSUME(ToSet(<<1,1>>) = {1})
ASSUME(ToSet(<<1,2,3>>) = {1,2,3})
ASSUME(ToSet([i \in 1..10 |-> 42]) = {42})
ASSUME(ToSet([i \in 1..10 |-> i]) = 1..10)
ASSUME(ToSet(Tail([i \in 1..10 |-> i])) = 2..10)
ASSUME(ToSet([i \in 0..9 |-> 42]) = {42})

ASSUME(IsInjective(<<>>))
ASSUME(IsInjective(<<1>>))
ASSUME(IsInjective(<<1,2,3>>))
ASSUME(~IsInjective(<<1,1>>))
ASSUME(~IsInjective(<<1,1,2,3>>))

ASSUME(IsInjective([i \in 1..10 |-> i]))
ASSUME(IsInjective([i \in 1..10 |-> {i}]))
ASSUME(IsInjective([i \in 1..10 |-> {i}]))
ASSUME(~IsInjective([i \in 1..10 |-> {1,2,3}]))

ASSUME(SetToSeq({}) = <<>>)
ASSUME(SetToSeq({1}) = <<1>>)
ASSUME(LET s == {"t","l","a","p","l","u","s"}
           seq == SetToSeq(s)
       IN Len(seq) = Cardinality(s) /\ ToSet(seq) = s)
=============================================================================

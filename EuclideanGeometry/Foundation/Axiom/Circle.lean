import EuclideanGeometry.Foundation.Axiom.Position
import EuclideanGeometry.Foundation.Axiom.Triangle

noncomputable section
namespace EuclidGeom

/- Class of Circles-/
class Circle (P : Type _) [EuclideanPlane P] where 
  center : P
  radius : ℝ
  rad_pos : 0 < radius


variable {P : Type _} [EuclideanPlane P]

namespace Circle

def mk_pt_pt (O A : P) (h : A ≠ O) : Circle P where
  center := O
  radius := (SEG O A).length
  rad_pos := (Seg.nontriv_iff_length_pos _).mp h

def mk_pt_pt_pt (A B C: P) (h : ¬ colinear A B C) : Circle P := sorry

end Circle

scoped notation "CIR" => Circle.mk_pt_pt

scoped notation "⨀" => Circle.mk_pt_pt

section coersion

def Triangle.toCir_of_nontriv (tr : Triangle P) (nontriv : tr.is_nontriv) : Circle P := sorry

end coersion


section position

namespace Circle

-- Define the power of a point P relative to a circle ω with center O and radius r to be OP ^ 2 - r ^ 2

def power (ω : Circle P) (p : P) : ℝ := (SEG ω.center p).length ^ 2 - ω.radius ^ 2

def lies_inside_circle (p : P) (ω : Circle P) : Prop := (SEG ω.center p).length ≤  ω.radius

def lies_on_circle (p : P) (ω : Circle P) : Prop := (SEG ω.center p).length = ω.radius

def lies_interior_circle (p : P) (ω : Circle P) : Prop := (SEG ω.center p).length < ω.radius

def lies_outside_circle (p : P) (ω : Circle P) : Prop := ω.radius < (SEG ω.center p).length

end Circle 

scoped infix : 50 "LiesIntCir" => Circle.lies_interior_circle
scoped infix : 50 "LiesInCir" => Circle.lies_inside_circle
scoped infix : 50 "LiesOnCir" => Circle.lies_on_circle
scoped infix : 50 "LiesOutCir" => Circle.lies_outside_circle

namespace Circle


theorem inside_circle_iff_power_neg (p : P) (ω : Circle P) : p LiesInCir ω ↔ ω.power p ≤  0 := sorry

theorem interior_of_circle_iff_power_neg (p : P) (ω : Circle P) : p LiesIntCir ω ↔ ω.power p < 0 := sorry

theorem lies_on_circle_iff_power_zero (p : P) (ω : Circle P) : p LiesOnCir ω ↔ ω.power p = 0 := sorry

theorem outside_circle_iff_power_pos (p : P) (ω : Circle P) : p LiesOutCir ω ↔ 0 < ω.power p  := sorry

theorem interior_of_circle_iff_inside_not_on_circle (p : P) (ω : Circle P) : p LiesIntCir ω ↔ p LiesInCir ω ∧ (¬ p LiesOnCir ω) := sorry

-- Define a concept of segment to be entirely contained in a circle, to mean that the two endpoints of a segment to lie inside a circle.

def seg_lies_inside_circle (l : Seg P) (ω : Circle P) : Prop := l.source LiesInCir ω ∧ l.target LiesInCir ω

end Circle

scoped infix : 50 "SegInCir" => Circle.seg_lies_inside_circle

namespace Circle

-- very hard question: if a segment lies inside a circle, then the interior point of a

theorem pt_lies_inside_circle_of_seg_inside_circle {l : Seg P} {ω : Circle P} (h : l SegInCir ω) {p : P} (lieson : p LiesOnIntSeg l) : p LiesIntCir ω := sorry

end Circle

end position

-- ray with circle
-- line with circle
end EuclidGeom

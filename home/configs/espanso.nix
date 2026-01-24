{ ... }:
{
  services.espanso = {
    enable = true;

    configs = {
      default = {
        show_notifications = false;
        search_shortcut = "off";
      };
    };

    matches = {
      emojis = {
        matches = [
          {
            trigger = "e:whale";
            replace = "🐳";
          }
        ];
      };

      math = {
        matches = [
          {
            triggers = [
              ":setofnaturals"
              ":naturalset"
            ];
            replace = "ℕ";
          }
          {
            triggers = [
              ":setofintegers"
              ":integerset"
            ];
            replace = "ℤ";
          }
          {
            triggers = [
              ":setofrationals"
              ":rationalset"
            ];
            replace = "ℚ";
          }
          {
            triggers = [
              ":setofreals"
              ":realset"
            ];
            replace = "ℝ";
          }
          {
            triggers = [
              ":setofcomplex"
              ":complexset"
            ];
            replace = "ℂ";
          }
          {
            trigger = ":inf";
            replace = "∞";
          }
          {
            trigger = ":forall";
            replace = "∀";
          }
          {
            trigger = ":integral";
            replace = "∫";
          }
          {
            trigger = ":doubleintegral";
            replace = "∫∫";
          }
          {
            trigger = ":tripleintegral";
            replace = "∫∫∫";
          }
          {
            trigger = ":contourintegral";
            replace = "∮";
          }
          {
            trigger = ":contourdoubleintegral";
            replace = "∯";
          }
          {
            trigger = ":contourtripleintegral";
            replace = "∰";
          }
          {
            trigger = ":nabla";
            replace = "∇";
          }
          {
            trigger = ":exists";
            replace = "∃";
          }
          {
            trigger = ":notexists";
            replace = "∄";
          }
          {
            triggers = [
              ":elementof"
              ":inset"
            ];
            replace = "∈";
          }
          {
            triggers = [
              ":notelementof"
              ":notinset"
            ];
            replace = "∉";
          }
          {
            triggers = [
              ":leftelementof"
              ":leftinset"
              ":suchthat"
            ];
            replace = "∋";
          }
          {
            trigger = ":proportionalto";
            replace = "∝";
          }
          {
            trigger = ":implies";
            replace = "⇒";
          }
          {
            trigger = ":ifandonlyif";
            replace = "⇔";
          }
          {
            trigger = ":union";
            replace = "∪";
          }
          {
            triggers = [
              ":intersection"
              ":intersects"
            ];
            replace = "∩";
          }
          {
            trigger = ":subset";
            replace = "⊂";
          }
          {
            trigger = ":superset";
            replace = "⊂";
          }
          {
            trigger = ":times";
            replace = "×";
          }
          {
            trigger = ":dot";
            replace = "·";
          }
          {
            trigger = ":composition";
            replace = "○";
          }
          {
            trigger = ":emptyset";
            replace = "∅";
          }
          {
            triggers = [
              ":boundary"
              ":partialderivative"
            ];
            replace = "∂";
          }
        ];
      };
      greek = {
        matches = [
          {
            trigger = ":alpha";
            replace = "α";
          }
          {
            trigger = ":Alpha";
            replace = "Α";
          }
          {
            trigger = ":beta";
            replace = "β";
          }
          {
            trigger = ":Beta";
            replace = "Β";
          }
          {
            trigger = ":gamma";
            replace = "γ";
          }
          {
            trigger = ":Gamma";
            replace = "Γ";
          }
          {
            trigger = ":delta";
            replace = "δ";
          }
          {
            trigger = ":Delta";
            replace = "Δ";
          }
          {
            trigger = ":epsilon";
            replace = "ε";
          }
          {
            trigger = ":Epsilon";
            replace = "Ε";
          }
          {
            trigger = ":zeta";
            replace = "ζ";
          }
          {
            trigger = ":Zeta";
            replace = "Ζ";
          }
          {
            trigger = ":eta";
            replace = "η";
          }
          {
            trigger = ":Eta";
            replace = "Η";
          }
          {
            trigger = ":theta";
            replace = "θ";
          }
          {
            trigger = ":Theta";
            replace = "Θ";
          }
          {
            trigger = ":iota";
            replace = "ι";
          }
          {
            trigger = ":Iota";
            replace = "Ι";
          }
          {
            trigger = ":kappa";
            replace = "κ";
          }
          {
            trigger = ":Kappa";
            replace = "Κ";
          }
          {
            trigger = ":lambda";
            replace = "λ";
          }
          {
            trigger = ":Lambda";
            replace = "Λ";
          }
          {
            trigger = ":mu";
            replace = "μ";
          }
          {
            trigger = ":Mu";
            replace = "Μ";
          }
          {
            trigger = ":nu";
            replace = "ν";
          }
          {
            trigger = ":Nu";
            replace = "Ν";
          }
          {
            trigger = ":ksi";
            replace = "ξ";
          }
          {
            trigger = ":Ksi";
            replace = "Ξ";
          }
          {
            trigger = ":omicron";
            replace = "ο";
          }
          {
            trigger = ":Omicron";
            replace = "Ο";
          }
          {
            trigger = ":pi";
            replace = "π";
          }
          {
            trigger = ":Pi";
            replace = "Π";
          }
          {
            trigger = ":rho";
            replace = "ρ";
          }
          {
            trigger = ":Rho";
            replace = "Ρ";
          }
          {
            trigger = ":sigma";
            replace = "σ";
          }
          {
            trigger = ":Sigma";
            replace = "Σ";
          }
          {
            trigger = ":tau";
            replace = "τ";
          }
          {
            trigger = ":Tau";
            replace = "Τ";
          }
          {
            trigger = ":upsilon";
            replace = "υ";
          }
          {
            trigger = ":Upsilon";
            replace = "Υ";
          }
          {
            trigger = ":phi";
            replace = "φ";
          }
          {
            trigger = ":Phi";
            replace = "Φ";
          }
          {
            trigger = ":chi";
            replace = "χ";
          }
          {
            trigger = ":Chi";
            replace = "Χ";
          }
          {
            trigger = ":psi";
            replace = "ψ";
          }
          {
            trigger = ":Psi";
            replace = "Ψ";
          }
          {
            trigger = ":phi";
            replace = "φ";
          }
          {
            trigger = ":omega";
            replace = "ω";
          }
          {
            trigger = ":Omega";
            replace = "Ω";
          }
        ];
      };
    };
  };
}

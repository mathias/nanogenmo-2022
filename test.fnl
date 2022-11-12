(local lore (require "lib/lore/lore"))
(local lume (require :lume))


(local grammar {"#name#" ["Hagar" "Conan" "Attila" "Gunthur" "Genghis"]
          "#title#" ["Sad" "Terrible" "Strong" "Weak" "Feeble"]
    "#origin#" "I am #name# the #title#."})

(for [i 1 5]
  (print (lore.generate-one grammar)))

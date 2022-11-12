(local lore (require "lib/lore/lore"))
(local lume (require :lume))
(local util (require "lib/util"))
(local pp util.pp)

;; pull in partials here

;; setup
(lore.randomseed 1234) ;; TODO: change later


;; random dates
(local min-date 2399)
(local max-date 2499)
(fn rand-date [offset]
  (let [offsetA (or offset 0)]
    (+ (lume.round (lume.random min-date max-date))
       offsetA)))
                  
;; naming things
(local basic-consonants {:p "p"
                         :t "t"
                         :k "k"
                         :m "m"
                         :n "n"
                         :s "s"
                         :l "l"})
(local extended-consonants {:sh "ʃ"
                            :zh "ʒ"
                            :ch "ʧ"
                            :j "ʤ"
                            :ng "ʤ"
                            :y "j"})
(local fancy-consonants {
                         :kh "x"
                         :gh "ɣ"
                         :q "q"
                         :stop "ʔ"
                        })

(local basic-vowels ["a" "e" "i" "o" "u"])
;; CVC
(local intergalactic-dialect {
                              :consonants (lume.merge basic-consonants extended-consonants)
                              :vowels basic-vowels
                              })

(fn name [name-length dialect]
  (.. (string.upper (lume.randomchoice (lume.keys basic-consonants)))
      (lume.randomchoice basic-vowels)
      (lume.randomchoice (lume.keys basic-consonants))))

;; generate name of guide
(local global-title
       (.. "The "
           (name 1 "intergalactic")
           " Galactic Guide Book"))

(local global-year (rand-date))

(pp global-title)
(pp (.. "©" global-year))


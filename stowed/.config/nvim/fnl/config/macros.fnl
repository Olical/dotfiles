;; [nfnl-macro]

(fn str? [x]
  (= :string (type x)))

(fn nil? [x]
  (= nil x))

(fn pack [identifier ?options]
  "A workaround around the lack of mixed tables in Fennel.
  Has special `options` keys for enhanced utility.
  https://github.com/bakpakin/Fennel/issues/353#issuecomment-1875998397"
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  (assert-compile (or (nil? ?options) (table? ?options))
                  "expected table for options" ?options)
  (let [options (or ?options {})
        options (collect [k v (pairs options)]
                  (match k
                    :require* (values :config `#(require ,v))
                    _ (values k v)))]
    (doto options (tset 1 identifier))))

{: pack}

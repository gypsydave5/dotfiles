{:user {:plugins [[cider/cider-nrepl "0.15.0"]
                  [com.jakemccrary/lein-test-refresh "0.16.0"]
                  [venantius/ultra "0.5.1"]]
        :test-refresh {:notify-command ["terminal-notifier" "-title" "Tests" "-message"]
                       :quiet true
                       :changes-only true}
        :dependencies [[pjstadig/humane-test-output "0.8.2"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}}

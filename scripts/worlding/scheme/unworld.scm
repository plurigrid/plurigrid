#! /usr/local/bin/scsh -e main -s
!#

(define home (getenv "HOME"))

(run (pkill "Rewind"))
(run (cp ,(string-append home "/Library/Preferences/com.memoryvault.MemoryVault.plist")
          ,(string-append home "/Documents/com.memoryvault.MemoryVault.plist")))
(run (cp -r ,(string-append home "/Library/Application Support/com.memoryvault.MemoryVault")
            ,(string-append home "/Documents/com.memoryvault.MemoryVault")))

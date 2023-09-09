
(setq dictionary-server "localhost")

;; RSS
(setq newsticker-url-list
      '(("奇客Solidot" "https://www.solidot.org/index.rss" nil 3600 nil)
	("阮一峰的网络日志" "https://www.ruanyifeng.com/blog/atom.xml" nil 86400 nil)
	("Debian Security Advisories" "https://www.debian.org/security/dsa.en.rdf")
	("Emacs Wiki" "https://www.emacswiki.org/emacs?action=rss" nil 3600)
	("Quote of the day" "https://feeds.feedburner.com/quotationspage/qotd" "07:00" 86400)
	("slashdot" "http://rss.slashdot.org/Slashdot/slashdot" nil 3600)))

;; gnus
(setq gnus-select-method '(nntp "freenews.netfront.net"))
;; (setq gnus-select-method '(nntp "nntp.aioe.org"))
;; (setq gnus-select-method '(nntp "news.mixmin.net"))

(provide 'init-read)

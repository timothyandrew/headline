# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Headline.Repo.insert!(%Headline.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Headline.Repo
alias Headline.RSS.{Feed, Group, Item}

group = Repo.insert! %Group{
  title: "Reading List (ta.net)"
}

dev = Repo.insert! %Feed {
  title: "Reading (Dev)",
  url: "https://timothyandrew.net/learning/inbox/",
  site_url: "https://timothyandrew.net",
  last_updated_on_time: DateTime.truncate(DateTime.utc_now(), :second),
  group_id: group.id
}

non_dev = Repo.insert! %Feed {
  title: "Reading (Non-Dev)",
  url: "https://timothyandrew.net/learning/inbox/",
  site_url: "https://timothyandrew.net",
  last_updated_on_time: DateTime.truncate(DateTime.utc_now(), :second),
  group_id: group.id
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "[Rant... sorta] Physically moved a server today... : sysadmin",
  url: "https://www.reddit.com/r/sysadmin/comments/i3xbjb/rant_sorta_physically_moved_a_server_today/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Road to 2 Million Websocket Connections in Phoenix",
  url: "https://phoenixframework.org/blog/the-road-to-2-million-websocket-connections"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Blue Team Rust: What is \"Memory Safety\", really?",
  url: "https://tiemoko.com/blog/blue-team-rust/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How we migrated Dropbox from Nginx to Envoy - Dropbox",
  url: "https://dropbox.tech/infrastructure/how-we-migrated-dropbox-from-nginx-to-envoy"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Some SQL Tricks of an Application DBA",
  url: "https://hakibenita.com/sql-tricks-application-dba"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "State Representation and Polyomino Placement for the Game Patchwork",
  url: "https://zayenz.se/blog/post/patchwork-modref2019-paper/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "mikeash.com: Friday Q&A 2017-06-30: Dissecting objc_msgSend on ARM64",
  url: "https://www.mikeash.com/pyblog/friday-qa-2017-06-30-dissecting-objc_msgsend-on-arm64.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "mikeash.com: objc_msgSend's New Prototype",
  url: "https://www.mikeash.com/pyblog/objc_msgsends-new-prototype.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Debugging Incidents in Google's Distributed Systems",
  url: "https://queue.acm.org/detail.cfm?id=3404974"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Bypassing objc_msgSend",
  url: "https://saagarjha.com/blog/2019/12/15/bypassing-objc-msgsend/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A Terrible, Horrible, No-Good, Very Bad Day at Slack",
  url: "https://slack.engineering/a-terrible-horrible-no-good-very-bad-day-at-slack-dfe05b485f82"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Using Babel Transforms to Inject Analytics Code in React Native Apps",
  url: "https://heap.io/blog/engineering/how-we-leveraged-asts-and-babel-to-capture-everything-on-react-native-apps"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Examining ARM vs X86 Memory Models with Rust",
  url: "https://www.nickwilcox.com/blog/arm_vs_x86_memory_model/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Facebook: TAO: The power of the graph",
  url: "https://www.facebook.com/notes/facebook-engineering/tao-the-power-of-the-graph/10151525983993920/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How to Choose a Database on IBM Cloud ",
  url: "https://www.ibm.com/cloud/blog/how-to-choose-a-database-on-ibm-cloud"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "aeron - wiki",
  url: "https://github.com/real-logic/Aeron/wiki)"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "mma",
  url: "2) - Linux manual page](https://man7.org/linux/man-pages/man2/mmap.2.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Control Theory for Fun & Profit",
  url: "https://fauna.com/blog/control-theory-for-fun-and-profit"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Ring Buffer: A Data Structure Behind Disruptor",
  url: "https://dzone.com/articles/ring-buffer-a-data-structure-behind-disruptor"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How to receive a million packets per second",
  url: "https://blog.cloudflare.com/how-to-receive-a-million-packets/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Linux Kernel Development Process",
  url: "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/2.Process.rst"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Redis-Raft 1b3fbf6",
  url: "https://jepsen.io/analyses/redis-raft-1b3fbf6"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Binary Frameworks in Swift",
  url: "https://pspdfkit.com/blog/2018/binary-frameworks-swift/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A Tiny, Static, Full-Text Search Engine using Rust and WebAssembly | Matthias Endler",
  url: "https://endler.dev/2019/tinysearch/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The algebra",
  url: "and calculus!) of algebraic data types](https://codewords.recurse.com/issues/three/algebra-and-calculus-of-algebraic-data-types"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A simple way to get more value from metrics",
  url: "https://danluu.com/metrics-analytics/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Reducing tail latencies with automatic cooperative task yielding",
  url: "https://tokio.rs/blog/2020-04-preemption/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Making the Tokio scheduler 10x faster",
  url: "https://tokio.rs/blog/2019-10-scheduler/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Jepsen: PostgreSQL 12.3",
  url: "http://jepsen.io/analyses/postgresql-12.3"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How one word in PostgreSQL unlocked a 9x performance improvement",
  url: "https://jlongster.com/how-one-word-postgresql-performance"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "You probably don’t need a single-page application",
  url: "https://plausible.io/blog/you-probably-dont-need-a-single-page-app"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Introducing Ristretto: A High-Performance Go Cache - Dgraph Blog",
  url: "https://dgraph.io/blog/post/introducing-ristretto-high-perf-go-cache/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Containers vs. Zones vs. Jails vs. VMs",
  url: "https://blog.jessfraz.com/post/containers-zones-jails-vms/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A First Taste of InvokeDynamic",
  url: "http://blog.headius.com/2008/09/first-taste-of-invokedynamic.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A new fast hash table in response to Google’s new fast hash table",
  url: "https://probablydance.com/2018/05/28/a-new-fast-hash-table-in-response-to-googles-new-fast-hash-table/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Abseil Containers",
  url: "https://abseil.io/docs/cpp/guides/container#abslflat_hash_map-and-abslflat_hash_set"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Futures and Segmented Stacks",
  url: "https://without.boats/blog/futures-and-segmented-stacks/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Common Rust Lifetime Misconceptions",
  url: "https://github.com/pretzelhammer/rust-blog/blob/master/posts/common-rust-lifetime-misconceptions.md"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "What is Nix?",
  url: "https://engineering.shopify.com/blogs/engineering/what-is-nix"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "What Every Software Engineer Should Know about Apache Kafka: Events, Streams, Tables, Storage, Processing, And More",
  url: "https://www.michael-noll.com/blog/2020/01/16/what-every-software-engineer-should-know-about-apache-kafka-fundamentals/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "What every developer should know about TCP",
  url: "https://robertovitillo.com/what-every-developer-should-know-about-tcp/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Old box, dumb code, few thousand connections, no big deal",
  url: "https://news.ycombinator.com/item?id=23107945"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "We have to talk about this Python, Gunicorn, Gevent thing",
  url: "https://rachelbythebay.com/w/2020/03/07/costly/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Best. iOS Sandbox Escape",
  url: "https://siguza.github.io/psychicpaper/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Why strace doesn't work in Docker",
  url: "https://jvns.ca/blog/2020/04/29/why-strace-doesnt-work-in-docker/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Drawing 2.7 billion Points in 10s",
  url: "https://hackernoon.com/drawing-2-7-billion-points-in-10s-ecc8c85ca8fa"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Show HN: Plotting 3 years of hourly data in 150ms",
  url: "https://news.ycombinator.com/item?id=23045207"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Hunting a Linux kernel bug",
  url: "https://blog.twitter.com/engineering/en_us/topics/open-source/2020/hunting-a-linux-kernel-bug.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Questioning the Lambda Architecture",
  url: "https://www.oreilly.com/radar/questioning-the-lambda-architecture/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Uber’s case for incremental processing on Hadoop",
  url: "https://www.oreilly.com/content/ubers-case-for-incremental-processing-on-hadoop/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Starbucks Does Not Use Two-Phase Commit",
  url: "https://www.enterpriseintegrationpatterns.com/ramblings/18_starbucks.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Redis 6.0.0 GA is out!",
  url: "http://antirez.com/news/132"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Restoring Picroma Plasma Without Patching it",
  url: "https://github.com/ChrisMiuchiz/Plasma-Writeup"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The",
  url: "not so) hidden cost of sharing code between iOS and Android](https://dropbox.tech/mobile/the-not-so-hidden-cost-of-sharing-code-between-ios-and-android"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "B-trees",
  url: "https://shachaf.net/w/b-trees"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Debugging Distributed Systems",
  url: "https://dl.acm.org/doi/pdf/10.1145/2927299.2940294"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "React as a UI Runtime",
  url: "https://overreacted.io/react-as-a-ui-runtime/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Ringing in a new asynchronous I/O API [LWN.net]",
  url: "https://lwn.net/Articles/776703/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Teleforking a process onto a different computer! - Tristan Hume",
  url: "https://thume.ca/2020/04/18/telefork-forking-a-process-onto-a-different-computer/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "What is the deal with NULLs? | Experimental Thoughts",
  url: "http://thoughts.davisjeff.com/2009/08/02/what-is-the-deal-with-nulls/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "insert-only tables are autovacuumed in PostgreSQL v13",
  url: "https://www.cybertec-postgresql.com/en/postgresql-autovacuum-insert-only-tables/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How MigratoryData solved the C10M problem: 10 Million Concurrent Connections on a Single Commodity Server &#8211; Scalable Realtime Messaging",
  url: "https://mrotaru.wordpress.com/2015/05/20/how-migratorydata-solved-the-c10m-problem-10-million-concurrent-connections-on-a-single-commodity-server/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Project Zero: You Won't Believe what this One Line Change Did to the Chrome Sandbox",
  url: "https://googleprojectzero.blogspot.com/2020/04/you-wont-believe-what-this-one-line.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Macintosh Y2020",
  url: "http://basalgangster.macgui.com/RetroMacComputing/The_Long_View/Entries/2020/4/5_Macintosh_Y2020.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Algebraic Effects",
  url: "https://overreacted.io/algebraic-effects-for-the-rest-of-us/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "$36k Google App Engine RCE",
  url: "https://sites.google.com/site/testsitehacking/-36k-google-app-engine-rce"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Testing sync at Dropbox",
  url: "https://dropbox.tech/infrastructure/-testing-our-new-sync-engine"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Distill: Why do we need Flask, Celery, and Redis? (with McDonalds in Between)",
  url: "https://ljvmiranda921.github.io/notebook/2019/11/08/flask-redis-celery-mcdo/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "What is a coder's worst nightmare?",
  url: "https://www.quora.com/What-is-a-coders-worst-nightmare/answer/Mick-Stute"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "PHP in 2020",
  url: "https://stitcher.io/blog/php-in-2020"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The case of the 500-mile email",
  url: "http://www.ibiblio.org/harris/500milemail.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Mozilla developers recount the process of creating the rr debugging tool",
  url: "https://queue.acm.org/detail.cfm?id=3391621"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Hooks at a Glance – React",
  url: "https://reactjs.org/docs/hooks-overview.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Borg, Omega, and Kubernetes",
  url: "https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/44843.pdf"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Running Online Services at Riot: Part I",
  url: "https://technology.riotgames.com/news/running-online-services-riot-part-i"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "DBMS Musings: NewSQL database systems are failing to guarantee consistency, and I blame Spanner",
  url: "http://dbmsmusings.blogspot.com/2018/09/newsql-database-systems-are-failing-to.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Improving G1 out-of-the-box performance",
  url: "https://kstefanj.github.io/2020/04/16/g1-ootb-performance.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "What I’ve learned interviewing 500 people: the interviewer skills ladder for high growth software companies",
  url: "https://medium.com/@alexallain/what-ive-learned-interviewing-500-people-the-interviewer-skills-ladder-for-high-growth-software-37778d2aae85"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Infinite Loop That Wasn't: A Holy Grail Bug Story",
  url: "https://mgba.io/2020/01/25/infinite-loop-holy-grail/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Jepsen: ZK",
  url: "https://aphyr.com/posts/291-jepsen-zookeeper) + [GH Followup](https://github.com/jepsen-io/jepsen/issues/399) + [Ivan's summary](https://app.slack.com/client/T02D8V44V/C02DA2QTQ/1568903164.008600"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Deploys at Slack",
  url: "https://slack.engineering/deploys-at-slack-cd0d28c61701"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Redis streams as a pure data structure",
  url: "http://antirez.com/news/128"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Here’s my favorite operating systems war story, what’s yours?",
  url: "https://blog.valerieaurora.org/2013/12/17/heres-my-favorite-operating-systems-war-story-whats-yours/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Cloud Storage for $2 per TB per month | Hacker News",
  url: "https://news.ycombinator.com/item?id=22506722"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A technical overview of Azure Cosmos DB",
  url: "https://azure.microsoft.com/en-in/blog/a-technical-overview-of-azure-cosmos-db/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "HOPL III: Proceedings of the third ACM SIGPLAN conference on History of programming languages",
  url: "https://dl.acm.org/doi/proceedings/10.1145/1238844"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Observations on ARM64 &amp; AWS’s Amazon EC2 M6g Instances",
  url: "https://www.honeycomb.io/blog/observations-on-arm64-awss-amazon-ec2-m6g-instances/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Rewriting the heart of our sync engine",
  url: "https://dropbox.tech/infrastructure/rewriting-the-heart-of-our-sync-engine"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Lies, Damned Lies, and Averages: Perc50, Perc95 explained for Programmers",
  url: "https://www.schneems.com/2020/03/17/lies-damned-lies-and-averages-perc50-perc95-explained-for-programmers/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How containers work: overlayfs",
  url: "https://jvns.ca/blog/2019/11/18/how-containers-work--overlayfs/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Using Rust to Scale Elixir for 11 Million Concurrent Users",
  url: "https://blog.discordapp.com/using-rust-to-scale-elixir-for-11-million-concurrent-users-c6f19fc029d3"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "An introduction to replica conflict resolution",
  url: "http://composition.al/blog/2018/10/31/an-introduction-to-replica-conflict-resolution/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Books I Recommend",
  url: "https://blog.jessfraz.com/post/books/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Some experiments with hacking the Elektronika MK-61",
  url: "http://www.alfredklomp.com/technology/mk-61/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Apache Druid vs. Time-Series Databases",
  url: "https://news.ycombinator.com/item?id=22868286"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Valve and HackerOne: A story in how not to handle vulnerability reports",
  url: "https://blog.jakegealer.me/valve-a/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "New – Trigger a Kernel Panic to Diagnose Unresponsive EC2 Instances",
  url: "https://aws.amazon.com/blogs/aws/new-trigger-a-kernel-panic-to-diagnose-unresponsive-ec2-instances/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Reverse engineering my router's firmware with binwalk - #embeddedbits",
  url: "https://embeddedbits.org/reverse-engineering-router-firmware-with-binwalk/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Realtime Editing of Ordered Sequences",
  url: "https://www.figma.com/blog/realtime-editing-of-ordered-sequences/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Why databases use ordered indexes but programming uses hash tables",
  url: "https://www.evanjones.ca/ordered-vs-unordered-indexes.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Concurrency Glossary",
  url: "https://slikts.github.io/concurrency-glossary/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Shenandoah GC in production: experience report",
  url: "http://clojure-goes-fast.com/blog/shenandoah-in-production/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Debugging an evil Go runtime bug",
  url: "https://marcan.st/2017/12/debugging-an-evil-go-runtime-bug/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How GOV.UK Notify reliably sends text messages to users",
  url: "https://gds.blog.gov.uk/2020/04/03/how-gov-uk-notify-reliably-sends-text-messages-to-users/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "FairSwap: how to fairly exchange digital goods",
  url: "https://blog.acolyer.org/2018/12/05/fairswap-how-to-fairly-exchange-digital-goods/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Day 37: After 5 days, my OS doesn't crash when I press a key",
  url: "https://jvns.ca/blog/2013/12/04/day-37-how-a-keyboard-works/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Good challenges vs. bad challenges",
  url: "http://jessicaharllee.com/notes/good-challenges-vs-bad-challenges/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Making Instagram.com faster: Part 1",
  url: "https://instagram-engineering.com/making-instagram-com-faster-part-1-62cc0c327538"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "hardware debugging is hard",
  url: "https://eli.thegreenplace.net/2003/10/30/hardware-debugging-is-hard"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Bye bye Mongo, Hello Postgres | Digital blog",
  url: "https://www.theguardian.com/info/2018/nov/30/bye-bye-mongo-hello-postgres"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Tracking down a segfault in grep",
  url: "http://blog.loadzero.com/blog/tracking-down-a-segfault-in-grep/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "TIFU by using Math.rando",
  url: "https://medium.com/@betable/tifu-by-using-math-random-f1c308c4fd9d"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Case of the Mysterious Memory Consumption ",
  url: "https://www.jamesporter.me/2015/12/09/mysterious-memory-consumption.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The section on parallel joins is a bit out of date. Shameless plug: I've writt...",
  url: "https://news.ycombinator.com/item?id=20665136"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Terraforming Cloud Infrastructure",
  url: "https://blog.picnic.nl/infrastructure-journey-part1-terraform-f0426cfc64bb"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "D compilation is too slow and I am forking the compiler",
  url: "https://blog.thecybershadow.net/2018/11/18/d-compilation-is-too-slow-and-i-am-forking-the-compiler/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Teach debugging",
  url: "http://danluu.com/teach-debugging/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Jack Whitham",
  url: "https://www.jwhitham.org/2015/04/the-mystery-of-fifteen-millisecond.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Stripe’s fifth engineering hub is Remote",
  url: "https://stripe.com/en-ca/blog/remote-hub"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The curious case of the disappearing Polish S",
  url: "https://medium.engineering/the-curious-case-of-disappearing-polish-s-fa398313d4df"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "REST API disruption",
  url: "https://status.pagerduty.com/incidents/xt07h8hrs9kc"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Uber’s Big Data Platform: 100+ Petabytes with Minute Latency",
  url: "https://eng.uber.com/uber-big-data-platform/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The big handle gamble · x64dbg",
  url: "https://x64dbg.com/blog/2017/11/04/the-big-handle-gamble.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Maybe you don't need Rust and WASM to speed up your JS",
  url: "https://mrale.ph/blog/2018/02/03/maybe-you-dont-need-rust-to-speed-up-your-js.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Trying to sneak in a sketchy .so over the weekend | Hacker News",
  url: "https://news.ycombinator.com/item?id=22284463"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Definitive Guide to Linux System Calls",
  url: "https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Project LightSpeed: Rewriting the Messenger codebase for a faster, smaller, and simpler messaging app",
  url: "https://engineering.fb.com/data-infrastructure/messenger/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Achieving 100k connections per second with Elixir",
  url: "https://news.ycombinator.com/item?id=19311750"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "I've had a few interesting operating system development experiences. Warning: ra...",
  url: "https://news.ycombinator.com/item?id=7684824"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Fixing a bug in an 18 year old Shockwave game",
  url: "https://mattbruv.github.io/ccsr-bugfix/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A Story About ‘Magic'",
  url: "http://www.catb.org/jargon/html/magic-story.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The case of the 500-mile email",
  url: "http://www.ibiblio.org/harris/500milemail.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Customer Story with Algolia | Citus Data",
  url: "https://www.citusdata.com/customers/algolia"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Jepsen: Kafka",
  url: "https://aphyr.com/posts/293-call-me-maybe-kafka"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Debugging file corruption on iOS",
  url: "https://engineering.fb.com/ios/debugging-file-corruption-on-ios/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "JVM Anatomy Quark #10: String.inter",
  url: "https://shipilev.net/jvm/anatomy-quarks/10-string-intern/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "There’s a bottleneck in Azure SQL DB storage throughput.",
  url: "https://www.brentozar.com/archive/2019/02/theres-a-bottleneck-in-azure-sql-db-storage-throughput/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The One On Dynamic Programming!",
  url: "https://blogarithms.github.io/articles/2019-03/cracking-dp-part-one"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Universe of Discourse : Don't tug on that, you never know what it might be attached to",
  url: "https://blog.plover.com/tech/tmpdir.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Microsoft Money crashes during import of account transactions or when changing a payee of a downloaded transaction",
  url: "https://devblogs.microsoft.com/oldnewthing/?p=6103"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Revisiting the Intel 432",
  url: "http://dtrace.org/blogs/bmc/2008/07/18/revisiting-the-intel-432/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Logical fallacies in software engineering",
  url: "https://artur-martsinkovskyi.github.io/2018/logical-fallacies-in-programming/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How do you feel what you can't touch? Scientists crack the nerve code",
  url: "https://www.smh.com.au/national/how-do-you-feel-what-you-can-t-touch-scientists-crack-the-nerve-code-20181211-p50lmu.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The design and implementation of modern column-oriented database systems",
  url: "https://blog.acolyer.org/2018/09/26/the-design-and-implementation-of-modern-column-oriented-database-systems/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "My Hardest Bug Ever",
  url: "https://www.gamasutra.com/blogs/DaveBaggett/20131031/203788/My_Hardest_Bug_Ever.php"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The unscalable, deadlock-prone, thread pool",
  url: "https://www.pvk.ca/Blog/2019/02/25/the-unscalable-thread-pool/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Reply to Aphyr attack to Sentinel",
  url: "http://antirez.com/news/55"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Lessons from 6 software rewrite stories",
  url: "https://medium.com/@herbcaudill/lessons-from-6-software-rewrite-stories-635e4c8f7c22"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A Brief History of High Availability",
  url: "https://www.cockroachlabs.com/blog/brief-history-high-availability/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Linearizability versus Serializability",
  url: "http://www.bailis.org/blog/linearizability-versus-serializability/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Underflow bug",
  url: "https://labs.spotify.com/2015/08/27/underflow-bug/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Kafka, GDPR and Event Sourcing",
  url: "https://danlebrero.com/2018/04/11/kafka-gdpr-event-sourcing/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A Brief Glance at How Various Text Editors Manage Their Textual Data",
  url: "https://ecc-comp.blogspot.com/2015/05/a-brief-glance-at-how-5-text-editors.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Working remotely, 4 years in",
  url: "https://jvns.ca/blog/2018/02/18/working-remotely--4-years-in/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Notes on Distributed Systems for Young Bloods – Something Similar",
  url: "https://www.somethingsimilar.com/2013/01/14/notes-on-distributed-systems-for-young-bloods/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "AWS Outperforms GCP in the 2018 Cloud Report",
  url: "https://www.cockroachlabs.com/blog/2018_cloud_report/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Everything you need to know about the POODLE SSL bug",
  url: "https://heap.slack.com/archives/C0HPZ8KM2/p1580692359051600"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "About Pool Sizing · brettwooldridge",
  url: "https://github.com/brettwooldridge/HikariCP/wiki/About-Pool-Sizing"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Linux From Scratch on EC2",
  url: "https://czep.net/17/lfs-on-ec2.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Building a self-contained game in C# under 8 kilobytes",
  url: "https://medium.com/@MStrehovsky/building-a-self-contained-game-in-c-under-8-kilobytes-74c3cf60ea04"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Three",
  url: "ish) ways to implement timeouts in Go](https://telliott.io/2016/09/29/three-ish-ways-to-implement-timeouts-in-go.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Debugging memory corruption: who the hell writes “2” into my stack?!",
  url: "https://blogs.unity3d.com/2016/04/25/debugging-memory-corruption-who-the-hell-writes-2-into-my-stack-2/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Debugging walkthrough: Access violation on nonsense instruction",
  url: "https://devblogs.microsoft.com/oldnewthing/?p=43293"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Joel Grus – Fizz Buzz in Tensorflow",
  url: "http://joelgrus.com/2016/05/23/fizz-buzz-in-tensorflow/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "500 Byte Images: The Haiku Vector Icon Format",
  url: "http://blog.leahhanson.us/post/recursecenter2016/haiku_icons.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Publishing with Apache Kafka at The New York Times",
  url: "https://www.confluent.io/blog/publishing-apache-kafka-new-york-times/https://www.confluent.io/blog/publishing-apache-kafka-new-york-times/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Everything Old is New Again, and a Compiler Bug",
  url: "https://randomascii.wordpress.com/2016/09/16/everything-old-is-new-again-and-a-compiler-bug/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A Kernel Debugging Story",
  url: "http://notes.secretsauce.net/notes/2015/09/05_a-kernel-debugging-story.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "On MongoDB",
  url: "https://www.nemil.com/mongo/index.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How baseball’s tech team built the future of television",
  url: "https://www.theverge.com/2015/8/4/9090897/mlb-bam-live-streaming-internet-tv-nhl-hbo-now-espn"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Ask HN: What are some examples of good database schema designs?",
  url: "https://news.ycombinator.com/item?id=22324691"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Choose Boring Technology",
  url: "http://boringtechnology.club/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Unit tests fail when run in Australia · Issue #5017 · angular/angular.js",
  url: "https://github.com/angular/angular.js/issues/5017"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Designing a Lock-Free, Wait-Free Hash Map",
  url: "https://shlomisteinberg.com/2015/09/28/designing-a-lock-free-wait-free-hash-map/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A discussion of microtransactions and game design.",
  url: "https://www.gamasutra.com/blogs/KingLink/20190222/337221/A_discussion_of_microtransactions_and_game_design.php"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "3 Kinds of Good Tech Debt — Squarespace",
  url: "https://engineering.squarespace.com/blog/2019/three-kinds-of-good-tech-debt"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How we spent two weeks hunting an NFS bug in the Linux kernel",
  url: "https://about.gitlab.com/blog/2018/11/14/how-we-spent-two-weeks-hunting-an-nfs-bug/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Debugging distributed systems with why-across-time provenance",
  url: "https://blog.acolyer.org/2018/11/12/debugging-distributed-systems-with-why-across-time-provenance/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Should you learn C to “learn how the computer works”?",
  url: "https://words.steveklabnik.com/should-you-learn-c-to-learn-how-the-computer-works"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "“C is not how the computer works” can lead to inefficient code",
  url: "https://words.steveklabnik.com/c-is-not-how-the-computer-works-can-lead-to-inefficient-code"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Undefined Behavior in 2017",
  url: "https://blog.regehr.org/archives/1520"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Solving the Mystery of Link Imbalance: A Metastable Failure State at Scale",
  url: "https://engineering.fb.com/production-engineering/solving-the-mystery-of-link-imbalance-a-metastable-failure-state-at-scale/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Distributed locks with Redis – Redis",
  url: "https://redis.io/topics/distlock"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How to Deliver Constructive Feedback in Difficult Situations",
  url: "https://medium.com/s/please-advise/the-essential-guide-to-difficult-conversations-41f736e63ccf"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "UNIX as IDE",
  url: "https://sanctum.geek.nz/arabesque/series/unix-as-ide/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Bashing the Bash — Replacing Shell Scripts with Python",
  url: "https://medium.com/capital-one-tech/bashing-the-bash-replacing-shell-scripts-with-python-d8d201bc0989"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "First Rust Program Pain (So you can avoid it)",
  url: "http://dtrace.org/blogs/ahl/2015/06/22/first-rust-program-pain/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Netflix: What Happens When You Press Play?",
  url: "http://highscalability.com/blog/2017/12/11/netflix-what-happens-when-you-press-play.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Dissecting Message Queues",
  url: "https://bravenewgeek.com/dissecting-message-queues/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A POSIX Queue Implementation",
  url: "https://zinascii.com/2014/a-posix-queue-implementation.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Attacking Ruby on Rails applications",
  url: "2016) | Hacker News](https://news.ycombinator.com/item?id=22243270"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Infectious Executable Stacks « null program",
  url: "https://nullprogram.com/blog/2019/11/15/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "SortSupport: Sorting in Postgres at Speed — Brandur Leach",
  url: "https://brandur.org/sortsupport"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Event Sourcing is Hard",
  url: "https://news.ycombinator.com/item?id=19072850"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Back to the Future with Relational NoSQL",
  url: "https://www.infoq.com/articles/relational-nosql-fauna"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "& : Unexpected Behavior from the Python 3 Built-In Hash Function",
  url: "https://dpb.bitbucket.io/unexpected-behavior-from-the-python-3-built-in-hash-function.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "An Obscure Bug Story",
  url: "http://ismail.badawi.io/blog/2014/02/04/an-obscure-bug-story/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "An experience of fixing a memory-corruption bug",
  url: "https://nanxiao.me/en/an-experience-of-fixing-a-memory-corruption-bug/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Majid's blog about Swift development",
  url: "https://mecid.github.io/2019/06/19/building-forms-with-swiftui/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "SSTable and Log Structured Storage: LevelDB",
  url: "https://www.igvita.com/2012/02/06/sstable-and-log-structured-storage-leveldb/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The greatest bug I never fixed",
  url: "https://blog.makandra.com/2010/04/the-greatest-bug-i-never-fixed/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The State of Apple’s Developer Documentation",
  url: "https://mjtsai.com/blog/2019/05/20/the-state-of-apples-developer-documentation/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Go hits the concurrency nail right on the head",
  url: "https://eli.thegreenplace.net/2018/go-hits-the-concurrency-nail-right-on-the-head/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Rust in Production at Figma",
  url: "https://www.figma.com/blog/rust-in-production-at-figma/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Data Laced with History: Causal Trees & Operational CRDTs",
  url: "http://archagon.net/blog/2018/03/24/data-laced-with-history/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A first look at Xcode 11’s Swift Package Manager integration",
  url: "https://wwdcbysundell.com/2019/xcode-swiftpm-first-look/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "DBMS Musings: Partitioned consensus and its impact on Spanner’s latency",
  url: "https://dbmsmusings.blogspot.com/2018/12/partitioned-consensus-and-its-impact-on.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A zine about strace",
  url: "https://jvns.ca/blog/2015/04/14/strace-zine/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Java 8 Migration: A Funny Thing Happened on the Way to Java 8",
  url: "https://engineering.indeedblog.com/blog/2016/09/job-search-web-app-java-8-migration/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Segfaulting atop and another trip down the rabbit hole",
  url: "http://rachelbythebay.com/w/2014/03/02/sync/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "TCP Puzzlers",
  url: "https://www.joyent.com/blog/tcp-puzzlers"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Perfect multicast storm",
  url: "https://www.outerthoughts.com/2004/10/perfect-multicast-storm/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Secondary indexing with Redis – Redis",
  url: "https://redis.io/topics/indexes"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "draft-toomim-httpbis-braid-http-01",
  url: "https://datatracker.ietf.org/doc/html/draft-toomim-httpbis-braid-http"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Yoda of Silicon Valley",
  url: "https://www.nytimes.com/2018/12/17/science/donald-knuth-computers-algorithms-programming.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How My Printer Caused Excessive Syscalls & UDP Traffic",
  url: "https://zinascii.com/2014/how-my-printer-caused-excessive-syscalls.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A categorized list of all Java and JVM features since JDK 8 to 14 ",
  url: "https://www.reddit.com/r/java/comments/fo93xb/a_categorized_list_of_all_java_and_jvm_features/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The bug that hides from breakpoints",
  url: "https://drewdevault.com/2014/02/02/The-worst-bugs.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "September 9: First Instance of Actual Computer Bug Being Found",
  url: "https://www.computerhistory.org/tdih/september/9/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Bigtable Autoscaler: saving money and time using managed storage",
  url: "https://labs.spotify.com/2018/12/18/bigtable-autoscaler-saving-money-and-time-using-managed-storage/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Cello • Best Improvements Of Cello 2.0",
  url: "http://libcello.org/learn/best-improvements-of-cello-2.0"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Why should I have written ZeroMQ in C, not C\++ (part 1)",
  url: "http://250bpm.com/blog:4"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "SF-3: Serverless Everything?",
  url: "https://www.tbray.org/ongoing/When/201x/2018/12/11/SF-3"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Experimenting with AWS's new a1 instances, using awless",
  url: "https://serialized.net/2018/12/tinkering-with-a1-and-awless/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Postmortem for July 27 outage of the Manta service",
  url: "https://www.joyent.com/blog/manta-postmortem-7-27-2015"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Debug heap that created bugs",
  url: "http://lectem.github.io/windows/heap/appverifier/detours/2020/01/02/The-debug-heap-that-created-bugs.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Rust's object system",
  url: "https://smallcultfollowing.com/babysteps/blog/2012/04/09/rusts-object-system/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Building interactive SSH applications",
  url: "https://drewdevault.com/2019/09/02/Interactive-SSH-programs.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Intel Virtualisation: How VT-x, KVM and QEMU Work Together",
  url: "https://binarydebt.wordpress.com/2018/10/14/intel-virtualisation-how-vt-x-kvm-and-qemu-work-together/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Transpiling between any programming languages",
  url: "Part 1) — The MongoDB Engineering Journal](https://engineering.mongodb.com/post/transpiling-between-any-programming-languages-part-1"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "acdlite/react-fiber-architecture: A description of React's new core algorithm, React Fiber",
  url: "https://github.com/acdlite/react-fiber-architecture"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Bell says latest helicopter was designed 10 times faster with VR",
  url: "http://www.impactlab.net/2018/12/12/bell-says-latest-helicopter-was-designed-10-times-faster-with-vr/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Faster PostgreSQL Counting",
  url: "https://www.citusdata.com/blog/2016/10/12/count-performance/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How to Implement a Secure Central Authentication Service in Six Steps",
  url: "https://engineering.shopify.com/blogs/engineering/implement-secure-central-authentication-service-six-steps"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Questioning the Lambda Architecture",
  url: "https://www.oreilly.com/ideas/questioning-the-lambda-architecture"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Download files sequentially using URLSession inside OperationQueue",
  url: "https://fluffy.es/download-files-sequentially/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How HTTP/2 reduces Server CPU and Bandwidth",
  url: "https://medium.com/@DarkDrag0nite/how-http-2-reduces-server-cpu-and-bandwidth-10dbb8458feb"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Programmer Competency Matrix",
  url: "http://sijinjoseph.com/programmer-competency-matrix/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Untyped Programs Don’t Exist",
  url: "https://www.williamjbowman.com/blog/2018/01/19/untyped-programs-don-t-exist/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "libcpp’s implementation of std\::string",
  url: "https://joellaity.com/2020/01/31/string.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How does strace work?",
  url: "https://blog.packagecloud.io/eng/2016/02/29/how-does-strace-work/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How to do distributed locking — Martin Kleppmann’s blog",
  url: "http://martin.kleppmann.com/2016/02/08/how-to-do-distributed-locking.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Go's Tooling is an Undervalued Technology « null program",
  url: "https://nullprogram.com/blog/2020/01/21/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "WWDC19: Getting Started with Test Plan for XCTest",
  url: "https://shashikantjagtap.net/wwdc19-getting-started-with-test-plan-for-xctest/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Pixie: a system for recommending 3+ billion items to 200+ million users in real-time",
  url: "https://blog.acolyer.org/2018/05/23/pixie-a-system-for-recommending-3-billion-items-to-200-million-users-in-real-time/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "kdc-blog: Debugging War Story",
  url: "http://kdc-blog.blogspot.com/2008/03/one-day-one-of-my-co-workers-stopped-me.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Slack account takeovers using HTTP Request Smuggling | Hacker News",
  url: "https://news.ycombinator.com/item?id=22567937"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The WhatsApp Architecture Facebook Bought For $19 Billion",
  url: "http://highscalability.com/blog/2014/2/26/the-whatsapp-architecture-facebook-bought-for-19-billion.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Understanding Property Wrappers in SwiftUI",
  url: "https://mecid.github.io/2019/06/12/understanding-property-wrappers-in-swiftui/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Wifi: beamforming only begins to describe it",
  url: "https://apenwarr.ca/log/20140801"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Distributed Locks are Dead; Long Live Distributed Locks!",
  url: "https://hazelcast.com/blog/long-live-distributed-locks/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "RxSwift to Apple’s Combine “Cheat Sheet”",
  url: "https://medium.com/gett-engineering/rxswift-to-apples-combine-cheat-sheet-e9ce32b14c5b"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "You Don’t Need All That Complex/Expensive/Distracting Infrastructure",
  url: "https://blog.usejournal.com/you-dont-need-all-that-complex-expensive-distracting-infrastructure-a70dbe0dbccb"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "10 LDFLAGS I Love",
  url: "https://blog.jessfraz.com/post/top-10-favorite-ldflags/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Java: Why is processing a sorted array faster than processing an unsorted array?",
  url: "https://stackoverflow.com/questions/11227809/why-is-processing-a-sorted-array-faster-than-processing-an-unsorted-array"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The interesting ideas in Datasette",
  url: "https://simonwillison.net/2018/Oct/4/datasette-ideas/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Google vs Facebook vs Microsoft: Compare Levels and Salaries",
  url: "https://www.levels.fyi/SE/Google/Facebook/Microsoft/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Delivering billions of messages exactly once",
  url: "https://segment.com/blog/exactly-once-delivery/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Introducing Concurrent Mode",
  url: "Experimental) – React](https://reactjs.org/docs/concurrent-mode-intro.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Jepsen: Etcd 3.4.3 | Hacker News",
  url: "https://news.ycombinator.com/item?id=22191717"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Safe VSP",
  url: "http://www.linusakesson.net/scene/safevsp/index.php"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "SwiftUI by Example",
  url: "https://www.hackingwithswift.com/quick-start/swiftui/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Why you should avoid using SIGALRM for timer",
  url: "https://nativeguru.wordpress.com/2015/02/19/why-you-should-avoid-using-sigalrm-for-timer/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Errata Security: Notes on Build Hardening",
  url: "https://blog.erratasec.com/2018/12/notes-on-build-hardening.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Debugging unfamiliar code · BitFunnel",
  url: "http://bitfunnel.org/debugging-nativejit/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Overload control for scaling WeChat microservices",
  url: "https://blog.acolyer.org/2018/11/16/overload-control-for-scaling-wechat-microservices/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Finding the Four Month Bug: A debugging story",
  url: "https://www.evanjones.ca/jvm-mmap-pause-finding.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Making a toy programming language in Lua, part 1 at Play With Lua!",
  url: "http://www.playwithlua.com/?p=66"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Use DTrace to diagnose gdb issues",
  url: "https://nanxiao.me/en/use-dtrace-to-diagnose-gdb-issues/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Unwinding Uber’s Most Efficient Service",
  url: "https://medium.com/@buckhx/unwinding-uber-s-most-efficient-service-406413c5871d"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Hardest Program I've Ever Written",
  url: "http://journal.stuffwithstuff.com/2015/09/08/the-hardest-program-ive-ever-written/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How Discord Scaled Elixir to 5,000,000 Concurrent Users",
  url: "https://blog.discordapp.com/scaling-elixir-f9b8e1e7c29b"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How Does setState Know What to Do?",
  url: "https://overreacted.io/how-does-setstate-know-what-to-do/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The guide to implementing 2D platformers",
  url: "http://higherorderfun.com/blog/2012/05/20/the-guide-to-implementing-2d-platformers/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Java's new Z Garbage Collector",
  url: "ZGC) is very exciting](https://www.opsian.com/blog/javas-new-zgc-is-very-exciting/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Google Pro Tip: Use Back-of-the-envelope-calculations to Choose the Best Design",
  url: "http://highscalability.com/blog/2011/1/26/google-pro-tip-use-back-of-the-envelope-calculations-to-choo.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "SRE Case Study: Triaging a Non-Heap JVM Out of Memory Issue",
  url: "https://www.ebayinc.com/stories/blogs/tech/sre-case-study-triage-a-non-heap-jvm-out-of-memory-issue/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Shuffle Sharding: Massive and Magical Fault Isolation",
  url: "https://aws.anmazon.com/blogs/architecture/shuffle-sharding-massive-and-magical-fault-isolation/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "igushev/IgushArray",
  url: "https://github.com/igushev/IgushArray"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "What’s New in Swift 5.2 | Hacker News",
  url: "https://news.ycombinator.com/item?id=22257889"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "A Senior Engineer's CheckList",
  url: "https://littleblah.com/post/2019-09-01-senior-engineer-checklist/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "How We Built Uber Engineering’s Highest Query per Second Service Using Go",
  url: "https://eng.uber.com/go-geofence/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Understanding Consensus",
  url: "https://bravenewgeek.com/understanding-consensus/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Debugging Behind the Iron Curtain",
  url: "https://www.jakepoz.com/debugging-behind-the-iron-curtain/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Benchmarking Message Queue Latency",
  url: "https://bravenewgeek.com/benchmarking-message-queue-latency/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Columnstore and B+ tree – are hybrid physical designs important?",
  url: "https://blog.acolyer.org/2018/09/28/columnstore-and-b-tree-are-hybrid-physical-designs-important/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Bug #248619 “file incorrectly labeled as Erlang JAM file",
  url: "OOo do...” : Bugs : file package : Ubuntu](https://bugs.launchpad.net/ubuntu/+source/file/+bug/248619"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Illustrated TLS Connection: Every Byte Explained",
  url: "https://tls.ulfheim.net/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Amazon Aurora: on avoiding distributed consensus for I/Os, commits, and membership changes",
  url: "https://blog.acolyer.org/2019/03/27/amazon-aurora:-on-avoiding-distributed-consensus-for-i-os-commits-and-membership-changes/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Branch prediction",
  url: "https://danluu.com/branch-prediction/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "REPT: reverse debugging of failures in deployed software",
  url: "https://blog.acolyer.org/2018/10/17/rept-reverse-debugging-of-failures-in-deployed-software/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Knowing Where to Type ‘Zero’",
  url: "https://randomascii.wordpress.com/2015/01/19/knowing-where-to-type-zero/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "sean cassidy : Sherlock Holmes Debugging",
  url: "https://www.seancassidy.me/sherlock-holmes-debugging.html"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "The Curious Case of BEAM CPU Usage",
  url: "https://stressgrid.com/blog/beam_cpu_usage/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "On Recursive Functions",
  url: "https://deniskyashif.com/on-recursive-functions/"
}

Repo.insert! %Item {
  feed_id: dev.id,
  is_read: false,
  title: "Files are hard",
  url: "http://danluu.com/file-consistency/"
}

Repo.insert! %Item{
  title: "Reflections on Being a Female Founder",
  url: "https://tracy.posthaven.com/reflections-on-being-a-female-founder",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Circle of Competence: Avoid Ambiguity Traps",
  url: "https://models.substack.com/p/circle-of-competence-avoid-ambiguity",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Being Alone",
  url: "https://www.ankit.fyi/being-alone",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Autism severity can change substantially during early childhood, study suggests",
  url: "https://news.ycombinator.com/item?id=23370768",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Promnesia | beepb00p",
  url: "https://beepb00p.xyz/promnesia.html",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Write Libraries, Not Frameworks",
  url: "https://www.brandonsmith.ninja/blog/libraries-not-frameworks",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Teach debugging",
  url: "https://danluu.com/teach-debugging/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The Update, The Vent, and The Disaster &#8211; Rands in Repose",
  url: "https://randsinrepose.com/archives/the-update-the-vent-and-the-disaster/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The Anti-Amazon Alliance",
  url: "https://stratechery.com/2020/the-anti-amazon-alliance/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "I spent $6 Million On Google Ads Last Year - Nick Lafferty",
  url: "https://nicklafferty.com/blog/i-spent-6-million-on-google-ads-last-year-here-s-what-i-learned/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Career advice for people with bad luck",
  url: "https://chiefofstuff.substack.com/p/career-advice-for-people-with-bad",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "New Software Streams Apps to Save Space on Your Phone",
  url: "https://spectrum.ieee.org/tech-talk/computing/software/new-software-streams-apps-to-save-space-on-your-phone",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Career Moats 101",
  url: "https://commoncog.com/blog/career-moats-101/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Preventing Muscle Loss As We Age",
  url: "https://news.ycombinator.com/item?id=17967853",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The care and feeding of software engineers",
  url: "https://humanwhocodes.com/blog/2012/06/12/the-care-and-feeding-of-software-engineers-or-why-engineers-are-grumpy/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "What Really Brought Down the Boeing 737 Max?",
  url: "https://www.nytimes.com/2019/09/18/magazine/boeing-737-max-crashes.html",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Taking back Mondays and Tuesdays",
  url: "https://news.ycombinator.com/item?id=22223874",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Cloudflare’s Current Expansion Is Different",
  url: "https://www.datacenterknowledge.com/edge-computing/cloudflare-s-current-expansion-different-others",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The U.S.'s $13 Billion Aircraft Carrier Has a Toilet Problem",
  url: "https://www.popularmechanics.com/military/navy-ships/a31929628/uss-ford-toilet/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "An Intelligent, End-To-End Analytics Service for Safe Deployment in Large-Scale Cloud Infrastructure",
  url: "https://www.microsoft.com/en-us/research/publication/an-intelligent-end-to-end-analytics-service-for-safe-deployment-in-large-scale-cloud-infrastructure/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Interested in improving your relationships? Try Nonviolent Communication",
  url: "https://www.clearerthinking.org/single-post/2019/03/06/Want-to-improve-your-relationships-Try-Nonviolent-Communication-1",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "‘They Get Fired All the Time. And They Have No Idea Why.’",
  url: "https://www.institutionalinvestor.com/article/b1gq9tqwk8z108/They-Get-Fired-All-the-Time-And-They-Have-No-Idea-Why",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Elided Branches: How Do Individual Contributors Get Stuck? A Primer",
  url: "http://www.elidedbranches.com/2017/01/how-do-individual-contributors-get.html",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Credit Suisse scandal shakes Zurich’s elite",
  url: "https://www.swissinfo.ch/eng/business/-spygate-_credit-suisse-scandal-shakes-zurich-s-elite/45280086",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "How Saudi Arabia Infiltrated Twitter",
  url: "https://www.buzzfeednews.com/article/alexkantrowitz/how-saudi-arabia-infiltrated-twitter",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Is High Quality Software Worth the Cost?",
  url: "https://martinfowler.com/articles/is-quality-worth-cost.html",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "My experience as a remote worker",
  url: "https://www.joshwcomeau.com/posts/remote-work/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The Gervais Principle, Or The Office According to “The Office”",
  url: "https://www.ribbonfarm.com/2009/10/07/the-gervais-principle-or-the-office-according-to-the-office/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "I Lied When I Said We Did Everything We Could",
  url: "https://opmed.doximity.com/articles/i-lied-when-i-said-we-did-everything-we-could",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The New React Native Architecture Explained",
  url: "https://formidable.com/blog/2019/react-codegen-part-1",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Are you a robot?",
  url: "https://www.bloomberg.com/news/features/2019-03-26/the-world-s-cheapest-hospital-has-to-get-even-cheaper",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Asterix in translation: the genius of Anthea Bell and Derek Hockridge",
  url: "https://auntymuriel.com/2012/12/23/asterix-in-translation-the-genius-of-anthea-bell-and-derek-hockridge/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Made in America",
  url: "https://www.reuters.com/investigates/special-report/usa-raven-whitehouse/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Pizza Delivery is for Millionaires",
  url: "https://www.mrmoneymustache.com/2019/11/18/pizza-delivery-is-for-millionaires/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The Highest Suicide Rate in the World",
  url: "https://www.nybooks.com/articles/2019/10/10/inuit-highest-suicide-rate/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Things I Won't Work With: Dioxygen Difluoride",
  url: "https://blogs.sciencemag.org/pipeline/archives/2010/02/23/things_i_wont_work_with_dioxygen_difluoride",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Opinion: The unspoken truth about managing geeks ",
  url: "https://www.computerworld.com/article/2527153/opinion-the-unspoken-truth-about-managing-geeks.html",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "A forty year career.",
  url: "https://lethain.com/forty-year-career/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Mail team",
  url: "2000-2004) – Tech Reflect](https://techreflect.net/2019/07/01/interviewing-for-the-mail-team/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Confessions of a Reddit 'Karma Whore'",
  url: "https://www.vice.com/en_us/article/3k359n/confessions-of-a-reddit-karma-whore",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Yes! and...",
  url: "https://tomcritchlow.com/2019/11/18/yes-and/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Project Zero: A very deep dive into iOS Exploit chains found in the wild",
  url: "https://googleprojectzero.blogspot.com/2019/08/a-very-deep-dive-into-ios-exploit.html",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "How a 'NULL' License Plate Landed One Hacker in Ticket Hell",
  url: "https://www.wired.com/story/null-license-plate-landed-one-hacker-ticket-hell/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Trapped in Iran",
  url: "https://www.1843magazine.com/features/trapped-in-iran",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The Ketchup Conundrum",
  url: "https://www.newyorker.com/magazine/2004/09/06/the-ketchup-conundrum",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Don't Call Yourself A Programmer, And Other Career Advice",
  url: "https://www.kalzumeus.com/2011/10/28/dont-call-yourself-a-programmer/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The Premium Mediocre Life of Maya Millennial",
  url: "https://www.instapaper.com/read/1217180306",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Private by Default: The Hard Way, But the Right Way to Understand Mobile Experiences",
  url: "https://bionic.fullstory.com/private-by-default-mobile-analytics/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "The 2020 Election Will Be a War of Disinformation ",
  url: "https://www.theatlantic.com/magazine/archive/2020/03/the-2020-disinformation-war/605530/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Are you a robot?",
  url: "https://www.bloomberg.com/opinion/articles/2019-09-09/we-might-not-be-working",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Gears",
  url: "https://ciechanow.ski/gears/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Software disenchantment",
  url: "https://tonsky.me/blog/disenchantment/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "SQL queries don't start with SELECT",
  url: "https://jvns.ca/blog/2019/10/03/sql-queries-don-t-start-with-select/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "On Recursive Functions",
  url: "https://deniskyashif.com/2019/05/15/on-recursive-functions/",
  feed_id: non_dev.id,
  is_read: false
}

Repo.insert! %Item{
  title: "Internet Trends 2019 (Bond VC)",
  url: "https://www.bondcap.com/report/itr19/",
  feed_id: non_dev.id,
  is_read: false
}

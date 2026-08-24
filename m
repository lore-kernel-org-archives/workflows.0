Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE03A7F50
	for <workflows@vger.kernel.org>; Mon, 24 Aug 2026 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560968; cv=none; b=jeB75yqMESpnRSYoMBazo3azY3oezBC1jh0y+ufDSV8d5wz+Pv+lBWesd1ry8H7qEWh1p0qkoF77cpSErkTilwAM2ae2YtoeuxOcir5rYqWF8DLZrRIgtlSNl7ct4O5Ysb3QTIvVTonEvUuUbBv1FU2TR85PRPEn78iOC+PNYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560968; c=relaxed/simple;
	bh=QgEGaPPTJx+R5RE+xP9TstpE7wztbvQYc9ZldnDIdoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXpZOtFj/660YwhJjEdcck1XZFr6kFGzraqQsrFRxZnYdN7NyrH5iV5EczS7tofgHXbhH5sL7opcW6ovhlpphMWCckH0vnTqry/6dpdpmaxZ65bm78yqVs3BZs/82gMQF5sJyfSuQ4UDd7GEXUuFiNTZWInGf2p+7dfeAZIsE6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWtJa+6K; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWtJa+6K"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2677935a91.2
        for <workflows@vger.kernel.org>; Mon, 24 Aug 2026 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560966; x=1788165766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eAeRKHnBlP9lWidrP7J/CSu2h6liulqNUM65GJ4pK+8=;
        b=eWtJa+6KdopmSfna1qmieEaJyTtn0SQqIVQzWpvl97gNSt0p0AM3LuunfYLlhFUYVV
         57e+IBEJ/QODetZIeGhRPkclrx6v+PcU0LfCPZQoP7SxJjZP92sCU0ECuRiYJ3vbgf24
         TIGDAziEKGA5/avcuOxASFb1FQm8Q2HzEYa/OzoZ4Z2iQg+FBIHV/4Fnn3kbf07QvxQI
         9NsCD625lVrYdYJaROSZ6y0GkIjxRhY0y86WoiJR8k2ryox5cd+xWMiAkawzRymkQ04s
         qaJtUvoF3Vf21NdRAeXaBrCBh0pzovg1fV9cvHxQGDt5s7sjZ3G30eJzh5Ij1czCz34M
         mgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560966; x=1788165766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAeRKHnBlP9lWidrP7J/CSu2h6liulqNUM65GJ4pK+8=;
        b=s4b9oW83vBCLHreV3/+hiHTkc1DOxFd8rYO4SAvMF+w+FuW71SNhxw19g/JnRFw3uF
         WJyrO1J55l74dXMtG1SRqKLSakO6dlYQmN6x2pLuFda+lDNUlrOMkJ2pK/U7eqIvtXCu
         b3FCjU+EhOJ8rZvN7GQ7HWo94rJ5W1VmqVgZHIW7F9L3nwtslR8YdBHB+P6HfcwrUWOJ
         PEmMbI3y6UF9FxT3ja6vubpU5pVmQvTyfgkA0V+/Gt3JPTapj9ocB+CJE2fszQMxy8WH
         +963Fmb5JASI6BXTlhbhLd9QtPWOdhk6Mn4SNQ58e20HJRdnJxq2K/Glq4vX3DuF0D0h
         OQgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwP1bwq+eFJdaV+iCW1vQTUn/O0OgMoacEDceJEHvdhAJz9l3jWfTJlfmDj8geX095Il69F8pZEvw=@vger.kernel.org
X-Gm-Message-State: AFuF++lfXDAM1goJp1DcRg8kohvttX/0VbhYsI31d3ByEbAaIn+0jpwj
	v/U+F5pFqgbljz+AT3V7qSl6mHMKOncUH/2lVf3yf2ongk34D14VOEoR
X-Gm-Gg: AR+sD10RXfLxfi1LpoIGHTzJoLRHmMrWSeSvjRpwJFPyuw6An3FyjNjz4poOMAMjg4i
	qOl3ruwRJoKNhn68l2T1rWKdevbDzXl767kfqRIAn4F3hWElpC/seN87SV8f9nmDTzNib1kcVES
	EkJFMgBpEnB1kRcLLWOWNlaa4HGpCBVthZKd7touxgDvME9D32Iph9p6iCoBhYsbhjGt2X9zeNL
	RmujMsVL6pEmPJ6TCwODDGlCpG1wiaD5+HxgXAmmVKUI+al/rHsTFQ3em0L/OwyK+24D8Xn7WWE
	4bSsSWoL5GGXNQ5zvTk68LyG6VQPsCUA0V1N12AcIsI/b2qYhETKgtYR6Q7OhklQY2eP9HNXlFz
	Cj1jtwPagjBMzzAs8u+V3eaDEL6z+Ry37oe8XfowPvuTGVCi+eZ3LATKzpkemrccNW3x4uqqgq4
	BYImdWgsiFG07zp8879KleogfJ2UQj68yIzvk36ZMkJkymb5O2z4Imi4fi6xe1lUyWuZ+FIcQ62
	A7NVP7SKOisxgiLoST8bPG8OG/fhijc2PyMHlx8bq8=
X-Received: by 2002:a17:90b:4a81:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-395c33ec558mr41085817a91.7.1787560965195;
        Mon, 24 Aug 2026 01:42:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:ee0:505b:c770:709a:9e9a:e679:fe1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f920e0ddsm22547799eec.24.2026.08.24.01.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:42:44 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH] Documentation : process : Capitalize Git, Quilt, and Mercurial consistently
Date: Mon, 24 Aug 2026 15:42:35 +0700
Message-ID: <20260824084235.9396-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update various process documentation files to properly capitalize "Git",
"Quilt", and "Mercurial" as proper nouns when referring to the source
management tools themselves.

Instances explicitly referring to literal command-line invocations
(such as "git log" or "git bisect") have been left lowercase.

Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
---
 Documentation/process/1.Intro.rst             |  2 +-
 Documentation/process/2.Process.rst           | 18 ++++-----
 Documentation/process/3.Early-stage.rst       |  2 +-
 Documentation/process/5.Posting.rst           | 10 ++---
 Documentation/process/7.AdvancedTopics.rst    | 36 +++++++++---------
 Documentation/process/backporting.rst         | 18 ++++-----
 .../process/embargoed-hardware-issues.rst     |  2 +-
 .../process/maintainer-pgp-guide.rst          | 38 +++++++++----------
 Documentation/process/submitting-patches.rst  |  4 +-
 9 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/Documentation/process/1.Intro.rst b/Documentation/process/1.Intro.rst
index 2c93caea0..847fbe76b 100644
--- a/Documentation/process/1.Intro.rst
+++ b/Documentation/process/1.Intro.rst
@@ -42,7 +42,7 @@ avoid problems at this important stage.  Developers are cautioned against
 assuming that the job is done when a patch is merged into the mainline.
 
 :ref:`development_advancedtopics` introduces a couple of "advanced" topics:
-managing patches with git and reviewing patches posted by others.
+managing patches with Git and reviewing patches posted by others.
 
 :ref:`development_conclusion` concludes the document with pointers to sources
 for more information on kernel development.
diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index 77f3f80e7..d09fa23d6 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -223,8 +223,8 @@ of the kernel they manage; they are the ones who will (usually) accept a
 patch for inclusion into the mainline kernel.
 
 Subsystem maintainers each manage their own version of the kernel source
-tree, usually (but certainly not always) using the git source management
-tool.  Tools like git (and related tools like quilt or mercurial) allow
+tree, usually (but certainly not always) using the Git source management
+tool.  Tools like Git (and related tools like Quilt or Mercurial) allow
 maintainers to track a list of patches, including authorship information
 and other metadata.  At any given time, the maintainer can identify which
 patches in his or her repository are not found in the mainline.
@@ -343,13 +343,13 @@ are well beyond the scope of this document, but there is space for a few
 pointers.
 
 By far the dominant source code management system used by the kernel
-community is git.  Git is one of a number of distributed version control
+community is Git.  Git is one of a number of distributed version control
 systems being developed in the free software community.  It is well tuned
 for kernel development, in that it performs quite well when dealing with
 large repositories and large numbers of patches.  It also has a reputation
 for being difficult to learn and use, though it has gotten better over
-time.  Some sort of familiarity with git is almost a requirement for kernel
-developers; even if they do not use it for their own work, they'll need git
+time.  Some sort of familiarity with Git is almost a requirement for kernel
+developers; even if they do not use it for their own work, they'll need Git
 to keep up with what other developers (and the mainline) are doing.
 
 Git is now packaged by almost all Linux distributions.  There is a home
@@ -359,12 +359,12 @@ page at:
 
 That page has pointers to documentation and tutorials.
 
-Among the kernel developers who do not use git, the most popular choice is
+Among the kernel developers who do not use Git, the most popular choice is
 almost certainly Mercurial:
 
 	https://www.selenic.com/mercurial/
 
-Mercurial shares many features with git, but it provides an interface which
+Mercurial shares many features with Git, but it provides an interface which
 many find easier to use.
 
 The other tool worth knowing about is Quilt:
@@ -374,9 +374,9 @@ The other tool worth knowing about is Quilt:
 Quilt is a patch management system, rather than a source code management
 system.  It does not track history over time; it is, instead, oriented
 toward tracking a specific set of changes against an evolving code base.
-Some major subsystem maintainers use quilt to manage patches intended to go
+Some major subsystem maintainers use Quilt to manage patches intended to go
 upstream.  For the management of certain kinds of trees (-mm, for example),
-quilt is the best tool for the job.
+Quilt is the best tool for the job.
 
 
 Mailing lists
diff --git a/Documentation/process/3.Early-stage.rst b/Documentation/process/3.Early-stage.rst
index 894a92004..87fa7875e 100644
--- a/Documentation/process/3.Early-stage.rst
+++ b/Documentation/process/3.Early-stage.rst
@@ -138,7 +138,7 @@ the place to start.  That file tends to not always be up to date, though,
 and not all subsystems are represented there.  The person listed in the
 MAINTAINERS file may, in fact, not be the person who is actually acting in
 that role currently.  So, when there is doubt about who to contact, a
-useful trick is to use git (and "git log" in particular) to see who is
+useful trick is to use Git (and "git log" in particular) to see who is
 currently active within the subsystem of interest.  Look at who is writing
 patches, and who, if anybody, is attaching Signed-off-by lines to those
 patches.  Those are the people who will be best placed to help with a new
diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 07d7dbed1..b8a449980 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -21,7 +21,7 @@ There is a constant temptation to avoid posting patches before they are
 completely "ready."  For simple patches, that is not a problem.  If the
 work being done is complex, though, there is a lot to be gained by getting
 feedback from the community before the work is complete.  So you should
-consider posting in-progress work, or even making a git tree available so
+consider posting in-progress work, or even making a Git tree available so
 that interested developers can catch up with your work at any time.
 
 When posting code which is not yet considered ready for inclusion, it is a
@@ -71,7 +71,7 @@ even in the short term.
 
 Patches must be prepared against a specific version of the kernel.  As a
 general rule, a patch should be based on the current mainline as found in
-Linus's git tree.  When basing on mainline, start with a well-known release
+Linus's Git tree.  When basing on mainline, start with a well-known release
 point - a stable or -rc release - rather than branching off the mainline at
 an arbitrary spot.
 
@@ -320,7 +320,7 @@ copies should go to:
    the MAINTAINERS file is the first place to look for these people.
 
  - Other developers who have been working in the same area - especially
-   those who might be working there now.  Using git to see who else has
+   those who might be working there now.  Using Git to see who else has
    modified the files you are working on can be helpful.
 
  - If you are responding to a bug report or a feature request, copy the
@@ -362,7 +362,7 @@ that the patches, themselves, have complete changelog information.
 
 In general, the second and following parts of a multi-part patch should be
 sent as a reply to the first part so that they all thread together at the
-receiving end.  Tools like git and quilt have commands to mail out a set of
+receiving end.  Tools like Git and Quilt have commands to mail out a set of
 patches with the proper threading.  If you have a long series, though, and
-are using git, please stay away from the --chain-reply-to option to avoid
+are using Git, please stay away from the --chain-reply-to option to avoid
 creating exceptionally deep nesting.
diff --git a/Documentation/process/7.AdvancedTopics.rst b/Documentation/process/7.AdvancedTopics.rst
index 185651d87..066655e5d 100644
--- a/Documentation/process/7.AdvancedTopics.rst
+++ b/Documentation/process/7.AdvancedTopics.rst
@@ -8,7 +8,7 @@ works.  There is still more to learn, however!  This section will cover a
 number of topics which can be helpful for developers wanting to become a
 regular part of the Linux kernel development process.
 
-Managing patches with git
+Managing patches with Git
 -------------------------
 
 The use of distributed version control for the kernel began in early 2002,
@@ -17,17 +17,17 @@ application.  While BitKeeper was controversial, the approach to software
 version management it embodied most certainly was not.  Distributed version
 control enabled an immediate acceleration of the kernel development
 project.  In current times, there are several free alternatives to
-BitKeeper.  For better or for worse, the kernel project has settled on git
+BitKeeper.  For better or for worse, the kernel project has settled on Git
 as its tool of choice.
 
-Managing patches with git can make life much easier for the developer,
+Managing patches with Git can make life much easier for the developer,
 especially as the volume of those patches grows.  Git also has its rough
 edges and poses certain hazards; it is a young and powerful tool which is
 still being civilized by its developers.  This document will not attempt to
-teach the reader how to use git; that would be sufficient material for a
-long document in its own right.  Instead, the focus here will be on how git
+teach the reader how to use Git; that would be sufficient material for a
+long document in its own right.  Instead, the focus here will be on how Git
 fits into the kernel development process in particular.  Developers who
-wish to come up to speed with git will find more information at:
+wish to come up to speed with Git will find more information at:
 
 	https://git-scm.com/
 
@@ -36,20 +36,20 @@ wish to come up to speed with git will find more information at:
 and on various tutorials found on the web.
 
 The first order of business is to read the above sites and get a solid
-understanding of how git works before trying to use it to make patches
+understanding of how Git works before trying to use it to make patches
 available to others.  A git-using developer should be able to obtain a copy
 of the mainline repository, explore the revision history, commit changes to
-the tree, use branches, etc.  An understanding of git's tools for the
+the tree, use branches, etc.  An understanding of Git's tools for the
 rewriting of history (such as rebase) is also useful.  Git comes with its
-own terminology and concepts; a new user of git should know about refs,
+own terminology and concepts; a new user of Git should know about refs,
 remote branches, the index, fast-forward merges, pushes and pulls, detached
 heads, etc.  It can all be a little intimidating at the outset, but the
 concepts are not that hard to grasp with a bit of study.
 
-Using git to generate patches for submission by email can be a good
+Using Git to generate patches for submission by email can be a good
 exercise while coming up to speed.
 
-When you are ready to start putting up git trees for others to look at, you
+When you are ready to start putting up Git trees for others to look at, you
 will, of course, need a server that can be pulled from.  Setting up such a
 server with git-daemon is relatively straightforward if you have a system
 which is accessible to the Internet.  Otherwise, free, public hosting sites
@@ -57,9 +57,9 @@ which is accessible to the Internet.  Otherwise, free, public hosting sites
 developers can get an account on kernel.org, but those are not easy to come
 by; see https://kernel.org/faq/ for more information.
 
-The normal git workflow involves the use of a lot of branches.  Each line
+The normal Git workflow involves the use of a lot of branches.  Each line
 of development can be separated into a separate "topic branch" and
-maintained independently.  Branches in git are cheap, there is no reason to
+maintained independently.  Branches in Git are cheap, there is no reason to
 not make free use of them.  And, in any case, you should not do your
 development in any branch which you intend to ask others to pull from.
 Publicly-available branches should be created with care; merge in patches
@@ -72,7 +72,7 @@ say, or which has some other sort of obvious bug) can be fixed in place or
 made to disappear from the history entirely.  A patch series can be
 rewritten as if it had been written on top of today's mainline, even though
 you have been working on it for months.  Changes can be transparently
-shifted from one branch to another.  And so on.  Judicious use of git's
+shifted from one branch to another.  And so on.  Judicious use of Git's
 ability to revise history can help in the creation of clean patch sets with
 fewer problems.
 
@@ -111,16 +111,16 @@ perform test merges in a private branch.  The git "rerere" tool can be
 useful in such situations; it remembers how merge conflicts were resolved
 so that you don't have to do the same work twice.
 
-One of the biggest recurring complaints about tools like git is this: the
+One of the biggest recurring complaints about tools like Git is this: the
 mass movement of patches from one repository to another makes it easy to
 slip in ill-advised changes which go into the mainline below the review
 radar.  Kernel developers tend to get unhappy when they see that kind of
-thing happening; putting up a git tree with unreviewed or off-topic patches
+thing happening; putting up a Git tree with unreviewed or off-topic patches
 can affect your ability to get trees pulled in the future.  Quoting Linus:
 
 ::
 
-	You can send me patches, but for me to pull a git patch from you, I
+	You can send me patches, but for me to pull a Git patch from you, I
 	need to know that you know what you're doing, and I need to be able
 	to trust things *without* then having to go and check every
 	individual change by hand.
@@ -130,7 +130,7 @@ can affect your ability to get trees pulled in the future.  Quoting Linus:
 To avoid this kind of situation, ensure that all patches within a given
 branch stick closely to the associated topic; a "driver fixes" branch
 should not be making changes to the core memory management code.  And, most
-importantly, do not use a git tree to bypass the review process.  Post an
+importantly, do not use a Git tree to bypass the review process.  Post an
 occasional summary of the tree to the relevant list, and, when the time is
 right, request that the tree be included in linux-next.
 
diff --git a/Documentation/process/backporting.rst b/Documentation/process/backporting.rst
index 0de9eacd4..abc5f8925 100644
--- a/Documentation/process/backporting.rst
+++ b/Documentation/process/backporting.rst
@@ -40,8 +40,8 @@ edit the patch to make it apply.
 
 It is strongly recommended to instead find an appropriate base version
 where the patch applies cleanly and *then* cherry-pick it over to your
-destination tree, as this will make git output conflict markers and let
-you resolve conflicts with the help of git and any other conflict
+destination tree, as this will make Git output conflict markers and let
+you resolve conflicts with the help of Git and any other conflict
 resolution tools you might prefer to use. For example, if you want to
 apply a patch that just arrived on LKML to an older stable kernel, you
 can apply it to the most recent mainline kernel and then cherry-pick it
@@ -54,7 +54,7 @@ problem with applying the patch to the "wrong" base is that it may pull
 in more unrelated changes in the context of the diff when cherry-picking
 it to the older branch.
 
-A good reason to prefer ``git cherry-pick`` over ``git am`` is that git
+A good reason to prefer ``git cherry-pick`` over ``git am`` is that Git
 knows the precise history of an existing commit, so it will know when
 code has moved around and changed the line numbers; this in turn makes
 it less likely to apply the patch to the wrong place (which can result
@@ -69,7 +69,7 @@ article will assume that you are doing a plain ``git cherry-pick``.
 .. _b4: https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation
 .. _b4 presentation: https://youtu.be/mF10hgVIx9o?t=2996
 
-Once you have the patch in git, you can go ahead and cherry-pick it into
+Once you have the patch in Git, you can go ahead and cherry-pick it into
 your source tree. Don't forget to cherry-pick with ``-x`` if you want a
 written record of where the patch came from!
 
@@ -101,7 +101,7 @@ backporting from contains patches not in the branch you are backporting
 to. However, the reverse is also possible. In any case, the result is a
 conflict that needs to be resolved.
 
-If your attempted cherry-pick fails with a conflict, git automatically
+If your attempted cherry-pick fails with a conflict, Git automatically
 edits the files to include so-called conflict markers showing you where
 the conflict is and how the two branches have diverged. Resolving the
 conflict typically means editing the end result in such a way that it
@@ -128,7 +128,7 @@ pointers to various tools that you could use:
 -  `IntelliJ <https://www.jetbrains.com/help/idea/resolve-conflicts.html>`__
 -  `VSCode <https://code.visualstudio.com/docs/editor/versioncontrol>`__
 
-To configure git to work with these, see ``git mergetool --help`` or
+To configure Git to work with these, see ``git mergetool --help`` or
 the official `git-mergetool documentation`_.
 
 .. _git-mergetool documentation: https://git-scm.com/docs/git-mergetool
@@ -326,7 +326,7 @@ style, which looks like this::
     this is what the patch wants it to be after being applied
     >>>>>>> <commit> (title)
 
-As you can see, this has 3 parts instead of 2, and includes what git
+As you can see, this has 3 parts instead of 2, and includes what Git
 expected to find there but didn't. It is *highly recommended* to use
 this conflict style as it makes it much clearer what the patch actually
 changed; i.e., it allows you to compare the before-and-after versions
@@ -382,7 +382,7 @@ Dealing with file renames
 
 One of the most annoying things that can happen while backporting a
 patch is discovering that one of the files being patched has been
-renamed, as that typically means git won't even put in conflict markers,
+renamed, as that typically means Git won't even put in conflict markers,
 but will just throw up its hands and say (paraphrased): "Unmerged path!
 You do the work..."
 
@@ -393,7 +393,7 @@ other hand, if the change is big or complicated, you definitely don't
 want to do it by hand.
 
 As a first pass, you can try something like this, which will lower the
-rename detection threshold to 30% (by default, git uses 50%, meaning
+rename detection threshold to 30% (by default, Git uses 50%, meaning
 that two files need to have at least 50% in common for it to consider
 an add-delete pair to be a potential rename)::
 
diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index d07f16c3c..2c244a6d1 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -187,7 +187,7 @@ security issues in the past.
 
 The mailing list operates in the same way as normal Linux development.
 Patches are posted, discussed, and reviewed and if agreed upon, applied to
-a non-public git repository which is only accessible to the participating
+a non-public Git repository which is only accessible to the participating
 developers via a secure connection. The repository contains the main
 development branch against the mainline kernel and backport branches for
 stable kernel versions as necessary.
diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
index 652dfbe64..9f6fff2a7 100644
--- a/Documentation/process/maintainer-pgp-guide.rst
+++ b/Documentation/process/maintainer-pgp-guide.rst
@@ -25,16 +25,16 @@ communication channels between developers via PGP-signed email exchange.
 
 The Linux kernel source code is available in two main formats:
 
-- Distributed source repositories (git)
+- Distributed source repositories (Git)
 - Periodic release snapshots (tarballs)
 
-Both git repositories and tarballs carry PGP signatures of the kernel
+Both Git repositories and tarballs carry PGP signatures of the kernel
 developers who create official kernel releases. These signatures offer a
 cryptographic guarantee that downloadable versions made available via
 kernel.org or any other mirrors are identical to what these developers
 have on their workstations. To this end:
 
-- git repositories provide PGP signatures on all tags
+- Git repositories provide PGP signatures on all tags
 - tarballs provide detached PGP signatures with all downloads
 
 .. _devs_not_infra:
@@ -660,12 +660,12 @@ impersonate you without having access to your PGP keys.
 
 .. _`nothing to do with it`: https://github.com/jayphelps/git-blame-someone-else
 
-Configure git to use your PGP key
+Configure Git to use your PGP key
 ---------------------------------
 
 If you only have one secret key in your keyring, then you don't really
 need to do anything extra, as it becomes your default key.  However, if
-you happen to have multiple secret keys, you can tell git which key
+you happen to have multiple secret keys, you can tell Git which key
 should be used (``[fpr]`` is the fingerprint of your key)::
 
     $ git config --global user.signingKey [fpr]
@@ -677,8 +677,8 @@ To create a signed tag, pass the ``-s`` switch to the tag command::
 
     $ git tag -s [tagname]
 
-Our recommendation is to always sign git tags, as this allows other
-developers to ensure that the git repository they are pulling from has
+Our recommendation is to always sign Git tags, as this allows other
+developers to ensure that the Git repository they are pulling from has
 not been maliciously altered.
 
 How to verify signed tags
@@ -689,7 +689,7 @@ To verify a signed tag, use the ``verify-tag`` command::
     $ git verify-tag [tagname]
 
 If you are pulling a tag from another fork of the project repository,
-git should automatically verify the signature at the tip you're pulling
+Git should automatically verify the signature at the tip you're pulling
 and show you the results during the merge operation::
 
     $ git pull [url] tags/sometag
@@ -703,15 +703,15 @@ The merge message will contain something like this::
     # gpg: Signature made [...]
     # gpg: Good signature from [...]
 
-If you are verifying someone else's git tag, you will first need to
+If you are verifying someone else's Git tag, you will first need to
 import their PGP key. Please refer to the ":ref:`verify_identities`"
 section below.
 
-Configure git to always sign annotated tags
+Configure Git to always sign annotated tags
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Chances are, if you're creating an annotated tag, you'll want to sign
-it. To force git to always sign annotated tags, you can set a global
+it. To force Git to always sign annotated tags, you can set a global
 configuration option::
 
     $ git config --global tag.forceSignAnnotated true
@@ -722,15 +722,15 @@ How to work with signed commits
 It is also possible to create signed commits, but they have limited
 usefulness in Linux kernel development. The kernel contribution workflow
 relies on sending in patches, and converting commits to patches does not
-preserve git commit signatures. Furthermore, when rebasing your own
+preserve Git commit signatures. Furthermore, when rebasing your own
 repository on a newer upstream, PGP commit signatures will end up
 discarded. For this reason, most kernel developers don't bother signing
 their commits and will ignore signed commits in any external
 repositories that they rely upon in their work.
 
-That said, if you have your working git tree publicly available at some
-git hosting service (kernel.org, infradead.org, ozlabs.org, or others),
-then the recommendation is that you sign all your git commits even if
+That said, if you have your working Git tree publicly available at some
+Git hosting service (kernel.org, infradead.org, ozlabs.org, or others),
+then the recommendation is that you sign all your Git commits even if
 upstream developers do not directly benefit from this practice.
 
 We recommend this for the following reasons:
@@ -752,10 +752,10 @@ command (it's capital ``-S`` due to collision with another flag)::
 
     $ git commit -S
 
-Configure git to always sign commits
+Configure Git to always sign commits
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-You can tell git to always sign commits::
+You can tell Git to always sign commits::
 
     git config --global commit.gpgSign true
 
@@ -790,7 +790,7 @@ Installing and configuring patatt
 Patatt is packaged for many distributions already, so please check there
 first. You can also install it from pypi using "``pip install patatt``".
 
-If you already have your PGP key configured with git (via the
+If you already have your PGP key configured with Git (via the
 ``user.signingKey`` configuration parameter), then patatt requires no
 further configuration. You can start signing your patches by installing
 the git-send-email hook in the repository you want::
@@ -902,7 +902,7 @@ the new default in GnuPG v2). To set it, add (or modify) the
 Using the kernel.org web of trust repository
 --------------------------------------------
 
-Kernel.org maintains a git repository with developers' public keys as a
+Kernel.org maintains a Git repository with developers' public keys as a
 replacement for replicating keyserver networks that have gone mostly
 dark in the past few years. The full documentation for how to set up
 that repository as your source of public keys can be found here:
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e..b6ca49437 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -866,7 +866,7 @@ automatically include the base tree information in your submission by
 using the ``--base`` flag. The easiest and most convenient way to use
 this option is with topical branches::
 
-    $ git checkout -t -b my-topical-branch master
+    $ git switch -t -c my-topical-branch master
     Branch 'my-topical-branch' set up to track local branch 'master'.
     Switched to a new branch 'my-topical-branch'
 
@@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
 bottom, which provides the reviewer and the CI tools enough information
 to properly perform ``git am`` without worrying about conflicts::
 
-    $ git checkout -b patch-review [base-commit-id]
+    $ git switch -c patch-review [base-commit-id]
     Switched to a new branch 'patch-review'
     $ git am patches.mbox
     Applying: First Commit
-- 
2.50.1 (Apple Git-155)


Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B2FEB64DA
	for <workflows@archiver.kernel.org>; Fri, 30 Jun 2023 17:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbjF3RP5 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 30 Jun 2023 13:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjF3RP4 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 30 Jun 2023 13:15:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885FF3A87;
        Fri, 30 Jun 2023 10:15:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 25EEB617BA;
        Fri, 30 Jun 2023 17:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CBFC433C0;
        Fri, 30 Jun 2023 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688145354;
        bh=qjAkQlk0grh8g6j2pZFdg8iuaZeUvVf8cZy2IQwiuY8=;
        h=From:To:Cc:Subject:Date:From;
        b=Zuj04Mw/uPgVzE+6CmYa3NPWZx2YYAgSntR2DG/cIDDWGFXhyATcAFhlCvwR69fM4
         7uiSn6kbty8V+fPBKb9wEPBV+dgY3Bjh+ID/+1bZOuwEESzPQMqCjLWDSDZKDbEv/A
         795MPIrCaQmCKWYxO7nXx5FS5y6TF1Klz28MqZlMyQ4KNPjfpFVkGdQ8v0xGcqwGsQ
         XFbLD5e7jZ2mkJ+kw9XijoKs261CHFAIUjdPlxCbf0KZqf/ucTYsvt3O+/QhG3snz8
         CewNG8BgKGak5htgeCvOaIKvTbRM+G55GDuEHKXqujagkWvCpeeumPlEx+oLtXLl8K
         obZRo26LNJrAQ==
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH docs] docs: remove the tips on how to submit patches from MAINTAINERS
Date:   Fri, 30 Jun 2023 10:15:50 -0700
Message-ID: <20230630171550.128296-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Having "how to submit patches" in MAINTAINTERS seems out of place.
We have a whole section of documentation about it, duplication
is harmful and a lot of the text looks really out of date.

Sections 1, 2 and 4 look really, really old and not applicable
to the modern process.

Section 3 is obvious but also we have build bots now.

Section 5 is a bit outdated (diff -u?!). But I like the part
about factoring out shared code, so add that to process docs.

Section 6 is unnecessary?

Section 7 is covered by more appropriate docs.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 Documentation/process/6.Followthrough.rst |  7 ++
 MAINTAINERS                               | 80 +----------------------
 2 files changed, 9 insertions(+), 78 deletions(-)

diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
index a173cd5f93d2..66fa400c6d94 100644
--- a/Documentation/process/6.Followthrough.rst
+++ b/Documentation/process/6.Followthrough.rst
@@ -51,6 +51,13 @@ process.  Life can be made much easier, though, if you keep a few things in
    working toward the creation of the best kernel they can; they are not
    trying to create discomfort for their employers' competitors.
 
+ - Be prepared for seemingly silly requests for coding style changes
+   and requests to factor out some of your code to shared parts of
+   the kernel. One job the maintainers do is to keep things looking
+   the same. Sometimes this means that the clever hack in your driver
+   to get around a problem actually needs to become a generalized
+   kernel feature ready for next time.
+
 What all of this comes down to is that, when reviewers send you comments,
 you need to pay attention to the technical observations that they are
 making.  Do not let their form of expression or your own pride keep that
diff --git a/MAINTAINERS b/MAINTAINERS
index e0976ae2a523..abc6f01377e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1,81 +1,5 @@
-List of maintainers and how to submit kernel changes
-====================================================
-
-Please try to follow the guidelines below.  This will make things
-easier on the maintainers.  Not all of these guidelines matter for every
-trivial patch so apply some common sense.
-
-Tips for patch submitters
--------------------------
-
-1.	Always *test* your changes, however small, on at least 4 or
-	5 people, preferably many more.
-
-2.	Try to release a few ALPHA test versions to the net. Announce
-	them onto the kernel channel and await results. This is especially
-	important for device drivers, because often that's the only way
-	you will find things like the fact version 3 firmware needs
-	a magic fix you didn't know about, or some clown changed the
-	chips on a board and not its name.  (Don't laugh!  Look at the
-	SMC etherpower for that.)
-
-3.	Make sure your changes compile correctly in multiple
-	configurations. In particular check that changes work both as a
-	module and built into the kernel.
-
-4.	When you are happy with a change make it generally available for
-	testing and await feedback.
-
-5.	Make a patch available to the relevant maintainer in the list. Use
-	``diff -u`` to make the patch easy to merge. Be prepared to get your
-	changes sent back with seemingly silly requests about formatting
-	and variable names.  These aren't as silly as they seem. One
-	job the maintainers (and especially Linus) do is to keep things
-	looking the same. Sometimes this means that the clever hack in
-	your driver to get around a problem actually needs to become a
-	generalized kernel feature ready for next time.
-
-	PLEASE check your patch with the automated style checker
-	(scripts/checkpatch.pl) to catch trivial style violations.
-	See Documentation/process/coding-style.rst for guidance here.
-
-	PLEASE CC: the maintainers and mailing lists that are generated
-	by ``scripts/get_maintainer.pl.`` The results returned by the
-	script will be best if you have git installed and are making
-	your changes in a branch derived from Linus' latest git tree.
-	See Documentation/process/submitting-patches.rst for details.
-
-	PLEASE try to include any credit lines you want added with the
-	patch. It avoids people being missed off by mistake and makes
-	it easier to know who wants adding and who doesn't.
-
-	PLEASE document known bugs. If it doesn't work for everything
-	or does something very odd once a month document it.
-
-	PLEASE remember that submissions must be made under the terms
-	of the Linux Foundation certificate of contribution and should
-	include a Signed-off-by: line.  The current version of this
-	"Developer's Certificate of Origin" (DCO) is listed in the file
-	Documentation/process/submitting-patches.rst.
-
-6.	Make sure you have the right to send any changes you make. If you
-	do changes at work you may find your employer owns the patch
-	not you.
-
-7.	When sending security related changes or reports to a maintainer
-	please Cc: security@kernel.org, especially if the maintainer
-	does not respond. Please keep in mind that the security team is
-	a small set of people who can be efficient only when working on
-	verified bugs. Please only Cc: this list when you have identified
-	that the bug would present a short-term risk to other users if it
-	were publicly disclosed. For example, reports of address leaks do
-	not represent an immediate threat and are better handled publicly,
-	and ideally, should come with a patch proposal. Please do not send
-	automated reports to this list either. Such bugs will be handled
-	better and faster in the usual public places. See
-	Documentation/process/security-bugs.rst for details.
-
-8.	Happy hacking.
+List of maintainers
+===================
 
 Descriptions of section entries and preferred order
 ---------------------------------------------------
-- 
2.41.0

